Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A82D86CB97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 05:54:37 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id cb5so367024wib.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 22:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=K3PfVQjB719H0V+AQAmYXPbJq+6Zw/S99vq8PAgqvUY=;
	b=HZ2Cq7F0YJJ4P1uFwZw8E7uf5kBkaV/p6Fa/DPxAbFMRy1/k96DzE9kCCjsTA5fiIg
	eG6YQEfkP9bBniK6hCecJfpTHGoq0cx1VokZm0GqHsauPNKND32kWp7RcdrmRGULh+Ob
	3MuxjFVWE+F9qMO/EtTZlQHFPQddaTYlmCVJ4xvjor/A3bJYPId6Uvfq6mxoxEOWU91d
	qXqdh1P3+OVXYxNlyGUv1OuwyQ6WWfogtadCCWhvSCCIYeJ+iV/Ck8XaO1KGESPtLwv+
	BvLtATKUbBD7vpt5Ap723AdCYu40370PcoYcNLGxliA32HpMaMcjeTr1O9JpXgA2v4TK
	mXgQ==
X-Gm-Message-State: ALoCoQneWVAYkpFtGeJLJ+01eTccHFvIQrUgwo+A0mtx9hYxYtad+Dv5pRMyizSvs+KgdB/GYRvi
X-Received: by 10.180.210.146 with SMTP id mu18mr27635942wic.10.1381989278701; 
	Wed, 16 Oct 2013 22:54:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d8fe:c7b9:c53c:b172?
	([2001:610:612:0:d8fe:c7b9:c53c:b172])
	by mx.google.com with ESMTPSA id
	ft19sm12557884wic.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 22:54:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <F0F67306-673E-44CE-89E0-AF69E586100B@dominion.thruhere.net>
Date: Thu, 17 Oct 2013 07:54:36 +0200
Message-Id: <28E594D0-D5DB-4D75-B4EB-DC1A0A21FC41@dominion.thruhere.net>
References: <1381908355-18124-1-git-send-email-koen@dominion.thruhere.net>
	<1381915225.3917.45.camel@x121e.pbcl.net>
	<F0F67306-673E-44CE-89E0-AF69E586100B@dominion.thruhere.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] openssl: switch ARM builds from linux-elf-arm to linux-armv4 config
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
X-List-Received-Date: Thu, 17 Oct 2013 05:54:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 okt. 2013, om 11:45 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 16 okt. 2013, om 11:20 heeft Phil Blundell <pb@pbcl.net> het =
volgende geschreven:
>=20
>> On Wed, 2013-10-16 at 09:25 +0200, Koen Kooi wrote:
>>> From: Koen Kooi <koen.kooi@linaro.org>
>>>=20
>>> This enables aes and sha1 assembly at buildtime. Openssl does a
>>> runtime check to see which portion gets enabled.
>>=20
>> [...]
>>=20
>>> Algo    blocksize       ops/s after
>>>               ops/s before    difference
>>> -------------------------------------------
>>> MD5	16	308,766	264,664	-14.28%
>>> 	64	277,090	263,340	-4.96%
>>> 	256	212,652	197,043	-7.34%
>>> 	1024	103,604	100,157	-3.33%
>>> 	8192	17,936	17,796	-0.78%
>>=20
>> Do you know why it's causing MD5 to get slower?  I guess md5 with
>> blocksize=3D16 is not a very common case, but still.
>=20
> I really don't know and it is the only algo that gets a lot slower. =
This patch is a preparation for (more) NEON optimizations which seem to =
fix the regression, see
>=20
> 	=
https://docs.google.com/spreadsheet/ccc?key=3D0AhgZ33Tf6eBldHVONjRXRnItWld=
4eFlRWTJ3RzVIdGc&usp=3Dsharing
>=20
> and
>=20
> 	=
http://dominion.thruhere.net/koen/angstrom/0002-openssl-1.0.1e-add-ARMv7-A=
ES-optimizations.patch
>=20
> I need to test that patch on A9 and A15 cores as well since it doesn't =
seem to do a lot on A8 cores :(

And on A9 cores linux-armv4 is 20% *faster* on MD5 with blocksize=3D16, =
see spreadsheet above. So it probably is a scheduling issue that favours =
A9 cores.

regards,

Koen.


>=20
>> Also, it seems generally a bit unwholesome for openssl to be picking =
its
>> own CFLAGS at all.  Would it be better to just make it use the same
>> CFLAGS as everything else?
>=20
> openssl.inc already pokes at CLAG(S):
>=20
> CFLAG =3D "${@base_conditional('SITEINFO_ENDIANNESS', 'le', =
'-DL_ENDIAN', '-DB_ENDIAN', d)} \
>        -DTERMIO ${CFLAGS} -Wall -Wa,--noexecstack"
>=20
> The complete command looks like this:
>=20
> arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb-interwork =
-mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 =
--sysroot=3D/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/be=
aglebone -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS =
-D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN  -DTERMIO  -O2 -pipe =
-g -feliminate-unused-debug-types -Wall -Wa,--noexecstack =
-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_BN_ASM_MONT =
-DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM =
-DBSAES_ASM -DGHASH_ASM -c   -c -o armv4cpuid.o armv4cpuid.S
>=20
> So the '$cflags       =3D -DTERMIO -O3 -Wall' in linux-armv4 gets =
overridden by OE, just like we want :)
>=20
> regards,
>=20
> Koen


