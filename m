Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6F89B6B446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 12:37:25 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so2346388lan.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=O0x+nNTPLDSlMZPLvcVaOkUYfuIsPBwftpPvyGi8tnA=;
	b=yfA4rNbtDA9GOkO78boixLaVIyHxTdfziD+jluJspdWkxjqBhoXVFY15fm5XTEffti
	uMgCgldJ/S0tjaL4piHI+1Rzsv0riqLpWqt0HgQFccuIl3KX/UPdxcPrx4qp3NTp/dPp
	LldiTquvmhr8v9oLo4i7R/Es80oPZBe1w8Tf3LrL0g5x1AzrzPIiQzJJ/FrxBJiaxwt3
	QsmgPgkE8xU8zbn1mhe+9D2zG/5OSeXbv3aBBhBJU4rTMFzr5u5PLq4G5meFicCIefFK
	SPctEQ6oZyEy6HjikqHLMNquA6A/zyss9zAeMFbPEw0xF+s0y9ni11mhyZ36gx4+nNbb
	lpiQ==
X-Received: by 10.112.72.70 with SMTP id b6mr10156331lbv.0.1389616645795;
	Mon, 13 Jan 2014 04:37:25 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id tc8sm9557553lbb.9.2014.01.13.04.37.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 04:37:24 -0800 (PST)
Message-ID: <52D3DDFB.8080803@gmail.com>
Date: Mon, 13 Jan 2014 13:37:15 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted>
In-Reply-To: <1389366908.19102.223.camel@ted>
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
X-List-Received-Date: Mon, 13 Jan 2014 12:37:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On fre 10 jan 2014 16:15:08, Richard Purdie wrote:
> On Fri, 2014-01-10 at 15:48 +0100, David Nyström wrote:
>> The reverted commit seems to introduce some problems for the toolchain tarball
>> for powerpc.
>> I see this both in master and on dora.
>>
>> 1. Looks like the relocation scripts fails for environments:
>>
>> ~/tests/poky [master]
>> $ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep "#"
>> export SDKTARGETSYSROOT=##SDKTARGETSYSROOT##
>>
>> ~/tests/poky [master]
>> $ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux-gnuspe | grep "#"
>>
>> 2. nativeSDK gnuspe compiler does not allow -mabi=spe
>> ABIEXTENSION is zeroed both for linux-gnuspe and linux
>>
>> 3. Compiler can't create executables.
>> I think this is due to libgcc_s.so from the SDK target sysroot is in mabi=spe.
>>
>> 4. -mspe is included in CC var for both linux and gnuspe.
>> cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep mabi
>> export CC="powerpc-oel-linux-gcc  -m32 -mcpu=8548 -mabi=spe -mspe ....
>> export CXX="powerpc-oel-linux-g++  -m32 -mcpu=8548 -mabi=spe -mspe ....
>> export CPP="powerpc-oel-linux-gcc -E  -m32 -mcpu=8548 -mabi=spe -mspe ....
>>
>> With the commit reverted, I can successfully build target code with the canadian compiler
>> from the SDK tarball. Only the gnuspe environment file is generated.
>
> Ok, so how do you propose we fix the issues the patch was added to
> address?
>
> Cheers,
>
> Richard
>

Just to clarify bug 5354:
If I understand the bug correctly, this would arise when first building 
the nativesdk tarball on a MACHINE with ABI linux,
and then building the nativesdk for another MACHINE(with the same the 
same TUNE) after altering ABIEXTENSION to linux-gnuspe ?

If I understand bug 5354 correctly, perhaps the tmp/sdk/tarball.here 
can be ABI specific ?
i.e. a generic rule that all nativesdk builds are invalidated if the 
ABI changes. I guess that would mean:
cross-canadian.bbclass: TARGET_ARCH[vardeps] += "ABIEXTENSION"
+ Adding ABIEXTENSION to the nativesdk tarball name.

PPC '=mabi=spe' seems to be one-way compatible,  I could not get the 
non-SPE configured compiler
to work with the SPE sysroot.
Another possible solution would be to always configure the compiler to 
SPE, and use compile time flags in the
environment file to do the selects. + symlinks for the compiler paths.
However, even if we fix it this way for powerpc, we will still have 
this issue with thumb f.ex.

It would be good if the Freescale folks could chime in here.

Br,
David


