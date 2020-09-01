Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.11851.1598963760426358816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 05:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEmwhI2I;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id i22so1391816eja.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ks/XJM+b6lPK6cXvfGh1Zp10jtJ1jCJa/n1w0jA1VhU=;
        b=EEmwhI2I2bsPGEridj7n/euVKfwG+DhkdwZB8CHdLDjQVz/DWP5b0Hz6VI7pGPwnuu
         bfRXr6tg5qoM542WC4ys5DfmcjgUWD8aDj2pSYb+372L6Os62kPnx2qQ4KOLyMnqdJuG
         RQpP/TqwleLoNoOQGqvcgHRebK+VGu8gEsQtOfOVC/OIxjvxRzL12y/pnPXf2T2EMuGe
         Izc/D66zI73AF4es5fYH3I5zeSWI/EymRJHCSfUbuVz++vhuLz6emfk37XxTkkHMmZ3j
         LfV+KHOzoAJXcefgKk7zwCRSSx1gM1u7n8+UGHgebvulLJvahJwX/LhUIaRYTpdkR4+Z
         4HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ks/XJM+b6lPK6cXvfGh1Zp10jtJ1jCJa/n1w0jA1VhU=;
        b=G7oHJRIGqnhQXDL+R7PWdbg32R/zj273AG+TKtlxL4VNi4DWx6cDQmnz4xxmw448sZ
         sijTW1TR4kUfmKRMHVAtMIf411Hpdq8S37B042uFjyXpMIEF1JaTbYSvDvBrS8sR7jiT
         nrDARVNN7fip333cwQoq8gfqKjFPzwZhgxwmgL4r2JCDXBZ7a4a2E4GlXCKqZAYa4piU
         wmNZja+1MPuWzf7NSbF3Wrt4cWATWtszExJfd83c/1X26fkwVoxhrUG3C9hAdP3TdQVg
         /+yuWUio36EVHMWBunPKqrqQ9Ecsj01BF9hcrib0GdhiHymQzJYR7kI9b0+uvTj7xI32
         naqg==
X-Gm-Message-State: AOAM5339htKYJY+L0D22M4gMyPgxdqxVNF6TH3r/WHcWWAT7g909JgH3
	JkM4nnfk9/ClLqHG8cJg5UinXIt3cgs=
X-Google-Smtp-Source: ABdhPJzQdF/O3r519g2KjLAwAEbWdElSToL8rZfEMsGKEL79VmcAIPsOlNPsnSGa/qJvd3RoOWJAtw==
X-Received: by 2002:a17:906:9443:: with SMTP id z3mr1364111ejx.156.1598963758542;
        Tue, 01 Sep 2020 05:35:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id oi24sm1105963ejb.69.2020.09.01.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 05:35:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] package: get_package_mapping: avoid dependency mapping if renamed package provides original name
Date: Tue,  1 Sep 2020 14:35:12 +0200
Message-Id: <20200901123513.29912-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Packages with a runtime dependency on a target package whose name is
changed by the PKG_* mechanism must rebuild when that mapping changes,
but we have no way of tracking this today, so
eg. packagegroup-machine-base ends up with a relationship on a
versioned kernel-image, and does not get rebuilt when that version
changes, leading to unsatisfiable dependency and reproducibility
issue.

OTOH there is no reason for the dependency to get rewritten if the
renamed package already has a RPROVIDES on the non-rewritten package
name, and if the dependency relationship is an unversionned one.  This
is what this patch prevents.

Note that this may not cover all cases of rewritten package names.

Notably I had to let the rewrite be done in the case of versionned
dependencies, as package managers usually can follow "Provides" in
such case; this includes many dependencies against shared-lib packages
renamed to their soname, and those at least are OK, since the
dependent recipe should explicitly depend on the target recipe.

(From OE-Core rev: 920beaaeef62b558e046f32c8ef0332250969ef1)

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 099d0459f3..686b412394 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -535,7 +535,7 @@ def copydebugsources(debugsrcdir, sources, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, basepkg, d):
+def get_package_mapping (pkg, basepkg, d, depversions=None):
     import oe.packagedata
 
     data = oe.packagedata.read_subpkgdata(pkg, d)
@@ -546,6 +546,14 @@ def get_package_mapping (pkg, basepkg, d):
         if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
             and data[key] == basepkg:
             return pkg
+        if depversions == []:
+            # Avoid returning a mapping if the renamed package rprovides its original name
+            rprovkey = "RPROVIDES_%s" % pkg
+            if rprovkey in data:
+                if pkg in bb.utils.explode_dep_versions2(data[rprovkey]):
+                    bb.note("%s rprovides %s, not replacing the latter" % (data[key], pkg))
+                    return pkg
+        # Do map to rewritten package name
         return data[key]
 
     return pkg
@@ -566,8 +574,10 @@ def runtime_mapping_rename (varname, pkg, d):
 
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
-    for depend in deps:
-        new_depend = get_package_mapping(depend, pkg, d)
+    for depend, depversions in deps.items():
+        new_depend = get_package_mapping(depend, pkg, d, depversions)
+        if depend != new_depend:
+            bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
         new_depends[new_depend] = deps[depend]
 
     d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
-- 
2.28.0

