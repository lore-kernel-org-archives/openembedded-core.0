Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.3493.1586289768719965571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 13:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=DOsvQ3EJ;
 spf=pass (domain: blade-group.com, ip: 209.85.221.67, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f67.google.com with SMTP id w10so5322274wrm.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wA9UPCzzM8BE7nckJYLOC8IpHr1doxuf2INGoaLtDVA=;
        b=DOsvQ3EJ1WXaga/sKX16d4RbxOLl7HLn4WZyNO3pLvvQll9iKk0uSPSHgLYwC9H+Xr
         kVZOKOrJN4+5iKLJr8dNByMHrv2d2ZWwStPh4jT6bMaSN7AdMKiG0AnINKKVcDAe0Huh
         TLmREn1OttZS7oL9LLz/YXgNqPmfpxZq9RGw2znZOwI563ZE+Tlni/19C2he1vSKVuW1
         fAcXP2zKk3SVyWDYMI6h/JfA7B05kgdSxR+JTd9lXWzjTETdTcUlStHJSbywXxZtGEHJ
         5K9qWayF58ks3p3nd4N4xmpZm4LR5PsaoAVGi6ZB/ri+WoOTwLzp/pZcPby1YGdCOu2D
         1oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wA9UPCzzM8BE7nckJYLOC8IpHr1doxuf2INGoaLtDVA=;
        b=o0z/IXvjpI8EVLDq+zipQiPCCuEuCAyIzukOiz3OmiOJANax9ROHgK0415TapM0sc3
         nPW5C4QW5E70+ZoTh6c1J4ucqZGyxVEtUq5AdOJdCxKuLq+ppuvWo59VL37pmYTIpZB3
         vdvV/wpoN563boEnj+U8517omXzGF2ffQNJu30PcLwSL4/G6ZCv7JK8vyotxBmTou1k6
         AeYWiGEbexKpGmcSB87bZpgSYIx8KC9HRPw4jlfUc72niD5g+SLsR3HQLz1S+GYbT+1J
         /qv51Pok77Mp+HlMVf8Xpvc5MX5b/sB7r0OSk70hlwBOS+vKzwkpgCKouAidYrOXddk2
         plwQ==
X-Gm-Message-State: AGi0PuYKXyxZVNIKdghdfmPz6Ly7YFXzcCHidcJQZ8sNz/H4PuUE+uFb
	zn0kSvRA7jc2aHK5XpwcicNqgqT3JSItAQ==
X-Google-Smtp-Source: APiQypIiwgfSSzKKMnRb6PdQ/KWet0uUi3huWuOob8MLRHLkjkA/LFNu9VZC2AzsN4411LxOO4MvJQ==
X-Received: by 2002:adf:e492:: with SMTP id i18mr4343573wrm.316.1586289766633;
        Tue, 07 Apr 2020 13:02:46 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from yantop.local (91-170-159-152.subs.proxad.net. [91.170.159.152])
        by smtp.gmail.com with ESMTPSA id w66sm3594162wma.38.2020.04.07.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 13:02:45 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2] get_package_mapping: avoid dependency mapping if renamed package provides original name
Date: Tue,  7 Apr 2020 22:02:35 +0200
Message-Id: <20200407200235.3974349-1-yann@blade-group.com>
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

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/classes/package.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d4c6a90e84..9516e7dc6f 100644
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
2.26.0

