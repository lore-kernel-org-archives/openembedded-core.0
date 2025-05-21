Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C573C54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:54:07 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.7390.1747821239978544541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNWYQ471;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so1152853866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747821238; x=1748426038; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r96EITmvx7gvHj+pLSXa5D9FSCGYgi/KdvLx99C17b0=;
        b=KNWYQ471j4wwxzNFEULr2xYMKbc9YdpJXz9gOmtNRl89KyAS9tgpPtjsn9/ZyofPf5
         Rbt5V3wYqsvkS0JWprVSkDekQJvPMkPyA5RwgZ2l5b4bctZOnfHilk1UqBsPmnRMoBF3
         iPAJuh+VrbEL70fynt1VAf+h7D6M+pW8lHvxwZNLKhcmoBkdJJnHqnNMseFcAm6yUATc
         qcn85Ilv6YrQ62mifC98lT615MYUU3se+0jF2oO43yTTAPradFkkqSsyykK0BbH+Agwu
         EGNhi9pPN2MQKoEBE1NRkyO2nr7samcZaNw0npBcLDk188OJh5HzNxh0hLy+Q1yj6ibU
         ATAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821238; x=1748426038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r96EITmvx7gvHj+pLSXa5D9FSCGYgi/KdvLx99C17b0=;
        b=NzIaQdBI3fhxTnFGQ/vxf0xdoAJdlPn4hN2WQoyu8vkApbl3txmpPMIfzP3BxcSK3x
         Q+fuz4+qqyD5q20fNEFKOQYtw0OBtNz4zFzSGRPAGAzvKjPUpIaI5lEMLfbkzmkddofW
         U1cG6Li+9o5OT/nxw/LcwWBL0cyI5Qbfm+8XOnVekPn7W0FsFv3wLU42JwhsLE5sBR6S
         a7ea7uwqcg9k1RIz3ZTD/hTYpOmOaFOZWOMcoC5cn6u4ELMn15+ALznysCHAxJAJjy0P
         jAZKSFE0PkW3I0Qi+wyvGTIz9t++AUGLMNMEdy7WXErgG9m/sZk4vgiXotX33HI06MqV
         V6sw==
X-Forwarded-Encrypted: i=1; AJvYcCVUQxTCJxP2X07UO936Sa5H4INE1AxoqhoQtzLCZZHuNgP9nMXp+PSgdNO6xpTyIoBtNYO1qFuY+pj6HZGePTu0wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWH32fQgc27k3XpeasXd1vGCgc9xakp30n9sxv0HyCfGyMHYTl
	Wgn61axg+33kC22HT/mv5zrEc2ZhvDrCsgJHcEfvaxsnvsyxP6rndUeivopmccyu
X-Gm-Gg: ASbGnctOsylsHn5ClNvle0qxRIvssN5xkWuJ69aB31pp1OUZ2xkvR2A6i4m8CDFYS5F
	9aH4UZ8ndPXl04QCcVMk8twLpWFvZmZo0b8BY0/lui1KfDkbn6dWywT9KRbE4E4g4ER4vp0O6V9
	awWMwq+KvdI2CVj5aRcz+oEfPIR67++Fx2Me1W5u4iKg6T7idA+KYq7UOcfjFGaqXBRxZHcEJwS
	Ft5EM1r0+olazK96zuKTlQlVDSlaOkfH4kaHdbhbpC/o35FW/AZFVu4+Gt0x1HSxHg6NjVD3w0I
	SDLiH+gv9gVhU7gHWw+EepZnr32eD4aH/kbxbgdyT0FtNakBU82tDBEeLwYlGrZX0hRrgA==
X-Google-Smtp-Source: AGHT+IHHlUbZ7wV07HM5HRsCdZ/VPWdQk/bWeIZNbpCahXgY221UuB2ZF3gD0F0RQyb8wLZXtPGKjA==
X-Received: by 2002:a17:907:f816:b0:ad2:4fa0:88cb with SMTP id a640c23a62f3a-ad52d45ae5dmr2024507566b.5.1747821237861;
        Wed, 21 May 2025 02:53:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d44205asm881436966b.100.2025.05.21.02.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:53:57 -0700 (PDT)
Message-ID: <eb760092-3915-4133-8f19-c0b6b7dd6743@gmail.com>
Date: Wed, 21 May 2025 11:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: AArch64 - Fix strict-align
 cpymem/setmem
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com
References: <20250521090916.974418-1-sundeep.kokkonda@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250521090916.974418-1-sundeep.kokkonda@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217016

On 5/21/25 11:09, Sundeep KOKKONDA via lists.openembedded.org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
> Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
> Clean up the condition when to use MOPS. (PR103100)
>
> Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
Is this a partial backport of the commit?
I wouldn't expect the backported patch to match the original 1-to-1, but
the original commit also contains some changes of the machine
description, which is missing from this patch. Is that not required?
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
>  ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
> index f17ec9da5c..1e8371b2bd 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.5.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
> @@ -60,6 +60,7 @@ SRC_URI = "\
>             file://0029-Fix-install-path-of-linux64.h.patch \
>             file://0030-rust-recursion-limit.patch \
>             file://0031-gcc-sanitizers-fix.patch \
> +           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
>             file://0001-CVE-2021-42574.patch \
>             file://0002-CVE-2021-42574.patch \
>             file://0003-CVE-2021-42574.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
> new file mode 100644
> index 0000000000..4c2d827799
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
> @@ -0,0 +1,45 @@
> +gcc: AArch64 - Fix strict-align cpymem/setmem
> +
> +The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
> +Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
> +Clean up the condition when to use MOPS.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
> +
> +Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
> +Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> +---
> +--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
> ++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
> +@@ -23621,14 +23621,15 @@
> +   int mode_bits;
> +   rtx dst = operands[0];
> +   rtx src = operands[1];
> ++  unsigned align = UINTVAL (operands[3]);
> +   rtx base;
> +   machine_mode cur_mode = BLKmode;
> + 
> +   /* Only expand fixed-size copies.  */
> +-  if (!CONST_INT_P (operands[2]))
> ++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
> +     return false;
> + 
> +-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
> ++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
> + 
> +   /* Inline up to 256 bytes when optimizing for speed.  */
> +   unsigned HOST_WIDE_INT max_copy_size = 256;
> +@@ -23750,11 +23751,12 @@
> +   unsigned HOST_WIDE_INT len;
> +   rtx dst = operands[0];
> +   rtx val = operands[2], src;
> ++  unsigned align = UINTVAL (operands[3]);
> +   rtx base;
> +   machine_mode cur_mode = BLKmode, next_mode;
> + 
> +   /* We can't do anything smart if the amount to copy is not constant.  */
> +-  if (!CONST_INT_P (operands[1]))
> ++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
> +     return false;
> + 
> +   bool speed_p = !optimize_function_for_size_p (cfun);
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217009): https://lists.openembedded.org/g/openembedded-core/message/217009
> Mute This Topic: https://lists.openembedded.org/mt/113226173/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


