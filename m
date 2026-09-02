Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F25AC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12768.1788355394138298348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I8B63Z69;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52f9fc510e1so23359521cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355393; x=1788960193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7zkN2uMBNEd1GdzQ9zNaphY6s/IV9TvVRIu1455WMo=;
        b=I8B63Z6999QTXsPsKeDPdWtZVMgRs+Xtae/iA8nbaK0UOyGw0oeR7odYJOHqwZWD3A
         cXo33mQSZnkfNaKo0BFHXz4p18h6E4sK4cFD10/JoxJxkhG0QChFl68iwAMXy6btPBYh
         4Os+UsefAWOMA1LU/KhJ7qNFue4JlT8HA7tSUykqmcUzVL+WG5NBkN9wOJnGxsdApvnM
         68uSfpzammvA/7BI18hIXlRRkpPDTfNBMzaFGX9sRlEi6j5ELV9CtDmjABc1aKLDrU2f
         tkkrC8Ud9WLc4YHt4JVGqeQ7EAMWg2DhKXXosr9IZSYtBi1nHezey5cxXvtAJ1PYBHAh
         ByoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355393; x=1788960193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7zkN2uMBNEd1GdzQ9zNaphY6s/IV9TvVRIu1455WMo=;
        b=FwaTUgqW4WNvoafXNTQJLYjSewX/tZIrtPltp51Udqb2e0fXrcbwbSTkTT6qrUkFvW
         5bewFV9KfUeK/0rZtc0l0BnoGL1fRRwrraF7VVXrGm9lwhsUKMuerod57yfM2II0GanT
         cziF8fijWeyN4b3OiDe1S5whWiX3adXeft9xpgsp1/yomivth9jT5h2H87lwmNF4J2XM
         sMYpfNS1s5mbd7bdPoob+E2BL76tNu5IH3e/CHZ4HQcYj2DNo4sD30nTds2/mbc51wjV
         7ah8w5kT654S/hzA9KJvnZ2fONOJh8azlnRiiQDQF2vBZDt5v+76dnNmfCXyaOGrk1Xn
         vZ6Q==
X-Gm-Message-State: AFuF++k3QQKaYWWZdHKMLcTm2tc9mKt/Q5JvzF4x34CSUEjLs2X2wUgN
	uF/tn1nWchEa9vHr3JFy4wpdQjZ9dFFm8RX/a180QuU6SkhukVTFgFh2aqTGJ/nA
X-Gm-Gg: AR+sD10ji0f4VpX0LQZENs2/wRJ7dkJpDsz6A6iUIE/fuISq0Oq6oDWzlltYw9jFbrY
	Y5tXxe+YArlhoTgBM3YSrFaxyW7Cui6dZMm3Jezr/a9K9C6BEiz/JWzf7oFWZRN7cydIWGibNmD
	7L35dF9QIU4XsEEEdBrXpDIZVOUR1Mc7mvWxv1uODPWiZVivWP8PgTglFV/82rxrtjtSoQ6Q3Gn
	7ZPvgdd8CWh4MS2UXiyuRiieZK5tWgy/w4xPbVTpjy9IrTVwyrn0X/KLRoBM1AiU9pgQH9k8I8Z
	cyRzsj0oxRXOlQPkEfH/jGsz7lvlfF2RMOnr/gus8hnqlBR9RHlM81SJmMCxGDgBWxdcvwq8p0i
	7mYVhKxgi036FOy7s3+gKVO1BbXhb8vCKZckTTdsKmsjUQBti5/jKD02fSmt9WUCsF2DJfkAKzI
	W3Ob3G+k2d0qL8a/wEEohJcRQr/SyLSEQ4LdZQvYKkarOx3zhykldo8cFN9w564+aaVAHq3V+ka
	oBSiOUJiBqfnCRxU6OZD41SyqLa/gddYLWUdvYCVXKPmL5ad3QxJ2Nh0H4xl2BrBsPvlWJ++MO+
	MTwPXbWBtTEGTNoG82MYWZmeVrV2n/ZMal1T5pAAJbBBwYnqyYl4EGQjbseI8IECOAi+lvHqDOr
	XfOg/iieUPrsTnd0=
X-Received: by 2002:ac8:6904:0:b0:52d:6f91:86e with SMTP id d75a77b69052e-5303a59a05fmr35821801cf.15.1788355392849;
        Wed, 02 Sep 2026 06:23:12 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/07] kernel-devsrc: ship tools/include for archscripts host tools
Date: Wed,  2 Sep 2026 09:23:02 -0400
Message-ID: <20260902132305.3685228-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244953

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Since 7.2, "make scripts prepare" builds arch/x86/tools/vdso2c as part of
the archscripts target. vdso2c is compiled with -I$(srctree)/tools/include
and resolves <linux/types.h> to tools/include/linux/types.h, which pulls
in <stdbool.h>. On target that header was only shipped inside the objtool
block, but objtool is built on x86-64 only (arch/x86/Kconfig: select
HAVE_OBJTOOL if X86_64). A 32-bit x86 kernel-devsrc build therefore lacked
tools/include, fell back to include/uapi/linux/types.h (which does not
define bool), and failed:

  arch/x86/tools/vdso2c.c:74:9: error: unknown type name 'bool'

Copy tools/include unconditionally so the archscripts host tools build
regardless of whether objtool is present.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index a38e4fed44..90bdbfc534 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -158,6 +158,11 @@ do_install() {
         # Remove as we else would ned to RDEPEND on make
         rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
 
+        # tools/include is needed by the archscripts host tools that
+        # 'make scripts prepare' rebuilds on target (e.g. x86 vdso2c) and
+	# not checked against objtool as it previously was.
+        cp -a --parents tools/include/* $kerneldir/build/
+
         # if our build dir had objtool, it will also be rebuilt on target, so
         # we copy what is required for that build
         if [ -f ${B}/tools/objtool/objtool ]; then
@@ -173,8 +178,6 @@ do_install() {
             cp -a --parents tools/lib/* $kerneldir/build/
             cp -a --parents tools/lib/subcmd/* $kerneldir/build/
 
-            cp -a --parents tools/include/* $kerneldir/build/
-
             cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
         fi
 
-- 
2.43.0


