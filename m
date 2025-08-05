Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC381C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 13:38:05 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.22260.1754401079504684908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 06:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FsUw7KkT;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8fd5c86675so4121104276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754401078; x=1755005878; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uku6oiangzjVnsajuXDybzFebNTNiUfw4aKzoV2i18=;
        b=FsUw7KkTGitNGkXn/+2nr3CRLEKG+VK4t0Zig5TgO5cbH8U/PZCorHz85mTw9MMvt1
         PHJCvAw+sItY0rQ7SAIK/ou2BoXXLW2iTy/k3lmssZ5qdPFGiKN04/ENjTSqke790d7H
         npN1a10CW0GPqdyPNUnakId0Hl/mHbmO8E/2hQ0kAY5mo91riICCpi7mxHRiWDQlAgU4
         ID3XBuPKp70HL8Wr4q0PGqVwCOG5b3z9ZndkQZfraDgg1uiwGHOtb1VofJgMzHFW0GOv
         dfo5v6nArI8olIiGZJrOhUqAhWFMrjlxtKRMJcvFrIv/gQliyOaWYMD0MBunUxMiOU1Y
         lQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754401078; x=1755005878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uku6oiangzjVnsajuXDybzFebNTNiUfw4aKzoV2i18=;
        b=e7jvUrSakinBAMB8bLiG2XFDL6nESzeNeCwSzc/xO5tftoTapB3vj4hQyilsBKp2t4
         AHPBffy0KtZWLSJCkArNvPks8SIEKJaVWVuYxJ+7vAPA1bw/bU4miHUHqFXi1DrkUUX5
         LPcW9loqgsUhBzWehwfOxdYZIoguS2dG/pCHcQWz6suyHwWTHfWs2EmHkaB2fVVAIUuq
         0RYC1deOZiXJWLggS3ntxoGATrfMp/PNo5ZOF8SDxahDFLM2bUZDLL9YbpDfvS9E+whP
         e+f6tioij6mI+xfToBcQGQwHCPMaHobJ/v72NRvwVq0/swKMvvS3tPcaWm/SFPC6Y/aT
         UsPg==
X-Gm-Message-State: AOJu0YwGa/Mj9thqvMgz+0J9jE7TXaM06EpxgFyL7XcO4qTKL9fuoNzl
	GJM69hP1ZO3zs8lIK0PAQssR3PDozaSxy/DdpzR7YDYSQa1BroqXuK+Z5J8lFk9J8Fr2ZL2GCyN
	W7YngKs7UwJ1RIaXBZi5iMRvwVkQHKfkD2F1KZRmjZy17u+MXaMk+
X-Gm-Gg: ASbGncvl/6lP4nPsJJeOla7ifqa3Z/oeJeue7kFDKKQhwKnW5FqkJfGtb+2jE4QEYkx
	k9ZcEVF9+R1DYqerrF18ZvrKHPBEQV5UQmT359MbJvql8t7nXr0F+/bpaaluW99vysYFwnZPnou
	w2PSoUYSkmwJMcenKGcJrnVx+pHxVEmKKjAPoD0cyi2Af41zk21ezOCxaFovgMyEK9GyN24/8zq
	qwFP9Q8CCg++Jbjft7xjVFhF5XncrD3NecS1Ih7j8qcmSPW
X-Google-Smtp-Source: AGHT+IEYE0g2SOua70oFTkaMntaBVp1OiJuVWHYV6rdPOLJ6DgfavJKbdYyjw7vZFexXQ2qGcRIX9T8qQ2OQGrCPZSY=
X-Received: by 2002:a05:6902:6d06:b0:e87:b846:33b9 with SMTP id
 3f1490d57ef6-e90254d547cmr369055276.21.1754401078367; Tue, 05 Aug 2025
 06:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250805062005.254626-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250805062005.254626-1-jiaying.song.cn@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Aug 2025 06:37:45 -0700
X-Gm-Features: Ac12FXyGkLDndXi0Bk_qmHYmZsb0a1vnSxSCl3oon_qAbsAzoJB7_ewgRhpKLyU
Message-ID: <CAOSpxdZHSfEW17ni3+ZOA77HOy8taahQUQ8E6+Yk+tCTaL=MKQ@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] ca-certificates: correct the SRC_URI
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 13:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221474

You'll need to submit this for master first, once it is accepted there
I can take it for stable versions.

Thanks!

Steve

On Mon, Aug 4, 2025 at 11:20=E2=80=AFPM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> The original tarball URL is no longer valid, as it has been moved to an a=
rchive
> location. This update points to the new location.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  .../recipes-support/ca-certificates/ca-certificates_20241223.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_2024122=
3.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> index bbdc7dd68d..7977e3ae5c 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> @@ -15,7 +15,7 @@ DEPENDS:class-nativesdk =3D "openssl-native"
>  PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
>
>  SRC_URI[sha256sum] =3D "dd8286d0a9dd35c756fea5f1df3fed1510fb891f37690389=
1b003cd9b1ad7e03"
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz=
 \
> +SRC_URI =3D "https://snapshot.debian.org/archive/debian/20241223T143500Z=
/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
>             file://0002-update-ca-certificates-use-SYSROOT.patch \
>             file://0001-update-ca-certificates-don-t-use-Debianisms-in-ru=
n-p.patch \
>             file://default-sysroot.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221452): https://lists.openembedded.org/g/openembedde=
d-core/message/221452
> Mute This Topic: https://lists.openembedded.org/mt/114544635/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

