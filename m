Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEA8C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:10:17 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6552.1668525009852173129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 07:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DVnf6DWj;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668525011;
  x=1700061011;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dZwJUK7nKKek6ylNznB+CEs6M/Fdoit76JIyP45kPy4=;
  b=DVnf6DWj5DJavkiuG7dmCF8kqdCAY6q8qKgNeOn0Ww44RlmGT1Rfun5W
   wG0ddcfaKGY/o58lT+OoqQj01zkYdm/x768jVGjGKDFGKjD4g5rOUP3ry
   RNjBWZHGSva4X8heAIQsnMMRZfhXJypbGzEknvNGBAMB2aTOe2rJrTqQb
   6sYk9DK7zQeLvct+3GED95L142gKMT79yFZOIXpOZkYUs/pFDvSD9CFNn
   CrjmyuEcD0nZ5xaWpKHj2x4hz0Cys5RJ9DA5+wR4hXQEQ8DcFFf3XJH+b
   49lu/OAuI0qlE2gLx9eGBRJi/pEkPZOhbNOoydlMp2zP1NYmAqccemEcn
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sanity: Drop data finalize call
Thread-Topic: [OE-core] [PATCH] sanity: Drop data finalize call
Thread-Index: AQHY9iEiKtclssbU+UWdMWJFh3tGxq5AEdLQ
Date: Tue, 15 Nov 2022 15:10:06 +0000
Message-ID: <b74451c1aba840738a8ae62a6287c04c@axis.com>
References: <20221111225827.2412062-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221111225827.2412062-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 15:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173347

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 11 november 2022 23:58
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] sanity: Drop data finalize call
>=20
> This call was effectively like update_data and no longer did anything
> in bitbake. Drop it as it is obsolete.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sanity.bbclass | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 8c7d4d08809..6cb0d6cf882 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -1003,13 +1003,6 @@ def check_sanity(sanity_data):
>      if status.messages !=3D "":
>          raise_sanity_error(sanity_data.expand(status.messages), sanity_d=
ata, status.network_error)
>=20
> -# Create a copy of the datastore and finalise it to ensure appends and
> -# overrides are set - the datastore has yet to be finalised at ConfigPar=
sed
> -def copy_data(e):
> -    sanity_data =3D bb.data.createCopy(e.data)
> -    sanity_data.finalize()
> -    return sanity_data
> -
>  addhandler config_reparse_eventhandler
>  config_reparse_eventhandler[eventmask] =3D "bb.event.ConfigParsed"
>  python config_reparse_eventhandler() {
> @@ -1020,13 +1013,13 @@ addhandler check_sanity_eventhandler
>  check_sanity_eventhandler[eventmask] =3D "bb.event.SanityCheck bb.event.=
NetworkTest"
>  python check_sanity_eventhandler() {
>      if bb.event.getName(e) =3D=3D "SanityCheck":
> -        sanity_data =3D copy_data(e)
> +        sanity_data =3D bb.data.createCopy(e.data)

For my understanding, wouldn't it be the same to do:

        sanity_data =3D bb.data.createCopy(d)

I found this in the bitbake documentation, which seems to support my=20
understanding: A global variable "e" is defined, which represents the=20
current event. ... The global datastore is available as "d". In legacy=20
code, you might see "e.data" used to get the datastore. However, realize=20
that "e.data" is deprecated and you should use "d" going forward.

Further, is there any reason to use bb.data.createCopy(d) instead of=20
d.createCopy()? AFAICT, the former just calls the latter.

>          check_sanity(sanity_data)
>          if e.generateevents:
>              sanity_data.setVar("SANITY_USE_EVENTS", "1")
>          bb.event.fire(bb.event.SanityCheckPassed(), e.data)
>      elif bb.event.getName(e) =3D=3D "NetworkTest":
> -        sanity_data =3D copy_data(e)
> +        sanity_data =3D bb.data.createCopy(e.data)
>          if e.generateevents:
>              sanity_data.setVar("SANITY_USE_EVENTS", "1")
>          bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity=
(sanity_data) else bb.event.NetworkTestPassed(), e.data)
> --
> 2.34.1

//Peter


