Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.1305.1615332713945874754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IEU8bieV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id m22so30208174lfg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ou39uoAUsQwDKOzegVufNyaDF2/njUXUysxBnLJSXDI=;
        b=IEU8bieVjfzJcX9gGOpN9CtpInSh7iKE1i/fTP09Rf6TUxA02S9kKXDY8Ad/R4QxbZ
         iOSi5tS2D85N63ZMAQ36u3oybSbMHekj3aTyKIKxLoE29s5D8qXE8FA3MqhNsA+8CilJ
         Jt4lPYyoTLGiMI9f+w68RnUQ4Csy9tamQ+bXv+AYJmKfTQIfA8AHRgAEkoSEYcGd0MVQ
         TS7oMKj1KFVqJPGg/JxgIMA98u4BvZf02qLUpsnIGS4MTAVuTGk64HIC3b3ab/eaHs29
         Z8BS15Lgp7h+Q2ue4FKsl53I43jA5qTobaSh580op5R1JL/blyGnhGkSeoiVhlu231nZ
         ea9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ou39uoAUsQwDKOzegVufNyaDF2/njUXUysxBnLJSXDI=;
        b=RN4HIcWlO1v9/pMUxJKkajxytY9DAhxdE29+HJLMXy4AhIxc9gRRthFgaEw5stNR3c
         lbfQblR+YvqiVjNa/didUVxjhVMgxU5tUJh0CE392HPGnnSK2L35NgGBeGfmFghC4Sp3
         I8F6rfk3gpIMnSNJZzzj/6TVy3rh2i53Rr8hczYhATzop+tZGKz3+CgXpxEDF5WAdmpu
         ZJLMdI+mnrjDGnruoxDaV9DpgdBbG28nzV1y5lHzF8vQc/gTFYquU/67jF9FnjCTDvup
         6TloLTkWvVhXYz51vn+bWAB7g52aLMbtpSJP85HYgyrtc35wVdP5wQx7LzLS8bnEXoJb
         uWKQ==
X-Gm-Message-State: AOAM530vPnKJoDdfHj6OLoM+Lb7Tf2Kawe9O5azr3VhrDnUzycgniIhV
	EZhq1LEFqbyDLR3GEV+MhAeeoWYl3ujWtA==
X-Google-Smtp-Source: ABdhPJym/bhuZ5utduUudB2WW7rlMpqFVuzJcyrjYNLRTB3zBCyxuR4dnprqBbzctWKAYRxCnXIyuA==
X-Received: by 2002:a19:6801:: with SMTP id d1mr245020lfc.561.1615332712005;
        Tue, 09 Mar 2021 15:31:52 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.101.11])
        by smtp.gmail.com with ESMTPSA id h19sm2261765lfc.87.2021.03.09.15.31.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:31:51 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH 4/4] Moved logic to get filelics from package.bbclass to license.py
Date: Wed, 10 Mar 2021 00:31:30 +0100
Message-Id: <20210309233130.104839-4-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309233130.104839-1-idadelm@gmail.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to obtain filelics is moved from package.bbclass to license.py as a standalone function.
Also, the check in package.bbclass after obtaining filelics ensures licenses with * WITH Linux-syscall-note" are ignored, as long as they're only in header files.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 24 ++++++------------------
 meta/lib/oe/license.py       | 29 ++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8c0a49ad76..a2e0eab848 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1721,25 +1721,13 @@ fi
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
+            for k, v in flics.items():
+                if k.endswith(".h") and v.endswith("WITH Linux-syscall-note"):
+                    continue
+                else:
+                    filelics[k] = v
             with open(data_file + ".filelics", 'w') as f:
                 f.write(json.dumps(filelics, sort_keys=True))
 
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 9e9957be1d..3c40fa73eb 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -3,6 +3,8 @@
 #
 """Code for parsing OpenEmbedded license strings"""
 
+import subprocess
+import bb
 import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
@@ -258,4 +260,29 @@ def split_spdx_lic(licensestr,d):
     """
     split_lic = list_licenses(licensestr)
     spdx_lic = set([canonical_license(l, d) for l in split_lic])
-    return spdx_lic
\ No newline at end of file
+    return spdx_lic
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
\ No newline at end of file
-- 
2.25.1

