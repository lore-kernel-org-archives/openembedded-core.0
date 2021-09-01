Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.8182.1630503920116089554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MntN4Q0H;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso3454773otv.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UU01+hAUny9STxuPq5RApCPnEeXRU0Vtwr8P5f9Hlw=;
        b=MntN4Q0HHJI8x1yuJVBaffr43ycbykrK8RkRszTxan9qxg9amgruTcy1QLosdZAhoU
         /EhsP8mDgVDp4RXLEzuFWSSyiGX3KAaT17Zw5cXQh52tpXad/WXIwpztxDfySqiBxuzB
         QmbyNdx8bWGrgOwYvJo6kO4H1MH6ML/m3FtQPVyCYvQ5UfT4Oelm/jp3D1pGw3aUGUZU
         YsAhL9Ed1uoB2SS0yqMwoytYG3COpgvMolS1rqHDffhuBwH/YLQUjtcZuA479dUrOEkq
         pEIOKV6CYX+O6QCxKs0fuQP8bIDrKPOK4B0wjk7HMVjaN2VEiQQJA4gvuvUS78Wuuf1k
         Frlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UU01+hAUny9STxuPq5RApCPnEeXRU0Vtwr8P5f9Hlw=;
        b=iYqHH6oHF5MrzxGrBmZc9JgTwJC1Tvkp0B0V+g7uoSgBGLOt6vDodtgAtSVNhX0BjB
         mln7yOpxuvew8QUFE6OzuNZcN6MNv8L+GyLJL+jopalt11sRJatyacRlopowcfOdexr/
         1MhVb4kq+NykDiSCm6UoWoubpmCLiUnF/A524fTZpUprBhM2skFBEZ2NAeCfNUyc2sRZ
         NamT5Bk+/UKlINM1CLACbRfuzdf/NEK8HESFDHQliB1NJQhlxt8DnSfzlJiZJbUrU/xx
         uqc09w9XuMpRR0s+mv2DlG8p8WHblOE2DWjQtyPPukNn0/+mqRb0SsKjBeRj2a7scadS
         Qx1A==
X-Gm-Message-State: AOAM532hG2AzA0X+bnpMGeHTL4FjHSETkDMtDwQYW7OCn3vIoFrEpY+K
	AJPrJkghHzAg2PsRsoFxlGlZ9XVAN7k=
X-Google-Smtp-Source: ABdhPJzJfcvurUgw2/tvmipYYW2Lp/xei0B0Do5yTxnn2AucT/7mAj1aq+dzXtxI3JW23YFCXDrL7A==
X-Received: by 2002:a05:6830:237c:: with SMTP id r28mr30353636oth.267.1630503919043;
        Wed, 01 Sep 2021 06:45:19 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:18 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 01/31] classes/package: Add extended packaged data
Date: Wed,  1 Sep 2021 08:44:40 -0500
Message-Id: <20210901134510.29561-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds extended package data which is encoded as JSON which allows it to
encode more structure than the "flat" package data files. The extended
data might be much larger than the standard package data, so it is not
read by default and instead requires
oe.packagedata.read_subpkgdata_extended() to be called

Currently, the file sizes and ELF debug sources are saved off into the
extended package data

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Reviewed-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 39 +++++++++++++++++++++++++++++++++---
 meta/lib/oe/packagedata.py   | 12 +++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c4c5515d5d..89cf42f91e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1224,6 +1224,14 @@ python split_and_strip_files () {
                 # Modified the file so clear the cache
                 cpath.updatecache(file)
 
+    def strip_pkgd_prefix(f):
+        nonlocal dvar
+
+        if f.startswith(dvar):
+            return f[len(dvar):]
+
+        return f
+
     #
     # First lets process debug splitting
     #
@@ -1237,6 +1245,8 @@ python split_and_strip_files () {
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
 
+        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
+
         sources = set()
         for r in results:
             sources.update(r[1])
@@ -1549,6 +1559,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 python emit_pkgdata() {
     from glob import glob
     import json
+    import bb.compress.zstd
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG:%s' % pkg)
@@ -1621,6 +1632,8 @@ fi
     with open(data_file, 'w') as fd:
         fd.write("PACKAGES: %s\n" % packages)
 
+    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
+
     pn = d.getVar('PN')
     global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
     variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
@@ -1640,17 +1653,32 @@ fi
             pkgval = pkg
             d.setVar('PKG:%s' % pkg, pkg)
 
+        extended_data = {
+            "files_info": {}
+        }
+
         pkgdestpkg = os.path.join(pkgdest, pkg)
         files = {}
+        files_extra = {}
         total_size = 0
         seen = set()
         for f in pkgfiles[pkg]:
-            relpth = os.path.relpath(f, pkgdestpkg)
+            fpath = os.sep + os.path.relpath(f, pkgdestpkg)
+
             fstat = os.lstat(f)
-            files[os.sep + relpth] = fstat.st_size
+            files[fpath] = fstat.st_size
+
+            extended_data["files_info"].setdefault(fpath, {})
+            extended_data["files_info"][fpath]['size'] = fstat.st_size
+
             if fstat.st_ino not in seen:
                 seen.add(fstat.st_ino)
                 total_size += fstat.st_size
+
+            if fpath in pkgdebugsource:
+                extended_data["files_info"][fpath]['debugsrc'] = pkgdebugsource[fpath]
+                del pkgdebugsource[fpath]
+
         d.setVar('FILES_INFO:' + pkg , json.dumps(files, sort_keys=True))
 
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
@@ -1671,6 +1699,11 @@ fi
 
             sf.write('%s:%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
+        subdata_extended_file = pkgdatadir + "/extended/%s.json.zstd" % pkg
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(subdata_extended_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
+
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES:%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
@@ -1701,7 +1734,7 @@ fi
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
 }
-emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
+emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 0b17897e40..02c81e5a52 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -57,6 +57,18 @@ def read_subpkgdata_dict(pkg, d):
         ret[newvar] = subd[var]
     return ret
 
+def read_subpkgdata_extended(pkg, d):
+    import json
+    import bb.compress.zstd
+
+    fn = d.expand("${PKGDATA_DIR}/extended/%s.json.zstd" % pkg)
+    try:
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(fn, "rt", encoding="utf-8", num_threads=num_threads) as f:
+            return json.load(f)
+    except FileNotFoundError:
+        return None
+
 def _pkgmap(d):
     """Return a dictionary mapping package to recipe name."""
 
-- 
2.32.0

