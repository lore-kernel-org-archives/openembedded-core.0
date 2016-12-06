Return-Path: <ola.x.nilsson@axis.com>
X-Greylist: delayed 421 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Dec 2016 07:44:18 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24B02719B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 07:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1FBE3180A2;
	Tue,  6 Dec 2016 08:37:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hwKys3vuOPpd; Tue,  6 Dec 2016 08:37:17 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 25F60182BB;
	Tue,  6 Dec 2016 08:37:16 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1E191A072;
	Tue,  6 Dec 2016 08:37:16 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6B021A070;
	Tue,  6 Dec 2016 08:37:16 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  6 Dec 2016 08:37:16 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id CAFE43DE;
	Tue,  6 Dec 2016 08:37:16 +0100 (CET)
Received: from XBOX01.axis.com (10.0.5.15) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 6 Dec 2016 08:37:16 +0100
Received: from XBOX01.axis.com ([fe80::9cb5:b14b:16f8:ddd6]) by
	XBOX01.axis.com ([fe80::9cb5:b14b:16f8:ddd6%22]) with mapi id
	15.00.1210.000; Tue, 6 Dec 2016 08:37:16 +0100
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/4] Load devtool and reciptool plugins in a well-defined
	manner
Thread-Index: AQHSLq9vjtb+yriUDUOMcZod1Bq55KD6yTqg
Date: Tue, 6 Dec 2016 07:37:16 +0000
Message-ID: <3d0139cbc58340fea6f0ea733004c06a@XBOX01.axis.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
In-Reply-To: <1477393415-13053-1-git-send-email-olani@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/4] Load devtool and reciptool plugins in a well-defined manner
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
X-List-Received-Date: Tue, 06 Dec 2016 07:44:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping?

--=20
Ola x Nilsson

> -----Original Message-----
> From: Ola x Nilsson [mailto:olani@axis.com]
> Sent: den 25 oktober 2016 13:04
> To: Ola x Nilsson; openembedded-core@lists.openembedded.org
> Subject: [PATCH 0/4] Load devtool and reciptool plugins in a well-defined
> manner
>=20
> From: Ola x Nilsson <ola.x.nilsson@axis.com>
>=20
> Make devtool and recipetool load plugins in a well-defined and expected
> manner.
>=20
> devtool and reciptool search for pluings first in scripts/lib/<tool> and =
then in
> BBPATH.  Each found plugin is loaded, which means that any plugin found
> later in BBPATH shadows previously loaded plugins.
> plugin_init is loaded for all plugins, no matter whether they are later
> replaced.  register_plugin is called once for each time a plugin with a c=
ertain
> name is found, but it is always called on the last loaded plugin.
>=20
> Change the scriptutils.load_plugins function to never load a plugin file =
if one
> with the same filename has already been loaded.  This means that the firs=
t
> found plugin wins.
>=20
> Change the load order to first search BBPATH and then scripts/lib/tools. =
 This
> means that plugins in scripts/lib/<tool> can be shadowed by plugins in la=
yers.
>=20
> Ola x Nilsson (4):
>   devtool: selftest: add test for devtool plugin loading
>   recipetool: selftest: Add test for recipetool plugin loading
>   devtool: Load plugins in a well defined order
>   recipetool: Load plugins in a well defined order
>=20
>  meta-selftest/lib/devtool/bbpath.py    | 44
> ++++++++++++++++++++++++++++++++++
>  meta-selftest/lib/recipetool/bbpath.py | 41
> +++++++++++++++++++++++++++++++
>  meta/lib/oeqa/selftest/devtool.py      | 43
> +++++++++++++++++++++++++++++++++
>  meta/lib/oeqa/selftest/recipetool.py   | 44
> ++++++++++++++++++++++++++++++++++
>  scripts/devtool                        |  3 ++-
>  scripts/lib/scriptutils.py             |  8 +++++--
>  scripts/recipetool                     |  4 ++--
>  7 files changed, 182 insertions(+), 5 deletions(-)  create mode 100644 m=
eta-
> selftest/lib/devtool/bbpath.py
>  create mode 100644 meta-selftest/lib/recipetool/bbpath.py
>=20
> --
> 2.1.4


