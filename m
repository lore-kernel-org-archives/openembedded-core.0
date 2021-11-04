Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CB5C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 17:01:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.502.1636045279533241640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=UopuNC9J;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636045279;
  x=1667581279;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o+3j4vBt3JYU8EyeWOCqtz2lkAE2qQThNUmGYZzs89w=;
  b=UopuNC9Jb1t2G1YoH66A/KS+Ke8xl3Bfg3H1zADBJlOM0x7+wHOLvVoi
   hNpH/VzIAP4SqSVXG5F6Wbi0JNXFynK7isHsvb74HHLblH4rcNpz/aeUk
   ByTIace5Ag323N7qO19f60yJRGs2izLnuUzJUcTESf8HlB+hMpNK+6GBY
   GjtV0uZr9QbnsNRjNZfLV4Zwq284O1noclYlhBGzPrEnTjPJdzs7ZPDoN
   eztrCFTm/1wxpn3QDP38WGZ0Z1VO4mQurp8A3s49G664obbdFf+z+pAjP
   CreJjME2rKwQb9ziOhy4c/IsToI/ErEM/8hMSU70ly2n0GWJ55EMexOjT
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sstate: another fix for touching files inside
 pseudo
Thread-Topic: [OE-core] [PATCH] sstate: another fix for touching files inside
 pseudo
Thread-Index: AQHX0ZKnnBtLjSCdSUCePDC6R8ImbqvzlpZA
Date: Thu, 4 Nov 2021 17:01:10 +0000
Message-ID: <ec28e677b4354353ac6f93564fb68f72@axis.com>
References: <20211104154221.57948-1-quaresma.jose@gmail.com>
In-Reply-To: <20211104154221.57948-1-quaresma.jose@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 17:01:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157855

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jose Quaresma
> Sent: den 4 november 2021 16:42
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Subject: [OE-core] [PATCH] sstate: another fix for touching files inside
> pseudo
>=20
> This patch is a fixup for 676757f "sstate: fix touching files inside
> pseudo"
>=20
> running the 'id' command inside the sstate_unpack_package
> function shows that this funcion run inside the pseudo:
>=20
>  uid=3D0(root) gid=3D0(root) groups=3D0(root)
>=20
> The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
> will always return true and the touch can fail when the real user
> don't have permission or in readonly filesystem.
>=20
> As the documentation refers:
> - the file test operator "-w" check if the file has write permission
> (for the user running the test).
> - the file test operator "-O" check if you are owner of file
>=20
> We can avoid this test running the touch and mask any return errors
> that we have.
>=20
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 8182010047..e4d58639f3 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -900,12 +900,12 @@ sstate_unpack_package () {
>  	fi
>=20
>  	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
> -	# update .siginfo atime on local/NFS mirror
> -	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${=
SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> -	# Use "! -w ||" to return true for read only files
> -	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
> -	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-=
dereference ${SSTATE_PKG}.sig
> -	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || tou=
ch --no-dereference ${SSTATE_PKG}.siginfo
> +	# update .siginfo atime on local/NFS mirror if it is a symbolic link
> +	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev=
/null || true
> +	# update each symbolic link instead of any referenced file
> +	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
> +	touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true

To match the original code this should be:

	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.sig=
info 2>/dev/null || true

Or was there some reason you removed the test for if the siginfo=20
file exists before touching it? If so, then the commit message=20
should state this.

> +	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig =
2>/dev/null || true
>  }
>=20
>  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> --
> 2.33.1

//Peter


