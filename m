Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF554C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 07:50:40 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.49606.1704354632198027153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 23:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kz/HcA1w;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so234682e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704354630; x=1704959430; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnbqwQCzdKsQHVJr83zaSdEp/JxDtSHJuTSLkDKcrcs=;
        b=Kz/HcA1wP0pQDmx4k7vdl4Dg4VnvQ94i3YyOslVvARDon3gtqqyI2osK2WOZYK6MQe
         6TtOGgQrpnegAjml5QjmmN+mwKTrEZhVT2jTVbuGCRnO4ejo/NvBb4NAf1ToW11cgdVw
         JdSsldxAL+C2I060IpwD1CRjaIu6vOXM5tnHXxzjHMJqRBKnLtpZRaCgS2hvUt9QeRXw
         8PlHmFDRAO8HxlvU0AR8CysS5lv+yl+6RF03vpLGJcx+4b1R0zMcMYO8Lg/w1zw99Lhk
         uxg8etAyHs14BMYM9sO69mPFlJtC9GQTHiEv6xLkAVQC6z6uI5GzAhSb6LViEedmNVTf
         3UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704354630; x=1704959430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnbqwQCzdKsQHVJr83zaSdEp/JxDtSHJuTSLkDKcrcs=;
        b=iQRtiX7QX4sYeZNs1XSWN7HYTiZBIeEgw3kYmfc6TlOhtIZiHlVW/4JNHS7p2Rslb4
         jGOPrG19S4FVSWzc74AnS443mRcfU5eeDKQOI9ESE/gAU2p0vVeD4qVlSJ6BiFawXXI0
         TTxj2r2aMAZGyGkrAVKX26WYZgly5uP3wsqe8riC3ErlSvajSqTqNTDT3rIo5FLZW3mW
         mt8zWfdgTH/mvZV4wp2Bz3K1de0PvUzh4sZD0UFjRmCrDs0zmrnmrbDZ7bQc5mhB0/Ww
         WkSHXsYMnVfj2tGPUW6M8nRLXekc2XbswwRNBtp3LC+mbhPJcr+05GVMnXC9pF21fGLa
         jCYQ==
X-Gm-Message-State: AOJu0Yxy9qIXcotA2bor9D68nlZ2pfjgu/A5jknyrjJ8oj6eXO0WqM63
	B3LCSx9x5dxV2S6/Sh2dzSUKv+MCuEFnNw==
X-Google-Smtp-Source: AGHT+IHtkNSENsbZfhE6L6J8IZhyMFpYC8+iUGT8QUzIiLY/lcyDUsb/yMjgn1ku6UNUtW9lijMS2A==
X-Received: by 2002:a05:6512:44d:b0:50e:55fc:1e3f with SMTP id y13-20020a056512044d00b0050e55fc1e3fmr115167lfk.135.1704354629930;
        Wed, 03 Jan 2024 23:50:29 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651203d000b0050e3b654751sm4105859lfp.199.2024.01.03.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 23:50:29 -0800 (PST)
Date: Thu, 4 Jan 2024 09:50:27 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] runqemu: match .rootfs. in image names instead
 of -image-
Message-ID: <ZZZjQw77Qd1KSSUN@nuoska>
References: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
 <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
 <17A712B42F330FC5.10454@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17A712B42F330FC5.10454@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 07:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193305

Hi,

On Thu, Jan 04, 2024 at 08:59:03AM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Wed, Jan 03, 2024 at 03:54:02PM +0100, Martin Jansa wrote:
> > On Wed, Jan 3, 2024 at 11:16 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> > wrote:
> > 
> > > Don't expect image file names to include "-image-" but
> > > expect them to have the ".rootfs." postfix which is the
> > > default.
> > >
> > 
> > It's the current default, but whole runqemu won't work when someone changes:
> > 
> > meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=
> > ".rootfs"
> > 
> > So you should probably read IMAGE_NAME_SUFFIX variable first, but the most
> > likely change someone will have in local.conf would be to drop this suffix
> > and set this to empty and then the check for empty string in basename won't
> > be very useful as well.
> 
> So drop this file name check completely? Fine for me. I'll send an update.

As you said too, this doesn't work. runqemu has a bunch of heuristics to detect different
kinds of file arguments which break too easily. Test for .rootfs. in file name is IMO
better than than -image- in recipe/file name, but also not perfect. Using IMAGE_NAME_SUFFIX
would be nice but the indirection with qemuboot.conf makes this hard too, and if that variable
is set to empty then a lot of things break again on runqemu side heuristics, gah...

I have a dm-verity image recipe and a separate recipe which bakes that into a .wic image
file which I'd like to test with oeqa, testimage.bbclass and qemu.

It's either this patch or I rename all image recipes to have -image in their names.

Cheers,

-Mikko

