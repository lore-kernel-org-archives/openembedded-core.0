Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QqLk8-0007lm-8f
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 11:03:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2011 01:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,336,1309762800"; d="scan'208";a="36842543"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2011 01:58:59 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 8 Aug 2011 16:57:47 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 8 Aug 2011 16:57:46 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Mon, 8 Aug 2011
	16:57:44 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2011 16:57:44 +0800
Thread-Topic: [OE-core] base.bbclass: Ensure PREFERRED_PROVIDER and
	PREFERRED_VERSION values are set for multilibs
Thread-Index: AcxThjm4EbpPaIYdQNGYqFyLQtXmDwCIi9ew
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2F9115B69C@shsmsx502.ccr.corp.intel.com>
References: <1312558875.14274.112.camel@rex>
In-Reply-To: <1312558875.14274.112.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: base.bbclass: Ensure PREFERRED_PROVIDER and PREFERRED_VERSION values are set for multilibs
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
X-List-Received-Date: Mon, 08 Aug 2011 09:03:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-08-05:
> When running multilib builds its not intuitive for the specificed
> versions/providers to be build in one case and the higher version in the =
other.
> This patch mirrors the options unless they're already set.
>=20
> There shouldn't be any effect if the MULTILIBS variable isn't set.
>=20
> [YOCTO #1339]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass index
> ff960cd..4aee847 100644 --- a/meta/classes/base.bbclass +++
> b/meta/classes/base.bbclass @@ -139,6 +139,46 @@ def pkgarch_mapping(d):
>          if d.getVar("TUNE_PKGARCH", True) =3D=3D "armv7a-vfp-neon":
>              d.setVar("TUNE_PKGARCH", "armv7a")
> +def preferred_ml_updates(d):
> +    # If any PREFERRED_PROVIDER or PREFERRED_VERSIONS are set,
> +    # we need to mirror these variables in the multilib case
> +    multilibs =3D d.getVar('MULTILIBS', True) or ""
> +    if not multilibs:
> +        return
> +
> +    prefixes =3D []
> +    for ext in multilibs.split():
> +        eext =3D ext.split(':')
> +        if len(eext) > 1 and eext[0] =3D=3D 'multilib':
> +            prefixes.append(eext[1])
> +
> +    versions =3D []
> +    providers =3D []
> +    for v in d.keys():
> +        if v.startswith("PREFERRED_VERSION_"):
> +            versions.append(v)
> +        if v.startswith("PREFERRED_PROVIDER_"):
> +            providers.append(v)
> +
> +    for v in versions:
> +        val =3D d.getVar(v, False)
> +        pkg =3D v.replace("PREFERRED_VERSION_", "")
> +        for p in prefixes:
> +            newname =3D "PREFERRED_VERSION_" + p + "-" + pkg
> +            if not d.getVar(newname, False):
> +                d.setVar(newname, val)
> +
> +    for prov in providers:
> +        val =3D d.getVar(prov, False)
> +        pkg =3D prov.replace("PREFERRED_PROVIDER_", "")
> +        virt =3D ""
> +        if pkg.startswith("virtual/"):
> +             pkg =3D pkg.replace("virtual/", "")
> +             virt =3D "virtual/"
> +        for p in prefixes:
> +            newname =3D "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
> +            if not d.getVar(newname, False):
> +                d.setVar(newname, p + "-" + val)

How about the native and nativesdk packages? I think they should not be pre=
fixed.

>  addhandler base_eventhandler
>  python base_eventhandler() {
> @@ -211,6 +251,7 @@ python base_eventhandler() {
>          if name =3D=3D "ConfigParsed":
>                  generate_git_config(e)
>                  pkgarch_mapping(e.data)
> +                preferred_ml_updates(e.data)
>=20
>  	if not data in e.__dict__:
>  		return
>=20

Best Regards,
Lianhao



