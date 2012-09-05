Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9Cfo-0002n0-86
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 12:17:28 +0200
Received: by wgbdr1 with SMTP id dr1so375092wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 03:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BdwnxfSRQy0kHaGHGizRHfgDzSGZrCHXgBGWz5d600Y=;
	b=LuzhIektYEGnmRDRjnmYSPQPvVhnJu+qbPjmNRDqAiCS1z7Erhd+66KtSw38pKC9DX
	VmWrSFvGxJvrlnI4qMJZobLjvi4cdU44BkM4umf7tsUnXtvaQOIwa2vWp9jPP+IPTC6C
	JNGUdPeJIE+ezX4ao30LsvU2T9gTJDCF4BnC3cILCHswverLtPD6W7l8J1K8uPvnRhEk
	EKxRHW7hrx/i21pgV6wgZX55hrOzl6nOleQ7J1n3v0+BKBUYA8vGK9wOvLE4ZPtcXH6P
	k99Nnf5UYt6AWSFzTiZ76P1fDm5EQvJtLdI6gDP4SEkN/nD0vI9iw7BSKtFlP0ArSQf0
	x0Zw==
Received: by 10.180.95.193 with SMTP id dm1mr37059468wib.10.1346839505342;
	Wed, 05 Sep 2012 03:05:05 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id l5sm3437116wix.5.2012.09.05.03.05.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 03:05:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
Date: Wed, 5 Sep 2012 12:05:03 +0200
Message-Id: <32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnzoRIE/Acl3CTMtVI2XK6FSZBPvucUWrrDPzQIA7QflVd7UXSFi8q4M6SifqKQCsPyC+wC
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
X-List-Received-Date: Wed, 05 Sep 2012 10:17:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 sep. 2012, om 11:31 heeft Robert Yang <liezhi.yang@windriver.com> =
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
> xserver-xorg_1.11.2-r4_i586.ipk
> xserver-xorg_1.9.3-r1_core2.ipk
>=20
> The crownbay.conf says:
> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>=20
> What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, =
but
> the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
> incorrect.

It is the correct behaviour, though.

> This is caused by opkg's selecting mechanism: when more than one
> candidate is found, it will use the higher version one and ignore the
> arch priority.

As expected and wanted.

> we have several conf files which set the PREFERRED_VERSION_pkg =3D =
"..." ,
> but there is no such a mechanism which can let us tell the opkg to
> install the preferred version.

As pointed out before, your DISTRO needs to fix this and you should NOT =
break opkg in the way you are doing now.=20=


