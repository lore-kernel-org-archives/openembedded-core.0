Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.31738.1629152864696762402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hv/0KQ72;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x12so25676731wrr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2QlO0OmbTdUIAYvAVBXC5F1JtvUleBTe+0dzFjERVI=;
        b=hv/0KQ72gROUUQ2EKOs0MlVj63N/lpFqz9IyZnLR4+jH4g1ZwvrYYAnhLJ/ClCAUQn
         o7tHO3Lb6t18d4N5NYzYOr48+KOyvTOwKD73haNhJseKrkVzmK1i33prhdN46b1v9QHa
         SbeFV7E+l4M+0vVtiDh3M6bLRlUuO/al0FU64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2QlO0OmbTdUIAYvAVBXC5F1JtvUleBTe+0dzFjERVI=;
        b=s9wp64fk3KExERYTxVPLmA3m9N5TBHTxvLaLQeLH5IaXXATWFN+mh/WlDVrE6MaNYG
         FJOGSZ0JNSO3sjN+D1pOB44NxffddJj/4P9KK9qGp/BtLQVjGegRWZ5YR1eLPMybsZH1
         jbGLURER62lPjOA0+Bgf9ysk0sW8yUD3cxwgLBpf15MlzvHqCT5eBYc2tdIVOLQsGZyy
         2VwsjnU5OWO1Gk6rAeWhwBzwd08yEN16G/j46Dh8Q649BMav7Tpm5Pu0nkIYg/LaEGzG
         jR6NFD2GNKuEYto/Jh8ABB8mHA7Lhsobstf4Qs/LultDTqNErzza5xuGOBXyRka2b0e2
         eEKg==
X-Gm-Message-State: AOAM530HWEJGuDv1juha9O27RHTZSI26vzLGBE2HWx6fNLBLAniV7ZpC
	5AAg41eAmyeN3QO0osMAcYsBUv7ynyFPyQ==
X-Google-Smtp-Source: ABdhPJym8nFh6Y7Vl4QGlIvRLFyZ3KtNo2OrDlWUZ9cqFvCqrTYe14OOnPLCnPPitH5+bzlrhdxnLA==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr340935wrr.198.1629152862888;
        Mon, 16 Aug 2021 15:27:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f791:56b8:5572:9d45])
        by smtp.gmail.com with ESMTPSA id p1sm83450wmq.48.2021.08.16.15.27.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:27:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] package/scripts: Fix FILES_INFO handling
Date: Mon, 16 Aug 2021 23:27:41 +0100
Message-Id: <20210816222742.3865259-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a long standing bug where FILES_INFO isn't written into pkgdata
with a package suffix. This means if the files are read into the datastore
as intended, the last one "wins".

Fix this to work as intended. Most of the call sites using the data need
to be updated to handle this and the overrides change correctly.

Also fix some other problematic references noticed along the way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass                      | 4 ++--
 meta/classes/package.bbclass                     | 2 +-
 meta/classes/toaster.bbclass                     | 2 +-
 scripts/lib/devtool/search.py                    | 5 +++--
 scripts/lib/recipetool/append.py                 | 8 ++++----
 scripts/lib/recipetool/create.py                 | 4 ++--
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 scripts/oe-pkgdata-util                          | 4 ++--
 8 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 810459d4326..b84e6035edb 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -808,11 +808,11 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
                     rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
                     for key in rdep_data:
-                        if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES:"):
+                        if key.startswith("FILERPROVIDES:") or key.startswith("RPROVIDES:"):
                             for subkey in bb.utils.explode_deps(rdep_data[key]):
                                 filerdepends.pop(subkey,None)
                         # Add the files list to the rprovides
-                        if key == "FILES_INFO":
+                        if key.startswith("FILES_INFO:"):
                             # Use eval() to make it as a dict
                             for subkey in eval(rdep_data[key]):
                                 filerdepends.pop(subkey,None)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a9138ff6bec..fb3c346f692 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1652,7 +1652,7 @@ fi
             if fstat.st_ino not in seen:
                 seen.add(fstat.st_ino)
                 total_size += fstat.st_size
-        d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
+        d.setVar('FILES_INFO:' + pkg , json.dumps(files, sort_keys=True))
 
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
         add_set_e_to_scriptlets(pkg)
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 9518ddf7a4e..dd5c7f224ba 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -106,7 +106,7 @@ def _toaster_load_pkgdatafile(dirpath, filepath):
                     pkgdata['OPKGN'] = m.group(1)
                 kn = "_".join([x for x in kn.split("_") if x.isupper()])
                 pkgdata[kn] = kv.strip()
-                if kn == 'FILES_INFO':
+                if kn.startswith('FILES_INFO'):
                     pkgdata[kn] = json.loads(kv)
 
             except ValueError:
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index d81cdd876f6..70b81cac5e8 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -62,10 +62,11 @@ def search(args, config, basepath, workspace):
                             with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
                                 for line in f:
                                     if ': ' in line:
-                                        splitline = line.split(':', 1)
+                                        splitline = line.split(': ', 1)
                                         key = splitline[0]
                                         value = splitline[1].strip()
-                                    if key in ['PKG:%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
+                                    key = key.replace(":" + pkg, "")
+                                    if key in ['PKG', 'DESCRIPTION', 'FILES_INFO', 'FILERPROVIDES']:
                                         if keyword_rc.search(value):
                                             match = True
                                             break
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 5f629c07d8e..88ed8c5f018 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -72,15 +72,15 @@ def find_target_file(targetpath, d, pkglist=None):
                 # This does assume that PN comes before other values, but that's a fairly safe assumption
                 for line in f:
                     if line.startswith('PN:'):
-                        pn = line.split(':', 1)[1].strip()
-                    elif line.startswith('FILES_INFO:'):
-                        val = line.split(':', 1)[1].strip()
+                        pn = line.split(': ', 1)[1].strip()
+                    elif line.startswith('FILES_INFO'):
+                        val = line.split(': ', 1)[1].strip()
                         dictval = json.loads(val)
                         for fullpth in dictval.keys():
                             if fnmatch.fnmatchcase(fullpth, targetpath):
                                 recipes[targetpath].append(pn)
                     elif line.startswith('pkg_preinst:') or line.startswith('pkg_postinst:'):
-                        scriptval = line.split(':', 1)[1].strip().encode('utf-8').decode('unicode_escape')
+                        scriptval = line.split(': ', 1)[1].strip().encode('utf-8').decode('unicode_escape')
                         if 'update-alternatives --install %s ' % targetpath in scriptval:
                             recipes[targetpath].append('?%s' % pn)
                         elif targetpath_re.search(scriptval):
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 0ac97e02e94..5cd72ea0a7d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -115,8 +115,8 @@ class RecipeHandler(object):
                 for line in f:
                     if line.startswith('PN:'):
                         pn = line.split(':', 1)[-1].strip()
-                    elif line.startswith('FILES_INFO:'):
-                        val = line.split(':', 1)[1].strip()
+                    elif line.startswith('FILES_INFO:%s:' % pkg):
+                        val = line.split(': ', 1)[1].strip()
                         dictval = json.loads(val)
                         for fullpth in sorted(dictval):
                             if fullpth.startswith(includedir) and fullpth.endswith('.h'):
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index fdd33660387..8aa44650d33 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -545,7 +545,7 @@ class PythonRecipeHandler(RecipeHandler):
             with open(pkgdatafile, 'r') as f:
                 for line in f.readlines():
                     field, value = line.split(': ', 1)
-                    if field == 'FILES_INFO':
+                    if field.startswith('FILES_INFO'):
                         files_info = ast.literal_eval(value)
                         break
                 else:
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 94d44002ab4..ffa3850b8bc 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -431,7 +431,7 @@ def list_pkg_files(args):
             for line in f:
                 if line.startswith('FILES_INFO:'):
                     found = True
-                    val = line.split(':', 1)[1].strip()
+                    val = line.split(': ', 1)[1].strip()
                     dictval = json.loads(val)
                     if long:
                         width = max(map(len, dictval), default=0)
@@ -500,7 +500,7 @@ def find_path(args):
             with open(os.path.join(root,fn)) as f:
                 for line in f:
                     if line.startswith('FILES_INFO:'):
-                        val = line.split(':', 1)[1].strip()
+                        val = line.split(': ', 1)[1].strip()
                         dictval = json.loads(val)
                         for fullpth in dictval.keys():
                             if fnmatch.fnmatchcase(fullpth, args.targetpath):
-- 
2.30.2

