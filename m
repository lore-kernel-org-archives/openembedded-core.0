Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2D2C61DB3
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15528.1672847239246825140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GRAmzawg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z16so16935299wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFKVS7G7a+yXqTyIpx7g+1ERBej2nN2g3k3O4GuhM40=;
        b=GRAmzawgIqup/jFtsoYvuQD+fjvqKXKvlbirK001/aJQG6v4RNi6kzkbmJL2i9UvS1
         OPGqAjfRtNvJ2qvcXbU787GbH9Dpf6CZsgpIGA2thIwemV8OeWhLE208VUc/TR9FB6Wc
         b203nXJcJ6+CGdh8TzREIzuq2NsJ1wd80Eq/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFKVS7G7a+yXqTyIpx7g+1ERBej2nN2g3k3O4GuhM40=;
        b=TEGcsO+GJUJxbNSXhJhPxz+kRcgy/nDPAeLe9MjbGvLQKmCpkHRGQ4nAB/pnzQpoUp
         kXU1VgWM5Tsyn6YWfuOp21ahD0KIrMSao7VgQZ9ZuEmDvoKTD+5++zNahOAXuZgLrKvX
         EVIIk61zhUSHzNTNuEkyAFtTn2rRtSFFlyXW5UBBKWOh7lhpV6sfcOCxQunZvGCadL+y
         08Dd6vZhdnZbbldtaQO2t8rOiJhzBY22Eq+WY8pCPhC8g+6J8gy0MJLfGhhcVmuv8CEx
         mJazMNzjNlFn8jowvGJKnyBfGIXHaGxlLJ4ADEtJhn1sgKlOQyXuQKsFU/gIK8xfj+IL
         Qovw==
X-Gm-Message-State: AFqh2kp2T1+WIZP/Rd9nax77oKtqpOnXUCHB8pV1fs/72feuGezpRQKR
	JJIrlYY7Bp++JnZLGh1Ku03jdTA4QDESx3gt
X-Google-Smtp-Source: AMrXdXvcv2Bosem92u7TQZRZ65PIF29cD3ImESKnv1zk0DuLGmwPKWRm5itTO4VMoCvNw8u1WA0JHQ==
X-Received: by 2002:a05:6000:1b0e:b0:28c:44b4:d8ec with SMTP id f14-20020a0560001b0e00b0028c44b4d8ecmr12848416wrz.7.1672847237474;
        Wed, 04 Jan 2023 07:47:17 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] package: Move pkgdata handling functions to oe.packagedata
Date: Wed,  4 Jan 2023 15:47:07 +0000
Message-Id: <20230104154714.1168535-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175491

To avoid reparsing the bbclass code all the time, move the functions
to the packagedata python function library code which is more efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass           | 61 +------------------
 meta/classes-global/package_deb.bbclass       |  2 +-
 meta/classes-global/package_ipk.bbclass       |  2 +-
 meta/classes-global/package_rpm.bbclass       |  4 +-
 meta/classes-recipe/image.bbclass             |  6 +-
 meta/classes-recipe/populate_sdk_base.bbclass |  8 +--
 meta/lib/oe/packagedata.py                    | 53 ++++++++++++++++
 7 files changed, 67 insertions(+), 69 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index a31224f243b..72e39f69149 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -566,61 +566,6 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(p) and not os.listdir(p):
                 os.rmdir(p)
 
-#
-# Package data handling routines
-#
-
-def get_package_mapping (pkg, basepkg, d, depversions=None):
-    import oe.packagedata
-
-    data = oe.packagedata.read_subpkgdata(pkg, d)
-    key = "PKG:%s" % pkg
-
-    if key in data:
-        if bb.data.inherits_class('allarch', d) and bb.data.inherits_class('packagegroup', d) and pkg != data[key]:
-            bb.error("An allarch packagegroup shouldn't depend on packages which are dynamically renamed (%s to %s)" % (pkg, data[key]))
-        # Have to avoid undoing the write_extra_pkgs(global_variants...)
-        if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
-            and data[key] == basepkg:
-            return pkg
-        if depversions == []:
-            # Avoid returning a mapping if the renamed package rprovides its original name
-            rprovkey = "RPROVIDES:%s" % pkg
-            if rprovkey in data:
-                if pkg in bb.utils.explode_dep_versions2(data[rprovkey]):
-                    bb.note("%s rprovides %s, not replacing the latter" % (data[key], pkg))
-                    return pkg
-        # Do map to rewritten package name
-        return data[key]
-
-    return pkg
-
-def get_package_additional_metadata (pkg_type, d):
-    base_key = "PACKAGE_ADD_METADATA"
-    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
-        if d.getVar(key, False) is None:
-            continue
-        d.setVarFlag(key, "type", "list")
-        if d.getVarFlag(key, "separator") is None:
-            d.setVarFlag(key, "separator", "\\n")
-        metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
-        return "\n".join(metadata_fields).strip()
-
-def runtime_mapping_rename (varname, pkg, d):
-    #bb.note("%s before: %s" % (varname, d.getVar(varname)))
-
-    new_depends = {}
-    deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
-    for depend, depversions in deps.items():
-        new_depend = get_package_mapping(depend, pkg, d, depversions)
-        if depend != new_depend:
-            bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
-        new_depends[new_depend] = deps[depend]
-
-    d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
-
-    #bb.note("%s after: %s" % (varname, d.getVar(varname)))
-
 #
 # Used by do_packagedata (and possibly other routines post do_package)
 #
@@ -2244,6 +2189,6 @@ def mapping_rename_hook(d):
     like debian.bbclass or manual PKG variable name changes
     """
     pkg = d.getVar("PKG")
-    runtime_mapping_rename("RDEPENDS", pkg, d)
-    runtime_mapping_rename("RRECOMMENDS", pkg, d)
-    runtime_mapping_rename("RSUGGESTS", pkg, d)
+    oe.packagedata.runtime_mapping_rename("RDEPENDS", pkg, d)
+    oe.packagedata.runtime_mapping_rename("RRECOMMENDS", pkg, d)
+    oe.packagedata.runtime_mapping_rename("RSUGGESTS", pkg, d)
diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index c3ae7d574dc..99e377b4551 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -169,7 +169,7 @@ def deb_write_pkg(pkg, d):
 
         # more fields
 
-        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
+        custom_fields_chunk = oe.packagedata.get_package_additional_metadata("deb", localdata)
         if custom_fields_chunk:
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 0207ea874b1..9b75f5cf1c3 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -162,7 +162,7 @@ def ipk_write_pkg(pkg, d):
             else:
                 ctrlfile.write(c % tuple(pullData(fs, localdata)))
 
-        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
+        custom_fields_chunk = oe.packagedata.get_package_additional_metadata("ipk", localdata)
         if custom_fields_chunk is not None:
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 7ba73f48e7d..16631688b10 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -299,7 +299,7 @@ python write_specfile () {
     srcmaintainer  = localdata.getVar('MAINTAINER')
     srchomepage    = localdata.getVar('HOMEPAGE')
     srcdescription = localdata.getVar('DESCRIPTION') or "."
-    srccustomtagschunk = get_package_additional_metadata("rpm", localdata)
+    srccustomtagschunk = oe.packagedata.get_package_additional_metadata("rpm", localdata)
 
     srcdepends     = d.getVar('DEPENDS')
     srcrdepends    = ""
@@ -355,7 +355,7 @@ python write_specfile () {
         splitlicense = (localdata.getVar('LICENSE') or "")
         splitsection = (localdata.getVar('SECTION') or "")
         splitdescription = (localdata.getVar('DESCRIPTION') or ".")
-        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
+        splitcustomtagschunk = oe.packagedata.get_package_additional_metadata("rpm", localdata)
 
         translate_vers('RDEPENDS', localdata)
         translate_vers('RRECOMMENDS', localdata)
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645503a..5980ca481a3 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -247,9 +247,9 @@ fakeroot python do_rootfs () {
     # otherwise, the multilib renaming could step in and squash any fixups that
     # may have occurred.
     pn = d.getVar('PN')
-    runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
-    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
-    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
+    oe.packagedata.runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
+    oe.packagedata.runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
+    oe.packagedata.runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
 
     # Generate the initial manifest
     create_manifest(d)
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 917619962c3..c1fabddcf21 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -184,13 +184,13 @@ def populate_sdk_common(d):
     d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", ' '.join(inst_attempt_pkgs))
 
     pn = d.getVar('PN')
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
+    oe.packagedata.runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
+    oe.packagedata.runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
 
     ld = bb.data.createCopy(d)
     ld.setVar("PKGDATA_DIR", "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}/pkgdata")
-    runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
-    runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
+    oe.packagedata.runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
+    oe.packagedata.runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
     d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK"))
     d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY"))
     
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index b2ed8b5a3d8..ff260f405ca 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -110,3 +110,56 @@ def recipename(pkg, d):
     """Return the recipe name for the given binary package name."""
 
     return pkgmap(d).get(pkg)
+
+def get_package_mapping(pkg, basepkg, d, depversions=None):
+    import oe.packagedata
+
+    data = oe.packagedata.read_subpkgdata(pkg, d)
+    key = "PKG:%s" % pkg
+
+    if key in data:
+        if bb.data.inherits_class('allarch', d) and bb.data.inherits_class('packagegroup', d) and pkg != data[key]:
+            bb.error("An allarch packagegroup shouldn't depend on packages which are dynamically renamed (%s to %s)" % (pkg, data[key]))
+        # Have to avoid undoing the write_extra_pkgs(global_variants...)
+        if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
+            and data[key] == basepkg:
+            return pkg
+        if depversions == []:
+            # Avoid returning a mapping if the renamed package rprovides its original name
+            rprovkey = "RPROVIDES:%s" % pkg
+            if rprovkey in data:
+                if pkg in bb.utils.explode_dep_versions2(data[rprovkey]):
+                    bb.note("%s rprovides %s, not replacing the latter" % (data[key], pkg))
+                    return pkg
+        # Do map to rewritten package name
+        return data[key]
+
+    return pkg
+
+def get_package_additional_metadata(pkg_type, d):
+    base_key = "PACKAGE_ADD_METADATA"
+    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
+        if d.getVar(key, False) is None:
+            continue
+        d.setVarFlag(key, "type", "list")
+        if d.getVarFlag(key, "separator") is None:
+            d.setVarFlag(key, "separator", "\\n")
+        metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
+        return "\n".join(metadata_fields).strip()
+
+def runtime_mapping_rename(varname, pkg, d):
+    #bb.note("%s before: %s" % (varname, d.getVar(varname)))
+
+    new_depends = {}
+    deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
+    for depend, depversions in deps.items():
+        new_depend = get_package_mapping(depend, pkg, d, depversions)
+        if depend != new_depend:
+            bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
+        new_depends[new_depend] = deps[depend]
+
+    d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
+
+    #bb.note("%s after: %s" % (varname, d.getVar(varname)))
+
+
-- 
2.37.2


