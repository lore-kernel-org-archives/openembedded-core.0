Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 34D5E75D4A;
	Fri, 30 Oct 2015 20:55:02 +0000 (UTC)
Received: by iody8 with SMTP id y8so92236753iod.1;
	Fri, 30 Oct 2015 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=pGHF7kzacS4zHBGv0SqDaSM9/CacVdh7W0dNMG6MAog=;
	b=wQseUa4G3Y6xDndSVLtWO2MJkmx1vwnXH9CxTNTPArCa6/bFvZ4xLsfGZI+LO6YG0b
	JL629cgv2tlOOmTjoLKnflSpWXjm1G9hBPSZpONSnUW8FKt0IeTDFZgL3qcP4qVoJwUX
	Pubw35wmyDF59BRVqlNyHnrArBQzYPGSelijKK13DXBP4Ks9BDt7y00BcO/CfbiPOKFP
	L0gmfR17KYfUyGB8BLiKrQxfYvRZRPyPLy4632IlzlmWW3LwgWMyPZLScmz2d7MCi87C
	/mhwteUlo1kpa2Y7vswoNW2bFcyWYnK9vCQsIuWF582y2HmK3Rub0AqKBH7sDs+w2mWb
	8SwA==
X-Received: by 10.107.3.77 with SMTP id 74mr11582520iod.49.1446238502631; Fri,
	30 Oct 2015 13:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 13:54:33 -0700 (PDT)
In-Reply-To: <CAJ86T=UyxiAS3hf_t_R0PVrOqiO4CP1M8qgbw4toGiaC0ZT1HA@mail.gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<5633990D.3090308@gmail.com>
	<CAJ86T=UyxiAS3hf_t_R0PVrOqiO4CP1M8qgbw4toGiaC0ZT1HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 13:54:33 -0700
Message-ID: <CAMKF1sqcE8r_wRwKnfhg7T=Q2knr8yBLPpxn+6T=N5j31ndgPA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Fri, 30 Oct 2015 20:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 11:31 AM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
> On Fri, Oct 30, 2015 at 9:21 AM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 10/29/2015 08:42 AM, Khem Raj wrote:
>>> Hi All,
>>>
>>> I would like to get everyone=E2=80=99s opinion on the libcs we maintain=
 in OE-Core, as of now, we have
>>>
>>> glibc + cross localedef + kconfig patches which are left overs from egl=
ibc days
>>> uclibc - which is more of less unmaintained
>>>
>>> Its a significant effort to keep forward porting the kconfig changes si=
nce it touches everywhere in glibc, (I do it in my local glibc tree)
>>> almost every week there is a commit in upstream glibc which breaks the =
kconfig patches, I know there are distribution profiles
>>> like poky-tiny which uses glibc in this capacity, and may be then their=
 are other custom one=E2=80=99s made on top, I would like us to not carry m=
ajor
>>> patches which almost makes our component a fork due to obvious maintena=
nce cost. I think there is viable alternatives to tiny libcs in musl now.
>>>
>>> I would like to make a proposal for 2.1 release where
>>>
>>> 1. Drop kconfig support in glibc and we become inline with upstream
>>
>> Inline with upstream make a lot of sence and will help make maintenance
>> simpler going forward.
>>
>>> 2. Move musl support to OE-Core from meta-musl
>>
>> I see no issue with this.
>>
>>> 3. Drop uclibc or leave it in current broken state, I would like to pul=
l it out into a layer in meta-openembedded and we can leave the core plumbi=
ng as it is in OE-Core
>> If its not being maintained, then drop by 2.1.
>
> Maintenance of uclibc seems to have moved to the uclibc-ng project:
>
>   http://www.uclibc-ng.org/
>
> Developers are active and they make regular releases. Buildroot
> switched to uclibc-ng as the default uclibc a few months ago and it
> seems to be working OK for them:
>
>   http://git.buildroot.net/buildroot/commit/?id=3D68d4a3b5a6a6d03d67418e0=
b637628ecf9cbf192

Thats something needs to waited and watched.

>
>
>>> 4. Poky-tiny switches to use musl
>>
>> If Poky-tiny is meant to showcase the smallest of the small , then that
>> make sense.
>>
>> - armin
>>
>>>
>>> may other disto=E2=80=99s have moved to using musl as system C library =
e.g. alpine linux, openwrt, and I am also deploying it in  real products
>>> its pretty mature and well maintained with very healthy community aroun=
d it. Right now meta-musl is capable of building and running
>>> core-image-sato/core-image-weston for all supported Qemu arches in OE-C=
ore, the amount of software it can build is no less than uclibc
>>> support in OE-Core.
>>>
>>> if collectively we think, this is a good move then I can work on all of=
 above items in early phases of 2.1 so we can settle any
>>> outstanding issues, due to the shuffle especially in poky-tiny
>>>
>>> Thoughts ?
>>>
>>> -Khem
>>>
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

