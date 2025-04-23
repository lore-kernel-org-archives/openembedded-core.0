Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52C6C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:41:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.7461.1745412056863635677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sVhA1Zow;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b1095625dso7365889e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745412055; x=1746016855; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FKQvI63GNQkTeMnVCw3Z3rqE2M2+l3Q1Q7MlRVPDoDE=;
        b=sVhA1Zow1uWhUITWrotYsbH0GNND/0KgemG+GwJlKGJklWF2IKKQ+1dspPf1kEOTpO
         oNYbCzK6f+VvNFU4m3NOdKai45ENtdOaLzzO8wevqWpLe3hWPGEKzA6YavOH/gX02gcv
         peFIa3meiPke0CSZEzXxq0CUXj6lp6N6pQ/FOq0yyxb3RaNfFIqU70lej6XgfsRYDofR
         i6YYFa/3vADZZBnY6bGiEf2zvurQhAKT4uSYBUl8Dm8RJd15YUV3tksBxu+1lI8YJyuY
         JNOIgExxfQV3LL+XZsa+Gw4SbD8Srj72dcLArbPuxaoOFxTqcEGTaBd8fAKw/sPpSJzE
         C9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745412055; x=1746016855;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKQvI63GNQkTeMnVCw3Z3rqE2M2+l3Q1Q7MlRVPDoDE=;
        b=EpR6mHMyyZvAPmaS41LQwTbzk+0vUDMsSfdeVoXqN/ye/mtZj+eJ+a8ylFyzKiBnKz
         2o19iJt125GLRvWIsJkXv9Iz4jz3ZfvOD1KuWw8UrZM52jB7DHyGEkxf+HhrTLnEiBnI
         NVl8ElXRcwj5q5h4rlF4UBwx9mx/s4XHcf9m2EPQ0442nhDjpR2U4Pgb8N5j3AZi9zJ5
         3ggp27ZVaHIv28k2SwVk1Atuxd4a8vyBk84djdv6L7STJF7VpYMDajhGouseZo9LRWmm
         r9U+MWYHiJJokT+xPhf+Sdxl64Z1kuz+emGe9WwWFcIm3oGWl62g7Sp9YhjqcI1DnSE7
         CM+A==
X-Gm-Message-State: AOJu0Yy6XRYqL/FFfP7SNmSXNUTj1AkaRbm8cfVV2WosRtDTBohqb4h9
	ySwDWQ7y1LktAyoonRhalM3EmjtiZ1j9UGSBpnw0QBpt/8M+qvym7fqmtPiZpkW6UAO4ahfcdEj
	h9lQ=
X-Gm-Gg: ASbGncvOdH4t3o+DKOtSz8Bh8ZhJu1EkUgV2eGiloZj8gztKt1B8BRaje0ughHNBBgS
	iGcZAoYjW9rjfXWyCjdjhadqKoUU4PGTPf5k7+jm9kVotYkgn8cuVUulChseDYalht74HBRSZH0
	SyEBOwxdSnrESNNe++4G+ME+hWuP6KnIDjWVz4ztxwRKSCPd48yUugaIfNy824VAw/SKS3feJ8o
	eaJuDiq7yrVn/2ENRck202pQE+7buGYlfXBXlzaOk2RmRLY064gsH9KMQhFtMdYZF2CI8PeUTpp
	HSsDoCM0+nwtAzOyHu8sOyeMYsU8HYulWXFkL0Eh0PzAx9KE/xjAjqzTmA/Dmv5XUgRPps3QLPU
	uBKPnHscb
X-Google-Smtp-Source: AGHT+IE1gBDX1upyAalJ6FAhHLWqQujqdIhNX0FB/SaQdbXtDpDGYNZ0HYADGwCnImfWH68YB/JRjw==
X-Received: by 2002:a05:6512:10c4:b0:54b:117b:b54d with SMTP id 2adb3069b0e04-54d6e66d9e3mr5722013e87.56.1745412055035;
        Wed, 23 Apr 2025 05:40:55 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e5472sm1509075e87.192.2025.04.23.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 05:40:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:40:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org
Subject: Re: [poky] [PATCH 2/3] kernel-yocto.bbclass: support modular kernel
 configs
Message-ID: <aAjf1EfWpWQt_RZ2@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADkTA4OM83dmNKO-ocCRmoVzaMWCxvN0SYz7Yi3th58uPoSqHw@mail.gmail.com>
 <CADkTA4PjYn55Udo7KxJwQi_SK08r+a_6EwMyo=e1-Y1vDKtxYA@mail.gmail.com>
 <CADkTA4MUkWtgpj=FG2rGN+kHQqkGLWjLPMDiyBi3TUct+Th4EQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215289

Hi,

On Wed, Apr 23, 2025 at 08:30:50AM -0400, Bruce Ashfield wrote:
> I already have patches for this, and they have not been sent on purpose.
> 
> Please do not apply this patch, consider this a nack.

Ok, no worries.

If you have the draft patches somewhere I can try them out on genericarm64
builds and test on a few devices, if that helps.

genericarm64 core-image-initramfs-boot is exceeding size limits currently
so I wanted to publish what I had already:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15833

Cheers,

-Mikko

