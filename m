Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B48BA7CF90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 15:13:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l11so4254902pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=02oa5yYsxAywtf1/cwwOsgUwBAmsOpt9SlSvMX2SgAM=;
	b=DPKihtbUyaE9I4llfsu33DJf1DVzdOWZr2EDsahbD6oE6QEQKTebLYcHAixwALOi7v
	j8MEd5g3L+1Y2IgI0Wthal6zD7Cxh580mT/uEd6dUgGpxmw3D4ZMMG3TWKSJTU/js9UW
	NTAjCaI7lDUI0oN2lvgXCv7k0+t+EqbONeRDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=02oa5yYsxAywtf1/cwwOsgUwBAmsOpt9SlSvMX2SgAM=;
	b=tfZspXCgL/e73uGgitV23vHIRqAc+UPZxmt882kdFyO9PFmQOgN6LcE4WR0oOFoOhT
	OrI0/DNXsatsuM19aKzREp43VsSwwchIWPY3oxAs+Vlwi+gowrFrFCwKbwGh7LCEABRk
	Yi0s2TlH0rtwyuZLEe7HY/NK52hgqRm6iN12XJJLx67Van/Tme6H+r3l3FVKZQn+vW1I
	pdWpY4RpwyKBXStiE0glMBY/7opPrgDFNVDbC5eSH4FCJ0seXAoalBPSu8bdeSSpP3eP
	6DG3sx11QEpFG0Ts/CazgckhWXNIb4/cS0m/y722CTTgFmwkUSSjw+olFhtr/buknJpg
	eWwQ==
X-Gm-Message-State: APjAAAVcwbE/VnmnTgebDjPpmNw5QinDB2UfBmMlERwd19ZlRtjkcb2i
	aOsZ7uCTz3Rlh+ix5o+2ZJVtjQ==
X-Google-Smtp-Source: APXvYqzoaQqcezZIdBpLPeHUTmA3uuMbu+Sz0aLXwH3eH/ilygew1KzsWIoihlOZIfOz3aU2WUXwpQ==
X-Received: by 2002:aa7:885a:: with SMTP id k26mr33518788pfo.70.1552317203504; 
	Mon, 11 Mar 2019 08:13:23 -0700 (PDT)
Received: from hex ([12.27.65.221]) by smtp.gmail.com with ESMTPSA id
	o7sm21985047pfi.105.2019.03.11.08.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Mar 2019 08:13:22 -0700 (PDT)
Message-ID: <3303e413e766655231584cffd06b018f63bf4e93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Date: Mon, 11 Mar 2019 08:13:21 -0700
In-Reply-To: <20190311150926.GY5026@bill-the-cat>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311150926.GY5026@bill-the-cat>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2019 15:13:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-11 at 11:09 -0400, Tom Rini wrote:
> On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> 
> > From: Jon Mason <jdmason@kudzu.us>
> > 
> > Add new QEMU BSP for a Arm Cortex-A15 system and use this as
> > qemuarm,
> > moving the old armv5te Versatile PB based machine to qemuarmv5.
> > 
> > The new machine uses the QEMU virt machine type, which should be
> > faster to emulate and updates the qemuarm support to a modern
> > architecture.
> > 
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Should we also not set UBOOT_MACHINE here to qemu_arm_defconfig for
> the new machine?  We dropped versatilepb support back in 2015
> however.
> Thanks!

For which machine, the new qemuarm or the qemuarmv5? I'm guessing you
mean the latter?

We perhaps could/should but it isn't set now so I'd suggest it be done
in a separate patch.

I would like to see u-boot being used in more builds but if we don't
actually test/use the binary, its not so useful and that would mean
further changes?

Cheers,

Richard



