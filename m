Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A912C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 16:41:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.702.1681749675479903693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 09:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=m2L5UFBq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-94a342f3ebcso599898366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681749674; x=1684341674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy9Npc11+B0g3QIwqbt9wVYC7Q7sHJU9i4dFqI85nOw=;
        b=m2L5UFBqniMAB16v2IqYXoVgTQhLoD17nlqi/i7UHhsYdOcPn77rQurjW7seIL2cya
         qRoDlRPUIsLbN7ZfuCr7DyL0z7sfrslV0Ko4FPPR2Ft45c5lRwYHqsRyq5Q81FhpnOjP
         nBZVnNPkcUzyO8oaKC8IbXevvgQlGL66grKZWlXRZ80wOXwxmZgf2F8vgrUc+GiJx/QH
         N50CXOir6Yq5kqpnO+OU0xwrKnOLKeBrskNLG7FBkljFX6r+0Q9H9dNu0NHq1eqJ1IBA
         8NA83zpD4apqpOk3WZ9IR7AQ5uDHraA7yipBsWR9x5XYzlcTFMmsIqq59IjwR/kemazz
         7+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681749674; x=1684341674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dy9Npc11+B0g3QIwqbt9wVYC7Q7sHJU9i4dFqI85nOw=;
        b=S3vlZr2rUROGqbBMey4YEXaBaonhdhnuhfHvJVqyodBf9NUPek/0K2DHB0Nt+p3+Ei
         twS7qGWs56Sp4RkCGQIQw94on49JUN9WambTEI0JE/mOatVgFRFWKq8xnN5SPk+oLwWR
         yViR547W2MJuXwT1qlwfGwyyv27yYw9X1uzBlE5EYArO+wirfByWenFkA6GBDY1I5v9U
         O4zeHEREZ3zBN260PenR4l3CBoWJHYDF4VN25Xa0esLK9DWIAKM20Rxii6ZkHFVk5IxU
         oTQ3/z8Ti4QaYQg2pgAb1GANF7mnPSz+jJx8He9PbQBqqWBrX7TY78uvMAvoZoPGVrV9
         RSkA==
X-Gm-Message-State: AAQBX9fjup4ui6O7Ipd+0SumuyPV5+P0ruBjME22iLJukLZ7xzujk94h
	qPrFm7Uo9XuBU3zTUFJ+NDuXu69MKEHPp/Ut6mCWjg==
X-Google-Smtp-Source: AKy350b8a+RLOitRMTP4nbe2gbliMOnhXxzahcSvJMXzmRY38TRbXlTM9lTLiSMle5PuirTRND+E1bSDmXlr+q6cmF8=
X-Received: by 2002:a50:d0cb:0:b0:506:66eb:54cb with SMTP id
 g11-20020a50d0cb000000b0050666eb54cbmr7540885edf.2.1681749673797; Mon, 17 Apr
 2023 09:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230417080512.169770-1-hprajapati@mvista.com>
In-Reply-To: <20230417080512.169770-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Apr 2023 06:41:03 -1000
Message-ID: <CAOSpxdYO7-MnXgOCrWqT0OF54=sWGyUbmN-yyNOHHy8b7mF-1g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] curl: CVE-2023-27538 fix SSH
 connection too eager reuse
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 16:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180163

There is also a patch submitted today that fixes this CVE as well as
two others: https://lists.openembedded.org/g/openembedded-core/message/1801=
43

Could you review the above patch and ack if you approve.  It would be
nice to fix all three patches in a single commit if possible.

Thanks!

Steve

On Sun, Apr 16, 2023 at 10:05=E2=80=AFPM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Upstream-Status: Backport from https://github.com/curl/curl/commit/af369d=
b4d3833272b8ed443f7fcc2e757a0872eb
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27538.patch
> new file mode 100644
> index 0000000000..8ef81fb306
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
> @@ -0,0 +1,31 @@
> +From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 10 Mar 2023 08:22:51 +0100
> +Subject: [PATCH] url: fix the SSH connection reuse check
> +
> +Reported-by: Harry Sintonen
> +Closes #10735
> +
> +CVE: CVE-2023-27538
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/af369db4d=
3833272b8ed443f7fcc2e757a0872eb]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + lib/url.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index f5e54c7..7dd342a 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1353,7 +1353,7 @@ ConnectionExists(struct Curl_easy *data,
> +          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
> +         continue;
> +
> +-      if(get_protocol_family(needle->handler) =3D=3D PROTO_FAMILY_SSH) =
{
> ++      if(get_protocol_family(needle->handler) & PROTO_FAMILY_SSH) {
> +         if(!ssh_config_matches(needle, check))
> +           continue;
> +       }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index 4c18afe293..b0a456016d 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2023-23916.patch \
>             file://CVE-2023-27533.patch \
>             file://CVE-2023-27534.patch \
> +           file://CVE-2023-27538.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180151): https://lists.openembedded.org/g/openembedde=
d-core/message/180151
> Mute This Topic: https://lists.openembedded.org/mt/98314707/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

