Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3AFC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 11:51:47 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.231])
 by mx.groups.io with SMTP id smtpd.web11.32296.1718538704283582943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 04:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=Xt+reNZd;
 spf=pass (domain: freemail.hu, ip: 46.107.16.231, mailfrom: egyszeregy@freemail.hu)
Received: from [192.168.0.16] (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4W2BF92HNbz3Sh;
	Sun, 16 Jun 2024 13:51:41 +0200 (CEST)
Message-ID: <2c451a09-c3da-4e3c-ac0b-8c7de58abf8b@freemail.hu>
Date: Sun, 16 Jun 2024 13:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] archiver.bbclass: Fix work-shared checking for kernel
 recipes
To: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, alexandre.belloni@bootlin.com
References: <20240614073729.269-1-egyszeregy@freemail.hu>
Content-Language: hu, en-US
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
In-Reply-To: <20240614073729.269-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1718538702;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 11:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200776

	s=20181004; d=freemail.hu;

	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;

	l=1635; bh=1fiJfW0V1C8Kq/Y/NPXYkrKrLuICcukhIYXs2WOdy98=;

	b=Xt+reNZdPVpuwwNchfeGSWuAPV5ELO4b4uUn8hYMqjn+mG23CyxrueMMzMLatnto

	1co0/woyq0SOoq+6syRfuPeYTirF3jYskOhLCYYuIwtcHEtl5iO5GdB28XZakSQ2X74

	yOpevSV0yxyd/5VFEVo/rIBy700DU5Q1FXkllXaUlJrpW7doN6C1yXBNH9cUAjS4+5f

	7eqYJkHodDizKI6zkPuDOksSda0uPZ6zuMyy1aWjAaDqjeKTLeNhrFMJRvsu9O7IorS

	L8yKZKQz2tJYnz4TKT/D8vbs1g1lG4LSXF6uI7M+prxeXGezjUFWNHysogZY0QEnAuq

	YhX4bbfcEw==
Content-Transfer-Encoding: quoted-printable

2024. 06. 14. 9:37 keltez=C3=A9ssel, egyszeregy@freemail.hu =C3=ADrta:
> From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
>=20
> Source dir can be a symbolic link in some BSP's linux kernel recipe
> which points to work-shared path (like linux-fslc in meta-freescale).
> Change to use os.path.realpath() in order to get real path of
> source dir.
>=20
> Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
> ---
>   meta/classes/archiver.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcl=
ass
> index 2d0bbfbd42..9d286224d6 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -473,7 +473,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
>  =20
>   def is_work_shared(d):
>       sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), 'work-shared')
> -    return d.getVar('S').startswith(sharedworkdir)
> +    sourcedir =3D os.path.realpath(d.getVar('S'))
> +    return sourcedir.startswith(sharedworkdir)
>  =20
>   # Run do_unpack and do_patch
>   python do_unpack_and_patch() {

Hi,

As i see my first patch is already applied to master-next branch of=20
openembedded-core.
https://github.com/openembedded/openembedded-core/commit/6d86b3436cb83574=
e49441d32af35aa69b56d918

Can you replace it with my [PATCH v2]? V2 is much better in solution with=
 usage=20
of os.path.realpath() to check what is the real path of the symbolic link=
 git=20
folder. When it points to work-shared it is os.path.realpath() solve it t=
o check=20
properly. This is a much more elegant solution than having to check inher=
ited=20
kernel class usage all the time.

