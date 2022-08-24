Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8424C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 13:58:32 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.11149.1661349509593361098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D+gr8l/r;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661349510;
  x=1692885510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IHMrDaT70ePePUgr70w8xrmR2e2Yr/zgDIFXNF4+GKA=;
  b=D+gr8l/r34Ot9CBcRz3+8XwPZv6B9bis8NiGYWnGVwQOL/0cWg8TkMoQ
   rqZWXo7djstVwsJ1CNoMh/J2oUZEixLWVJaZISSBe0gYMG7S0TLsGzpBm
   /kVc6TYBJhjus1Rn3q/7a6nAyqMLqDIBvuvA+f1mR4Hw06ROuyPhtcf7p
   Lh5YrGoaadoJ25ikj9pKfZhymKBHf0hljE7uNWeeKuMqEvj+S4xVQw4t1
   7Au5SsFcgsidKp00e54WZ2me7FvWTbYbBN8lSWzk9ouB8noGDEXggrc2g
   sDs2GobfF+gSG4cOdPNLr+TB8IN65hUyL96x5ZDhPJS5c8GLkn8m1nlFu
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Thread-Topic: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Thread-Index: AQHYt7cRSHWGrcP8wUm8EpgvpR7Rga2+D7iA
Date: Wed, 24 Aug 2022 13:58:26 +0000
Message-ID: <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
In-Reply-To: <20220824124234.3549247-2-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 13:58:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169818

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 24 augusti 2022 14:43
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check tha=
t TEMPLATECONF is valid
>=20
> specifically that ../../layer.conf exists, and that second-from-last
> component in the path is 'templates'.

Please no. This happens to match your expectations, but doesn't at=20
all match our use of TEMPLATECONF. In our .templateconf we set
TEMPLATECONF=3D${TEMPLATECONF:-templateconf} and create the templateconf=20
directory in runtime where we generate the sample files that match the=20
layers that repo has fetched for this particular build. It obviously=20
has no layer.conf file as it is in no layer, and the path doesn't=20
contain "templates/<something>". I can of course change our tools to=20
create a couple of extra directories to match your expectations, but=20
at the same time it seems very unnecessary.

>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 975619789a..db26e3b138 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
>              echo >&2 "Error: TEMPLATECONF value points to nonexistent di=
rectory '$TEMPLATECONF'"
>              exit 1
>          fi
> +        templatesdir=3D$(python3 -c "import sys; print(sys.argv[1].strip=
('/').split('/')[-2])" $TEMPLATECONF)
> +        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir !=3D=
 "templates" ]; then
> +            echo >&2 "Error: TEMPLATECONF value must point to meta-some-=
layer/conf/templates/template-name"
> +            exit 1
> +        fi
>      fi
>      OECORELAYERCONF=3D"$TEMPLATECONF/bblayers.conf.sample"
>      OECORELOCALCONF=3D"$TEMPLATECONF/local.conf.sample"
> --
> 2.30.2

//Peter


