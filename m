Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97105C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:43:05 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.17261.1703058176216092909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=IIKuT3nD;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1703058172; bh=z6p+0isZtWczveqp7HPPR5guLXd2aRXYg+HOqAzT6Yw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IIKuT3nDpziyTVGq4yx4FFipiySyWZvT5OaSV4KMpZHu2kX/Hmrgj9X4gqgbPlsdI
	 fHDpsKwr5RwZ5CYsJcVcmld04in6B0EaN/sFuHtoEBXd9FQBI/CFJ3xbK4/Z0uIrJS
	 GDphgVCtm7nRC7Nd0/Nv61Vkd60bMYyqbUiUikRiXdK6xfvWM9u5pCJFY0Ad2toIUf
	 RlCfInHVdO6x1gQMdNbh1MZ1RUJqBOz9Zd6lkyVmnB4Uj98H1xKL94L2GoLb+cLjpl
	 aWQ742elrmkF7NnzpD+q2MJKeKrNXb52CW20jDsdBbXlgTB9qUF3eO6WGNxafg1DKx
	 9e67ERImyQYxA==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 3BK7gpu8949948
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 07:42:52 GMT
Message-ID: <d4b7c6abffb2dbd34f57973fb5785931b4df2644.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH 4/5] sstatesig: Ensure spdx dependencies
 update when abisafe recipes change
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>, Pavel Zhukov <pavel@zhukoff.net>
Date: Wed, 20 Dec 2023 07:42:51 +0000
In-Reply-To: <17A24253EC98E7AB.22731@lists.openembedded.org>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
	 <17A24253EC98E7AB.22731@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.9 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192777

On Tue, 2023-12-19 at 14:35 +0000, Richard Purdie via
lists.openembedded.org wrote:
> If you build openssh, bump the version of base-passwd, then rerun openssh=
:do_create_spdx,
> it will fail due to references to the old version of base-passwd. This is=
 due to
> base-passwd being listed in SIGGEN_EXCLUDERECIPES_ABISAFE.
>=20
> Ignore these recipes for the purposes of create_spdx and force rebuilds w=
hen things change.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/sstatesig.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 0342bcdc87a..1434690f1d1 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -63,7 +63,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, d=
ep, depname, dataCaches):
>          return False
> =20
>      # Exclude well defined machine specific configurations which don't c=
hange ABI
> -    if depname in siggen.abisaferecipes and not isImage(mc, fn):
> +    if depname in siggen.abisaferecipes and not isImage(mc, fn) and dept=
askname !=3D "do_create_spdx":
>          return False
> =20
>      # Kernel modules are well namespaced. We don't want to depend on the=
 kernel's checksum

This fails in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6158/step=
s/14/logs/stdio

since the tune sdpx sigs and the allarch sigs are no longer stable :(.
Not sure what we can do here...

Cheers,

Richard



