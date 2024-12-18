Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20123E77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 23:15:59 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.118298.1734563757963297160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 15:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMKhaKab;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a01bcd0143so86033fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 15:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563757; x=1735168557; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cedNiWZQLJwI6jY6qIJjuC0wKk/W/76xjHESjVOItSo=;
        b=ZMKhaKabRDPthA9kopJQ7nYAh+gzkn5Ky66xYDbEatzIQpd79EFcmCGBJTZjM9QLlV
         Jo77fe0DXrptGko2e2tvk69gFQSap/+ChKnBupPMRYsrjbgY3WvEy8kbCCZxEMWGjFwS
         XUkOIC2kZF5fdERp84WyGma342wEua9pvzUqXYPP564BXuO1p0MO2y/9g2K86MFSTgRI
         BovV6Fgp0IpcNVflAnzm2Pls24Ry4NFTt7qBKNEM4Y5FiSv0WeRn8jaK6NG9XK3giQxI
         G3hI02FXk8W/gl7o6xqiy8iuXx7Ol57NtEp69vIPlTTKqCvtR6YwjbyLgwqWET8Khne7
         VZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563757; x=1735168557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cedNiWZQLJwI6jY6qIJjuC0wKk/W/76xjHESjVOItSo=;
        b=ruDv1vXth4jwpwtdoksGk70JrdxkDLu4bjNv8NdrIov7pWlpascl4roIzADJA5peP9
         YLOfEWD2g+HGdIMYcr+Mv58S2ZRUwjESkZ0+k9MTdwamk1NJLDFCgzsHrj9crKi7n8SV
         fZugxLjYqmeRk04SqiAx9pef8ygEo2P03M6EEFZ+c76jBTkUJTmBLxNMuJaZ4Yen3X53
         X+oBLZRPU+OzVBJ1WZ3owEbRbpHPCYU9pw6r/qet5rxUHywp62x95ZSx5VaUJvfu7d/p
         2x1xcdiwa89e3vhWFfns0IPZlHThlYGNVszNe2zvas2Pvx0GUWlxJ3vozwW75sB4/auL
         9aAA==
X-Gm-Message-State: AOJu0Yw5SwNhe44mddkycy8sFj/wBMpGChvqcsQRiLTf2b270+t9/0n5
	X/d9/O9r1ZTTLm1N5uyOfvC3GFyEGm7afV2IvLDkvCYDl+HYOHJO67MIpZlxTGqf4h/ybF2mIot
	kgt5n0GG1TJ2QT+oU40xOZ5AnrIs=
X-Gm-Gg: ASbGncuLvs7k2Q+QhnKgxNKd1WAz9rE2FGmeOCJ/bz8f4PH8Qnr5K+JdGT2nazoV1St
	1DvJowED/iM+ZU+gusefQxNsZTexWYyGkdqW8GQ==
X-Google-Smtp-Source: AGHT+IHKn2bQOm82JEfhyYmTY2i/qrY5If5Nr/2fZ+OqDk74++i3Qc1eLBLnC+axDV+kjkJBLCvqGe64wTEcQuNN7bM=
X-Received: by 2002:a05:6870:b30a:b0:29e:7a09:d92a with SMTP id
 586e51a60fabf-2a7b300d311mr2250340fac.5.1734563757173; Wed, 18 Dec 2024
 15:15:57 -0800 (PST)
MIME-Version: 1.0
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com> <1734425887-18069-16-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1734425887-18069-16-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Dec 2024 15:15:31 -0800
Message-ID: <CAMKF1spEOtEPuB92Er4q-mWsZ+Ktp8XJ0J0-5gHddNLYAE0nRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/21] nfs-utils: upgrade 2.8.1 -> 2.8.2
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 23:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208893

This fails to build with clang+glibc

file.c:200:8: error: assigning to 'char *' from 'const char *'
discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   200 |                 base =3D pathname;
|       |                      ^ ~~~~~~~~
| 1 error generated.
| make[3]: *** [Makefile:475: file.o] Error 1
                                =E2=94=82
=E2=94=82| make[3]: *** Waiting for unfinished jobs....
                                 =E2=94=82
=E2=94=82| make[3]: Leaving directory
'/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/nfs-utils/2.8.2/nfs-u=
=E2=94=82
=E2=94=82tils-2.8.2/support/nsm'

On Tue, Dec 17, 2024 at 12:58=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../nfs-utils/{nfs-utils_2.8.1.bb =3D> nfs-utils_2.8.2.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.1.bb =3D> nfs-=
utils_2.8.2.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> similarity index 98%
> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> index 488a1a7e70..543c68f7f5 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> @@ -33,7 +33,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/=
${PV}/nfs-utils-${PV}.tar.x
>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch=
 \
>             "
>
> -SRC_URI[sha256sum] =3D "a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28=
673ccfd2eff0c505"
> +SRC_URI[sha256sum] =3D "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8=
606196d358e7fb15"
>
>  # Only kernel-module-nfsd is required here (but can be built-in)  - the =
nfsd module will
>  # pull in the remainder of the dependencies.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208820): https://lists.openembedded.org/g/openembedde=
d-core/message/208820
> Mute This Topic: https://lists.openembedded.org/mt/110160089/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

