Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D150EC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 13:50:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8837.1743601813402839087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 06:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QdTQ/SMF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5808881f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743601811; x=1744206611; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NuwC9cuTO85Kzi6N4rWEeBgFfo2rFEVvqeVWshX/RA=;
        b=QdTQ/SMFhyLpEiiUbHuCmdCkvUtecBiX4jj0lpn2LpEOgADP7Huya4cYZJVxEZ7qX7
         3u9zRXFO+j3X6CGSI/5aj5nDtthobe6VO25bF2cP7pZBEZKEnDgdJcaB2L8qqis1dcsO
         7h3aidgD9P2pCQ3UY6SQFOt5F2G36/duPCL4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601811; x=1744206611;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8NuwC9cuTO85Kzi6N4rWEeBgFfo2rFEVvqeVWshX/RA=;
        b=CEFzZqhsVBtyNncxQBROXjkahM1W+OgsTuWZ+khL8REA666sE5nxa1AAX1DQOQsnQp
         AoXj6EqpwYb89ztAtUwxvb0n7leZ6051NmliFFrLVwIKccY/DZ42zjZEJKFWr6pJRhll
         s+wyPJ1Rk6wXd1rLsIFaYmTaAII4m2e6STB9tczW4VTqFP9YLBnRaPSL5SBu1R7Q6388
         snmIVLYa8ZnywMXKz/1sb+XNqVQd1bsMlGhwaZyNliFwvOy/V6lTHCP79QoGrs1EGkSp
         2dj4ul6fREaiijFiHn3G8IxXZxssWL41hZymxMhAKH5QOOmDxBhkpNHStZlVAnlxJ0eK
         YMOg==
X-Forwarded-Encrypted: i=1; AJvYcCXu+io10RAmbxYpu5E7CkgMmtLtNBuGx2DvMD4Y+fxEEJWM0TEa/GPgjYgz+tlyQgfX+2zo9GWkBj81KqsdKJ/0nQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrGVbKRiyjmnjLu05basHOdAA93uYcWfWDBOF+EHBiiNHJEi3t
	UucsJtaWXT6LYYlUSKQoRV/cRxBMQX7FFkrsYUgB67NEBgB5+KX1mxMHFSTvMdc=
X-Gm-Gg: ASbGnct+/hML2OYsmZCzVxkNG0FI8eCsS92C4gx89is6RNXqvswZgcjsf3KXVMYtnZ5
	YWbpTXH20jSuVVr/5X32IJk4mHzbXq+FyZb3uYx2C93F1Vb5xCv5fJpVgok/NoAprLBJQKUMXWy
	PO5jrLA3ho+XWfGCyTkUWamLasfxLV3wcQsPaaskEHR8MoXsx8Y/cY1zEdFD0MEV6N0ZoN/aitU
	7OLNX7epe2/fyBaLi2xY8RY+Nd7Up+xG+RXh0jQrgR1gB2gySVhIPUKKMA7uxi4Kp8GuwD3SEh3
	gnUzb8FLGLFJy4HkLpbqd54L0soDdujcL6CiZLOt6Gqu7t9uawBIOiM2+xaT10GXBwA+rya7fmy
	2YLXypf82FcsaV0lu3dIAOGeEHp2bVfQ2gA==
X-Google-Smtp-Source: AGHT+IEOJP3FTwPvZZvidXOWwZvT8CQulD8inZNeB6GjnamQYvnEhx/DJZrIeyiE2jIhgEdijCefUA==
X-Received: by 2002:a05:6000:250f:b0:39c:1f10:c74c with SMTP id ffacd0b85a97d-39c1f10c777mr8398431f8f.35.1743601811634;
        Wed, 02 Apr 2025 06:50:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6110989sm21495965e9.31.2025.04.02.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:50:10 -0700 (PDT)
Message-ID: <feccdd0374ece867891c299d861a3db219be8896.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 45/48] shaderc: upgrade 2024.3 -> 2025.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 14:50:10 +0100
In-Reply-To: <D8W75RR7HN8B.LDDI93NM4URS@bootlin.com>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
	 <20250402071017.2157620-45-richard.purdie@linuxfoundation.org>
	 <D8W75RR7HN8B.LDDI93NM4URS@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 13:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214265

On Wed, 2025-04-02 at 15:45 +0200, Mathieu Dubois-Briand wrote:
> On Wed Apr 2, 2025 at 9:10 AM CEST, Richard Purdie via
> lists.openembedded.org wrote:
> > Add tag to SRC_URI to verify SRCREV.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
>=20
> Hi Richard,
>=20
> It looks like we have a revision error:
>=20
> ERROR: shaderc-native-2025.1-r0 do_unpack: Bitbake Fetcher Error:
> FetchError("The revision the git tag 'v2025.1' resolved to didn't
> match the SRCREV in use (0968768c61d4eb7dd861114412e904bb3d59b7b6 vs
> 7f68b1cf6f35f518febf36d425365bb8e6ad224a)",
> 'git://github.com/google/shaderc.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv
> 2025.1')
>=20
> Appears in a lot of builders:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1322
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1360
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1321
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1336
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1298
> ...

You need a bitbake change for this. I have it in my branch and I was
testing it after finding this issue. I'll get it posted as it seems to
work.

Cheers,

Richard

