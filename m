Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A49110706C6
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:48:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6655.1773481685130863625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KoSTB8Th;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439baf33150so2359254f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481683; x=1774086483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN6NAdxcmTS2ep2lPwys59W1+x7wAV+WvWHcTPJNaSY=;
        b=KoSTB8Thk1bEui2Nz5MCmetO1eAwpYpZ+d+STUREet2ZZX4nVkBXFGmGLcVdZFYZEg
         HHG5GIOJkP9qScrt0qhIV21U4+QqTDuFEpR+/z2jPjDF/9Dqcmg8gCNqKpM7vChpoUZB
         jTqYMZKtdBpN1ICq8eOO1e1+qFJDcP9FRxm80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481683; x=1774086483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FN6NAdxcmTS2ep2lPwys59W1+x7wAV+WvWHcTPJNaSY=;
        b=P2zWutd2306GiTczerPCFI/WSNPqGdBnf15rkbhOeGWNvYEcdBfUCJUR4xf20+RJEb
         VFG4vCz+ERVjMtEcDzWLWEGyFOCsIXeKT+7Q/j2dIX8udaxsuXYo+YlEz6zNZ1wt1aZM
         sS9frShSlFhg7QClEXLnirRPosfSqvY89F5B5S95GfHnlBZeK75kvBLisVNdPDS/aovZ
         F5JoWG/ArnlBOQ+X3bucSgZfm6oBdxw8kRnPO0yJOe7/sPbpbt3PWMVdkU7gLzQTEShq
         5frstdTAfd7UOum4UAyC3/aspVLApMtpx7tIuE2PfUm2UDXAJq7fkAb1z87hicXMUpIC
         gXcA==
X-Gm-Message-State: AOJu0YyvHrlbKxppspeFfwu0pTZewusjYqyAV8aUtAiX9QtYwk9CksjW
	iV1L/UtBJdCaRTiaFPCU4W9R5YstGb3AyMuqHLYILZJDN1pqIraz4X6YfNJ8+HPdtwOKyM2ptf1
	yDWiMBvU=
X-Gm-Gg: ATEYQzyZIkODl8s5qRrGQpeXpnx+fJRXxiTlAG+YTUqvARWt0z79PLVNq7+mSU4o9US
	XSFpu7G7QPOaW7DsNCtea5NmFiIxGj+XGJvS6n/RScVRgrgd/2A+FkBdEHxWzXUS+Y+TsTOCadZ
	EzjLCm59bK9kaQqZFdcsrx1LT5aRekWW1SBEaLBQdhufV1p5h1dxYvhzlN/9vkNmkzPiX3Sf7sA
	CO8iw33ay/eF5SRhd5C/HtZGxQbf7yve34G3KREgcJ4jWvqMHG4A5kzGme/A1KBzVmDvnHxch7A
	lzVawERydRq0A4ZdeJHqt207l+K7DkHdMq1KKK/MWdnP0n6R0qUW1Hw8L5ozNe8kq/4Es5wsoC2
	eR6QGDAjigRrdcwEBQNNR/yNHTn1xGBoU/xZcndxKs/3vgnvEwYeu2GJDsIVHhONRFXGpiy57BR
	hfp5b93V0v7ISdGDcWhRvqSs+0o0GZMuvEPYVkICTDvdHgVQNSdQQ=
X-Received: by 2002:a05:6000:228a:b0:439:b704:f684 with SMTP id ffacd0b85a97d-43a04d0db2emr11738374f8f.0.1773481682837;
        Sat, 14 Mar 2026 02:48:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26554680f8f.20.2026.03.14.02.48.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:48:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] allarch/lib: Convert core of allarch code into a function
Date: Sat, 14 Mar 2026 09:47:56 +0000
Message-ID: <20260314094758.3929192-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233078

We need to call the functionality in allarch.bbclass from other contexts
and the current conditionals are problematic enough without further changes
confusing things. Move the code to a funtion in oe.utils so we can call
it as needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/allarch.bbclass | 41 +------------------------
 meta/lib/oe/utils.py                | 47 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index e429b924370..7cdaa63ae2c 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -25,46 +25,7 @@ python () {
     # Allow this class to be included but overridden - only set
     # the values if we're still "all" package arch.
     if d.getVar("PACKAGE_ARCH") == "all":
-        # No need for virtual/libc or a cross compiler
-        d.setVar("INHIBIT_DEFAULT_DEPS","1")
-
-        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
-        # naming anyway
-        d.setVar("baselib", "lib")
-        d.setVar("TARGET_ARCH", "allarch")
-        d.setVar("TARGET_OS", "linux")
-        d.setVar("TARGET_CC_ARCH", "none")
-        d.setVar("TARGET_LD_ARCH", "none")
-        d.setVar("TARGET_AS_ARCH", "none")
-        d.setVar("TARGET_FPU", "")
-        d.setVar("TARGET_PREFIX", "")
-        # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
-        # (this removes any dependencies from the hash perspective)
-        d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
-        d.setVar("SDK_ARCH", "none")
-        d.setVar("SDK_CC_ARCH", "none")
-        d.setVar("TARGET_CPPFLAGS", "none")
-        d.setVar("TARGET_CFLAGS", "none")
-        d.setVar("TARGET_CXXFLAGS", "none")
-        d.setVar("TARGET_LDFLAGS", "none")
-        d.setVar("POPULATESYSROOTDEPS", "")
-
-        # Avoid this being unnecessarily different due to nuances of
-        # the target machine that aren't important for "all" arch
-        # packages.
-        d.setVar("LDFLAGS", "")
-
-        # No need to do shared library processing or debug symbol handling
-        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
-        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
-        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
-
-        # These multilib values shouldn't change allarch packages so exclude them
-        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
-        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
-        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
-
-        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
+        oe.utils.make_arch_independent(d)
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 2b39d4e0ddb..afcfeda0c6d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -511,3 +511,50 @@ def touch(filename):
         # Handle read-only file systems gracefully
         if e.errno != errno.EROFS:
             raise e
+
+#
+# Set datastore variables to convert to an architecture independent state
+# Used by allarch recipes and other cases where arch independence is needed
+#
+def make_arch_independent(d):
+    # No need for virtual/libc or a cross compiler
+    d.setVar("INHIBIT_DEFAULT_DEPS","1")
+
+    # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
+    # naming anyway
+    d.setVar("baselib", "lib")
+    d.setVar("TARGET_ARCH", "allarch")
+    d.setVar("TARGET_OS", "linux")
+    d.setVar("TARGET_CC_ARCH", "none")
+    d.setVar("TARGET_LD_ARCH", "none")
+    d.setVar("TARGET_AS_ARCH", "none")
+    d.setVar("TARGET_FPU", "")
+    d.setVar("TARGET_PREFIX", "")
+    # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
+    # (this removes any dependencies from the hash perspective)
+    d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
+    d.setVar("SDK_ARCH", "none")
+    d.setVar("SDK_CC_ARCH", "none")
+    d.setVar("TARGET_CPPFLAGS", "none")
+    d.setVar("TARGET_CFLAGS", "none")
+    d.setVar("TARGET_CXXFLAGS", "none")
+    d.setVar("TARGET_LDFLAGS", "none")
+    d.setVar("POPULATESYSROOTDEPS", "")
+
+    # Avoid this being unnecessarily different due to nuances of
+    # the target machine that aren't important for "all" arch
+    # packages.
+    d.setVar("LDFLAGS", "")
+
+    # No need to do shared library processing or debug symbol handling
+    d.setVar("EXCLUDE_FROM_SHLIBS", "1")
+    d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
+    d.setVar("INHIBIT_PACKAGE_STRIP", "1")
+
+    # These multilib values shouldn't change allarch packages so exclude them
+    d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
+    d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
+    d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
+
+    d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
+

