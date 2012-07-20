Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SsKO2-0000NJ-3k
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 23:05:22 +0200
Received: by weyr6 with SMTP id r6so2800672wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AsMb93cwFreRrV8MamnM5D0yUjxPbeXDhcPBVDVFyhI=;
	b=A2Atfl9xDs7kidBmWGpUfmsXVCnYkP7T4tiBNSzhA6zqq4/BK109jJAKi3PznoFvHJ
	o/REg9KBgau8LRwd68/1SOxce9ogcg7Oo7fuVOM0fHkwh8GiKbB3/zieTQAoSh1emE2q
	2HzToPcrBraL6CvU6nEavfDo9tOORGJ77PvcDnPyS+4Gp8HPuj6Cv/u//wlihZqkDdtA
	tuX6vMZh2Kq/vff+/VWqs1/1lsP6aa7BTVjiTTu7OQReL6LsxvG2OG2EweJtSm5lePet
	Adq6U7+jbYp+I3DDIHm4KLIkHumNjJkL2ugytLeHQeg7qxwVf2/l7/yQt0HXkqu91GG+
	uh2Q==
Received: by 10.217.6.194 with SMTP id y44mr4349942wes.27.1342817638510;
	Fri, 20 Jul 2012 13:53:58 -0700 (PDT)
Received: from [10.47.213.33] ([92.69.199.181])
	by mx.google.com with ESMTPS id cl8sm46980612wib.10.2012.07.20.13.53.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 13:53:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1342801883.21788.44.camel@ted>
Date: Fri, 20 Jul 2012 22:53:54 +0200
Message-Id: <C5CB359C-0454-4C3C-B97E-417BF85218B1@dominion.thruhere.net>
References: <ABA95944-0903-4822-8B44-B2B2922F4028@dominion.thruhere.net>
	<1342801883.21788.44.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlHKqcFjVZrL/ln5PEenAlF+sPlcV6+03V5GoXpPaYfiyyWVCJpb5M2oylcdeOMoFzxvJog
Subject: Re: TUNE_FEATURES not reported correctly in pre-build summary
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
X-List-Received-Date: Fri, 20 Jul 2012 21:05:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jul. 2012, om 18:31 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-07-20 at 09:08 +0200, Koen Kooi wrote:
>> Hi,
>>=20
>> I've been experimenting with hardfloat in oe-core (all the previous =
hf angstrom builds were still using oe-classic) and I noticed that the =
build summary at the start is incorrect:
>>=20
>> [koen@revo Angstrom]$ MACHINE=3Dbeaglebone bitbake -u knotty2 bash
>> [..]
>> Build Configuration:
>> BB_VERSION        =3D "1.15.3"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "beaglebone"
>> DISTRO            =3D "angstrom"
>> DISTRO_VERSION    =3D "v2012.07-core"
>> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>> TARGET_FPU        =3D "vfp-neon"
>>=20
>> [koen@revo Angstrom]$ MACHINE=3Dbeaglebone bitbake -u knotty2 bash -e =
| grep TUNE_FEATURES\=3D
>> # TUNE_FEATURES=3D${TUNE_FEATURES_tune-${DEFAULTTUNE}}
>> TUNE_FEATURES=3D"armv7a vfp neon callconvention-hard cortexa8"
>>=20
>> It does seem to build the right things:
>>=20
>> [koen@revo Angstrom]$ dpkg-deb -c =
build/tmp-angstrom_v2012_x-eglibc/deploy/ipk/armv7ahf-vfp-neon/libc6_2.15-=
r12+svnr19294_armv7ahf-vfp-neon.ipk  | grep hf
>> lrwxrwxrwx root/root         0 2012-07-20 03:22 =
./lib/ld-linux-armhf.so.3 -> ld-2.15.so
>>=20
>> So why is TUNE_FEATURES not reported correctly in the build banner?
>=20
> Good question. How are you selecting callconvention-hard?

=46rom memory, the router on the other end crashed: =
DEFAULTTUNE_beaglebone =3D "cortexa8hf" in local.conf

regards,

Koen=


