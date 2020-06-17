Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2931.1592381412801792461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 01:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05H89oC8007802
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 01:10:01 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 17 Jun 2020 01:09:27 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mime.bbclass: change postrm to prerm
Date: Wed, 17 Jun 2020 16:07:40 +0800
Message-ID: <20200617080740.1527497-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error during post uninstall:
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
+ '[' 0 = 0 ']'
+ set -e
+ '[' x '!=' x ']'
+ echo 'Updating MIME database... this may take a while.'
Updating MIME database... this may take a while.
+ update-mime-database /usr/share/mime
Directory '/usr/share/mime/packages' does not exist!
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1

when run post uninstall scriptlet, /usr/share/mime/packages has been
removed during unintall, while update-mime-database need to use
/usr/share/mime/packages/freedesktop.org.xml

correct by change postrm to prerm

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/mime.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..a0943b4476 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -17,7 +17,7 @@ else
 fi
 }
 
-mime_postrm() {
+mime_prerm() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
 		mlprefix=${MLPREFIX} \
@@ -42,17 +42,17 @@ python populate_packages_append () {
                     mimes_types_found = True
                     break
         if mimes_types_found:
-            bb.note("adding mime postinst and postrm scripts to %s" % pkg)
+            bb.note("adding mime postinst and prerm scripts to %s" % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('mime_postinst')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            postrm = d.getVar('pkg_postrm_%s' % pkg)
-            if not postrm:
-                postrm = '#!/bin/sh\n'
-            postrm += d.getVar('mime_postrm')
-            d.setVar('pkg_postrm_%s' % pkg, postrm)
+            prerm = d.getVar('pkg_prerm_%s' % pkg)
+            if not prerm:
+                prerm = '#!/bin/sh\n'
+            prerm += d.getVar('mime_prerm')
+            d.setVar('pkg_prerm_%s' % pkg, prerm)
             if pkg != 'shared-mime-info-data':
                 bb.note("adding shared-mime-info-data dependency to %s" % pkg)
                 d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
-- 
2.17.1

