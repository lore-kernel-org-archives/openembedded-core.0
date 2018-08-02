Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 484F478DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 19:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B13741838E;
	Thu,  2 Aug 2018 21:29:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6oCYz36JXj_8; Thu,  2 Aug 2018 21:29:06 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 78A9B18367;
	Thu,  2 Aug 2018 21:29:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 151C91A069;
	Thu,  2 Aug 2018 21:29:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0903D1A067;
	Thu,  2 Aug 2018 21:29:06 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  2 Aug 2018 21:29:05 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id F0D1D256E;
	Thu,  2 Aug 2018 21:29:05 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 2 Aug 2018 21:29:05 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 2 Aug 2018 21:29:05 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 2 Aug 2018 21:29:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] base-files: fix handling of resize
Thread-Index: AQHUKVeUTJJx+yUnGEW1z3CtVpByK6Ss0s7Q
Date: Thu, 2 Aug 2018 19:29:05 +0000
Message-ID: <e94161d3776e494fb972f29a50efb110@XBOX02.axis.com>
References: <cover.1533101098.git.Qi.Chen@windriver.com>
	<44c96af07f5e3e99afb74b3513dec022cd3976c1.1533101098.git.Qi.Chen@windriver.com>
In-Reply-To: <44c96af07f5e3e99afb74b3513dec022cd3976c1.1533101098.git.Qi.Chen@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] base-files: fix handling of resize
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
X-List-Received-Date: Thu, 02 Aug 2018 19:29:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
> Sent: den 1 augusti 2018 07:26
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] base-files: fix handling of resize
>=20
> The current handling of resize is incorrect. Using `resize > /dev/null
> 2>&1 && resize > /dev/null' will cause the second resize command to not
> execute because 'resize > /dev/null 2>&1' will fail for resize utility
> from busybox.

Meh, I was pretty sure I had verified it with resize from busybox, but it=20
seems you are correct. However, the current logic can be maintained by=20
instead changing the first invocation of resize to call "resize --help=20
2>/dev/null".

> What we really should do is just to check whether ${bindir}/resize
> is executable and execute it if so. Using '-x' is sufficient.

Well, the intent of the current code (and the code before it) was to be=20
agnostic to where resize happens to be located. That is obviously no=20
longer the case after your change. Whether that matters or not, I do not=20
know...

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files/profile   | 6 +-----
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
>  2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recip=
es-core/base-files/base-files/profile
> index e14cb2d..9e4283e 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -24,11 +24,7 @@ fi
>  # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which t=
ries do
>  # use ssh
>  case $(tty 2>/dev/null) in
> -	# The first invocation of resize verifies that it exists, the second
> -	# does the actual resizing. This is due to that resize uses stderr to
> -	# determine the size of the tty, which does not work if it is redirecte=
d
> -	# to /dev/null.
> -	/dev/tty[A-z]*) resize >/dev/null 2>&1 && resize >/dev/null;;
> +	/dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
>  esac
>=20
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 1c0863b..05c0562 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -121,6 +121,7 @@ do_install () {
>  	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
>  	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>  	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
> +        sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
>  	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
>  	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.pr=
ofile
>  	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bas=
hrc
> --
> 1.9.1

//Peter


