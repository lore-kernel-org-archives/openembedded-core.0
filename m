Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B34C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 09:30:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.7080.1737624646862325605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 01:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WtfZ/gdT;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3072f8dc069so6740951fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737624645; x=1738229445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7olPk0uLNBIF6tKf5ULYwj4DHvtjVy9E6QnNVSJOh18=;
        b=WtfZ/gdTYjEJVFd3/n8QfzaOsJnybopaHxZTpSXdXiL8JY4cl/wUvr+UCR6qIoH64N
         Rr7N17B5c0QF+rgO34oo/hoAjlx7Fv9B7PJhQKtF7X8WzC/2sAChm22kfWtmCN61A4Z6
         Tda4bkvzdDNtxcQS10CmSKlCOpJ9Xa8c9B5tAGEbUA1MAzCBh4qAFQCIGRVGoILkphZB
         P/rroYOvN0wCCTlJYhfNWjTxztgIgtAzZw8GzTGH5tRxMZJSMJ5GgXPk/ZmOuYZd7JXZ
         F96/932lYmAIkHZKRzey3a0cwp6QBjrd82E/tL+C/2pw/1E0GxunjgSdjLU0SU8Ap9q5
         aAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737624645; x=1738229445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7olPk0uLNBIF6tKf5ULYwj4DHvtjVy9E6QnNVSJOh18=;
        b=A3qCAHBQCsQnk45ZVsl+yEUPwtPKRgALQCz84uFAApRZ5+LlDEtQ/0FFpkUVHqdVtA
         ozrS8HjPrt4Mq6CP74y+QrdAyg6ALvGB0EHtCEOEF9IqAhVyh+VWnewjHA47H7GQYqcK
         6BvNoOY2L4DtPleRLa1yVT9dh+5gxabOP1/SrpHqdmFAnN3PoX1E6lPClI+nQm/yE1Ja
         vl0Qhsd3Pkvy+12OsCJ1pcwv0Fv3aXtvbIuPcrV/d/KegSd7sZ5xu1HO3s5DbhSNm25f
         6qY6CUJNsY3R3u8FNyePswTbMtNrNkd/46njVbzhyhDN1FFQrEDGy69/EVMBb8jgQb7a
         Bc0g==
X-Gm-Message-State: AOJu0Yxc5+qSq+9+VCeLF3s+mQBlxX1yhf9FuQ1oIK9ThKcv8lIp/5H3
	ERzpfNHKl7KntpflDZ9l/83G3MlGZM9YxonHVXod8PPAN8pESxPjdugugHIZYuuL3uAUG725oaN
	UwbSnfbfeUlLAK3EBvkt2ilYPIVA=
X-Gm-Gg: ASbGncviYP36RmfecA/ymfAKay4q9OmiCw+UKlJ+vFr+Lq79CQgDpSRoP9FOViJzd82
	9oDrwSf4FlgOTYQSlU9n30rZobbTa7WnKxD+5Fs/1bh+tuE2aWD/8oF+bFRv03RKV
X-Google-Smtp-Source: AGHT+IGhDTDFpzPp/b6DC0PjGatq6dWgGx8g9odTbbSFu/FuGAynMiSxGXnifuRV32yr2nDKti6NRRaK0+AH8DSpEwE=
X-Received: by 2002:a05:651c:49c:b0:300:329e:23fb with SMTP id
 38308e7fff4ca-3072cb3f0bfmr81709821fa.34.1737624644570; Thu, 23 Jan 2025
 01:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20250123092734.1438242-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250123092734.1438242-1-jiaying.song.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Jan 2025 10:30:31 +0100
X-Gm-Features: AWEUYZnGurxIleixZnGuCBqlbdMgEksqdeT0-ZMZzxgGdgWfJp2s9HM4EPFG5l0
Message-ID: <CA+chaQcBLw4p4V3QMyx+hejgRUL8foYw919wE=N0jfJTYq5k7w@mail.gmail.com>
Subject: Re: [PATCH] boost: fix do_fetch error
To: jiaying.song.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 09:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210185

And now missing the [scarthgap] in subject, but luckily Steve already
picked this and fixed your e-mail as well, see:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/s=
carthgap-nut&id=3D7ecd0d5584b7692b58ac8039b4107c4e0836d553
https://lists.openembedded.org/g/openembedded-core/message/210173

On Thu, Jan 23, 2025 at 10:27=E2=80=AFAM <jiaying.song.cn@windriver.com> wr=
ote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Change the SRC_URI to the correct value due to the following error:
> WARNING: boost-native-1.84.0-r0 do_fetch: Checksum failure encountered wi=
th download of https://boostorg.jfrog.io/artifactory/main/release/1.84.0/so=
urce/boost_1_84_0.tar.bz2 - will attempt other sources if available
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-support/boost/boost-1.84.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-s=
upport/boost/boost-1.84.0.inc
> index 5bbea2ba5b..be1ad20f47 100644
> --- a/meta/recipes-support/boost/boost-1.84.0.inc
> +++ b/meta/recipes-support/boost/boost-1.84.0.inc
> @@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
>  BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
> -SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/so=
urce/${BOOST_P}.tar.bz2"
> +SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
>  SRC_URI[sha256sum] =3D "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14=
c3e7949c24109454"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> --
> 2.25.1
>

