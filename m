Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TF4KP-00039N-G3
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:35:37 +0200
Received: by wgbds1 with SMTP id ds1so1077053wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 07:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=wX1ScJBl3aqBm8XiNsr3IBPWe4yAXCMHRpFGm1oiJvc=;
	b=OrZdcU6gYbTdZu7KWwz2NMZO6Fo7kL7/pwwvhZi9N9IPW3hSw+rgA5oIHWBcKrwVMc
	ULlpS6MBx4+G2uobSEVqbvXze+1b9ql+Kro0qZhTIc4InVj0f4gbbYw+gqK/Zcb7qsAf
	v6hZ1LXE1Jw1TWvGLuyed+SkLMNvvreWqvsSgphMsBdPei8RbDRZ61U2BfAvlY0HX1nT
	lOC2uBCwss+UTY4zp6s0mFFTIyl8zxs3HV5MLks6Fey9yZ/y6C6lvuSOltCEm7burPJm
	hvZ543r8Cw04G8L52TqxGxpSEJ+ZsaMhAFJEunuA9dWVEgmnsFQlYeshUHNa4fA+1wOw
	ZNfQ==
Received: by 10.216.88.145 with SMTP id a17mr3171767wef.0.1348237373221;
	Fri, 21 Sep 2012 07:22:53 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t7sm16911957wix.6.2012.09.21.07.22.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 07:22:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0ffb700ac0f8ae5e2d0f03ab3f30ae52e5973779.1347976732.git.liezhi.yang@windriver.com>
Date: Fri, 21 Sep 2012 16:22:53 +0200
Message-Id: <527B610A-7C4A-40E3-BF1D-4B7C373207E6@dominion.thruhere.net>
References: <cover.1347976732.git.liezhi.yang@windriver.com>
	<0ffb700ac0f8ae5e2d0f03ab3f30ae52e5973779.1347976732.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkd94nXLaZVWy4L9SVB9tY86mg+g/aDw0Km/RlWrrrRVXel4IfHvV8AltGCZGf321sh59q7
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg svn: respect to the arch priority
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
X-List-Received-Date: Fri, 21 Sep 2012 14:35:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 sep. 2012, om 17:25 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:

> This is for fixing the problem:
> 1) bitbake core-image-sato-sdk with MACHINE=3Dqemux86
> 2) bitbake core-image-sato with with MACHINE=3Dcrownbay
>=20
> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but =
several
> i586 packages will be installed into crownbay's rootfs though there =
are
> core2 packages. For example, there are:
>=20
> xserver-xorg*_1.11.2-r7_i586.ipk
> xserver-xorg*_1.9.3-r1_core2.ipk
>=20
> The crownbay.conf says:
> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>=20
> What the crownbay's image needs is xserver-xorg*_1.9.3-r1_core2.ipk, =
but
> the xserver-xorg*_1.11.2-r7_i586.ipk will be installed, this is
> incorrect.

So what happens when I force crownbay to use i586 as package arch? Are =
you still going to argue that 1.9.3 should be installed?

>=20
> This is caused by opkg's selecting mechanism: when more than one
> candidate is found, it will use the higher version one and ignore the
> arch priority.
>=20
> we have several conf files which set the PREFERRED_VERSION_pkg =3D =
"..." ,
> but there is no such a mechanism which can let us tell the opkg to
> install the preferred version. When the preferred version is higher,
> this is OK, but if the preferred version is lower, there would be
> problems:
>=20
> 1) Most of the packages are core2 in the image, but several of them =
are
>   i586, though we have built the core2 ones, this seems strange.
>=20
> 2) What's worse is that the image may not work since the preferred
>   version pkg is not installed.
>=20
> We have set the arch priority clearly in the opkg.conf, I think that
> respect to the arch priority is reasonable during the image =
generation.
>=20
> Add the "--select-higher-version" option to let the user have another
> choice, the default is no.

The default should be yes, since that is the default behaviour right =
now. You can set it to 'no' in rootfs_ipk.bbclass, though.=


