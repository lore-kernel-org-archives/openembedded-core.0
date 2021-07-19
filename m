Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.26716.1626693606006235290
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 04:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qcb7Acve;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id jx7-20020a17090b46c7b02901757deaf2c8so11909681pjb.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vGpqCRn6CR5cgwM/C4C5W8m5kkilPiSj+m6EJ/vUJsE=;
        b=qcb7Acve8aXp0DQ2B7Ok9YvHE7iE9GP+XQNQrPmeNa7ikXuOZ/Jlu96wAGUVBFt0/9
         0quFswRkVEW/aQ6HCMofdGVOxAZUtBEMCA1y8wvuJNHUblWJkP3cfqr/PibTSoj/B/Wk
         JscLr7tNoIti0OGiVdTVv+c5FeMkkaKh3D485FYxSkdGmo7dbLeYooIq+E3gDya7c56g
         HZNDpSpi/RbxW9mYxo1UcG7VCdFoLKZDMHojEO1kPQP8XFTe4nW0UnAf9GOrMaMccQN5
         VBpv74U2iWQc1s08L/Tvcw4oqOPwMFeoz/e6aX3jA1ZWOi+hmBV+BJAPDVgtfUy+O69U
         /UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vGpqCRn6CR5cgwM/C4C5W8m5kkilPiSj+m6EJ/vUJsE=;
        b=WuAkZeiYdQFfDbgaz8F5dDTC3a7avv6Tbdw857sBt1ZGsfAwmmL5N+2V358ZSC+3oF
         l1fHGMr/CD3REONYVmTCknzFUnGc4fha5mn5BbTlWkhb+EkyDsb3QTN70vZnTKLZIZ5L
         uxy6zkoRdgWGkzcTZnH2z6A6ACn3YzS/Il5uRqJJGO9bL81AWt1HZiXVrAhNnThu0opc
         4HqEH8wXPvmD+0KEM8hIwysTK8yqmsawrD5TR2L9lOqoJAl5Yfm+KMGZmBiOXVrkoEPP
         a/lyI368g98BqCynnR0yE8wgktI6oiZBcV1HXJ04q4vjjRKGpZqmVDD/tDIookAq7MLt
         XH9w==
X-Gm-Message-State: AOAM5305LNAXC9+dIh4AcgnJPh3dbpSZ9+WvC3YamVUPFZ/ITbwgy5Ry
	2nS2vRVS3Bz5kxfysrYFxtszJmCozSJjYw==
X-Google-Smtp-Source: ABdhPJzbvZgg278aOWMF1TkE8GvzeRxd071Ad6sovB+wxFN2eV11RXqBVZn8SEvINeZBTB3Zn/ROLw==
X-Received: by 2002:a17:90b:3844:: with SMTP id nl4mr29132872pjb.78.1626693605249;
        Mon, 19 Jul 2021 04:20:05 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2402:8100:30a2:fc49:89df:80af:d1f0:faa3])
        by smtp.gmail.com with ESMTPSA id w22sm18968537pfn.188.2021.07.19.04.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:20:04 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: nishaparrakat@gmail.com,
	Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][dunfell][PATCH] buildhistory.bbclass: Enable exporting more recipe and package data
Date: Mon, 19 Jul 2021 16:49:50 +0530
Message-Id: <20210719111950.3560-1-sanakazisk19@gmail.com>
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

BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "LICENSE MAINTAINER SRC_URI"
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "LICENSE MAINTAINER"

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta-poky/conf/distro/poky.conf   |  2 +
 meta/classes/buildhistory.bbclass | 98 +++++++++++++++++++++----------
 2 files changed, 68 insertions(+), 32 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 92e9ba5477..d766d4b1f5 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -89,3 +89,5 @@ INHERIT += "reproducible_build"
 
 BB_SIGNATURE_HANDLER ?= "OEEquivHash"
 BB_HASHSERVE ??= "auto"
+BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES"
+BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 44a66df962..a2888666d9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -254,6 +254,8 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     rcpinfo.layer = layer
+    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
+    rcpinfo.export_recipe_variables = export_recipe_variables
     write_recipehistory(rcpinfo, d)
 
     pkgdest = d.getVar('PKGDEST')
@@ -312,6 +314,9 @@ python buildhistory_emit_pkghistory() {
 
         pkginfo.size = int(pkgdata['PKGSIZE'])
 
+        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
+        pkginfo.export_package_variables = export_package_variables
+
         write_pkghistory(pkginfo, d)
 
     # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
@@ -360,14 +365,20 @@ def write_recipehistory(rcpinfo, d):
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
+        for var in export_recipe_variables:
+            if var == "PE":
+                if rcpinfo.pe != "0":
+                    ret.append("%s = %s" % (var, rcpinfo.pe))
+            elif var == "LAYER":
+                ret.append("%s = %s" % (var, rcpinfo.layer))
+            else:
+                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
+        ret.sort()
+        for element in ret:
+            f.write(element + "\n")
 
     write_latest_srcrev(d, pkghistdir)
 
@@ -381,32 +392,55 @@ def write_pkghistory(pkginfo, d):
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

