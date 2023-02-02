Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14077C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:49:16 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.13575.1675342149490593993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=V4kyb5nA;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675342149;
  x=1706878149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=80vnerSL9zv/n0c1ivuKv6X99nXul4KaMFCuJepC36A=;
  b=V4kyb5nAMvEAGHLXPyi6f6pgUVKvjoy6IaDIVFUOUQPwB3rrUsHS0wB6
   0/KAPXjX+Kh06NB3K1F8pejiyjZGE3k1d4xtLP10a37h2uiwNp1koZo2e
   xuhR3EAmQrPMK8ROj4hPHQVuXET13S9XOImWKf/1wg02mGSUasqEjOfec
   +VoA9AjGESfBK/QQtQnj1Hi05BeaCNgmFChiDXxDCLxHas5Ymidl4XZK0
   crhABXT4QZVP3hXY58VFEGpew+hu9Y+xUDFyVNTG3lqVKjiuu/oBkxZcH
   OJUbCNTTkDjE2DS0YVA2GW7oVAz6QLqmlg/xhi70lXc2cNvrS1Lu3lp3k
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Tobias Hagelborn <Tobias.Hagelborn@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv3] sstate.bbclass: Fetch non-existing local .sig
 files if needed
Thread-Topic: [OE-core] [PATCHv3] sstate.bbclass: Fetch non-existing local
 .sig files if needed
Thread-Index: AQHZNLYQd1OLX9ospkOWb6QvaepvVq67n7hw
Date: Thu, 2 Feb 2023 12:49:06 +0000
Message-ID: <6ebc02b87f424808b171e7506b2dee33@axis.com>
References: <20230130142025.3899801-1-tobiasha@axis.com>
In-Reply-To: <20230130142025.3899801-1-tobiasha@axis.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176694

Please backport this to Kirkstone and Langdale.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Tobias Hagelborn
> Sent: den 30 januari 2023 15:20
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv3] sstate.bbclass: Fetch non-existing local .si=
g files if needed
>=20
> For the case of a global shared state cache and a local sstate cache
> with a mix of signed and un-signed entries, there is a case where
> a .sig is missing locally, but may exist in the global sstate cache.
>=20
> For this case, do not just fail sstate fetch, but rather backfill
> the .sig file from the global sstate cache.
>=20
> If this case is detected, re-run the fetch operation to get the
> global .sig file (if it exists).
>=20
> Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
> ---
> New in v3:
> * Use exists
> * Consolidate into previously existing fetch block (with new condition)
>=20
>  meta/classes-global/sstate.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index 77e3ea34e1..567de4aba4 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -365,8 +365,9 @@ def sstate_installpkg(ss, d):
>      d.setVar("SSTATE_CURRTASK", ss['task'])
>      sstatefetch =3D d.getVar('SSTATE_PKGNAME')
>      sstatepkg =3D d.getVar('SSTATE_PKG')
> +    verify_sig =3D bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), Fa=
lse)
>=20
> -    if not os.path.exists(sstatepkg):
> +    if not os.path.exists(sstatepkg) or (verify_sig and not os.path.exis=
ts(sstatepkg + '.sig')):
>          pstaging_fetch(sstatefetch, d)
>=20
>      if not os.path.isfile(sstatepkg):
> @@ -377,7 +378,7 @@ def sstate_installpkg(ss, d):
>=20
>      d.setVar('SSTATE_INSTDIR', sstateinst)
>=20
> -    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
> +    if verify_sig:
>          if not os.path.isfile(sstatepkg + '.sig'):
>              bb.warn("No signature file for sstate package %s, skipping a=
cceleration..." % sstatepkg)
>              return False
> --
> 2.30.2


