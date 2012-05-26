Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SYCC1-0008LE-1S
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 10:17:45 +0200
Received: by eaal1 with SMTP id l1so462513eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2012 01:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Vk09FEhqmmbK57VWmANzNTMI3Yri12ZALvXYxs/t8+E=;
	b=cBCrCHk5BMQ2mFXwT0jSKrEa2vGY5sGcuE2x/UMdZUoa7taduTJu6QFEQrKH+AMl9o
	bE4GmmMxt0CnfE+0PSaz+oaYJrWOedJO2fQpc+BGgyakY1up0h9jVRvNBpcjd5k6cN9Z
	UeYgcuBpjlJHEMlYK847DtmtRuo1M6oxBWQdA5vZq8PU21e5IbDNUOczl6h0UDyQV+KP
	RDkdlVqQY9sffISnDuD8a3YC3lmO5uXvGA3ByktMKSGPDQA+O1PQHvUvaea88deAW745
	0QkTniHVv47UQlJ9uT1737Cfv41GXIWcTtwQio4vjR8Nqm2LUxQV6fopSmum/QNoIgX6
	gslw==
Received: by 10.14.127.66 with SMTP id c42mr323172eei.185.1338019651576;
	Sat, 26 May 2012 01:07:31 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s47sm15231394eef.4.2012.05.26.01.07.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 26 May 2012 01:07:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120526062847.GF3138@jama.jama.net>
Date: Sat, 26 May 2012 10:07:24 +0200
Message-Id: <E0D782CE-D537-4A4D-A5A8-490132515445@dominion.thruhere.net>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
	<20120525113057.GD3138@jama.jama.net>
	<4FC04443.1090708@windriver.com>
	<20120526062847.GF3138@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlYEyLfYd6tmyZjQ+NcSmnGIwh+pVe7t+aeAWtC8ruTtDKlwBjjSqnS1r5rSMrueYjVuDhw
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 May 2012 08:17:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 mei 2012, om 08:28 heeft Martin Jansa het volgende geschreven:

> On Sat, May 26, 2012 at 10:47:31AM +0800, Robert Yang wrote:
>>=20
>>=20
>> On 05/25/2012 07:30 PM, Martin Jansa wrote:
>>> On Fri, May 25, 2012 at 01:19:55PM +0200, Koen Kooi wrote:
>>>>=20
>>>> Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
>>>>=20
>>>>> There is a bug if we:
>>>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
>>>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>>>>>=20
>>>>> Then several pkgs in deploy/ipk/i586 would be installed to =
crownbay's
>>>>> image even if there is one in deploy/ipk/core2 and we have set the
>>>>> core2's priority higher than i586, when the version in =
deploy/ipk/i586 is
>>>>> higher. This doesn't work for us, for example, what the crownbay =
need is
>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>>>>=20
>>>>> This is caused by opkg's selecting mechanism, if there are more =
than one
>>>>> candidates which have the same pkg name in the candidate list, for
>>>>> example, the same pkg with different versions, then it will use =
the last
>>>>> one which is the highest version in the list, this doesn't work =
for us,
>>>>> it should respect to the arch priorities in such a case.
>>>>=20
>>>> This is a serious break with the current opkg behaviour and I don't =
think it's an improvement. Needing different versions for non machine =
specific packages indicates a more serious bug elsewhere.
>>>=20
>>> It's not the same use-case as those 2 above, but what I don't like =
on
>>=20
>> Hi Martin,
>>=20
>> They are the same cases:-), I think that this patch has also fixed =
your problem,
>=20
> No, at least not completely the same.
>=20
> I would prefer to upgrade foo-1.0-r1_armv4t temporary until
> foo-1.0-r1_armv7a gets available in feed and that won't happen with =
your
> patch AFAIK.
>=20
> with your patch:
> If you have bar-1.0 which has to be MACHINE_ARCH and in 2.0 bar
> developers find way to detect and use all machine capabilities in
> runtime, recipe maintainer will switch to TUNE_ARCH, then=20
> foo-1.0_nokia900.ipk won't be ever upgraded to foo-2.0_armv7a.ipk=20
> and that's bad.

And what's worse, the cited usecase is for (slightly paraphrasing):

xserver-xorg 1.11.2 i586
xserver-xorg 1.9.3 i686

Which indicates there is a different, more serious problem at hand. It =
seems that someone is trying to encode machine specific tweaks to =
non-machine specific packages. I'm more interested in solving that =
problem than in changing opkg/rpm behaviour.

There are a number of things that are just not possible to do when =
supporting multimachine builds and/or multimachine feeds. For example:

machine dogbeachmountain (i686) needs =
xf86-video-evilpowervr-closedbinary that only works with Xorg 1.9, but =
machine cherryblossomhighway (i586) can use xf86-video-intel with any =
xserver-xorg.
If you want both of these machines to work in multimachine builds and/or =
feeds, you need to lock down xserver-xorg to 1.9 for i*86. If you don't =
want to lock it down and imgtec won't give you a better binary drop, too =
bad, stop doing multimachine.
I'm not saying the above situation is what Robert is trying to solve, =
but it's a situation meta-ti is currently facing with the new binary =
drop for SGX support. When you have dealt with SGX blobs everything =
starts to look like an SGX problem :)=20

regards,

Koen=


