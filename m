Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ss7VE-0003wF-IW
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:19:56 +0200
Received: by wgbdr1 with SMTP id dr1so3085363wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 00:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=15Pli9QPGjVNvdZGTPB4g4dy20TKETCGoj24fNR0n7w=;
	b=AlpNe16EFmHDOir/mGvV7Ksavb4Kntd7YHTydbBEbSFdNAqJafLpXLFr9Kjoc3BU0K
	jWAIat1K2EqxCNkg4GaUnrdknCCuFP6vutoXndfAF6vtSlF5qyzLYnxyJE6Wr/sM9ZV6
	JjMRLuaBhYDD5C5IfdzcokT74LfYsTwf4PXENLfW+poa8pFikaeIlSSRZjTPhRonZePm
	HJ3zBoI9W8HN6BC9h3hilJTMkv4ruvw3UNqTMaPeLQQK6CY4M1xCHRWhGJtGaKuGi+FE
	tjBDQBuqLOFCLu3OaEf7ySwKO0bnd6+R55fKJYjVB3B91r3oU5KcBnQk7TXD5IYH9ucg
	rn1g==
Received: by 10.180.94.164 with SMTP id dd4mr21370159wib.1.1342768113958;
	Fri, 20 Jul 2012 00:08:33 -0700 (PDT)
Received: from [172.20.3.200] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c7sm9881030eem.9.2012.07.20.00.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 00:08:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jul 2012 09:08:29 +0200
Message-Id: <ABA95944-0903-4822-8B44-B2B2922F4028@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQksDqx8Dmr+1rtEunpQavONPLQNq3JPcxanFdiN6R6BeJPn+KnGYJBkJavmvgf4CU9ef6WX
Subject: TUNE_FEATURES not reported correctly in pre-build summary
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
X-List-Received-Date: Fri, 20 Jul 2012 07:19:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've been experimenting with hardfloat in oe-core (all the previous hf =
angstrom builds were still using oe-classic) and I noticed that the =
build summary at the start is incorrect:

[koen@revo Angstrom]$ MACHINE=3Dbeaglebone bitbake -u knotty2 bash
[..]
Build Configuration:
BB_VERSION        =3D "1.15.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beaglebone"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2012.07-core"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"

[koen@revo Angstrom]$ MACHINE=3Dbeaglebone bitbake -u knotty2 bash -e | =
grep TUNE_FEATURES\=3D
# TUNE_FEATURES=3D${TUNE_FEATURES_tune-${DEFAULTTUNE}}
TUNE_FEATURES=3D"armv7a vfp neon callconvention-hard cortexa8"

It does seem to build the right things:

[koen@revo Angstrom]$ dpkg-deb -c =
build/tmp-angstrom_v2012_x-eglibc/deploy/ipk/armv7ahf-vfp-neon/libc6_2.15-=
r12+svnr19294_armv7ahf-vfp-neon.ipk  | grep hf
lrwxrwxrwx root/root         0 2012-07-20 03:22 =
./lib/ld-linux-armhf.so.3 -> ld-2.15.so

So why is TUNE_FEATURES not reported correctly in the build banner?

regards,

Koen=


