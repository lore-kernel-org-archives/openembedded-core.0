Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 94E6260172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 13:24:10 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id l4so6481031lbv.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=atC9sCx2x4ZKxY2HDB4WLhMg0NqJCLbvzql5FcHCQ2o=;
	b=FYc7UF7gWzweTXvRtOky4BF4JnAf4E8LqR454rLPdjahrvZIA1wE632RZTFGUgh73x
	b5iuUfa/552g+BO3Y9/aIAJOFWs7/AL/rohzCh+LUP18o5ViY2fdABulafvS3IIff8Zq
	yA8wfdLDg0QFT2ZLm8o4mvz314g7TDsC4B2/vRb6rejI0zDyizM+XzgmfWqRvl1KKzeO
	ZhkIbUZzN6OHchRs1SBvbgLym0wrjAwwCvHSq7Ma0Ik/6sJzJOoPx6NakJXmFPn7vzuq
	k5sdpR3YXBNNlNkzNr42lC4yCOyqLrNLnAa0RIsAlzAfKRn1mb7PUndfJ2ZPwjgcohzI
	ADpQ==
X-Received: by 10.152.180.35 with SMTP id dl3mr883849lac.66.1389705849711;
	Tue, 14 Jan 2014 05:24:09 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id c3sm357708lbp.2.2014.01.14.05.24.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Jan 2014 05:24:08 -0800 (PST)
Message-ID: <52D53A6C.30808@gmail.com>
Date: Tue, 14 Jan 2014 14:23:56 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: zhenhua.luo@freescale.com
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>	
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted>
In-Reply-To: <1389616915.14987.4.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Tue, 14 Jan 2014 13:24:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-01-13 13:41, Richard Purdie wrote:
> On Mon, 2014-01-13 at 13:37 +0100, David Nyström wrote:
>> Just to clarify bug 5354:
>> If I understand the bug correctly, this would arise when first building
>> the nativesdk tarball on a MACHINE with ABI linux,
>> and then building the nativesdk for another MACHINE(with the same the
>> same TUNE) after altering ABIEXTENSION to linux-gnuspe ?
>>
>> If I understand bug 5354 correctly, perhaps the tmp/sdk/tarball.here
>> can be ABI specific ?
>
> The idea behind the changes to cross-canadian were to have just a single
> gcc/binutils which generated all of the appropriate targets for a given
> architecture.
>
> I understood this to be possible but it looks like we may need to tweak
> things a bit.
>
>> i.e. a generic rule that all nativesdk builds are invalidated if the
>> ABI changes. I guess that would mean:
>> cross-canadian.bbclass: TARGET_ARCH[vardeps] += "ABIEXTENSION"
>> + Adding ABIEXTENSION to the nativesdk tarball name.
>>
>> PPC '=mabi=spe' seems to be one-way compatible,  I could not get the
>> non-SPE configured compiler
>> to work with the SPE sysroot.
>> Another possible solution would be to always configure the compiler to
>> SPE, and use compile time flags in the
>> environment file to do the selects. + symlinks for the compiler paths.
>
> Can we configure the compiler to include SPE support without changing
> the paths/OS string?

Possibly, but I don't know enough about SPE to be sure.
Perhaps Zhenhua can add a few cents here.

Short summary of problem:
All SPE enabled MACHINES, (e500 and e500v2) have broken nativesdk 
compilers in dora and master.

Any suggestions on above statements ?

>
>> However, even if we fix it this way for powerpc, we will still have
>> this issue with thumb f.ex.
>
> Keep in mind the target sysroot still varies for each different target.
> The thing we're trying to keep in common is the gcc/bintuils and only
> have one copy for each target architecture. Is that possible in this
> case if we somehow enable SPE support in gcc-cross-canadian?

Yes, target sysroot varies. The nativesdk sysroot containing the 
compiler is the same as long as TUNE_ARCH and SDKMACHINE is the same.
Two ARMv8 targets built in sequence on the same host, where one is 
Thumb2 and the other is EABI ?, they will share nativesdk compiler no ?

The -native compiler runs from the -native sysroot, which has an ABI 
postfix, so no problem there I assume.

>
> Cheers,
>
> Richard
>


