Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E36C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:01:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13884.1707490890184183029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=cH6keWw2;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4101fc00832so8896195e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 07:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707490887; x=1708095687; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0CUQG0pwqCLGlZHWxsFgg1CUkvJO7+mZ0s4VLwGSdQ4=;
        b=cH6keWw2/n71MJ2NfXgV+0eKaVXMTfyAy1LJgqahBYQybxz8Bc5O3K3Wn1F/Qol+Oa
         ni7/Nzvnx0tGWUjRs72kplEmqjyWXzFPxP0BmMzM9hO5gVnw8GfsAb1kHjcnY68TFI6W
         jCalBT510AM/xwIenfFIFiNBmSw753bhu97AG20fm2B3BD48N9o4OA4JmJ9FCPo7j3dU
         bzkTW7DHCMi0JoLzLknF4m4CguZ6FzXivQa3E7hnLStCPhxNP3O/Nljm5oRb0hhFI5bQ
         PO7lB9w08P6U0aIlNZH/SqIH6XqjXBryf8IO4IT37NEZRHveJXoKU4SjEeaIWFMACjMN
         G7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707490887; x=1708095687;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CUQG0pwqCLGlZHWxsFgg1CUkvJO7+mZ0s4VLwGSdQ4=;
        b=n8KwLKI6Z/upN440zFCBfDbfS8bg59Jg2YQtqI8UwHKhsTb43CCOLhoR4t5nMzj0DD
         TC76gfTZfTZRO0S1mZ5xBogHK8a0VfSNZHxXprO5rBwDtzZjFcgNTNCuRVvEi8Bpa/qV
         EEXUDs+4Q3XAdXFJFscEXnoTzAmoODJAoHEVfHpiPl4d5O+37LlUlfvtiNxcZvcW8+n5
         We/XbPMOuWg9SBcXlR7lYBcXXC7Qp1Dhq+frBA/2+7JqMmNj0HxKNlhIlJdzksYjF3Tv
         Ta3DFREDy6wIZpxDOUtCS0ITv+LvLOZVO8/cf9UDYDE0cGB0ScmUilPuSnbO+rvsOqii
         3BJg==
X-Gm-Message-State: AOJu0YzLO+HoqeccLBAs/t9DvlE+nXzpO1xsiO7NZuFJNiPDDwUaRh69
	jyuPmYLqh4V7h0uQ7csPZm+ciRQ+w9mc7Pe079DCRQcQlUJ3wRxXO/BLiNZM8YPszoaORfIYVa9
	niXo=
X-Google-Smtp-Source: AGHT+IHcxcbFlWCg/pU5fyWF6Yc0jXxVK//KnrIS5tOjxgYkSQVCKqxWQY4Thz5trsa3XkomW4FDfw==
X-Received: by 2002:a05:600c:46c8:b0:410:774f:b9e0 with SMTP id q8-20020a05600c46c800b00410774fb9e0mr967618wmo.4.1707490885103;
        Fri, 09 Feb 2024 07:01:25 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id l7-20020a056000022700b0033b13922263sm2021999wrz.60.2024.02.09.07.01.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 07:01:24 -0800 (PST)
Message-ID: <d69df613-7175-419d-8b5a-e9b48c604fb8@smile.fr>
Date: Fri, 9 Feb 2024 16:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Add user space utility:dropwatch
To: openembedded-core@lists.openembedded.org
References: <20240209112421.45771-1-chen_heyun@163.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240209112421.45771-1-chen_heyun@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195225



Le 09/02/2024 à 12:24, chenheyun a écrit :
> Signed-off-by: chenheyun <chen_heyun@163.com>
> ---
>  .../dropwatch/dropwatch_git.bb                | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100755 meta/recipes-extended/dropwatch/dropwatch_git.bb
> 
> diff --git a/meta/recipes-extended/dropwatch/dropwatch_git.bb b/meta/recipes-extended/dropwatch/dropwatch_git.bb
> new file mode 100755
> index 0000000000..62a1eab777
> --- /dev/null
> +++ b/meta/recipes-extended/dropwatch/dropwatch_git.bb
> @@ -0,0 +1,22 @@
> +# Copyright (C) 2024 chenheyun <chen_heyun@163.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY  = "User space utility to diagnose to NetWorking packets are getting dropped"
> +DESCRIPTION = "Dropwatch is an utility to interface to the kernel to monitor for dropped \
> +               network packets"
> +                   
> +HOMEPAGE = "https://github.com/nhorman/dropwatch/"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
> +DEPENDS = "libnl readline libpcap binutils"
> +
> +PV = "1.0.0"
> +
> +SRC_URI = "git://github.com/nhorman/dropwatch/;branch=master;protocol=https"
> +SRCREV = "853457b77dbc3d6665a379f3fe31ec53f11b6f61"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig gettext
> +
> +BBCLASSEXTEND = "native nativesdk"


Happy to see this tool packaged, but, as Ross said, maybe not in OE-Core but in meta-openembedded instead.

That said, neither nativesdk-dropwatch nor dropwatch-native build:
  ERROR: Nothing PROVIDES 'nativesdk-libpcap' (but virtual:nativesdk:/home/yocon/Documents/projets/yocto/poky/meta/recipes-extended/dropwatch/dropwatch_git.bb DEPENDS on or otherwise requires it). Close matches:
    [...]
  ERROR: Required build target 'nativesdk-dropwatch' has no buildable providers.
  Missing or unbuildable dependency chain was: ['nativesdk-dropwatch', 'nativesdk-libpcap']

for dropwatch-native, logs are here: https://pastebin.com/Z6qEATiE

=> You need to drop the "native nativesdk" in BBCLASSEXTEND (or fix the build problem but I don't see the point of having this tool on the build/native host) 

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

