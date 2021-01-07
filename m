Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7031.1610018979754211614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 03:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ae6IMduG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id g185so5235344wmf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 03:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=d0S6VlCAa5/ayoLr2KmvQo1u7yhrg49SMUrGfiBhGwc=;
        b=Ae6IMduGKx72HjBvkt10kpu7dLFo3NzcaC2r/nfnWD9p9XG6tYJbcC+XhSSbfXCATp
         F7UKVQULaHGgkQZ205Q/oPgBalmpL2yNGE42pHoP25YHqkP/mlVs4l7TkYpvHQwFz1mA
         qhJWgtlI5PEQsreta3+89a0Yh2uMw8Zh1246s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=d0S6VlCAa5/ayoLr2KmvQo1u7yhrg49SMUrGfiBhGwc=;
        b=LpL1Q4YtGW87M6ubhMmQCvbhPDFWoarHNA/h3LykgymtG7hfZt3uxQBHhr4qi1p83v
         CNqRSmelHf6v+2FbeV8a/Tcq1aUaLE6c0XgBcAFiNHmbg//vQaesGFvLBzaa4Ln6Mg+X
         qHOLX69/0bPRolqMgTPm8JrS6B6SKjf/rBE30lKI5/57+EpdP3xgg1sagdsXVArXlatZ
         8hn6Xl4cVAJCdC1YeUGAWlYjfMC65CKsAmFLNPw+vtkfdoLZPRqDI+aY7RLx7It1mzDU
         ezIMi/mTMFc+5ISzH5tnHaRkug1NHGT+oZ+OlWXqKbtjYwUeVQgMOvyWytayK49iLC8L
         U0JA==
X-Gm-Message-State: AOAM533/bRKrJbVIhp9uxH8wauS378mo7vHYWz0mPW0tE735oOaJxcao
	x9JFa/rmDz7u5a0F9VLidW9Fvw==
X-Google-Smtp-Source: ABdhPJzm7GlyBcG2AdDtrariqhKDuhJYhCsf3zjI0aulh1FpvOT8lf8ag73udxPeVNzsR/dYw6wotQ==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr7470745wmd.75.1610018978099;
        Thu, 07 Jan 2021 03:29:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id m18sm7614087wrw.43.2021.01.07.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 03:29:37 -0800 (PST)
Message-ID: <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 11:29:36 +0000
In-Reply-To: <20210107095630.32609-1-mingli.yu@windriver.com>
References: <20210107095630.32609-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-07 at 17:56 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
>  # systemd-analyze --man=false verify /lib/systemd/system/systemd-kexec.service
>  systemd-kexec.service: Command systemctl is not executable: No such file or directory
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-service-use-the-abosolute-path.patch | 253 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_247.2.bb    |   5 +
>  2 files changed, 258 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch
> new file mode 100644
> index 0000000000..dc8e8b3052
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch
> @@ -0,0 +1,253 @@
> +From 98a60faaca7f1a6b753f73556705cc68aa19e383 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 7 Jan 2021 06:40:29 +0000
> +Subject: [PATCH] service: use the abosolute path
> +
> +Fixes:
> + # systemd-analyze --man=false verify /lib/systemd/system/systemd-kexec.service
> + systemd-kexec.service: Command systemctl is not executable: No such file or directory
> +
> +Upstream-Status: Inappropriate [OE specific]

At the very least you need to explain why this is OE specific and
doesn't affect upstream. I strongly suspect there is a different issue
at work here and it should be fixed differently.

Cheers,

Richard

