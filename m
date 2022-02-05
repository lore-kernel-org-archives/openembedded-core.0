Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB8C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 12:20:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.6237.1644063620969473636
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Feb 2022 04:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=co4tmFeb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k18so16133311wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Feb 2022 04:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ANa78NweY+dOtJ26Wj1ir/y73xK5MGY5esW/NkI4y5o=;
        b=co4tmFebqRIeF2dvkwa2H9FHC+CRI1Udra0VvlRkcxmXrXbZnPs1dvLlVLSa0Rak9l
         cMn/RlY0HxZNouMZSJ4YbYRUoWyujswhTeV0A55dYQ42oNnhMPdBHgaHDakDUOwA/tOE
         uIdRHce/0HgwOFBu+tK/snaEGzogHI/8u+j+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ANa78NweY+dOtJ26Wj1ir/y73xK5MGY5esW/NkI4y5o=;
        b=ysDoICU97lmz7M5SYaq/eRa3dy9EAC/FND0mflafO1TZ9mibjbw6G8nqKMkXNWKe4W
         6oC2Bse+IozKGGIYwzt5rmjVzBDKd80QefnrTCfPTJscQodKZ3VL+09PeEciJiNyH6rJ
         OcZJQfD/8Z2f/HNhf5QGTS+yiZ6OF+XVhvUHxLSRCsgxW9tqTbEBgw/mcULb2BOl/GUr
         GfA9++ul7kykp0jiiSD3t8PUR3m7hWE4wN18XxqOSNXbNweCRUBRI6HAqK6ZizEeS4QL
         iKARr639EsjKxWX/pqN+9b0yuzvHx1Kh+xQekMQrNiUd7Hbs1G6IQYI+fG198nafKpiF
         UIUw==
X-Gm-Message-State: AOAM533QPB/wv+IGvbhpxeYJlsF1ZfykaCsP/1ActDnphnY/RU8vYkA1
	jy2A34/BA5X6X0UpnKKvSkEoFjs4pPX/RQ==
X-Google-Smtp-Source: 
 ABdhPJzW+j2UJjuG1Ik0ax1G+KNFdbi6gEKjvB09jB7EMexZmTKGTos6v48MWlr4nEM1LcJGUOaqpw==
X-Received: by 2002:a5d:6604:: with SMTP id n4mr2063597wru.588.1644063619492;
        Sat, 05 Feb 2022 04:20:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ec6:d613:20af:b6d5?
 ([2001:8b0:aba:5f3c:5ec6:d613:20af:b6d5])
        by smtp.gmail.com with ESMTPSA id
 u14sm4649936wmq.41.2022.02.05.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 04:20:19 -0800 (PST)
Message-ID: 
 <757e270ee7799aae5fb0aff21bbc9e7e2b36b037.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when
 host gl drivers are in use
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 05 Feb 2022 12:20:18 +0000
In-Reply-To: <20220204204027.2323845-1-alex@linutronix.de>
References: <20220204204027.2323845-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Feb 2022 12:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161389

On Fri, 2022-02-04 at 21:40 +0100, Alexander Kanavin wrote:
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

This looks like a good way to work around this corner case and I don't see any
other alternative. Can I ask that:

a) we put some comment into the code so we can understand this in a couple of
years time as it is a rather weird corner case

b) we put some "if os.path.exists()" in there, maybe even just on the uninnative
loader direction so that in the non-uninative case we don't throw warnings?

Cheers,

Richard




