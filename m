Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7013.1615371660602481670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 02:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YCZV2qdh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id f12so22674582wrx.8
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9sBNhflv1EVQ82JRRxDS/h6LqSMDEE49XXzpCAnRHOM=;
        b=YCZV2qdheP8y52L/LUJUeuFrsbL5fu7JV2f1dDKMCB10muhKxIb0Y5Kes7JamQOf19
         ful7G14BF0F7y9pC/eKsOoF6VgpoxTyUhvAVF69qjQX7f9kGkzrCDLXuub6xiu0ZID06
         PZ78EOXmiX11FxygAfAmLwC1ynSODztYyz5ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9sBNhflv1EVQ82JRRxDS/h6LqSMDEE49XXzpCAnRHOM=;
        b=cDvw32WjHuuTaeg0KIyQtHEeti3hdU+KRxRSxuJu8vYqWkwFW2zufJGfEdbyuxF4wJ
         z3QRwOP/1adHddHzWOlBzYtH+hKkHgPYanLzm1ZDyRH88bEbzHv7YIrTjf0GNcyFyNr0
         CKUTKZCgBfJrkkEoBLtRnMKUhGtoxBoW7QhJA5nG/t6RhALf1aKCxxJ+JHdFDHI/ss/4
         a5UWRFfP+jzCmTATE/v9Ssy1P1ZFlD/ZYgXPgjHk+h76oXdp7nQZTan/vOu3dsMGZqCp
         VYAxoOKSG8UwoDDz2lg3atB3cxplt0Quhpx/uZ5QMdKW+kv1yUSoCGma59dqoCmPMGhJ
         D/ow==
X-Gm-Message-State: AOAM531SUQT0Y82y5caSMacfndRgNvb2zfithhPp0QmoH+2NVVsA/t1t
	sSWxjBoAuRDXNqOHDT0A5U5mhg==
X-Google-Smtp-Source: ABdhPJzY06Wo/kKkVfTZ+h8tDVj33hDw2S58C9dGoPnNNMEDLS7e/KS2xMChCnGsfoiLLKmgoXYQLw==
X-Received: by 2002:adf:c40b:: with SMTP id v11mr2671790wrf.320.1615371658817;
        Wed, 10 Mar 2021 02:20:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b? ([2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b])
        by smtp.gmail.com with ESMTPSA id m9sm28491813wro.52.2021.03.10.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:20:58 -0800 (PST)
Message-ID: <a2679c8472231f12d2b22d5f4db5a99eb10bfe75.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Revert "uninative: Don't use single sstate for pseudo-native"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 10 Mar 2021 10:20:55 +0000
In-Reply-To: <20210310090638.14640-1-Qi.Chen@windriver.com>
References: <20210310090638.14640-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-10 at 17:06 +0800, Chen Qi wrote:
> This reverts commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292.
> 
> The above commit causes a regression, making eSDK not able to be
> installed on a different host. For example, build eSDK on ubuntu18
> and install the eSDK on ubunt20, then we'll get an error at installation
> time. This is because the pseudo-native's sstate cache could not be shared
> among different distros.
> 
> In addition, according to the pseudo recipe, pseudo-native always has attr
> support compiled in. And if people change the PSEUDO_EXTRA_OPTS, the signature
> should also change.

The issue is the code in ports/linux/subports, I had evidence that those
values differ depending upon which OS pseudo-native was built upon.

We'd need to be able to show that those values don't differ in order
to be able to revert this change.

Ensuring struct statx x is available for example was a harder problem.
I didn't really want to hardcode chunks of libc into pseudo.

Cheers,

Richard

