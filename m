Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoPgj-00070r-Mj
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 03:56:29 +0200
Received: from mail61-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE013.bigfish.com (10.7.40.63) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 01:43:01 +0000
Received: from mail61-va3 (localhost [127.0.0.1])	by mail61-va3-R.bigfish.com
	(Postfix) with ESMTP id 8D0FB12012F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 01:43:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail61-va3 (localhost.localdomain [127.0.0.1]) by mail61-va3
	(MessageSwitch) id 1341884580381229_4076;
	Tue, 10 Jul 2012 01:43:00 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.242])	by
	mail61-va3.bigfish.com (Postfix) with ESMTP id 502ED3000D5	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 01:43:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 01:43:00 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Mon, 9 Jul 2012 20:45:17 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc: gcc-cross-canadian: use correct
	location for libraries for powerpc64
Thread-Index: AQHNXj2oZ1VR4FYoKUuj3+fC6aHLBQ==
Date: Tue, 10 Jul 2012 01:45:16 +0000
Message-ID: <CAEsOVNefUDkjnJ18H7iW4Gc+5AEmMCZuOSfox++D79REwYEjww@mail.gmail.com>
References: <1341874044-663-1-git-send-email-msm@freescale.com>
	<CAMKF1sp1n_3bXro1VWu=ziq+yMYJ18xvPYVMt9fKXo3ThZ9LHg@mail.gmail.com>
In-Reply-To: <CAMKF1sp1n_3bXro1VWu=ziq+yMYJ18xvPYVMt9fKXo3ThZ9LHg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 10 Jul 2012 01:56:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BBB5265FAAEB5D47AAB02D52EF2EC783@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 9, 2012 at 8:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jul 9, 2012 at 3:47 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
>> This fixes the issue where gcc invokes the linker with an incorrect -L
>> library location and gives up because it can't find libraries. It was
>> looking in a /lib folder instead of /lib64
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
>>  meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.7.inc
>> index 65153b3..c7dbc3c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -1,6 +1,6 @@
>>  require gcc-common.inc
>>
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>>  # Third digit in PV should be incremented after a minor release
>>  # happens from this branch on gcc e.g. currently its 4.7.1
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> index efa345f..48b9b13 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> @@ -11,6 +11,8 @@ RDEPENDS_${PN} +=3D "mpfr-nativesdk libmpc-nativesdk e=
lfutils-nativesdk"
>>  SYSTEMHEADERS =3D "/usr/include"
>>  SYSTEMLIBS =3D "/lib/"
>>  SYSTEMLIBS1 =3D "/usr/lib/"
>> +SYSTEMLIBS_powerpc64 =3D "/lib64/"
>> +SYSTEMLIBS1_powerpc64 =3D "/usr/lib64/"
>
> How about using
>
> SYSTEMLIBS =3D "${target_base_libdir}/"
> SYSTEMLIBS1 =3D "${target_libdir}/"
>
> and avoiding the override completely ?

This seems equivalent... will respin patch.

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



