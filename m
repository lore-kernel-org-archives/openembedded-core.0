Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610D1C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 14:18:04 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.11499.1664288275273844244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 07:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=elCihH39;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664288275;
  x=1695824275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aLxbjLlBUJ7CE0v8Dake1nrSfwTZ2tKivYnSaKERRQo=;
  b=elCihH39tMNZ+gNYn1/ipOjxXD13UUo8G1tvyduoPOMx0NPnR94CzATx
   zofMvW8fPwTb0gAnXJhu6xx+bgy2S7r6UpDQsDfUspmQEEjl1ag6x/Csr
   cvqmVo5yhP6+jrPE2nICEP+J4Rpulr/dxActSOj3AYMeZSr8Yy03hHX1r
   AOylNWvFoSzYB11Po/gmgWyzI1h4bJt8tgJjEVxexVOgL6t1V+oooa4eQ
   oS/w0rbTTZCthMyRxZuRyNB5YmlYjjzmkAFZJIgtrJBSsvHXxi291+D43
   qerCuvjyk3tK4DkJPxqhnmq0KpFuAakG/3nmytLRtZruZGQApMib1iB85
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/3] githib-releases: add a class that
 consolidates version checks
Thread-Topic: [OE-core] [PATCH 1/3] githib-releases: add a class that
 consolidates version checks
Thread-Index: AQHY0moDpZrvqkuZeEm0taNFgU4yIa3zUScA
Date: Tue, 27 Sep 2022 14:17:53 +0000
Message-ID: <74fb01f41d54453992cbd6ccad52a9ce@axis.com>
References: <20220927120922.137422-1-alex@linutronix.de>
In-Reply-To: <20220927120922.137422-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 14:18:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171103

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 27 september 2022 14:09
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 1/3] githib-releases: add a class that consolid=
ates version checks

Change "githib" to "github".

>=20
> github has recently changed how the releases page is structured:
> the tarballs are no longer listed directly, but are included
> via separate 'fragment' URIs. For now, we can change the check
> to match against the release tags.
>=20
> This also establishes a common base URI to use for both
> fetching and checking the latest version.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/github-releases.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta/classes-recipe/github-releases.bbclass
>=20
> diff --git a/meta/classes-recipe/github-releases.bbclass b/meta/classes-r=
ecipe/github-releases.bbclass
> new file mode 100644
> index 0000000000..ed83b83731
> --- /dev/null
> +++ b/meta/classes-recipe/github-releases.bbclass
> @@ -0,0 +1,3 @@
> +GITHUB_BASE_URI ?=3D "https://github.com/${BPN}/${BPN}/releases/"

Is that really useful? It cannot be many recipes where the owner=20
part of the URL actually matches ${BPN}? Wouldn't it make more=20
sense to instead use something like:

GITHUB_OWNER ?=3D "${BPN}"
GITHUB_NAME ?=3D "${BPN}"
GITHUB_BASE_URI ?=3D "https://github.com/${GITHUB_OWNER}/${GITHUB_NAME}/rel=
eases/"

That way it is more evident in the recipe when GITHUB_OWNER and/or=20
GITHUB_NAME is set, rather than the entire GITHUB_BASE_URI being=20
redefined.

> +UPSTREAM_CHECK_URI ?=3D "${GITHUB_BASE_URI}"
> +UPSTREAM_CHECK_REGEX ?=3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
> --
> 2.30.2

//Peter


