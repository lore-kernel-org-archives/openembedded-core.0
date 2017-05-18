Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EBEA678080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 13:20:43 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dBLMC-0001x1-Hv from Awais_Belal@mentor.com ;
	Thu, 18 May 2017 06:20:44 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 18 May 2017 14:20:41 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Thu, 18 May 2017 14:20:41 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHELL
	as desired
Thread-Index: AQHSz6MW7Q5pe3J2J0SZSGZTFD/7BaH5nyEAgAAUlwCAAD5Uz4AAA66AgAActU4=
Date: Thu, 18 May 2017 13:20:41 +0000
Message-ID: <1495113640541.39546@mentor.com>
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
	<a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
	<1495106583673.65036@mentor.com>,
	<62eacb9b-662a-c259-0bbf-364c488cb194@linux.intel.com>
In-Reply-To: <62eacb9b-662a-c259-0bbf-364c488cb194@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
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
X-List-Received-Date: Thu, 18 May 2017 13:20:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I just checked why is autogen in oe-core in the first place. The only=0A=
> thing that needs it now is grub, and it will no longer be necessary when=
=0A=
> Khem's grub 2.02 patch shows up in master. So then we can remove the=0A=
> whole thing. But thanks for fixing! :)=0A=
=0A=
I went through Khem's grub2 changes: http://cgit.openembedded.org/openembed=
ded-core-contrib/commit/?h=3Dkraj/master&id=3D0af89270aa83d6ad0a4859e18643b=
53191567c8b and in those changes the grub2.inc still reads=0A=
=0A=
DEPENDS =3D "flex-native bison-native autogen-native"=0A=
=0A=
So I think this can be valuable :)=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Thursday, May 18, 2017 5:32 PM=0A=
To: Belal, Awais; Robert Yang; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHEL=
L as desired=0A=
=0A=
On 05/18/2017 02:23 PM, Belal, Awais wrote:=0A=
>> That's right. The file is generated from libopts.def in the same=0A=
>> directory. I now looked at the code finally :) and I think it's=0A=
>> better to leave the POSIX_SHELL variable alone (and not set it from=0A=
>> the recipe either because it has no effect), and go back to the=0A=
>> original idea of patching the place where it's used to make a=0A=
>> shebang line - I think there's only one such place in the source=0A=
>> code.=0A=
>=0A=
>> But fixing libopts.def is okay too, I just think it's more=0A=
>> trouble.=0A=
>=0A=
> The usage of libopts.def has been deprecated upstream:=0A=
> git://git.sv.gnu.org/autogen.git #=0A=
> 5cbe233387d7f7b36752736338d1cd4f71287daa but they've still kept=0A=
> libopts.m4 so I think this patch will do for future use as well and=0A=
> shouldn't have a problem.=0A=
=0A=
I just checked why is autogen in oe-core in the first place. The only=0A=
thing that needs it now is grub, and it will no longer be necessary when=0A=
Khem's grub 2.02 patch shows up in master. So then we can remove the=0A=
whole thing. But thanks for fixing! :)=0A=
=0A=
Alex=0A=

