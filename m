Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.331.1586278739753014585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 09:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=c0cWE6ka;
 spf=pass (domain: blade-group.com, ip: 209.85.128.67, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f67.google.com with SMTP id a81so2584999wmf.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWloZLXy+Z5fIU+7wLoLB2gW9DZBZPbzEScY71IJ0jM=;
        b=c0cWE6ka/Sxjw7ruFiFSJtM1xBcj1z4yKTL/4uMXz/XL+1UW2feP7fd3sdy6arspJr
         VJcfI9Y5dbe16stZs8jFSHKjlRWeKt0BNg0tXvCHH6qdOvFYU6WT3fgDxycc9kmvipPb
         f/FZ9DZpW0YCZyi16iRz8RPNCy8XMx5GM980Zwiop+6VUtVBaxWiBkxyJwxHA7S2uCuV
         CiO46ULnR64ymki+5/BWthRd20DHsSE6cCAHng0mJMpQpdCGxZzbzUle0sKYgI0y3cfs
         LJFCmNQXJSFZxpbEJNr/R3sHdF3kJ7C7VNmBVvdMgVLDM5a9o+U6l+iypTTb3JbqvKql
         6TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWloZLXy+Z5fIU+7wLoLB2gW9DZBZPbzEScY71IJ0jM=;
        b=lrBrqtstA1X/LVLUpTnzFyqf9GOtjVouMDzo3Y2VMNE+MwJg/0DHKNbNrz1S7hGk6R
         xi27domqaGXqrm0x5HR2ghPNbyTAk0oba/Hh4ff+7bpU2QxCT3TyPNE+yRrTS585S9pA
         IX1Bmq57ifItUS7qELrpExTQU+PjzBq4lVBtMrs2EYTAMoKXzXG/rKghipRyWW9Amcf4
         BB1PECC+Mh7x0vGzjJBoOVxkF7WZmran/Ui6Ltcm2Tg5PoOHGWXNDfMrNW4MkxzfEgsH
         w6yDAFImD/VzuT4B4Y3lu4dqzB01mMweJ1l5jFF9fk9wMUwMMDQno9buD91Ebb6LaC/G
         3dkQ==
X-Gm-Message-State: AGi0Puamre7+EBQi6+UR9X3mE2kvRe3vlGOQ2oj/3/aIp1JK3w5dh2qA
	/A4TNHvpoYzo0lfdnwmWQ0NRLtLDxq/+Nw==
X-Google-Smtp-Source: APiQypL+otfFYWM+t492HBpIH0u4W1KPQV0W16dNErFNXKENsK0mIBazJ9CxQPUwBLlX7TdEi+4Lcw==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr196929wmb.123.1586278737927;
        Tue, 07 Apr 2020 09:58:57 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from yantop.local (91-170-159-152.subs.proxad.net. [91.170.159.152])
        by smtp.gmail.com with ESMTPSA id x8sm5399844wrn.27.2020.04.07.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 09:58:56 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] get_package_mapping: avoid returning a mapping if the renamed package rprovides its original name
Date: Tue,  7 Apr 2020 18:58:29 +0200
Message-Id: <20200407165829.3951246-1-yann@blade-group.com>
X-Mailer: git-send-email 2.26.0
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
---
 meta/classes/package.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6141a9582d..087beafc31 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -475,7 +475,7 @@ def copydebugsources(debugsrcdir, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, basepkg, d):
+def get_package_mapping (pkg, basepkg, d, depversions=None):
     import oe.packagedata
 
     data = oe.packagedata.read_subpkgdata(pkg, d)
@@ -485,6 +485,14 @@ def get_package_mapping (pkg, basepkg, d):
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
         if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
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
@@ -505,8 +513,10 @@ def runtime_mapping_rename (varname, pkg, d):
 
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
2.26.0

