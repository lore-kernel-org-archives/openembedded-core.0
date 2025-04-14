Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F405AC369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:51:28 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.5409.1744663881730595200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 13:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfnZlt4h;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c08fc20194so946049685a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744663881; x=1745268681; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M24cWtrmHO49rFCLv/Imu5xClowPPGFwQKJPqADY8B8=;
        b=GfnZlt4hSLOqtgKaG1L2OkIGdf4dGjK4fBvO3xzxCu0Gg0QyHUpltAfJ2BjcwH5igb
         n/KdLaBEnj+0PaJw3CuEEFEpRQKnhM+vfuNX7bv17Wr959yPJwSVuYvwd+RnAgm2QUeQ
         r9PFbrhxyg/+asrIHI+ma6rOFQusG4TCAiCykfF8a49k1SxkBEdTPud+/YLM/YK0Doeb
         Urt1w0dHLdP4Zf15fjWoCG6t34egdq0wneCCsFvHzH3Fo2y4WPzjd7aqgvYjm8kPYJnX
         jvjP8wltl2ugwYFu4Irj9OzRstTltUY0Nv01f2w70SarGxEYMZdZMF8a9MTINN5qcRnF
         I+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663881; x=1745268681;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M24cWtrmHO49rFCLv/Imu5xClowPPGFwQKJPqADY8B8=;
        b=ubZ6Cc0GdPuHTMyUB+TGoba8Q9boOMy/slEqeSP90tfk9I3iTJyM2Kfa5UyFjeS+jF
         Dzp9H9hiNXjM5tHZYmD4vdJGgtQ0iB59WHDhVw99SIvVdyg565sB2iHpsqcOPBV2Qvqh
         fuWZpPqtyhZ7LSJbz4XPw7ZuhS26SSg10kO4eyXYPzdtbmMCWI1D1pkr3GvcwqEhpoKN
         c50dWYXZJPIc9dHD7pL/zhhmLOGAbSF+4DgUHV3OJBrWWTE1NZui1m4DovXhbCwBP1Eh
         CSW/MNyXXe/6LFZ4U/QROPmHmi/lqLnHfsDOQFSDOnfMoqCRbHAGwY3bSnNmiri6ftCB
         jQkw==
X-Gm-Message-State: AOJu0YxCnV5JvDh3SJuDmA+h5z4LY/NzraXA8NVpdQsXtRz7Oef4/Ulz
	86H1cyfylodnhimnW5sKJo751iWrB4tIdShWc5AOkA22Q60Fkom0
X-Gm-Gg: ASbGncvIoTwHFEb/GC4bvXSjlp8k/oX4XcNbO8f5Ezk4ovO6lHo4BLznx3nj97ovYSg
	hKRK3jE3H/1EcM02K7kShLTJpH4nht06/6J3FS6EYramUMmyvQ/9A/tVKXx8yQs/L9McH5KPrUa
	frR8wdl+4dseq0eYa9WYY3IMeAlO/gtyKDoW3ZbfiYip+dnJDpE2c5PExYQmRi3Q3fvI39jUCCK
	WNjWV28XZi5jw3Tv2wcczraV3Isw7k02r5Xxlr51pV3UN+9lkMnBF/LUcORR1qNApcAOJBxAtTi
	QUvq91SKPxPUAJBwYXjT41NK7pkEWUIbxcmaWXbcFul047D7zQtx0k71dA9lW43uztE7
X-Google-Smtp-Source: AGHT+IFBZ6k8Nz8d9o8x+iQtr6CjmIHMpOMAc/uCH3WW5nYoK32vlcRJkpfey2g8X/1XVP8GynOGXA==
X-Received: by 2002:a05:620a:4627:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c7af0e3291mr1821180885a.29.1744663880730;
        Mon, 14 Apr 2025 13:51:20 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0f1fasm787918985a.112.2025.04.14.13.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:51:19 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:51:18 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 10/11] wic bootimg-efi.py: fail build if no
 binaries installed
Message-ID: <20250414205118.GC9290@localhost>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-11-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404162932.447699-11-mikko.rapeli@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214812

On Fri 2025-04-04 @ 07:29:31 PM, Mikko Rapeli via lists.openembedded.org wrote:
> With systemd-boot, some builds included correct EFI
> bootloader binaries and some not. Thus some builds
> booted and some not. Check that some boot binary
> was installed so that build fails if none were installed.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 96c710bf77..20b1c36a46 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -341,6 +341,9 @@ class BootimgEFIPlugin(SourcePlugin):
>                      cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
>                      out = exec_cmd(cp_cmd, True)
>                      logger.debug("systemd-boot files:\n%s" % out)
> +                # must have installed at least one EFI bootloader
> +                out = exec_cmd("ls %s/EFI/BOOT/boot*.efi" % (hdddir), True)
> +                logger.debug("Installed systemd-boot files:\n%s" % out)
>              elif source_params['loader'] == 'uefi-kernel':
>                  kernel = get_bitbake_var("KERNEL_IMAGETYPE")
>                  if not kernel:

At first glance I do not see how this code is checking for an invalid
scenario, and then failing the build should it be detected. Or are you
expecting the build to fail if the "ls" fails?

