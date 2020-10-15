Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.13189.1602771333498882211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a8Sq2XS2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id h4so2154867pjk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oDbF/ivg8v3RpThuiP369WvFV5Cw1WSHq05+vBX5Occ=;
        b=a8Sq2XS2Z4oo0nfg+iKNbxXrzVa5Ra3jM1U5WV1SlYTLX4ynEzK7tyhU98wPmFZi9/
         Ifxg1z7cnQ9lx/ocGCyGzvXswCLVOw9EU1HGGnPX2x6Ei5T7NrL4eNbyhXABr9zmv3Yb
         +VDurdVmOJGOMJWslDERGGiSXnwIRZh1xea/GVGooMn+SbIfka0/5/cWLpjwl+zaB583
         Dib9nb9rNW7VSTdTtJZfnrNLpxe+EXt6amum68mlI2DTnWHPk7K2f5TkCxHUI3Cjlck2
         VE/3YTRaGmGsKQO/o9Y5HmybTh0Uz0Z+2QWUTA/4zCPsW2Z1w6KUhGVXJBAuN+yFmW7p
         ncMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oDbF/ivg8v3RpThuiP369WvFV5Cw1WSHq05+vBX5Occ=;
        b=Ct+ix1CNRtrEi3LLce+KIpAkBKzfupOd82eXzPQXSbKDFVfHyfMY6NziGaZcL/hWB9
         1ozu2CW0HC1PfNee0lTo0rTpB27j+kfJAR2hWeDVipaWX2zq1K4n9tw+FSVQfzNOb6Mc
         NQ2O1RaGPMI38ZS4ky4s3UTqigFHK+WbLPy1XMBR9vPZ2GfyROund3Ih/QVkp+sWO1oI
         ygz9UEMl5F1tgMLtW7wlBoxBSKRnY1xdk8Emz7dLWtzmMev1DCGKTvaYntJ7W1ymR3nA
         QeI7mcjHz3x+RjuAkvhuDpG4cWSBqeETQotHpDaxcN/tipQqxVDMEe/BCXzps38w13vY
         9axQ==
X-Gm-Message-State: AOAM5321eZhGE2CTboo8XkhG+omivGUezxzpgHdtGGmBDkvVzbULHtnG
	ePioMAa7kXcqsN3V1M8VbawqgS4YVJNfIcCG
X-Google-Smtp-Source: ABdhPJzbeVQ6wfcWmoIa+vDuG2ai0EhxMF82Ti9Uay51BDTATa8hJ61zW3kNGDC1yPI8BlAn0av0Pg==
X-Received: by 2002:a17:90a:c204:: with SMTP id e4mr4502114pjt.209.1602771332357;
        Thu, 15 Oct 2020 07:15:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] Revert "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
Date: Thu, 15 Oct 2020 04:15:05 -1000
Message-Id: <aa937d8adc28ea8c278531ebff353d8248f155d7.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

Breaks wireguard

This reverts commit 210ebed1e9c2285d6e457bf03d1f1a1f3ddc7fda.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc64ddffc3..23ff4772fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -535,7 +535,7 @@ def copydebugsources(debugsrcdir, sources, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, basepkg, d, depversions=None):
+def get_package_mapping (pkg, basepkg, d):
     import oe.packagedata
 
     data = oe.packagedata.read_subpkgdata(pkg, d)
@@ -546,14 +546,6 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
         if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
             and data[key] == basepkg:
             return pkg
-        if depversions == []:
-            # Avoid returning a mapping if the renamed package rprovides its original name
-            rprovkey = "RPROVIDES_%s" % pkg
-            if rprovkey in data:
-                if pkg in bb.utils.explode_dep_versions2(data[rprovkey]):
-                    bb.note("%s rprovides %s, not replacing the latter" % (data[key], pkg))
-                    return pkg
-        # Do map to rewritten package name
         return data[key]
 
     return pkg
@@ -574,10 +566,8 @@ def runtime_mapping_rename (varname, pkg, d):
 
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
-    for depend, depversions in deps.items():
-        new_depend = get_package_mapping(depend, pkg, d, depversions)
-        if depend != new_depend:
-            bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
+    for depend in deps:
+        new_depend = get_package_mapping(depend, pkg, d)
         new_depends[new_depend] = deps[depend]
 
     d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
-- 
2.17.1

