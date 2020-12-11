Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.3670.1607672214198337033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 23:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: qLHEnxmRm3nXZvEWfrwVqcxfJgOF4d5xrCT/I1ecHo/XQ+KpXAnYsIunT80/eWX8izg4DuSmlG
 j1Pf42IGcEYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="235988020"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="235988020"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 23:36:53 -0800
IronPort-SDR: //2Ta28Kj/+UQSJY2U6npmDalqybXpRSM4VrB9WBZnbEkHMW4mbFj3ZnSzedIlkjvEfYDJFLPf
 3K7pSnogtX0Q==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="374067379"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.129.147])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 23:36:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair@alistair23.me
Subject: [PATCH 1/2] mesa: add more details to elf-tls patch
Date: Fri, 11 Dec 2020 15:36:39 +0800
Message-Id: <20201211073640.479105-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include link to upstream report and the last autobuilder failure [1]
so it's easy to identify why this is needed in future.

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1160/steps/8/logs/step1c

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0002-meson.build-make-TLS-ELF-optional.patch  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index 74f7fe5c2d..89c0d150fa 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -6,6 +6,21 @@ Subject: [PATCH] meson.build: make TLS ELF optional
 USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
 TLS GLX optional again" patch updated to the latest mesa.
 
+For details, see:
+https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
+
+This prevents runtime segfault on musl:
+
+Traceback (most recent call last):
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
+    return func(*args, **kwargs)
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
+    self.assertEqual(errcount, 0, msg=self.msg)
+AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
+-----------------------
+Central error: [    10.477] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
+***********************
+
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Alistair Francis <alistair@alistair23.me>
 
-- 
2.29.2

