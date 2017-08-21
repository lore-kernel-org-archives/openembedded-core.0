Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 81DDE7821F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id BA7802E2A3;
	Mon, 21 Aug 2017 17:00:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tq5adgv5a9qV; Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 5BA652E085;
	Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 434491E081;
	Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 362231E07E;
	Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 2990318E6;
	Mon, 21 Aug 2017 17:00:10 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 21 Aug 2017 17:00:09 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 21 Aug 2017 17:00:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid BSPs
	are	built
Thread-Index: AQHTGimArXMTMGCMe0+nMPmbF0vQoqKO5cSw
Date: Mon, 21 Aug 2017 15:00:10 +0000
Message-ID: <b68f37bbad5940a8bdb7f165a7600f18@XBOX02.axis.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
In-Reply-To: <ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are	built
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
X-List-Received-Date: Mon, 21 Aug 2017 15:00:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Bruce Ashfield
> Sent: den 21 augusti 2017 04:58
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid
> BSPs are built
>=20
> There was a bug in the search routines responsible for locating
> BSP definitions which returned a valid match if only the ktype
> matched.
>=20
> This meant that someone looking for "qemux86foo" (which is an
> invalid definition) would potentially end up building "qemuarm"
> and be none the wiser (until it didn't boot).
>=20
> With this fix to the tools search routine, and improved return
> code testing, we will now stop the build and report and error to
> the user.
>=20
> [YOCTO: #11878]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass                       | 3 +++
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 1ca0756c4959..3c6df92131bc 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -143,6 +143,9 @@ do_kernel_metadata() {
>=20
>  	# expand kernel features into their full path equivalents
>  	bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKT=
YPE=3D${LINUX_KERNEL_TYPE})
> +	if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then

Use $bsp_definition instead of ${bsp_definition} since it is a=20
shell variable and not a bitbake variable.=20

Actually, after looking at the code in that bbclass, I see this=20
used for a number of shell variables all over the place. This is=20
actually bad, and you should rewrite the code to not use ${variable}=20
for shell variables. The reason this is bad is because these=20
variables unnecessarily end up in the sstate hash for these functions,=20
and if someone actually happens to define a bitbake variable with the=20
same name as one of those shell variables, the result will not be what=20
is expected...

> +		bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KE=
RNEL_TYPE}."

Change "definiton" to "definition".

> +	fi
>  	meta_dir=3D$(kgit --meta)
>=20
>  	# run1: pull all the configuration fragments, no matter where they come=
 from
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 2217a31076a2..4a78b897d34f 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D5=
;endline=3D9;md5=3Da6c2fa8aef1b
>=20
>  DEPENDS =3D "git-native"
>=20
> -SRCREV =3D "9cd2b626d652bec10c6bc75275b35bfee74d447c"
> +SRCREV =3D "0571411cc033c11df7827508dd786876ce2f8c83"
>  PR =3D "r12"
>  PV =3D "0.2+git${SRCPV}"
>=20
> --
> 2.5.0

//Peter


