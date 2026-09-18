Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96DBC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:03:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6405.1789718631352409913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UVIaFrEp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1180D4E4088D
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:03:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D47A960649;
	Fri, 18 Sep 2026 08:03:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14DD011C7B08B;
	Fri, 18 Sep 2026 10:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789718627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tv6965bVRB/6fiZl0uCl0rDMMV44O3HOyhuj7530ttg=;
	b=UVIaFrEpjjrUt7V/hufBx/GiDhwmz96bJqoAansto7lqhpbhIsgv+dgHtUo8sigcSx7Eau
	543XpSPmP2oLZDDl8ZOJVoVJ8HNSZxfUizgzGYF4QGIqn0lUtONQ4v81O0zVvYqgpDz27i
	Lpd0LuXyPlhU1tkIimgFvhDQOoyzTrKGgGbdGOfFgCIcpGcpEPE6FtXZvT/4dvqrb4dmJ1
	c13RYA0Hs+/NiNDNTalnN6ePEexZBqI4nvOGbrLCBpkicUoXXPZCgrnWEpeNb7UJhA2Eb5
	S9HOIkCrhVJxgfdSYnCNob9BPDMVdXUdCGourpe7y75o1XgSoeSN5isAJGe9dA==
Message-ID: <970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootlin.com>
Date: Fri, 18 Sep 2026 10:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] classes/archiver: fix tarball content in "original"
 mode
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, paul@pbarker.dev
References: <20260909170357.2887215-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260909170357.2887215-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246195

Hello, folks

On 9/9/26 7:03 PM, Jo=C3=A3o Marcos Costa wrote:
> When ARCHIVER_MODE[src] is set to "original", a tarball is generated wi=
th
> the unpacked sources of a given recipe. Prior to it, a tmpdir
> (i.e. from tempfile.mkdtemp()) is created and the sources are unpacked =
inside:
>=20
> (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
> `-- vim-9.2.0340
>      |-- READMEdir
>      |-- ci
>      |-- lang
>=20
> This tmpdir, however, ends up being shipped in the deployed tarball:
>=20
> $ tar -tf vim-9.2.0340-r0.tar.xz
> (...)
> tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
> tmp8pu2nsck/vim-9.2.0340/LICENSE
> tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
> (...)
>=20
> This can be avoided by pointing to the subdir where the sources are
> unpacked, rather than to tmpdir, when calling create_tarball().
>=20
> The subdir's name can be inferred from 'BP', so we will use
> 'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.
>=20
> e.g. and in the result:
>=20
> ./
> ./vim-9.2.0304/
> ./vim-9.2.0304/SECURITY.md
> ./vim-9.2.0304/.codecov.yml
> (...)
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/classes/archiver.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcl=
ass
> index b274c53e79..c824718a1d 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -230,7 +230,7 @@ python do_ar_original() {
>                       else:
>                           bb.fatal("Cannot determine archive names for =
original source because 'name=3D' URL parameter '%s' is used twice. Make =
it unique in: %s %s" % (tarball_suffix[name], url))
>               tarball_suffix[name] =3D url
> -            create_tarball(d, tmpdir + '/.', name, ar_outdir)
> +            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.'=
), name, ar_outdir)
>  =20
>       # Emit patch series files for 'original'
>       bb.note('Writing patch series files...')

Gentle ping: would there by any updates on this one?
Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa


