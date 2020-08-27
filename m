Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.24982.1598550851808682249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nQYBV8lv;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id e5so2359972qvr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IcFrPw/9ipISI7qpYuJdDJkATzWZmP6HJBvKqYn6YjA=;
        b=nQYBV8lvoHM01mipHIixZCgMLM74krh2AXCfy2FNwwUGienrj1J6KUOn9dhz1tMNws
         dXV6keJxfwYyB1K2EI3Hqgs3cs9pfFwlys+ZwZRWHfgC4h8pBKM5HpSHhfuU3OmmkDd+
         meCpJ42gZsym8H9Syq8ViD3cUADUaC0++LUeFTqpJfGax/prQT00SdsxD00VKGFIMbNB
         W88vyUrwyoq76VZTnApsVOgwthrJg5fbfsuBYjL2D+Hc7EXC0gzl+CFWYnf9MT6Pdc58
         5g0YJaOmf6qxsh2rw2UYXz3Xoda1hEUsK9yEzvjMOFxpnVIGudSE5uE3cB2zMCGNQ57H
         STJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcFrPw/9ipISI7qpYuJdDJkATzWZmP6HJBvKqYn6YjA=;
        b=pJREe+6WOg59O94w4ca2HF1Pz9ZboGkz9/vd1smi7ES1HBDVC2dpluWa4IIxSgN5f9
         Qw/AH/eno75lKdXjpZfj2CEBm3pOID6EjWmxlZvMjX+2NaMxHbtCQ18Yj0mRGvGeTZEd
         ltNNVwakhItfuIU0e59iaDILKZMtaf2r6jIV7xrqgCZLz9CFcEVnzkyK+oKdDnn3y6ay
         c6OHpx/rmd/CYcdaaGLtPkkbMxXFbo480PTB8sw6Kp4zVrv/ujZ0Ysem0z89JSSP4u1a
         ep5BO+gRJsEFkqX7I2N1SQtY4RP1Ylya74m7AMSROcjv8g16aiPUBnfMRTOTD0k3hfuS
         x/WQ==
X-Gm-Message-State: AOAM530DNAc85DtzVJWPKjZSozEcYesLQoMkKL1vbVou2m8m4zMC9Hrj
	KTWCxU9AT99qo4qJJg+jWM+N+05cnzxkYDXT
X-Google-Smtp-Source: ABdhPJybFAtdkA08GcHt4NODUHwpxPpx+9PwPVEeItyHoMnEdGqsydFhhAsTdXrWxd2J4rdF+vonMw==
X-Received: by 2002:a0c:aece:: with SMTP id n14mr19940439qvd.68.1598550850943;
        Thu, 27 Aug 2020 10:54:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f4sm2339963qtp.38.2020.08.27.10.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:54:10 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] kernel-yocto: checksum all modifications to available kernel fragments directories
Date: Thu, 27 Aug 2020 13:54:02 -0400
Message-Id: <65ff63b09606fe072c48be80f95d16255a529843.1598550535.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598550535.git.bruce.ashfield@gmail.com>
References: <cover.1598550535.git.bruce.ashfield@gmail.com>
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
 meta/classes/kernel-yocto.bbclass | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 96ea612258..34a0ff8f84 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -85,6 +85,44 @@ def get_machine_branch(d, default):
 	    
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
+        for root, dirs, files in os.walk(path):
+            for name in files:
+                base, ext = os.path.splitext(name)
+                if ext and ext in [".scc", ".cfg"]:
+                    if path + ":True" not in extrafiles:
+                        extrafiles.append(path + ":" + str(os.path.exists(path)))
+
+    return " ".join(extrafiles)
+
+# returns a list of all the .scc and .cfg files that are on FILESEXTRAPATHS
+# (and hence available to the build)
+def get_fragments_in_filesextrapaths(d):
+    extrapaths = []
+    extrafiles = []
+    extrapathsvalue = (d.getVar("FILESEXTRAPATHS") or "")
+    # Remove default flag which was used for checking
+    extrapathsvalue = extrapathsvalue.replace("__default:", "")
+    extrapaths = extrapathsvalue.split(":")
+    for path in extrapaths:
+        for root, dirs, files in os.walk(path):
+            for name in files:
+                base, ext = os.path.splitext(name)
+                if ext and ext in [".scc", ".cfg"]:
+                    filepath = os.path.join(root, name)
+                    extrafiles.append(filepath + ":" + str(os.path.exists(filepath)))
+
+    return " ".join(extrafiles)
+
 do_kernel_metadata() {
 	set +e
 
@@ -367,6 +405,7 @@ do_kernel_checkout[dirs] = "${S}"
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
+do_kernel_metadata[file-checksums] = " ${@get_dirs_with_fragments(d)}"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
-- 
2.19.1

