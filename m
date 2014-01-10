Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 411A260EB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:33:50 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id en1so4963252wid.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=VocBRejE6m9Lj/olpe2FNORfmaAkjciPZOjFo9Od5SI=;
	b=DXzXMwHYMqfipvrDiQS9esggVJT3+I2fbokKy1vgOZxVPcXfjlxjx2UsbZSuG/M3kT
	5iDso8aj+BDNFi4AWwgnlxiheBgfYSBlPMmzouZUamJQlyizqo49vRIFb7RZZtKC0O2b
	CLlB/h5SOq8aWeFcsjzf+jryXJir+TAeovu0gO/tyNJGFAPGrUxzLVSH+KWsSKO3hYiv
	1wulLdDlJx8U24PUVrOR6XkpF3Jgi20xzXrfKGZThPIdNSQKG84WxSfGXwfrcoWMkEzx
	rVeiTb6cbn+gqge+lR5Kg9lNM/1AVQjbgKr/3DTMsEbDFZv4ZR7058NxZ0FKb1E76vRB
	3AHg==
X-Gm-Message-State: ALoCoQkSO6ZAyaJzneGK+Z6/4+D1rg2gYbt5lFsVKYHKrhFxk5cIapFpqcAdrxBtnQ0tASQ5irrw
X-Received: by 10.194.90.41 with SMTP id bt9mr1598262wjb.90.1389368027502;
	Fri, 10 Jan 2014 07:33:47 -0800 (PST)
Received: from ?IPv6:2001:610:612::8a3:c61f:3459:ab7a?
	([2001:610:612:0:8a3:c61f:3459:ab7a])
	by mx.google.com with ESMTPSA id po3sm4411179wjc.3.2014.01.10.07.33.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jan 2014 07:33:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2B9C97B395470A40B9E9E5D469BCD9FA01561532@EU-MBX-03.mgc.mentorg.com>
Date: Fri, 10 Jan 2014 16:33:34 +0100
Message-Id: <A55D17AE-AD06-4296-805E-55B822E27858@dominion.thruhere.net>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>,
	<52C5B458.5060409@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
	<C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>,
	<D570F160-9E98-4C99-BCE3-BDB6123DBDDC@dominion.thruhere.net>
	<2B9C97B395470A40B9E9E5D469BCD9FA01561532@EU-MBX-03.mgc.mentorg.com>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Fri, 10 Jan 2014 15:33:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jan. 2014, om 08:48 heeft Arslan, Fahad <Fahad_Arslan@mentor.com> =
het volgende geschreven:

>> def get_speex_fpu_setting(bb, d):
>>       if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>>               return "--enable-fixed-point --disable-float-api =
--disable-vbr"
>>       return ""
>=20
> If we are using Pulseaudio with default settings (speex-float-1) and=20=

> the if condition in above method is evaluated true, we will end up =
facing=20
> the original issue: streams that need to be resampled are not =
playedback=20
> since input to speex is zeroed out when float input passed by =
Pulseaudio=20
> in range of +/-1 is converted to int.
>=20
> So isn't Case 2 appropriate, thoughts?

It's also 10-50x slower on ARM, so always enabling float is a bad =
option. Just patch it to work, no matter what upstream says :)


>=20
> Regards,
> Fahad
>=20
> ________________________________________
> From: Koen Kooi [koen@dominion.thruhere.net]
> Sent: Tuesday, January 07, 2014 3:22 PM
> To: Arslan, Fahad
> Cc: Saul Wold; openembedded-core@lists.openembedded.org; =
marcin@juszkiewicz.pl
> Subject: Re: [OE-core] [PATCH] pulseaudio: rescale input being passed =
to float method of speex
>=20
> Marcins linaro mail address has expired, adding the other one
>=20
> Op 7 jan. 2014, om 11:03 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>=20
>>=20
>> Op 7 jan. 2014, om 10:59 heeft Arslan, Fahad =
<Fahad_Arslan@mentor.com> het volgende geschreven:
>>=20
>>>> What affect does it have on the overall size of speex
>>>=20
>>> If we enable floating point support, there is decrease in size of =
libs.
>>> libspeexdsp.so is ~480 KB in fixed point configuration
>>> libspeexdsp.so is ~220 KB in floating point configuration
>>>=20
>>> Further details are shown below:
>>>=20
>>>=20
>>> Case-1 (current configuration)
>>> =3D=3D=3D=3D=3D=3D
>>>=20
>>> EXTRA_OECONF =3D " --enable-fixed-point =
--with-ogg-libraries=3D${STAGING_LIBDIR} \
>>>               --disable-float-api --disable-vbr \
>>>               --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>>>=20
>>> build$
>>> build$ ls -l src/.libs/speex*
>>> -rwxr-xr-x 1 farslan farslan 75112 Jan  7 14:09 src/.libs/speexdec
>>> -rwxr-xr-x 1 farslan farslan 76989 Jan  7 14:09 src/.libs/speexenc
>>> build$ file src/.libs/speex*
>>> src/.libs/speexdec: ELF 32-bit LSB executable, ARM, version 1 =
(SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>>> src/.libs/speexenc: ELF 32-bit LSB executable, ARM, version 1 =
(SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>>> build$
>>> build$
>>> build$ ls -l libspeex/.libs/libspeex*.so.1.5.0
>>> -rwxr-xr-x 1 farslan farslan 484940 Jan  7 14:09 =
libspeex/.libs/libspeexdsp.so.1.5.0
>>> -rwxr-xr-x 1 farslan farslan 370309 Jan  7 14:09 =
libspeex/.libs/libspeex.so.1.5.0
>>> build$
>>> build$ file libspeex/.libs/libspeex*.so.1.5.0
>>> libspeex/.libs/libspeexdsp.so.1.5.0: ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>>> libspeex/.libs/libspeex.so.1.5.0:    ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>>> build$
>>>=20
>>>=20
>>> Case-2 (suggested configuration)
>>> =3D=3D=3D=3D=3D=3D
>>>=20
>>> EXTRA_OECONF =3D " --with-ogg-libraries=3D${STAGING_LIBDIR} \
>>>               --enable-float-api --disable-vbr \
>>>               --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>>=20
>> Or case 3, which I implemented 3 years ago in =
https://github.com/openembedded/openembedded/commit/e06553979d23531397af3d=
d71870abb80718c681 :
>>=20
>> def get_speex_fpu_setting(bb, d):
>>       if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>>               return "--enable-fixed-point --disable-float-api =
--disable-vbr"
>>       return ""
>>=20
>>=20
>> EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}
>>=20
>> That OE-classic recipe also has support for arm asm which speed =
things up a lot.
>>=20
>> regards,
>>=20
>> Koen
>=20
>=20


