Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F32C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:29:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8725.1751405357783705122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IALRyU/Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3572262f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751405356; x=1752010156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yTZvk14siFMY0sm1dzFkatJxyOenLPTTSvYBFo+a40=;
        b=IALRyU/Zb1S6FxYmQytRvFqoW55+bdh31JDxaFuQELEyLMDXfSSL7rH9NKIdnyofVG
         ugYdU1XhjOV//Yoabxbf491VbwOfn0LoXbhOyeorS9neZAYsS9DcDcykSK9x1YuUyZxi
         VaZkMrTyrpAE2tUXaXkejFo0wYhJ3aaXwicrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405356; x=1752010156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yTZvk14siFMY0sm1dzFkatJxyOenLPTTSvYBFo+a40=;
        b=b0kZ9xfur8/a7JMmwTN1vYAT19/xUomgZosYdfduMi/37thjXK6xUpVsF1e8xun0o8
         kuSlg9y776tjAY/7l5KD386afTbBauwMX2Vh+AxukjIgSAhmv0gNlk/nDLTR3YNx26Xz
         q+tW/9YE4lv02Yxruc7+h3T6FBe/rpNoiahLheRSRmjZzcIuVrna6b0/W3sBYCSL236C
         yCTlZ0E4VOKACCrFg3t6SaFoDqqKnxSlmiPjEvYV58ljuGWekJhenx+5vGCahp7LdIrl
         tJkLhroxARhNxwI1XyEEy7k7pzsgIKRSJL8HCOLs0CP79stcowktO1bNlCU0yVkxFc4i
         9www==
X-Gm-Message-State: AOJu0YxO93osz98oqr63n8toBS1wUJPYw8LR4n222hMuB/0wBsC0izsz
	GKQhl3p+YUqK6vOmIT0GnWjMTzLnYhwEtJZoq8lg9YPQgFuLVJyQMUJF/cE7wDoHXLcZxRvrBH5
	YX8Aa
X-Gm-Gg: ASbGnctLKEfpBt22QOQraD/xd8LqgcAYlxRQmhIU4XbVcqiGHAc5J/JF1zOepYWlyfo
	BVdKOkoiXOCCF+nGHZjyjCu8dMlZbagQdje47YNWfdXUU7o0rnqwvtpwkxHAvMcpg3zWE/yPpQR
	N/2jzUHBnOZRDLckbvNFk6VTKPgc7TJx6vgTnFV/LLT23isHWd7c9N06Dh/VCWHrEvnSXOvAUMv
	+gMbFRhNn9dPUgLUi3d56LFkiv0L1BJa0E+5Lf76jve12F90kbk0UQMTaPQXTDRSjExyg/nG4vu
	kbMnmSewQF838ttY0qMhHPruIIg3eKiSKkqYTh3tZQp9nl/3cOJKFSA76TYnfS5cxiMA7L1JxKJ
	aDqI3Gc9fpat7YuU=
X-Google-Smtp-Source: AGHT+IGmimvmks46jgcR4StTV/+lqy9dnw1BtdAtEPN9Q3/FjeoXitZ709Yxe0gBsbrZUH4uzuEvVA==
X-Received: by 2002:a5d:5f81:0:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3b20095cf64mr32330f8f.51.1751405355480;
        Tue, 01 Jul 2025 14:29:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3a96sm207267725e9.35.2025.07.01.14.29.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:29:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity/utils: Directly use gcc, not BUILD_CC
Date: Tue,  1 Jul 2025 22:29:13 +0100
Message-ID: <20250701212913.3556177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219729

The test/helper is written assuming gcc, so just call that and stop
accessing BUILD_CC which may be set to clang.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass |  9 +++------
 meta/lib/oe/utils.py               | 17 ++++++-----------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index d1452967fc1..3c103d3bfb3 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -514,12 +514,9 @@ def check_userns():
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
-    import subprocess
-    
-    build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
-    if build_cc.strip() == "gcc":
-        if bb.utils.vercmp_string_op(version, "8.0", "<"):
-            return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    version = oe.utils.get_host_gcc_version(sanity_data)
+    if bb.utils.vercmp_string_op(version, "8.0", "<"):
+        return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0378071b5ca..779c5e593f4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -415,34 +415,29 @@ def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
     return output_str
 
 
-# Helper function to get the host compiler version
-# Do not assume the compiler is gcc
-def get_host_compiler_version(d, taskcontextonly=False):
+# Helper function to get the host gcc version
+def get_host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
 
     if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
         return
 
-    compiler = d.getVar("BUILD_CC")
-    # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
-        compiler = compiler[7:]
     try:
         env = os.environ.copy()
         # datastore PATH does not contain session PATH as set by environment-setup-...
         # this breaks the install-buildtools use-case
         # env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
+        output = subprocess.check_output("gcc --version", \
                     shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
+        bb.fatal("Error running gcc --version: %s" % (e.output.decode("utf-8")))
 
     match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
-        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+        bb.fatal("Can't get compiler version from gcc --version output")
 
     version = match.group(1)
-    return compiler, version
+    return version
 
 @bb.parse.vardepsexclude("DEFAULTTUNE_MULTILIB_ORIGINAL", "OVERRIDES")
 def get_multilib_datastore(variant, d):

