Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1987C473
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DEA421843F;
	Mon, 28 Jan 2019 12:46:30 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nTp47wK19Vrd; Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6762B1843D;
	Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5489A1A07C;
	Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 498DD1A069;
	Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 3DCF0DDE;
	Mon, 28 Jan 2019 12:46:29 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 28 Jan 2019 12:46:29 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 28 Jan 2019 12:46:28 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted
	for	HOSTTOOLS
Thread-Index: AQHUtugOyJ7IIhSlc0Oygjd67+39OKXEj8Ew
Date: Mon, 28 Jan 2019 11:46:28 +0000
Message-ID: <345abb1ed40143339310707ff00d5aa4@XBOX04.axis.com>
References: <cover.1548667130.git.liezhi.yang@windriver.com>
	<8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
In-Reply-To: <8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted for	HOSTTOOLS
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
X-List-Received-Date: Mon, 28 Jan 2019 11:46:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 28 januari 2019 10:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted
> for HOSTTOOLS
>=20
> Fixed:
> $ export BB_SERVER_TIMEOUT=3D-1
> $ bitbake quilt-native
> $ rm -fr tmp
> $ bitbake quilt-native
> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
>=20
> This is because bb.event.ParseStarted fires only once when server is runn=
ing,

I assume you meant bb.event.ConfigParsed above?

> but bb.event.ParseStarted fires every time when build configs are changed=
, so
> use bb.event.ParseStarted to fix the problem.
>=20
> [YOCTO #13022]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f1a3c0e..c273a29 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -220,11 +220,18 @@ def buildcfg_neededvars(d):
>          bb.fatal('The following variable(s) were not set: %s\nPlease set=
 them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(=
pesteruser))
>=20
>  addhandler base_eventhandler
> -base_eventhandler[eventmask] =3D "bb.event.ConfigParsed bb.event.MultiCo=
nfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sce=
neQueueComplete bb.event.RecipeParsed"
> +base_eventhandler[eventmask] =3D "\
> +	bb.event.ParseStarted \
> +	bb.event.MultiConfigParsed \
> +	bb.event.BuildStarted \
> +	bb.event.RecipePreFinalise \
> +	bb.runqueue.sceneQueueComplete \
> +	bb.event.RecipeParsed \
> +"
>  python base_eventhandler() {
>      import bb.runqueue
>=20
> -    if isinstance(e, bb.event.ConfigParsed):
> +    if isinstance(e, bb.event.ParseStarted):
>          if not d.getVar("NATIVELSBSTRING", False):
>              d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>          d.setVar('BB_VERSION', bb.__version__)
> --
> 2.7.4

//Peter


