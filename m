Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BBAC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:23:12 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.104831.1680621781675567520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HqEMewgl;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id y4so132203467edo.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680621780; x=1683213780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhdZwd2YqWq2ggIG6Riluf6VS35+PMMhadklMYUGqAQ=;
        b=HqEMewglGuyNcJdr1hX7LDWaHJpTjbF0EY2M2jfg0ipMgCysDknDGtgRURrRpIJtzY
         GqtsihJ2EFVrLqSkNZdD8vb8BwAxv5BAJ9HScwaBNsh46/YJtC0LkAkjFIrAONBgd2kg
         5BxYfW5kgrbKGWvC6e4RmHq21q3p79e99hdpXKlzu5ySaGN7v98MahiHjVZeVIvZUrnT
         dTf0RiLO/0/HwGJmb8QLYwv7QyKnPXGIy1HcizS3nw0yaDZMfttlgqKv/Vz1A4sT4iyE
         RnttZTOj9FUTAa8Ub2WOrDlzfQvX4/gw9kUl0d/wmdms7BiOTg//SfAspaDSY7yNGPo/
         wnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621780; x=1683213780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhdZwd2YqWq2ggIG6Riluf6VS35+PMMhadklMYUGqAQ=;
        b=jB9/tzRlvJjS7IJyPlftuX9Io7glKLBCQIy21u8FOK+SUA4dT5sVTXoMEeaq3aBkiq
         o8AUo4Gz3+ezTYj8vIpvAnLf8+usKzZVj+AhEyR3Q3vMq2pSdIat4Wr7dL3ynJYKMq+c
         Zg/DgroNhuAPnR127CMimN8ID7ZXsoZBZLrn2W4vaXTmMdPxBZKidewnrqT+C5EUASUz
         1hYXQsoCYe6Jf133Ld2zNxKTaXY3wJfLb5JazmoTSd2lvZC91I1opx2lXDg0Zs3OmEkt
         ZPl5+3ltf0jN9rI201dyHr4R2S4iX7N4kjA9XYcFbIJtvNuJHngv3cWe5g4+XX83BB16
         I02A==
X-Gm-Message-State: AAQBX9c8BetESgGGbcR16P+JwDJ5wJZlIiHSBHuPKAfkm4Rt9cxIlsV3
	X36xUoc8bwEYT6tg9OLxZLAnny6mD9BTg7nL2kgdJw==
X-Google-Smtp-Source: AKy350YZl4n9xqhN6HNWZOo1Cvv426JhEyaIz1kgxaVrCPCqLKlyHMPCnu2SV1Yf+gYv1x5JVdzwd55Yh/XziyC9ZQw=
X-Received: by 2002:a50:9f4f:0:b0:502:227a:d0da with SMTP id
 b73-20020a509f4f000000b00502227ad0damr1664662edf.2.1680621779837; Tue, 04 Apr
 2023 08:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230404133718.50343-1-badganchipv@gmail.com>
In-Reply-To: <20230404133718.50343-1-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 4 Apr 2023 05:22:49 -1000
Message-ID: <CAOSpxdaQkNHiZyjdEaEUK4LUwDoq7R80Np2po-44_keE8BmNfQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179700

This seems to fix the fuzz issue, I'll add the patch to my queue for
autobuilder testing.

For future patches there is no need for [meta] in the subject line.
Just something like "[OE-core][kirkstone][PATCH] curl: Add fix for
CVE-2023-23916" is perfect.

Also when you are sending multiple versions of the patch use something
like: "[OE-core][kirkstone][PATCH v2] curl: Add fix for
CVE-2023-23916" and include a comment after the line with three dashes
describing the changes in this version.  See below for example.

Steve

On Tue, Apr 4, 2023 at 3:37=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.c=
om> wrote:
>
> Add below patch to fix CVE-2023-23916
>
> CVE-2023-23916.patch
>
> Link: https://curl.se/docs/CVE-2023-23916.html
>
> Signed-off-by: pawan <badganchipv@gmail.com>
> ---
V2: fix fuzz errors

>  .../curl/curl/CVE-2023-23916.patch            | 219 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
>  2 files changed, 220 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-23916.patch
> new file mode 100644
> index 0000000000..a57d275902
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> @@ -0,0 +1,219 @@
> +From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
> +From: Patrick Monnerat <patrick@monnerat.net>
> +Date: Mon, 13 Feb 2023 08:33:09 +0100
> +Subject: [PATCH] content_encoding: do not reset stage counter for each h=
eader
> +
> +Test 418 verifies
> +
> +Closes #10492
> +
> +CVE: CVE-2023-23916
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/119fb1871=
92a9ea13dc.patch]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +---
> + lib/content_encoding.c  |   7 +-
> + lib/urldata.h           |   1 +
> + tests/data/Makefile.inc |   2 +-
> + tests/data/test387      |   2 +-
> + tests/data/test418      | 152 ++++++++++++++++++++++++++++++++++++++++
> + 5 files changed, 158 insertions(+), 6 deletions(-)
> + create mode 100644 tests/data/test418
> +
> +--- a/lib/content_encoding.c
> ++++ b/lib/content_encoding.c
> +@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str
> +                                      const char *enclist, int maybechun=
ked)
> + {
> +   struct SingleRequest *k =3D &data->req;
> +-  int counter =3D 0;
> +
> +   do {
> +     const char *name;
> +@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str
> +       if(!encoding)
> +         encoding =3D &error_encoding;  /* Defer error at stack use. */
> +
> +-      if(++counter >=3D MAX_ENCODE_STACK) {
> +-        failf(data, "Reject response due to %u content encodings",
> +-              counter);
> ++      if(k->writer_stack_depth++ >=3D MAX_ENCODE_STACK) {
> ++        failf(data, "Reject response due to more than %u content encodi=
ngs",
> ++              MAX_ENCODE_STACK);
> +         return CURLE_BAD_CONTENT_ENCODING;
> +       }
> +       /* Stack the unencoding stage. */
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -682,6 +682,7 @@ struct SingleRequest {
> +   struct dohdata *doh; /* DoH specific data for this request */
> + #endif
> +   unsigned char setcookies;
> ++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
> +   BIT(header);        /* incoming data has HTTP header */
> +   BIT(content_range); /* set TRUE if Content-Range: was found */
> +   BIT(upload_done);   /* set to TRUE when doing chunked transfer-encodi=
ng
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -69,6 +69,7 @@
> + \
> + test400 test401 test402 test403 test404 test405 test406 test407 test408=
 \
> + test409 test410 \
> ++test418 \
> + \
> + test430 test431 test432 test433 test434 test435 test436 \
> + \
> +--- /dev/null
> ++++ b/tests/data/test418
> +@@ -0,0 +1,152 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++gzip
> ++</keywords>
> ++</info>
> ++
> ++#
> ++# Server-side
> ++<reply>
> ++<data nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++
> ++-foo-
> ++</data>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++ <name>
> ++Response with multiple Transfer-Encoding headers
> ++ </name>
> ++ <command>
> ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS
> ++</command>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"yes">
> ++GET /%TESTNUMBER HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++
> ++</protocol>
> ++
> ++# CURLE_BAD_CONTENT_ENCODING is 61
> ++<errorcode>
> ++61
> ++</errorcode>
> ++<stderr mode=3D"text">
> ++curl: (61) Reject response due to more than 5 content encodings
> ++</stderr>
> ++</verify>
> ++</testcase>
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index b583060889..945745cdde 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -39,6 +39,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2023-23914_5-3.patch \
>             file://CVE-2023-23914_5-4.patch \
>             file://CVE-2023-23914_5-5.patch \
> +           file://CVE-2023-23916.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
>
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179689): https://lists.openembedded.org/g/openembedde=
d-core/message/179689
> Mute This Topic: https://lists.openembedded.org/mt/98055877/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

