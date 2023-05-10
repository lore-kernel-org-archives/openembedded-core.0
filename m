Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1414CC7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 15:32:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.20714.1683732730815423018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 08:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=enqvYXAf;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3078aa0b152so3264383f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1683732729; x=1686324729;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2TFZfHtzJMOUBk2n/2IYmYom1UTxFllG3QkjWJGLqw=;
        b=enqvYXAfXRncBrExmfGa7NpwTvVDKM3AJ55O/zlTqwFOrSN994phUKMZSjh2beGR44
         uu1Tb0gUTF7idcKgZKk1HZjUG/Wda3zDMiI4XbO34VQv5Djwik7ZgZgAjEZ1nyv9SY31
         qQZvBVotAwCvZJECw3bHtVKT+V0uUbA1YyuymM0DvurpyRrzZGsSNKq5m1+B5Hj/burd
         ofmdwZfO3nQ9Zv99APwf2bmt3xzowc2rgN5tl8uyX4r0T2+EykbxOsGbXTws/Cvjn2Ep
         fVDRw6cA+UCZU7w+HKZJRERwZAQrxhpkEa8EA6Qb3E+FE9HnC0AyImGTrmex6XV4A7T2
         nI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732729; x=1686324729;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2TFZfHtzJMOUBk2n/2IYmYom1UTxFllG3QkjWJGLqw=;
        b=ENB7gqyUK7CWPBvKJqNkNyj0ng8Qycwvh6uSYp93UlBJ4F3zdEYlkGKECC2yg71HZg
         NQyKPIbifsvof2OGxjAsja4BoJKQvC6rgzYSYH+HFA1UIuwgeTMW6twsBVAZXv5XraFA
         VU1+6UBq8B9Tibv7qoLgY/LLP9QY8it60ov/4SE4Hx3th1qbaNBRAvs6nD0K18z5pb6Y
         3at7He1ifpzibJ/vtY6TdQik/JF8YkAl1SXC5ljqMp8JF06DaJvnkyJIS2xQ/ndOAgyE
         zeHyrz8i4YQXXcEgP4lHId6Z4lJAaDOByjHiQCTMlS4pXF3Bp4rKxGUxnICIlXD/+K1L
         D4CA==
X-Gm-Message-State: AC+VfDyhxcYWbuZcfheXraURDXSULv5qaMDZ7ZKI5eVRP1wqvZHaOqSu
	U4wy32x2Prw4iH/32k5JMK5VorTbkSoWoEapplqaew==
X-Google-Smtp-Source: ACHHUZ6wEUDL4zrzJKCsC2FVO9DLAPWto/YVJ8UcydxM2KBHWv0esfhtnBPwFhrLiFc6Gi8fw2BfLA==
X-Received: by 2002:a5d:6081:0:b0:306:29b6:b389 with SMTP id w1-20020a5d6081000000b0030629b6b389mr11698973wrt.64.1683732728342;
        Wed, 10 May 2023 08:32:08 -0700 (PDT)
Received: from [10.1.75.108] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003f33f8f0a05sm23149213wmi.9.2023.05.10.08.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:32:08 -0700 (PDT)
Message-ID: <e9734fec-402d-63fb-bff0-8ab89306f599@smile.fr>
Date: Wed, 10 May 2023 17:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][kirkstone 04/15] linux-yocto: Exclude 121 CVEs already
 fixed upstream
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <cover.1683671423.git.steve@sakoman.com>
 <5703fcbbede8ec438e36505d406e1f873b13a476.1683671423.git.steve@sakoman.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <5703fcbbede8ec438e36505d406e1f873b13a476.1683671423.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 15:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181113

Hi Steve!

On 5/10/23 00:32, Steve Sakoman wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Exclude CVEs that are fixed in both current linux-yocto version
> v5.10.175 and v5.15.108.
> 
> To get the commit fixing a CVE, I used the Debian kernel-sec repo [1].
> 
> [1]: https://salsa.debian.org/kernel-team/kernel-sec/-/commit/86d5040aee9275f9555458fcaf9cb43710dff398
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-kernel/linux/cve-exclusion.inc | 875 ++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc   |   3 +
>  2 files changed, 878 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/cve-exclusion.inc
> 
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
> new file mode 100644
> index 0000000000..7fd362881a
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -0,0 +1,875 @@
> +# Kernel CVE exclusion file
> +

.../...
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2503
> +# Patched in kernel since v5.19 4caae58406f8ceb741603eee460d79bacca9b1b5
> +# Backported in version v5.4.197 fd2f7e9984850a0162bfb6948b98ffac9fb5fa58
> +# Backported in version v5.10.120 8df42bcd364cc3b41105215d841792aea787b133
> +# Backported in version v5.15.45 69712b170237ec5979f168149cd31e851a465853
> +CVE_CHECK_IGNORE += "CVE-2022-2503"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-26365
> +# Patched in kernel since v5.19 2f446ffe9d737e9a844b97887919c4fda18246e7
> +# Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b66041905506
> +# Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa4410f1
> +# Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684ec9
> +CVE_CHECK_IGNORE += "CVE-2022-26365"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2663
> +# Patched in kernel since v6.0 e8d5dfd1d8747b56077d02664a8838c71ced948e
> +# Backported in version v5.4.215 d0a24bc8e2aa703030d80affa3e5237fe3ad4dd2
> +# Backported in version v5.10.146 9a5d7e0acb41bb2aac552f8eeb4b404177f3f66d
> +# Backported in version v5.15.71 dc33ffbc361e2579a8f31b8724ef85d4117440e4
> +# Backported in version v5.19.12 510ea9eae5ee45f4e443023556532bda99387351
> +CVE_CHECK_IGNORE += "CVE-2022-2663"

I just noticed that the list in not sorted :(

I'll send a V2 sorted (This will make the next iterations cleaner)

-- 
Yoann Congal
Smile ECS - Tech Expert

