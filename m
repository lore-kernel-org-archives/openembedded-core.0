Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB43C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:52:19 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13454.1788357129830515191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Jt9uqN/M;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1969308a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788357128; x=1788961928; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQ8BgaELULX3QcgYZBPUgMu7HK4/AdZMwRSx6cyInuU=;
        b=Jt9uqN/MJbJT3D865A/vL4xHlVFjAgxdLZYjB7z2sA6ACZ2GPu4394b2QglaGtRoYi
         vXwjHVxJv3o5ugahGX8Jn0B8HS+oBmcpJfiou2nT4l5RerdXSZN6uiZbBJi+43ze+qHr
         7rNHyed5S5EDNu3OmwYr8MYip+LyFCobwdiuA49D8QfTeQEsMXIlpdA4t2I7IR85rgEc
         /NKAWINnsFaP41J48zpXCM3ClTEr4yWvnKkMt2KxKOVxTd2r+iakZJ1Fgl8r+YFb3xX4
         hmqkflBSDcFG39lSUFuQqLKWotuOYgUdntKScLN5pMWFiqWnyXseZWQYyTWfOPBis0n7
         ztKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357128; x=1788961928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQ8BgaELULX3QcgYZBPUgMu7HK4/AdZMwRSx6cyInuU=;
        b=bJ1OQ2Z90W9kjZIxzY/m0FC4ZOSfQQC/tvkwmaEyzsuBhThOCfpGkdAKbNdpEGkh8V
         8SyL+GqI3/PVT9d+FexTNdvK8z6RxMCYv9/MlYL/bs4j41OLE5Z7ostslwWqzu804BY3
         +GtWXyulwod+HyfgWswQmgGOlvCi3k0zhARIEOUB7hUNcPYNuorhLOtv24Mdc4JQzw3x
         QT0At8UElXyx6r2CMrzir8+8ozJDvp7/2aXn8PT0WOr5SCAR2hluoT7+RKs+vZPAtJsI
         btz8DwDaicjfq1piUYFKdaK4F+t6ruyLojDmNRONv4v9UQYT6nDFh9a5S/EjrYCypvMB
         DczA==
X-Forwarded-Encrypted: i=1; AKwUvBzalwlyp0JT0j5sQKc3dXGfY8+dauMS1WY0ijqs70v/iejIDEweHL5pS7wTga2sOLheMIG2i6IJNXUxE9FAUrBb+w==@lists.openembedded.org
X-Gm-Message-State: AFuF++lGfvBb+o8qOPfpOSXG+6EDTz1sAc48yxEyxiN8Nj6vSK3JcudG
	s/oqOayWVoCUIFUNteSQFrQKtPArzfWcba0H2LZG9mZKduZmSmFuwXZrGFnANOcFVQQ=
X-Gm-Gg: AYBFou3y2OnLReDVZjbX8tTQEKg3oDFRu0+M7qzub4a73IY8H/sr/7w7wr6j/1a2qNf
	ofSCHRYf589Ul7HNRG32DJ8OwD/qfrjzs3pVzLY7g5ccGxH8qmaC9/d5rWYPU6rP8kSYUSQqMWx
	cvTcinFLCYkjX46cswupjYE30mxbGFJMb3c61ok0gZU0/rpnp2Re3LnYSfMqGq+MagS3qRyWJQr
	ZRiw5cp2hles3eMq+uefJM6umXhT+7uQX++4SQIlsEiYp2jWmK3TJiLya6stZq26xp8+SQmsPuo
	MCdlgJ4D+/wk+hmvsK0PcLfxXqTGf/1isIyh8dF0fL4bzz2XmxNSjj4nVJcOEZEbpg/Mev0ZcT/
	olQbyx1oSvGg7dbaei9ZkztRgS4VCTtRW9VrpwDiO0MQd607AqbpZ82KGA2pIoCCUho3U2Bxw6+
	kupIeRpD3obE+n5Vo1M/1WV+0wpKHvyBJOHdhdkk8DBiupVNDOaT+RDH6YbqdjvRLRDgwdIKsvf
	sOZXGlrIyo+SlE=
X-Received: by 2002:a17:907:7203:b0:c25:254:292e with SMTP id a640c23a62f3a-c25d4c9f1a7mr267411466b.0.1788357128013;
        Wed, 02 Sep 2026 06:52:08 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03f4d39sm136563766b.47.2026.09.02.06.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:52:07 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:52:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7 v2] linux-yocto: consolidated pull request
Message-ID: <apgqAmouWiLgb40y@nuoska>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244963

Hi,

On Wed, Sep 02, 2026 at 09:22:57AM -0400, Bruce Ashfield via lists.openembedded.org wrote:
> meta-yocto (1):
>   linux-yocto/6.18: update to v6.18.48

Is the meta-yocto side update to v7.2 maybe missing from the series,
e.g. genericarm64?

Cheers,

-Mikko

