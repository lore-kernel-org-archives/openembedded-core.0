Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1A9C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 17:36:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.3201.1645119384632543149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=NkruwX3j;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645119384;
  x=1676655384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OwUFo0zQRt2eY3zPICgAFoG3a/3ruLKv1haxe3SND6A=;
  b=NkruwX3jYy4CeaqC/4xohtvk+rGFB2IKs2IlZ2Vym6El9jVeN3Stuwkg
   7Su4us7SxzMhOZVhDV/yhMaG+jqDEom5sDKTT7R1zu7HGNtPECDHoe44E
   2HiUcLfXqAw9KyWCPFt9oBJg/FrKolytsdH7yJwPNEduQy2w1qQmRKQxW
   Q+rNyyIeWZRWT9c3L6e/oepv1OhCeSf1zrGYLS+z8yI4Ip4zcd1+HxyDF
   mwn6K3oFQf1wmhKZOzSviTxr9Lnp1th0V1hJfYa1rKFb5JvTmKv4EBYJ7
   Wq8Id+XRtCMcYAoDSbCdlE075MtO7xGzGITUOOsxBzZo47xcYB35Nw/k/
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in
 addition to 'master' in upgrades
Thread-Topic: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in
 addition to 'master' in upgrades
Thread-Index: AQHYJBjmSjnfMqRryk6Q7P4FIgkne6yX/YFQ
Date: Thu, 17 Feb 2022 17:36:21 +0000
Message-ID: <41d3206a0e2d4aa392e80483a503cb86@axis.com>
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-4-alex@linutronix.de>
In-Reply-To: <20220217160939.1424397-4-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161847

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 17 februari 2022 17:09
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in addi=
tion to 'master' in upgrades
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/lib/devtool/upgrade.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
.py
> index 826a3f955f..7957d41192 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -192,7 +192,7 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, srcbranch, branch, kee
>              get_branch =3D [x.strip() for x in check_branch.splitlines()=
]
>              # Remove HEAD reference point and drop remote prefix
>              get_branch =3D [x.split('/', 1)[1] for x in get_branch if no=
t x.startswith('origin/HEAD')]
> -            if 'master' in get_branch:
> +            if 'master' in get_branch or 'main' in get_branch:
>                  # If it is master, we do not need to append 'branch=3Dma=
ster' as this is default.
>                  # Even with the case where get_branch has multiple objec=
ts, if 'master' is one
>                  # of them, we should default take from 'master'
> --
> 2.20.1

This seems incorrect since the branch=3D parameter is always=20
required nowadays. I would more expect the code to look something=20
like this:

            if len(get_branch) =3D=3D 1:
                # If srcrev is on only ONE branch, then use that branch
                srcbranch =3D get_branch[0]
            elif 'main' in get_branch:
                # If srcrev is on multiple branches, then choose 'main' if =
it is one of them
                srcbranch =3D 'main'
            elif 'master' in get_branch:
                # Otherwise choose 'master' if it is one of the branches
                srcbranch =3D 'master'
            else:
                ...

//Peter


