Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE89C7D86E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y5so4407146wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=18NIA5SleLlrOAtMuqXVp3wWtbx5o4KomrT2H75Iu5s=;
	b=uqcdgqcw7xRjJQTtXIWjL1dxmQjm1SWYWBmVAd/y/Kfr6d+xRCLeEwnE0d/hYqiC2v
	NOaVmSTOSoXQ2UVHp7GC4635Mc+sSuJUhs15DnF49M07CGaMveBtlPybg3CBtfHfmDJt
	J7XSKZYDLbvfXFRx1W+sKoxEn+AFvkGWrXbiLTFtoewmFMYH0rmTgnKWDyoqDPBiyl88
	ruDWHAHrWyyQTAhgT/7jG98pfs0agTm9j7H0L+Qz8vDzs964vWAcms1lPy6iqZ9GyJqk
	9p9AAIvOlfgq7nZgsKBYbpXMrjoSCEtKnGKux6aiN6VHZkGB9BDmd0cxTeaojylCtpml
	Pedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=18NIA5SleLlrOAtMuqXVp3wWtbx5o4KomrT2H75Iu5s=;
	b=Ytnxog92rJAUiupuEc0xUp95KtvFAGOACyZT9gYfYDhxTzlBHcRo1ilmMKsG1K3rnY
	ivizWp8e+9IUTwClz/lrScOMdww8I/5cfPhKYyFB5w2rlLrhNZCBUGOCpIcpEV5ISnwy
	O7MK2gexPeXFShZpcs/Jb/FwA844gWmGQtCyaEVTm1QmmMv42LJUvHEfFbxTLwk8rhPe
	lLHLlUDkjyrX5e+TjuuWPybgDUQRCd9DWYTznW+nYkXkyQ72nnCe2C7G8xizX9FCUv65
	xwdoGe8Ekm/xle56TNxwSavggAQOIxpVu110rLcDZoLZQcL3DjMHnOaiiVXnETwJ2ixB
	n0DA==
X-Gm-Message-State: APjAAAWks9L1GM7XX2cQS+AZUEQGMDPxIALBa9e6+qXBcQ3Yk8Kvm7Py
	kGvT3+SZ33ERBNozS315fFeQ7PJ5
X-Google-Smtp-Source: APXvYqxAD+YKa6wKeGRw++5He7lLm14sqcHjeMhCiQZO26h43WWqVhJjrtI9j9t+/wTA9NSruAso9Q==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr3710249wmb.65.1556831422067; 
	Thu, 02 May 2019 14:10:22 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:42 +0100
Message-Id: <20190502210944.62696-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Subject: [PATCH v6 4/6] systemd: create preset files instead of installing in image
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
X-List-Received-Date: Thu, 02 May 2019 21:10:22 -0000

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

Changes in v6:
- don't exit in postinst as when that executes we're actually a
  concatenation of all fragments
- validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`

Changes in v5: None

 meta/classes/systemd.bbclass | 41 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c8f4fdec88dc..3935685c18cb 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -16,45 +16,30 @@ python __anonymous() {
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
-if [ -n "$D" ]; then
-    OPTS="--root=$D"
-fi
-
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl daemon-reload
-	fi
-
-	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE_ESCAPED}
+		systemctl preset "${SYSTEMD_SERVICE_ESCAPED}"
 
-	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
+		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+			systemctl --no-block restart "${SYSTEMD_SERVICE_ESCAPED}"
+		fi
 	fi
 fi
 }
 
 systemd_prerm() {
-OPTS=""
-
-if [ -n "$D" ]; then
-    OPTS="--root=$D"
-fi
-
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
-	fi
+		systemctl stop "${SYSTEMD_SERVICE_ESCAPED}"
 
-	systemctl $OPTS disable ${SYSTEMD_SERVICE_ESCAPED}
+		systemctl disable "${SYSTEMD_SERVICE_ESCAPED}"
+	fi
 fi
 }
 
@@ -177,12 +162,24 @@ python systemd_populate_packages() {
                 else:
                     bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
 
+    def systemd_create_presets(pkg):
+        action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
+        if action not in ("enable", "disable"):
+            bb.fatal("SYSTEMD_AUTO_ENABLE_%s '%s' is not 'enable' or 'disable'" % (pkg, action))
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


