Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E93E69193
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:02:48 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.35202.1732309362212621578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCfEIQK/;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b1505ef7e3so147723085a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732309361; x=1732914161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vPfgaEndXlu6UloytYmJRE5QpmegwjM4cgD5Xgs/BLM=;
        b=mCfEIQK/ltwiCtr0y7Ow/r92zl+1t2q9bkd/nZH09IYYNtZvb7S7BdmKNRODmXkUbW
         3yKAhSYGRPX96gY1mIYc5iuhlrCWw9qUT9zc9sFYgWsxdNFVqtvciHkSOC+MZnTEkc9C
         R+F3n6onN/Foh/19IpAdQku8BIxv6XPiJ8E5SvRspGLAX0j48brDpK6R9/nj5nUqF+qx
         YklZI+NtdUFBnJGjQEu2l9vCQl+b/yvTfEPw7CVEe8qKU0cEd0ZQcPWzS3nGLVn5C2sI
         eVz6ibuvQakf5qHjDCbwYQzGrPweaQIA8/GM7jw3pIg+RLu3DpbigL9zcl1k9EEkKb/1
         65vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732309361; x=1732914161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPfgaEndXlu6UloytYmJRE5QpmegwjM4cgD5Xgs/BLM=;
        b=DyD4SjLGiLZhogd1CLA/FCzD8/MLpgpyqq30JCMXMZ4sy9vQD4nyplrGm0yCqvm2CV
         UyfMYNisVunlRU6CuXQVHUQaL7Pu0yOm6FaJOtK1XoFk+Ew/zhvK54OtjLMvddHehKBH
         Is0WmxS81uErBFffMUJhk74Cx6yBXIxeRxjsTatn2OMnbaj7CR+h4cIbzqG+w2pc++ZI
         LC87SjHWpuT/ePXIyUqDKTmRdjLFFNBC6PumlizAQUzvvyxGapFccXPJwpeFVcM+x9ph
         5Dlp7/fFglVdNwrIn1Ndx86z4ug/upUNIkkBRVOTUvHIPJ4Urka1KL/XYa11a3CpJ56s
         HUHQ==
X-Gm-Message-State: AOJu0YyyPfS8WcRCcd9teUDAsc8u/ju/hlxDpgGP69IINc2hac0Nne19
	zwu2yccyGx7Mea/v7YOaoMPn5dN4Lj0K9/ooYlJt913+I8uY6U01
X-Gm-Gg: ASbGncv4fhrTGGLL4tBqFo3mjDdWeA5xlnq5UbkuIGfPbUkFjAOmsflfsTVoE6nuzVY
	9UJ9ZZHrNoIsMB/WhLVQKzUTlqDOUeSXO2sz+wE0VWU5evTqu/yq3CyPLoPkSwMP9VWRMbBICp2
	F+SswH49zqIpS3RhbvZG/Uc5mP4Mjmd0wA6rVclreIcZVKDApUZbf6ePVgtq2RO9z5GF1qVZq3f
	8hffiasRtnPlvzpUNe4MIQaIYcjM5plPjp2P3cOlEJc2ys0NFZx0suE47vWEuVLQmFE5g3ipzR0
	68ac/zFbj8bJogstb6Yk9VI7QAb69gH8Q99tFm1+MSBir2MG4VY=
X-Google-Smtp-Source: AGHT+IE785cz+O+m5i9AnwDUy7EfrjlRjvhA5yegzjlsRQ3gLOyHv6dxo/36Im51psnTcz4HLgveSg==
X-Received: by 2002:a05:6214:2aa1:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6d451130167mr60994716d6.33.1732309361010;
        Fri, 22 Nov 2024 13:02:41 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a83775sm14281056d6.4.2024.11.22.13.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:02:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.6: bsp/genericarm64: disable ARM64_SME
Date: Fri, 22 Nov 2024 16:02:37 -0500
Message-Id: <20241122210238.2546434-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207648

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: disable ARM64_SME
    Date: Thu, 21 Nov 2024 15:53:35 +0000

    From upstream:

        arm64: Kconfig: Make SME depend on BROKEN for now

        commit 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc upstream.

        Although support for SME was merged in v5.19, we've since uncovered a
        number of issues with the implementation, including issues which might
        corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
        patches to address some of these issues, ongoing review has highlighted
        additional functional problems, and more time is necessary to analyse
        and fix these.

        For now, mark SME as BROKEN in the hope that we can fix things properly
        in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
        very little extant hardware, this should not adversely affect the vast
        majority of users.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 99e8248c72..b02aeb2d08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "67f358194225f9936b9a98ee9366417597be1769"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index dce2633842..0990260ec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index a0493142f2..7ddf99a043 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemux86-64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemumips64 ?= "9b078a376adbf198325e1569246106e480191063"
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


