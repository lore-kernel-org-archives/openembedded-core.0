Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1827AC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 15:03:32 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.37762.1753887808787146557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 08:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yQjheJ16;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e8986a25cbfso4753452276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753887808; x=1754492608; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPD2HVy0HiWIOV6EMrjomp2XD7ICI0HfbzLopRkAAfQ=;
        b=yQjheJ16ly1Cl/m9ZfvcoykY6mI7mWi8CnmxZgiizo2X5b1WgoDIdtMCAmFBBOkVwk
         aYBHoanLBpv0ibL0AP0h1ZHckUYEpVO38WWamMz2LvKi2+ENhmfv/zhejEp0vbwr9Dfr
         jeOKgees2f2WjoZmLWlD4DQ+WYa/h9vNFV1ARloqoBUYO3znmy9Zhwz26Zwb6jfZoDhC
         JDVsdovsEryVVRUy92npMdnll/iU6XAmNtAvOEMt5fBthUZurPfVfRL2Ddi1TflNYzoe
         Xq/8ZY7rVXeL9BGwhXwiT2Rb6Iqf0MQZJJAt7lpLRikApH60GVwXXxUrxKyOq0BI+pdH
         xk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887808; x=1754492608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPD2HVy0HiWIOV6EMrjomp2XD7ICI0HfbzLopRkAAfQ=;
        b=BBfEBJr/0oAgayeE2BJDm58hYAQDITZzyWAClcGei5p5ZP5rqMsfo71tJEWFEQJJ1X
         NKEB7JMdj7KxTNz28dJHrllIdqqm3VXNiRuexHST8ZJ7yi8p7eyPMgAo+d9GomyW/zfC
         hYv6EUbytgDkdrxIePjv7QLFeW/q5FPGq0mog/Klq/xCbnBAfOK+bmEA0t8TCjZutMCM
         QzxMzcB+1Y1Gj+DMr//QhYejrABxDK+Jw+iYRBG5sqY0JxTPW0AAUh30c272Jdb/rcW1
         LYt64Z5l+jDtnFSRKVCQsB9ZovB6QvDPgOQuuh26j8EpS8ZxrhBT5fdEMNHNY3fzWFAe
         XFCg==
X-Gm-Message-State: AOJu0YzUyH7kSPwvUnxso7hRXW07m8rCmGKtydmCedj6bL5m305z1C8t
	aenb3Oyr1IHqR4rFPO4uKhND6mWjPeoNoXYm1DATH0KOTWInjsxHV3Leuvrx35SegU0qy1xhpZr
	FqUx4J2nMXX9XiEoOqZ7C6sECVzOh8UBbyG1FueuvWQ==
X-Gm-Gg: ASbGncuXkqiTSQKpf5F8vmDBiYJ1OMMo50+MN1hwyy6uTwUyqouVxaVgZ1T5SaVEee2
	jXawxg4bBUzqU4xD6eeURknZosDluv1LYNrw6tAu275Z190nmF+TJZcvlh97hxHwMQ8EC747Q1z
	esxfGNWNzpg8v2qDUD+4iD2l0/Cqhp3zGYx2aLm4ppDK+yX0+kSpicUouYuo9ht0t3/HMyBee5j
	fqZagOvoBIdom/owMnDcbcpMot1ppAGa1sBeA==
X-Google-Smtp-Source: AGHT+IG9RmCr8RM2syMsAxPpDUUfoTggz+ZsmcEN1qgfNsH4KTNwrlCZIyfoEYLqQNdrsTFutXhNRGLycbFPrpt73ZY=
X-Received: by 2002:a05:6902:461c:b0:e8e:de9:5726 with SMTP id
 3f1490d57ef6-e8e31592061mr3633263276.30.1753887807607; Wed, 30 Jul 2025
 08:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250725092632.672324-1-namanj1@kpit.com>
In-Reply-To: <20250725092632.672324-1-namanj1@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Jul 2025 08:03:16 -0700
X-Gm-Features: Ac12FXxL9Vt-NvD378IsGjJY5gkR-pDf_k1GsT1ejvFAyLexa4-GOP2dFp7YUxo
Message-ID: <CAOSpxdYJsE0kZLJizSPJ6muWXHdewxoxpZW8caybdfjR5K=gYg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] tcpreplay: fix CVE-2023-43279
To: nmjain23@gmail.com
Cc: openembedded-core@lists.openembedded.org, akash.hadke@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 15:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221118

Wrong mailing list!  This patch is for meta-openembedded, not oe-core.

Steve

On Tue, Jul 29, 2025 at 5:19=E2=80=AFAM Naman Jain via lists.openembedded.o=
rg
<nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay
> 4.4.4 allows attackers to crash the application via crafted tcprewrite
> command.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-43279
>
> Upstream patches:
> https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac32=
42448a0de94fb901d3560
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit ea99328a0685b577adf4175e4d674c560ce9a490)
> Signed-off-by: Divyanshu Rathore <divyanshu.rathore@kpit.com>
> ---
>  .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 39 +++++++++++++++++++
>  .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/C=
VE-2023-43279.patch
>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023=
-43279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023=
-43279.patch
> new file mode 100644
> index 0000000000..45581268c0
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.=
patch
> @@ -0,0 +1,39 @@
> +From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
> +From: Gabriel Ganne <gabriel.ganne@gmail.com>
> +Date: Sun, 21 Jan 2024 09:16:38 +0100
> +Subject: [PATCH] add check for empty cidr
> +
> +This causes tcprewrite to exit with an error instead of crashing.
> +
> +Fixes: #824
> +
> +Upstream-Status: Backport
> +CVE: CVE-2023-43279
> +
> +Reference to upstream patch:
> +https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3=
242448a0de94fb901d3560
> +
> +Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + src/common/cidr.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/common/cidr.c b/src/common/cidr.c
> +index 687fd04..9afbfec 100644
> +--- a/src/common/cidr.c
> ++++ b/src/common/cidr.c
> +@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, ch=
ar *delim)
> +     char *network;
> +     char *token =3D NULL;
> +
> ++    if (cidrin =3D=3D NULL) {
> ++        errx(-1, "%s", "Unable to parse empty CIDR");
> ++    }
> ++
> +     mask_cidr6(&cidrin, delim);
> +
> +     /* first iteration of input using strtok */
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb=
 b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> index 32c978c1e0..8b41ba25a4 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3D10f0474a2=
f0e5dccfca20f69d6598ad8"
>
>  SRC_URI =3D "https://github.com/appneta/tcpreplay/releases/download/v${P=
V}/tcpreplay-${PV}.tar.gz \
>             file://CVE-2023-4256.patch \
> +           file://CVE-2023-43279.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ff=
bb2785e37ad6d4bf"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221071): https://lists.openembedded.org/g/openembedde=
d-core/message/221071
> Mute This Topic: https://lists.openembedded.org/mt/114429834/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

