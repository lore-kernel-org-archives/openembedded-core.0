Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id CC38B6E760
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:58:49 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id i50so25263970qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=IAqbMSyauzfaHTNKVSiPugB6yS0BQKq22AQdlW2l/h0=;
	b=QDD/DZYsgmOK+FAlnfjFbN49ExCJP11R/ZcmlA1MCn0Z5TmrvhODz9Inb6jo0W8GjC
	08+9/5PNw0ZkVMWiAZdyvwVLDg/GYIgcv6521WZXNI52TrM+VCYnGi0JrtrIwvEjL6i4
	c0wnl96N91fG5hWwOp4g7fDx4lFHxEl0v8JlGoSYE9Wxj26vS0fRjHZVGBM6DMGOxFXW
	ZdhojwpR1iG/hNdzghp9cyHxaMzdAhlFL9kkSvFV2/lGsCJpEHpJpY+jbi7eG8PoYUGD
	VXPTK3di1IUtgODkKxp516RkL+Dup0HKtQY0xDNPRdnYFSrU5I5YwmCXY6EyGCUsvDEu
	LVSg==
X-Gm-Message-State: ALoCoQkPt602POJrWnpq4GTlJZDM5dHkZWPCSpt8hPUxWQ7KB/NS8a7nNmaRPbIxUhdfmVIsYPmi
X-Received: by 10.224.127.129 with SMTP id g1mr56144779qas.22.1394639930290;
	Wed, 12 Mar 2014 08:58:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 08:58:30 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 15:58:30 +0000
Message-ID: <CAJTo0LZeuTEU4My3N=Ux6QR2eU09ct-Kah_XbJrPYrHBx3aOCw@mail.gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Wed, 12 Mar 2014 15:58:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 March 2014 15:30, Mats K=C3=A4rrman <Mats.Karrman@tritech.se> wrote:
> Does anyone know if this is a known "feature" of eglibc or know any other=
 reason
> for this difference?

I expect the standard response from upstream here would be that
floating point mathematics isn't exact and if you want exact answers
then you should use a different representation. The differences start
at the first sqrt():

Test 1 and 2:
sqrt(2.00000000000000000000) =3D 1.41421356237309514547
Test 3:
sqrt(2.00000000000000000000) =3D 1.41421356237309492343
Test using bc and scale=3D30 (bc is fixed-point not floating-point):
sqrt(2.00000000000000000000) =3D 1.414213562373095048801688724209

The output from bc is a truncation of the "real" value of sqrt(2)
whereas both values from C's sqrt() function using floats are
approximations, both equally close.  Why does your test case expect
the answer to be 2.0?  That's a massive assumption to make, floats can
trivially lose accuracy rapidly as
http://en.wikipedia.org/wiki/Floating_point#Accuracy_problems
explains.

Ross

