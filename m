Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id C809E78849
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 22:59:39 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o13so926854ito.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NtaARg95grYEV3aUaiUR3FGtKz06efuY8tb+OS5q7IY=;
	b=dVazDaSjpvlXi55d8nKp0wpfZ2sqezF7MoQfd/Fy9msYlag/MXpVHD9JpQfCJNDdhz
	SjX4CECLSjNQlIr27MvoVLmXERGneby2MyKABXj+oO8Xv4vs5oShTvFYh8H3Vk7ZRiiE
	EcTtBlG8Bpix3PGiYTc6N5oWttYh/o/kBsIsHUcu/w9IjjeQUx2kXYLoGDVpM9UVPF1l
	qAKgLMpolfdRA+SFLjE/GhcfT9iIaYY+kGFg1f5Qvyj3XI8qY9xRx4W6e+x2iLmyu0vi
	0ZPeTixRL9v0H9iV+KRajIWDnE3R1Zb+oLTUXQwzVrw6GcNBvLIBUTza8EOySmghihTi
	HLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NtaARg95grYEV3aUaiUR3FGtKz06efuY8tb+OS5q7IY=;
	b=MbPGEVfMT8nzsVYyrBNLSib+LFu6clPTbFunYMlLxa5fzUAAnmjTtffLHZa8WPAbVv
	6dU9+hPd8MEOKNw8YM99qBhPhc4DP7l6LWY551hXKxtlLh8krT5jM0s+yNw/lLgaFtUx
	5VZHv5TYv5yMSXR7gH+ppOSci7CfIlgAiMfQL/3BLYRjQwdZgmwBQsADFmFnnkA1k3m3
	K/YYrqFgrlbNYLfJiZEdB6/OKUDgvGRC5YhNz0FAS1c4WWqopKLlTdvUvH+l7YUPdQOq
	QZKLPdzCmu9hc2VuwmEBm7hMp7n+g9t7YmGLFVZjqHSmQjeCNJh/RVIh2AZJKbX7skry
	jvvg==
X-Gm-Message-State: APf1xPBpsanmqY6IT1R9Y5E2xLmPxjk1yRk6VysmDguNZ0KqZwTxip0I
	LiricNrkyUxX7EW4BEvTgUbtven8
X-Google-Smtp-Source: AG47ELucSMaFaff/JgvAvn4upsPVuA0mqzcZdst0Zi2NfdEqw2nhioOCjt+/YkTXxcCyB/YilvKXfw==
X-Received: by 10.36.248.7 with SMTP id a7mr111008ith.10.1519340380694;
	Thu, 22 Feb 2018 14:59:40 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v2sm646028iob.21.2018.02.22.14.59.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 14:59:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 16:59:31 -0600
Message-Id: <20180222225931.32718-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] icecc: Remove several getVar() expand arguments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 22:59:39 -0000

Several of the calls to getVar() were either superfluously passing
True for the expand argument, or were wrongly passing False

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 48a51310c21..36dcfbe6048 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -58,7 +58,7 @@ def icecc_dep_prepend(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
-    if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
+    if not d.getVar('INHIBIT_DEFAULT_DEPS'):
         return "icecc-create-env-native"
     return ""
 
@@ -66,21 +66,20 @@ DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
 get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
-    kernel_cc = d.getVar('KERNEL_CC', False)
+    kernel_cc = d.getVar('KERNEL_CC')
 
     # evaluate the expression by the shell if necessary
     if '`' in kernel_cc or '$(' in kernel_cc:
         import subprocess
         kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True).decode("utf-8")[:-1]
 
-    kernel_cc = d.expand(kernel_cc)
     kernel_cc = kernel_cc.replace('ccache', '').strip()
     kernel_cc = kernel_cc.split(' ')[0]
     kernel_cc = kernel_cc.strip()
     return kernel_cc
 
 def get_icecc(d):
-    return d.getVar('ICECC_PATH', False) or bb.utils.which(os.getenv("PATH"), "icecc")
+    return d.getVar('ICECC_PATH') or bb.utils.which(os.getenv("PATH"), "icecc")
 
 def create_path(compilers, bb, d):
     """
@@ -115,7 +114,7 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icecc(bb,d):
-    if d.getVar('ICECC_DISABLED', False) == "1":
+    if d.getVar('ICECC_DISABLED') == "1":
         # don't even try it, when explicitly disabled
         return "no"
 
@@ -129,7 +128,7 @@ def use_icecc(bb,d):
     pn = d.getVar('PN')
 
     system_class_blacklist = []
-    user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL', False) or "none").split()
+    user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
     package_class_blacklist = system_class_blacklist + user_class_blacklist
 
     for black in package_class_blacklist:
@@ -146,8 +145,8 @@ def use_icecc(bb,d):
     # e.g. when there is new version
     # building libgcc-initial with icecc fails with CPP sanity check error if host sysroot contains cross gcc built for another target tune/variant
     system_package_blacklist = ["libgcc-initial"]
-    user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL', False) or "").split()
-    user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL', False) or "").split()
+    user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
+    user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
 
     if pn in package_blacklist:
@@ -158,7 +157,7 @@ def use_icecc(bb,d):
         bb.debug(1, "%s: found in whitelist, enable icecc" % pn)
         return "yes"
 
-    if d.getVar('PARALLEL_MAKE', False) == "":
+    if d.getVar('PARALLEL_MAKE') == "":
         bb.debug(1, "%s: has empty PARALLEL_MAKE, disable icecc" % pn)
         return "no"
 
@@ -188,13 +187,13 @@ def icecc_version(bb, d):
     if use_icecc(bb, d) == "no":
         return ""
 
-    parallel = d.getVar('ICECC_PARALLEL_MAKE', False) or ""
-    if not d.getVar('PARALLEL_MAKE', False) == "" and parallel:
+    parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
+    if not d.getVar('PARALLEL_MAKE') == "" and parallel:
         d.setVar("PARALLEL_MAKE", parallel)
 
     # Disable showing the caret in the GCC compiler output if the workaround is
     # disabled
-    if d.getVar('ICECC_CARET_WORKAROUND', True) == '0':
+    if d.getVar('ICECC_CARET_WORKAROUND') == '0':
         d.setVar('ICECC_CFLAGS', '-fno-diagnostics-show-caret')
 
     if icecc_is_native(bb, d):
@@ -205,7 +204,7 @@ def icecc_version(bb, d):
         prefix = d.expand('${HOST_PREFIX}' )
         distro = d.expand('${DISTRO}')
         target_sys = d.expand('${TARGET_SYS}')
-        float = d.getVar('TARGET_FPU', False) or "hard"
+        float = d.getVar('TARGET_FPU') or "hard"
         archive_name = prefix + distro + "-"        + target_sys + "-" + float
         if icecc_is_kernel(bb, d):
             archive_name += "-kernel"
@@ -214,7 +213,7 @@ def icecc_version(bb, d):
     ice_dir = icecc_dir(bb, d)
     tar_file = os.path.join(ice_dir, "{archive}-{version}-@VERSION@-{hostname}.tar.gz".format(
         archive=archive_name,
-        version=d.getVar('ICECC_ENV_VERSION', True),
+        version=d.getVar('ICECC_ENV_VERSION'),
         hostname=socket.gethostname()
         ))
 
-- 
2.14.3


