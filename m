Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5563C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 20:45:12 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.1219.1636577111089359210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 12:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bqhyyImB;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636577112;
  x=1668113112;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jz0o6gczZiNAfbvDZStTck29OOYblfTGNAszvU5Zo5E=;
  b=bqhyyImByQ6wxx/jXUqqaTXM9b78wSxkaHiW1phnZynsgQ7rF7WyLdaj
   a+jF1dubV780Pcgof1G19Slbk9D0HRIWp7si95krxav9zPM32W0jJ4ASf
   BUNRTNgSZKUg3BaovWD4O+gNYV6hRM/6yhdWX9taWGSxRPSeGgg0Zwau/
   rAlEvSsfLSGsLMmrpZYUnYVFFlVJWU9yMwqklR6zZFP9ZMQ0UQy7yMDBB
   XrR+r1tzwsfMeoDfqIjxMvATBCMZ7Kn6K/g2hIWQ+1LW33/5M6xF1SRYe
   uX29LZH8RQOYJwFGDYQwdLBDdAn27Dtl8RlDOP/QCfv8fcaLjAY+r/mcw
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] mirrors: Add uninative mirror on kernel.org
Thread-Topic: [OE-core] [PATCH] mirrors: Add uninative mirror on kernel.org
Thread-Index: AQHX1Wy9uHs2ubEY2kS2qFnwFSVIG6v9LKBw
Date: Wed, 10 Nov 2021 20:44:57 +0000
Message-ID: <93b2df22824c47ff9c08365792a805d2@axis.com>
References: <20211109132131.3789773-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211109132131.3789773-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 20:45:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158109

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 9 november 2021 14:22
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] mirrors: Add uninative mirror on kernel.org
>=20
> At the last nas outage, we realised that we don't have good mirrors of th=
e
> uninative tarball if our main system can't be accessed. kernel.org mirror=
s
> some Yocto Project data so we've ensured uninative is there. Add the appr=
opriate
> mirror url to make use of that.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/mirrors.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index ba325a658bc..75eb86a7243 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -62,6 +62,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
>  npm://.*/?.*    http://sources.openembedded.org/ \n \
>  ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
>  ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
> +https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors=
.kernel.org/yocto/uninative/ \n \

The above looked very odd to me, having that dollar sign in the middle of=20
the regular expression. It wasn't until I was deep into the fetcher's code=
=20
that I realized that it is not actually one regular expression above, but=20
three, formatted as a URL...

However, based on the code in bitbake/lib/bb/fetch2/__init__.py:uri_replace=
(),=20
AFAICT, the dollar sign should not be needed above, as it will be added for=
=20
the URI type regexp automatically. The same goes for the other two URLs in=
=20
mirrors.bbclass that use that formatting.

While investigating this, I also tried to look in the bitbake documentation=
=20
for a description of the format used for the PREMIRRORS and MIRRORS variabl=
es,=20
but I could not find any. There is only a simple example, without any=20
explanation for the actual format that is being used.

>  "
>=20
>  # Use MIRRORS to provide git repo fallbacks using the https protocol, fo=
r cases
> --
> 2.32.0

//Peter


