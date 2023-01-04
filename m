Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CCCC53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.15377.1672847240031413440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9dXw5Ue;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d9so4843652wrp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZurcP8raGMksJL4jCEZMb6wMDTuvWVtIv6qPB8G1sE=;
        b=K9dXw5UejJ8WOhCyhHBcX9Vu0NAgTrT+MaK+xnqgwQQNmxn4ghFShFOxSg78ZbyFxy
         ovt9JBRAxLIx4zMbwIjBYPphqYZfFUqh1c5QqSCYACqnrosNwOQJrZAIZFijEvW6otQ5
         w6B3iq/+DRf41pT5xhQ9gHl+M268KhfBfZ85I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZurcP8raGMksJL4jCEZMb6wMDTuvWVtIv6qPB8G1sE=;
        b=t1mBK+nGSM1nteFzUorrg6bT//0d1QpPeCxspea87JiQUfgQmxCVdvz75CBE2VLBx5
         FafIDEdbAvxS0AvXinCcHrvag2M/EPuTLS1IUOmYPyUx1nDibUO5bBK2tzgelsclpaSt
         LvNs3eVXRl1vXUCm1zuGVY0SvchIcdyDy7q0+Q29HQ+l6IRm3gUuAOBuU/z/WVmWcT+z
         NLW5V2xYqDgMK+MG9yQFVFjWcLnmJ5jn6rUIi3vPayPNXFUsy5XGFDcfFX03iAhWQWad
         mxX7AG1rkkMRZ/X7lZRsTfw6BBwiZ9qqBg/bDlK3A+Ee7tGUVA9OcLV8XyuSFFxlRmub
         jJIg==
X-Gm-Message-State: AFqh2kr7d/GyCcjAnlSRHQFnu0yXqPcSCqisXAngmD1EV3CEpsm5DoWa
	BAP4b/ohuMxTA7Y1ZIHn6nJ7wVqe23WDdQ1D
X-Google-Smtp-Source: AMrXdXv5JLT4nT+WCrs9lQXHf90FJf2SIFzKDiHqYvkKNvOvVuT9uZVyjWvnt/EGbFwJ2MJavbMIWA==
X-Received: by 2002:a05:6000:136b:b0:27f:85ce:bc9e with SMTP id q11-20020a056000136b00b0027f85cebc9emr24758543wrz.24.1672847238199;
        Wed, 04 Jan 2023 07:47:18 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] package: Move emit_pkgdata to packagedata.py
Date: Wed,  4 Jan 2023 15:47:08 +0000
Message-Id: <20230104154714.1168535-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175492

Move one of the PACKAGEFUNCS from the package bbclass to packagedata
library code for parsing efficiency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 179 +---------------------------
 meta/conf/bitbake.conf              |   1 +
 meta/lib/oe/packagedata.py          | 178 +++++++++++++++++++++++++++
 3 files changed, 181 insertions(+), 177 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 72e39f69149..389c8578040 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -1232,185 +1232,10 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
-    from glob import glob
-    import json
-    import bb.compress.zstd
-
-    def process_postinst_on_target(pkg, mlprefix):
-        pkgval = d.getVar('PKG:%s' % pkg)
-        if pkgval is None:
-            pkgval = pkg
-
-        defer_fragment = """
-if [ -n "$D" ]; then
-    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot %s mlprefix=%s
-    exit 0
-fi
-""" % (pkgval, mlprefix)
-
-        postinst = d.getVar('pkg_postinst:%s' % pkg)
-        postinst_ontarget = d.getVar('pkg_postinst_ontarget:%s' % pkg)
-
-        if postinst_ontarget:
-            bb.debug(1, 'adding deferred pkg_postinst_ontarget() to pkg_postinst() for %s' % pkg)
-            if not postinst:
-                postinst = '#!/bin/sh\n'
-            postinst += defer_fragment
-            postinst += postinst_ontarget
-            d.setVar('pkg_postinst:%s' % pkg, postinst)
-
-    def add_set_e_to_scriptlets(pkg):
-        for scriptlet_name in ('pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'):
-            scriptlet = d.getVar('%s:%s' % (scriptlet_name, pkg))
-            if scriptlet:
-                scriptlet_split = scriptlet.split('\n')
-                if scriptlet_split[0].startswith("#!"):
-                    scriptlet = scriptlet_split[0] + "\nset -e\n" + "\n".join(scriptlet_split[1:])
-                else:
-                    scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
-            d.setVar('%s:%s' % (scriptlet_name, pkg), scriptlet)
-
-    def write_if_exists(f, pkg, var):
-        def encode(str):
-            import codecs
-            c = codecs.getencoder("unicode_escape")
-            return c(str)[0].decode("latin1")
-
-        val = d.getVar('%s:%s' % (var, pkg))
-        if val:
-            f.write('%s:%s: %s\n' % (var, pkg, encode(val)))
-            return val
-        val = d.getVar('%s' % (var))
-        if val:
-            f.write('%s: %s\n' % (var, encode(val)))
-        return val
-
-    def write_extra_pkgs(variants, pn, packages, pkgdatadir):
-        for variant in variants:
-            with open("%s/%s-%s" % (pkgdatadir, variant, pn), 'w') as fd:
-                fd.write("PACKAGES: %s\n" % ' '.join(
-                            map(lambda pkg: '%s-%s' % (variant, pkg), packages.split())))
-
-    def write_extra_runtime_pkgs(variants, packages, pkgdatadir):
-        for variant in variants:
-            for pkg in packages.split():
-                ml_pkg = "%s-%s" % (variant, pkg)
-                subdata_file = "%s/runtime/%s" % (pkgdatadir, ml_pkg)
-                with open(subdata_file, 'w') as fd:
-                    fd.write("PKG:%s: %s" % (ml_pkg, pkg))
-
-    packages = d.getVar('PACKAGES')
-    pkgdest = d.getVar('PKGDEST')
-    pkgdatadir = d.getVar('PKGDESTWORK')
-
-    data_file = pkgdatadir + d.expand("/${PN}")
-    with open(data_file, 'w') as fd:
-        fd.write("PACKAGES: %s\n" % packages)
-
-    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
-
-    pn = d.getVar('PN')
-    global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
-    variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
-
-    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
-        write_extra_pkgs(variants, pn, packages, pkgdatadir)
-
-    if bb.data.inherits_class('allarch', d) and not variants \
-        and not bb.data.inherits_class('packagegroup', d):
-        write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
-
-    workdir = d.getVar('WORKDIR')
-
-    for pkg in packages.split():
-        pkgval = d.getVar('PKG:%s' % pkg)
-        if pkgval is None:
-            pkgval = pkg
-            d.setVar('PKG:%s' % pkg, pkg)
-
-        extended_data = {
-            "files_info": {}
-        }
-
-        pkgdestpkg = os.path.join(pkgdest, pkg)
-        files = {}
-        files_extra = {}
-        total_size = 0
-        seen = set()
-        for f in pkgfiles[pkg]:
-            fpath = os.sep + os.path.relpath(f, pkgdestpkg)
-
-            fstat = os.lstat(f)
-            files[fpath] = fstat.st_size
-
-            extended_data["files_info"].setdefault(fpath, {})
-            extended_data["files_info"][fpath]['size'] = fstat.st_size
-
-            if fstat.st_ino not in seen:
-                seen.add(fstat.st_ino)
-                total_size += fstat.st_size
-
-            if fpath in pkgdebugsource:
-                extended_data["files_info"][fpath]['debugsrc'] = pkgdebugsource[fpath]
-                del pkgdebugsource[fpath]
-
-        d.setVar('FILES_INFO:' + pkg , json.dumps(files, sort_keys=True))
-
-        process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
-        add_set_e_to_scriptlets(pkg)
-
-        subdata_file = pkgdatadir + "/runtime/%s" % pkg
-        with open(subdata_file, 'w') as sf:
-            for var in (d.getVar('PKGDATA_VARS') or "").split():
-                val = write_if_exists(sf, pkg, var)
-
-            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-            for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split()):
-                write_if_exists(sf, pkg, 'FILERPROVIDES:' + dfile)
-
-            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-            for dfile in sorted((d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split()):
-                write_if_exists(sf, pkg, 'FILERDEPENDS:' + dfile)
-
-            sf.write('%s:%s: %d\n' % ('PKGSIZE', pkg, total_size))
-
-        subdata_extended_file = pkgdatadir + "/extended/%s.json.zstd" % pkg
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(subdata_extended_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
-            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
-
-        # Symlinks needed for rprovides lookup
-        rprov = d.getVar('RPROVIDES:%s' % pkg) or d.getVar('RPROVIDES')
-        if rprov:
-            for p in bb.utils.explode_deps(rprov):
-                subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
-                bb.utils.mkdirhier(os.path.dirname(subdata_sym))
-                oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
-
-        allow_empty = d.getVar('ALLOW_EMPTY:%s' % pkg)
-        if not allow_empty:
-            allow_empty = d.getVar('ALLOW_EMPTY')
-        root = "%s/%s" % (pkgdest, pkg)
-        os.chdir(root)
-        g = glob('*')
-        if g or allow_empty == "1":
-            # Symlinks needed for reverse lookups (from the final package name)
-            subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
-            oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
-
-            packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
-            open(packagedfile, 'w').close()
-
-    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
-        write_extra_runtime_pkgs(variants, packages, pkgdatadir)
-
-    if bb.data.inherits_class('allarch', d) and not variants \
-        and not bb.data.inherits_class('packagegroup', d):
-        write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
-
+    import oe.packagedata
+    oe.packagedata.emit_pkgdata(pkgfiles, d)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
-emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bfa28d3bc9b..05d5a844de2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -973,3 +973,4 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] = "BBEXTENDCURR BBEXTENDVARIAN
 oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
 oe.path.format_display[vardepsexclude] = "TOPDIR"
 oe.utils.multiprocess_launch[vardepsexclude] = "BB_NUMBER_THREADS"
+oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index ff260f405ca..efa600ddcd3 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -6,6 +6,11 @@
 
 import codecs
 import os
+import json
+import bb.compress.zstd
+import oe.path
+
+from glob import glob
 
 def packaged(pkg, d):
     return os.access(get_subpkgedata_fn(pkg, d) + '.packaged', os.R_OK)
@@ -162,4 +167,177 @@ def runtime_mapping_rename(varname, pkg, d):
 
     #bb.note("%s after: %s" % (varname, d.getVar(varname)))
 
+def emit_pkgdata(pkgfiles, d):
+    def process_postinst_on_target(pkg, mlprefix):
+        pkgval = d.getVar('PKG:%s' % pkg)
+        if pkgval is None:
+            pkgval = pkg
+
+        defer_fragment = """
+if [ -n "$D" ]; then
+    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot %s mlprefix=%s
+    exit 0
+fi
+""" % (pkgval, mlprefix)
+
+        postinst = d.getVar('pkg_postinst:%s' % pkg)
+        postinst_ontarget = d.getVar('pkg_postinst_ontarget:%s' % pkg)
+
+        if postinst_ontarget:
+            bb.debug(1, 'adding deferred pkg_postinst_ontarget() to pkg_postinst() for %s' % pkg)
+            if not postinst:
+                postinst = '#!/bin/sh\n'
+            postinst += defer_fragment
+            postinst += postinst_ontarget
+            d.setVar('pkg_postinst:%s' % pkg, postinst)
+
+    def add_set_e_to_scriptlets(pkg):
+        for scriptlet_name in ('pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'):
+            scriptlet = d.getVar('%s:%s' % (scriptlet_name, pkg))
+            if scriptlet:
+                scriptlet_split = scriptlet.split('\n')
+                if scriptlet_split[0].startswith("#!"):
+                    scriptlet = scriptlet_split[0] + "\nset -e\n" + "\n".join(scriptlet_split[1:])
+                else:
+                    scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
+            d.setVar('%s:%s' % (scriptlet_name, pkg), scriptlet)
+
+    def write_if_exists(f, pkg, var):
+        def encode(str):
+            import codecs
+            c = codecs.getencoder("unicode_escape")
+            return c(str)[0].decode("latin1")
+
+        val = d.getVar('%s:%s' % (var, pkg))
+        if val:
+            f.write('%s:%s: %s\n' % (var, pkg, encode(val)))
+            return val
+        val = d.getVar('%s' % (var))
+        if val:
+            f.write('%s: %s\n' % (var, encode(val)))
+        return val
+
+    def write_extra_pkgs(variants, pn, packages, pkgdatadir):
+        for variant in variants:
+            with open("%s/%s-%s" % (pkgdatadir, variant, pn), 'w') as fd:
+                fd.write("PACKAGES: %s\n" % ' '.join(
+                            map(lambda pkg: '%s-%s' % (variant, pkg), packages.split())))
+
+    def write_extra_runtime_pkgs(variants, packages, pkgdatadir):
+        for variant in variants:
+            for pkg in packages.split():
+                ml_pkg = "%s-%s" % (variant, pkg)
+                subdata_file = "%s/runtime/%s" % (pkgdatadir, ml_pkg)
+                with open(subdata_file, 'w') as fd:
+                    fd.write("PKG:%s: %s" % (ml_pkg, pkg))
+
+    packages = d.getVar('PACKAGES')
+    pkgdest = d.getVar('PKGDEST')
+    pkgdatadir = d.getVar('PKGDESTWORK')
+
+    data_file = pkgdatadir + d.expand("/${PN}")
+    with open(data_file, 'w') as fd:
+        fd.write("PACKAGES: %s\n" % packages)
+
+    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
+
+    pn = d.getVar('PN')
+    global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
+    variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
+
+    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
+        write_extra_pkgs(variants, pn, packages, pkgdatadir)
+
+    if bb.data.inherits_class('allarch', d) and not variants \
+        and not bb.data.inherits_class('packagegroup', d):
+        write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
+
+    workdir = d.getVar('WORKDIR')
+
+    for pkg in packages.split():
+        pkgval = d.getVar('PKG:%s' % pkg)
+        if pkgval is None:
+            pkgval = pkg
+            d.setVar('PKG:%s' % pkg, pkg)
+
+        extended_data = {
+            "files_info": {}
+        }
+
+        pkgdestpkg = os.path.join(pkgdest, pkg)
+        files = {}
+        files_extra = {}
+        total_size = 0
+        seen = set()
+        for f in pkgfiles[pkg]:
+            fpath = os.sep + os.path.relpath(f, pkgdestpkg)
+
+            fstat = os.lstat(f)
+            files[fpath] = fstat.st_size
+
+            extended_data["files_info"].setdefault(fpath, {})
+            extended_data["files_info"][fpath]['size'] = fstat.st_size
+
+            if fstat.st_ino not in seen:
+                seen.add(fstat.st_ino)
+                total_size += fstat.st_size
+
+            if fpath in pkgdebugsource:
+                extended_data["files_info"][fpath]['debugsrc'] = pkgdebugsource[fpath]
+                del pkgdebugsource[fpath]
+
+        d.setVar('FILES_INFO:' + pkg , json.dumps(files, sort_keys=True))
+
+        process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
+        add_set_e_to_scriptlets(pkg)
+
+        subdata_file = pkgdatadir + "/runtime/%s" % pkg
+        with open(subdata_file, 'w') as sf:
+            for var in (d.getVar('PKGDATA_VARS') or "").split():
+                val = write_if_exists(sf, pkg, var)
+
+            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
+            for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split()):
+                write_if_exists(sf, pkg, 'FILERPROVIDES:' + dfile)
+
+            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
+            for dfile in sorted((d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split()):
+                write_if_exists(sf, pkg, 'FILERDEPENDS:' + dfile)
+
+            sf.write('%s:%s: %d\n' % ('PKGSIZE', pkg, total_size))
+
+        subdata_extended_file = pkgdatadir + "/extended/%s.json.zstd" % pkg
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(subdata_extended_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
+
+        # Symlinks needed for rprovides lookup
+        rprov = d.getVar('RPROVIDES:%s' % pkg) or d.getVar('RPROVIDES')
+        if rprov:
+            for p in bb.utils.explode_deps(rprov):
+                subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
+                bb.utils.mkdirhier(os.path.dirname(subdata_sym))
+                oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
+
+        allow_empty = d.getVar('ALLOW_EMPTY:%s' % pkg)
+        if not allow_empty:
+            allow_empty = d.getVar('ALLOW_EMPTY')
+        root = "%s/%s" % (pkgdest, pkg)
+        os.chdir(root)
+        g = glob('*')
+        if g or allow_empty == "1":
+            # Symlinks needed for reverse lookups (from the final package name)
+            subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
+            oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
+
+            packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
+            open(packagedfile, 'w').close()
+
+    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
+        write_extra_runtime_pkgs(variants, packages, pkgdatadir)
+
+    if bb.data.inherits_class('allarch', d) and not variants \
+        and not bb.data.inherits_class('packagegroup', d):
+        write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
+
 
-- 
2.37.2


