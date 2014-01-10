Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B918A60C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:48:27 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1W1WpN-0000Ok-Sb from Fahad_Arslan@mentor.com ;
	Thu, 09 Jan 2014 23:48:25 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 9 Jan 2014 23:48:25 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Fri, 10 Jan 2014 07:48:24 +0000
From: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] pulseaudio: rescale input being passed to
	float method of speex
Thread-Index: AQHPALXAcs6RXqPcQEiQqEFDYqrdcJpjkBUAgAxA636AAgPcAIAHR3brgAABugCAAAVGAIAEiXbl
Date: Fri, 10 Jan 2014 07:48:22 +0000
Message-ID: <2B9C97B395470A40B9E9E5D469BCD9FA01561532@EU-MBX-03.mgc.mentorg.com>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>,
	<52C5B458.5060409@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
	<C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>,
	<D570F160-9E98-4C99-BCE3-BDB6123DBDDC@dominion.thruhere.net>
In-Reply-To: <D570F160-9E98-4C99-BCE3-BDB6123DBDDC@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Jan 2014 07:48:25.0785 (UTC)
	FILETIME=[5804F290:01CF0DD8]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"marcin@juszkiewicz.pl" <marcin@juszkiewicz.pl>
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
X-List-Received-Date: Fri, 10 Jan 2014 07:48:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>def get_speex_fpu_setting(bb, d):=0A=
>        if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:=0A=
>                return "--enable-fixed-point --disable-float-api --disable=
-vbr"=0A=
>        return ""=0A=
=0A=
If we are using Pulseaudio with default settings (speex-float-1) and =0A=
the if condition in above method is evaluated true, we will end up facing =
=0A=
the original issue: streams that need to be resampled are not playedback =
=0A=
since input to speex is zeroed out when float input passed by Pulseaudio =
=0A=
in range of +/-1 is converted to int.=0A=
=0A=
So isn't Case 2 appropriate, thoughts?=0A=
=0A=
Regards,=0A=
Fahad=0A=
=0A=
________________________________________=0A=
From: Koen Kooi [koen@dominion.thruhere.net]=0A=
Sent: Tuesday, January 07, 2014 3:22 PM=0A=
To: Arslan, Fahad=0A=
Cc: Saul Wold; openembedded-core@lists.openembedded.org; marcin@juszkiewicz=
.pl=0A=
Subject: Re: [OE-core] [PATCH] pulseaudio: rescale input being passed to fl=
oat method of speex=0A=
=0A=
Marcins linaro mail address has expired, adding the other one=0A=
=0A=
Op 7 jan. 2014, om 11:03 heeft Koen Kooi <koen@dominion.thruhere.net> het v=
olgende geschreven:=0A=
=0A=
>=0A=
> Op 7 jan. 2014, om 10:59 heeft Arslan, Fahad <Fahad_Arslan@mentor.com> he=
t volgende geschreven:=0A=
>=0A=
>>> What affect does it have on the overall size of speex=0A=
>>=0A=
>> If we enable floating point support, there is decrease in size of libs.=
=0A=
>> libspeexdsp.so is ~480 KB in fixed point configuration=0A=
>> libspeexdsp.so is ~220 KB in floating point configuration=0A=
>>=0A=
>> Further details are shown below:=0A=
>>=0A=
>>=0A=
>> Case-1 (current configuration)=0A=
>> =3D=3D=3D=3D=3D=3D=0A=
>>=0A=
>> EXTRA_OECONF =3D " --enable-fixed-point --with-ogg-libraries=3D${STAGING=
_LIBDIR} \=0A=
>>                --disable-float-api --disable-vbr \=0A=
>>                --with-ogg-includes=3D${STAGING_INCDIR} --disable-oggtest=
"=0A=
>>=0A=
>> build$=0A=
>> build$ ls -l src/.libs/speex*=0A=
>> -rwxr-xr-x 1 farslan farslan 75112 Jan  7 14:09 src/.libs/speexdec=0A=
>> -rwxr-xr-x 1 farslan farslan 76989 Jan  7 14:09 src/.libs/speexenc=0A=
>> build$ file src/.libs/speex*=0A=
>> src/.libs/speexdec: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dy=
namically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped=0A=
>> src/.libs/speexenc: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dy=
namically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped=0A=
>> build$=0A=
>> build$=0A=
>> build$ ls -l libspeex/.libs/libspeex*.so.1.5.0=0A=
>> -rwxr-xr-x 1 farslan farslan 484940 Jan  7 14:09 libspeex/.libs/libspeex=
dsp.so.1.5.0=0A=
>> -rwxr-xr-x 1 farslan farslan 370309 Jan  7 14:09 libspeex/.libs/libspeex=
.so.1.5.0=0A=
>> build$=0A=
>> build$ file libspeex/.libs/libspeex*.so.1.5.0=0A=
>> libspeex/.libs/libspeexdsp.so.1.5.0: ELF 32-bit LSB shared object, ARM, =
version 1 (SYSV), dynamically linked, not stripped=0A=
>> libspeex/.libs/libspeex.so.1.5.0:    ELF 32-bit LSB shared object, ARM, =
version 1 (SYSV), dynamically linked, not stripped=0A=
>> build$=0A=
>>=0A=
>>=0A=
>> Case-2 (suggested configuration)=0A=
>> =3D=3D=3D=3D=3D=3D=0A=
>>=0A=
>> EXTRA_OECONF =3D " --with-ogg-libraries=3D${STAGING_LIBDIR} \=0A=
>>                --enable-float-api --disable-vbr \=0A=
>>                --with-ogg-includes=3D${STAGING_INCDIR} --disable-oggtest=
"=0A=
>=0A=
> Or case 3, which I implemented 3 years ago in https://github.com/openembe=
dded/openembedded/commit/e06553979d23531397af3dd71870abb80718c681 :=0A=
>=0A=
> def get_speex_fpu_setting(bb, d):=0A=
>        if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:=0A=
>                return "--enable-fixed-point --disable-float-api --disable=
-vbr"=0A=
>        return ""=0A=
>=0A=
>=0A=
> EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}=0A=
>=0A=
> That OE-classic recipe also has support for arm asm which speed things up=
 a lot.=0A=
>=0A=
> regards,=0A=
>=0A=
> Koen=0A=
=0A=

