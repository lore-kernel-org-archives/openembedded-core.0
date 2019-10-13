Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 124277F54F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 09:09:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 5so14232944wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=JBCh6qERjLI09F2tTDVVlX5oRZdDSbUOFzZTcKrnWck=;
	b=YFhk/scGlQ7w/gG+66a3kEXaF30hEvdRvHYhIB1NCup0a2U9k8IvV9uJhMhedjewvy
	GXReLccnm5DRVVNEic6wxmLtitEnG4LTX1X0fORExHxrT+SJzGaaFt0dz1EFvCATvxE/
	y0NPFZr9d5FxY2uJ2hBaE/78XKIxsFNnUW05g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JBCh6qERjLI09F2tTDVVlX5oRZdDSbUOFzZTcKrnWck=;
	b=kS1OmJa3cBIxStOCu0OSTE231xWkdJwTO97D4qggx8mIRTy4GqT+G60VRsQnH+h7mn
	3HY4LKddVyBI/VV7KXjIfVT6ewVgVIk+bRFJwLkAEansm7XAl28fuIw3TZJ6zisGOQVm
	R0dMQ6cfFJt6gGxRk1ICTQZPEzkUHnHbAMEemcqULSwGmw5WK4ExHSN8hBTJAsvjlWyt
	VKBo30ITt5hmMOT0ApovuL+NNwd6QvpWQqYK8NFaug1z1FiLCD9PxiieRk3THrT109LC
	ifmlRT9/J8WcFUdE2lLRKeUCDjeAUwuclZ1tNS0ycA0jHmHzm7WluE7PalftTkb0j8K7
	hRTQ==
X-Gm-Message-State: APjAAAW5WTRRuyEJTaf8cIpExlh0SOIQ8mmUI7Wi8PBUqxmR4WOEQ/gO
	zLH48omzhZ2eHAEcWMbVemNqIQ==
X-Google-Smtp-Source: APXvYqxqsX0r93xldJ8lhyZQA340wSRG1xQlGLSDhGCJOqU7TO1mZqRqJiCH2qHA7cw6XkVtv5gfzw==
X-Received: by 2002:a1c:9a03:: with SMTP id c3mr10920871wme.109.1570957758801; 
	Sun, 13 Oct 2019 02:09:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p12sm4214443wrm.62.2019.10.13.02.09.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 02:09:18 -0700 (PDT)
Message-ID: <289f3daa445fa5ab9bda92f5760adf40c9f3ce14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2019 10:09:17 +0100
In-Reply-To: <20190929101526.2061-1-dbaryshkov@gmail.com>
References: <20190929101526.2061-1-dbaryshkov@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH 1/5] grub-efi: replace anonymous function with static configuration
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
X-List-Received-Date: Sun, 13 Oct 2019 09:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-09-29 at 13:15 +0300, dbaryshkov@gmail.com wrote:
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> 
> Replace anonymous function setting GRUB_* variables with static
> configuration, since grub-efi.bbclass will use fixed names for grub
> bootloader.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <
> dmitry_eremin-solenikov@mentor.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.04.bb | 40 ++++++++++++----------
> ----
>  1 file changed, 18 insertions(+), 22 deletions(-)

This series failed in testing. There were two selftest failures:

2019-10-12 16:27:33,173 - oe-selftest - INFO - RESULTS - efibootpartition.GenericEFITest.test_boot_efi: ERROR (2101.45s)
2019-10-12 16:27:33,173 - oe-selftest - INFO - RESULTS - distrodata.Distrodata.test_maintainers: FAILED (106.07s)

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/430
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/430
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/430
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/426

Also shim appears to have build issues during deployment:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1114
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/23

Cheers,

Richard



