Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 620AB6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 20:08:14 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h6so129188749oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=N0PfvonQdomLlGat6F0LsY80TbBlap/XyV5shjzyHt4=;
	b=ILQG3JsF5WO/tOh1QxxJ4qmi+OpgTNQYVKyKXAd8M0j37qRYk0k0mk4p/Co11I8TGD
	zSqdfZ/EzdWpJVLyAqCRKinGGHjLHL8nPKt8YuUsKmCbfQRE/svCm/bQ9XCC6IRO5LWb
	Bu+8D3hUirjN7e/rpYadyy7MWMFY0GGgo9YdgdVFJC6Jml3VNeJFRozzMgXh8kPy6G4e
	2j6D8q9QtC7NdjhRdovgmhKNIF7TxN1htHJaZ2DvNRKKL4bLkPuTxGnVKlF00AXKASKp
	CeCfH4+xH9J00AfNMC4q5kY+FVRyTLjF8QRptnuXsEYOZpvMbK3NPRBx/qWQeoghDUPO
	mDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=N0PfvonQdomLlGat6F0LsY80TbBlap/XyV5shjzyHt4=;
	b=YPIwEp8PN8s7AbeC32Xuht498fHnQBWAx0YYcVRQWSVikg4tvbhgPAL4HxldjPmiYQ
	VoETDz9Tp86EKDycAVjATrP8M/dsjh37RBTITxFLuHTK29LK8jOgMLx9exv08KB8mYsa
	oM6cG1IKxIHwz6fUiYngzApWzl3gUAjIokKHeYP/IqVi9yNblUTPXWmLAFgDWNoTq6us
	d+enfrhMYCpLkiFP4MeuQHain1TZVpoZrUHhr9WYiQ7zaVyIYoFSpZFnQdxPYnKXX8fR
	TyHdwNLXhQGVBtauqYeMK7xXh5UqhApQYmb40jCKaDN6bAKgOfZTphfbBOrP2ypwCF1L
	gXTA==
X-Gm-Message-State: AD7BkJKesLC3Ir3PkOdgNdIz8p03qGxtQ9SLTrKjQYWLhXymbnMshgDpcCqJJMckODR98EVOkUJJFeZyBvf5Eg==
MIME-Version: 1.0
X-Received: by 10.202.229.134 with SMTP id c128mr12632888oih.115.1459195695517;
	Mon, 28 Mar 2016 13:08:15 -0700 (PDT)
Received: by 10.182.76.234 with HTTP; Mon, 28 Mar 2016 13:08:15 -0700 (PDT)
In-Reply-To: <CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
References: <56F952F7.2010409@gmail.com>
	<CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
Date: Mon, 28 Mar 2016 13:08:15 -0700
Message-ID: <CAOLEWZW+UtviSquWjDedaUHc9Epk+yzmuhT8Cehdnnq-U8sghg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 20:08:15 -0000
Content-Type: text/plain; charset=UTF-8

I hit the same thing and ended up using their prebuilt bootloader to
get it up for testing.  There is a big C++ ABI change with gcc 5.x
(I've been using 5.3.0 for a while now) and the gold linker is much
less tolerant of underlinking than bfd is.  That said, their u-boot is
funky but not actually that old, and they also have a blob 1st-stage
that is only provided as a binary.

Their wiki:

http://odroid.com/dokuwiki/doku.php?id=en:c2_building_u-boot

says to checkout branch odroidc2-v2015.01 but I didn't dig into the
commit history to see when they last pulled from upstream.  The error
I get with 5.3.0 looks like their u-boot/include/linux stuff is just
way too old for gcc5 (since they're still using a 3.10 kernel fork
probably).  Their build also blows up with gcc-4.8 - can you say
brittle-hard-dep on gcc 4.9?

Steve

On Mon, Mar 28, 2016 at 11:20 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello Armin,
>
> On Mon, Mar 28, 2016 at 12:51 PM, akuster808 <akuster808@gmail.com> wrote:
>> I have an arm64 odroid c2 board.  If I build u-boot with the current OE
>> 5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
>> 5.3 built kernel boots fine with a 4.9 built u-boot.
>>
>> The vendor supplied u-boot is hacked up and am leaning it that direction
>> as the culprit so I am looking for data points.
>>
>> Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
>> so, any special tweaks to get that combo to work?
>
> I am using one ARM 64 SoC with GCC 5.2 at this moment and it works
> fine. What U-Boot version is the fork based on?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

