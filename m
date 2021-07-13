Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.1152.1626192534611970335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 09:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HG3uB+cA;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id e1-20020a9d63c10000b02904b8b87ecc43so9085278otl.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuGvJ6VAFfHYXDouVUs5Q6QhMedqkc0oCJj1rfYHnlc=;
        b=HG3uB+cA89kzGOVKUFVGwI+ihJkeNmrUO3cdy8onoL8d09Bpci6r/REh1Bx6F8UIXJ
         j9Ko1hcmtcWjtpAjI2HC0OfaHCDZuAy9RUv+/AwFexLmfhBq3tGEWx8AoVKrBV5S7fD/
         pqCN8ibAGJ0tUEwuizElI48rRa5UFQ8bkO/9KkCmX0I1iHywAeBVMNbXYyTlFmXMAb6K
         ZPCLAXrTQUEpgF5yGmHzlBPoJc+TtkbfZDNvoSHvCE0nuI1buzq3pSyFfSDWie8kF22A
         OZgPTi6UomgX+2WS9RoLorzVKkxmzOREzIbKCnflr2kVXwzTcJUjKIIiYK8VwpdvoZ/D
         Kx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuGvJ6VAFfHYXDouVUs5Q6QhMedqkc0oCJj1rfYHnlc=;
        b=DaN7bg/ouriIIVrqa6jD+2Q/D5SL+DnsEhf4zDI1K6EX2NpAd39y6ovukXv7a7dbCp
         mEWo3ocIAaZDzztiptyJdiXiIFJBlLBtLoNoy5YhynadMFdSMURTX8rcqN0KEarbE64F
         sdV0HUl1bvZ98h5Lf1KyCuK/G9IqjA1sGwvcIlFuB+lCOXPTTSANTeU9plqOA8yBZfHs
         mdJiYt+bvDIsd7j4Odw3TmPhrek5Via3DzJwby+UvX0yWMeCHrsldA5sEM6pw9YL+rg0
         lb+3vlm8EzlvGuN9NS9Vl0/CDHq9R1+ANYPm8Lk6ntU4qCTOSFp83Ae0/Wn8Dq9b+fcx
         9r9g==
X-Gm-Message-State: AOAM530d3huPx6WCM+nZBMMRtnCbmxKZFhFLoaxyOZXWECAIBupnIx1Q
	LaD7aaxGnj6KD4nyGHi2vdHM9DVvGNc=
X-Google-Smtp-Source: ABdhPJxsRo8uN2RRSNCpOZd3uaC5TfFS0xdh9FVPdfoQNmxWC/zfsdNSc5nHIXG8Mc++y3zzAv77Yw==
X-Received: by 2002:a9d:3a34:: with SMTP id j49mr4236558otc.102.1626192533794;
        Tue, 13 Jul 2021 09:08:53 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id j139sm291288oih.43.2021.07.13.09.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 09:08:53 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/package: Add extended packaged data
Date: Tue, 13 Jul 2021 11:08:46 -0500
Message-Id: <20210713160846.18356-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
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
---
 meta/classes/package.bbclass | 38 ++++++++++++++++++++++++++++++++++--
 meta/lib/oe/packagedata.py   |  9 +++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cf30f33f3d..a0e7f464a9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1225,6 +1225,14 @@ python split_and_strip_files () {
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
@@ -1238,6 +1246,8 @@ python split_and_strip_files () {
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
 
+        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
+
         sources = set()
         for r in results:
             sources.update(r[1])
@@ -1622,6 +1632,8 @@ fi
     with open(data_file, 'w') as fd:
         fd.write("PACKAGES: %s\n" % packages)
 
+    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
+
     pn = d.getVar('PN')
     global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
     variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
@@ -1641,17 +1653,32 @@ fi
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
@@ -1672,6 +1699,10 @@ fi
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
+        subdata_extended_file = pkgdatadir + "/runtime/%s.json" % pkg
+        with open(subdata_extended_file, "w") as f:
+            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
+
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
@@ -1694,6 +1725,9 @@ fi
             packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
             open(packagedfile, 'w').close()
 
+    if pkgdebugsource:
+        bb.fatal("One or more file debug sources were not consumed by a package: %s" % " ".join(pkgdebugsource.keys()))
+
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_runtime_pkgs(variants, packages, pkgdatadir)
 
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a82085a792..60485cc79d 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -57,6 +57,15 @@ def read_subpkgdata_dict(pkg, d):
         ret[newvar] = subd[var]
     return ret
 
+def read_subpkgdata_extended(pkg, d):
+    import json
+    fn = d.expand("${PKGDATA_DIR}/runtime/%s.json" % pkg)
+    try:
+        with open(fn, "r") as f:
+            return json.load(f)
+    except FileNotFoundError:
+        return None
+
 def _pkgmap(d):
     """Return a dictionary mapping package to recipe name."""
 
-- 
2.32.0

