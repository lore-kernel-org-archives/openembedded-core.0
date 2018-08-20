Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E49B790E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9F91A1813C;
	Mon, 20 Aug 2018 22:42:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hExBElmmLs8Z; Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7DF82180E5;
	Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6990C1A067;
	Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E3471A05F;
	Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 520751102;
	Mon, 20 Aug 2018 22:42:44 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 20 Aug 2018 22:42:44 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 20 Aug 2018 22:42:44 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V3] sstate: Avoid indirect
	autoconf-archive-native	dependencies
Thread-Index: AQHUOC3gw7xxZ/E/nkiMtNz5Frm96qTJFzMA
Date: Mon, 20 Aug 2018 20:42:44 +0000
Message-ID: <ffaef70e811447819bfc889f1030e489@XBOX02.axis.com>
References: <1534732261-46765-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1534732261-46765-1-git-send-email-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V3] sstate: Avoid indirect autoconf-archive-native	dependencies
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
X-List-Received-Date: Mon, 20 Aug 2018 20:42:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> changqing.li@windriver.com
> Sent: den 20 augusti 2018 04:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V3] sstate: Avoid indirect autoconf-archive-
> native dependencies
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> remove the indirect dependcy of autoconf-archive-native via
> SSTATE_EXCLUDEDEPS_SYSROOT to avoid not needed .m4 installed
> into sysroot, which may cause compile problem.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/layer.conf | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index cc77d07..63346ae 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -90,6 +90,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
>      .*->.*-initial.* \
>      .*(base-passwd|shadow-sysroot)->.* \
>  "
> -
> +# Avoid adding autoconf-archive-native to sysroot without a specific
> +# dependency in the recipe.
> +SSTATE_EXCLUDEDEPS_SYSROOT +=3D ".*->autoconf-archive-native"

Please re-add the empty line here.

>  # We need to keep bitbake tools in PATH
>  PATH :=3D "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake')=
)}:${HOSTTOOLS_DIR}"
> --
> 2.7.4

//Peter


