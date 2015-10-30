Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id E018D76104;
	Fri, 30 Oct 2015 18:31:28 +0000 (UTC)
Received: by wikq8 with SMTP id q8so16724109wik.1;
	Fri, 30 Oct 2015 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=1D5iKPav7xbD8YOv8fvducBWvPoOXQeHykPOwkv9ILw=;
	b=Kl8INoQ0YmmIr/G1F32ac8HQWpx5UrcVuwhZYFv5p6CIjvFzABfPC/d36Km9KDvtV0
	yiw5PfGW7s4w18eWiROiXfVqUAZSJyaJdrZf68gge0Oo0vk1IBz+eeQeVG8VoQm77eJi
	AYTJ3yMFmsX8H7htQ/NkXHfVPNPS8aEZjEBQTXWCi5weeI9oyxzwYEFoc3A9R4qwpR4v
	hR4Hn2sVT6FATwGCn+9EEOpzmoJn29JPP4vRr9pTvVlgqNXykw8AdK6PHDzEHQ4rQTLf
	4HIFGDZP30E/OtI8LsJ9FrMfcAgAjmD88Du6O5eSr9e9gACNY+MrsGOy8zBf/0q4wHj9
	D2tg==
MIME-Version: 1.0
X-Received: by 10.194.188.111 with SMTP id fz15mr9038938wjc.106.1446229887951; 
	Fri, 30 Oct 2015 11:31:27 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Fri, 30 Oct 2015 11:31:27 -0700 (PDT)
In-Reply-To: <5633990D.3090308@gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<5633990D.3090308@gmail.com>
Date: Fri, 30 Oct 2015 11:31:27 -0700
Message-ID: <CAJ86T=UyxiAS3hf_t_R0PVrOqiO4CP1M8qgbw4toGiaC0ZT1HA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 30 Oct 2015 18:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 9:21 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 10/29/2015 08:42 AM, Khem Raj wrote:
>> Hi All,
>>
>> I would like to get everyone=E2=80=99s opinion on the libcs we maintain =
in OE-Core, as of now, we have
>>
>> glibc + cross localedef + kconfig patches which are left overs from egli=
bc days
>> uclibc - which is more of less unmaintained
>>
>> Its a significant effort to keep forward porting the kconfig changes sin=
ce it touches everywhere in glibc, (I do it in my local glibc tree)
>> almost every week there is a commit in upstream glibc which breaks the k=
config patches, I know there are distribution profiles
>> like poky-tiny which uses glibc in this capacity, and may be then their =
are other custom one=E2=80=99s made on top, I would like us to not carry ma=
jor
>> patches which almost makes our component a fork due to obvious maintenan=
ce cost. I think there is viable alternatives to tiny libcs in musl now.
>>
>> I would like to make a proposal for 2.1 release where
>>
>> 1. Drop kconfig support in glibc and we become inline with upstream
>
> Inline with upstream make a lot of sence and will help make maintenance
> simpler going forward.
>
>> 2. Move musl support to OE-Core from meta-musl
>
> I see no issue with this.
>
>> 3. Drop uclibc or leave it in current broken state, I would like to pull=
 it out into a layer in meta-openembedded and we can leave the core plumbin=
g as it is in OE-Core
> If its not being maintained, then drop by 2.1.

Maintenance of uclibc seems to have moved to the uclibc-ng project:

  http://www.uclibc-ng.org/

Developers are active and they make regular releases. Buildroot
switched to uclibc-ng as the default uclibc a few months ago and it
seems to be working OK for them:

  http://git.buildroot.net/buildroot/commit/?id=3D68d4a3b5a6a6d03d67418e0b6=
37628ecf9cbf192


>> 4. Poky-tiny switches to use musl
>
> If Poky-tiny is meant to showcase the smallest of the small , then that
> make sense.
>
> - armin
>
>>
>> may other disto=E2=80=99s have moved to using musl as system C library e=
.g. alpine linux, openwrt, and I am also deploying it in  real products
>> its pretty mature and well maintained with very healthy community around=
 it. Right now meta-musl is capable of building and running
>> core-image-sato/core-image-weston for all supported Qemu arches in OE-Co=
re, the amount of software it can build is no less than uclibc
>> support in OE-Core.
>>
>> if collectively we think, this is a good move then I can work on all of =
above items in early phases of 2.1 so we can settle any
>> outstanding issues, due to the shuffle especially in poky-tiny
>>
>> Thoughts ?
>>
>> -Khem
>>
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

