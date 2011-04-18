Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QBpJj-0002ga-TI
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 16:20:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Apr 2011 07:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,232,1301900400"; d="scan'208";a="735057780"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2011 07:18:21 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 18 Apr 2011 22:18:19 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 18 Apr 2011 22:18:19 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 18 Apr 2011 22:18:18 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Apr 2011 22:18:16 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: Acv9lXoIyZ8GZEG1TZKP96wiSWMcdwAB0q+g
Message-ID: <1865303E0DED764181A9D882DEF65FB690485742E4@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
In-Reply-To: <1303109647.5518.54.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Mon, 18 Apr 2011 14:20:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Mon, 2011-04-18 at 13:43 +0800, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> On Fri, 2011-04-15 at 23:54 -0700, Saul Wold wrote:
>>>> @@ -3,12 +3,14 @@ DESCRIPTION =3D "Tool that installs the GNU
>>>>  config.guess / config.sub into a direc  SECTION =3D "devel" LICENSE
>>>> =3D  "GPLv1+" LIC_FILES_CHKSUM =3D
>>>> "file://config.guess;endline=3D39;md5=3Da089987af4a25cb0419d1c2fd6d495=
e3"
>>>>  -DEPENDS =3D "" + +DEPENDS_virtclass-native =3D "perl-native" +
>>>> INHIBIT_DEFAULT_DEPS =3D "1"=20
>>>=20
>>> I haven't taken this. Having looked at the shear number of horrible
>>> perl-native issues, I'd like to take the same approach we took with
>>> the toolchain staging and place perl into its own bin directory we
>>> add to PATH when needed.
>>=20
>> If a recipe does need perl-native but we fail to realize that, the
>> host's perl (e.g. /usr/bin/perl) will be used -- this will further
>> hinder us from realizing the recipe needs perl-native.
>>=20
>> As to bug #968, the build failure happens because perl-native's
>> do_populate_sysroot has begun but hasn't finished. If perl-native
>> hasn't started to populate_sysroot, running gnu-configize won't fail
>> since host's perl will be used.
>>=20
>> so I've 3 questions:
>> 1) in poky how to exclude host's perl from PATH? need to write a
>> python function to filter out various possible host perl paths? e.g.,
>> ~/bin/perl, /usr/local/bin/perl, /usr/bin/perl, /bin/perl,... too
>> many paths...=20
>>=20
>> 2) how to identify the recipes that need perl-native? I think we have
>> to identify them manually one by one? This is time comsuming?
>>=20
>> 3) Even if we solve the above 2 issues, we still need to add
>> perl-native into the recipes' (that need perl-native) DEPENDS,
>> correct?=20
>>=20
>> I'm not sure my above understanding is ok. Please correct me if I'm
>> wrong.
>=20
> What I'd like to do is have perl install into a bindir which isn't
> part of our PATH by default. For anything which has DEPENDS =3D
> "perl-native", we add this directory to PATH. Anything that doesn't
> have the DEPENDS doesn't see it. We can probably make this a
> perlnative.bbclass or something which just contains
>=20
> PATH_prepend =3D "${STAGING_BINDIR_NATIVE}/perl-native:"
> DEPENDS +=3D "perl-native"
>=20
> This should ensure that anything that really needs perl-native finds
> it but we don't have *everything* depending on it unnecessarily.

Hi Richard,
Thanks very much for the detailed explanation!
Now I understand and will make changes accordingly.

Thanks,
-- Dexuan=


