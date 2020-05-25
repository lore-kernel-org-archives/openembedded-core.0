Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com [68.232.139.124])
 by mx.groups.io with SMTP id smtpd.web10.27830.1590392635672949474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 00:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=h8B5OBbd;
 spf=pass (domain: bmw.de, ip: 68.232.139.124, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590392637; x=1621928637;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=OzwMXENdk5btkX1E6/lYSuXAQM55AUX6ipZk9RMSX30=;
  b=h8B5OBbdHc75swq0mHo1tl07pi6wCV+5qFdLowDMoLsAipiOa7FqWTDn
   HaaQBgg5otuVB/KAQmD5BjPWy78uquWazuiYDIZSBi2FutF9iIhacvAvD
   6NZmM/dtksGn/Ec8kBowUJuDI+T9YJiQMpbT0LzMVqPcQvZZCB/sFQVRa
   0=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 09:43:54 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw2.muc with ESMTP/TLS;
 25 May 2020 09:43:53 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb6.muc with ESMTP/TLS; 25 May 2020 09:43:52 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.35) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 09:43:52 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH 1/5] package.bbclass: add PACKAGE_ADD_METADATA to sstate variables
Date: Mon, 25 May 2020 09:43:37 +0200
Message-ID: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm06j.europe.bmw.corp (160.48.96.30) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

The PACKAGE_ADD_METADATA can be used to define additional metadata for
packages. Changes to this variable should affect the packaging sstate hash
so packages are re-generated when this variable changes.

This variable is added to both PKGDATA_VARS and PACKAGEVARS. It is needed
in PACKAGEVARS to ensure changes invoke do_package to re-run. It is needed
in PKGDATA_VARS to ensure changes are written into the pkgdata so that the
hash equiv reports a change and does not skip over the package_write tasks.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0b5cf47..0af5f66 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1508,7 +1508,7 @@ EXPORT_FUNCTIONS package_name_hook
 
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
-PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
+PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
     from glob import glob
@@ -2263,7 +2263,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
 
 def gen_packagevar(d, pkgvars="PACKAGEVARS"):
     ret = []
-- 
2.7.4

