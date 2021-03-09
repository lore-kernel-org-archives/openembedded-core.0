Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.1304.1615332712965333897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nM6GqWnN;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id v2so17215194lft.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LSzncJbOM3xDPBPaL6fgeyA3DBpUQVK5iBk2w9MCmK4=;
        b=nM6GqWnN9ozAiZtqttQHJR1UMzeoFnGALRTgGvjpToXeZqXST0DhnCIo460cfVZZKp
         4z0xmTnBMGoELOphRD0k0htoxcGrdTWftKwfmVUFYiBzTHbyOoxdUj0VnfE8kqLslY+e
         UUGevIdnBxz53zDqsC0dhnzfSgwocgDo4jrBqn5Zs6BG/nzinfLpC2ETcaY8PHzma+GC
         sPO4iXwX6BvHFFOIqamiGIrJLjqZpWg4Zo5kfPbMGjzFMrfaHuYUnnPZc0omMqfksvsK
         3A+OUt8ayuejLFalAFU2Odskyh1lNyF2TMSwTI5+jl0x0IoW5WiIAE6+byl1YqoPxq+s
         aOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LSzncJbOM3xDPBPaL6fgeyA3DBpUQVK5iBk2w9MCmK4=;
        b=RqhqmM16DorPqxeJX/VnnZzcoWZ4ZO78DusOPF+0PmkTT5h8FTE0+WWNkyuMKhsKHa
         iJEr5PcHumMFTiVHatuEAD4M3nOy3gaRntZJ6DywgK9XBFJOiVdrcaY4j/88ONR16JMo
         yLWMURA+YRJXt7zfvWsYdzZXY26OsCiA2VblZP6g1NAKwin45FQIOUMsc7GwVZ+VHNON
         Wsojo/DXcyFL24WvnJoNiQN+veZPneJ+fWyP++HETnZ7BXg43SjjBB8Ce+QkDpNA5DKg
         E0uGjQlSjOeRLOXmrc7UKKAK8mylt6Hf1Q3tmXjBodmIssp7kUzEFNvdT70RHHPJVPHv
         ePeA==
X-Gm-Message-State: AOAM531Mn43vSAiAhl/0jDyktuxQJ4+jv246SeVkS0kU/ZwCTMDp+taA
	XgyB2ApkbsBIx0qRfbUCxnbFLnKI/I1UtA==
X-Google-Smtp-Source: ABdhPJy+EmFtPMgO+rPa/kwr438A2TNiKVBBArjkZQ2k9XgjDrUeLQIoIJi2xSaMnqZxNM6u6ojrKw==
X-Received: by 2002:a19:c792:: with SMTP id x140mr253100lff.215.1615332710749;
        Tue, 09 Mar 2021 15:31:50 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.101.11])
        by smtp.gmail.com with ESMTPSA id h19sm2261765lfc.87.2021.03.09.15.31.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:31:50 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH 3/4] package.bbclass: Add handle_qa_error check
Date: Wed, 10 Mar 2021 00:31:29 +0100
Message-Id: <20210309233130.104839-3-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309233130.104839-1-idadelm@gmail.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

package_qa_handle_error() from insane.bbclass handles display of warnings by allowing the user decide whether they want the issues treated as warnings, errors or hidden completely. This is done by setting a variable "license_source_spdx" in local.conf.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 128 ++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4e1be661b3..8c0a49ad76 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1552,6 +1552,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 
 python emit_pkgdata() {
     import oe.license
+    import bb.utils
     from glob import glob
     import json
     import subprocess
@@ -1712,70 +1713,71 @@ fi
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
-        
-        
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
-        
-        for pkg in computedpkglics:
-            lic = d.getVar('LICENSE_%s' % (pkg))
-            if not lic:
-                lic = d.getVar('LICENSE')
-
-            # Splits the LICENSE values and canonicalise each license
-            # in the set of split license(s)
-            spdx_lic = oe.license.split_spdx_lic(lic, d)    
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
+            
+            
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
             
-            # Displays warnings for licenses found in the recipes and not sources
-            if spdx_lic - computedpkglics[pkg]:
-                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], spdx_lic))
+            for pkg in computedpkglics:
+                lic = d.getVar('LICENSE_%s' % (pkg))
+                if not lic:
+                    lic = d.getVar('LICENSE')
+
+                # Splits the LICENSE values and canonicalise each license
+                # in the set of split license(s)
+                spdx_lic = oe.license.split_spdx_lic(lic, d)    
+                
+                # Displays warnings for licenses found in the recipes and not sources
+                if spdx_lic - computedpkglics[pkg]:
+                    package_qa_handle_error("license_source_spdx", f'License for package {pkg} is {computedpkglics[pkg]}(source SPDX headers) vs {spdx_lic} (LICENSE)', d)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

