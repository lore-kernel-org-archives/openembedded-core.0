Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E37C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 15:29:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.10680.1657639738736599536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lqqEpV5f;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id i2so4433022qkm.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJoO+qOEq9hfG+bjFQNJfBpc8eR7NgzGoQalIV/zQUc=;
        b=lqqEpV5fgQQHknYgmfnP8XZxDHthGjexs3rdrExCfQCOoUy1k8CeWVMJeNqTaocdho
         bECF15RkVsKfVjH3iHjdDD9dmgkjWR+mVQZummplWbUSY/DyxZsVf+QuOtGLlVnUFfuE
         xYL50YS9ohRYVOQ+KPGcPK1lrj6OOFrHd+I8VRN+vPQSatSUFwVXe61S+JtOAvUmbw+I
         S2lu3IVKDSCvZNNS5Vb4Sqbmg8V+418Ex+JnhygUgW+kMtZdWwYV9lT4L70zY/vqHg3M
         VShCj/t4ZJDXv/W1c+wNfoN/xuacrQmScTbS7iZpicrKXIL1s0M3/2NceJk5hMDUoLmo
         WbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJoO+qOEq9hfG+bjFQNJfBpc8eR7NgzGoQalIV/zQUc=;
        b=zxl6pkp8kaW4YuFFPOO+zARtqxi/mQFHl1hTlIF3NkUipDzxtBe53sN+noOW1OAFsP
         IPHJYvzph75mFHU26rNc4/LAjZDr1A+mgfwGI/k0Q6sojiqb8ojg14gNXbroW+MMHt0d
         nd0mkOXTLtcSXTixssiXBuF+RgW5aMpmvrCkpLr+926ibN4Ev/F4XBBz3/4BEJPizaSM
         UUFpTpp0btdDUrkV7ekImP/j70h5MEcYC/q1ebeedYjpi4sZzcoSqGuPozFURD92g6Bn
         ZLStT5x+AQcT8drDQnrx4du4tD6eLjA0DO4ozWxa0PS3u6bWuvA7zlLZFcTyuyUVQK6h
         DqNA==
X-Gm-Message-State: AJIora/nT5pFWztaBvdP/++uy6HE0tWLmObwdnlKE9aB/4ee0BCVh875
	xgACX1Q8prf1LGqSwB/2RGUbf7e7xRjFbtUokbo=
X-Google-Smtp-Source: 
 AGRyM1v99tnAaOyfJVmsMIvZkh0qvl6HVTP01yLbWqAHsTVo3LPU5k6HJVVj5xtJb2IlVaRaswk1fxY0espPvPTXR6Y=
X-Received: by 2002:a05:620a:448a:b0:6af:3a05:f73c with SMTP id
 x10-20020a05620a448a00b006af3a05f73cmr16212368qkp.72.1657639737611; Tue, 12
 Jul 2022 08:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220712143734.204094-1-ross.burton@arm.com>
In-Reply-To: <20220712143734.204094-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2022 16:28:31 +0100
Message-ID: 
 <CAMKF1spGGsmHYHw3FgU1csUr4v8+FSNUVasnXnSx-6nOzhynEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: fix builds when host ld doesn't know about
 target ELF formats
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 15:29:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167936

the ltp patch is upstream worthy. Have you thought about sending it to
the ltp community ?

On Tue, Jul 12, 2022 at 3:37 PM Ross Burton <ross.burton@arm.com> wrote:
>
> The kvm tests use the host ld, which doesn't necessarily know about the
> target ELF format.  It should be using the cross ld we built, so call
> $(LD) instead.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...-kvm-use-LD-instead-of-hardcoding-ld.patch | 37 +++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20220527.bb     |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
> new file mode 100644
> index 00000000000..23634d0c860
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
> @@ -0,0 +1,37 @@
> +Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/948]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 7670233e43df2aed6d44b96c51b034f8e2d28a19 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 12 Jul 2022 15:03:54 +0100
> +Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
> +
> +In cross-compiled builds the host ld may not know the required ELF format,
> +so ensure we use $(LD) which will be the cross-capable ld binary.
> +
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + testcases/kernel/kvm/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
> +index 69a9946fe..4ddef9f95 100644
> +--- a/testcases/kernel/kvm/Makefile
> ++++ b/testcases/kernel/kvm/Makefile
> +@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
> + ifdef VERBOSE
> +       $(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
> +       objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
> +-      ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> ++      $(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> + else
> +       @$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
> +       @objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
> +-      @ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> ++      @$(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> +       @echo KVM_CC $(target_rel_dir)$@
> + endif
> +       @rm $*-payload.elf $*-payload.bin
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
> index 56fa83f5a03..094251ec811 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -28,6 +28,7 @@ SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
>  SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://disable_hanging_tests.patch \
> +           file://0001-kvm-use-LD-instead-of-hardcoding-ld.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167929): https://lists.openembedded.org/g/openembedded-core/message/167929
> Mute This Topic: https://lists.openembedded.org/mt/92334178/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

