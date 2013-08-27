Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C9CF56BA88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 04:52:49 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so4313321pdi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=25JlU1gfJ2DPF34VMxMXRFu8XiXvh85apfjPOVUWS7M=;
	b=yRsiwYtVllOwa1hsoO+gijn2YpOVe4RzjTpkVyA6Bb6+AGKxmRQN11XGZw9S2iv+ra
	cEpgr4FVdr1h0337ShhKKzbr96XDo6zAphnUiVGiaMFkRlSe2RvbBnsaSmxlXsUDaSkZ
	U09ptDFNQTMEPzElELHPOcyxtuv0tkJ1ubtF/joOgyDAIf0wina1RQbuHjZ1fV9LD3pl
	meuS/TYbaM8u816+XcidJ7HO7r6cYpNac+jfvcJKvIVW5G/LvuLT56pQ/Ko0284b48k/
	BwgyklknEZJRuLczDMa/FOE9qw7YH6JPueZQhSpfyk3Me81H2PmLrHrszGvjgP5K/1Wh
	6seQ==
X-Received: by 10.66.254.194 with SMTP id ak2mr6653630pad.167.1377579170630;
	Mon, 26 Aug 2013 21:52:50 -0700 (PDT)
Received: from sa-nc-common2-240.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	iu10sm24069238pac.18.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 21:52:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANwerB1Sj-YRkr=0i2TrWzraD4rWQmsnJOWoh4Kwoo3eJsor7Q@mail.gmail.com>
Date: Mon, 26 Aug 2013 21:53:02 -0700
Message-Id: <DC54624B-076B-4335-920F-3979A2C0EBB6@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<a7cb7b0c2c43a8cc4c45608ed805dbf015e4fdc6.1377145501.git.raj.khem@gmail.com>
	<CANwerB1Sj-YRkr=0i2TrWzraD4rWQmsnJOWoh4Kwoo3eJsor7Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] systemd: Upgrade to 206
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
X-List-Received-Date: Tue, 27 Aug 2013 04:52:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 7:40 PM, Jonathan Liu <net147@gmail.com> wrote:

> On 22 August 2013 14:31, Khem Raj <raj.khem@gmail.com> wrote:
>> Add new PACKAGE systemd-rpm-macros, this will hold
>> the macros which are interesting when rpm is used as
>> package management backend
>>=20
>> Forward port uclibc only patches. Add a new patch
>> to stub out use of preadv/pwritev in testcases
>>=20
>> Delete patches that have been merged upstream in systemd
>>=20
>> Remove force export of GPERF variable in environment
>> this was causing AC_CHECK_TOOL to not populate GPERF
>> variable as expected
>>=20
>> systemd needs kmod to be present on rootfs so add it
>> to RDEPENDS
>>=20
>> some services substitute discovered kmod when the service
>> file is generated during boot, however the discovered kmod
>> is from native sysroot and it gets into the service file
>> with absolute path. So specify the target path of kmod using
>> KMOD variable so the unit files have correct pointer to kmod
>> on target
>>=20
>> Add a patch to make sure that mknod capability is checked
>> before the service which excercise mknod, this patch is also
>> submitted to upstream systemd
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> Arch Linux had some issues with systemd 206 with regard to device
> nodes in /dev getting wrong permissions:
> https://bugs.archlinux.org/task/36259
>=20
> I wonder if we need to add patches for that as well:
> =
http://cgit.freedesktop.org/systemd/systemd/patch/?id=3D15a722007dc1d8a9a1=
1934b2ab528cf4d25b6c62
> =
http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Da2aced4add1964f82c=
fd250f1fee8de9d974b507
> =
http://cgit.freedesktop.org/systemd/systemd/patch/?id=3D5c7951141fa9f33e1b=
97de97586cc16bce2776e0
> =
http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Dec99834cb0e76a9e70=
96bd42249053712db9c32d

With the testing on 3.8 kernel at that time, I did not have see issues. =
However if we are able to have reproducers
we can cherry pick needed fixes at later stage. Lets see the breakage =
for our case first.

>=20
> Regards,
> Jonathan


