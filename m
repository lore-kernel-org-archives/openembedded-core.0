Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8096CC761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 20:05:51 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.46694.1679947541724773587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 13:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QBIAgTDz;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id l39-20020a9d1b2a000000b006a121324abdso3619759otl.7
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679947540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1djBLNohbeVxGkRmknUvhh0DVVchOIkE3PsA3gGMzg=;
        b=QBIAgTDzhQRLs/tXNAzuu7zyFIHceEU4PUELgNij5saK1M+mlE5QZu8zzwd3fVyplM
         3q6N/IcD3gL6yr+25OaMsxFQfdby9UNE7PM/3kroZrmh/52oAhhDUtDVETJ10d7X188y
         w/eNugfQrrZPYqAqIct1Bj2fjeWwfk2UCVWbbbWVscDY/mWtZJsfZOjNB1g/X05KFt94
         A7+93mBjf/LJlTi4UNt18N4nwkuLN8qRD2wWrbHzUvu8o6H3TPdE7eAHGvUGHrbsS7k7
         SC9MaPOKjhsG2ypkozZN8hdrKh5NjascuPqqjh8e7E9uNWVOOhUt90WgEcol1d0KuNdr
         na6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679947540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1djBLNohbeVxGkRmknUvhh0DVVchOIkE3PsA3gGMzg=;
        b=YVRb7Lva0vl7MQc4TGmz7QdePMOUmqLTMD8snViMhfavyuP9rmiIWa7gGH8w1lYe3l
         Sza+tFuMPWr7E/WMpWReRxVOhUs+SRZo7DGNUZpvts3msFaDus7MY5e1bX36kPtKfHZK
         hEF2VT+2jTc+aosZZocuTJbnNKkKMr2D4jbXiqXH2xc1Il4OW0yUTuGlQpSRgC8SLs7u
         4Ywf1HYutBOii3fXIwisVkU09LE4UUuVo4064dwKIeOtquBrYgslfl0cU4wVEguhJlLX
         xbBMvMbwGQoEVMpTJzZKeMprGe4yanE8pCluzMX4/mZBXzSI08jqz40LUSJouiF56QoB
         y0uQ==
X-Gm-Message-State: AO0yUKXKlCXxlvPnhr1MTbR5rQCZYIG70nIO6IL/J2VHQCYNAENtPlrW
	+726B026gDqkebjEHOL/WR71N2g6A1Q=
X-Google-Smtp-Source: AK7set8B1YFCtMRMdNiHN0x+zg45pvPbQwZi4SGFj30sVbVFl6l+Y+sA1xENNIifqdTGI/SY2Z+smg==
X-Received: by 2002:a9d:63d1:0:b0:69f:4bb:199f with SMTP id e17-20020a9d63d1000000b0069f04bb199fmr6348803otl.23.1679947540391;
        Mon, 27 Mar 2023 13:05:40 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d6f10000000b0069fa641bd25sm5942988otq.8.2023.03.27.13.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:05:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Saul Wold <saul.wold@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH v2 2/5] classes/package: Add extended packaged data
Date: Mon, 27 Mar 2023 15:05:27 -0500
Message-Id: <20230327200530.3354151-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230327200530.3354151-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
 <20230327200530.3354151-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 20:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179177

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


