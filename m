Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F164EC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 03:41:11 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.188763.1673926862049523919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 19:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/Gt+tqO;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-15027746720so30739344fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 19:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+VHASSpXWGDhrbENNWRN5Xyd4HygIUaaPPBvlZzLIc=;
        b=e/Gt+tqOgxyZarJoyH9uN26nRlDdy8Q4wWg3TVdI+2SgcAecwOzVd+gNkRPEEo3FWz
         Nj9CzY9/ZQeP7/eUJicPW5QKEOSKXlYBbafgXKu4TqJ0ErJu00zV5/8/GHCpB20nBQKB
         YXYfPv3oHQifryhR2ZXhmbrFznI/nqeIcqMaDxaP+1uFglH5p5VOMkhhWWZu+/v1zGdf
         ef0crpkqVY9ycf5siByW4mvWfaWpDnvTLbxaqi/pGzwMuchFxfz4AitDzVdK5CqbR5nn
         jnPOw0GzM9V5OJCtyzl2LgAW04mO4gviCaqPmENs57478wwJCo2985lM3VGUQjvqckTx
         lURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+VHASSpXWGDhrbENNWRN5Xyd4HygIUaaPPBvlZzLIc=;
        b=z6Pt03TqMwRP+zql1IzsP+a5LHo7er43uQlmY3XcMKAHTIsaA7PJw18yZMmaiJMStz
         s0ygzPUP6hxgUBiFH+D3j38rqRkbGHhEzT7qDXSY8cvDyLWNDA56mAdD4Dzt+zhZwN+4
         DzYZjG7x20Qcl+VV5suyLaIOKtXim1/RgXo1rA33XgQ5V6pFyFAni9OFI2xmUv1+p6T/
         SFrO1PG08ME7x/GzLUApobUB2fzXXsLWhOlhJlDypZXeIHxJkiYexIS6++005BMoDz3G
         RbCB4MD8YKHUv02ZGMWCD5+dPjOUV1YeVdYgOTAzDd+j4gtb+9bcWpzfMkWTR07IMa2n
         xd5A==
X-Gm-Message-State: AFqh2kr9XjUfcVaFfAi2B+l34HyTxnKbGP68EZ6Ayw/z1UNUmu2GJ/l6
	aL2yHjtw7uxFQTawuOfjQDK11tpSVWfkBKahgat+Pblc7Aw=
X-Google-Smtp-Source: AMrXdXtP3cGUxulsP0aIkfnA7PUHGaQ7ypIK9bKKEeAGDwH9PGZ+/B5ogkEMBrjsO5QzVUmFuo5HvIs91JUhWP+J1uA=
X-Received: by 2002:a05:6870:ebc3:b0:144:e1eb:419 with SMTP id
 cr3-20020a056870ebc300b00144e1eb0419mr149311oab.262.1673926861239; Mon, 16
 Jan 2023 19:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com> <20230117020504.697181-4-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230117020504.697181-4-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jan 2023 19:40:35 -0800
Message-ID: <CAMKF1sro8R7sn6es60G5YmDJiPuEWpZ=aDCN-Yv+bhutYEQdCg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/3] qemuppc64: set the qemuppc64 nfs r/wsize
 mount options to 524288
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 03:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176026

On Mon, Jan 16, 2023 at 6:05 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> On master oe, build a qemuppc64 with systemd as default init, when we
> use nfs bootup, the kernel might panic due to missing symbol in dynamic
> libraries as below:
>
>   hid-generic 0003:0627:0001.0003: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:01.0-3/input0
>   /sbin/init: /lib64/libm.so.6: version `XZ_5.0' not found (required by /usr/lib64/libkmod.so.2)
>   Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
>   CPU: 0 PID: 1 Comm: init Not tainted 5.15.78-yocto-standard #1
>   Call Trace:
>   [c000000007443ba0] [c0000000009538d0] dump_stack_lvl+0x74/0xa8 (unreliable)
>   [c000000007443be0] [c000000000103524] panic+0x170/0x3cc
>   [c000000007443c80] [c00000000010cf64] do_exit+0xb44/0xb50
>   [c000000007443d50] [c00000000010d040] do_group_exit+0x60/0xd0
>   [c000000007443d90] [c00000000010d0d4] sys_exit_group+0x24/0x30
>   [c000000007443db0] [c00000000002cfd4] system_call_exception+0x194/0x2f0
>   [c000000007443e10] [c00000000000c2cc] system_call_common+0xec/0x250
>   --- interrupt: c00 at 0x7fff9ed9e840
>   NIP:  00007fff9ed9e840 LR: 00007fff9ed7da20 CTR: 0000000000000000
>   REGS: c000000007443e80 TRAP: 0c00   Not tainted (5.15.78-yocto-standard)
>   MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24022442  XER: 00000000
>
> One or more of the libraries systemd depends on failed to load due to
> unresolved symbols/functions.  This was intermittent - with a failure
> rate estimated between 5% and 30%.
>
> After checking the code, this issue happens on gcc 12, kirkstone is using
> gcc 11 works well, with both using the exact same v5.15.84 kernel commit.
>
> There is a kernel fix from upstream [1], they changed the rsize / wsize
> to a multiple of PAGE_SIZE, when we applied this patch, the qemuppc64's
> default r/wsize went from 4096 to 524288.But the qemuppc64 doesn't have
> its own linux-yocto kernel branch, so apply this change might cause
> regression with other platforms which share branch with qemuppc64.
>
> So, we added an extra option for nfs rootfs, and set the qemuppc64 default
> r/w size to 524288 to line up with the kernel fix[1].
>
> Yocto did a similar thing in the distant past[2] - prior to boot-arg
> adjustments existing - by allowing a Kconfig to set the defaults on
> nfsboot, in order to work around hardware limitations.
>
> Reference:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=940261a195080cf
> [2] https://git.yoctoproject.org/linux-yocto-4.1/commit/?h=standard/base&id=a96cfd98add95
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/conf/machine/qemuppc64.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
> index 304f06a30d..7709339313 100644
> --- a/meta/conf/machine/qemuppc64.conf
> +++ b/meta/conf/machine/qemuppc64.conf
> @@ -15,6 +15,7 @@ QB_MACHINE = "-machine pseries"
>  QB_CPU = "-cpu POWER9"
>  QB_SMP = "-smp 2"
>
> +QB_NFSROOTFS_EXTRA_OPT = "wsize=524288,rsize=524288"

lgtm

>  QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
>  #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176023): https://lists.openembedded.org/g/openembedded-core/message/176023
> Mute This Topic: https://lists.openembedded.org/mt/96322356/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

