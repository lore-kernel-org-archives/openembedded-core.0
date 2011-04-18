Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QBhHu-0008E8-Rb
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 07:46:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Apr 2011 22:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="630322567"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2011 22:43:54 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 18 Apr 2011 13:43:44 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 18 Apr 2011 13:43:43 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2011 13:43:42 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: Acv9hL0a6FfodeD5SoCvU+fMWi89kAAA0iFg
Message-ID: <1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
In-Reply-To: <1303102414.5518.30.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 18 Apr 2011 05:46:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Fri, 2011-04-15 at 23:54 -0700, Saul Wold wrote:
>> From: Dexuan Cui <dexuan.cui@intel.com>
>>=20
>> Fixes [YOCTO #968]
>>=20
>> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
>> b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb=20
>> index e0a8155..897984d 100644
>> --- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
>> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
>> @@ -3,12 +3,14 @@ DESCRIPTION =3D "Tool that installs the GNU
>>  config.guess / config.sub into a direc  SECTION =3D "devel" LICENSE =3D
>>  "GPLv1+" LIC_FILES_CHKSUM =3D
>> "file://config.guess;endline=3D39;md5=3Da089987af4a25cb0419d1c2fd6d495e3=
"
>> -DEPENDS =3D "" + +DEPENDS_virtclass-native =3D "perl-native"
>> +
>>  INHIBIT_DEFAULT_DEPS =3D "1"
>>=20
>=20
>=20
> I haven't taken this. Having looked at the shear number of horrible
> perl-native issues, I'd like to take the same approach we took with
> the toolchain staging and place perl into its own bin directory we
> add to PATH when needed.=20
Hi RP,
If a recipe does need perl-native but we fail to realize that, the host's p=
erl (e.g. /usr/bin/perl) will be used -- this will further hinder us from r=
ealizing the recipe needs perl-native.

As to bug #968, the build failure happens because perl-native's do_populate=
_sysroot has begun but hasn't finished. If perl-native hasn't started to po=
pulate_sysroot, running gnu-configize won't fail since host's perl will be =
used.

so I've 3 questions:
1) in poky how to exclude host's perl from PATH? need to write a python fun=
ction to filter out various possible host perl paths? e.g., ~/bin/perl, /us=
r/local/bin/perl, /usr/bin/perl, /bin/perl,... too many paths...

2) how to identify the recipes that need perl-native? I think we have to id=
entify them manually one by one? This is time comsuming?

3) Even if we solve the above 2 issues, we still need to add perl-native in=
to the recipes' (that need perl-native) DEPENDS, correct?

I'm not sure my above understanding is ok. Please correct me if I'm wrong.

Thanks,
-- Dexuan=


