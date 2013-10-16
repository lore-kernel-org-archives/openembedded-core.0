Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EEA6260EE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 09:45:09 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id b13so424856wgh.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 02:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=SH3u+19p2FULPdImz7Xd9Sw1vsGNjO5+K0X/MvPF4vo=;
	b=L/jiigt+sQuW/Ucml6ol23uJb8Mlgzi1qQY2FIOSRN4DqQFfu7xxKhnpiTAxIGZmpq
	ZkFXH0iUpxhhNftkC4xGO7X6kiUB/soTxgU03qXFgWwrKT5ccDmwK9hyO2CAkxqnQ2Qt
	IiUchfzOZHBCzjHso/gEe4R+AQctUKckwSyy4PQUtvObQyB45gu6zxAxxJ8sQs6ci1iY
	ZOXWXSqTD2wH02FDPvTHMSh4V/ImZOsZuNG7TgpwyGe0wkpOprrYMaXD4/OzLyni6O5E
	vDat4cAdmdV4GQRWC9od0/OBtbt/23IU4Uuoh7tK/Pmw4R35Xr5GbplsK4EZZrb2L9Sk
	qiRQ==
X-Gm-Message-State: ALoCoQnmqMBmQiJjyqspxgxdrprelR+M/f48gbzEj1/xTirEAT3ISt45Y5HIyeWkAiH8EEivMTnJ
X-Received: by 10.180.37.162 with SMTP id z2mr1478591wij.58.1381916710884;
	Wed, 16 Oct 2013 02:45:10 -0700 (PDT)
Received: from ?IPv6:2001:610:612::403c:b6ec:4247:e13f?
	([2001:610:612:0:403c:b6ec:4247:e13f])
	by mx.google.com with ESMTPSA id i8sm4163795wiy.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 02:45:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381915225.3917.45.camel@x121e.pbcl.net>
Date: Wed, 16 Oct 2013 11:45:09 +0200
Message-Id: <F0F67306-673E-44CE-89E0-AF69E586100B@dominion.thruhere.net>
References: <1381908355-18124-1-git-send-email-koen@dominion.thruhere.net>
	<1381915225.3917.45.camel@x121e.pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1508)
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
X-List-Received-Date: Wed, 16 Oct 2013 09:45:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 okt. 2013, om 11:20 heeft Phil Blundell <pb@pbcl.net> het volgende =
geschreven:

> On Wed, 2013-10-16 at 09:25 +0200, Koen Kooi wrote:
>> From: Koen Kooi <koen.kooi@linaro.org>
>>=20
>> This enables aes and sha1 assembly at buildtime. Openssl does a
>> runtime check to see which portion gets enabled.
>=20
> [...]
>=20
>> Algo    blocksize       ops/s after
>>                ops/s before    difference
>> -------------------------------------------
>> MD5	16	308,766	264,664	-14.28%
>> 	64	277,090	263,340	-4.96%
>> 	256	212,652	197,043	-7.34%
>> 	1024	103,604	100,157	-3.33%
>> 	8192	17,936	17,796	-0.78%
>=20
> Do you know why it's causing MD5 to get slower?  I guess md5 with
> blocksize=3D16 is not a very common case, but still.

I really don't know and it is the only algo that gets a lot slower. This =
patch is a preparation for (more) NEON optimizations which seem to fix =
the regression, see

	=
https://docs.google.com/spreadsheet/ccc?key=3D0AhgZ33Tf6eBldHVONjRXRnItWld=
4eFlRWTJ3RzVIdGc&usp=3Dsharing

and

	=
http://dominion.thruhere.net/koen/angstrom/0002-openssl-1.0.1e-add-ARMv7-A=
ES-optimizations.patch

I need to test that patch on A9 and A15 cores as well since it doesn't =
seem to do a lot on A8 cores :(

> Also, it seems generally a bit unwholesome for openssl to be picking =
its
> own CFLAGS at all.  Would it be better to just make it use the same
> CFLAGS as everything else?

openssl.inc already pokes at CLAG(S):

CFLAG =3D "${@base_conditional('SITEINFO_ENDIANNESS', 'le', =
'-DL_ENDIAN', '-DB_ENDIAN', d)} \
        -DTERMIO ${CFLAGS} -Wall -Wa,--noexecstack"

The complete command looks like this:

arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb-interwork =
-mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 =
--sysroot=3D/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/be=
aglebone -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS =
-D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN  -DTERMIO  -O2 -pipe =
-g -feliminate-unused-debug-types -Wall -Wa,--noexecstack =
-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_BN_ASM_MONT =
-DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM =
-DBSAES_ASM -DGHASH_ASM -c   -c -o armv4cpuid.o armv4cpuid.S

So the '$cflags       =3D -DTERMIO -O3 -Wall' in linux-armv4 gets =
overridden by OE, just like we want :)

regards,

Koen=

