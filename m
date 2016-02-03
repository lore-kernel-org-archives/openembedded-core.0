Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF9A276C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:58:55 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 9so70676113iom.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dUN2urmteNOR6y49Sp1zrTB9+NbsG20Ug9TfrxGCdW0=;
	b=Gdi5SRsS6KyKdBo4DSFS+O2L1ydCMSVE/F6dz3PetxTmhvtpaJ2281WRiJ/okAn02O
	QhjqXPcPzLoMFwSEoqGpgvASYfUkxN5y4YJDoUmLxZuvLqpfmZWkn+jLwUs+fotGLx3C
	cTwfdfxKwYB/QZV5QdXuJiOjPqQ8Y1lTdjR4SkdK13/iUzIt0lJ5oylDc3EGt3p7jsnr
	h/hWTjPppCVD1nhg1AG7ISSDb3y057fD3Rz8bziYlZzvqGlF9qWNj0aAuAfoNMF2JKNt
	/exVh0LErspBbliuLZedUD3doNVPYGxJ+e8AfdIoSBJGjF6tvhw8OKd6Qc1shqU0V15G
	nQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dUN2urmteNOR6y49Sp1zrTB9+NbsG20Ug9TfrxGCdW0=;
	b=OnpeOlVvXguWp8FyAa4rokdq9w/EkSOaC2nDyipacZG/TBrAwEgC9E820hz6XCJhS2
	Zt7KphkRfRFxQI6FKu7v/eeqvp88+1qa6mimZJks4qLiA8GNUwlXR5FTgl5dEAb7bnmM
	0YWTlPz2YJiGSTg/Av0D+KQyxV6RV+AeIt6sB+Ft+OVe586z6tlvHokgopys5W0UJePd
	MZmmpyxS5cst7yX0TVMyDxDG2pQBGZRuVHwf89y+h8J5h2jv17yAhLgh7ceBzeRzlQxO
	/DhrFa5tXiH4k9sRrOha/WnC9e0yOXnPVCN1am6xQbkGYol5m3uYopFzobDajJtr5KaI
	P7tw==
X-Gm-Message-State: AG10YOQOBuMmeK7420nl7jEMzLeRiysbs6e6QddPcnFBGO4eMcWlveM9mQ0w3qARHoaFghCYfXBRyMTFyfPxwg==
X-Received: by 10.107.9.211 with SMTP id 80mr5288532ioj.112.1454533136335;
	Wed, 03 Feb 2016 12:58:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 12:58:26 -0800 (PST)
In-Reply-To: <1454532171.7421.52.camel@pbcl.net>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
	<e45e550e5d1bdcd4011e9d92c77201596d52ea2b.1454303080.git.raj.khem@gmail.com>
	<1454532171.7421.52.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 12:58:26 -0800
Message-ID: <CAMKF1so4wbS=T6rF-uS5SmgSAA9_QmxtVLm97-mvTKb938p+Dg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] boost: Fix build on soft-float ABI arm systems
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
X-List-Received-Date: Wed, 03 Feb 2016 20:58:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 12:42 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2016-02-01 at 05:08 +0000, Khem Raj wrote:
>> +     BOOST_FPE_ALL       = MCW_EM,
>> +-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
>> ++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
>> ++    || defined(__ARM_PCS)
>> +     BOOST_FPE_ALL       = 1,
>
> This looks a bit bogus.  Whether or not a particular fesetenv() flag is
> available is, or should be, orthogonal to the question of whether you
> are using the soft-float or hard-float ABI.

it should be

  I think it might be true
> that some libraries don't implement fesetenv() when using softfp (i.e.
> no VFP instructions at all) but that is not necessarily the same thing
> as the soft float ABI.

does glibc implement it correctly using soft-fp ? my tests failed for
glibc thats why
I used the VFP detection logic

  What was the exact situation where you had a
> problem with this?

using musl.

>
> Anyway, if what you want to test is the availability of FE_DIVBYZERO,
> you can just use "#ifdef FE_DIVBYZERO" since FE_* are required to be
> macros.

I think that could be a better solution, atleast glibc can keep doing
whatever it was doing before.

