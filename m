Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6F2C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 09:38:41 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.50665.1704361110814882935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 01:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mlAy52LW;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so312949e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 01:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704361109; x=1704965909; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOSYagDvgXnAy0HO6jKAcMCseDeJGe3QXaqjPgmhSNE=;
        b=mlAy52LWwV0DwJ+EQwAniikeefWY9OLr/wtO8uogGaPHdwAP9F5E+0gXfIHG2MlT/l
         L3cT1yaN66lX5jYP+X7AK1p8rBR1oSrkdaMT/tW4sstakvl4p+vpCMPH4NC5Cia1SsSb
         DIL6mBUxqd5h5cvySibWiZ3Hnyw4cHhDI2ChNZOambEBOOnD/LN7KP+sm/7UzaUv7zKB
         1IGosfTY3adFqsbd+Ir1F5lTIHm3snVTvzV75sWMVyC1eeqSRHLTovrRdju4PP1ZTL6T
         u1MRg+koafcxk5ph+AkrIHYbaeI8HM4zMlS9FXb4p7aUhwSkr/xyJ8gV68oNskft+bXq
         gNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704361109; x=1704965909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOSYagDvgXnAy0HO6jKAcMCseDeJGe3QXaqjPgmhSNE=;
        b=aBX44KSAyHi3dbsLTUKeZoe6b28d4VZBn9sNE76iXQY/f3d2ZRKvManYFuGqpthgbD
         F/lsT3B5vCsAUtk5jQoPB7M7VSH+EA3xPuftnShzXxuKWLE7gDqUtAvbX7L6eVuIoxvx
         SeAFIqOHCctBU21Llf+bbicGA2x5A4bgmATmfl4SWNaGD3kHuBeG51q2GbpetXdw1kKL
         9dTIlT+MBT7TbBthpr/QYsJoEYvbAdGwkIeS/fzI/ce9TS80fw3OgYSD1LmF0mEUgu01
         4A3y1HPPsBPik1pPTn8BR74as8oJbhd7Krz7B4kdl9bg+EHUnZ9MVVuEXIgDx0wJJ/a3
         qc7Q==
X-Gm-Message-State: AOJu0YygHFlnkDk5gHf8aM0C/jZQlFnw4QwF82XJsOhZayFbG4+2cpH2
	RZ2hoyqBncLr96vpJ8WLCMhVo6YFc2+RaA==
X-Google-Smtp-Source: AGHT+IHbQvhplV/0tWQgPj9B7tFwRQ2PAOjD6YzdxjkiuJi++IZpyLwRywAuVkEyflXOoxz0UuEh5g==
X-Received: by 2002:ac2:4214:0:b0:50e:cf8:b15c with SMTP id y20-20020ac24214000000b0050e0cf8b15cmr166590lfh.108.1704361108920;
        Thu, 04 Jan 2024 01:38:28 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id i19-20020a056512007300b0050e7396df56sm3529576lfo.189.2024.01.04.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 01:38:28 -0800 (PST)
Date: Thu, 4 Jan 2024 11:38:26 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] runqemu: match .rootfs. in image names instead
 of -image-
Message-ID: <ZZZ8ksyNjltJuKpN@nuoska>
References: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
 <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
 <17A712B42F330FC5.10454@lists.openembedded.org>
 <ZZZjQw77Qd1KSSUN@nuoska>
 <65e32ccde52a50ae80b01b524a28909b59e2ea1a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65e32ccde52a50ae80b01b524a28909b59e2ea1a.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 09:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193308

Hi,

On Thu, Jan 04, 2024 at 08:34:03AM +0000, Richard Purdie wrote:
> On Thu, 2024-01-04 at 09:50 +0200, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Jan 04, 2024 at 08:59:03AM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > > Hi,
> > > 
> > > On Wed, Jan 03, 2024 at 03:54:02PM +0100, Martin Jansa wrote:
> > > > On Wed, Jan 3, 2024 at 11:16 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > wrote:
> > > > 
> > > > > Don't expect image file names to include "-image-" but
> > > > > expect them to have the ".rootfs." postfix which is the
> > > > > default.
> > > > > 
> > > > 
> > > > It's the current default, but whole runqemu won't work when someone changes:
> > > > 
> > > > meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=
> > > > ".rootfs"
> > > > 
> > > > So you should probably read IMAGE_NAME_SUFFIX variable first, but the most
> > > > likely change someone will have in local.conf would be to drop this suffix
> > > > and set this to empty and then the check for empty string in basename won't
> > > > be very useful as well.
> > > 
> > > So drop this file name check completely? Fine for me. I'll send an update.
> > 
> > As you said too, this doesn't work. runqemu has a bunch of heuristics to detect different
> > kinds of file arguments which break too easily. Test for .rootfs. in file name is IMO
> > better than than -image- in recipe/file name, but also not perfect. Using IMAGE_NAME_SUFFIX
> > would be nice but the indirection with qemuboot.conf makes this hard too, and if that variable
> > is set to empty then a lot of things break again on runqemu side heuristics, gah...
> > 
> > I have a dm-verity image recipe and a separate recipe which bakes that into a .wic image
> > file which I'd like to test with oeqa, testimage.bbclass and qemu.
> > 
> > It's either this patch or I rename all image recipes to have -image in their names.
> 
> You could change the check to check for -image- or .rootfs. ? 
> 
> Not perfect either but might be good enough...

Good idea, I'll do that.

Cheers,

-Mikko

