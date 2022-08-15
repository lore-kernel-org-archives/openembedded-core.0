Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F3BC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 16:37:51 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.4535.1660581462628148234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 09:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ZUDk0+Ko;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1660581463;
  x=1692117463;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RNJaVxv56od/SVTWzxAyUc1p+LoO5TXXdttQ5brz3uU=;
  b=ZUDk0+KoR3LhqTNklV/uEvnzSRvycikbtJJAaEXsCwJLlcO4AcEFdvQF
   UZ9Juhr7RK7zfrF9g5UzXwnAxL7zMB94OvYKxIz1gL5rSaQBsdzM8WCB0
   lbtV90wLrgrQsbAREMVUu5Kq0wbg76zVWzqQXEWHs65aqIZUduoYQRERo
   RBpu91H/Elw8jRbQoZQlld/nDInQqmsaJElj9DI+zqSzUIxchVOEz/Z8D
   ozRWDoqqs5/Q/fEDh1DaDT20YpLqJ4Pa7kEu5mLyy4RkbSXIbz0/gxuJO
   LfIMHJJJaHoJfWHMYqPuL6s/ABkgPoJRWNria/iZDaSOwhD5Dt/aEvW5h
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/5] bitbake.conf: Handle S and B separately for
 debug mapping
Thread-Topic: [OE-core] [PATCH 4/5] bitbake.conf: Handle S and B separately
 for debug mapping
Thread-Index: AQHYr1RBoNHy9KPzs0yiNd4KNFUEta2wKjCA
Date: Mon, 15 Aug 2022 16:37:39 +0000
Message-ID: <ac198bef4bb248cead2a1c2e45b682eb@axis.com>
References: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
 <20220813203501.1111519-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220813203501.1111519-4-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 16:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169356

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 13 augusti 2022 22:35
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/5] bitbake.conf: Handle S and B separately fo=
r
> debug mapping
>=20
> We don't really need to keep S and B separate for debug source purposes
> and there shouldn't be source references in WORKDIR that isn't S and B
> either.
>=20
> Separating these out simplifies the shared-work directory handling for
> gcc and should also help fix external source usage. Therefore handle
> S and B in DEBUG_PREFIX_MAP separately and clean up other code.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf                      | 11 +++++++----
>  meta/recipes-devtools/gcc/gcc-runtime.inc   | 13 -------------
>  meta/recipes-devtools/gcc/libgcc-common.inc |  8 --------
>  3 files changed, 7 insertions(+), 25 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdfb6784371..dd2df8a5520 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -645,10 +645,13 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${WORKDIR}=3D/usr/src/debug/=
${PN}/${EXTENDPE}${PV}-${PR} \
> -                     -fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${=
PN}/${EXTENDPE}${PV}-${PR} \
> -                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> -                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR} \
> + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> + -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> + -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> + -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>  "

That should be:

DEBUG_PREFIX_MAP ?=3D " \
    -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
    -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
    -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
    -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
    -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
    -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
    -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
"

to follow common variable indentation.

>  DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>=20

//Peter


