Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1079.1589316990011615211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ghgFUOvk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id h4so23786526wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ucicMcrThlhU+9JsvysTKW5sT+7TK1TZxxbi81687Gw=;
        b=ghgFUOvkcrKcNHUAtzs2SB9qlQpLzPI3krRZE/SqI5hYm6bKnkxH3Z8hD9TXHyL5ZA
         FH+zILR6x31f6tm5QdX2bJJNAKWsX4+ZK7S2gJOtAIraIH2eySFrbDlbMZSVyGsOBfb/
         Ut/a++snkTB8UTJBIts76POsTDZSeZV7IJly0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ucicMcrThlhU+9JsvysTKW5sT+7TK1TZxxbi81687Gw=;
        b=NQSjz0x0JjHbPIpWwm4d4KrSedCzV+0ciC+SnQDe1xo2RPET0shJ8U/OHD2nca7Kju
         HE6L5OiecnR8wKHPwz2MfohtrbESyF7fb4whkxmjCL5US2Q3IYgOF0IHydvNLbmhMxYa
         YgB2bq6+40KOM1pOqUuzthR42pdLPFqj4x/fUkc6Dd9fNN1efuzXRS3gfpbS+DwZKqxh
         gGb1rBe8Ny/BVjS/51PDDrjnqUyaGilxRx+/mWzOZbtc3yq8EhFFBoT8+t1y8KtllBgi
         7wAb0grYB1q/K4HhoO+zoCXQimS3OB17oDk8kp91eAXhtOAwtSvgFwRH5UsIpxtVKVtJ
         +LNw==
X-Gm-Message-State: AGi0PubxmfXfpzsmi3GHMCvA5s6WzcZ3uia7DEadj4uvgARJrbOqg3t9
	tt1BYFMmLnEV9jveReVY+wzQqw==
X-Google-Smtp-Source: APiQypIZHM6WNdR8202xxZZ9+1xoGJZkhUxpqWhX+aFLpGVMcdFbo23E5vs/1kgMrg9mbxhIvSMDlw==
X-Received: by 2002:a1c:1dd8:: with SMTP id d207mr20400228wmd.125.1589316988315;
        Tue, 12 May 2020 13:56:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 77sm25078681wrc.6.2020.05.12.13.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:56:27 -0700 (PDT)
Message-ID: <58167e91dd84c91305dd55ef7ced973aa3dee6a8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] matchbox-wm: Replace -fcommon with fix
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 21:56:26 +0100
In-Reply-To: <20200512141416.5327-7-bunk@stusta.de>
References: <20200512141416.5327-7-bunk@stusta.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 17:14 +0300, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../0001-Fix-build-with-gcc-10.patch          | 41 +++++++++++++++++++
>  .../matchbox-wm/matchbox-wm_1.2.2.bb          |  3 +-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
> 
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
> new file mode 100644
> index 0000000000..541b5c9c84
> --- /dev/null
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
> @@ -0,0 +1,41 @@
> +From 8a8f8446e803cad04d7bbceaab78ee45d9778c3c Mon Sep 17 00:00:00 2001
> +From: Adrian Bunk <bunk@stusta.de>
> +Date: Tue, 12 May 2020 09:44:05 +0300
> +Subject: Fix build with gcc 10
> +
> +Upstream-Status: Pending

Its now merged ;-)

Cheers,

Richard



