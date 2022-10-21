Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7DEC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:27:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.11362.1666366053706068184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D9BsHAYG;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b12so7208319edd.6
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Eh4uw2CgyRTWr6X0c7RV69FVDaCpD6IyJNb7GxONIE=;
        b=D9BsHAYGzP63l7NLBlTII+Bhz2S2qo2CA0ZvSoaFeyM0iJfxR4D+mUcHxaJkFZhCXa
         A3Nsmfp6jqU+Z9tYtUiT62gzHtdcXppny+3435PuO0l0aeXExC9/pMxfSuBojk/uB+67
         AKcM1chrn/joPjjZPHH2y/D1rNObehiO7pSwJjJHO5pn+Fw7rTMSXkSbaEZV2V63FMgY
         Uc9GLXJBvmAlbG04kPl7Jja0h6lUS+nN2GdUr097egbjT0tSKUqR4oWApIsF9UsX9Fnt
         2gljQ+6i2j4LQXO0hjZO7rZqmWevHBmVa2xWA3efXws9nlCycDSe9n4CJWGv6j1LUnyW
         GpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Eh4uw2CgyRTWr6X0c7RV69FVDaCpD6IyJNb7GxONIE=;
        b=YYgyElktcbzMyzn/JluZcPiCdZSkPC8XM7pY6zB2g/Rv9Edmat3zYpxCgfPSKlHuEy
         9p4UdTtDwYwoHYjtGB/A1j3syUyG8BuME8jxKsMPfE+5aP1CZCh4qy8cOXd0GfOItOLy
         fmHmHkYo2+5ur/F0P52lmRUDWs3jzO4Vo3pK/vqFonwoRVfhe/9eEWJdtbv6VQwSO8o0
         23w5L/Gq6MaQGsGTytp+D3Gk2dZf3alp8Wa5t7RpKPsYs2mpe1NBaslS6FIx31WZRCuv
         WZgkJtpCN8Tav/7CxWlviDUXIDkTtEq8zix7ikEwZGQewAg6L4AgdpbWh+UrW7nXAVa+
         vCEw==
X-Gm-Message-State: ACrzQf3eGqO2iAVNE8VKz1YJdYUhTHdvIG6brCGs9nadNRQ1JlLwLpqf
	cZqz57c1CRUA1MSy0Kf295jn8QhvYvFGLBeNI9A=
X-Google-Smtp-Source: AMsMyM4wbCXsg8HfBmm8+L6L/CyXh7Ca65VDXgfbG0YdLTE0V633GcKtbsLFCH9wnhrqSgxMCX76yzVimq0T5nUZy7c=
X-Received: by 2002:a05:6402:42c3:b0:45c:ec49:aacf with SMTP id
 i3-20020a05640242c300b0045cec49aacfmr17845867edc.40.1666366051817; Fri, 21
 Oct 2022 08:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de>
In-Reply-To: <20220204204027.2323845-1-alex@linutronix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 21 Oct 2022 10:27:20 -0500
Message-ID: <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172024

This patch broke runqemu for me when I moved to kirkstone. I get this error:

 /bin/sh: symbol lookup error:
/grmn/prj/mrn/alchemy/build/tmp/eng/kirkstone/tetra/sysroots-uninative/x86_64-linux/lib/librt.so.1:
undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE

And I'm not sure how to fix it. Reverting this change does resolve the problem.

My host is Ubuntu 20.04



On Fri, Feb 4, 2022 at 2:40 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> that tricks uninative loader into loading pieces of the host libc, if
> the same pieces haven't been previously loaded by native binaries. Mixing
> the two libc versions leads to failures.
>
> This change ensures that the correct (uninative) versions are always in use.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/qemuboot.bbclass | 2 +-
>  scripts/runqemu               | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index cc1cbce69d..229bd88527 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
>      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
>      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
>
>  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4e05c1bb15..7d1f85f357 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -460,6 +460,10 @@ class BaseConfig(object):
>          except subprocess.CalledProcessError as e:
>              raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
>          os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
>
>      def check_args(self):
>          for debug in ("-d", "--debug"):
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161382): https://lists.openembedded.org/g/openembedded-core/message/161382
> Mute This Topic: https://lists.openembedded.org/mt/88916306/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

