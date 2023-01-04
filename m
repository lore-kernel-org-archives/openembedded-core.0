Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC2C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15527.1672847238552390024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xpm/MKOT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id bk16so20209399wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skdl6gNpUQ9ciw0mB29SiclOCu/J2E/hyZVd9RQXMCM=;
        b=Xpm/MKOTRIA9KBSm3YL2Bgvy3E97u3FvKVmi2WbbA3CyBUwCnAOw2ew92LBCM1ZURb
         R5EUzSVPoE/gwZcsesGITonUaGqHSs3j61/bV+haJy9dglcL1yF49MOTO8zCHxJNxoRf
         5MJkWpCcCIjnuh35CADjYfvSSP3Lys7aZpytc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skdl6gNpUQ9ciw0mB29SiclOCu/J2E/hyZVd9RQXMCM=;
        b=h4C3a4XH/wGzYPEqSzEpj1iCez/ETEQG7SZogSQA1hg2vXR5wuOokJaqT7LU0IWXZ9
         PDQzsaMnow7+Cgc2ghMCgmZecVG16HR/xdQ+E32H2o/01IfM7u7JGsb1M/syFBckPmTf
         cEDcyPA+aIteuq/WSeldX3cckllGPa1Kznxox9QpaPMC4CGE6563Qc9KU3bne2m0dbxh
         BL5aEqb2GEE+LbOEzPtoDltslcp8zG00nSNQLgwkqeYCfgvzhkhj+CG/N+8N0FRTqKez
         Rrm41aRfprslUnPE1gvZCUZ+J68nfJZN2+OSFq/IU6vrfQKjUkNxZWnBKIKQyg9jqnol
         36KA==
X-Gm-Message-State: AFqh2kqXm98ve2bophAB8cjaV2Ry7qxXgxvaDKba0quPcl2kl1GuFphZ
	ns3O6zDpMfkEPv01+iUWehwdt0efzsmNDUY0
X-Google-Smtp-Source: AMrXdXs/ixniSCqsi5Ou2oYmPH3lXW/hH9/eBFEjfXvS1ut+iPBy+lQoFSWUzL5/OjvTfEhYwk9N+A==
X-Received: by 2002:adf:e6ce:0:b0:293:1089:d6a with SMTP id y14-20020adfe6ce000000b0029310890d6amr10179766wrm.39.1672847236735;
        Wed, 04 Jan 2023 07:47:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] package: Move get_conffiles/files_from_filevars functions to lib
Date: Wed,  4 Jan 2023 15:47:06 +0000
Message-Id: <20230104154714.1168535-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175489

To avoid reparsing the bbclass code all the time, move the functions
to the python function library code which is more efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass     | 78 +------------------------
 meta/classes-global/package_deb.bbclass |  2 +-
 meta/classes-global/package_ipk.bbclass |  2 +-
 meta/classes-global/package_rpm.bbclass |  2 +-
 meta/lib/oe/package.py                  | 77 ++++++++++++++++++++++++
 5 files changed, 81 insertions(+), 80 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 29f0c80abdc..a31224f243b 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -257,82 +257,6 @@ python () {
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 }
 
-# Get a list of files from file vars by searching files under current working directory
-# The list contains symlinks, directories and normal files.
-def files_from_filevars(filevars):
-    import os,glob
-    cpath = oe.cachedpath.CachedPath()
-    files = []
-    for f in filevars:
-        if os.path.isabs(f):
-            f = '.' + f
-        if not f.startswith("./"):
-            f = './' + f
-        globbed = glob.glob(f)
-        if globbed:
-            if [ f ] != globbed:
-                files += globbed
-                continue
-        files.append(f)
-
-    symlink_paths = []
-    for ind, f in enumerate(files):
-        # Handle directory symlinks. Truncate path to the lowest level symlink
-        parent = ''
-        for dirname in f.split('/')[:-1]:
-            parent = os.path.join(parent, dirname)
-            if dirname == '.':
-                continue
-            if cpath.islink(parent):
-                bb.warn("FILES contains file '%s' which resides under a "
-                        "directory symlink. Please fix the recipe and use the "
-                        "real path for the file." % f[1:])
-                symlink_paths.append(f)
-                files[ind] = parent
-                f = parent
-                break
-
-        if not cpath.islink(f):
-            if cpath.isdir(f):
-                newfiles = [ os.path.join(f,x) for x in os.listdir(f) ]
-                if newfiles:
-                    files += newfiles
-
-    return files, symlink_paths
-
-# Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
-def get_conffiles(pkg, d):
-    pkgdest = d.getVar('PKGDEST')
-    root = os.path.join(pkgdest, pkg)
-    cwd = os.getcwd()
-    os.chdir(root)
-
-    conffiles = d.getVar('CONFFILES:%s' % pkg);
-    if conffiles == None:
-        conffiles = d.getVar('CONFFILES')
-    if conffiles == None:
-        conffiles = ""
-    conffiles = conffiles.split()
-    conf_orig_list = files_from_filevars(conffiles)[0]
-
-    # Remove links and directories from conf_orig_list to get conf_list which only contains normal files
-    conf_list = []
-    for f in conf_orig_list:
-        if os.path.isdir(f):
-            continue
-        if os.path.islink(f):
-            continue
-        if not os.path.exists(f):
-            continue
-        conf_list.append(f)
-
-    # Remove the leading './'
-    for i in range(0, len(conf_list)):
-        conf_list[i] = conf_list[i][1:]
-
-    os.chdir(cwd)
-    return conf_list
-
 def checkbuildpath(file, d):
     tmpdir = d.getVar('TMPDIR')
     with open(file) as f:
@@ -1209,7 +1133,7 @@ python populate_packages () {
             filesvar.replace("//", "/")
 
         origfiles = filesvar.split()
-        files, symlink_paths = files_from_filevars(origfiles)
+        files, symlink_paths = oe.package.files_from_filevars(origfiles)
 
         if autodebug and pkg.endswith("-dbg"):
             files.extend(debug)
diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index ec7e10dbc99..c3ae7d574dc 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -269,7 +269,7 @@ def deb_write_pkg(pkg, d):
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0o755)
 
-        conffiles_str = ' '.join(get_conffiles(pkg, d))
+        conffiles_str = ' '.join(oe.package.get_conffiles(pkg, d))
         if conffiles_str:
             conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             for f in conffiles_str.split():
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index c43592af7e3..0207ea874b1 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -226,7 +226,7 @@ def ipk_write_pkg(pkg, d):
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0o755)
 
-        conffiles_str = ' '.join(get_conffiles(pkg, d))
+        conffiles_str = ' '.join(oe.package.get_conffiles(pkg, d))
         if conffiles_str:
             conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             for f in conffiles_str.split():
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 39efcc328eb..7ba73f48e7d 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -341,7 +341,7 @@ python write_specfile () {
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
-        conffiles = get_conffiles(pkg, d)
+        conffiles = oe.package.get_conffiles(pkg, d)
         dirfiles = localdata.getVar('DIRFILES')
         if dirfiles is not None:
             dirfiles = dirfiles.split()
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 05447f88084..b4c8ab7222a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+import glob
 import stat
 import mmap
 import subprocess
@@ -532,5 +534,80 @@ def fixup_perms(d):
                     each_file = os.path.join(root, f)
                     fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
 
+# Get a list of files from file vars by searching files under current working directory
+# The list contains symlinks, directories and normal files.
+def files_from_filevars(filevars):
+    import oe.cachedpath
+
+    cpath = oe.cachedpath.CachedPath()
+    files = []
+    for f in filevars:
+        if os.path.isabs(f):
+            f = '.' + f
+        if not f.startswith("./"):
+            f = './' + f
+        globbed = glob.glob(f)
+        if globbed:
+            if [ f ] != globbed:
+                files += globbed
+                continue
+        files.append(f)
+
+    symlink_paths = []
+    for ind, f in enumerate(files):
+        # Handle directory symlinks. Truncate path to the lowest level symlink
+        parent = ''
+        for dirname in f.split('/')[:-1]:
+            parent = os.path.join(parent, dirname)
+            if dirname == '.':
+                continue
+            if cpath.islink(parent):
+                bb.warn("FILES contains file '%s' which resides under a "
+                        "directory symlink. Please fix the recipe and use the "
+                        "real path for the file." % f[1:])
+                symlink_paths.append(f)
+                files[ind] = parent
+                f = parent
+                break
+
+        if not cpath.islink(f):
+            if cpath.isdir(f):
+                newfiles = [ os.path.join(f,x) for x in os.listdir(f) ]
+                if newfiles:
+                    files += newfiles
+
+    return files, symlink_paths
+
+# Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
+def get_conffiles(pkg, d):
+    pkgdest = d.getVar('PKGDEST')
+    root = os.path.join(pkgdest, pkg)
+    cwd = os.getcwd()
+    os.chdir(root)
+
+    conffiles = d.getVar('CONFFILES:%s' % pkg);
+    if conffiles == None:
+        conffiles = d.getVar('CONFFILES')
+    if conffiles == None:
+        conffiles = ""
+    conffiles = conffiles.split()
+    conf_orig_list = files_from_filevars(conffiles)[0]
+
+    # Remove links and directories from conf_orig_list to get conf_list which only contains normal files
+    conf_list = []
+    for f in conf_orig_list:
+        if os.path.isdir(f):
+            continue
+        if os.path.islink(f):
+            continue
+        if not os.path.exists(f):
+            continue
+        conf_list.append(f)
+
+    # Remove the leading './'
+    for i in range(0, len(conf_list)):
+        conf_list[i] = conf_list[i][1:]
 
+    os.chdir(cwd)
+    return conf_list
 
-- 
2.37.2


