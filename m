Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1E86E898;
	Thu, 13 Feb 2014 05:45:42 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id z10so10090250pdj.33
	for <multiple recipients>; Wed, 12 Feb 2014 21:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=n8dY1lrLaIi0YB8Nfq3QkFhV0216dy4mYqTUSfSlOtw=;
	b=YsQSwFE8PNHyXFEmpI3JttqebTsGzu0MZjPEsKGjY3rGCkia1HPuo7bXx8PwFaCcY7
	3nJDrd/l4Q9i9h0PMMC/e9yQmDmMK8r27aVpOKIHaO3J72R5rnwIAf03h+KOuwh78YtY
	fI2Mhvc0OjPS5ezApM8WxnmQhkO+q9j/KmvRcahIpU0d6oQ1Y5TJPOb0EEuV4Gfq+7tL
	wuuN91QUb6vuhDb7TGN1XgalkKdOoq7Y3sF0m0M37Nm1Z1MYaGV1hrbWioE2Lcos2V+r
	UetfHBz8w1zjpvMQYGm6GhnoRFkAO0+E7HCYQjaEJAbD40ob4SEAfp4TG7hP4+hYVeK7
	jegw==
X-Received: by 10.66.217.133 with SMTP id oy5mr44752755pac.46.1392270342687;
	Wed, 12 Feb 2014 21:45:42 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id id1sm2360087pbc.11.2014.02.12.21.45.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 21:45:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <81756FDA-0EA9-4393-A4F2-0004E8377A7F@gmail.com>
Date: Wed, 12 Feb 2014 21:45:39 -0800
Message-Id: <9BE5B941-F71B-444F-84A3-07EF3CA6F9E5@gmail.com>
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
	<1392219682.14081.1.camel@ted>
	<81756FDA-0EA9-4393-A4F2-0004E8377A7F@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
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
X-List-Received-Date: Thu, 13 Feb 2014 05:45:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Richard, All

On Feb 12, 2014, at 10:20 AM, Khem Raj <raj.khem@gmail.com> wrote:

>=20
> On Feb 12, 2014, at 7:41 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
>> On Sat, 2014-02-08 at 08:08 -0800, Khem Raj wrote:
>>> Hi all
>>>=20
>>> I have staged a branch with eglibc 2.19 upgraded recipes here
>>>=20
>>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglibc=
-2.19
>>>=20
>>> These are not final recipes there may be tweaks needed like =
adjusting SRC_URI
>>> later on.
>>>=20
>>> please help testing it out in your environments and machines
>>> I would be happy to help out with issues we find
>>=20
>> The autobuilder is still going but it found:
>>=20
>> =
http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/2=
5/steps/BuildImages/logs/stdio
>=20
> I could reproduce it.
>=20
> This seems to be surfaced by a commit in glibc where the  math_ldbl.h =
implementations for ppc were unified. I have for now reverted it via =
patch and pushed to pull branch. however thats not only the one issue =
:(. I am now seeing
>=20
> | ../sysdeps/powerpc/fpu/fenv_libc.h:48:6: error: impossible =
constraint in 'asm'
> |       asm volatile ("mtfsf 0xff,%0" : : "f" (d)); \
> |       ^
>=20

Alright, the real problem was that in glibc 2.19 the SPE patch was =
upsteamed from eglibc and now the SPE support lives under nofpu/ which =
is correct unlike
eglibc where it was living under fpu/ class. We were not passing =
=97without-fp
to eglibc configure which caused this issue. I have now fixed it in =
metadata
and pushed a new set of patches ( total 2) to the pull branch, which =
should take of this issue as well as valgrind issue.=20

Thanks
-Khem



