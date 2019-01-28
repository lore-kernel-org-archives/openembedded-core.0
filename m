Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 49E8E7C5BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s5-v6so15489824ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9mFTVU/bp92HJRySXNmTngIy8C1P0wByDZAeBpvPsYY=;
	b=K+OndWVMRBSOHT6Qax3PlAZAjUIZYQmc70tU8OglYnCWRdi7roKEgDcivWblZF0ENw
	46V9nTwGJz+EJAOgh+ARx+bU66AGQspHwb1zKHaOErjJJrgBhygAS02ljJB/4KAQ0sDZ
	8N953Snj75yCFvJO4xKzk3odcJvy/mwUBDFMAy/DG6BCFNJoaIOM0uV1FC45XXRRcPZW
	6WHHVr1sGQUPc0WVjjzFKFxnJrvps4rtpPwvNhZrv58VpG6gE0qvaiDk5f/MWTGVp4tF
	CAJgtYaY8b37uRql0Y2nzEykfgMP1JrlOUFZZWLnK8m/QRKlnwJfnwerBkMdyY/6rOz3
	rZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9mFTVU/bp92HJRySXNmTngIy8C1P0wByDZAeBpvPsYY=;
	b=poRGbGprIGQaVVIO0xk5tLinACtEmwELuAZO23ke60uF/SvIZbvef7USBm937qjjUK
	0SHKxfOgqpJLqmNrdFG7qEWFJbGiAehgdwwAAfVusVAkQU90NSJ/knXNCCUoJxlaPPtt
	xk33bj5TbUOgxxxXE1UraAMeUcr7O9ZeHoigp5ovGI3JrAxDHzElMHD/+3sNua/evTgJ
	xIGbTxMgn+gM8epzRfsv2SXuR4YVMmo2xAvnaI80hV6XmZmzdN0eENRzMOrL/k45T37d
	c0CX9o0BEK6h8SC65ZYcwhBEUwJx/SNjfG1diNZmBXAgYhsN6SfpSO9D2EU7h7fK/JG1
	kHYA==
X-Gm-Message-State: AJcUukf7AKdMnV2GPEXFn+h4VGJY640bur3vkT5LfJr7db4cyky1qJjd
	j6jAbNEsXfaO1cVXbkH+e49yH2BngO8=
X-Google-Smtp-Source: AHgI3Ibx35F9khUggnaqHb3lUCNleb2mr/vaWnMTCymufA9u5ONROygCBWpC4sUQ766Zg/bm9ruUDQ==
X-Received: by 2002:a2e:1f01:: with SMTP id
	f1-v6mr13145590ljf.129.1548709136585; 
	Mon, 28 Jan 2019 12:58:56 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:55 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:46 +0100
Message-Id: <20190128205848.12834-5-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 4/6] systemd: create preset files instead of installing in image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 20:58:56 -0000
Content-Transfer-Encoding: 8bit

At first boot, systemd will create the /etc/systemd/system directory
from service preset files.  As such, for a normal, writable /etc
(writable rootfs), there is no need to set up this directory at image
creation time.

This patch changes the systemd machinery to create preset files and to
rely on systemd to do the service enablement.

This breaks the read-only-rootfs case; there's a fix for this in a
follow-up patch.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/classes/systemd.bbclass | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c8f4fdec88..403d2108df 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -16,43 +16,32 @@ python __anonymous() {
     # from doing any work so that pure-systemd images don't have redundant init
     # files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        d.appendVar("DEPENDS", " systemd-systemctl-native")
-        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
         if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
             d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
-OPTS=""
-
 if [ -n "$D" ]; then
-    OPTS="--root=$D"
+	exit 0
 fi
 
 if type systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
-		systemctl daemon-reload
-	fi
-
-	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE_ESCAPED}
+	systemctl daemon-reload
+	systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
 
-	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 fi
 }
 
 systemd_prerm() {
-OPTS=""
-
 if [ -n "$D" ]; then
-    OPTS="--root=$D"
+	exit 0
 fi
 
 if type systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
-	fi
+	systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 
 	systemctl $OPTS disable ${SYSTEMD_SERVICE_ESCAPED}
 fi
@@ -177,12 +166,22 @@ python systemd_populate_packages() {
                 else:
                     bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
 
+    def systemd_create_presets(pkg):
+        action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
+        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
+        bb.utils.mkdirhier(os.path.dirname(presetf))
+        with open(presetf, 'a') as fd:
+            for service in d.getVar('SYSTEMD_SERVICE_%s' % pkg).split():
+                fd.write("%s %s\n" % (action,service))
+        d.appendVar("FILES_%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg))
+
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D")):
         for pkg in d.getVar('SYSTEMD_PACKAGES').split():
             systemd_check_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg):
                 systemd_generate_package_scripts(pkg)
+                systemd_create_presets(pkg)
         systemd_check_services()
 }
 
-- 
2.19.1


