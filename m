Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05DCC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 07:27:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.16751.1705649228206531196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 23:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RC6c8DE2;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso498018e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 23:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705649226; x=1706254026; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbj4A33SkC0otA9KXqp6btycQ0YhJlviwUz/NeNtByg=;
        b=RC6c8DE2IGK9tWTfkkMf+mhWOgH7t+sNoWFb3u7veD8gofX6Wg0GSqglcBJtlp9xBS
         USzufzFGZsbjytykOLksc9w2CkdKUGGJn/WWPvv+qUbdduAUBVB+krn9Jx7yvVYvYl45
         GrTe8BV3QQSdlhWQy1gQnd5F7/fH+XsGlxu3nNeqfPrYe3HvG+hQPe83ph73UAXk3jki
         a9lKef/D+OPgrGNUanu9Mu7YaguDdwQtqX5UvxJ0qO8jUejZVfRGYgsAIgni1a1naygG
         o6PmSJAnUAXsNPeDVQuD2wWeInYu8nZLmiPDCMRlQRB5jx2FGznuLWKS0sEp8uT4iDX4
         38LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705649226; x=1706254026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbj4A33SkC0otA9KXqp6btycQ0YhJlviwUz/NeNtByg=;
        b=A5pAVIvbSrgwSyBeVsEaHot+mb8KyZrE4ijFA9nPKlf7XprNwxuQtuqMSs+lv8gv2g
         ddjQIjp5VvH1D+kg+GQu3SmDI7oCSKfuf9nvEvU/sQ4jtcnBHh2A0G4H68ApdzEv/YRl
         l5n8IZZXHLmHtEphYrydIGVWIwYrzTGilZshm2R6RFdaXJF7QgAkJ5E770VfV7mlMx7I
         wXZTXoPj8QHiEDLu0+ZdyKG3P22sYt5bYuqkZ1DTAQU32QbYy/rpiv5ltxEF7XQCcb/q
         0OW6oLl7YEQ/JDjvO5yHFXLwEq3VWbf8bod86klrxiqOSFRA9HU1aMWE7YtlM9MR8V8x
         dK+w==
X-Gm-Message-State: AOJu0YxnOITmL+ElrUTXol4pHdyfRO7fu4LC0QG5e6gA7MLnWLmrXj9L
	pNyIlMZKTikutRwMdlrop9IYr+t29mXefnK0gyz2LOpuJKL65fZlydFySG8RDzo=
X-Google-Smtp-Source: AGHT+IHCsM/fyvAcS/WuHAOt+XaZqip0J+A8ilT9JFqb9zic1ZV4rrPuJrUDKNzYkHmJUyZOWAp1yg==
X-Received: by 2002:a05:6512:3107:b0:50e:7b0b:4379 with SMTP id n7-20020a056512310700b0050e7b0b4379mr419282lfb.12.1705649226108;
        Thu, 18 Jan 2024 23:27:06 -0800 (PST)
Received: from nuoska (drtyq0yyyyyyyyyyyyf5t-3.rev.dnainternet.fi. [2001:14ba:7400:df00::133])
        by smtp.gmail.com with ESMTPSA id h13-20020a056512220d00b0050f0a6888f7sm886013lfu.142.2024.01.18.23.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 23:27:05 -0800 (PST)
Date: Fri, 19 Jan 2024 09:27:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa parselogs.py: load ignore files from
 sys.path
Message-ID: <ZaokR9vovtUH-0cO@nuoska>
References: <20240110130322.4078930-1-mikko.rapeli@linaro.org>
 <40B3B6D9-1EC6-4CD3-A42E-52E7F3A588D8@arm.com>
 <17A9026E670466F3.1780@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17A9026E670466F3.1780@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194016

Hi,

I think this patch should be applied as it aligns oeqa .py and .text file searches
across layers. Without this layers need to add "addpylib ${LAYERDIR}/lib oeqa"
in layer.conf which doesn't have any other uses and debugging this is really hard.

There may be addition things wrong in bitbake python environment when oeqa tests run
but this is already an improvement.

Ross, do you agree?

Cheers,

-Mikko

On Wed, Jan 10, 2024 at 04:23:22PM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Wed, Jan 10, 2024 at 02:01:36PM +0000, Ross Burton wrote:
> > On 10 Jan 2024, at 13:03, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > > python import.resources open_text() loads files from the module paths
> > > but this requires layers to set "addpylib ${LAYERDIR}/lib oeqa"
> > > which is not needed to find the plain .py test files to run the tests.
> > > Also an empty __init__.py file in a layer will break the resource file
> > > loading completely as only that path with __init__.py file will
> > > be used to search the resource files. Then open_text() is marked
> > > as deprecated from python 3.11 onwards
> > > https://docs.python.org/3/library/importlib.resources.html
> > 
> > Deprecated but replaceable with files(package).joinpath(resource).open() (which is all open_text does internally).
> 
> Yes, but that seems to break if __init__.py file is found from
> ${LAYERDIR}/lib/oeqa/runtime/cases.
> 
> > > So replace open_text() by iterating over sys.path to find the ignore
> > > files. This works since paths like ${LAYERDIR}/lib/oeqa/runtime/cases are
> > > already in sys.path. Add debug prints for found and not found files
> > > while at it.
> > 
> > I’m confused why lib/oeqa/runtime/cases is on sys.path directly, that sounds… unusual.  Do you have any idea where that comes from?  I’m guessing oeqa is throwing it on the path whilst searching for test cases, but that sounds like bad behaviour that should be removed to me.
> 
> No idea where this comes from, but it's there. addpylib is doing similar things,
> adding paths to sys.path and for this use case this not really necessary as
> ${LAYERDIR}/lib should not need to be, it only has oeqa directory. I presume
> test case loading via testimage.bbclass or OERuntim are adding it. These are kind
> of hard to debug since "bitbake -e" show any of this.
> 
> It's a bit odd that layer.conf would need "addpylib ${LAYERDIR}/lib oeqa" for loading
> .txt files but that's not needed for finding and using the oeqa .py test files.
> With this change addpylib magic is not needed, at least for finding these
> .txt files.
> 
> Cheers,
> 
> -Mikko

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193513): https://lists.openembedded.org/g/openembedded-core/message/193513
> Mute This Topic: https://lists.openembedded.org/mt/103639917/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


