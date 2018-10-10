Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2477477A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C026618490
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BLvG0O7F3Rt7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BEF6C18488
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE4981E075
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2EF71E068
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 96B4E184F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:48:16 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 10 Oct 2018 17:48:16 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000;
	Wed, 10 Oct 2018 17:48:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Olof Johansson <olofjn@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] devtool-source.bbclass: Only create each patch
	branch once
Thread-Index: AQHUYK7nHw7G83k5F0usPSre/ERvfKUYn5bg
Date: Wed, 10 Oct 2018 15:48:16 +0000
Message-ID: <fcb530f7332f441fb868ad51cd0bc50c@XBOX02.axis.com>
References: <20181010153528.9110-1-olofjn@axis.com>
In-Reply-To: <20181010153528.9110-1-olofjn@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devtool-source.bbclass: Only create each patch	branch once
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
X-List-Received-Date: Wed, 10 Oct 2018 15:48:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Olof Johansson
> Sent: den 10 oktober 2018 17:35
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] devtool-source.bbclass: Only create each
> patch branch once
>=20
> For conditonally applied patches based on SRC_URI overrides, the
> devtool-source class would try to create a new branch for each override
> assignment as a postfunc to do_patch, but if the same override was used
> multiple times, it would try to create the same branch multiple times,
> causing errors like
>=20
> > Exception: bb.process.ExecutionError: Execution of
> \   'git checkout f0f0f0f0f0ff0f0f0f0f0f0f0f0f0f0f0ff0f0f0 -b devtool-ove=
rride-foo'
> \   failed with exit code 128:
> > fatal: A branch named 'devtool-override-foo' already exists.
>=20
> This change makes sure that the devtool-source bbclass will only create
> one branch per override.
>=20
> Change-Id: I8adca0b54179793ca92478ad5b3b1b6e0448e26b

You probably want to remove the Change-Id before applying this...

> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>  meta/classes/devtool-source.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-s=
ource.bbclass
> index 56882a4..fa4e999 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -169,16 +169,15 @@ python devtool_post_patch() {
>          except bb.process.ExecutionError:
>              pass
>=20
> -    extra_overrides =3D d.getVar('DEVTOOL_EXTRA_OVERRIDES')
> -    if extra_overrides:
> -        extra_override_list =3D extra_overrides.split(':')
> +    devtool_overrides =3D set(d.getVar('DEVTOOL_EXTRA_OVERRIDES').split(=
':') or [])
> +    if devtool_overrides:
>          devbranch =3D d.getVar('DEVTOOL_DEVBRANCH')
>          default_overrides =3D d.getVar('OVERRIDES').split(':')
>          no_overrides =3D []
>          # First, we may have some overrides that are referred to in the =
recipe set in
>          # our configuration, so we need to make a branch that excludes t=
hose
>          for override in default_overrides:
> -            if override not in extra_override_list:
> +            if override not in devtool_overrides:
>                  no_overrides.append(override)
>          if default_overrides !=3D no_overrides:
>              # Some overrides are active in the current configuration, so
> @@ -196,7 +195,7 @@ python devtool_post_patch() {
>          else:
>              bb.process.run('git checkout %s -b devtool-no-overrides' % d=
evbranch, cwd=3Dsrcsubdir)
>=20
> -        for override in extra_override_list:
> +        for override in devtool_overrides:
>              localdata =3D bb.data.createCopy(d)
>              if override in default_overrides:
>                  bb.process.run('git branch devtool-override-%s %s' % (ov=
erride, devbranch), cwd=3Dsrcsubdir)
> --
> 2.11.0

//Peter

