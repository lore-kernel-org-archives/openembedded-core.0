Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.8353.1608797892745481023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 00:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CzRTg+nX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id c133so946728wme.4
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 00:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Lwol46KTBlPBj43s0FHnW2BlgLX54Spuz5f6uMq0+3M=;
        b=CzRTg+nXdzP8YLT/BauYJj2K0InhHSpeZZmu81rO4H7tQUegVRDwuynl/vP+u9EFMQ
         MUahgZnix+cIxYnzItdJxpQQlBlU6aTaq+AOhq+eNyB8nOhddB7TPEFkl+YgwYDkIKGt
         ZeZbaGC78R+WVKU7S6ZtF6weaWEGPDQmlFVvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lwol46KTBlPBj43s0FHnW2BlgLX54Spuz5f6uMq0+3M=;
        b=ZeDkOlOOXE+IuDexjZT1fporORfcBh5wShLbdFSOKeQxZ9vTnSJ6Iw+B+q4uC5UL/H
         zsob9hyG3MGG9VFD/XXeJRPygPTxeE6p2Wonu72nEYaPZED3L/3SmHZlebhsmu+ba9Ry
         2H4JjfwzGS7tamr50AKnclFKQq4vxk4BmKn14zOz+qarREoMJV2xq3PoIsRCayGh+Ytc
         U+D+QtFwDUYgOLsllsrSA2ZNo1UIzxxWvrJCh8bQjMMpVO2U4GjC4/oNdAbEKXw7zPnH
         2jqDaZ7C9oTKyJxYyNhg2N99z4jeEPkXqRkUWbfd+ck7pj8JdeBwpghPOs7ArhAJl6fE
         6xyg==
X-Gm-Message-State: AOAM531b1cOsWO+liLNq+oro80O14copu3qWIWjQXMaplJYyo/gMjEP4
	pTknmG3nLJNbbzr0fETZM5+m+Q==
X-Google-Smtp-Source: ABdhPJzusSPVVGrPhVWOw1+TMEm0HGiUHKV7CXBSaV/aiZAe+u8EV2K35rg96r6x22RCgwuuzZ6piw==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr3204765wmg.37.1608797891395;
        Thu, 24 Dec 2020 00:18:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id w3sm2627188wma.3.2020.12.24.00.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 00:18:10 -0800 (PST)
Message-ID: <938769b18655982b04fbc6db4ab71b17a6da8f44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] run-postinsts: fix setting pi_dir
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Dec 2020 08:18:10 +0000
In-Reply-To: <20201222064640.37970-1-twoerner@gmail.com>
References: <20201222064640.37970-1-twoerner@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-12-22 at 01:46 -0500, Trevor Woerner wrote:
> The pi_dir variable isn't being set properly; it gets set to the
> value of the
> *previous* package manager. Given the order of "rpm deb ipk", if the
> script
> determines that the package manager is "ipk", pi_dir remains set at
> SYSCONFDIR/deb-postinsts.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2
> --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-
> postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-
> postinsts
> index f84a7e18c8..c10fd11e9d 100755
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> @@ -20,14 +20,12 @@ for pm in $backend_list; do
>                 "deb")
>                         if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ];
> then
>                                 pm_installed=true
> -                               break
>                         fi
>                         ;;
>  
>                 "ipk")
>                         if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ];
> then
>                                 pm_installed=true
> -                               break
>                         fi
>                         ;;
>         esac

Just to confirm, this patch causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1668

(and other selftest builds failed the same way)

Cheers,

Richard

