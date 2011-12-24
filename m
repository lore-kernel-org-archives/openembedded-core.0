Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReMoo-0003Zc-8b
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 09:19:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Dec 2011 00:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105662813"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2011 00:11:51 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 16:11:50 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 16:11:49 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 10/14] valgrind: upgrade to 3.7.0
Thread-Index: AQHMwZKFpOEHBlmArUOeO8Smy+VHtpXqpCfA
Date: Sat, 24 Dec 2011 08:11:48 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0104D9@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<f4d948b417c0d1c7d7d7098ccd7a81278cea5328.1324657801.git.shane.wang@intel.com>
	<72958AC8-1096-4668-8255-A1CE75DF4BDD@dominion.thruhere.net>
In-Reply-To: <72958AC8-1096-4668-8255-A1CE75DF4BDD@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 10/14] valgrind: upgrade to 3.7.0
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
X-List-Received-Date: Sat, 24 Dec 2011 08:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> .../valgrind/valgrind-3.7.0/configure-fix.patch    |   23
>> ++++++++++++++++++++ .../fix_issue_caused_by_ccache.patch             =20
>> |    0 .../fix_unsupporting_kernel_3.patch                |    0
>> .../fixed-perl-path.patch                          |    0
>> .../{valgrind_3.6.1.bb =3D> valgrind_3.7.0.bb}       |   13 ++++++----- =
5
>> files changed, 30 insertions(+), 6 deletions(-) create mode 100644
>> meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
>> rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D>
>> valgrind-3.7.0}/fix_issue_caused_by_ccache.patch (100%) rename
>> meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D>
>> valgrind-3.7.0}/fix_unsupporting_kernel_3.patch (100%) rename
>> meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D>
>> valgrind-3.7.0}/fixed-perl-path.patch (100%) rename
>> meta/recipes-devtools/valgrind/{valgrind_3.6.1.bb =3D> valgrind_3.7.0.bb=
}
>> (71%)
>>=20
>> diff --git
> a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
> b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
>> new file mode 100644 index 0000000..f57897c --- /dev/null +++
>> b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch @@
>> -0,0 +1,23 @@ +To recognize gcc version from poky in configure.in +
>> +Upstream-Status: Inappropriate [configuration] + +Signed-off-by: Shane
>> Wang <shane.wang@intel.com> + +diff -r 91a8df96084a configure.in +---
>> a/configure.in	Fri Dec 23 20:57:01 2011 +0800 ++++ b/configure.in	Fri
>> Dec 23 20:59:21 2011 +0800 +@@ -104,11 +104,13 @@ + # + #
>> i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot
>> 3) + # i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple
>> Inc. build 5658) (LLVM build 2335.15.00) ++# i586-poky-linux-gcc (GCC)
>> 4.6.3 (prerelease) Copyright + # + [gcc_version=3D`${CC} --version \ +  =
=20
>>           | head -n 1 \ +              | $SED 's/i686-apple-darwin10//'
>> \ +              | $SED 's/i686-apple-darwin11//' \ ++             |
>> $SED 's/.*poky[^0-9]*//' \
>=20
> Either change this to work with every TARGET_VENDOR or put it in the poky
> layer as bbappend.

Understood.

--
Shane


