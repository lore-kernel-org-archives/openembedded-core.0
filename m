Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F1D4071B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 08:50:08 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dAueo-0002m8-9b from Awais_Belal@mentor.com ;
	Wed, 17 May 2017 01:50:10 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Wed, 17 May 2017 09:50:07 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Wed, 17 May 2017 09:50:07 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen: fix autoopts script generation to
	handle shebang
Thread-Index: AQHSyyf1Z+lHkWIXCkGvAcE6jL5+q6Hwqu4AgARxwImAAB/ggIAARI/F///yioCAAP4lwIAAV1AAgAFyjsg=
Date: Wed, 17 May 2017 08:50:07 +0000
Message-ID: <1495011007241.56954@mentor.com>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>
	<d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
	<1494860635949.47847@mentor.com>
	<2f2b263c-5b85-3622-ea62-c01825da24be@linux.intel.com>
	<1494912962159.30415@mentor.com>,
	<51bb3192-0566-418f-9448-4db95e29b567@linux.intel.com>
In-Reply-To: <51bb3192-0566-418f-9448-4db95e29b567@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Wed, 17 May 2017 08:50:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> You should not patch out the use of POSIX_SHELL after the fact. Find=0A=
> where it is resolved/expanded in the source code in the first place, and=
=0A=
> patch it there. Also, please check why setting POSIX_SHELL in the recipe=
=0A=
> no longer has any effect - there is a patch called=0A=
> 0001-config-libopts.m4-regenerate-it-from-config-libopts.patch which=0A=
> should do the trick, but does not.=0A=
=0A=
I guess I see the problem now. The mechanism in libopts.m4 won't allow sett=
ing POSIX_SHELL to anything other than an actual file because it does=0A=
=0A=
test -x ${POSIX_SHELL} && break=0A=
=0A=
Now the recipe sets POSIX_SHELL to "/usr/bin/env sh" which would resolve to=
 the actual shell binary when used but itself it's just a string so the con=
dition (test -x) fails because POSIX_SHELL at that particular moment is jus=
t a string and not an executable. Moving ahead the script does=0A=
=0A=
POSIX_SHELL=3D`which bash`=0A=
=0A=
which then resolves/expands to <build-dir>/tmp/hosttools/bash and obviously=
 breaks what we're trying to achieve with "/usr/bin/env sh". I believe the =
first check in libopts.m4 for POSIX_SHELL should be changed to=0A=
=0A=
test -n ${POSIX_SHELL} && break=0A=
=0A=
So the user can set it to whatever he desires obviously he'll need to make =
sure that this would work as a proper shell. Thoughts?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Tuesday, May 16, 2017 4:32 PM=0A=
To: Belal, Awais; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen: fix autoopts script generation to h=
andle shebang=0A=
=0A=
On 05/16/2017 08:36 AM, Belal, Awais wrote:=0A=
>> The standard way to fix too long #! lines in oe is to patch=0A=
>> upstream code to use #!/usr/bin/env something (where something is=0A=
>> just the binary name).=0A=
>=0A=
>> Why not simply replace ${POSIX_SHELL} with /bin/sh? Where and how=0A=
>> is it set?=0A=
>=0A=
> POSIX_SHELL is being set to "/usr/bin/env sh" already through the=0A=
> recipe but it gets resolved/expanded to=0A=
> <build-dir>/hosttools/<shell-bin> during the configuration process so=0A=
> it's not usable for shebang in deep directory hierarchy scenarios. I=0A=
> guess a better way would be simply to use the same technique that=0A=
> we're using for perl. So for shell we'll have=0A=
>=0A=
> #!/usr/bin/env sh=0A=
>=0A=
> in mk-tpl-config.sh directly. I'll submit the change as v2 if you=0A=
> think this is okay.=0A=
=0A=
You should not patch out the use of POSIX_SHELL after the fact. Find=0A=
where it is resolved/expanded in the source code in the first place, and=0A=
patch it there. Also, please check why setting POSIX_SHELL in the recipe=0A=
no longer has any effect - there is a patch called=0A=
0001-config-libopts.m4-regenerate-it-from-config-libopts.patch which=0A=
should do the trick, but does not.=0A=
=0A=
Alex=0A=
=0A=

