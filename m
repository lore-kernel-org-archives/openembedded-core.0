Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A595B7550B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2785618383;
	Tue,  5 Jun 2018 12:27:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6wkrSX51ZZ5p; Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 68D7018242;
	Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5475C1A072;
	Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48AF01A06F;
	Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 3C0082808;
	Tue,  5 Jun 2018 12:27:13 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 12:27:13 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 5 Jun 2018 12:27:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Kelly <mkelly@xevo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 2/6] toolchain-scripts: allow non-sh
	post-relocate
Thread-Index: AQHT/Fi4jK7dx4U3tUa87IPbGvyrc6RRcoBg
Date: Tue, 5 Jun 2018 10:27:13 +0000
Message-ID: <e9d0cb69fa974fc38eaa460a1d06d88a@XBOX02.axis.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-3-mkelly@xevo.com>
In-Reply-To: <20180604230602.8461-3-mkelly@xevo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 2/6] toolchain-scripts: allow non-sh	post-relocate
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
X-List-Received-Date: Tue, 05 Jun 2018 10:27:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Kelly
> Sent: den 5 juni 2018 01:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 2/6] toolchain-scripts: allow non-sh post-
> relocate
>=20
> Currently, we look only for scripts matching *.sh, which means we can't
> write post-relocate scripts in other languages.
>=20
> Expand this to allow any type of script.
>=20
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
> v3:
> - Test for executability prior to running each script.
>=20
>  meta/classes/toolchain-scripts.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index a72436167c..da8a57f24b 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -124,7 +124,10 @@ toolchain_create_post_relocate_script() {
>=20
>  	cat >> $script <<EOF
>  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
> -    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
> +    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
> +        if [ ! -x \$s ]; then
> +            continue
> +        fi

That can be written as:

         [ -x \$s ] || continue

>          \$s "\$1"

Or you can replace all of it with:

         [ ! -x \$s ] || \$s "\$1"

You should not invert the test and replace the || with && though=20
(even if it may seem more logical) due to the return status of=20
the [ command in case $s is not executable.

>      done
>      rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

