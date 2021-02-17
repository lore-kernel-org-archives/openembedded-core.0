Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.3209.1613534463884304753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c5QPKby9;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: idadelm@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id a22so14461637ljp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J/PiXx1p4MpJvE/SCOHxaik0RUAmsjc5LlHqDozM3Co=;
        b=c5QPKby9UQKVxb7wqLk7ThasyuCPIuAM8MnKP7XbJ1mzw/CFsQML5r5AkpN9XeNCTD
         VZIVntgBgNI8gFUQK98H8zRuu3IM04paX/Ndj3KGSdRvdEn/JmaguXMLkt2REDNOyKNJ
         t35Y2+HpOvp7qEfuhVctKfmlYDMq91gYOspLa4h10Y+v0HXOkN0KSi3Htzum2kAxhAMQ
         AhENMcsFkU7DAvUG0cWWnR3/cqy8L5nJ4UgtG4cUY+APYpqECM0F+7+DS+J06YlYcVGH
         pwkZVIlVzEfkaWQ8LurKwF/RoW97ZO4LMTs2XRis1PUz0QwcZCXyqKZCIol9AIvgoisy
         4Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J/PiXx1p4MpJvE/SCOHxaik0RUAmsjc5LlHqDozM3Co=;
        b=PVLXz+0NSPElHc2ucAz+IhCKi3Vc5Iwol1d8M9zOFitOTnSQK7mzarZwRSmh5UNFkg
         4eXQZmceKNMPeseKmNhIGGh69i4++WR2iSE4b6lV3lK8rSp5VvO2qQ6iDqFg8WL+mVQX
         YYBB9X1roKVdo2fDXsJl9k9S/ewi74mrY+eNNt2642o9i8/3pmXqr7lt98V40Pt8ukyJ
         2I07sSNNamkPu56ZzuVUD8e8jDE9xDsF/SWushGjGsADWfqd31r6MKNm4CuV2rOqkf7n
         1Sg7p9fmNwNULj0ddpMoIOMyU/S5WHqW5bT6nSXhtsmKEzkcTCRHXi/9ZUWhGfGUmQPU
         J/pQ==
X-Gm-Message-State: AOAM531HNYmb7nlWE4/gVZ4R9G7JVV6UgwyUC5bUnM9z1zaUztAnA2kX
	k8DEXzmLWrABpUNI9rhkku1YpqaV/yEn6Q==
X-Google-Smtp-Source: ABdhPJzsT1O7z7Ego8G6Tdz++r5quOfgc+h/NJPEH+orxmHW+qEORFFm4qCx7Zw+TlFNGUMkYg6BZw==
X-Received: by 2002:a2e:9b9a:: with SMTP id z26mr13650069lji.180.1613534461556;
        Tue, 16 Feb 2021 20:01:01 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.01.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:01:01 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 5/5] package.bbclass: Remove false positive license warnings
Date: Wed, 17 Feb 2021 05:00:33 +0100
Message-Id: <20210217040033.21541-6-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Splits license strings and canonicalise using split_spdx_lic() from license.bbclass. This is so that they can be easily compared with the computedpkglics. The computedpkglics are passed into rem_false_lics() in order so that more warnings can be filtered during comparism with the source licenses.
- After the comparism between computedpkglics and recipe lics, the warnings are displayed if and only if there are licenses in the recipes not found in the sources.
- package_qa_handle_error() from insane.bbclass handles display of warnings by allowing the user decide whether they want the issues treated as warnings, errors or hidden completely. This is done by setting a variable "license_source_spdx"

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 145 ++++++++++++++++-------------------
 1 file changed, 68 insertions(+), 77 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 782d9d00b3..08e8fa1694 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1546,6 +1546,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 
 python emit_pkgdata() {
     import oe.license
+    import bb.utils
     from glob import glob
     import json
     import subprocess
@@ -1706,83 +1707,73 @@ fi
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
-
-            # Splits the LICENSE values and canonicalise each license
-            # in the set of split license(s)    
-            split_lic = oe.license.list_licenses(lic)
-            spdx_lic = set([canonical_license(d, l) for l in split_lic])
-            if computedpkglics[pkg]:
-                computedpkglicsperpkg = set([])
-                for l in computedpkglics[pkg]:
-                    if l.endswith('-or-later'):
-                        lic_ = l.replace('-or-later', '+')
-                        computedpkglicsperpkg.add(lic_)
-                    elif l.endswith(' WITH Linux-syscall-note'):
-                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE") == "1":
-                            lic_ = l.replace(' WITH Linux-syscall-note', '')
-                            computedpkglicsperpkg.add(lic_)
-                    else:
-                        computedpkglicsperpkg.add(l)
-            # Displays warnings for licenses found in the recipes and not sources
-            if spdx_lic - computedpkglicsperpkg:
-                bb.warn("License for package %s is %s (source SPDX headers) vs %s (LICENSE)" % (pkg, computedpkglicsperpkg, spdx_lic))
+    if bb.utils.contains("license_source_spdx", "1", True, False, d):
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
+            # if computedlics:
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
+            # if computedpkglics:
+            #    bb.warn(str(computedpkglics))
+            for pkg in computedpkglics:
+                lic = d.getVar('LICENSE_%s' % (pkg))    
+                if not lic:
+                    lic = d.getVar('LICENSE')
+
+                # Splits the LICENSE values and canonicalise each license
+                # in the set of split license(s)
+                spdx_lic = split_spdx_lic(d, lic)
+                computedpkglicsperpkg = rem_false_lics(d, computedpkglics[pkg])    
+               
+                # Displays warnings for licenses found in the recipes and not sources
+                if spdx_lic - computedpkglicsperpkg:
+                    package_qa_handle_error("license_source_spdx", f'License for package {pkg} is {computedpkglicsperpkg} (source SPDX headers) vs {spdx_lic} (LICENSE)', d)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

