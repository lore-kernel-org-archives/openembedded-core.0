Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3700AC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 13:00:41 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web11.44609.1674133234249745633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 05:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@rpsys.net header.s=default header.b=XF105XS9;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1674133231; bh=qMhzjGZMr4Jf8axYNxA8GnX3OXBi9vyGuOlSB08GLnE=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=XF105XS96GpEiPUZA8FFMH8VB0G4RapGWwqUoKq+uWi/th4U2oQk1uvEZNWYuWSl6
	 SoScNvWt3CgTNoW7ANUqAMNLvz4ujz1vGFYq3wLsmsbsCaTtNm1NUbdkY7DyuJe2Xc
	 BhnaXoeIeogTtzjenRKjk8pgsoQwFSQljhS7TgaLQ7hsW9WzDFFRYkTP9W9VJ+uKIe
	 /tTUZZQF0pMk1wx1OCzQCQeTtbaIDrRBvmG4zL2QagErEkhT3vzpsUX1zPrYDWXUO1
	 eFv9XzITesJMvRTtIED7EoThCf9+FMgDTeFIPgshkxSx8NR2Kh3zbRbCMOutRwPd+0
	 BDroRy0gtRlrw==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 30JD0Uq7701110
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 13:00:31 GMT
Message-ID: <f38a5e71b766eabeec8c1297105c51290a3d4a92.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH] meson: use TRANSLATED_TARGET_ARCH in cross
 builds
From: Richard Purdie <rpurdie@rpsys.net>
To: Sergey Zhmylev <s.zhmylev@yadro.com>,
        openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2023 13:00:30 +0000
In-Reply-To: <20230119121002.15819-1-s.zhmylev@yadro.com>
References: <20230119121002.15819-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 13:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176137

On Thu, 2023-01-19 at 15:10 +0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> TARGET_ARCH for most of x86_64 machines sets additional
> -march parameter in meson configuration, which is not supported
> during build and several meson recipes fail.  The patch makes
> meson.bbclass use TRANSLATED_TARGET_ARCH instead of TARGET_ARCH
> in order to properly set -march for cross builds.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  meta/classes-recipe/meson.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
> index 48688bed75..65fd80fc7e 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -97,7 +97,7 @@ endian =3D '${@meson_endian('HOST', d)}'
>  [target_machine]
>  system =3D '${@meson_operating_system('TARGET_OS', d)}'
>  cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
> -cpu =3D '${TARGET_ARCH}'
> +cpu =3D '${TRANSLATED_TARGET_ARCH}'
>  endian =3D '${@meson_endian('TARGET', d)}'
>  EOF

This doesn't sounds correct to me.

TRANSLATED_TARGET_ARCH is TARGET_ARCH with "_" mapped to "-", there
isn't any march change. As such, this commit message doesn't sound
right.

Can you give a bit more detail about the problem you're solving and how
this solves it please?

Thanks,

Richard

