Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.25851.1627271133672568801
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 20:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FBUlPfL2;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso6332419pjf.4
        for <Openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 20:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SCcx/4ujzMKEJ6nwoYENdQLQn8lDN21W3jtv9yQQGDA=;
        b=FBUlPfL2CIG3Ci3bCFzBQJS07y0bPbkzHmoyQqoWSq1rlZWtP+nLDy86CvennWW3qD
         D032sOp4Glo/RzgeYdX4auomFt/b6lFJMlrVLJdhxF4au6fuHM/Mwd5AbJAnZtE2ybmf
         y9OGg/SMBB61im7s6IYFcTbWRd0bNt39lgsO2veRHQbxY8k5KxK5dTyF3RMsdJxOlQQ3
         esYbDPhifQN+CFBrqpvPjSZizqIb1ke1V1t3KAFDwpY6ow4iKNkGOulu8c3Apj9rMc8E
         SkEQTT8FMTK9aUbtNzWVsY+bjD+oNkz67fvbULXK4lWMh5eq5qI3hu0ySXoP+Dt2Aj//
         KjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SCcx/4ujzMKEJ6nwoYENdQLQn8lDN21W3jtv9yQQGDA=;
        b=Y5drvwVODknv1MBmmb8MMvwfIJRi7ZziEuD2eoGfDucE10JDmGXbfwndOa489TTLYE
         pOmWXFI+M+6ayg1PlE0RofsJFYlTq0Kh6koqva7Ccto5AqJLxoGyi6jdzdy2gmbmTAlE
         ggj7n9tSTg5Sqx/JPV4mYxHJO0BFSft3dU00PdiA1wdbGiSNVJX6lY+VN5V9PrU2pyDq
         P7GuZQxfdBOJMKTnQ2HIiKoCLXZe7QfIAjFjqdjIcAh9P9/DR8lxOhB1XkMZRweJqkon
         CNYtLDA5I1rRvOWFGW2f5Lgu4woTnQ+rGTAWKByMc0UlzXEdZ3fd06XrNi4rFpO4h2ia
         8wSg==
X-Gm-Message-State: AOAM533Iq3tX2M1TpThGABfw15iQWDfTD3mqoicEr8e/+qBzXWePeldd
	Yxea3y9rv4N31bGa2VLYKQkkqbf3nu3mjQ==
X-Google-Smtp-Source: ABdhPJyMo5ZZLFk889GcVM5hkkhFkQ64v7aCZiTSFpNMgVRumRXcznWKiytoUdz0s7Sdb1LbFThM3Q==
X-Received: by 2002:a17:902:bb92:b029:12c:31cd:2400 with SMTP id m18-20020a170902bb92b029012c31cd2400mr849352pls.16.1627271132653;
        Sun, 25 Jul 2021 20:45:32 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([106.220.205.42])
        by smtp.gmail.com with ESMTPSA id s31sm15831071pgm.27.2021.07.25.20.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 20:45:32 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: nishaparrakat@gmail.com
Subject: [poky][master][PATCH] buildhistory.bbclass: Enable exporting more recipe and package data
Date: Mon, 26 Jul 2021 09:15:09 +0530
Message-Id: <20210726034509.13131-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Sana Kazi <Sana.Kazi@kpit.com>

Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
data to the latest file of buildhistory and sorted it alphabetically.

This makes extending data in buildhistory git tree simple and avoids
patches to it for users who care about things like SRC_URI and like
to track it in buildhistory git tree.

Now we can add additional information as per our requirement to the
buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
by appending them in a recipe or distro specific conf file as follows:

BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta-poky/conf/distro/poky.conf   |   3 +
 meta/classes/buildhistory.bbclass | 107 +++++++++++++++++++-----------
 2 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 522cc92f74..2280e95569 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -76,3 +76,6 @@ INHERIT += "reproducible_build"
 
 BB_SIGNATURE_HANDLER ?= "OEEquivHash"
 BB_HASHSERVE ??= "auto"
+
+BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES LICENSE SRC_URI CONFIG"
+BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 55b12d7893..9b1542643e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -220,7 +220,6 @@ python buildhistory_emit_pkghistory() {
     pv = d.getVar('PV')
     pr = d.getVar('PR')
     layer = bb.utils.get_file_layer(d.getVar('FILE'), d)
-    license = d.getVar('LICENSE')
 
     pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
@@ -258,12 +257,11 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe = pe
     rcpinfo.pv = pv
     rcpinfo.pr = pr
-    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     rcpinfo.layer = layer
-    rcpinfo.license = license
     rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
-    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
+    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
+    rcpinfo.export_recipe_variables = export_recipe_variables
     write_recipehistory(rcpinfo, d)
 
     bb.build.exec_func("read_subpackage_metadata", d)
@@ -317,6 +315,9 @@ python buildhistory_emit_pkghistory() {
 
         pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
 
+        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
+        pkginfo.export_package_variables = export_package_variables
+
         write_pkghistory(pkginfo, d)
 
     # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
@@ -365,17 +366,22 @@ def write_recipehistory(rcpinfo, d):
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
 
     infofile = os.path.join(pkghistdir, "latest")
+    export_recipe_variables = set(rcpinfo.export_recipe_variables.split())
+    ret = []
     with open(infofile, "w") as f:
-        if rcpinfo.pe != "0":
-            f.write(u"PE = %s\n" %  rcpinfo.pe)
-        f.write(u"PV = %s\n" %  rcpinfo.pv)
-        f.write(u"PR = %s\n" %  rcpinfo.pr)
-        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
-        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
-        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
-        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
-        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
-        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
+        for var in export_recipe_variables:
+            if var == "PE":
+                if rcpinfo.pe != "0":
+                    ret.append("%s = %s" % (var, rcpinfo.pe))
+            elif var == "LAYER":
+                ret.append("%s = %s" % (var, rcpinfo.layer))
+            elif var == "CONFIG":
+                ret.append("%s = %s" % (var, rcpinfo.config))
+            else:
+                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
+        ret.sort()
+        for element in ret:
+            f.write(element + "\n")
 
     write_latest_srcrev(d, pkghistdir)
 
@@ -389,32 +395,55 @@ def write_pkghistory(pkginfo, d):
         bb.utils.mkdirhier(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
+    export_package_variables = set(pkginfo.export_package_variables.split())
+    ret = []
     with open(infofile, "w") as f:
-        if pkginfo.pe != "0":
-            f.write(u"PE = %s\n" %  pkginfo.pe)
-        f.write(u"PV = %s\n" %  pkginfo.pv)
-        f.write(u"PR = %s\n" %  pkginfo.pr)
-
-        if pkginfo.pkg != pkginfo.name:
-            f.write(u"PKG = %s\n" % pkginfo.pkg)
-        if pkginfo.pkge != pkginfo.pe:
-            f.write(u"PKGE = %s\n" % pkginfo.pkge)
-        if pkginfo.pkgv != pkginfo.pv:
-            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
-        if pkginfo.pkgr != pkginfo.pr:
-            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
-        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
-        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
-        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-        if pkginfo.rsuggests:
-            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
-        if pkginfo.rreplaces:
-            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
-        if pkginfo.rconflicts:
-            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
-        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
-        f.write(u"FILES = %s\n" %  pkginfo.files)
-        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
+        for var in export_package_variables:
+            if var == "PE":
+                if pkginfo.pe != "0":
+                    ret.append("%s = %s" % (var, pkginfo.pe))
+            elif var == "PV":
+                ret.append("%s = %s" % (var, pkginfo.pv))
+            elif var == "PR":
+                ret.append("%s = %s" % (var, pkginfo.pr))
+            elif var == "RPROVIDES":
+                ret.append("%s = %s" % (var, pkginfo.rprovides))
+            elif var == "RDEPENDS":
+                ret.append("%s = %s" % (var, pkginfo.rdepends))
+            elif var == "RRECOMMENDS":
+                ret.append("%s = %s" % (var, pkginfo.rrecommends))
+            elif var == "PKGSIZE":
+                ret.append("%s = %s" % (var, pkginfo.size))
+            elif var == "FILES":
+                ret.append("%s = %s" % (var, pkginfo.files))
+            elif var == "FILELIST":
+                ret.append("%s = %s" % (var, pkginfo.filelist))
+            elif var == "RSUGGESTS":
+                if pkginfo.rsuggests:
+                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
+            elif var == "RREPLACES":
+                if pkginfo.rreplaces:
+                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
+            elif var == "RCONFLICTS":
+                if pkginfo.rconflicts:
+                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
+            elif var == "PKG":
+                if pkginfo.pkg != pkginfo.name:
+                    ret.append(u"PKG = %s" % pkginfo.pkg)
+            elif var == "PKGE":
+                if pkginfo.pkge != pkginfo.pe :
+                    ret.append(u"PKGE = %s" % pkginfo.pkge)
+            elif var == "PKGV":
+                if pkginfo.pkgv != pkginfo.pv:
+                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
+            elif var == "PKGR":
+                if pkginfo.pkgr != pkginfo.pr:
+                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
+            else:
+                ret.append("%s = %s" % (var, d.getVar(var)))
+        ret.sort()
+        for element in ret:
+            f.write(element + "\n")
 
     for filevar in pkginfo.filevars:
         filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
-- 
2.17.1

