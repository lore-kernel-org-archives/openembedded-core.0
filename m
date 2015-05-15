Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id ED73F60138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:25:46 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so42863056igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6Gg9Ptoei3iC7klf4MyNExMWMIiZIdfHlYnCC5ZHBJs=;
	b=G5q01ZYp6cqYDtFGzEPkdLgLpWpD6MCTSKpeCstLaC8RE5N3yhDEacCzkC3wDGby3J
	pSXt4IEV1XgZCrlLaYwRVN9oIMcQKRxQSPcHJYu8eLN6Q8lw/Gq+EAVbVPtM+DQVePyP
	l8YEskJuk/vCKaEumlUS/AN/fW0XixRIWWA/Ru5U8Td0vb7YIcjSN1L7HVv1kYFdA1DK
	5Z6yMY0idIVAPS7hvcmattNtpzmOCFpfea9opDZVAfN5sDJWOkuyKMzMykFSZ5gPsthB
	weudXHwdOdOWMD9oyBVBzbS7m4PQzEFTKgaQEVh+j9SZPjjhWPR5mqIwLzPxjjV0R+P+
	tezA==
X-Received: by 10.43.56.146 with SMTP id wc18mr22141263icb.24.1431707147246;
	Fri, 15 May 2015 09:25:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Fri, 15 May 2015 09:25:16 -0700 (PDT)
In-Reply-To: <1431686433.18723.22.camel@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
	<1431686433.18723.22.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 May 2015 09:25:16 -0700
Message-ID: <CAMKF1spbCyde8wGJgu=GgR14M4g4qSbzLob3rbadhUNPw8_g=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Fri, 15 May 2015 16:25:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 15, 2015 at 3:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
>> With the gcc patch I've posted applied:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>>
>> so down to 57 errors. There are a few themes:
>>
>> * linux-yocto 3.14 gcc5 issues
>> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
>> * poky-lsb issues with the security flags and gcc5
>> * x32 failed with a race of some kind in glibc, suspect transient
>> * gcc-target has a packaging issue which fails builds (have patch)
>>
>> The good news is that the various ppc issues are fixed including the rpm
>> one from this series.
>
> Latest run:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100
>
> with 37 errors.
>
> * linux-yocto 3.14 gcc5 issues

I guess there are patches around which I pointed out in last email
which should be ported

> * meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel

same as above mostly.

> * poky-lsb issues with the security flags and gcc5 (elfutils,
>   coreutils, iptables, openssl on edgerouter)

Those are something need fixing per package. I will look into some of
those. x86-64 issues are w.r.t one particular relocation

> * qemuarm doesn't boot

I have booted several arm machines ( bbb, overo tegra ST ) using
kernels ranging from 3.8 to 3.14, I believe its linux-yocto issue most
probably.

> * u-boot with beaglebone

This needs patches like this one
http://patchwork.openembedded.org/patch/92425/

>
> linux-yocto 3.14 is the next thing we need to clean up to have the most
> impact, qemuarm not booting is the most worrying.
>

agreed.
> Cheers,
>
> Richard
>
>
>

