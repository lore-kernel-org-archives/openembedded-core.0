Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED683C74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:15 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.56035.1679517974425358755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V80JcDcy;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id t10-20020a9d774a000000b00698d7d8d512so11079841otl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1djBLNohbeVxGkRmknUvhh0DVVchOIkE3PsA3gGMzg=;
        b=V80JcDcy9Ho+LVloHxgpAkiIXL5YKbpNwO4dcnQZBYzvnqoO+paKcHq/lB/3ilyCn9
         N3Nvpqi44CWx98gSJVtIfuLTJ+2idxsZZwV2DHwmZEzFpE0v+aruqhUFzTWSfX3gadCa
         dnkrs7xMeCOugt6fnRZArhIqD5x4eGSFUz5c67ke6FOiN9cm7Bw+0fx+NfDhr+6f8Alu
         4wdHIfeqKd3YhKF/a9TX6Sy/GVzgdwnnyFbZJewGBsOYPpvWCbs9wvvwYEFknhTeNsIH
         GZROPchOP0SRkoZ/yBZmD0zv4TaoI+Eb2jr4McMQ464e3ZgtqIxEVfLmLLlidkufwip8
         2qOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1djBLNohbeVxGkRmknUvhh0DVVchOIkE3PsA3gGMzg=;
        b=wTza1+QdTMNRlzLci8Tn1ggK5KXpJf2g4OCn1QAzlhwaRTjtyt/XUELM9TRydlkAM7
         7mWs08sYvHZpWEft3Jy0895iRLynymA7JQ5bBqHVi5nLAahPx55hducwezUW1NUw5rRY
         MCcx689xSSafBNOgfsBF+8q2ldOkcWtDl3rzw56JRnUWgw7Tt7BwbaQ5NI1Zdi4nlsdV
         VRw3SUf4XAAmlfOyS7smVi4C8HBuzHM7ivuaFkjkcnVZ2lO9BuXvF6bjH3jFUuNmixxS
         +2Za61y1T4tEgeacjd3u5Tu1Jra6PeGDe+hufKr5MU55Blmm4IYVN1n5RbPVrKQGZbc2
         KWuA==
X-Gm-Message-State: AO0yUKVWS1druD7ZbzVPyc0eamaHURJX0G+X1W0IAEJPFomnVcjGSaTT
	nHOykvQpJdDNounLkilYdCDg0EweCls=
X-Google-Smtp-Source: AK7set92ZgWfWrNGBRA8Cl0GzXLFcLerc35HhcjIwsYNeeqjh/5kuUoqHURw2oY1MG0BaZFZ1tvFWw==
X-Received: by 2002:a9d:7b46:0:b0:699:45ab:5303 with SMTP id f6-20020a9d7b46000000b0069945ab5303mr2589578oto.37.1679517972956;
        Wed, 22 Mar 2023 13:46:12 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Saul Wold <saul.wold@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH 2/5] classes/package: Add extended packaged data
Date: Wed, 22 Mar 2023 15:45:55 -0500
Message-Id: <20230322204558.1386634-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178958

Adds extended package data which is encoded as JSON which allows it to
encode more structure than the "flat" package data files. The extended
data might be much larger than the standard package data, so it is not
read by default and instead requires
oe.packagedata.read_subpkgdata_extended() to be called

Currently, the file sizes and ELF debug sources are saved off into the
extended package data

(cherry picked from commit db9cf430e54ae68da80fbc3fba80ce88d8df164d)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Reviewed-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 40 +++++++++++++++++++++++++++++++++---
 meta/lib/oe/packagedata.py   | 12 +++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 702427fecc..84fdafa8fe 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1140,6 +1140,14 @@ python split_and_strip_files () {
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
@@ -1153,6 +1161,8 @@ python split_and_strip_files () {
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
 
+        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
+
         sources = set()
         for r in results:
             sources.update(r[1])
@@ -1460,6 +1470,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 python emit_pkgdata() {
     from glob import glob
     import json
+    import bb.compress.zstd
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG_%s' % pkg)
@@ -1532,6 +1543,8 @@ fi
     with open(data_file, 'w') as fd:
         fd.write("PACKAGES: %s\n" % packages)
 
+    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
+
     pn = d.getVar('PN')
     global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
     variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
@@ -1551,17 +1564,32 @@ fi
             pkgval = pkg
             d.setVar('PKG_%s' % pkg, pkg)
 
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
         d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
@@ -1582,6 +1610,11 @@ fi
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
+        subdata_extended_file = pkgdatadir + "/extended/%s.json.zstd" % pkg
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(subdata_extended_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
+
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
@@ -1612,7 +1645,8 @@ fi
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
 }
-emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
+emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
+emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a82085a792..00f7dc1f3d 100644
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
2.33.0


