Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032E3C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:14:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.15253.1664306049479152588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK5dKqbm;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id c81so12955901oif.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ppnASl0C8Nvv7gLc0UisjzkXlPZq3SPHTpkVBwkuVCs=;
        b=pK5dKqbmNk/oQoeLa3ggdlqx56tEpQ/iXKVbEhIyLeUK98G1naDZcajEdKA04giELH
         TY4SqFcEaDWRopkMyzou+ym/7FS8Rb0KgGcwWDdZ4M9oo2Rpxaf9S+BTRPU+eJHqYSOb
         SVRV30DwY7I1we3p0yyWn6wm3NM9D/zf8wR1FDRIBD3c5ltbSBDimQRKH5NkLm7mk7Wc
         h+FpzpAJbv/tv6gxGlPnQUh2EX4avbbhc2FpugTn+tN6yY++aqQeCiz/F30zJYkE2CJL
         i3RTQRqFX3JxiX4ee8FcHy4nU1EGOD1APUrMBhb6EZaO3Mb9HiVc4RfXLqH8WYKBBYo2
         TlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ppnASl0C8Nvv7gLc0UisjzkXlPZq3SPHTpkVBwkuVCs=;
        b=a51auNEglgXPfOdTy+MxAg5Ts+DR84JFZNAQUMaaMeaLtbGQK5Fqf4tI3NRz15MXVA
         sbjoV2rkpND9oTrGL0Q5YRjtnoj9c8cQkh2eY7eoLz75Av/JApLvFJW4QFapXm2JprJ5
         N5YAHvHkzQSxJHTyC2izJybUgJbKvQxsZfff0kIFRFXPW5tgoreyIOifNbXaddenHRkV
         ZJBXR2BNoF4Zw4oGGsSusSiwnsSkZHAD8kSmVYWzCUw9Vqni/YMpffIBp2S/uyuoTm84
         hYjQOFQBkND52OE876rNyOhyigE8hAglqLDcyiqkllcJRZBOKsabJ/dA10SyDjY30cHS
         C8Hg==
X-Gm-Message-State: ACrzQf3WQ6tMQ3+PBbX6PQp0K0E7prk/6Xpo3szO7S0ZkekpFFvP0dM/
	GhSE7YVl0S7OP1C1A0HID5j/WUneY7iFP6rCh2g=
X-Google-Smtp-Source: 
 AMsMyM5ba1UYl8nbRU0RLWtssfgSzXcXLm3LGcle9UanEza1jF8Aag7/PCgTGNEJqMZCOac0OMPLzmVNCrJZc+tOBAA=
X-Received: by 2002:aca:ad8f:0:b0:350:8c87:c5be with SMTP id
 w137-20020acaad8f000000b003508c87c5bemr2488310oie.55.1664306048587; Tue, 27
 Sep 2022 12:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220927190553.7313-1-bruce.ashfield@gmail.com>
In-Reply-To: <20220927190553.7313-1-bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2022 12:13:42 -0700
Message-ID: 
 <CAMKF1so9ByR=p1N=RW+TFkF0O6A8rR-JkpSQYNq41NGZFy+W6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.19: fix gcc-11 warning
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:14:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171125

gcc11 or 12 ?

On Tue, Sep 27, 2022 at 12:05 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/5.19:
>
>     65a9a22786a6 libbpf: Initialize err in probe_map_create
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Ross identified this change as worth backporting to fix some
> gcc-11 warnings. I've been soaking it for a bit, and haven't
> seen any issues.
>
> Bruce
>
>  .../linux/linux-yocto-rt_5.19.bb              |  2 +-
>  .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> index 17ae94066c..b3e9fbae62 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> @@ -11,7 +11,7 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
> +SRCREV_machine ?= "bc8af638c00f28a46e77e34056079087638f6e65"
>  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> index c18278ad79..466b7063b4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> @@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
>  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> index 4fc1ae9245..f882972e35 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> @@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
>  KBRANCH:qemux86-64 ?= "v5.19/standard/base"
>  KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?= "9111e441d26961e67bef7866919c51b27e794bac"
> -SRCREV_machine:qemuarm64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemumips ?= "5f89b6548b6665f3ebec11266f2c7db2793129da"
> -SRCREV_machine:qemuppc ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemuriscv64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemuriscv32 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemux86-64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> -SRCREV_machine:qemumips64 ?= "99613988297ac45653cc81319e63b2821645a3ba"
> -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> +SRCREV_machine:qemuarm ?= "446661f6a3b07535304497c1a51d9cab95f48f0b"
> +SRCREV_machine:qemuarm64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemumips ?= "98da147618fca3da29cf1c6ab9c53f24de2c587c"
> +SRCREV_machine:qemuppc ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemuriscv64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemuriscv32 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemux86 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemux86-64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> +SRCREV_machine:qemumips64 ?= "53842054198d851b5deb5810afaf126156efbb54"
> +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
>  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171124): https://lists.openembedded.org/g/openembedded-core/message/171124
> Mute This Topic: https://lists.openembedded.org/mt/93957254/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

