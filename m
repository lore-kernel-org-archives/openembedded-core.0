Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6260.1615367478082239926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HZ1i+PgX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id n22so6594524wmc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cf1GyFlIwbib/1IFXhdxtN8jKOc2Og55+HHdbTT8Iy4=;
        b=HZ1i+PgXbHt+/uNx799gptf8Ota9A6kHLEe3ExhoWQLn6Cq6irEmWQgHR/p72YTSXw
         MiOnGddGh/QJplwS0J+ig8vWtlRxvfCkM26b2xFbm6qMVvb4Kvot1oRTr1/FosCyAijR
         Zi8AYaq5TB48nsfsV6KCVjbxmql1W3UC+GfIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cf1GyFlIwbib/1IFXhdxtN8jKOc2Og55+HHdbTT8Iy4=;
        b=lQ2S6xKvnlj6Juo6QpE6EY6G70pHcUAlUS1TUzLbXvrlOSPV7kmsub6kbt4dZ/B6DB
         2icZIctqob2NiJ5yYB8LyfMSMN2H8Yu0a454kz1vKwQllxo50iCqaSHLg/x7Fq9iXMzp
         pFrhdDebyV48Pl/tAUE9aQK6hsurybiycrnPxo1Yufel4KXAoVOnXLuAFThHcdWGHaVh
         J7kCoSDwzZ1zEjVPxpWf2DlTiGdWLMlFtyyA2QtWaSZjyChyWdZ5aZxhQ77PF0MG69wa
         KApWFl53Yb9NIi1Xlxn6/DyNPhzfdppGU/mqP9S2M7Mnpg7acDcuzW0FHYBhEz3EGyVA
         KsQA==
X-Gm-Message-State: AOAM532HgzE4pY7d8Y+vHPjeKlOMWqvG5RIExLoabX4VgI20jhnAyfQV
	snFFacyy0+mNeckc612DJWFz1A==
X-Google-Smtp-Source: ABdhPJz+tnKRwjMzaPMYV5fbQ6Opl0IQYoNQxjiHByTFu392j1Rxcnmg4LjJYvNvHmMjG6E14euQ7g==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2233978wmg.182.1615367476556;
        Wed, 10 Mar 2021 01:11:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b? ([2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b])
        by smtp.gmail.com with ESMTPSA id y1sm724019wmq.29.2021.03.10.01.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:11:16 -0800 (PST)
Message-ID: <54b1c0a1e772794a4f91b23d874e672a88854fd4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>,
 openembedded-core@lists.openembedded.org,  seebs@seebs.net,
 mghatle@gmail.com
Date: Wed, 10 Mar 2021 09:11:14 +0000
In-Reply-To: <13b1761a-205b-b17f-c3e9-5ddf44049267@windriver.com>
References: <20210305101040.822-1-Qi.Chen@windriver.com>
	 <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
	 <166A3C91F1FD80D0.3944@lists.openembedded.org>
	 <166A488578ED5898.3944@lists.openembedded.org>
	 <166AED6BFC056C10.17015@lists.openembedded.org>
	 <13b1761a-205b-b17f-c3e9-5ddf44049267@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-10 at 17:11 +0800, ChenQi wrote:
>  I think I've found the problem.
>  
>  """
>  commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292
>  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date:   Sat Nov 21 16:16:40 2020 +0000
>  
>      uninative: Don't use single sstate for pseudo-native
>      
>      pseudo-native is a bit special. It conditionally compiles in support for
>      xattr, statx and statvfs amongst other options. If a pseudo-native binary is
>      used on a system where these functions are present but it wasn't compiled in
>      we see hard to debug permissions problems.
>  [snip]    
>  """
>  
>  This commit effectively says that the pseudo-native's sstate cache should not be shared among hosts with
> different distros, as it's appending ${ORIGLSBSTRING} to SSTATE_PKGARCH for pseudo-native.
>  
>  I'm not familiar with the pseudo's codes. But I'm wondering if it's possible for pseudo to always build in
> attr support and behave differently on different hosts/filesystems.
>  
>   
>  
>  Just checked the pseudo recipe. It seems that attr is always enabled.
>  DEPENDS = "sqlite3 attr"
>  PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-epoll --enable-xattr"
>  
>  I think there should be no circumstances where the xattr support is not compiled in, yet the pseudo-native
> sstate cache is still reused. I'll send out a patch to revert the commit.

I was very reluctant to add that commit in the first place and from what 
I remember, it is a lot more tricky that just adding the right 
dependencies/configuration. I'd need to look at the code to remember
but there was code only being enabled on some distros and we'd have to
have it enabled in all cases even when headers and library functions
were not present.

Cheers,

Richard



