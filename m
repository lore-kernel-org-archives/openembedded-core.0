Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.1720.1599498190940071236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dRyS5VEj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id o16so6981871pjr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YOOMt3yGBD9RhrJym4FXEJ3oSK86HNWPpvHApfics9E=;
        b=dRyS5VEjjvdpXWFymHIA/Eev9LyJUCh8AKKSguiPWJlr+sWBAOIvbDFZm0ckJQ6o6Y
         jDEwogXynFreP9WIV0kwHz+B7HIdIuxDfT6CpEvHPxQ8eRBxMmzRyIzv+Y9ReKRYUQL3
         M+CghHqhhTtT3puZy2RBKBbWh3uERo2nsKqfFb3SMtxVGdRmX4Ouj3lfjewMiGa78ISh
         wjSSp6+wLdIclAYkfKGFeN9WoeGilfFPUbuKG0SYFNmJeH42Dqr051zqU6l8BBVb0pfB
         rdOoYJ6yVAyq1MkxYPIl1Snko8md1PDYVwopcORPX5mZvrWBHq8oxpyhDPeUEWX54xHt
         F15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YOOMt3yGBD9RhrJym4FXEJ3oSK86HNWPpvHApfics9E=;
        b=mqlosLx5NWmaq3QEiyf/hK6MGpuDlXrxaI5aQC8HAcamAkW+LRi5l9Jk4VBxSZoyJ2
         vPR39ZD6oQieJIuz8+HQge4INBxLqB8UiQbhzLXhsQKXsaNytp+qA6uFxZHHMtBXeWZB
         s3iHyxLrdpJnU+vDEjTcGARrwE84GA38S0vwW9eayUGfogr4gLGVzVg+HLQP7kFG30SK
         Dy7VEIlkDueczKldqmByj3x9SCasbssb38jtIPCemS480igFy6ZHUyqWHMelEulaz/qY
         YP3xg+Br1C45D6nMnYraNPAoMe9yLulCjj8EYyx8uFVjA35PNsFm5yhra4dg7i5deDBz
         f21A==
X-Gm-Message-State: AOAM532a72XzLwr2NKiHe4WO7kXmke0eeEuTncmgYWDsdl9Nj5/Xqbfl
	LS3BrDMI/TJ1qiuqmPPmj1RZJ8RD+bRoCY8L
X-Google-Smtp-Source: ABdhPJz4VkLLFSZuYiziU/Etp1MK2p+rSLgnM7dZijrwGGzf0sFgXmVmNtc0C1n44ws+OtF8zg6vDA==
X-Received: by 2002:a17:90a:67c7:: with SMTP id g7mr230180pjm.42.1599498190008;
        Mon, 07 Sep 2020 10:03:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.03.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:03:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/18] package: get_package_mapping: avoid dependency mapping if renamed package provides original name
Date: Mon,  7 Sep 2020 07:02:17 -1000
Message-Id: <210ebed1e9c2285d6e457bf03d1f1a1f3ddc7fda.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 23ff4772fa..cc64ddffc3 100644
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
2.17.1

