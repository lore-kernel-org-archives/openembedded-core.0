Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DADC3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 13:47:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.50775.1746452867487669453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 06:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wrJYLklv;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso5773512e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746452866; x=1747057666; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfOQFaGddUsHWkqTesFbQr6oEXFGsCTh5G7ZkugK/us=;
        b=wrJYLklvdXFs+J+6s3ycg+zoEaBWobrDipna6w5k3TDl06TPp90RD7eBmsn05j+Dqu
         6xmHXLr1GYcD0FDZBiMEHG8tbOK60u57BuxEqTp15fCbVfroimgxIRoQlfpDX94buEQN
         EcIvopfK+iVKCnNAngXpsSPKzt3XMuPLg9N3Fr7cpinz7YbAVGJA2IQiJQhYJo/Mawsy
         DartlRsoBM4u2qzEn89GoL8ROQ6EJ//Av5Y15qd/3oQxnurLlXG2rrMGYE4raaQf5oYP
         tCZoJ7j1kaXnXzrSZyCFANnDGHuMV35I9JCuriYXwaB92DViYMgYd1H+sW0nscYaXhP+
         qo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746452866; x=1747057666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfOQFaGddUsHWkqTesFbQr6oEXFGsCTh5G7ZkugK/us=;
        b=UMY5e6z6PSfomgPnjYZrq8Ivro/UiveSdLqTGSaxfv5tb8naXQp3Q5/aq96kYzT3H1
         IbCM2RrKeaosirf/0I8fj1LyKWN4PvDse6xSnHhrdlGot2/TgH5kMwh6ESNF5gd9jSfp
         F7uvLoLOYKCFpPEYRhmA6VSelR3r87yKMCuUi+o1zPanqLKvdBJTxzbYUsaYax7hP7+O
         Blf1iaOD0eQXSvTkFktEvmNroHTIENjG5p5hq02Qy/O+vqJ4IsmfF1nDbqSrTYDVhmrp
         wyYHrLmc2HU8SzZpQqfvcHW+UwFxB66b8jcZMXQErKVic13k4896wKcBo7zcCe/tfI3h
         v4UQ==
X-Gm-Message-State: AOJu0YwDkWGpb3ZfMOqfTJWOm7Y6cStG8LSLh3RshnN9entPFsM97XC0
	86yX02AAiJ+EXP4EcNHp17UegA9vB+USmTHhi2U4cZojZBmSqCMTFqYuIdaxe7U=
X-Gm-Gg: ASbGncu0hiMQytmoRUbezLTz9ZMfKNw0XHYaJh8Z6LkgYJDAbPnpSvPlUwdnf0bv+zr
	hwrjUUV3/VI7zFj42LeIYNaywEpB6JWnx1OduJhrnl9z/yu2Vy5oDNTT27llVAvKL04/X1SNZtc
	XGT0A+Slx/ZVlv0N6+ci9j8jD+r9dnKRaKNOQS5jjqZ2Y3lIHEnBodDF7PXxENqwgZAmkfwdV+E
	G/NJavb5D50bWrQySySBC1us4TNPmjcIUGxGnoZ+Kq3bxER0W6tuAdesGxilANbJBhfU8f3jIrW
	kYwi+SPtvmTUUeZGGqvI3s5rekf9ymJJTqNhbE7EzOM4sxMDipUqABir0J0dc6H+O6kk3dpuMQ=
	=
X-Google-Smtp-Source: AGHT+IFlBowqctU+Jois4KwgTk1eA06z17N/6mTDFWkENySNYIoMsyM8XXEqMx075A8zb4/7ba3a6w==
X-Received: by 2002:a05:6512:398c:b0:549:8db6:b2d9 with SMTP id 2adb3069b0e04-54fa4d56278mr1665280e87.27.1746452865471;
        Mon, 05 May 2025 06:47:45 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f2059sm1707284e87.201.2025.05.05.06.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:47:45 -0700 (PDT)
Date: Mon, 5 May 2025 16:47:43 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: pseudo to ignore vim and less
 config files
Message-ID: <aBjBf2gcNp73567H@nuoska>
References: <20250505130830.995042-1-mikko.rapeli@linaro.org>
 <dddfbb46a17195fde3ff7cb5667c84a9b68235bc.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dddfbb46a17195fde3ff7cb5667c84a9b68235bc.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 13:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216013

Hi,

On Mon, May 05, 2025 at 02:29:57PM +0100, Richard Purdie wrote:
> On Mon, 2025-05-05 at 16:08 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > vim and less always write to these files in users home directory.
> > Using vim and less via pseudo in "bitbake -c devshell recipe" and
> > outside of pseudo triggers pseudo aborts which makes interactive
> > use of devshell difficult. Fixes vim and less crashes and related
> > pseudo log entries:
> > 
> > inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
> > inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.
> > 
> > Ignoring all files with ${HOME}/. in path fails since tools seem
> > to be using these paths, e.g. trusted-firmware-a from meta-arm.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/conf/bitbake.conf | 2 ++
> > �1 file changed, 2 insertions(+)
> > 
> > v3: back to .less and .vim paths due to failures from trusted-firmware-a in meta-arm,
> > ��� added comment
> 
> What paths are they using exactly? That sounds odd...

With ${HOME}/. in ignored paths, I have a lot of recipes now installing non-root
owned files and failing qa checks. Sadly this propagated to sstate cache.
List of affected meta-arm recipes from small firmware builds:

trusted-firmware-a
ts-sp-block-storage
ts-sp-attestation
ts-sp-crypto
ts-sp-smm-gateway
ts-sp-storage
ts-sp-its

I tried PSEUDO_VERBOSE flags to figure out what is going on but that did
not help. I can try again if you have some hints on how to debug this
but it's clear that very bad things(tm) happen if ${HOME}/. is in pseudo
ignored paths. And I really don't want to dive into various broken
tools/toolchains just because I want less and vim to not crash inside
devshell all the time. Common things behind these recipes are
makefiles, CMake, dtc and custom python scripts.

Cheers,

-Mikko

