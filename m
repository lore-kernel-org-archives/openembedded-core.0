Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AB3C4706F
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 06:59:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.49096.1704351548587239716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 22:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=A6m6JY2+;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so201538e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 22:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704351546; x=1704956346; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a+nKzoROV5VAB7N6rHPMldr2Z8A2IyLlZxrBq2M+uU=;
        b=A6m6JY2+/j7bXDCXV5iPlUq5wku8Fs3lDCiONAtdXoef/AP78kYQeGokxfhen8Sm40
         1Ey2/yOEz58oqAJubwCLIvj/fLsKNM+8N2r2UbmnL8Ymv1x+oUG8eU0E1jPP4ZC2QdlJ
         jU0uzP3aUDdR2cZgXXlbMm/ODBA/HgSOX6/dRZ1oXXDjppWodsRZhKJhCtG/1BEHuwxD
         MxSE20+y1EYQXjVoijJ8b0YBPCCBffSfrx8oZdTY2BWRf+I6x+gelmoPqDsAVqIFrE4B
         3qajYetu3YNCISwUQWr24dhUTH/uf2xz60i8MHcoMF1WHvdI9mzfoVFXOh5o8vYfG9RP
         qxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704351546; x=1704956346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a+nKzoROV5VAB7N6rHPMldr2Z8A2IyLlZxrBq2M+uU=;
        b=FNrdoLBkawHmy6nlAoMXlLVG6I9PpnAa/ZtU1nIZPjXGTwG/Jd4NlIYC+P1cMyvEL6
         b46/p9YueTUNHryxfmsM8QWScai6v1DRDajQul7NAwTjmbnIEOlaqZBldSHzDm/YBYAt
         2c/CwT/UxDrtg+XwhkUkQyU9Q9Lv7C7K74rHjsEXWJCB4xaRomAoZrGj1K8+4KLiif32
         hOkcBTcdUWSPsbELLS+KyBC3PjOa3pprySMj9KxUcUcpxGeRCdwpQQMd1Da1afHxCIqF
         0vB0z1ZWPb58SrtDgZq92swTzBDxlinODdOaYhWjL9t4uYlLJGx8bHlL8D6dudE0u3eK
         /cDg==
X-Gm-Message-State: AOJu0Yyg8yK86r47pXzv8NIwgewTjwBOEow0xAAT8bd3us21oxGTpJaT
	IIgrcyeZNQI3kMoL5QCmH1sdcOnRFL6pRA==
X-Google-Smtp-Source: AGHT+IENtPzpkMC0mQZmFcreQPNgIM3gTs5qgKbIuqQULg0ttYrEPNqpJPC/931oLIcJiTcgaoUllQ==
X-Received: by 2002:ac2:5e90:0:b0:50e:3e9e:4dc1 with SMTP id b16-20020ac25e90000000b0050e3e9e4dc1mr42042lfq.64.1704351546313;
        Wed, 03 Jan 2024 22:59:06 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id w20-20020ac254b4000000b0050e9e09fc59sm839570lfk.215.2024.01.03.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 22:59:05 -0800 (PST)
Date: Thu, 4 Jan 2024 08:59:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] runqemu: match .rootfs. in image names instead
 of -image-
Message-ID: <ZZZXN9gx2iLcDqdb@nuoska>
References: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
 <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 06:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193304

Hi,

On Wed, Jan 03, 2024 at 03:54:02PM +0100, Martin Jansa wrote:
> On Wed, Jan 3, 2024 at 11:16 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> 
> > Don't expect image file names to include "-image-" but
> > expect them to have the ".rootfs." postfix which is the
> > default.
> >
> 
> It's the current default, but whole runqemu won't work when someone changes:
> 
> meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=
> ".rootfs"
> 
> So you should probably read IMAGE_NAME_SUFFIX variable first, but the most
> likely change someone will have in local.conf would be to drop this suffix
> and set this to empty and then the check for empty string in basename won't
> be very useful as well.

So drop this file name check completely? Fine for me. I'll send an update.

Cheers,

-Mikko

