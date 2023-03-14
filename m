Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BF8C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:39:42 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.10.1678808376476251653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hnUi7AFr;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id fd5so29843214edb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678808375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p98buNEuTyPlf09dhitlnxt8gBGWqgksdh5aG9WWwWQ=;
        b=hnUi7AFr3BVpVXEnleadYCXZQbKLA2cacuUmpbWNF4AQO3wzgnQtKVvqSEwT7tdwxz
         puRU4E81zjPtW6fIQ+DA+w5GOUxjKL0yVaQE6aCi6e2SWQqj7fqblvg3SjamCZbJ6kYN
         AY8XKG0aInXleowOSeESosUTB3ivRc9N5sXhcwQew8iH3ogKsOAuAoXr7A83i7ggTmC6
         7F3DppNvpzB4ptS/JLqlL/El16D0iEtrB6I+4cP/5Paf3o5wScxRYsX81Wshuvt5tPXz
         5HY1ExYo61qv0CR1GFLm7vt3J4ClPDc4lojr5Q2dmbxK2+peP0pFGsJHGil3oO1DQYsV
         UsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p98buNEuTyPlf09dhitlnxt8gBGWqgksdh5aG9WWwWQ=;
        b=GlvCkUJbJdmHEJHCUSYp3ybtXCoRKHVR8lLlzLK5VYA5uNaJLO/tNL6AZU7LSlq6iJ
         p+2C9rDsdzunRpSNUIQiZ4X6oKTeqDandTNRn+9yRnwIrZJdALQgYAK8uR1Cs7ppi68A
         S1ZQHhrTH0dGmplh2bgAzOpaD6yTAaff6frD/04baYfnKHo+DffsODg9R4Ichz1nGZu3
         IsSUL/fVO1MOoKEO4w+dBjLpmagt0LN25Jbd3tZo+u/4TbmkDKoWtyue/K9LSau6Ftp6
         Yx5MmzR1lXd7ot1es4Uex0O3t/VU+eLyxsT4oQ5kkOgxskWzOChapPQqNXjTeZB5JhZI
         4m8g==
X-Gm-Message-State: AO0yUKXRQFsxY/JCZwMPfNc3+UbHzf0J8fN2SOOP+0fymCdlUp/dqNm0
	OJnyKi92oOfE1fWtx+0mXUXXwJmeNc275tLXYx7fDw==
X-Google-Smtp-Source: AK7set9HbfKSV2QcCLvEFUC2c1ZAQ8D57mfKbYUShMxTD3r6gyzuvUIf231WGfB+uUWtgB5FX0ADW/FRw4Z4CeU3+zI=
X-Received: by 2002:a50:ccd8:0:b0:4fc:a484:c6ed with SMTP id
 b24-20020a50ccd8000000b004fca484c6edmr3715361edj.2.1678808374693; Tue, 14 Mar
 2023 08:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230303075027.28236-1-badganchipv@gmail.com> <20230303075027.28236-2-badganchipv@gmail.com>
In-Reply-To: <20230303075027.28236-2-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 05:39:23 -1000
Message-ID: <CAOSpxdZoxui1TuXFUpZ6N_Kt_nRBYYm9GvK4DLJ6J4g_B1rDVA@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178511

On Thu, Mar 2, 2023 at 9:52=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.c=
om> wrote:
>
> From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
>
> Add below patch to fix CVE-2023-23916
>
> CVE-2023-23916.patch
>
> Link: https://launchpad.net/ubuntu/+source/curl/7.87.0-2ubuntu2/
>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> Signed-off-by: pawan <badganchipv@gmail.com>
> ---
>  .../curl/curl/CVE-2023-23916.patch            | 223 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
>  2 files changed, 224 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-23916.patch
> new file mode 100644
> index 0000000000..4839124d5c
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> @@ -0,0 +1,223 @@
> +Backport of:
> +
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
> +Upstream-Status: Backport [http://launchpadlibrarian.net/652022114/curl_=
7.87.0-2ubuntu1_7.87.0-2ubuntu2.diff.gz]

Launchpad is not a valid upstream for curl, please reference patches
from the actual upstream: https://github.com/curl/curl

Thanks!

Steve

> +Comment: Refreshed hunk from content_encoding.c and Makefile.inc. Remove=
d test387 from patch as
> +it is not available in the source code.
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
> +@@ -1035,7 +1035,6 @@
> +                                      const char *enclist, int maybechun=
ked)
> + {
> +   struct SingleRequest *k =3D &data->req;
> +-  int counter =3D 0;
> +
> +   do {
> +     const char *name;
> +@@ -1070,9 +1069,9 @@
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
> +@@ -707,6 +707,7 @@ struct SingleRequest {
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
> index af3c4a6ce4..4600f17feb 100644
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
> View/Reply Online (#177978): https://lists.openembedded.org/g/openembedde=
d-core/message/177978
> Mute This Topic: https://lists.openembedded.org/mt/97357910/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

