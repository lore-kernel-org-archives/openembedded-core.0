Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.5673.1615884567170869280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fygFmTLi;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id x4so54459877lfu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OXrbs/6DK2SWhHO6HQfsXVcjyC0jKCDjmvc0wrwZk/4=;
        b=fygFmTLiyArimv51XbGHym3ejlVkW+WSXcj9SthTx2qvxXQ/iqpGggD4BHyCSMi403
         FIyP8BCkQvudHGKi456FnLLZ1midxGJf3+idY00xr9egVtLqKYt9tY+vHp+2krXK1TSq
         t2NUiostQ0YveTIKy93xW4LrxZ9WlTz9nWHyBHDah8DOguwC90rceXBxuUofg85riodM
         t+4IjLPEEhZgeQIeDsddu/xjIS9G6Z2UzhPwhJGIMm7GrugYLn62YZXDO1h0ArRzpZkY
         /uOz6RCqBPiwcLX9W7xzNCHg/Mw6Los5nYFtGsXoO+Enake3pZcFdTvsRFzaovsGfZ4o
         VtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OXrbs/6DK2SWhHO6HQfsXVcjyC0jKCDjmvc0wrwZk/4=;
        b=DcL95hpu/zctg8fm9nZ0OQDcVqoCBpNzP1GaOfKLs1wwVJumhdfqG5Uyb48CDjyfeX
         UFhPelg2FTPxpeNlB6BZVEl1FfVdgGJMU7Q5UVl2Zj6tNS84U23U8gYE/BDc1IOc4fZd
         aXeJm7Xd5emtw1YBASWgnRKYvXcHU3N68ptSvD3+OcvvgYa86LnSkeCrFeBzb5qdeWh8
         bRY+JsDz/NVg7oFHuAeqe/O1uhm5ztuYEs0mYhJP5fsSgEACMyTygWcD9BL/znIFaJeg
         AsdP7WAId5AqPJC0JedjcOAGua8HjZfZAJNF4spNU++M0pCDNoMa/WyqiHiPkWtxHI2t
         Iyig==
X-Gm-Message-State: AOAM530Ajjr0WjnogKhrDg9NmXp17pLveQg2MVfsuJ3dwbacYVcQyTga
	efhigvC45KTk+wPB0X8d1lDJrJo/la4NVQ==
X-Google-Smtp-Source: ABdhPJwhFMBQe07AT9Kt11G4Avm2KfGzVhB7wdtw4Vy3bkuwsLbZDP/oFZRjZW8Mn26Sv/SvmY4NYQ==
X-Received: by 2002:a05:6512:12c2:: with SMTP id p2mr10368050lfg.339.1615884565185;
        Tue, 16 Mar 2021 01:49:25 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:24 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH v2 5/6] package.bbclass: Add handle_qa_error check
Date: Tue, 16 Mar 2021 09:48:44 +0100
Message-Id: <20210316084845.379201-5-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316084845.379201-1-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

package_qa_handle_error() from insane.bbclass handles display of warnings by allowing the user decide whether they want the issues treated as warnings, errors or hidden completely.
This is done by setting a variable "LICENSE_SOURCE_SPDX" in local.conf to either "0" or "1".
Add SPDXLICENSEMAP variable to emit_pkgdata[vardeps]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 127 ++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 62 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index efdc169275..8cd7f3ad21 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1549,6 +1549,7 @@ python emit_pkgdata() {
     import json
     import subprocess
     import oe.license
+    import bb.utils
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG_%s' % pkg)
@@ -1706,70 +1707,72 @@ fi
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
     sourceresult = d.getVar('TEMPDBGSRCMAPPING', False)
-    sources = {}
-    if sourceresult:
-        for r in sourceresult:
-            sources[r[0]] = r[1]
-        with open(data_file + ".srclist", 'w') as f:
-            f.write(json.dumps(sources, sort_keys=True))
-
-        filelics = {}
-        for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')]:
-            p = subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
-            out, err = p.communicate()
-            if p.returncode == 0:
-                for l in out.decode("utf-8").split("\n"):
-                    l = l.strip()
-                    if not l:
-                        continue
-                    l = l.split(":")
-                    if len(l) < 3:
-                        bb.warn(str(l))
-                        continue
-                    fn = "/" + l[0]
-                    lic = l[2].strip()
-                    if lic.endswith("*/"):
-                        lic = lic[:-2]
-                    lic = lic.strip()
-                    filelics[fn] = lic
-        with open(data_file + ".filelics", 'w') as f:
-            f.write(json.dumps(filelics, sort_keys=True))
-
-        computedlics = {}
-        computedpkglics = {}
-        for r in sourceresult:
-            for subf in r[1]:
-                if subf in filelics:
-                    if r[0] not in computedlics:
-                        computedlics[r[0]] = set()
-                    computedlics[r[0]].add(filelics[subf])
-        #if computedlics:
-        #    bb.warn(str(computedlics))
-        dvar = d.getVar('PKGD')
-        for f in computedlics:
-            shortf = f.replace(dvar, "")
-            found = False
-            for pkg in filemap:
-                if shortf in filemap[pkg]:
-                    found = True
-                    if pkg not in computedpkglics:
-                        computedpkglics[pkg] = set()
-                    computedpkglics[pkg].update(computedlics[f])
-            if not found:
-                bb.warn("%s not in %s" % (f, str(filemap)))
-        #if computedpkglics:
-        #    bb.warn(str(computedpkglics))
-        for pkg in computedpkglics:
-            lic = d.getVar('LICENSE_%s' % (pkg))
-            if not lic:
-                lic = d.getVar('LICENSE')
-            spdx_lic = oe.license.split_spdx_lic(lic, d)
-
-            # Displays warnings for licenses found in the recipes and not sources
-            if spdx_lic - computedpkglics[pkg]:
-                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], spdx_lic))
+    if bb.utils.to_boolean(d.getVar("LICENSE_SOURCE_SPDX")):
+        sources = {}
+        if sourceresult:
+            for r in sourceresult:
+                sources[r[0]] = r[1]
+            with open(data_file + ".srclist", 'w') as f:
+                f.write(json.dumps(sources, sort_keys=True))
+
+            filelics = {}
+            for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')]:
+                p = subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
+                out, err = p.communicate()
+                if p.returncode == 0:
+                    for l in out.decode("utf-8").split("\n"):
+                        l = l.strip()
+                        if not l:
+                            continue
+                        l = l.split(":")
+                        if len(l) < 3:
+                            bb.warn(str(l))
+                            continue
+                        fn = "/" + l[0]
+                        lic = l[2].strip()
+                        if lic.endswith("*/"):
+                            lic = lic[:-2]
+                        lic = lic.strip()
+                        filelics[fn] = lic
+            with open(data_file + ".filelics", 'w') as f:
+                f.write(json.dumps(filelics, sort_keys=True))
+
+            computedlics = {}
+            computedpkglics = {}
+            for r in sourceresult:
+                for subf in r[1]:
+                    if subf in filelics:
+                        if r[0] not in computedlics:
+                            computedlics[r[0]] = set()
+                        computedlics[r[0]].add(filelics[subf])
+            #if computedlics:
+            #    bb.warn(str(computedlics))
+            dvar = d.getVar('PKGD')
+            for f in computedlics:
+                shortf = f.replace(dvar, "")
+                found = False
+                for pkg in filemap:
+                    if shortf in filemap[pkg]:
+                        found = True
+                        if pkg not in computedpkglics:
+                            computedpkglics[pkg] = set()
+                        computedpkglics[pkg].update(computedlics[f])
+                if not found:
+                    bb.warn("%s not in %s" % (f, str(filemap)))
+            #if computedpkglics:
+            #    bb.warn(str(computedpkglics))
+            for pkg in computedpkglics:
+                lic = d.getVar('LICENSE_%s' % (pkg))
+                if not lic:
+                    lic = d.getVar('LICENSE')
+                spdx_lic = oe.license.split_spdx_lic(lic, d)
+
+                # Displays warnings for licenses found in the recipes and not sources
+                if spdx_lic - computedpkglics[pkg]:
+                    package_qa_handle_error("LICENSE_SOURCE_SPDX", ("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], spdx_lic)), d)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
+emit_pkgdata[vardeps] += "SPDXLICENSEMAP"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-- 
2.25.1

