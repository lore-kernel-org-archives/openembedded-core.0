Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BCEC5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 00:29:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2166.1787358570200400324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 17:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S4Tb1f/x;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954df200ddso10058275e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358568; x=1787963368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZP2N/U3W9HzIo5h+Fna/rLatIFCgYY0DoUOZEAHqsQ=;
        b=S4Tb1f/xgefLzA4RGBsdtg6LmX+pz4NcTi0ihzenE2qa9GteS4OoM/J3PjikXNvbqI
         jWcYZo1vp3e+FE+vTpQNlinkvxzGfJGiyj9+foBlkr4UtcD4d+Jct/BCvO6vx5xNgpc+
         YwST3k1bwP4LGIe29BzF9RTOtt7XPqOGG2/rJFrY639SHdBwD3FaekNygTaRLt0gY0JU
         jS6qhbjgLkZsOesdZqqXZGPW688+qRX09TDIiru+KUSRJSpK9y556AKu7gugZFDri0rw
         k5rEkrkiY8yCw38SFI3jh55PGvA1rchx9d+8bKCgdfurYt6topI9uJOo3muZlQduZEPO
         JKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358568; x=1787963368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZP2N/U3W9HzIo5h+Fna/rLatIFCgYY0DoUOZEAHqsQ=;
        b=fgPJKD25DD8NpXor99jHYoRS2+kLl1vcn9xPTtDmdI/X8VxozmEq4mHhcc10L0uHty
         TCJUxfuLJDtTuMlCKUzZRtkongXXLUw1YVxOr77CNPN9AV0RShdB95vgXiPp2vEjHHaq
         8NrF7uCyDcQ1FYE+olOp3+gfqZLKFfM8TOUBapdw/m4bA8Szon9qsQVRL78QMf47wguf
         3pWMJ1tWi462jC+iixOzHnJRPnadLsjnccsPIlJSrd+KtKzp24Z28cuTTk2M94RxvLQw
         778eKyEJowHV6/1mVnTI6NLzzLpJRm3xWjI3u9W6PbPc0EBwdO+zVasl22J5Foh8O6o7
         3r1A==
X-Gm-Message-State: AFuF++mjxnDNXuTpmH3kNq2Yl24T6sPcLcsiw4t3LObT68obF20kqZ/w
	CFAUAPnEKKPF/8lg9rGV6cSjIRNK/1Y73QXdzHIfwyesabS8qMZKh0OR15zlDNwxSzE=
X-Gm-Gg: AR+sD10YwP2jh8MOvuuuAMiI55uy3lQhg20A+mV+xi17PbNtSaRQGYQvHwW4dT3iUvH
	bWnYd+lgAliIWuxcBA5DDoCFVbxOK3R2SF7Ct3hnLzjSvDghb5Cvn2W6kdre9khsBLMFTpL5uyd
	0/99XnzGbDKH1zOnRg5dG5caTjMuS2eKDghaFqIynuWmo3PDnhi5f9dM+uCWU/TrUE/aMYKb4Wk
	B+7OD7bRnbMhCqaAYAEEYJ61B1j9O9CnUNxcBuKTO0YxhIS6/6dpIz88mVMTkmo7+SCEpTYcrxn
	CXFtku++gOxqBEJEHu/R1o3EABlJ5w4iWxTqzO1ZWprJNyP4s0pPWE+2U7dUgr6KKnZjs4/NAOW
	Ym6L7zo8OkrP8CL8B3fQjwTqRxnfgcGjDT/VPfEazXQLiJB1dMeUQ4XHaVDDirPZOXGfcxjvVhq
	YQaaxQZvy52fuh/wsdtXlu6tvxm1fB30ZLZljRnd6cXM1NVSyDQJOgaZ7dXtK7fg0IizOWQ7PZm
	hzeiEZ68gbFilmjNpVijwDr8AH1sZysV2jeGch6LyeGffzWiU/gGRlrLI1XkXVws7TU75jipBOT
	1X7/kLHzaJfU2KB5IVjD3xo=
X-Received: by 2002:a05:600c:a01:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499c19bfd2dmr18034165e9.3.1787358568239;
        Fri, 21 Aug 2026 17:29:28 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:7910:2866:fbeb:d177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm44728335e9.9.2026.08.21.17.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 17:29:27 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	bruce.ashfield@gmail.com,
	jose.quaresma@oss.qualcomm.com,
	richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v4 1/4] kernel.bbclass: re-sign kernel modules after package stripping process
Date: Sat, 22 Aug 2026 02:25:58 +0200
Message-ID: <20260822002601.90667-2-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 00:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243960

Fixes [YOCTO #12927]

Currently, signed kernel modules are not stripped in order to preserve
their valid signatures. See commit 4c47e5f.

Therefore, this commit makes kernel modules stripped and correctly
signed. Two options are possible:

    - Strip the kernel modules after installation and before signing.
    - Re-sign the kernel modules after stripping and before package splitting.

The first option was rejected because debug symbols would be dropped early
in the build workflow, which may impact the SPDX process.

The second option is adopted because it does not impact the build flow.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
    changes in v4:
    
    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable
    
    changes in v3:
    
    - Fixing rebase issue.
    
    changes in v2:
    
    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.
---
 .../kernel-module-split.bbclass               | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index ab2f0d1c37..253a723b95 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -35,6 +35,11 @@ modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_b
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
+# Order matters:
+# 1. Strip the modules
+# 2. Re-sign the modules (if enabled)
+# 3. Split the packages
+PACKAGESPLITFUNCS =+ "post_strip_kernel_modules_signing"
 
 KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
 
@@ -42,6 +47,22 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
+# Sign kernel modules if auto-signing is enabled in the kernel config
+post_strip_kernel_modules_signing(){
+    # Read .config values
+    is_modules="$(${S}/scripts/config --file ${B}/.config --state MODULES)"
+    is_module_sig="$(${S}/scripts/config --file ${B}/.config --state MODULE_SIG)"
+    is_module_sig_all="$(${S}/scripts/config --file ${B}/.config --state MODULE_SIG_ALL)"
+
+    if [ "$is_modules" = "y" ] && [ "$is_module_sig" = "y" ] && [ "$is_module_sig_all" = "y" ]; then
+        # Sign modules under ${PKGD}
+        oe_runmake \
+            -C ${B} \
+            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            modules_sign
+    fi
+}
+
 python split_kernel_module_packages () {
     import re
 
-- 
2.50.1 (Apple Git-155)


