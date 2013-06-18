Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 612C7607F8
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:25:50 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so3635730pad.16
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=1C7czysilFhXjg8HDQeCCAX+KaCXdTL0tz5/C7YlX9w=;
	b=cF+inKyR2amkbOqzWEtnBuIg3TrrmJyeoPNV8kvj2d9szlRbzLIzrD+SQj9QyjC1f9
	Li27z4vIR4jHwYyaBGEqAKqHZEHUxXtTDW64YZjhZBbIp5x6ZkLgw8zvJXu9yngFgkqn
	3ES7z1GwymRIEMNfbs1rUC/CZQNEq2MEo/wdJADqX8zPsodpVbOUncKBNfxBAUgFnBPM
	Ys+/iGZcyf/c8opGsGmP4TgTwzxkBC21Wi3ypkoH8Ouhx4lfcurmMvE1wNzFvK4tmNwL
	6109mvsd0DkSqNzowh7tpEUCdXQYWkrx4MOvAKL7wV2dqqwVXnBu5SCH2KklJeG17MwA
	XoVA==
X-Received: by 10.68.137.195 with SMTP id qk3mr15912845pbb.100.1371533151633; 
	Mon, 17 Jun 2013 22:25:51 -0700 (PDT)
Received: from scoonan-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fl2sm17876977pab.23.2013.06.17.22.25.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 22:25:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51BFE8D9.8010002@windriver.com>
Date: Mon, 17 Jun 2013 22:25:46 -0700
Message-Id: <40EAB0BD-784A-4DBB-A8E1-8A4E81E0B41C@gmail.com>
References: <A6E8629E-ED47-4DD7-8C53-B0D467BADA39@gmail.com>
	<51BFE413.2020303@windriver.com>
	<99677DAA-0C63-481C-9499-0E4F00188725@gmail.com>
	<51BFE8D9.8010002@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>,
	"<openembedded-core@lists.openembedded.org> oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Fix for kernel 3.8/gcc-4.8 segfault on qemuarm
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
X-List-Received-Date: Tue, 18 Jun 2013 05:25:50 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 17, 2013, at 9:58 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-06-18 12:41 AM, Khem Raj wrote:
>>=20
>> On Jun 17, 2013, at 9:37 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:
>>=20
>>> On 13-06-17 11:30 PM, Khem Raj wrote:
>>>> Hi Bruce and All
>>>>=20
>>>> Finally after a long innings I have diagnosed the mystery behind =
the below segfault that we see on kernel 3.8 which compiled with gcc 4.8 =
but don't show when compiled with gcc 4.7
>>>>=20
>>>>=20
>>>=20
>>> There also seems to be a follow up patch:
>>>=20
>>> commit 418df63adac56841ef6b0f1fcf435bc64d4ed177
>>> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
>>> Date:   Tue Mar 12 13:00:42 2013 +0100
>>>=20
>>>    ARM: 7670/1: fix the memset fix
>>>=20
>>>    Commit 455bd4c430b0 ("ARM: 7668/1: fix memset-related crashes =
caused by
>>>    recent GCC (4.7.2) optimizations") attempted to fix a compliance =
issue
>>>    with the memset return value.  However the memset itself became =
broken
>>>    by that patch for misaligned pointers.
>>>=20
>>>    This fixes the above by branching over the entry code from the
>>>    misaligned fixup code to avoid reloading the original pointer.
>>>=20
>>>    Also, because the function entry alignment is wrong in the Thumb =
mode
>>>    compilation, that fixup code is moved to the end.
>>>=20
>>>    While at it, the entry instructions are slightly reworked to help =
dual
>>>    issue pipelines.
>>>=20
>>>    Signed-off-by: Nicolas Pitre <nico@linaro.org>
>>>    Tested-by: Alexander Holler <holler@ahsoftware.de>
>>>    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>>>=20
>>> :100644 100644 d912e73... 94b0650... M  arch/arm/lib/memset.S
>>>=20
>>> --------
>>>=20
>>> I've staged it as well, and will do a boot test in the morning once
>>> my build has completed. Time to call it a night here.
>>=20
>> I did not need anything other than the first patch to get over the =
segfault. but yes it completes the fix
>> so having both is better
>=20
> So very strange. I got one segfault, and then this:
>=20
> Linux version 3.8.13-yocto-standard (bruce@yow-bashfiel-d2) (gcc =
version 4.8.1 (GCC) ) #2 PREEMPT Tue Jun 18 00:36:55 EDT 2013
>=20
> <snip>
>=20
> qemuarm login: root
> root@qemuarm:~# uname -a
> Linux qemuarm 3.8.13-yocto-standard #2 PREEMPT Tue Jun 18 00:36:55 EDT =
2013 armv5tejl GNU/Linux
>=20
> ----------------
>=20
> Which means I may have just been unlucky on my testing with 3.10, or =
something
> else is going on.

Well I have been booting latest linus's (3.10-rc6) master compiled with =
gcc 4.8 just one patch from linux-yocto see below

=
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/commit/?h=3Dstan=
dard/arm-versatile-926ejs&id=3D351d133943b50a9dfeee07661d44254722a19f04

I wonder why this patch hasn't made upstream yet.



