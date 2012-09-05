Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T9G9V-0007JH-HF
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 16:00:21 +0200
Received: by obblz20 with SMTP id lz20so186996obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=eGqc28E073wS0vmoY2y0vr6B/WI+Ck8anOLe4CVCieA=;
	b=LvbxuboJWZcvGxH6aK/D8FKp/E9ANav973GQafDa1zV8wX1ZmJEDOHcov94gmpoM8V
	VTt6QshEyfUvCr4Xx7Ra2r8nIcEQtbrar0xTxWDnFo0Bg2FapmTKVfI5TTCC65h4Bc6I
	apNqq8F+Xa5/hMdxcH/2pPoxQNavIUza4UV2OBrPGUrayD3SjVZViLuw6ifT2ZdQI263
	pI5mOJnh+GSzveqfnK4okzJGApzRcVQznML7vF8Yk9kIJzGy0H8Yrj/3PAoLtFWVMmLH
	LYLLfaYkPZ437FLeYvDgncvOc4Oxo1Uvg9rhXoPo8LgP8jhdcDpEauclCmrJESxBjkno
	G9tg==
MIME-Version: 1.0
Received: by 10.60.7.169 with SMTP id k9mr16786210oea.77.1346852877847; Wed,
	05 Sep 2012 06:47:57 -0700 (PDT)
Received: by 10.76.173.163 with HTTP; Wed, 5 Sep 2012 06:47:57 -0700 (PDT)
In-Reply-To: <E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
	<E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
Date: Wed, 5 Sep 2012 15:47:57 +0200
Message-ID: <CAGiJk9fx541Fbjzr2Wz0EqHEuXqaLT67OMhcCnTfafWvDQGDPg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 14:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/9/5 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 5 sep. 2012, om 13:44 heeft Richard Purdie <richard.purdie@linuxfounda=
tion.org> het volgende geschreven:
>
>> On Wed, 2012-09-05 at 12:05 +0200, Koen Kooi wrote:
>>> Op 5 sep. 2012, om 11:31 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:
>>>
>>>> This is for fixing the problem:
>>>> 1) bitbake core-image-sato-sdk with MACHINE=3Dqemux86
>>>> 2) bitbake core-image-sato with with MACHINE=3Dcrownbay
>>>>
>>>> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but sever=
al
>>>> i586 packages will be installed into crownbay's rootfs though there ar=
e
>>>> core2 packages. For example, there are:
>>>>
>>>> xserver-xorg_1.11.2-r4_i586.ipk
>>>> xserver-xorg_1.9.3-r1_core2.ipk
>>>>
>>>> The crownbay.conf says:
>>>> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>>>>
>>>> What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, bu=
t
>>>> the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
>>>> incorrect.
>>>
>>> It is the correct behaviour, though.
>>
>> No, it isn't. You told bitbake to build some specific versions, it did
>> that, then put something else in the rootfs. Without mentioning any of
>> this to the user.
>
> You forget that, you, as the user, instructed bitbake to build the other =
version when switching machine. Should bitbake refuse to build the packages=
 in this scenario? That would make more sense than trying to clean up the m=
ess in the package_ipk bbclass. If you have online feeds the problem will r=
eappear anyway.
>
>> So the current behaviour is totally broken and it needs to do one of:
>>
>> a) Put the things the user asked for in the rootfs
>> b) Tell the user its not going to
>> c) Error out and ask the user to fix the problem
>>
>> Builds are meant to be deterministic and this clearly isn't as what you
>> get out depends on the order of what you build.
>
> How do we know what the user expects? The user already did something that=
 isn't right by building compatible arch packages with different versions. =
And this is deterministic, the user instructed bitbake to build a more rece=
nt, but compatible version, which will end up in the rootfs. If would be no=
n-deterministic if opkg would decide at random what to install.
>
> So, fix this problem at the root and make bitbake error out if your build=
 breaks PREFERRED_VERSION.

+1

Even thought that this won't hit me again with a dedicated build
machine that deletes the tmp/sstate dirs before each build.
I can remember building for the Pandaboard and Overo in a row which
resulted in errors that could not be resolved with sstate clean,
leading to unexpected runtime behavior but "stated" a completely sane build=
.

It turned out that the PREFERRED_VERSION for an Overo recipe was
ignored, deleting the tmp/sstate directories did sort out the problem.



--=20
Regards
Samuel


