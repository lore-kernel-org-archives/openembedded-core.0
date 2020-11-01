Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.18428.1604252903939421611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 09:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fCz5tooE;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id a3so2187333pjh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 09:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mPNEHNYcQr1XoaBEJWCDHjx6tHizGxm76Ub299Wbsns=;
        b=fCz5tooEd3hqJ0CVy7jaFGysdccR/zl2sKf6QvQh2dUVoVs8g/g2PVyrbCfeda7U0u
         +kTECDUELJFTxE+be6mKTk9fW8oIbbitOqiwgrd7Kqj73HzygE/fK7JOOb/+ceTwnHTS
         8VcrlzuBQHicd3PD/yYZbDODTEmUZY3K6zkR2euHkTQ9KZkHB5sT7dhcql+w59VEJS4F
         jwUTPq14bgB/bbd7cuTOdilOq6+WpsCK/LtR1TE5YYw8szqNZJP+lr0eqxe077L0sle2
         8K1K+OY20s4U248SNeyrb4IAB48/eAm5AOFCA8b086uOGkkwdHrkeNopiG+UxWdXMOFZ
         g64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mPNEHNYcQr1XoaBEJWCDHjx6tHizGxm76Ub299Wbsns=;
        b=Gz4kMSdJxG+vSr2rx4m7VTQbdUGjrAmv1PNMUvogY622l0np2HHz1kAGxshbfc1psl
         VrRyfU2xDQcWixF9L8AznUmvYDBucWCjKQvkBvOZn+27kxAjmBgs5xXDIZDNhS246diJ
         bBr9zhgeceBMg/hiRSBRJvGBmDLwj4xbfT7jwV1AZXOrJiwYQY/PYXWBe+3ZILnJkbQf
         Htjci+ciyeHA4qP/LyzJEpl8MeNblFBHrme0ehITZlyI/35j7VhCw5WJKrlY/XeiuOgU
         trgfchOC+Iw124Yg1WoG4cy5MBx30yTkLoQyIoRmQWsq5wRUtGSvfnAQOv9QhS1eO2bZ
         UgWQ==
X-Gm-Message-State: AOAM533TaTCzA457kDeycA9lT+PiGLdEWLAt5lVp4GXCtfUqebo2/qOh
	6mGsXkxxyUG6yWF8R6FwDtwAafoOGv2HCg==
X-Google-Smtp-Source: ABdhPJx1Npg9yo3gxxq8IKtZ+m6xBPqx5XfClCaFhWhIhRlpHpiuvAAsobLexZ1gC+xYKS8h7YlJeA==
X-Received: by 2002:a17:90a:8906:: with SMTP id u6mr13792433pjn.35.1604252903070;
        Sun, 01 Nov 2020 09:48:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:ac50:3bbc:9608:2fe7? ([2601:646:9200:4e0:ac50:3bbc:9608:2fe7])
        by smtp.gmail.com with ESMTPSA id v4sm10533705pfm.57.2020.11.01.09.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 09:48:22 -0800 (PST)
Subject: Re: [OE-core] [PATCH] libxcb: Fix install file owner/group
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201101123233.349497-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9b2bff0a-f566-fb03-6248-7a68dce21052@gmail.com>
Date: Sun, 1 Nov 2020 09:48:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101123233.349497-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/1/20 4:32 AM, Richard Purdie wrote:
> The makefile uses cp -P behind the scenes for installing the tutorial files
> and this preserves the build user identity. Fix this to the correct
> owner/group. Usually do_package fixes and hides this but it can be seen
> in do_install.
> 

Would it be better to fix the makefile instead to use install utility ?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> index f27c5daa617..e9f6051b6e1 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> @@ -30,6 +30,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
>   
>   export PYTHON = "python3"
>   
> +do_install_append () {
> +	chown root.root ${D}${datadir}/doc/${BPN}/tutorial -R
> +}
> +
>   python populate_packages_prepend () {
>       do_split_packages(d, '${libdir}', r'^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
>   }
> 
> 
> 
> 
> 
