Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E99C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:28:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.32970.1635172104020978514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OqvAOBub;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635172104;
  x=1666708104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4PAhgQ4yxPbJ9dH0YLG/lBwhin4wxHCKbIfLARUTGu4=;
  b=OqvAOBubNGXRc/KBzFJk8QiMKvJAekex5EjlBMMrHzeK416b7KWmgn5l
   SvGLaRHizgFdcpO7KhlzoqTCyADXNa23KMu+3W/uYCk0xwH8607pR5JWu
   0OMHMAasIbOS7QrVcHBPX8s1q2LyNZrCfzp7+2czTPTlNxomavFt0xLpy
   ZSiOahpCynXHsCzgLvzxXyhTiLnxXiZY7V4f20RmaXai8oL2pOu0jZ42a
   8FsjmYOulio+q4ZTw1E9/eFePkqj/ynEhz9xCrDty1qnQUeQxiwEO7sqP
   CVPTOSUxcvkpa1dvF+dX41rw+YPBS+x1ReqCcZ8t5oZdznx3EKVPejrSF
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
Thread-Topic: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
Thread-Index: AQHXxdf8iZ8boas690uER20kMT7116vjyL4w
Date: Mon, 25 Oct 2021 14:28:22 +0000
Message-ID: <0f410a21bce841669662ebb9b742f08a@axis.com>
References: <20211020172544.394910-1-quaresma.jose@gmail.com>
In-Reply-To: <20211020172544.394910-1-quaresma.jose@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157347

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jose Quaresma
> Sent: den 20 oktober 2021 19:26
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Subject: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
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
>=20
> v2: redirect stderr to /dev/null to avoid messages in the log
>=20
>  meta/classes/sstate.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 3c179259e7..146f56ea2d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
>  sstate_create_package () {
>  	# Exit early if it already exists
>  	if [ -e ${SSTATE_PKG} ]; then
> -		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> +		touch ${SSTATE_PKG} 2>/dev/null || true
>  		return
>  	fi
>=20
> @@ -865,7 +865,7 @@ sstate_create_package () {
>  	else
>  		rm $TFILE
>  	fi
> -	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> +	touch ${SSTATE_PKG} 2>/dev/null || true
>  }
>=20
>  python sstate_sign_package () {
> --
> 2.33.1

Can this please be backported to Hardknott and Honister now that=20
it has been accepted for master?

//Peter


