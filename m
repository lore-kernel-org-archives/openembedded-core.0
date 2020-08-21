Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.131956.1598007115709705273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 03:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KHW5p/6i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k8so1374974wma.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Og0fQ95583VI+fs02J+enNKFkt2sOJ6VRmLbbjK/Jzs=;
        b=KHW5p/6iPWKODnUhcNIFR7olT35HihjrUHrYtxHvxDzaMeLf5NDQZQZ1A6uRXL0ifr
         CnuDk71qvsIIUmKryhsUnMg0N6TH4zfKKGEnxf6GzunjAah2/ENu3oAdXtNA5fwX7CGF
         mFk10Ts0290//nSGhPaDIzmy1fgb7I6CFUgUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Og0fQ95583VI+fs02J+enNKFkt2sOJ6VRmLbbjK/Jzs=;
        b=hBG5+hdqf1upxwRBEweuNq89XwPVcSE3Qu3pWHUstgRGtCOs+xZtwlk4XbgmdMR4T+
         K8N1KEcLqZG0/lJo97n/6I/etkaDBPUucEfL6T3CW+DOnABvF+5wkVrRaeF95s/RKWf4
         TdCEfYUErglXtvK2zwxddzDB5l99V+reQ4bc2ylvHGqux0GTwElEDdtT2sdieQZSYXsL
         ARs3Eggs8ifBO5iItvDWxIcLD34ZtsY2BOUig4JdM9/qWDRpeOf9688NLpSqSrPAgBEl
         /Wo5NmXPtJDg14ryvDUavSjnqygFjriV++gDFheAmrLt7qSrOLIKK/55xih1P7a0V7Uf
         IMaQ==
X-Gm-Message-State: AOAM5330roPLSvo2b9qBu1yoHV3mInm/ZmGJzV/QCS+CoCgFZ8Tr/wsI
	GTjTtkkwYKAbwtjaGsr+btt0dg==
X-Google-Smtp-Source: ABdhPJwsAD4iTGEteR//D9xk0tp11dirniMgI7vk6iqZmbwkONICNuOd1klrTU2i3TmTYcxT2hkXgw==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr3097172wmp.166.1598007114051;
        Fri, 21 Aug 2020 03:51:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id x14sm4170581wmc.5.2020.08.21.03.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:51:53 -0700 (PDT)
Message-ID: <9ff64eca0998e51759073fbfd08f2e005ec328f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 2/3] gcc-cross-canadian: Install gcc/g++ wrappers for musl
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Leon Woestenberg <leon@sidebranch.com>
Date: Fri, 21 Aug 2020 11:51:52 +0100
In-Reply-To: <20200820080115.2715139-2-raj.khem@gmail.com>
References: <20200820080115.2715139-1-raj.khem@gmail.com>
	 <20200820080115.2715139-2-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-20 at 01:01 -0700, Khem Raj wrote:
> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> configured for glibc by default, this helps in creating correct
> compiler defaults for musl based SDK compilers
> 
> [YOCTO #13459]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Leon Woestenberg <leon@sidebranch.com>
> ---
> v2: Delete file before creating wrapper
> 
>  .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 553ef7fe62..c5935b978d 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -139,6 +139,29 @@ do_install () {
>  	chown -R root:root ${D}
>  	
>  	cross_canadian_bindirlinks
> +
> +	for i in linux ${CANADIANEXTRAOS}
> +	do
> +		for v in ${CANADIANEXTRAVENDOR}
> +		do
> +			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> +			install -d $d
> +			for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
> +			do
> +				p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
> +				case $i in
> +				*musl*)
> +					rm -rf $d/$p
> +					echo "#!/usr/bin/env sh" > $d/$p
> +					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
> +					chmod 0755 $d/$p
> +					;;
> +				*)
> +					;;
> +				esac
> +			done
> +		done
> +	done
>  }
>  
>  ELFUTILS = "nativesdk-elfutils"

I've bisected this error in mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/2341

to this change.

Error: 
 Problem: package gcc-cross-canadian-i686-10.2.0-r0.i686_nativesdk_mingw32 requires /usr/bin/env, but none of the providers can be installed
  - package packagegroup-cross-canadian-qemux86-1.0-r0.i686_nativesdk_mingw32 requires gcc-cross-canadian-i686, but none of the providers can be installed
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with /bin/sh provided by nativesdk-curl-7.71.1-r0.i686_nativesdk_mingw32
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

This is due to the addition of the /usr/bin/env dependency to the
generated files.

I'm trying to unravel the problems but it may mean extra fixes to both
meta-mingw and master handling of /bin/sh.

Cheers,

Richard

