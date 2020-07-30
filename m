Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.1882.1596084919987815694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 21:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m4JV4oDd;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id p3so15850531pgh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Ktvnng277f8UmeeIu1cROvbSDI40J6T05+kJFtvGMTA=;
        b=m4JV4oDdE5oHSmRhwzdFgIvdTh9+Rpn9TT/6yws3kv990qPpFif+zgESLJ0gLLu+2D
         Mk5C2X6QLPYr+vjRgTYUvWAmdB5Mn35xb/18ftR0b8kjieKTF2LNrOrxROeK8NZ2pZvj
         Cg4d7p/tZkPnFAwlUE7WdbvCOQon63Lx/fDaniCK+5cmmo/n8LP+FAq8QDFiobiBXt5X
         ed9cZ1655eBTxsDPIaJ7D2RKBYnrR1STyZEnh538t2Lq4xNqrJcPWb5x7SgFc5d7PhTU
         BY1gN9bUVCO1vH7Hh4J9oWr44IU/E9oGQMEJ/eFtpRLhoamYMjxItLNeKfefyakm62wi
         RZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ktvnng277f8UmeeIu1cROvbSDI40J6T05+kJFtvGMTA=;
        b=awYIYltGBaoWpTexFD2eOZdY5FK/yUenu37hGlosaNVXszQhqxGTkE5581HCdaLZwF
         Q9ai9glhVpOfBJwlFnwH80onJZWa0veCH1bjnKNG7a2YjxOl1G0Y+yfi+xpowK5YN/lC
         uNn1VeukAtLevttJUIev87EUCfZdydzMeIvgmVWpjFvnFIZRD6ggMBcyViRIlx+fkREI
         38I81/trorOVCBchcBUHxDfg0ak4zvxHrTf+xm1IMhI88x9bg2eX0AI7AQb6555Tbq6u
         ZKMVKKnvoi6mi0Uzdb9c5JG6M30e3UOvEev7FU9NPGHi2EUQFPkqcIuI2Dz8KE1rkIRA
         5fcQ==
X-Gm-Message-State: AOAM530G69waDz3Lj8LDFJ+KnbagNPLiDXmJexuDswgouEJqwQcarSVA
	+RTJ7fphADd8toobvhKWXbVg/tjogM0=
X-Google-Smtp-Source: ABdhPJwHElEOGB5VJ9rdJhSaRPqrV3tj/bHKq/8SnNcbn1PkaQnnOOtEn19j+q1Qj/dMCSeA4yqW4A==
X-Received: by 2002:a62:1c8b:: with SMTP id c133mr1514037pfc.134.1596084918535;
        Wed, 29 Jul 2020 21:55:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id d14sm3823200pjc.20.2020.07.29.21.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 21:55:17 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
To: Ruslan Babayev <ruslan@babayev.com>,
 openembedded-core@lists.openembedded.org
References: <20200726015614.2875-1-ruslan@babayev.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <bcdf3a3c-eda4-1c29-aad4-624fbba95a8e@gmail.com>
Date: Wed, 29 Jul 2020 21:55:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200726015614.2875-1-ruslan@babayev.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/25/20 6:56 PM, Ruslan Babayev wrote:
> 'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.
> 

since mcpu/march should provide the right values already, do we need 
this additional logic in meson? dont we get needed settings to meson
already?

perhaps you can describe some missing cases this would address will help 
understand the usecase

> Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
> ---
>   meta/classes/meson.bbclass                         | 14 ++++++++++++--
>   .../meson/nativesdk-meson_0.53.2.bb                | 12 +++++++++++-
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index ff52d20e56..0caa7a37c2 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -62,6 +62,16 @@ def meson_cpu_family(var, d):
>       else:
>           return arch
>   
> +def meson_cpu(prefix, d):
> +    import re
> +    arch = d.getVar(prefix + "_ARCH")
> +    tune_ccargs = d.getVar("TUNE_CCARGS")
> +    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
> +    if m:
> +        return m.group(0)
> +    else:
> +        return arch
> +
>   # Map our OS values to what Meson expects:
>   # https://mesonbuild.com/Reference-tables.html#operating-system-names
>   def meson_operating_system(var, d):
> @@ -110,13 +120,13 @@ gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>   [host_machine]
>   system = '${@meson_operating_system('HOST_OS', d)}'
>   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> -cpu = '${HOST_ARCH}'
> +cpu = '${@meson_cpu('HOST', d)}'
>   endian = '${@meson_endian('HOST', d)}'
>   
>   [target_machine]
>   system = '${@meson_operating_system('TARGET_OS', d)}'
>   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
> -cpu = '${TARGET_ARCH}'
> +cpu = '${@meson_cpu('TARGET', d)}'
>   endian = '${@meson_endian('TARGET', d)}'
>   EOF
>   }
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> index 67add2c25e..021bff0992 100644
> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> @@ -6,6 +6,16 @@ inherit siteinfo
>   SRC_URI += "file://meson-setup.py \
>               file://meson-wrapper"
>   
> +def meson_cpu(var, d):
> +    import re
> +    arch = d.getVar(var)
> +    tune_ccargs = d.getVar("TUNE_CCARGS")
> +    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
> +    if m:
> +        return m.group(0)
> +    else:
> +        return arch
> +
>   def meson_endian(prefix, d):
>       arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
>       sitedata = siteinfo_data_for_machine(arch, os, d)
> @@ -44,7 +54,7 @@ cpp_link_args = @LDFLAGS
>   [host_machine]
>   system = '${SDK_OS}'
>   cpu_family = '${SDK_ARCH}'
> -cpu = '${SDK_ARCH}'
> +cpu = '${@meson_cpu("SDK_ARCH", d)}'
>   endian = '${@meson_endian("SDK", d)}'
>   EOF
>   
> 
> 
> 
> 
