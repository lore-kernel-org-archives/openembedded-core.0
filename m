Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.197.1590595201025260912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 09:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A61440C06;
	Wed, 27 May 2020 16:00:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVCkYnb7VKEe; Wed, 27 May 2020 16:00:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2E5240A18;
	Wed, 27 May 2020 15:59:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EED4D1731FF; Wed, 27 May 2020 11:59:57 -0400 (EDT)
Date: Wed, 27 May 2020 11:59:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200527155957.GK17660@denix.org>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200527155011.3165976-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> this helps in using common header across multiple versions of kernel
> going back

This check should have been there from the beginning and for every header 
file. It's big PITA to sync this list up, especially when dealing with 
different glibc or kernel than OE-Core, e.g. external toolchains, etc.

Any objections to making this check more generic for every entry in the list?

-- 
Denys


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
>  
>  BBCLASSEXTEND = "nativesdk"
> -- 
> 2.26.2
> 

> 

