Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web09.23997.1628521519065763662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6W57AO3;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id u10so23971226oiw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f3csba7WUGmFHFNq+WHK8f0yJfUFJUsjHUcIGqohq6k=;
        b=r6W57AO3/2sp3gFwI6Fp4Rl2EK05cMNZRQs1pk/fdqn2c/WGxLRXX0rqXNHNqPQG1b
         ARBuZXl6+KpmqYcKQvcfL1XlV+TfD0ay9iFh35EhTUzQk3LsYghagp0jFru2pzld4U7z
         k3GvsR1BF1jInib/pFCEwu4/+89B/ZTtkUGnFyHRDXxquuLIAxOYhbOJr2cT23oedhJs
         xxZOFUOFQT47FJ02t7bG/Jd02s/mu283FJAbZF8uDAvoLB6ox03PPGf5MJbRnUEHxavH
         A4/v6xUMRRBnfxgtvXwKLGd7qj8kE63v9kQPN5kHTeO9lYjskNna14tH6sy0cvst5zni
         5/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f3csba7WUGmFHFNq+WHK8f0yJfUFJUsjHUcIGqohq6k=;
        b=c9COADDe9aj8U1O6e51T1N6EJRmn6DN1wyXc7m2kfc+qSBrzHexqZVsn3dLq4xkDi/
         bKoTp5DrY9UtvURDjQim3ZcJ6ytnLcarhpFNG1jZxKHYsnSwoCy5J4k5Wgts5sa0Du9B
         Cza7n0wbhoS7HsI+E6vAYV48PGQyd/x97oBKWj/zBlAp2zP4k5DPCX3BJQdFZb+jQrxw
         WH6INbyOJxRLY08A9In4c5MpdCbO3ErIuQ1DPtSGCqDxZJJmYLs0p+RJSC2gj3bIPdFQ
         5+l7aCoBYkMaaUDuz73TFxXMHksPWGsfqPB/fBKlKRKqPX7VBStBbNXm0JrW0HJEVj/V
         idgw==
X-Gm-Message-State: AOAM5332lPKZCxrJ0dxmnE1HWw70/xBl1L/2gn5zORA1vOVXvyG3+xCD
	XpcCiTAhiDZPIDJvqJNNQEbs5tBvuAOR4Q==
X-Google-Smtp-Source: ABdhPJwrBkskfps0a2Q25YjIimEPlGT59sAcMufWxRTWyEVLHMpbdCXNm+T1iKSC90FmowPuWV2l2g==
X-Received: by 2002:aca:d11:: with SMTP id 17mr4526507oin.67.1628521517983;
        Mon, 09 Aug 2021 08:05:17 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t3sm1178366otm.28.2021.08.09.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 08:05:17 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Saul Wold <saul.wold@windriver.com>
Subject: [OE-core][PATCH v2] classes/package: Add extended packaged data
Date: Mon,  9 Aug 2021 10:05:11 -0500
Message-Id: <20210809150511.24608-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713160846.18356-1-JPEWhacker@gmail.com>
References: <20210713160846.18356-1-JPEWhacker@gmail.com>
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
---

V2: Remove fatal message when debug data was not captured, since this
    can happen on purpose if the package is removed for license reasons

 meta/classes/package.bbclass | 35 +++++++++++++++++++++++++++++++++--
 meta/lib/oe/packagedata.py   |  9 +++++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a659a1ef5c..743f3ee51d 100644
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
         d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
@@ -1672,6 +1699,10 @@ fi
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
+        subdata_extended_file = pkgdatadir + "/runtime/%s.json" % pkg
+        with open(subdata_extended_file, "w") as f:
+            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
+
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES:%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 22261d271e..db26fef8db 100644
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

