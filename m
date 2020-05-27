Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.2169.1590614451324378824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 14:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TYwgXDbH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id r15so1004429wmh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=brHmfjYJtVr4f5QBHKTaK74DzwJ7WrU2r5mF0Ho3qcQ=;
        b=TYwgXDbHRUynvgVwE8egrzOiOMLq7BR3lRq6lg6MXiVHSVQH3s31+lVylyl3+QosYs
         uD6uzpJeHoULfk2VVSsLeq38qJ9PRBEquPKJPqgx2HH0gBw+1JSlAvXfmJbpqTTxNx41
         cKY/W4LcDYgnGNUsT+Cr8YcCwvIsL7E3CqebY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=brHmfjYJtVr4f5QBHKTaK74DzwJ7WrU2r5mF0Ho3qcQ=;
        b=VNm3EFlNsgmcWJv/AfM+OIvC99J2kBy+dpHmdLtIDZTul+8I7tgfNfKo3gCVV/bQe3
         j6Z1kQtKUZHeDaS2bOxhQOeBGGk9L/irPs87+Uyk4f9VvGvx46jteV7eUGGmFZ2iO5Lq
         GMrGfya7FnlxrGtFQfbk8s5RgJOwAeKlvdXg8+Y/CPNQ2c2aClY++8dqrmqE/3lHbkiV
         RRCK1bw+IG2Y2Zn7phmDOp6ID2/28uMi0rhRib8jLkqCfKnisRnvMXouCof/ZP33fUHk
         obS+LP0O58A2RqkQyNGKfEUrY5En6EPS2CEV1zbtycInB8SpHmqaBq807hFkIeYuiPVZ
         HIYg==
X-Gm-Message-State: AOAM530wHbU9iCB1JxvrvoEtr+0FWZifHhS0xZPn6L24TORnk/hGnuIC
	R3m1cOXGB3+TpnJD5kdzfrxoIQ==
X-Google-Smtp-Source: ABdhPJwAcm9pmoRz+InWUavhvJvBR3uqftf1Wv9RQD3ziWxX+NC2NiyNnKrdpkmt3ZdEHF6Wihut/w==
X-Received: by 2002:a05:600c:224f:: with SMTP id a15mr73664wmm.166.1590614420032;
        Wed, 27 May 2020 14:20:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z206sm4219387wmg.30.2020.05.27.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 14:20:19 -0700 (PDT)
Message-ID: <be1579a2a2ba98cf3ac186e5bf2bff0d3abe762c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 22:20:17 +0100
In-Reply-To: <20200527155011.3165976-1-raj.khem@gmail.com>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 08:50 -0700, Khem Raj wrote:
> asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> this helps in using common header across multiple versions of kernel
> going back
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 4481aa430c..933a01ba81 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -81,8 +81,11 @@ do_install_append_armeb () {
>  }
>  
>  do_install_armmultilib () {
> -	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
> +	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h
>  	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
> +	if [ -f "${D}/${includedir}/asm/bpf_perf_event.h" ]; then
> +		oe_multilib_header asm/bpf_perf_event.h
> +	fi
>  }

Why are people using old linux-libc-headers? This is for the toolchain
so it doesn't need to have anything to do with the target kernel.

I've always assumed that people should be able to use the latest
version here and should not need to customise this. The headers should
be backwards compatible. What am I missing?

Cheers,

Richard

