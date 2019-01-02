Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 422766BC7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:11:53 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so27406961lja.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Jxo++u6KzDXRpHu/Tn5YZx//anvx5dGG0C5wctp8arI=;
	b=BXwHKm82SqRJfmtg3pBluQz1YNwKnHLICK9svrQK4asBQpb/sK+O0t66O0jjcpfAui
	3dBePis7FxeIvA90JrSANOUTI0x+NQBWviirpPWNQKrUY1RONra0hJy2hV2nGugQkFbL
	6wUjuv16VCv0DOVfJU7xnDbYgcFKgvKySofapCS3zkTbnTBbbCj/qdpLifYvMj/l4p9j
	0yiepw2K6WqhnStAQN33TmjxdpXeVd/aKd7X9qNpnCMqfH3zH8A++MNaw52RlFn00X7u
	6tbbkyxC6svmKlp5e6Q9tpmVXLGUnBA0A2gNuvH1ayA9nVZ/D4OiMXTpsJrS3YfojPFg
	0QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jxo++u6KzDXRpHu/Tn5YZx//anvx5dGG0C5wctp8arI=;
	b=CUIDw3PAeWcE2bRRs5PT1LCGxztG6iEbwLPpEJcHfz0nqV9yx7BtDxBhZ0oBMD9BF1
	wbsAvlbI0GX+BP3BKYByKksr1bSSTXoX2Sr4OdZOQkgbEYdp7DatUzCnSSlMxHTf81RY
	cWrEEJv0srJkNn/9LCvtdu7wlQyxzdAN2HfTIfEOyGFLMpvodH8GNHqYsldgAldxcEiw
	DraolbSxN/w4uiRxAw2nvpMxazh6Mx001QOs52na/GvIxKFP+52AmPNuoADD2nLgIxHK
	MU7d5L1V5eEPbzl5UDYOMIVNiSo1yZwksdqLUVz5Q4YncKI8Z1CQep2Otm7CNLJ0LDcp
	HmTg==
X-Gm-Message-State: AJcUukdlmvcO3D84Ms8ssOm4r2uUMb8cl2OaZ9qkpUHCViq/rfVcDyc/
	T2n1joytbL5nYctw8oGrGalhji3IXBc=
X-Google-Smtp-Source: ALg8bN5LMx8iZ2v7tSTz8HMD8gO53xOSyXKLtHKx3aqiky41OGwTR0PuhDvHe0KRNRmKhnh9j05acA==
X-Received: by 2002:a2e:8643:: with SMTP id
	i3-v6mr21153145ljj.43.1546445513541; 
	Wed, 02 Jan 2019 08:11:53 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o17sm10040195lff.77.2019.01.02.08.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:11:53 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 17:11:42 +0100
Message-Id: <20190102161144.11264-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190102161144.11264-1-jonas@norrbonn.se>
References: <20190102161144.11264-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v2 3/5] systemd: create preset files instead of installing in image
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
X-List-Received-Date: Wed, 02 Jan 2019 16:11:53 -0000
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
index c7b784dea8..cf3b5de4a1 100644
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
+        presetf = oe.path.join(d.getVar("PKGD"), "/lib/systemd/system-preset/98-%s.preset" % pkg)
+        bb.utils.mkdirhier(os.path.dirname(presetf))
+        with open(presetf, 'a') as fd:
+            for service in d.getVar('SYSTEMD_SERVICE_%s' % pkg).split():
+                fd.write("%s %s\n" % (action,service))
+        d.appendVar("FILES_%s" % pkg, " /lib/systemd/system-preset/98-%s.preset" % pkg)
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


