Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.27817.1598558695616135824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 13:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hHSW21F0;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id o12so7213821qki.13
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kROvrdhubfyT2JlmRXRkCqMv2vqem5/187nBLEH1Oa4=;
        b=hHSW21F02YtJWSRdqSVV4VEbimVpaEq2gx7KvhfGS2DiVNIi8F+VhO2d9SrWWgynLo
         W5M9HZ6XggLIjjHf6X4/ujNFTiamQKCCXjDuQLONm82FI7cargz82nJdBhClZkjcESed
         otmEBWC038Q7g9cA5SINjtrwNU7l5Fxg8lbKiCR1TjKSR33d5kVuNzj2/qcWLU8I8oSE
         Q0N0Rro8HnSlfz7OorUgeJU5n5Ix/IWPDnR9BUZxnaVPiis7eqxWMmYmQhM/4DtfvwwH
         9AfXqcXSOldzwPNSYhZtTHme7dstCh3NyeoBG00RPjVmZsJjloCLxUvy/3KwnCQACnfc
         J6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kROvrdhubfyT2JlmRXRkCqMv2vqem5/187nBLEH1Oa4=;
        b=lYA1bG6S74D/TfIlJ2q/BNArO+P2TyXzed33nVbCGHVW2va+mJRuElwp0mHkOwtj6D
         PmurvNhqnRe+/exhL04zhfHcUEs5ySQlpJDOGlBqPSq8jbBJe7MagkgiIkxs9wmRTeA2
         Yy5zaTmECa0HeGBy6eGp2bEldk54T88XgvC+43I0DYmSKWFwNDwDEas2BparmRQx702d
         aSEbaukvZTAbdXa3ihkt/HFgv3LVwXTF6+ypNiYEp8hLUoid+frLG9w+m80A9u0NKL/W
         SwWQ9IhndQfcm7TO/ouQBD69sFkQ2VzpWG07rQltOVTstgcqWNWU8EwxROTCxDodj6l0
         FeRQ==
X-Gm-Message-State: AOAM530dnCBS6z7HmTJz+xr+vfv69/+ZYnYRNHb4Z1odBUwyyIL4/E+k
	OzTMC0c/fxkJ5f1gO1UnDIk=
X-Google-Smtp-Source: ABdhPJxCm9ew7kxa4HuEnUWj6nXI+Hp75jKR2gIczRBxz0TKkMmS1tRV8wpjpmXdlmZ05CXNSXE63g==
X-Received: by 2002:a05:620a:c99:: with SMTP id q25mr19784277qki.19.1598558694611;
        Thu, 27 Aug 2020 13:04:54 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id b23sm2651966qtp.41.2020.08.27.13.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:04:53 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel-yocto: checksum all modifications to available kernel fragments directories
Date: Thu, 27 Aug 2020 16:04:47 -0400
Message-Id: <20200827200447.36436-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is based on the patch from Zhaolong Zhang <zhangzl2013@126.com>
[kernel-yocto: checksum indirect cfg and scc files]

While the recommended manner to share/reuse feature fragments is to
maintain them in a kernel-meta repository and track the changes via the
standard SRCREV fetcher mechanism, that method is not always practical
for small sets of features or for quick testing of changes.

These other flows use .scc files on the SRC_URI. It has been noted that
config fragments or other features indirectly included by those .scc
files will not trigger the kernel meta-data to be re-run and hence a
build can continue with stale data (or not be triggered at all).

To solve this issue, we can collect the directories that are searchable
via FILESEXTRAPATHS and add them to the do_kernel_metadata task
checksum.

This allows modifications, additions and removals from the potential
kernel feature directories to trigger a re-execution of the meta data
task.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: at Richard's suggestion, the searching function is simplified to
    not use os.walk(). This has the potential of adding some directories
    that don't have .cfg and .scc files to the checksum, but that won't
    add signficant re-executions of the task.

 meta/classes/kernel-yocto.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 96ea612258..c6a128ebfe 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -85,6 +85,21 @@ def get_machine_branch(d, default):
 	    
     return default
 
+# returns a list of all directories that are on FILESEXTRAPATHS (and
+# hence available to the build) that contain .scc or .cfg files
+def get_dirs_with_fragments(d):
+    extrapaths = []
+    extrafiles = []
+    extrapathsvalue = (d.getVar("FILESEXTRAPATHS") or "")
+    # Remove default flag which was used for checking
+    extrapathsvalue = extrapathsvalue.replace("__default:", "")
+    extrapaths = extrapathsvalue.split(":")
+    for path in extrapaths:
+        if path + ":True" not in extrafiles:
+            extrafiles.append(path + ":" + str(os.path.exists(path)))
+
+    return " ".join(extrafiles)
+
 do_kernel_metadata() {
 	set +e
 
@@ -367,6 +382,7 @@ do_kernel_checkout[dirs] = "${S}"
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
+do_kernel_metadata[file-checksums] = " ${@get_dirs_with_fragments(d)}"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
-- 
2.19.1

