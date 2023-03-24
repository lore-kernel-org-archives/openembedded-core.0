Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1EEC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:40:17 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.104782.1679672411877457718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OJSoAazN;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id ek18so9580213edb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679672410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NZ8Q8e2sgFBn50rESZhOTyZHrcdhQgagMz9DW+BlMI=;
        b=OJSoAazNxGw+8g24kkg/ctnddPUuxjXZwHJuowS1wK5Gnzg0DPwE0I29MduhQXz4CE
         KJIAiPcgPAnBORMnk/Ac/81LIJ7/A1yOPYP1keggzOMaf44AQD9xQMOOHLonYmry/bWg
         4PaUHdHoEnufJw6K/hzqMnZmQuNJhMoR13jBdakko8caTgdAQ1ST7cbteo0tnOodRM7x
         uTpB+nTviOHGgn18B7ASDgAp1bz5zOs8kIvzLNIaiHdfgt8RQJSYzCKMpm6mYRB1PtYO
         21WEGFCjGS6XaXF28RXGkvZyLN5n7BaevGVSt3CaDDLe2id63x2bYA84rM8XnKtgbu2w
         E3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NZ8Q8e2sgFBn50rESZhOTyZHrcdhQgagMz9DW+BlMI=;
        b=JFA8+5UygPkaUSPibUvGjKP/8migr3fY017KWXWUCvKdyqtgYFmCKkXDn0OsmA0Q2n
         Un0Up7nivwf3BhTBjR9zgS/l8LkYe2+u7Es3qcGA9iE0UPn41B3DDgfDTLuBwriuxjPz
         Fx2TTbRMsNxxWEfjaSOUVIhGF8R32C+NZANq51E0rR1YXO5jh4svM705yWOw4hIHGJ6Z
         GRzV1dKSwzs+bTPOQsXchYjehHbqQW0Smihl/pVcon8BmDcyIM01TVhgdfRdxqY/Iica
         m/fzvKy9kkzFgiFWA1ogX+gMUmCuo8VeFTb+UflgBzssVc1AsnKjTm97CoSsxmz9kxGv
         YEGg==
X-Gm-Message-State: AAQBX9e5JE6qAIer1SzOXRvFj/tVsQSljCNIHnC6VUkqhqM3oPfNHptj
	v9RCpywOCjmJEyAf/a9nlni1QzxEd90qkU/F9Do0PQ==
X-Google-Smtp-Source: AKy350aR7HQ6k7o6tYq1q+C+d2EVLqOzga8arskLnIvRMgVWT3xR/JLTp8aWz6vO8t6dd9IX19r8FlXmjVaMIh1FrAQ=
X-Received: by 2002:a17:907:da8:b0:877:747d:4a85 with SMTP id
 go40-20020a1709070da800b00877747d4a85mr1699375ejc.3.1679672409659; Fri, 24
 Mar 2023 08:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230324075700.22155-1-badganchipv@gmail.com> <20230324075700.22155-2-badganchipv@gmail.com>
In-Reply-To: <20230324075700.22155-2-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 24 Mar 2023 05:39:58 -1000
Message-ID: <CAOSpxdaY6cPyqi054pAwVC7Y7kG-QNjhMkdYQwYcqu+sEhiJ1g@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179069

On Thu, Mar 23, 2023 at 9:57=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> From: Pawan Badganchi <badganchipv@gmail.com>
>
> Add below patch to fix CVE-2023-23916
>
> CVE-2023-23916.patch

I'm getting fuzz errors with this patch:

Applying patch CVE-2023-23916.patch
patching file lib/content_encoding.c
patching file lib/urldata.h
patching file tests/data/Makefile.inc
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
patching file tests/data/test418

Please send v2 which corrects this.

Thanks!

Steve
>
> Link: https://curl.se/docs/CVE-2023-23916.html
>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
> ---
>  .../curl/curl/CVE-2023-23916.patch            | 222 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
>  2 files changed, 223 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-23916.patch
> new file mode 100644
> index 0000000000..6a1be173cd
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> @@ -0,0 +1,222 @@
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
> +@@ -1035,7 +1035,6 @@ CURLcode Curl_build_unencoding_stack(str
> +                                      const char *enclist, int maybechun=
ked)
> + {
> +   struct SingleRequest *k =3D &data->req;
> +-  int counter =3D 0;
> +
> +   do {
> +     const char *name;
> +@@ -1070,9 +1069,9 @@ CURLcode Curl_build_unencoding_stack(str
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
> +@@ -708,6 +708,7 @@ struct SingleRequest {
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
> +@@ -66,7 +66,7 @@ test370 test371 \
> + test392 test393 test394 test395 test396 test397 \
> + \
> + test400 test401 test402 test403 test404 test405 test406 test407 test408=
 \
> +-test409 test410 \
> ++test409 test410 test418 \
> + \
> + test430 test431 test432 test433 test434 test435 test446 \
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
> View/Reply Online (#179016): https://lists.openembedded.org/g/openembedde=
d-core/message/179016
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

