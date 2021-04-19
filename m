Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.245.1618846922194594932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 08:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M11WlE3j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id d200-20020a1c1dd10000b02901384767d4a5so2355073wmd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s1QMhcgWEKe30pMp08rH4fV/gCjgV5nbUe5Em3idRT4=;
        b=M11WlE3j7AG0E71a/e3AS2OurnzQi/EKPmE6uU9bBSgRIeV03esVCeYQfuj+LXN/++
         HIRjLMjbmNVuB95nzqSU8I5vEdQvnUCWooOiXzxmtohqHjLHccdvQ2FD3GuheNPHBLh2
         lkdW2Wc4eVk8IhntXeSbZ7f7d/z/Pcc+bfEQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s1QMhcgWEKe30pMp08rH4fV/gCjgV5nbUe5Em3idRT4=;
        b=HiteyNoE1rD2maVKPCkThIR139ZrTlDp6RHIb/GD2LXbVy/+I/Bu5npSOEhPFnX6IV
         QQirQDUNGBWFUX2zM8Gi98ZK2tiO66bQvsp27bYll01ZY8po5GsSCQG13wYxHyU3nq6R
         mUITGNquR9J9Oo9Jt/JRbvloe1KC1mgMQ6FX/xXfsk06Pz4Ttf52Vu3/3gMSyEAuLqYC
         Y+2GfNrsaDcCNZymkrs+gPY94KyDDtIml7cflow5Mp/phWZd0zKlMf1u1bTRMyZRjbQq
         Q8s3aYGd0G/kit/mAuksslYR+bCg5HK3kPNgJySb1GcPBcvtNYJENuqRkrCZkJrYcVsu
         Qbew==
X-Gm-Message-State: AOAM532qwK2Puw8MSpG30l/oWv+Y40kXTJnQ/pzyEhsIJO5Ly2MroWU9
	PSemeev+1JsvvyHeWHcLNUcgbA==
X-Google-Smtp-Source: ABdhPJxsfUpSuZs2vsFRMhT5pH1kBvUbr7/4ULicZbqBeN85YU39g5YrezocD9tTBwCMeBwaUD1UNw==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr21336858wmc.89.1618846920635;
        Mon, 19 Apr 2021 08:42:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4? ([2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4])
        by smtp.gmail.com with ESMTPSA id o62sm510664wmo.3.2021.04.19.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:42:00 -0700 (PDT)
Message-ID: <afa58f99fd353dfd133ccbee82522471a4f1960a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] default-distrovars.inc: add debuginfod to default DISTRO_FEATURES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Apr 2021 16:41:48 +0100
In-Reply-To: <20210419090044.582453-3-alex.kanavin@gmail.com>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
	 <20210419090044.582453-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-04-19 at 11:00 +0200, Alexander Kanavin wrote:
> Obtaining debug information by having it served automatically via http
> is far more pleasant than messing about with debugfs and gdbserver or
> transferring and installing -dbg packages by hand.
> 
> I believe we should follow the desktop distros and have it enabled
> out of the box. Please see the following commit for the description
> of how it works.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc  | 2 +-
>  meta/recipes-devtools/binutils/binutils_2.36.bb  | 2 +-
>  meta/recipes-devtools/elfutils/elfutils_0.183.bb | 2 +-
>  meta/recipes-devtools/gdb/gdb-common.inc         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

I agree we should do this, it did blow up in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3289/steps/11/logs/stdio

Hopefully an easy fix?

Cheers,

Richard

