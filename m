Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A022FF6E63
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86395.1773779361169008294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFnfgmUu;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so8979116a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779359; x=1774384159; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0QkN+kDAUzr/VFD5dtGrIk3px9p/UfTRgfMV8mhfP8=;
        b=HFnfgmUu8ChTwhK3jgsA4nmpY1ve2+CiPrHgmyTlSBFl3W95NGcHZz0AGa3ABs81jk
         kPdNx6RGR8c5Xy1H6PjxNVAtkO8G3V7tOjcj3UEicrwj+Ed/ABtxza7az0xnhJoi5b68
         W54weQkHiIIdWiLM7CP/jje4592/bF2gzj6KJejkk1NkyBMDTrt4pV4fLhz/Ohid9D3j
         pN7LuqE0Mw9tx1M3SnXUqEK0Uhy8QrQkT2kalz4LDIydqdkCHbnnlQmwSCm2TnTNi0xv
         Ku1IB429aW+G7r3cluaIhiYOHz5ou6psL90stG/jg2h86+6vFSpRHxjOLikBffluWMIC
         EeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779359; x=1774384159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0QkN+kDAUzr/VFD5dtGrIk3px9p/UfTRgfMV8mhfP8=;
        b=RKnwie4qsDpt+PeUUAK+CHtJHgsLgU4N0FA0PedXEizGdDTLGHjOfnQPf7JY8PH/oG
         IpiHz52/P/C3WBquB8+Pqk6rQlNyltywoyHDhYV1iKD93nAtMbepjav/kGrfeJJ8ND2c
         dnQgC/RbbBE9TqPB5m6G9jNCv6r2ZhoumIl8IoKVFLPGQK1bLiLVRSKsBb2HAk8EhqdA
         tKLPBNwnyAUHGywbpiQPHZ1UWmzkkfGZ4IGoxF6k/zGAcavjGV1MDBvPAAWAVftBZhxW
         m5fGcQvyx+S3X9nJz6fAmUrwqfSpf5jZJrFedFqLElu6ZGe7LK4jhz81tEZcxvjPN5nY
         A/AQ==
X-Gm-Message-State: AOJu0YzmjxWLfuuppEK5NQAC1q3c7Y09pAJafYS6D51gcFH/slAxmFT2
	IEuptQ3VxbN4bpCrbUn6qvL79R40AwJqOhWKPTEA717cViTbkmt/tpNNyX9myQ==
X-Gm-Gg: ATEYQzwTqxgld6JQkO4c4+bamc4ZrflYmgxCkb/B7CHu88KMprHkfiiDfxCm5+Onm4u
	cHbkJox4FhjHJIZkJUdAu5W4csKBHqvtu0yutXC16y8qwP7Pgehd2TOub/nZTDYwJmWT7rYv+AF
	aJEO1IIDXfsBhg1bEwnEYTxj9TnJqezKz9f+qi/C5/ez2cHnuiZ1MA7eW+YoEQ1X4bchuvw7JNv
	ZPOIaEOFImwpOxvn2YljIqy1U9X+GOG+LPESTf1K2Wwj4OlbqG8duK6360YxmtdEtXmeidscRgW
	AnXF3YvRxTCUx3VgxnuDlzt60vgnI1otqUbHUkeLNqe26rEGTik6/g8arzAjAl/eNaQ5HAlA22R
	4NZdG2Id9JE5FekhjmmtCJg22Ivu19jRTLl3fLx2dROFggVUZPaHfBBdejU3a1fpHMwx/25aTuC
	yL7D/q5kzsuUrLFZKTRPUHxrE7W2pM17nx0j2Lw/3bbgyt1fSNb9Au0Cc0du5nwfE=
X-Received: by 2002:a05:6402:398f:b0:666:f3bf:4f74 with SMTP id 4fb4d7f45d1cf-667b33dfa10mr377508a12.23.1773779359499;
        Tue, 17 Mar 2026 13:29:19 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:19 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:03 +0100
Subject: [PATCH v3 04/13] tune-power[567]: Remove confusing overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-4-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233339

The overrides for GLIBC_EXTRA_OECONF are confusing especially with
combination with `+=` style append. If there would be any value set
prior, it would be overriden as for conditional append override style
:append should be used.

As all other tune-power* configs append to GLIBC_EXTRA_OECONF without
any override, let's align those to them and drop the override.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/conf/machine/include/powerpc/tune-power5.inc | 3 +--
 meta/conf/machine/include/powerpc/tune-power6.inc | 3 +--
 meta/conf/machine/include/powerpc/tune-power7.inc | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/tune-power5.inc b/meta/conf/machine/include/powerpc/tune-power5.inc
index e70e401217..eb8e51ba3a 100644
--- a/meta/conf/machine/include/powerpc/tune-power5.inc
+++ b/meta/conf/machine/include/powerpc/tune-power5.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p5 = "ppc64p5"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p5"
 
 # glibc configure options to get power5 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' --with-cpu=power5', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power6.inc b/meta/conf/machine/include/powerpc/tune-power6.inc
index eaf89515ca..ef6d0f5a50 100644
--- a/meta/conf/machine/include/powerpc/tune-power6.inc
+++ b/meta/conf/machine/include/powerpc/tune-power6.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p6 = "ppc64p6"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p6"
 
 # glibc configure options to get power6 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' --with-cpu=power6', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power7.inc b/meta/conf/machine/include/powerpc/tune-power7.inc
index 4531ddd85f..0e4647ac11 100644
--- a/meta/conf/machine/include/powerpc/tune-power7.inc
+++ b/meta/conf/machine/include/powerpc/tune-power7.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p7 = "ppc64p7"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p7"
 
 # glibc configure options to get power7 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' --with-cpu=power7', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"

-- 
2.53.0


