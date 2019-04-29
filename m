Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3684D7DBC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y197so16217122wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aO+GN4oH90Arexffa9K9HMpVKHy9UmxdFBpcSOv76ac=;
	b=dUNIkWIUmoi05ORPYbVlRsY7qcSYy8wHg/TfoTaRIlZ5GfoCQY9m+N9TAT0rtO1Bk1
	/L1X+ShS2DdHUL3ecXe/9lX8VNoZqz7vtFPLOm7Mayqwbp4k9/N+bITbnW7jtG09JLeB
	EsPbs/6bdw8ifhouGqW0QXzzVxKgbTGyGxzHFxo0pMfMe0L38vSn9ejGLa8wMikPGyha
	BKR0HXXTOpjETLJ3iZfLLO513pzTlek2FCOb1iXBtz1a2oMsOjOkpDzNrhS8/NHJGxCn
	vPrInhLWvCtTJF3/JpXy14nn5ogLUqvsB7irKEyQ6FBp26vlNbpqb4kz8Brej/zX15QM
	QB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aO+GN4oH90Arexffa9K9HMpVKHy9UmxdFBpcSOv76ac=;
	b=fJQVPhl6/ktr7Mxg32Opmg8DNwOkuvS/ozZGddN6jNGqfp4lWihsusGGkkhp73g1iC
	Y6Dqzp2csz6g/nYqsVBB/C8Ss2ulpAC+l2ejw4Gk+LNFrRqWb6CJMRxWoy/+jbzGazcS
	EJt086bElDbKQC7zZI/j6Ye0sMORBluaGF0GmoibgSxljzf/VmyvfWOlofhPzeEVoNbL
	6sgkjKOmuPz9LXsu4fLMmRLepusPTDl41iTX/TLkQHVSw29Ozeg20qZ2YkJFDIiXNxpS
	WaQE9zDZYVcs+ew0EzumYv9NWx0pSP1AbqJh4OLnXF3Oe9yQb17SmCN9FMhyafSyShPj
	u5bg==
X-Gm-Message-State: APjAAAUrK9M5FPfQLDBEfLnCTHVyJQp1HDzteaqWiYAJiFRrAosDYI87
	N0VIvg91C/uGrnI8chX56AOUk9zupeg=
X-Google-Smtp-Source: APXvYqzwKbVY6vwmGu7Z//MJE/rOmLqnnTa0guEDxLA+9M7UpmB+XelIcqdv2R2znVbHfYPJwLYRyw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr17025683wmc.43.1556549024789; 
	Mon, 29 Apr 2019 07:43:44 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:44 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:23 +0100
Message-Id: <20190429144325.63744-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 4/6] systemd: create preset files instead of installing in image
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:44 -0000

From: Jonas Bonn <jonas@norrbonn.se>

At first boot, systemd will create the /etc/systemd/system directory
from service preset files.  As such, for a normal, writable /etc
(writable rootfs), there is no need to set up this directory at image
creation time.

This patch changes the systemd machinery to create preset files and to
rely on systemd to do the service enablement.

This breaks the read-only-rootfs case; there's a fix for this in a
follow-up patch.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/systemd.bbclass | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c8f4fdec88dc..403d2108df6d 100644
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
2.17.1


