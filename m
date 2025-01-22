Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CD4C0218B
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.34206.1737515027967785353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KHqmCZeB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21a7ed0155cso102956655ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515027; x=1738119827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qete963qxQgXQ6kY8X9ydLKkLOA8TvcmlY+jgTHB0ig=;
        b=KHqmCZeBOcSTMBZe98GQmaOtcFWVGi/80b89+NL8aVA4+rMsvoHHyIVJzSduGVxvgZ
         oV2DLG0/ztC5pGxBP9tWbN3INFGlOybaccYWXnsrF6qbp9+slTJ6UM/BWb2m/WXwobSr
         XuT6Rvl93MSQ+wzUJSKfN6/8g7mBc1pyLjmHpF/4fzQuIx2e7jQVnLgooxAywbrK9hWQ
         S/Q6rfzkPRRYYvtP9UObGbbi5Tbkhf2j3jjoAN/aLhgqERprF9+9KsfjVOitAYcwmAZz
         8nq+QkdX3V67Af0sRtOekvD6RCHX7CCdS8DcidNAb5NhnU8DDIc2U8yw1itBMx/AsgYA
         KtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515027; x=1738119827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qete963qxQgXQ6kY8X9ydLKkLOA8TvcmlY+jgTHB0ig=;
        b=ljUix34nSO24TiENj/YhXymM6sXn0mZCDcB6ZQzGZRqwU5oSPtWG2uQLGmgjgbBTHY
         ACb7mQAxe2BijbZUNGoM1JxjFY08psHiyBm05KEcp7Xv8+C1+v4Z4LIrDK7qSSZmU4sk
         Rny4k9Vf+bE473hJJHeRcclL4G6DJmswkyVWOPhufTKhccTj2H0xZEheluLB6TKhNU5D
         l3Gsxjnyjp8YtIfwZU8eKdRUYucTcYGu0/Dc9SgQ6OJvIPEbe8ZmBlQ3VB2pmbrIRo9y
         vjkWpC9FUBky4q4CcWkukjC2jnSEjIb5gAYKBpWfBYFeH1VovsrfVE+hrkNYEibGKUH7
         p+zw==
X-Gm-Message-State: AOJu0YyHpgNoDJDwNJHcXy31iJvyv9xGzHE9Vlw6kRda7cXStuGXSV6n
	9TQq8XHlusXzkyQTX8ddcqb+NCd67thHVP7CvQtx7Z8kTG0PDJeucln+Ds3UNmxoP/iSMA9758/
	GvPM=
X-Gm-Gg: ASbGncsEvp/vcJG3LGPpNdTz5uSAdklddF1hIJeTai7qG7wgl9MqWmaqziHNEke9jrf
	ygoOrglN0zQj1yhO7Htp92GV38ap+Sw7nKRKJ7MbEDRttNN7L+wJVT/B4HSpReFey2bpGB8m19H
	+tDvbUc5/QxJ4pCgzikYD+5fHuzIeD8Xosp2o1PQU1tQx8q/xNvvcPlyaKOsoIak19znpr+NIKD
	GPk2hRv7IMxRxG+6LeG+boPAHdQhxOn/Ykne6I09rbGJAY/r/OZhHUvt+I=
X-Google-Smtp-Source: AGHT+IF+emkhGkMr9o2JOmzBX/zCfBGLS7uVQvgqtR0wfA1EFDNdxQVwVjMrPNVbE31a+d4u3sBNNg==
X-Received: by 2002:a05:6a21:6da1:b0:1e1:a0b6:9861 with SMTP id adf61e73a8af0-1eb214818cemr28447660637.12.1737515027214;
        Tue, 21 Jan 2025 19:03:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/14] classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package architecture
Date: Tue, 21 Jan 2025 19:03:08 -0800
Message-ID: <972ca555ff3aa41d32980477850c92915b6395ed.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210126

From: Ross Burton <ross.burton@arm.com>

Using the package architecture to select the right qemu options to pass
to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
not typically any options set for the machine name.

Solve this by using TUNE_PKGARCH instead: for the majority of recipes
this is the same value, but for machine-specific recipes it remains the
same instead of changing to the machine name.

This means we can remove the qemuppc workarounds, as they're obsolete.

Also update the gcc-testsuite recipe which uses the same pattern to use
TUNE_PKGARCH, and generalise the else codepath to avoid needing to
update the list of architectures.

[ YOCTO #15647 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 414b754a6cbb9cc354b1180efd5c3329568a2537)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/qemu.bbclass            | 8 ++------
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index dbb5ee0b66..8d7c82668b 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -60,8 +60,8 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
@@ -71,7 +71,3 @@ QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
 QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER9"
-# Some packages e.g. fwupd sets PACKAGE_ARCH = MACHINE_ARCH and uses meson which
-# needs right options to usermode qemu
-QEMU_EXTRAOPTIONS_qemuppc = " -cpu 7400"
-QEMU_EXTRAOPTIONS_qemuppc64 = " -cpu POWER9"
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f16d471478..eb9ddead08 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -53,8 +53,8 @@ python check_prepare() {
         #   - valid for x86*, powerpc, arm, arm64
         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args += ["-cpu", "max"]
-        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
-            extra = d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH'))
+        else:
+            extra = d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH'))
             if extra:
                 args += extra.split()
         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) however they either have MSA
-- 
2.43.0


