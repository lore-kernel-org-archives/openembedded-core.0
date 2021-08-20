Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.80394.1629442773594164899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17K6xWuk030856
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 23:59:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17K6xWwG025217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 23:59:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 19 Aug 2021 23:59:31 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 19 Aug 2021 23:59:31 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] package_rpm/update-alternatives: fix package's provides
Date: Thu, 19 Aug 2021 23:59:31 -0700
Message-ID: <20210820065931.55606-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently we have:
  $ rpm -qp --provides tmp/deploy/rpm/core2_64/bash-5.1.8-r0.core2_64.rpm
  bash = 5.1.8-r0

This is incorrect as bash provides /bin/bash and /bin/sh. This is caused by
incomplete conversion of new override syntax, which breaks the per-file
parsing of package_rpm.

With this patch, we have:
  $ rpm -qp --provides tmp/deploy/rpm/core2_64/bash-5.1.8-r0.core2_64.rpm
  /bin/bash
  /bin/sh
  bash = 5.1.8-r0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package_rpm.bbclass         | 8 ++++----
 meta/classes/update-alternatives.bbclass | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index aebeaf6932..88d861c0e7 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -40,10 +40,10 @@ def write_rpm_perfiledata(srcname, d):
         outfile.write("# Dependency table\n")
         outfile.write('deps = {\n')
         for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
+            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
             dependsflist = (d.getVar(dependsflist_key) or "")
             for dfile in dependsflist.split():
-                key = "FILE" + varname + "_" + dfile + "_" + pkg
+                key = "FILE" + varname + ":" + dfile + ":" + pkg
                 deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
                 depends_dict = bb.utils.explode_dep_versions(deps)
                 file = dfile.replace("@underscore@", "_")
@@ -249,10 +249,10 @@ python write_specfile () {
 
     def get_perfile(varname, pkg, d):
         deps = []
-        dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
+        dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
         dependsflist = (d.getVar(dependsflist_key) or "")
         for dfile in dependsflist.split():
-            key = "FILE" + varname + "_" + dfile + "_" + pkg
+            key = "FILE" + varname + ":" + dfile + ":" + pkg
             depends = d.getVar(key)
             if depends:
                 deps.append(depends)
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 81ca05de0e..fc1ffd828c 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -321,7 +321,7 @@ def apply_update_alternative_provides(d):
 
             # Add file provide
             trans_target = oe.package.file_translate(alt_target)
-            d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + alt_link)
-            if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg) or ""):
-                d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
+            d.appendVar('FILERPROVIDES:%s:%s' % (trans_target, pkg), " " + alt_link)
+            if not trans_target in (d.getVar('FILERPROVIDESFLIST:%s' % pkg) or ""):
+                d.appendVar('FILERPROVIDESFLIST:%s' % pkg, " " + trans_target)
 
-- 
2.30.2

