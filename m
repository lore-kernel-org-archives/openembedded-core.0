Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5DF7C30D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:28 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id x85-v6so11756935ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9mFTVU/bp92HJRySXNmTngIy8C1P0wByDZAeBpvPsYY=;
	b=b7RWDvgTow4TiZfZOSyM3JKBdXWaljWPPGfxebvM5mWYtiYCRPhzbMcEKdanKoU6R3
	U3FVQIY3+fIbaiRrrHctd+za9tZurw0rjIxvdWvgPxG9KOD14afmU1cif9alTBMSHCeO
	HfDUqSHLGgxpfKe+qu2c6oYYROhwlbIoOTLTY6omOuLb5D0JAoK7oRBkrIN6p8A2Lnfs
	DBn6OqbM+lduTpAiVHWufBUb1i+e4hXBxovhOWnVhqPqUNQsi3w/On1f3LpSiJZRbTS7
	l0qguKHTesoEpsx/woLUP6H/TUYaJRaKRyFMy7JMO4KD7Gwns3H91/poISlKGJuCUvFY
	hXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9mFTVU/bp92HJRySXNmTngIy8C1P0wByDZAeBpvPsYY=;
	b=lgdxyFeC6YVWFykElrWTszoTgCsIvwc4nJXBqlv3YRZj0ObpxlcMnZqNAdMhJGeQoO
	oSBkrk81IBBxITD8IaYbE+0n4hS74zny7iqwKZ+4c14mG6l+gBgSqHDEN/ZBcOamGrZ6
	pwDVFEiQ8w5rj50Hwq4YQJhMkCK06do0nRp5OOxYEXxVGefFJMD5TIBkx3O3J8lAFYAl
	6VkRtAmWkD8OOdp4BKE9IGKvO65ePKO2ckgT2rtLtJ/uns2apmc8oAESQs0/aE5E8jcT
	mTnqfECuLMyubQjUloyKjRNP1j7ubfSAqxpxknDNRI7XBg74tTYo/CDK8nuYrJ//5zra
	XnRg==
X-Gm-Message-State: AJcUukdD4giye3au2zEXYNtpEzVSwxkUrb/taOigjMFOOn40FbM8xd3Q
	3NqamFySbPiqpDPv0Yx0sesYi+WExD0=
X-Google-Smtp-Source: ALg8bN7x9+39Wm2lvxfyWr1b+VCfV5u3jFPRMvesXsvENroaFr1F2I7VOe0/MDpakfPLZda36wB+6g==
X-Received: by 2002:a2e:63cd:: with SMTP id
	s74-v6mr13608075lje.117.1548581908421; 
	Sun, 27 Jan 2019 01:38:28 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:27 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:19 +0100
Message-Id: <20190127093821.4803-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v3 3/5] systemd: create preset files instead of installing in image
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:28 -0000
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


