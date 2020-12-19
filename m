Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.10444.1608392556826367918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkdCS2IO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id t16so6243256wra.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HjZzqcj0AOrevCXz4bAptrO1A8y9L5nfN/6cb86qCGg=;
        b=YkdCS2IO/s1CRkfhtFMPa3tuILQXiGHsXXKoIZ6SFx90uq8wadbiCbSuichln7TrPl
         wqFlTQug2pLYsG1VLf1ZAXCMphPVW00jyC20A4UWIH3UQeUmCWRrDfGqY6xcGeUyl9SH
         F3O6G4avTE384gie/mzxyjqQ5nsXyQBKi7rD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HjZzqcj0AOrevCXz4bAptrO1A8y9L5nfN/6cb86qCGg=;
        b=AvVV61k8tdyLPXLmklRVREvaMGsMnEI0PdIqJ6Gahxxd48KkyLItkifu4/PCS7PTBD
         7GBazYq+yDU9RFd+EoARiOSK3A6GZs264x/fWX7LjtMyr/9+nmfNyUqKcaBbOX0HMeod
         ehKHfWgfbRf5Suiv5/iuoskz3ne5a5JWGRnRMCG0LJeFo+qabYjxObE7uSr0kdQlOUPR
         YD3+GyPwY+z8bThzrSfin/N6YrNGO8Gz4/HkPzknSwqtDADiv9epeGiK80u8idbRhYrQ
         f50tHhp6DP2rbZmRED5Y2jwPVm5S8c3mtKx0ihb9N+awHa+jxheiS78NLgeiBfBm4Wx9
         pJ0w==
X-Gm-Message-State: AOAM531sGTLuTHPvqQYwbDixlwOS6Kye6A4ilb5v8xW+SyuQRyWpVOSv
	unpdG1SDNWCeb2dTBAl+/jTHpQ==
X-Google-Smtp-Source: ABdhPJzAg+HiQaUCp+tI9UxMXVPD67KlwWABXnRvB1icvOW5gurvhMwIkUxDpbzgkoWEeYAEbyT9lg==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr9922720wrw.73.1608392555273;
        Sat, 19 Dec 2020 07:42:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id s133sm15654984wmf.38.2020.12.19.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 07:42:34 -0800 (PST)
Message-ID: <8a27522c2cbd553adfe6b2a994fdd2951deae657.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] ltp: add support for tirpc and fix build issue
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Kory Maincent <kory.maincent@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2020 15:42:34 +0000
In-Reply-To: <20201219110800.5207-1-kory.maincent@bootlin.com>
References: <20201219110800.5207-1-kory.maincent@bootlin.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 12:08 +0100, Kory Maincent wrote:
> Add support to tirpc tests build.
> The export of ${prefix} updates all other paths variable and
> in particular PKG_CONFIG_PATH. This variable beeing updated it could
> not find the pkgconfig file for tirpc.
> Use immediate expansion to avoid ${prefix} export overflows on
> PKG_CONFIG_PATH.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change since v1:
>  - Use PACKAGECONFIG to enable rpc tests
>  - Improve ${libdir} and ${incdir} export
> 
> Change since v2:
>  - Improve ${libdir} and ${incdir} export
> 
> Change since v3:
>  - Use PKG_CONFIG_PATH in place of the ${libdir} ${incdir} variable export
> 
>  meta/recipes-extended/ltp/ltp_20200930.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
> index 7acf15b360..1a9c05a7e4 100644
> --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -42,14 +42,13 @@ inherit autotools-brokensep pkgconfig
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> +PKG_CONFIG_PATH := "${PKG_CONFIG_PATH}"
>  export prefix = "/opt/${PN}"
> -export exec_prefix = "/opt/${PN}"
>  
>  PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
> +PACKAGECONFIG[rpc] = "--with-tirpc, --without-tirpc, virtual/librpc,"
>  EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
>  EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
> -# ltp network/rpc test cases ftbfs when libtirpc is found
> -EXTRA_OECONF += " --without-tirpc "

I did queue this for testing however we saw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1639/steps/14/logs/stdio

(and I suspect we'll see the other selftests fail too).

I suspect this is due to hardcoded paths being expanded into
PKG_CONFIG_PATH which makes the recipe's sstate depend upon the
directory it was built within which is a real problem we need to fix.

Cheers,

Richard




