Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.3716.1599039693477372592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 02:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=akqlrxeU;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id m6so4519433wrn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=QXTcqiaExKdTr0i/BNMKav6yktnl50wX22hAWIHQZG8=;
        b=akqlrxeUuuDEAnq1fS6MVliITNlixVZiuyula7TteTMw2fi7fL/usfYXDjeksVVAx+
         co55nTw/Vna8d+1W3yuXSRtdw/i6yPoNV8nUrLwRqFO5VtXQn2HjWGyoeE8vJmVlPd06
         NNtgYrdc+lohUVKe0rsbxAl2Dy+UZs63tKK3w9166KmNeOD7Jn4P0u5Hx7d1appAzOw+
         YseG7neNP0sSB6F/xJYWwbb+5OlfZqJsu4fgNwZfeRekVBnLgVtQRork2swiGRHBlul/
         yQP9sRt1mnzp/npf06ljFevVaW1cuXWODMOGQKtSl8dz76vf2ZQOQajnP48SuSdklHpw
         ktQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QXTcqiaExKdTr0i/BNMKav6yktnl50wX22hAWIHQZG8=;
        b=cC6GVzQdl0WBYX0cLmPIQKt1SAC2CDnAWM38dt11B3ngdC1fLQBlLCjOe4GsKoMb+G
         Gkt3WWAKj/9gAYpXq4SPefd0/XWS6iAxxtfVoo5Q/Dos4+8VjIF3qdOKdbbfrAl9V3lX
         rDzzjmrRNd4qa1IT9NGdXATMRI8b1qdRDMaN68GHCZDbPft6Vlnsw06TflTYiFDfTvZB
         Xk1fnc8srO27EnAB3KoF582VjdP1vEwQeM6rwUhj89TW1obnmLm8/5W4c/RSOzNAwDBF
         eo/IoQSCdAlHUgaRLBwXdbSKGrNCfWtMTXwhx83GS4okuhBXClOyDhWe0AEGXPksm/Y4
         fO3Q==
X-Gm-Message-State: AOAM533VzT7vk5hJjWQDoQ32TkrdTA4d+02MDy62h6DByb6tdlX43/EK
	GQxhDT8PaJ9M2OMuABCs3aHi1dFzya8ThmPkwSc=
X-Google-Smtp-Source: ABdhPJwW0Oam7h+7BS6DUwE4BCoY9krN93YEGe0gZqLL5j8mm2IwXL4V5L4qYbdA4iEsRBfYi9U0vA==
X-Received: by 2002:adf:f88b:: with SMTP id u11mr6058147wrp.376.1599039691603;
        Wed, 02 Sep 2020 02:41:31 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from [192.168.1.171] (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id o5sm5316558wmc.33.2020.09.02.02.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 02:41:31 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] elfutils: Fix GNU_HASH QA Issue
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200902032241.3586810-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Message-ID: <6711e35c-0bf2-2f17-482a-d85eae508dc0@burtonini.com>
Date: Wed, 2 Sep 2020 10:41:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200902032241.3586810-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 02/09/2020 04:22, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-devtools/elfutils/elfutils_0.180.bb |  1 +
>   .../elfutils/files/ldflags.patch                | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta/recipes-devtools/elfutils/files/ldflags.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.180.bb b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> index 9f8bfc24f3..d3ee750725 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> @@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>              file://run-ptest \
>              file://ptest.patch \
>              file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
> +           file://ldflags.patch \
>              "
>   SRC_URI_append_libc-musl = " \
>              file://0001-musl-obstack-fts.patch \
> diff --git a/meta/recipes-devtools/elfutils/files/ldflags.patch b/meta/recipes-devtools/elfutils/files/ldflags.patch
> new file mode 100644
> index 0000000000..ef1d65e2c3
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/ldflags.patch
> @@ -0,0 +1,17 @@
> +Pass linker flags along to CCLD, this ensures proper linking
> +w.r.t. hash_style selection during cross-compile

Did you re-run the test suite?  That binary is explicitly compiled with 
minimal flags, so adding the LDFLAGS might actually break the test.  For 
the same reason, you can set Upstream-Status to Inappropriate.

I've a fix here for the same issue that uses INSANE_SKIP instead.

Ross

