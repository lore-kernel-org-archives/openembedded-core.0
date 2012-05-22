Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWmWS-0005do-D2
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:41:00 +0200
Received: by eekd49 with SMTP id d49so1903719eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kkabCpy35iYYFxFOsjnX95wRQvk003tg+Q3ygy3qylE=;
	b=QmXMeA6SYOSVAt4f86vkfRb6RHwAyB93BMQzLsAP2SkRaEivshFvyb2hjPLxMNPr+0
	9d+qro6/1dxT3A0kcwFs/KemY9KaNbZlAiYc/LtfT/qFMGSgVne4wz2nqgGHoqMWHz80
	zhjETp4rTepfHDRfcH86XJ4lL3dFpYBiRxAfkoXX0S3rP7E//23rNUr82FrVYXJN7J0l
	cMD2J7UayyWAX4XpAc+xaAPoR/4UrldYkZNz4DGwfLkLsXdhHO2OB3obX/wiHKc+Dcmy
	I/vbFP5SpS60bUigty0j1mHUhpw5KlMQyIYNo1jF33KoXzZ0hK60md8430X+Vi1E/O5e
	dhjg==
Received: by 10.213.8.73 with SMTP id g9mr1796835ebg.87.1337682651793;
	Tue, 22 May 2012 03:30:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u7sm96698617eeb.7.2012.05.22.03.30.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 May 2012 03:30:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <dc94c1bb359b466c779a11fd8559851a8c6ea5d2.1337681343.git.liezhi.yang@windriver.com>
Date: Tue, 22 May 2012 12:30:49 +0200
Message-Id: <23F3463C-1206-424C-B269-6D87EA479D57@dominion.thruhere.net>
References: <cover.1337681343.git.liezhi.yang@windriver.com>
	<dc94c1bb359b466c779a11fd8559851a8c6ea5d2.1337681343.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnsymF0s9r3H0n4gB5/NrbqN5cvjyC9WrrPh/uFGjWo1CgRlw4w/sb3UKHVm7IrO5rhZNPd
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] tune-core2.inc: PACKAGE_EXTRA_ARCHS causes wrong packages install into image
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
X-List-Received-Date: Tue, 22 May 2012 10:41:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mei 2012, om 12:15 heeft Robert Yang het volgende geschreven:

> There is a bug if we:
> 1) bitbake diffutils with MACHINE=3Dcrownbay
> 2) bitbake diffutils with MACHINE=3Dqemux86
> 3) bitbake core-image-sato with MACHINE=3Dcrownbay
>=20
> Then the diffutils.i586 would be installed to the crownbay's image, =
this
> is because diffutils.i586 is newer than diffutils.core2, both of
> deploy/rpm/i586 and deploy/rpm/core2 are in the dbpath, so rpm will
> select the newer one (diffutils.i586). This caused by:
>=20
> PACKAGE_EXTRA_ARCHS_tune-core2 =3D "${PACKAGE_EXTRA_ARCHS_tune-x86} =
i386 i486 i586 i686 core2"
>=20
> The PACKAGE_EXTRA_ARCHS will cause the deploy/rpm/i586 in the =
crownbay's
> dbpath, so any pkg which is needed by the image of both crownbay and
> qemux86, if the i586 one is newer than the core2, it would be =
installed
> into crownbay's image.

This is a bug in RPM not respecting the arch priorities. Changing =
PACKAGE_EXTRA_ARCHS is the wrong way to 'fix' that.=


