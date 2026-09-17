Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54218C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1558.1789682873972723271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AW+sY6ls;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1333695e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682872; x=1790287672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nNFCD13pJmmp7e6u36VRMOS6G1vTlHQsNkX7Jck2Vwg=;
        b=AW+sY6lsKFoAG5eRqpJuAgmQK8UHo1f8RtMIwhbZD5hywM+1uRWZ9zYeGNTVTC2aeS
         69XuXVVwAYuQu0rIdsCcAGSWPuN8rFVSaPuxTjbK8hfgqOeONnDIJ1Fac2i5EXBPtkO+
         q7eRoK4UoBFJGVhtxhSt5sazy2XSA14Dh430o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682872; x=1790287672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nNFCD13pJmmp7e6u36VRMOS6G1vTlHQsNkX7Jck2Vwg=;
        b=twx6Fv4ka6gz2pir40D6R5SQypXw8XCYjlyN4OKWsxbpFFUNBM/vkAvjn1IG720abe
         ycVcYe3/jPBKpeTiUMUvVSH0q4ktWHW0UeD5SvM1VB3fBZvoY5dw/fjpGF8/QeCn3LQV
         cjQRPzjX8gPX9v9ZwQDluPFQ0w4yEW/Z8LwghHzdo6Fdjd3XYSplCwSy/RcV2ZgjpbfX
         UzK/Q8wTwB9oXbegfUN/i1j8ausPt/+nlycnh8tJvw8/mcuZDa1EUy3lX1XkEB69cI1r
         52UoheTSvDf5c4xuB0Od4BsL2dtGV8UylqBZBZ/sWXE6BkpgXPvrnwhsb0HkSW+uDfBu
         Tkgg==
X-Gm-Message-State: AFuF++mAw+XNiifK58NS1bqtDmYw0Q+8V2AqSsNVhytKV3mmUd8f5PPc
	yYyz1bD0gjr3PRTQp35tXddTyP7EJDzGB3V+OSyclyZHCbu24XSxA47HxEq/nWO/4MFH4wPuQ8k
	DWCbauJw=
X-Gm-Gg: AYBFou1+B3Dn23rMdfBgFOhnJmc7T0ph+XEBH2Ji8O70lxypUIADaflSZlhY1rDQhGs
	2U53Vca2z41A4W5raViRRnnQoGkbDmJBBntk8kkHhS6CbI8xNqyowUAO3ggY9MHaQZdyHTIOqCm
	Jn1EoBcbC+ying0+tQ2ZCus3nN0aErlaV4iP7qROuylzW7V7OjMCVSj7N+r0Wq3N8ugjL2m0Ngr
	sspUnlB92pqC2PdK05k5Yj0dRgicpAXjz6vUUlJKSy9EB4PdWjdVe7LIgxzydMX0FPVrSFnHSBX
	+UwscII4+aWiAsDL4ixcm6QoASzfjk27xOK51usTFhN7eSua9nFnq7R7z8kWQEtyf7VrhjXZN50
	bWz0RjuYNRmqrL2HMP5m88gm8JuhBurxY/1VwLZetX908SlIXEsf5faIFc4nRAv1gv+UfIMJtk7
	wpMHmEYP222iLaYUGUa100xXzvsRczLehbiEWF8jD8uQkIXO7AXzKux/tkE9qGBpQnSFRKhOCXa
	LDyiX3Di+DTL3y+uyXONfjE/ydta39X1q88Nc/lD/Lz3k712fVw+IrFSUHc4hXqHDlUSDgDpI0=
X-Received: by 2002:a05:600c:3492:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fc572f645mr2826115e9.16.1789682872297;
        Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/79] kernel-yocto-rust: Add clang toolchain check for riscv64
Date: Fri, 18 Sep 2026 00:05:51 +0200
Message-ID: <8256d2c19680fb8111471cdefc99fb89839d23ab.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246101

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Kernel Rust support on riscv64 requires Clang. Wrynose doesn't
provide a Clang toolchain for kernel builds, but downstream layers
may add this support via a linux-yocto_%.bbappend. Rather than
unconditionally skipping riscv64, check whether a Clang toolchain
is available and only error out with a clear message when it isn't,
so that users with Clang-enabled downstream configurations aren't broken.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a typo in message. This matches master commit 2b228490b7ef]
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae8..4c0b7231e6a 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,13 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+python () {
+    if d.getVar('TARGET_ARCH') == 'riscv64' and d.getVar('TOOLCHAIN') != 'clang':
+        raise bb.parse.SkipRecipe(
+            "Rust support in the kernel on riscv64 requires kernel to be build with clang "
+            "toolchain, but the kernel is built with toolchain '%s'. See "
+            "https://docs.kernel.org/rust/arch-support.html for details."
+            % d.getVar('TOOLCHAIN')
+        )
+}

