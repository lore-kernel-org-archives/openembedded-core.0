Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.2887.1588172642670798090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 08:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuKNHbnw;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id n16so1132915pgb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=EuRPgFM66UTTRkJOqh/LEHdB1NqP5iMagKVoydKqgh4=;
        b=YuKNHbnw1U/P+ZjDLu/LseZ4BE//K/rhRSqqUoRBeBO+bPxZYzMlPtaGN8Etwk4ITz
         LHInpQw2u9yd9KSLCxvtNvvRz5nu5eX1Gaxj2jzNT10v2hV3r4s8SyPhMR01mZT1M4EW
         HmiqAUdf6MmOz/Y6ztXFdwySWurm1xc8c82TSvn+PXbwwK5Qkr4Hn0LqJtYjHMHP24pM
         ZhIMOH4moXC/COQw4lkD0E0WPLVNUzeXmWqF7qbtgcF1S9ySD4EG42n5LuSUwMvRqCM8
         5Lwqi3hJWgwruIpFcUiRVBPrJwv9H8DpXGjzWfeIoSojcC+tgWGrAC+jV4wtpvh4cwTS
         RnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EuRPgFM66UTTRkJOqh/LEHdB1NqP5iMagKVoydKqgh4=;
        b=gjBW4ND1SpW5rM25gF2wuDI+45E7KSvxFi+mUrtqJFarcnxzIBLBoJHN6eCKk9+j+0
         rWuoVoFao3EjVYwdGpQ1Eor94TDNHHxSLI3TAICAWm0T4RlE3lq3E9chAmq6M9jHCsSG
         qp6lx/2I8Cn2Z7eKamumRgbA4Or6QpF/042ESst/jB8OmCc5iDvKaWUlORf2yjVyahmx
         kESrYwDkvdqJE6oLCfFdSXF7ncVmZmV5HkNThHrZvxCq79C77eO7pVbP53l5CNY9KR6z
         iCYApEilPE3cdNetkNofpleeI2d0MYj80Yap6BQk59mW4hBBz94t2jOi11GHqrj2azYa
         wxYQ==
X-Gm-Message-State: AGi0PubtEi5nekBt6yTsx4SYfkMI+C12NB7vdtz8PIxSeK9tPKVVdp52
	FUIMb1lGbdkTyKIWbBxNfmcEcPUCsgI=
X-Google-Smtp-Source: APiQypLQR1OP6qCvouTonGJcmc+XG4DljxyGvee1CUcha2nY2I5Sd5i0J2un7KRwX66b2Vn52zCXIQ==
X-Received: by 2002:a63:6d4a:: with SMTP id i71mr33640240pgc.445.1588172641188;
        Wed, 29 Apr 2020 08:04:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:68fb:d75c:9385:c0c? ([2601:646:9200:4e0:68fb:d75c:9385:c0c])
        by smtp.gmail.com with ESMTPSA id 1sm1300213pff.180.2020.04.29.08.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 08:04:00 -0700 (PDT)
Subject: Re: [OE-core][PATCH] nfs-utils: fix configure error on some hosts
To: openembedded-core@lists.openembedded.org
References: <20200429090036.13169-1-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <e5d91d81-16bc-dff1-301f-fabc8921a5e9@gmail.com>
Date: Wed, 29 Apr 2020 08:03:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429090036.13169-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/29/20 2:00 AM, Chen Qi wrote:
> nfs-utils' configure.ac hardcodes the rpcgen's searching path. However,
> on some hosts, rpcgen is missing but SDK provides one. We should avoid
> the hardcoding so that nfs-utils could be built correctly under SDK.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31 +++++++++++++++++++
>   .../nfs-utils/nfs-utils_2.4.3.bb              |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
> new file mode 100644
> index 0000000000..5602e5be57
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
> @@ -0,0 +1,31 @@
> +From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 29 Apr 2020 08:56:05 +0000
> +Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + configure.ac | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f9efdb7..8e8aeaa 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
> + 	rpcgen_cflags=-Werror=strict-prototypes
> + 	RPCGEN_PATH=
> + 	if test "$rpcgen_path" = "yes"; then
> +-	    for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
> +-	    do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
> ++	    #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
> ++	    #do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
> ++	    RPCGEN_PATH=`which rpcgen`

Perhaps pass it via configure argument, since which can find random 
version too.

> + 		if test -z "$RPCGEN_PATH"; then
> + 			AC_MSG_ERROR([Please install rpcgen or use --with-rpcgen])
> + 		fi
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> index 9bdb6f4ae4..05877d57f1 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> @@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>              file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
>              file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>              file://clang-warnings.patch \
> +           file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch \
>              "
>   SRC_URI[md5sum] = "06020c76f531ed97f3145514901e0e7c"
>   SRC_URI[sha256sum] = "af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef264dc2c78c904f26599"
> 
> 
> 
> 
