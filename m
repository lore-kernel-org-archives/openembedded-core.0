Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.21896.1595728581986613423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 18:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@babayev.com header.s=google header.b=LSi79lci;
 spf=pass (domain: babayev.com, ip: 209.85.210.193, mailfrom: ruslan@babayev.com)
Received: by mail-pf1-f193.google.com with SMTP id k18so12994pfp.7
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 18:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eifrL8mXRIRXy8kDwx832vBDrvTuEY/6dLteIOJ8HWE=;
        b=LSi79lciiGKnz2Feobiw25FWHytUSFWBLimy+6TCZrNYRDySaYA9owEqI34l7FCjVv
         v/oBCG2zKf4FGfSZWvXjtvoJraAm4TBnP6yFShS8gst2+u+ssQU7b3bCd3k6aY+GRHHN
         hRMt3YUqSZENIpfI8WZeVjkBfxGs6Y71m3kBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eifrL8mXRIRXy8kDwx832vBDrvTuEY/6dLteIOJ8HWE=;
        b=KytGS5+i6G9QKqzyuDWP/xCeQVoDzDl9O97z/2IRV2Z+yzpVuOhKUhsc8zXEFIIKs5
         Go9jVl/s3rKGwvmhojSfP1FJGmWgu1sUZLaLnhNaSH47LPEepJqQ+5xA3kwvrYN3E4j4
         n887l/1l9oNQA+TkF/+w3aqT32HUXSl1UGr5o6Y72sui4Pv2O+yH45KFKDSokXCzTLgn
         3m5+qFcIBPs/4C/tV65WBXzvllsTkYuPwBj5C875jvf1h7IHEhNVOGXxZhQV3JJEiUmV
         diiAflkzlvdTREDkqtwe2LymE8czlVZmwnDc9JbDeP/rREPpRbEkg1MO3Ywi1XA8yxBV
         PlKA==
X-Gm-Message-State: AOAM530QY6VwCb21jCik3OLOf3dg56kPBWmoc/bBFW9AwwZcW4aXnE7Y
	3TxCwcyXJcTKL90bNMD0WAXDmX+cSwk=
X-Google-Smtp-Source: ABdhPJwwRt5U4uMx6HlzLwSXniFIQDpQ3U2cq/eHIBsgnlaNNVPD+W9md6YzqcYnNfoWnHw/X8sp4Q==
X-Received: by 2002:a63:230e:: with SMTP id j14mr14066694pgj.107.1595728580909;
        Sat, 25 Jul 2020 18:56:20 -0700 (PDT)
Return-Path: <ruslan@babayev.com>
Received: from baku.babayev.lan (50-47-143-95.evrt.wa.frontiernet.net. [50.47.143.95])
        by smtp.gmail.com with ESMTPSA id n14sm10579704pgd.78.2020.07.25.18.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 18:56:20 -0700 (PDT)
From: "Ruslan Babayev" <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
Cc: Ruslan Babayev <ruslan@babayev.com>
Subject: [PATCH] meson: use the more specific cpu arch in cross file
Date: Sat, 25 Jul 2020 18:56:14 -0700
Message-Id: <20200726015614.2875-1-ruslan@babayev.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
---
 meta/classes/meson.bbclass                         | 14 ++++++++++++--
 .../meson/nativesdk-meson_0.53.2.bb                | 12 +++++++++++-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index ff52d20e56..0caa7a37c2 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -62,6 +62,16 @@ def meson_cpu_family(var, d):
     else:
         return arch
 
+def meson_cpu(prefix, d):
+    import re
+    arch = d.getVar(prefix + "_ARCH")
+    tune_ccargs = d.getVar("TUNE_CCARGS")
+    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
+    if m:
+        return m.group(0)
+    else:
+        return arch
+
 # Map our OS values to what Meson expects:
 # https://mesonbuild.com/Reference-tables.html#operating-system-names
 def meson_operating_system(var, d):
@@ -110,13 +120,13 @@ gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'
 cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
-cpu = '${HOST_ARCH}'
+cpu = '${@meson_cpu('HOST', d)}'
 endian = '${@meson_endian('HOST', d)}'
 
 [target_machine]
 system = '${@meson_operating_system('TARGET_OS', d)}'
 cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
-cpu = '${TARGET_ARCH}'
+cpu = '${@meson_cpu('TARGET', d)}'
 endian = '${@meson_endian('TARGET', d)}'
 EOF
 }
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
index 67add2c25e..021bff0992 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
@@ -6,6 +6,16 @@ inherit siteinfo
 SRC_URI += "file://meson-setup.py \
             file://meson-wrapper"
 
+def meson_cpu(var, d):
+    import re
+    arch = d.getVar(var)
+    tune_ccargs = d.getVar("TUNE_CCARGS")
+    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
+    if m:
+        return m.group(0)
+    else:
+        return arch
+
 def meson_endian(prefix, d):
     arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
     sitedata = siteinfo_data_for_machine(arch, os, d)
@@ -44,7 +54,7 @@ cpp_link_args = @LDFLAGS
 [host_machine]
 system = '${SDK_OS}'
 cpu_family = '${SDK_ARCH}'
-cpu = '${SDK_ARCH}'
+cpu = '${@meson_cpu("SDK_ARCH", d)}'
 endian = '${@meson_endian("SDK", d)}'
 EOF
 
-- 
2.25.1

