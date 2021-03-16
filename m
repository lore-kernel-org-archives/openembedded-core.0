Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.5699.1615884568729744747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TYJrBSrp;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: idadelm@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 15so19478464ljj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qZVWsCdezn8sRWwhHHyXDY/+Ouvh+KpiJsS1yg6ZZts=;
        b=TYJrBSrp89erC5/MUnrNzbTcsEMAh2TmKLE86Pu/qSLy/6Qu9Q4kzn8dQn1bhPiqxT
         Ss6hwqizqvX/P32BjidsWqctkXsCSQxEvwBldp6SxartESQZQOIzU7HoFID+jDixKIJg
         4L6z11Axb47houkwrTQoc72T0o5Tzh8bbFR7viYiFYQsLJ1LbkubFjBixyE4P3Gu6xvE
         Sr0Yw/PYC69030O99SAKfcjvfwbBTeeOSPC+WQakRl+n7MuK2LDr6YTSdAuXBRFmnmrU
         3dSAtfVdu6AW97aS/3fWF4rW/DlaZYsSBzZH06rjIvSr+fi+PRPZksaHTn9Gc4Fw6mbC
         Dduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qZVWsCdezn8sRWwhHHyXDY/+Ouvh+KpiJsS1yg6ZZts=;
        b=Lr7afCqw64vzSBiT2pFHSS7tfeukbse0PBtNbfqs6uF9TEsfgh/7zjHI9tbUd1BGYy
         c+H+G33f1udoNBm2l2Hm800JYUQ1IthBERtdSax1JbfZT7Lq1PbAyJAatn3TlUu8JT+S
         GN9ryDCpeXSgvKnY0SCM9IiX//pLtX84ilLHusjoZa34sgkcF4onisMlnF14547Rtc99
         ZxjmfS2eGDSgjEo2hVJZZ/dpXcpc9QjPUZ0SdPfEsxF7d6SZB1JvQHkqiPE4bTDV+LKj
         sNybqwJDNmBfer6SCwl8+Ete/1jIYApiMpytBHS46sx8mZq/o6igs6bQSvdA1RZojMfl
         R29w==
X-Gm-Message-State: AOAM532eSNtXh5VSB+nUnVBB5cEnxYeATCg722ICGAPTR1unukLJsBiT
	zUzV6IZ22HV0cHHgyLCIBfV1PeOVNC85bA==
X-Google-Smtp-Source: ABdhPJyC16KN7NhdzX4kRqp4r1RBtXgjipTs20amJLJKW8NoZrsJcPi2v90tX2KsKDRBSm++GKV6BA==
X-Received: by 2002:a2e:3818:: with SMTP id f24mr2077454lja.466.1615884566528;
        Tue, 16 Mar 2021 01:49:26 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:26 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH v2 6/6] Moved logic to get filelics from package.bbclass to license.py
Date: Tue, 16 Mar 2021 09:48:45 +0100
Message-Id: <20210316084845.379201-6-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316084845.379201-1-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to obtain filelics is moved from package.bbclass to license.py as a standalone function.
Also, the check in package.bbclass after obtaining filelics ensures licenses with * WITH Linux-syscall-note" are ignored, as long as they're only in header files.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 35 ++++++++++++-----------------------
 meta/lib/oe/license.py       | 29 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8cd7f3ad21..a2144ec08e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1715,28 +1715,19 @@ fi
             with open(data_file + ".srclist", 'w') as f:
                 f.write(json.dumps(sources, sort_keys=True))
 
+            flics = oe.license.get_filelics([d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')])
             filelics = {}
-            for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')]:
-                p = subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
-                out, err = p.communicate()
-                if p.returncode == 0:
-                    for l in out.decode("utf-8").split("\n"):
-                        l = l.strip()
-                        if not l:
-                            continue
-                        l = l.split(":")
-                        if len(l) < 3:
-                            bb.warn(str(l))
-                            continue
-                        fn = "/" + l[0]
-                        lic = l[2].strip()
-                        if lic.endswith("*/"):
-                            lic = lic[:-2]
-                        lic = lic.strip()
-                        filelics[fn] = lic
+            header_list = [".h", ".hh", ".hpp"]
+            for k, v in flics.items():
+                # This check ignores "*WITH Linux-syscall-note" licenses in header files since the headers aren't part of the original sources and come from dependencies the software links to.
+                #C/C++ headers because most of the ones being match are from the Linux kernel.
+                if k.endswith(tuple(header_list)) and v.endswith("WITH Linux-syscall-note"):
+                    continue
+                else:
+                    filelics[k] = v
             with open(data_file + ".filelics", 'w') as f:
                 f.write(json.dumps(filelics, sort_keys=True))
-
+  
             computedlics = {}
             computedpkglics = {}
             for r in sourceresult:
@@ -1745,8 +1736,7 @@ fi
                         if r[0] not in computedlics:
                             computedlics[r[0]] = set()
                         computedlics[r[0]].add(filelics[subf])
-            #if computedlics:
-            #    bb.warn(str(computedlics))
+            
             dvar = d.getVar('PKGD')
             for f in computedlics:
                 shortf = f.replace(dvar, "")
@@ -1759,8 +1749,7 @@ fi
                         computedpkglics[pkg].update(computedlics[f])
                 if not found:
                     bb.warn("%s not in %s" % (f, str(filemap)))
-            #if computedpkglics:
-            #    bb.warn(str(computedpkglics))
+            
             for pkg in computedpkglics:
                 lic = d.getVar('LICENSE_%s' % (pkg))
                 if not lic:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index dc1bc6682c..45f90ff151 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -6,6 +6,8 @@
 import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
+import subprocess
+import bb
 
 def license_ok(license, dont_want_licenses):
     """ Return False if License exist in dont_want_licenses else True """
@@ -262,3 +264,30 @@ def split_spdx_lic(licensestr,d):
     split_lic = list_licenses(licensestr)
     spdx_lic = set([canonical_license(l, d) for l in split_lic])
     return spdx_lic
+
+def get_filelics(dirs):
+    """"
+    This function returns a dictionary of file paths (keys) and their corresponding SPDX header identifiers (values).
+    """
+    filelics = {}
+    for dirent in dirs:
+        p = subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R','-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
+        out, err = p.communicate()
+        if p.returncode == 0:
+            for l in out.decode("utf-8").split("\n"):
+                l = l.strip()
+                if not l:
+                    continue
+                l = l.split(":")
+                if len(l) < 3:
+                    bb.warn(str(l))
+                    continue
+                fn = "/" + l[0]
+                lic = l[2].strip()
+                if lic.endswith("*/"):
+                    lic = lic[:-2]
+                lic = lic.strip()
+                filelics[fn] = lic
+    return filelics
+    
+
-- 
2.25.1

