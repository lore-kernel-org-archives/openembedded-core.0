Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D98DCA0EC0
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 22:24:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.35542.1754864643521260643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 15:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfyzhlkA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so18628235e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754864641; x=1755469441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xeHZl5/X1TOHtIJ0LJHOYyyGfQo3IQutmeKLUXIeSz8=;
        b=TfyzhlkAy/JKfRZcjUfN2rAYhcRFM8N2Ws3Hix802C4aLu1+EXx1DR64/pvDy+AJwM
         YXiWjLiyzTAoFTWhZHcnf859qzj+kECFCHqfhyvjPmTPkHo0r5ugaiJfqHhAp9z/wpvu
         kghcqx3ZdCsQIzMugSRtWg5NLJjaEZwlBthaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864641; x=1755469441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeHZl5/X1TOHtIJ0LJHOYyyGfQo3IQutmeKLUXIeSz8=;
        b=PCdDKXEaazmL52/yGwyJ3rCdygXd6oG1h0FjmzBCgqMBcFa4qhg2jEaGcvO0nxEW/J
         knLzcS1sHkrluYHLzFvrx85wVc3fmRU45kqqUzmU2l+NBPWt4/eF5AvqBMzQR0MCUkrz
         w4/Vkk7676ljMuka8MC8EDwtaw2HFhIImCWR6JyJb+kAyLE8jpxgKGcTcU2Ic7SdqDrV
         sy/x9ghNIaP5ZvxZ+b3ESKDWgqyyP7jVisPMW/A5ZKUlnrZ/f9GrVSAdpz06BNfIeDDY
         lnsp+lGrovDG7qN6aUfjXqV3hNDtNAFI8RCzBMqwGm0VecM3wQP7O86gmaEjjlvdB7Y4
         DR2w==
X-Gm-Message-State: AOJu0YwUk/DqSN2OrGe2G0RJnzMyD52K0UyMppXgZcgTqy3IwJbkN9Rz
	Q8ADYc1QPWaEut92Ip8l4VJrq8sOThZ2e3Hd5iz0nRzsh+6mUNlaxGE7a9BjykWygLhS/GPfk3P
	HyePL
X-Gm-Gg: ASbGncv2ORPwSWkVNKlknRM49CQ1/kdYbdTD/x7jTE1iwYuK9xgwZxBPZE8wn7lwt2E
	80zGTo6y3QlfnPQ+0ely99SjODc7BegVVtGlNKg/TYXPgQjOe8UWUCn8Nqzu8MMfTtle23zYSkj
	SNVLewD/Sy8tfPBHosjdM/VJxSs51ShtbWxlEHE6LSVU64Ui07QZSIyUs7ybLjkTyDSbnFjczUG
	URnRvQmoas5PZ0MfV+rRo2QvVAM0ERD6Moqq3CHGzrSFHsp0EWZfJmvjKpJIajg1kOhBoeDf+y0
	L4xSmy4/Lccxm7n8BFBM7uMIXoNIT/ds51dFYytk31x4l/toOqBgxtx/IBC5AmYUhdSvh/qXGd9
	0iK+XOQUpYColZ3Py1rZjhcRf4YGsT75YZrEmoeqyoWr9p1shDzA=
X-Google-Smtp-Source: AGHT+IHn0YMj5fCUA58cC434yq1HqugRRHQ4bXxMsPLmNzmG0CeH4mYiqFB9OX6fz/7UG5VCLDc5+w==
X-Received: by 2002:a05:6000:24c6:b0:3b8:12a6:36b8 with SMTP id ffacd0b85a97d-3b900b50786mr8510653f8f.46.1754864641134;
        Sun, 10 Aug 2025 15:24:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2db4:de3e:1e1f:36bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459d712c386sm312361685e9.23.2025.08.10.15.23.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:23:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/lib: Switch classextend to use new filter API
Date: Sun, 10 Aug 2025 23:23:58 +0100
Message-ID: <20250810222358.2486792-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 22:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221704

Currently, class extensions are implmented using shadow variables and
access indirection which is horribly ineffient and ugly.

Switch to using the new bitbake filter API, which allows a translation
of the variable before the expanded value is returned. This allows us
to drop the shadow variable accesses. It also avoids the need to iterate
PACKAGES and make many variable changes since a filter against RDEPENDS
applies to RDEPENDS:${PN} and all of it's other overridden values.

Since data expansion happens at access, it also avoids many of the race
conditions this code has tranditionally been plagued with.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass            |  39 +--
 meta/classes-recipe/nativesdk.bbclass         |  11 +-
 meta/classes-recipe/toolchain-scripts.bbclass |   4 +-
 meta/classes/multilib.bbclass                 |  33 +--
 meta/classes/multilib_global.bbclass          |  19 +-
 meta/lib/oe/__init__.py                       |   2 +-
 meta/lib/oe/classextend.py                    | 255 ++++++++----------
 7 files changed, 160 insertions(+), 203 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 625975a6942..7d1fe343fa0 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -138,38 +138,18 @@ python native_virtclass_handler () {
     if "native" not in classextend:
         return
 
-    def map_dependencies(varname, d, suffix = "", selfref=True, regex=False):
-        if suffix:
-            varname = varname + ":" + suffix
-        deps = d.getVar(varname)
-        if not deps:
-            return
-        deps = bb.utils.explode_deps(deps)
-        newdeps = []
-        for dep in deps:
-            if regex and dep.startswith("^") and dep.endswith("$"):
-                newdeps.append(dep[:-1].replace(pn, bpn) + "-native$")
-            elif dep == pn:
-                if not selfref:
-                    continue
-                newdeps.append(dep)
-            elif "-cross-" in dep:
-                newdeps.append(dep.replace("-cross", "-native"))
-            elif not dep.endswith("-native"):
-                # Replace ${PN} with ${BPN} in the dependency to make sure
-                # dependencies on, e.g., ${PN}-foo become ${BPN}-foo-native
-                # rather than ${BPN}-native-foo-native.
-                newdeps.append(dep.replace(pn, bpn) + "-native")
-            else:
-                newdeps.append(dep)
-        output_varname = varname
+    def map_dependencies(varname, d, suffix, selfref=True, regex=False):
+        varname = varname + ":" + suffix
         # Handle ${PN}-xxx -> ${BPN}-xxx-native
         if suffix != "${PN}" and "${PN}" in suffix:
             output_varname = varname.replace("${PN}", "${BPN}") + "-native"
             d.renameVar(varname, output_varname)
-        d.setVar(output_varname, " ".join(newdeps))
 
-    map_dependencies("DEPENDS", e.data, selfref=False)
+    d.setVarFilter("DEPENDS", "native_filter(val, '" + pn + "', '" + bpn + "', selfref=False)")
+
+    for varname in ["RDEPENDS", "RRECOMMENDS", "RSUGGESTS", "RPROVIDES", "RREPLACES"]:
+        d.setVarFilter(varname, "native_filter(val, '" + pn + "', '" + bpn + "')")
+
     # We need to handle things like ${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}
     # and not pass ${PN}-test since in the native case it would be ignored. This does mean we ignore
     # anonymous python derived PACKAGES entries.
@@ -181,8 +161,9 @@ python native_virtclass_handler () {
         map_dependencies("RSUGGESTS", e.data, pkg)
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
-    map_dependencies("PACKAGES", e.data)
-    map_dependencies("PACKAGES_DYNAMIC", e.data, regex=True)
+
+    d.setVarFilter("PACKAGES", "native_filter(val, '" + pn + "', '" + bpn + "')")
+    d.setVarFilter("PACKAGES_DYNAMIC", "native_filter(val, '" + pn + "', '" + bpn + "', regex=True)")
 
     provides = e.data.getVar("PROVIDES")
     nprovides = []
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 7ecb4c12c1f..9838d5a54b7 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -99,15 +99,14 @@ python () {
 
     import oe.classextend
 
-    clsextend = oe.classextend.NativesdkClassExtender("nativesdk", d)
-    clsextend.rename_packages()
+    clsextend = oe.classextend.ClassExtender("nativesdk", [], d)
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
-    clsextend.map_depends_variable("DEPENDS")
-    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
+    clsextend.set_filter("DEPENDS", deps=True)
+    clsextend.set_filter("PACKAGE_WRITE_DEPS", deps=False)
     clsextend.map_packagevars()
-    clsextend.map_variable("PROVIDES")
-    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
+    clsextend.set_filter("PROVIDES", deps=False)
+
     d.setVar("LIBCEXTENSION", "")
     d.setVar("ABIEXTENSION", "")
 }
diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5874a48af84..5d28df845b8 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -238,11 +238,11 @@ toolchain_create_sdk_siteconfig () {
 python __anonymous () {
     import oe.classextend
     deps = ""
+    prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
         deps += " %s:do_populate_sysroot" % dep
         for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
-            clsextend = oe.classextend.ClassExtender(variant, d)
-            newdep = clsextend.extend_name(dep)
+            newdep = oe.classextend.add_suffix(dep, variant, prefixes)
             deps += " %s:do_populate_sysroot" % newdep
     d.appendVarFlag('do_configure', 'depends', deps)
 }
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b959bbd93c0..677dbc854a1 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -112,11 +112,11 @@ python __anonymous () {
         variant = d.getVar("BBEXTENDVARIANT")
         import oe.classextend
 
-        clsextend = oe.classextend.ClassExtender(variant, d)
-
-        clsextend.map_depends_variable("PACKAGE_INSTALL")
-        clsextend.map_depends_variable("LINGUAS_INSTALL")
-        clsextend.map_depends_variable("RDEPENDS")
+        prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
+        clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
+        clsextend.set_filter("PACKAGE_INSTALL", deps=False)
+        clsextend.set_filter("LINGUAS_INSTALL", deps=False)
+        clsextend.set_filter("RDEPENDS", deps=True)
         pinstall = d.getVar("LINGUAS_INSTALL") + " " + d.getVar("PACKAGE_INSTALL")
         d.setVar("PACKAGE_INSTALL", pinstall)
         d.setVar("LINGUAS_INSTALL", "")
@@ -136,27 +136,28 @@ python multilib_virtclass_handler_postkeyexp () {
 
     import oe.classextend
 
-    clsextend = oe.classextend.ClassExtender(variant, d)
-
     if bb.data.inherits_class('image', d):
         return
 
-    clsextend.map_depends_variable("DEPENDS")
-    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
-    clsextend.map_variable("PROVIDES")
+    prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
+    clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
+
+    clsextend.set_filter("DEPENDS", deps=True)
+    clsextend.set_filter("PACKAGE_WRITE_DEPS", deps=False)
+
+    clsextend.set_filter("PROVIDES", deps=False)
 
     if bb.data.inherits_class('cross-canadian', d):
         return
 
-    clsextend.rename_packages()
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_packagevars()
-    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
-    clsextend.map_variable("INITSCRIPT_PACKAGES")
-    clsextend.map_variable("USERADD_PACKAGES")
-    clsextend.map_variable("SYSTEMD_PACKAGES")
-    clsextend.map_variable("UPDATERCPN")
+
+    clsextend.set_filter("INITSCRIPT_PACKAGES", deps=False)
+    clsextend.set_filter("USERADD_PACKAGES", deps=False)
+    clsextend.set_filter("SYSTEMD_PACKAGES", deps=False)
+    clsextend.set_filter("UPDATERCPN", deps=False)
 
     reset_alternative_priority(d)
 }
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index c1d6de100c9..d9372d9ed1a 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -207,30 +207,25 @@ python multilib_virtclass_handler_global () {
 
             variants = (d.getVar("MULTILIB_VARIANTS") or "").split()
 
-            import oe.classextend
-            clsextends = []
-            for variant in variants:
-                clsextends.append(oe.classextend.ClassExtender(variant, localdata))
-
             # Process PROVIDES
             origprovs = provs = localdata.getVar("PROVIDES") or ""
-            for clsextend in clsextends:
-                provs = provs + " " + clsextend.map_variable("PROVIDES", setvar=False)
+            for variant in variants:
+                provs = provs + " " + oe.classextend.suffix_filter_deps(localdata.getVar("PROVIDES") or "", variant, variants)
             d.setVar("PROVIDES", provs)
 
             # Process RPROVIDES
             origrprovs = rprovs = localdata.getVar("RPROVIDES") or ""
-            for clsextend in clsextends:
-                rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES", setvar=False)
+            for variant in variants:
+                rprovs = rprovs + " " + oe.classextend.suffix_filter_deps(localdata.getVar("RPROVIDES") or "", variant, variants)
             if rprovs.strip():
                 d.setVar("RPROVIDES", rprovs)
 
             # Process RPROVIDES:${PN}...
             for pkg in (d.getVar("PACKAGES") or "").split():
                 origrprovs = rprovs = localdata.getVar("RPROVIDES:%s" % pkg) or ""
-                for clsextend in clsextends:
-                    rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES:%s" % pkg, setvar=False)
-                    rprovs = rprovs + " " + clsextend.extname + "-" + pkg
+                for variant in variants:
+                    rprovs = rprovs + " " + oe.classextend.suffix_filter_deps(localdata.getVar("RPROVIDES:%s" % pkg) or "", variant, variants)
+                    rprovs = rprovs + " " + variant + "-" + pkg
                 d.setVar("RPROVIDES:%s" % pkg, rprovs)
 }
 
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 73de774266b..9e4134c483a 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -12,4 +12,4 @@ __path__ = extend_path(__path__, __name__)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
-             "cve_check", "tune"]
+             "cve_check", "tune", "classextend"]
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 8ae5d3b7152..ddca10dee54 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -5,155 +5,136 @@
 #
 
 import collections
+import bb.filter
+
+@bb.filter.filter_proc()
+def native_filter(val, pn, bpn, regex=False, selfref=True):
+    deps = val
+    if not deps:
+        return
+    deps = bb.utils.explode_deps(deps)
+    newdeps = []
+    for dep in deps:
+        if regex and dep.startswith("^") and dep.endswith("$"):
+            if not dep.endswith("-native$"):
+                newdeps.append(dep[:-1].replace(pn, bpn) + "-native$")
+            else:
+                newdeps.append(dep)
+        elif dep == pn:
+            if not selfref:
+                continue
+            newdeps.append(dep)
+        elif "-cross-" in dep:
+            newdeps.append(dep.replace("-cross", "-native"))
+        elif not dep.endswith("-native"):
+            # Replace ${PN} with ${BPN} in the dependency to make sure
+            # dependencies on, e.g., ${PN}-foo become ${BPN}-foo-native
+            # rather than ${BPN}-native-foo-native.
+            newdeps.append(dep.replace(pn, bpn) + "-native")
+        else:
+            newdeps.append(dep)
+    return " ".join(newdeps)
+
+def add_suffix(val, extname, prefixes):
+    if val.startswith(extname + "-"):
+        return val
+    if val.endswith(("-native", "-native-runtime")) or ('nativesdk-' in val) or ('-cross-' in val) or ('-crosssdk-' in val):
+        return val
+    # If it starts with a known prefix (e.g. multilibs), just pass it through
+    for prefix in prefixes:
+        if val.startswith(prefix + "-"):
+            return val
+    if val.startswith("kernel-") or val == "virtual/kernel":
+        return val
+    if val.startswith("rtld"):
+        return val
+    if val.endswith("-crosssdk"):
+        return val
+    if val.endswith("-" + extname):
+        val = val.replace("-" + extname, "")
+    if val.startswith("virtual/"):
+        # Assume large numbers of dashes means a triplet is present and we don't need to convert
+        if val.count("-") >= 3 and val.endswith(("-go",)):
+            return val
+        subs = val.split("/", 1)[1]
+        if not subs.startswith(extname):
+            return "virtual/" + extname + "-" + subs
+        return val
+    if val.startswith("/") or (val.startswith("${") and val.endswith("}")):
+        return val
+    if not val.startswith(extname):
+        return extname + "-" + val
+    return val
+
+def get_package_mappings(packages, extname):
+    pkgs_mapping = []
+    for pkg in packages.split():
+        if pkg.startswith(extname):
+           pkgs_mapping.append([pkg.split(extname + "-")[1], pkg])
+           continue
+        pkgs_mapping.append([pkg, add_suffix(pkg, extname, [])])
+    return pkgs_mapping
+
+@bb.filter.filter_proc()
+def package_suffix_filter(val, extname):
+    pkgs_mapping = get_package_mappings(val, extname)
+    return " ".join([row[1] for row in pkgs_mapping])
+
+@bb.filter.filter_proc()
+def suffix_filter(val, extname, prefixes):
+    newdeps = []
+    for dep in val.split():
+        newdeps.append(add_suffix(dep, extname, prefixes))
+    return " ".join(newdeps)
+
+@bb.filter.filter_proc()
+def suffix_filter_regex(val, extname, prefixes):
+    newvar = []
+    for v in val.split():
+        if v.startswith("^" + extname):
+            newvar.append(v)
+        elif v.startswith("^"):
+            newvar.append("^" + extname + "-" + v[1:])
+        else:
+            newvar.append(add_suffix(v, extname, prefixes))
+    return " ".join(newvar)
 
-def get_packages(d):
-    pkgs = d.getVar("PACKAGES_NONML")
-    extcls = d.getVar("EXTENDERCLASS")
-    return extcls.rename_packages_internal(pkgs)
-
-def get_depends(varprefix, d):
-    extcls = d.getVar("EXTENDERCLASS")
-    return extcls.map_depends_variable(varprefix + "_NONML")
+@bb.filter.filter_proc()
+def suffix_filter_deps(val, extname, prefixes):
+    deps = bb.utils.explode_dep_versions2(val)
+    newdeps = collections.OrderedDict()
+    for dep in deps:
+        newdeps[add_suffix(dep, extname, prefixes)] = deps[dep]
+    return bb.utils.join_deps(newdeps, False)
 
 class ClassExtender(object):
-    def __init__(self, extname, d):
+    def __init__(self, extname, prefixes, d):
         self.extname = extname
         self.d = d
-        self.pkgs_mapping = []
-        self.d.setVar("EXTENDERCLASS", self)
-
-    def extend_name(self, name):
-        if name.startswith("kernel-") or name == "virtual/kernel":
-            return name
-        if name.startswith("rtld"):
-            return name
-        if name.endswith("-crosssdk"):
-            return name
-        if name.endswith("-" + self.extname):
-            name = name.replace("-" + self.extname, "")
-        if name.startswith("virtual/"):
-            # Assume large numbers of dashes means a triplet is present and we don't need to convert
-            if name.count("-") >= 3 and name.endswith(("-go",)):
-                return name
-            subs = name.split("/", 1)[1]
-            if not subs.startswith(self.extname):
-                return "virtual/" + self.extname + "-" + subs
-            return name
-        if name.startswith("/") or (name.startswith("${") and name.endswith("}")):
-            return name
-        if not name.startswith(self.extname):
-            return self.extname + "-" + name
-        return name
-
-    def map_variable(self, varname, setvar = True):
-        var = self.d.getVar(varname)
-        if not var:
-            return ""
-        var = var.split()
-        newvar = []
-        for v in var:
-            newvar.append(self.extend_name(v))
-        newdata =  " ".join(newvar)
-        if setvar:
-            self.d.setVar(varname, newdata)
-        return newdata
-
-    def map_regexp_variable(self, varname, setvar = True):
-        var = self.d.getVar(varname)
-        if not var:
-            return ""
-        var = var.split()
-        newvar = []
-        for v in var:
-            if v.startswith("^" + self.extname):
-                newvar.append(v)
-            elif v.startswith("^"):
-                newvar.append("^" + self.extname + "-" + v[1:])
-            else:
-                newvar.append(self.extend_name(v))
-        newdata =  " ".join(newvar)
-        if setvar:
-            self.d.setVar(varname, newdata)
-        return newdata
+        self.prefixes = prefixes
 
-    def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep) or ('-crosssdk-' in dep):
-            return dep
+    def set_filter(self, var, deps):
+        if deps:
+            self.d.setVarFilter(var, "suffix_filter_deps(val, '" + self.extname + "', " + str(self.prefixes) + ")")
         else:
-            # Do not extend for that already have multilib prefix
-            var = self.d.getVar("MULTILIB_VARIANTS")
-            if var:
-                var = var.split()
-                for v in var:
-                    if dep.startswith(v):
-                        return dep
-            return self.extend_name(dep)
-
-    def map_depends_variable(self, varname, suffix = ""):
-        # We need to preserve EXTENDPKGV so it can be expanded correctly later
-        if suffix:
-            varname = varname + ":" + suffix
-        orig = self.d.getVar("EXTENDPKGV", False)
-        self.d.setVar("EXTENDPKGV", "EXTENDPKGV")
-        deps = self.d.getVar(varname)
-        if not deps:
-            self.d.setVar("EXTENDPKGV", orig)
-            return
-        deps = bb.utils.explode_dep_versions2(deps)
-        newdeps = collections.OrderedDict()
-        for dep in deps:
-            newdeps[self.map_depends(dep)] = deps[dep]
-
-        if not varname.endswith("_NONML"):
-            self.d.renameVar(varname, varname + "_NONML")
-            self.d.setVar(varname, "${@oe.classextend.get_depends('%s', d)}" % varname)
-            self.d.appendVarFlag(varname, "vardeps", " " + varname + "_NONML")
-        ret = bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}")
-        self.d.setVar("EXTENDPKGV", orig)
-        return ret
+            self.d.setVarFilter(var, "suffix_filter(val, '" + self.extname + "', " + str(self.prefixes) + ")")
 
     def map_packagevars(self):
-        for pkg in (self.d.getVar("PACKAGES").split() + [""]):
-            self.map_depends_variable("RDEPENDS", pkg)
-            self.map_depends_variable("RRECOMMENDS", pkg)
-            self.map_depends_variable("RSUGGESTS", pkg)
-            self.map_depends_variable("RPROVIDES", pkg)
-            self.map_depends_variable("RREPLACES", pkg)
-            self.map_depends_variable("RCONFLICTS", pkg)
-            self.map_depends_variable("PKG", pkg)
-
-    def rename_packages(self):
-        for pkg in (self.d.getVar("PACKAGES") or "").split():
-            if pkg.startswith(self.extname):
-               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
-               continue
-            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
-
-        self.d.renameVar("PACKAGES", "PACKAGES_NONML")
-        self.d.setVar("PACKAGES", "${@oe.classextend.get_packages(d)}")
-
-    def rename_packages_internal(self, pkgs):
-        self.pkgs_mapping = []
-        for pkg in (self.d.expand(pkgs) or "").split():
-            if pkg.startswith(self.extname):
-               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
-               continue
-            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
-
-        return " ".join([row[1] for row in self.pkgs_mapping])
+        self.set_filter("RDEPENDS", deps=True)
+        self.set_filter("RRECOMMENDS", deps=True)
+        self.set_filter("RSUGGESTS", deps=True)
+        self.set_filter("RPROVIDES", deps=True)
+        self.set_filter("RREPLACES", deps=True)
+        self.set_filter("RCONFLICTS", deps=True)
+        self.set_filter("PKG", deps=True)
 
     def rename_package_variables(self, variables):
-        for pkg_mapping in self.pkgs_mapping:
+        pkgs_mapping = get_package_mappings(self.d.getVar('PACKAGES'), self.extname)
+        self.d.setVarFilter('PACKAGES', "package_suffix_filter(val, '" + self.extname + "')")
+        self.d.setVarFilter('PACKAGES_DYNAMIC', "suffix_filter_regex(val, '" + self.extname + "', " + str(self.prefixes) + ")")
+
+        for pkg_mapping in pkgs_mapping:
             if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
                 continue
             for subs in variables:
                 self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%s" % (subs, pkg_mapping[1]))
-
-class NativesdkClassExtender(ClassExtender):
-    def map_depends(self, dep):
-        if dep.startswith(self.extname):
-            return dep
-        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):
-            return dep
-        else:
-            return self.extend_name(dep)

