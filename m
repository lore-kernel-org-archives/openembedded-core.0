Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5F871633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:07:54 +0000 (UTC)
Received: by pdob1 with SMTP id b1so50027678pdo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=/4CiYnSl34pmnGb5o1xcW6pmC3RvLD1JHbW9IiIQhWM=;
	b=iTm60IbTXLeYOI7qtNKj9SI5NemmFCH1ynwm66qytmjWMvaV5Bd5OLFwoWtbAW2i9Q
	Wq1pwgsa5gLnYtano/YIKGci5mZ1M7VBic/nkq6CiFdieqlYbIdquiELqYHMRvb9Qcgg
	WStCJtGbFyTjwQiDceem98cbilVGduS8ZxZUtm3GveWnV9hvBFf2AYG6brZIZO84s2vV
	9mtNwDtdXr8a2LShQijBrv5TrBOjx6mx+uL76zqAzmQxczlS37ZSS1yCbo93MfHgoV16
	NSSmlzM+0s3uF1Y6vVJ3zej1jDet+MUyDo2+Aupl+6fo9ivKpAs72bm/Cks4BxwLRdN/
	xMVQ==
X-Received: by 10.70.102.101 with SMTP id fn5mr43050724pdb.71.1440400075199;
	Mon, 24 Aug 2015 00:07:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f40c:2841:39d7:eade?
	([2601:646:8601:4580:f40c:2841:39d7:eade])
	by smtp.gmail.com with ESMTPSA id y2sm16175412pdp.0.2015.08.24.00.07.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 00:07:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440259095-24566-3-git-send-email-raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 00:07:49 -0700
Message-Id: <9081F0A9-4326-47CF-9D16-D98801D10365@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
	<1440259095-24566-3-git-send-email-raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH 3/6] json-c: Include math_compat.c for NAN/INF values
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
X-List-Received-Date: Mon, 24 Aug 2015 07:07:58 -0000
X-Groupsio-MsgNum: 69877
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5EF67C8B-025F-4FD9-8F49-AFE39D7FE58C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5EF67C8B-025F-4FD9-8F49-AFE39D7FE58C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 22, 2015, at 8:58 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> The backport patch also fixes the warning which was being work =
arounded
> by disabling unused-but-set-variable
>=20

Just saw it fail with gcc 5.2 in local builder, sent a v2 with the fix.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../0001-json_tokener-requires-INF-and-NAN.patch   | 32 =
++++++++++++++++++++++
> meta/recipes-devtools/json-c/json-c_0.12.bb        |  6 ++--
> 2 files changed, 35 insertions(+), 3 deletions(-)
> create mode 100644 =
meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN=
.patch
>=20
> diff --git =
a/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-N=
AN.patch =
b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-N=
AN.patch
> new file mode 100644
> index 0000000..58ccf7b
> --- /dev/null
> +++ =
b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-N=
AN.patch
> @@ -0,0 +1,32 @@
> +=46rom 9be71700eb580c815688584a64621a38867c3fdd Mon Sep 17 00:00:00 =
2001
> +From: James Myatt <james.myatt@tessella.com>
> +Date: Thu, 5 Feb 2015 15:57:14 +0000
> +Subject: [PATCH] json_tokener requires INF and NAN
> +
> +---
> +Upstream-Status: Backport
> +
> + json_tokener.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +Index: json-c-0.12/json_tokener.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- json-c-0.12.orig/json_tokener.c
> ++++ json-c-0.12/json_tokener.c
> +@@ -16,6 +16,7 @@
> + #include "config.h"
> +
> + #include <math.h>
> ++#include "math_compat.h"
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <stddef.h>
> +@@ -353,7 +354,7 @@ struct json_object* json_tokener_parse_e
> +     case json_tokener_state_inf: /* aka starts with 'i' */
> +       {
> + 	int size;
> +-	int size_inf;
> ++	size_t size_inf;
> + 	int is_negative =3D 0;
> +
> + 	printbuf_memappend_fast(tok->pb, &c, 1);
> diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb =
b/meta/recipes-devtools/json-c/json-c_0.12.bb
> index e9c5b31..cfef03d 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.12.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
> @@ -4,7 +4,9 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f2"
>=20
> -SRC_URI =3D =
"https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
> +SRC_URI =3D =
"https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> +           file://0001-json_tokener-requires-INF-and-NAN.patch \
> +          "
>=20
> SRC_URI[md5sum] =3D "3ca4bbb881dfc4017e8021b5e0a8c491"
> SRC_URI[sha256sum] =3D =
"000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
> @@ -17,5 +19,3 @@ do_configure_prepend() {
>     # Clean up autoconf cruft that should not be in the tarball
>     rm -f ${S}/config.status
> }
> -
> -CFLAGS +=3D "-Wno-error=3Dunused-but-set-variable"
> --
> 2.1.4
>=20


--Apple-Mail=_5EF67C8B-025F-4FD9-8F49-AFE39D7FE58C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXawskACgkQuwUzVZGdMxRUUgCePofyXXNa80DytcN/ynvzY6s0
KkcAn25w28O9yiR3jbZEKaRZHRIIbveU
=PvRh
-----END PGP SIGNATURE-----

--Apple-Mail=_5EF67C8B-025F-4FD9-8F49-AFE39D7FE58C--
