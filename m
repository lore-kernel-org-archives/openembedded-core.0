Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C65C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 14:10:17 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.13769.1708524615287354397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 06:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V2hFtyc/;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so850165e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708524613; x=1709129413; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNuYO+6tI2VXBbOK1C61K5bihrEyAdWWZbi83FOdhDI=;
        b=V2hFtyc/2MMj4fSwxksIrnFz+26fbbQzg55yhuoIeUADvYLrnCuyo7tYQRPuULzGWz
         cAmLLR8znZ59tK51m58XeoCyiq0AI/b1PtRpON9tBvKlA/XmAo56AXNyWpULimOkkJsE
         LsjgISQRKm1ItZCWbXlgU1zo6IUe2Loux3C0zfZbFk7Z/L5scOBLjzctQdHKhxkjNnMe
         6pluoWUsc+ail4k//hZ607pi7rBgX5wsrxwChPoSLeb4iNJPyT50FGFz11o9O6XtVnIO
         Ko7K12A3q1g8wapBv6YoDlScZ9QB8vkdDFfueuDaNIQzIscvXdmz19dkLtxlZ79Wn+L+
         RscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708524613; x=1709129413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNuYO+6tI2VXBbOK1C61K5bihrEyAdWWZbi83FOdhDI=;
        b=V9I20R4zGhVNXVjCLxW/yTqKqUzQxqlopLGViEwUx2uDTonzFecJIdiS0iLAHETudS
         Lq8IU2kXk+fZR5TEDx9tjuuWFUh0aoMYgZUx3ray1HtWwXGVibEpI+Mh16XKKVZjPxlx
         108R7XYa61pdfdpZV5YwXfF7BsVFVBe+391kh3PfwDDOxAItfLcflhWszHhFA9lPcI5K
         nLOP11R8Bf1vgX4vN3BoQzvqQt16mdJtOUavF9Py1Q1D8tKW6NzBQBG0b0X1zh9n5JBs
         YaeXSmP871JojR61DUoggHPl1ebIzbqCbPsWCZpmVXGkKmLnVvSFgIouqTIoG65QVA5X
         oKNA==
X-Forwarded-Encrypted: i=1; AJvYcCWwDynL79ZBwJO0BmaFukZoUtdahfe6ykCvB6dFKATUvigJlEnvwkuf5FXsVEZC13bJwwUqMNyYKniXeTilIUG2rwZOULrK9/HAOgMe4J5wU+ji+jc8yHjy
X-Gm-Message-State: AOJu0YxtFiqQQB0efemhqOLi/l/HbtSLTWEarqWpEeuB6nnzgE0A03nV
	Ls92geeXoBgzaHIjZHtUTQipxqBhBye1SrmsHW/IOre0rfONV3ZAhdW1ZFrIEnY=
X-Google-Smtp-Source: AGHT+IGBdGbTJFbmDXqkQXOM00rDqPVM+AOj+lEtfuPikFJpxs4tzIRy4YmFwqDf1xtsejan1ePUyg==
X-Received: by 2002:a19:7605:0:b0:512:b04e:fb52 with SMTP id c5-20020a197605000000b00512b04efb52mr5879424lff.4.1708524613288;
        Wed, 21 Feb 2024 06:10:13 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id i30-20020a0565123e1e00b00511986bd9fesm1675137lfv.280.2024.02.21.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 06:10:12 -0800 (PST)
Date: Wed, 21 Feb 2024 16:10:10 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>, poky@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE
 using upstream defconfig
Message-ID: <ZdYEQreQHV4RMjiE@nuoska>
References: <20240221105723.1501833-1-ross.burton@arm.com>
 <ee6a686362c533dc70c442b64c96ca23b8bde45c.camel@linuxfoundation.org>
 <17B5E38E239794A0.12054@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17B5E38E239794A0.12054@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 14:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195974

Hi,

On Wed, Feb 21, 2024 at 03:23:48PM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> FWIW, we have been using upstream kernel.org aarch64 defconfig plus
> few board specific fragments and few extra features for our testing needs.
> I have been very happy that several major kernel version updates have already
> been done this way and zero adaptations needed on our side for the
> ARM SystemReady boards and firmware which we support. A simple CI run to show
> passing test results was sufficient for a poky update with new kernel
> major version.
> 
> The implementation here looks pretty much like ours. Looks good, thanks Ross!
>
> More details of our setup:
> 
> https://gitlab.com/Linaro/trustedsubstrate/meta-ledge-secure/-/blob/main/meta-ledge-secure/recipes-kernel/linux/linux-ledge-common.inc?ref_type=heads
> https://gitlab.com/Linaro/trustedsubstrate/meta-ledge-secure/-/tree/main/meta-ledge-secure/recipes-kernel/linux/ledgearm64-kmeta?ref_type=heads
> https://trs.readthedocs.io/en/latest/

Our machine is based on poky qemuarm64 machine and thus uses KBRANCH:qemuarm64 so
I don't see a need for new branch from linux-yocto recipe maintainer.
https://git.yoctoproject.org/linux-yocto/log/?h=v6.5/standard/qemuarm64

But maybe I don't see the full picture.

Cheers,

-Mikko

