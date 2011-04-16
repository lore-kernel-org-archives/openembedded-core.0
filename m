Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBBUL-0002fl-K1
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 21:49:01 +0200
Received: by wye20 with SMTP id 20so3386118wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2011 12:46:42 -0700 (PDT)
Received: by 10.227.71.200 with SMTP id i8mr3290090wbj.176.1302983202304;
	Sat, 16 Apr 2011 12:46:42 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z13sm2325238wbd.29.2011.04.16.12.46.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 12:46:39 -0700 (PDT)
References: <cover.1302936483.git.sgw@linux.intel.com>
	<4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>
	<5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
In-Reply-To: <5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <A377F56D-F244-4BBE-8004-37CCCB477F26@dominion.thruhere.net>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 16 Apr 2011 21:46:34 +0200
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 47/58] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Sat, 16 Apr 2011 19:49:01 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

furthermore both distutils and setuptools use the classes in sysroot, so the=
 'some versions' part of the argument is bogus.

Op 16 apr. 2011 om 14:11 heeft Koen Kooi <koen@dominion.thruhere.net> het vo=
lgende geschreven:

> As I said in my other mail, the reasoning behind this patch is wrong and w=
ill lead to broken output. The '--single-version-externally-managed' is need=
ed to stop the python egg code from doing the wrong thing. People running in=
to problems with this need to do 'inherit distutils' instead of 'inherit set=
uptools'.
>=20
> Besides all that, 'DISTUTILS_INSTALL_EXTRA_ARGS' would be the correct name=
 for such a thing.
>=20
> Op 16 apr 2011, om 08:55 heeft Saul Wold het volgende geschreven:
>=20
>> From: Gary Thomas <gary@mlbassoc.com>
>>=20
>> The setuptools class uses hard-wired options for 'setup.py' during
>> the install step.  In particular, not all versions of setup.py
>> support the "--single-version-externally-managed" option.  This
>> patch allows for a recipe to easily override these options, while
>> leaving the majority (important) setup options intact.
>>=20
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>=20
>>> =46rom 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 2001=

>> From: Gary Thomas <gary@mlbassoc.com>
>> Date: Wed, 13 Apr 2011 15:12:57 -0600
>> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>>=20
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> meta/classes/setuptools.bbclass |    3 ++-
>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bb=
class
>> index ced9509..cf1c224 100644
>> --- a/meta/classes/setuptools.bbclass
>> +++ b/meta/classes/setuptools.bbclass
>> @@ -2,7 +2,8 @@ inherit distutils
>>=20
>> DEPENDS +=3D "python-setuptools-native"
>>=20
>> +DISTUTILS_INSTALL_OPTS ?=3D "--single-version-externally-managed "
>> DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
>> -    --single-version-externally-managed \
>> +    ${DISTUTILS_INSTALL_OPTS} \
>>    --prefix=3D${prefix} \
>>    --install-data=3D${datadir}"
>> --=20
>> 1.7.1.1
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20


