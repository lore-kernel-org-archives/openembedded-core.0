Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB1DC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:37:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.15314.1634672274060664054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D3vMox2q;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634672274;
  x=1666208274;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8XdAwCTscZO/h2TCT5krhz0GrKdNlvCB6/lYKZhV44E=;
  b=D3vMox2qm+WF2mREpYKpMn7eRT1jDLpUuuODz86/VlKIBX8NYx7SfmGE
   C/Q339DNnKoG6kfgTy0SPKfVjsSqTwGZwnNkL2LXlOex/i0BEp5Ldvu9z
   9GgtQ/8pnWSbN34c0Nb6kK9AjBOZwoeYBaK5F8xEkSmei3Bw7OfiH6l60
   i9HCIg970FfFVahhFzt2E+Pq/2UglYk8DAYMQfkOsLLDkZF25bAey4khR
   jSjQKxmTRKPlGET/F9TRkxVbtZkMcT8zD27Gq6Px1axiBIPP9wChTvGND
   pp9svM4QPM0S5nv6Xx2sUHf3V4NJKgYk47wx3GROKW4kualmsacVYnEXO
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sstate: fix touching files inside pseudo
Thread-Topic: [OE-core] [PATCH] sstate: fix touching files inside pseudo
Thread-Index: AQHXxFCbIS8kYC/JPE+Q444bguu8Hqvat3qg
Date: Tue, 19 Oct 2021 19:37:52 +0000
Message-ID: <b41d22f66c4b41d4ba82fff0ccdfba11@axis.com>
References: <20211018184711.94970-1-quaresma.jose@gmail.com>
In-Reply-To: <20211018184711.94970-1-quaresma.jose@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157204

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jose Quaresma
> Sent: den 18 oktober 2021 20:47
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Subject: [OE-core] [PATCH] sstate: fix touching files inside pseudo
>=20
> running the 'id' command inside the sstate_create_package
> function shows that this funcion run inside the pseudo:
>=20
>  uid=3D0(root) gid=3D0(root) groups=3D0(root)
>=20
> The check for touch files [ ! -w ${SSTATE_PKG} ]
> will always return true and the touch can fail
> when the real user don't have permission or
> in readonly filesystem.
>=20
> As the documentation refers, the file test operator "-w"
> check if the file has write permission (for the user running the test).
>=20
> We can avoid this test running the touch and mask any return errors
> that we have.
>=20
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 7f034d746a..d4555150c4 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
>  sstate_create_package () {
>  	# Exit early if it already exists
>  	if [ -e ${SSTATE_PKG} ]; then
> -		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> +		touch ${SSTATE_PKG} || true

You should pass stderr to /dev/null to avoid messages in the log=20
if/when touch fails, i.e.:

		touch ${SSTATE_PKG} 2>/dev/null || :

>  		return
>  	fi
>=20
> @@ -865,7 +865,7 @@ sstate_create_package () {
>  	else
>  		rm $TFILE
>  	fi
> -	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> +	touch ${SSTATE_PKG} || true
>  }
>=20
>  python sstate_sign_package () {
> --
> 2.33.1

//Peter


