Return-Path: <bmauduit@beneth.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399D1C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 16:33:28 +0000 (UTC)
Received: from mail.socneth.com (mail.socneth.com [54.36.198.193])
 by mx.groups.io with SMTP id smtpd.web11.47331.1676997202320370925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 08:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@beneth.fr header.s=mail header.b=GFrzy4vB;
 spf=pass (domain: beneth.fr, ip: 54.36.198.193, mailfrom: bmauduit@beneth.fr)
Message-ID: <7f21c73e-3e1b-dc78-e030-6ee47360487f@beneth.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beneth.fr; s=mail;
	t=1676997200; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/yd3sBs8PAZsEfAi0jd0UgV3qeqXW7JhSRPg2sbs2g=;
	b=GFrzy4vBIChHXbB3qeyIRL6L0KlqLyl1mlIinS/yreyoDXqJfWlXWTdyythoDQd1KW2uOs
	pOmml0XCG/4IDAo63RwBTQWtIH1V4q+ZCDZT7vTgypnBbYQYzgnOLWZOas7i4O7Rbc4mxo
	Vd8L9xnKvTzzo8kFZ7lZRHakLt1Ei/xp+k/CSRBRs8gLetFa5Ata+uxLpO/2noE4NLFL8p
	mn9kgwOpw9nfCUAjQbpAwc2Epw/JfjnXn13Ppihgd8gM9o/kGVhNYo1DwQOdskeHCl1qvW
	pBDX+UXbfw76qXXF+Ag5xzCDIKfDky3ArJgqCqhdq5HaGLngm8XU914wA7TtIQ==
Date: Tue, 21 Feb 2023 17:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: bmauduit@beneth.fr
Subject: Re: [OE-core] [PATCH 1/1] lib/oe/reproducible: Use git log without
 gpg signature
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <cover.1673521664.git.bmauduit@beneth.fr>
 <1739928B5F55BD9D.23170@lists.openembedded.org>
From: =?UTF-8?Q?Beno=c3=aet_Mauduit?= <bmauduit@beneth.fr>
In-Reply-To: <1739928B5F55BD9D.23170@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177527

Hello,

Any update on my patch ?

Thanks,

BR,

On 1/12/23 14:23, Beno=C3=AEt Mauduit via lists.openembedded.org wrote:
> Previously, if "showSignature" is present in user gitconfig, parsing
> of the timestamp will fail.
>=20
> Ideally we should replace this command with a git plumbing command.
>=20
> Signed-off-by: Beno=C3=AEt Mauduit <bmauduit@beneth.fr>
> ---
>   meta/lib/oe/reproducible.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
> index 04a1810d4f2..9ac75c02e38 100644
> --- a/meta/lib/oe/reproducible.py
> +++ b/meta/lib/oe/reproducible.py
> @@ -115,7 +115,8 @@ def get_source_date_epoch_from_git(d, sourcedir):
>           return None
>  =20
>       bb.debug(1, "git repository: %s" % gitpath)
> -    p =3D subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '-=
-pretty=3D%ct'], check=3DTrue, stdout=3Dsubprocess.PIPE)
> +    p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '-=
-git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
> +                       check=3DTrue, stdout=3Dsubprocess.PIPE)
>       return int(p.stdout.decode('utf-8'))
>  =20
>   def get_source_date_epoch_from_youngest_file(d, sourcedir):
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175795): https://lists.openembedded.org/g/openembed=
ded-core/message/175795
> Mute This Topic: https://lists.openembedded.org/mt/96222114/7398344
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bmauduit@beneth.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Beno=C3=AEt Mauduit
<bmauduit@beneth.fr>


