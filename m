Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9FmA-0006J8-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 15:36:14 +0200
Received: by wgbdr1 with SMTP id dr1so540421wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 06:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=11bLA0DLhRx87RBtOk3nbzzhhb+1ecw6OGa2+xQsfwQ=;
	b=Pyt9AmO2ytON7UAVwP+FqDtzWC8KidZTXybJp61F27oV0QE7oZJaBg9gEla/LoEoKN
	zoDIinFVLOgY/9zKMUgf7ZacxcFkECFoOzaPx3YGyWPpUaHS2b44hOTdA5xIT7zWTO5w
	Xng1BH5xXLdqVtU0vFpbp9b+QYOrsiW6+qa++4Dpiskte5ielzr4ZlF7jrpGJBWF1TPI
	rWBNm8K2D1FiVdH6z1dzGKBHP01cirbXiUIjj0I1m7JQu/y7fFIzFm4rcrPXGqWz1CqQ
	jiX2F6ikDXRz1UMgeQOuBNA30p0sGFq/NoLxF1g3CYAPenhfcTX7jrLX2d0AhXz+ePGH
	6Huw==
Received: by 10.180.94.164 with SMTP id dd4mr38285901wib.1.1346851431126;
	Wed, 05 Sep 2012 06:23:51 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fb20sm4676954wid.1.2012.09.05.06.23.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 06:23:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346845447.21985.50.camel@ted>
Date: Wed, 5 Sep 2012 15:24:00 +0200
Message-Id: <E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnD3+ZG8Y49EtlgLRrqUvIFH0gZW3CMsB4KNRlaMNXsNzYsiscCu+PjpNxqPAuTTPNVw//l
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
X-List-Received-Date: Wed, 05 Sep 2012 13:36:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 sep. 2012, om 13:44 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2012-09-05 at 12:05 +0200, Koen Kooi wrote:
>> Op 5 sep. 2012, om 11:31 heeft Robert Yang =
<liezhi.yang@windriver.com> het volgende geschreven:
>>=20
>>> This is for fixing the problem:
>>> 1) bitbake core-image-sato-sdk with MACHINE=3Dqemux86
>>> 2) bitbake core-image-sato with with MACHINE=3Dcrownbay
>>>=20
>>> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but =
several
>>> i586 packages will be installed into crownbay's rootfs though there =
are
>>> core2 packages. For example, there are:
>>>=20
>>> xserver-xorg_1.11.2-r4_i586.ipk
>>> xserver-xorg_1.9.3-r1_core2.ipk
>>>=20
>>> The crownbay.conf says:
>>> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>>>=20
>>> What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, =
but
>>> the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
>>> incorrect.
>>=20
>> It is the correct behaviour, though.
>=20
> No, it isn't. You told bitbake to build some specific versions, it did
> that, then put something else in the rootfs. Without mentioning any of
> this to the user.

You forget that, you, as the user, instructed bitbake to build the other =
version when switching machine. Should bitbake refuse to build the =
packages in this scenario? That would make more sense than trying to =
clean up the mess in the package_ipk bbclass. If you have online feeds =
the problem will reappear anyway.

> So the current behaviour is totally broken and it needs to do one of:
>=20
> a) Put the things the user asked for in the rootfs
> b) Tell the user its not going to
> c) Error out and ask the user to fix the problem
>=20
> Builds are meant to be deterministic and this clearly isn't as what =
you
> get out depends on the order of what you build.

How do we know what the user expects? The user already did something =
that isn't right by building compatible arch packages with different =
versions. And this is deterministic, the user instructed bitbake to =
build a more recent, but compatible version, which will end up in the =
rootfs. If would be non-deterministic if opkg would decide at random =
what to install.

So, fix this problem at the root and make bitbake error out if your =
build breaks PREFERRED_VERSION.=


