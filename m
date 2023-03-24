Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C202DC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:45:47 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.105652.1679672737329243105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8Dcd9zM;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: badganchipv@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5456249756bso40112717b3.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679672736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfGW4Gf/5BYrr6WtBUVE7eu5wIuoBDahZZNX9kDn5co=;
        b=B8Dcd9zMvXykqKSEg6zW5M7KSjMQ0QPtYCDOAyfS1VN1g/v+BLtW823Y2tlQHwiP+i
         7Mf21lRcCbv9dvoFuiBPhbYfLwDBwgEVBAY2l1arCiI9lyzVgUGXGw740djUDvjJspsI
         gmb/MSv/KPWdKsR1wXiSCfCxJSsGA1iStcbbglDHm4dNWgdq+FegMWGKhOJi9ULhyQ4f
         iXDZy04kZjORwsYUQoRcAOCLiMKxkKZ5BT+R7kEUE5SZrY5A47hLTAwhz81ppsG72/Fo
         nao5u5DRAiHmJCIuwKn0JhgGEXbYWHoG6Jk1Jc+Q7TX4UPLQ58Q9F0cVZRnfGQADx6Dw
         w8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfGW4Gf/5BYrr6WtBUVE7eu5wIuoBDahZZNX9kDn5co=;
        b=saMtrN2Ww27mekhxKOfgzjfRCvEQvJk6J7xwbosipPPMQfSuugkCyifL3jNqHyc0eP
         DWBcQNmIb8YxgdPKjHBz8tsyiCqIhydemMZRMMTWfwXEA9+V2xv1Dy+WIehLYh6V/aVS
         CviB2pTN1j0B9ySu+4ksgaNPm7j80XkIpfB33uWrFIBa8FMbwKmeoThy9v/9WDPvDyvz
         DuufPFXhB0uPfnVWhYrw5op8Z31l5zfW0Yw301Sg3mgGzIcZ1z4jcV3oGRhFPgbj1wen
         NZktmN4soYU2wj6GME/zkfBtPoYJCOZsqUHtFt5+KJrfGTJuBLGXbOeRcM25XZZM1YJB
         clHw==
X-Gm-Message-State: AAQBX9d2rZpTiGtXAMj6Ch9lQ5zC3odNuHbTyYRu9owTqSxh66Fwu5YD
	9dMnurw02XhJwALh7ccUpTCVOc2/NEBRJio2+ek=
X-Google-Smtp-Source: AKy350asSqITvkj13tOWKZeQJw0TugpBL5EoBsQxsVxzUYyCtE9VT4dfUjDYS76YH6LF8ZddFj53s6WGnwZ1oqHEn3k=
X-Received: by 2002:a81:ac64:0:b0:544:b9b2:5c32 with SMTP id
 z36-20020a81ac64000000b00544b9b25c32mr1266265ywj.7.1679672736381; Fri, 24 Mar
 2023 08:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230324075700.22155-1-badganchipv@gmail.com> <20230324075700.22155-2-badganchipv@gmail.com>
 <CAOSpxdaY6cPyqi054pAwVC7Y7kG-QNjhMkdYQwYcqu+sEhiJ1g@mail.gmail.com>
In-Reply-To: <CAOSpxdaY6cPyqi054pAwVC7Y7kG-QNjhMkdYQwYcqu+sEhiJ1g@mail.gmail.com>
From: Pawan Badganchi <badganchipv@gmail.com>
Date: Fri, 24 Mar 2023 21:15:23 +0530
Message-ID: <CACVpDMk1AJcMG7xztYc0B8Ncg+RykeBxiRvVjP-SmX5Gn1e6gg@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000ca7c0605f7a748c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179071

--000000000000ca7c0605f7a748c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Steve,
Could you please build again including CVE-2023-23914 And CVE-2023-23195.

On Fri, 24 Mar, 2023, 9:10 pm Steve Sakoman, <steve@sakoman.com> wrote:

> On Thu, Mar 23, 2023 at 9:57=E2=80=AFPM Pawan Badganchi <badganchipv@gmai=
l.com>
> wrote:
> >
> > From: Pawan Badganchi <badganchipv@gmail.com>
> >
> > Add below patch to fix CVE-2023-23916
> >
> > CVE-2023-23916.patch
>
> I'm getting fuzz errors with this patch:
>
> Applying patch CVE-2023-23916.patch
> patching file lib/content_encoding.c
> patching file lib/urldata.h
> patching file tests/data/Makefile.inc
> Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
> patching file tests/data/test418
>
> Please send v2 which corrects this.
>
> Thanks!
>
> Steve
> >
> > Link: https://curl.se/docs/CVE-2023-23916.html
> >
> > Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> > Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
> > ---
> >  .../curl/curl/CVE-2023-23916.patch            | 222 ++++++++++++++++++
> >  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
> >  2 files changed, 223 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> > new file mode 100644
> > index 0000000000..6a1be173cd
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> > @@ -0,0 +1,222 @@
> > +Backport of:
> > +
> > +From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
> > +From: Patrick Monnerat <patrick@monnerat.net>
> > +Date: Mon, 13 Feb 2023 08:33:09 +0100
> > +Subject: [PATCH] content_encoding: do not reset stage counter for each
> header
> > +
> > +Test 418 verifies
> > +
> > +Closes #10492
> > +
> > +CVE: CVE-2023-23916
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch]
> > +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> > +---
> > + lib/content_encoding.c  |   7 +-
> > + lib/urldata.h           |   1 +
> > + tests/data/Makefile.inc |   2 +-
> > + tests/data/test387      |   2 +-
> > + tests/data/test418      | 152 +++++++++++++++++++++++++++++++++++++++=
+
> > + 5 files changed, 158 insertions(+), 6 deletions(-)
> > + create mode 100644 tests/data/test418
> > +
> > +--- a/lib/content_encoding.c
> > ++++ b/lib/content_encoding.c
> > +@@ -1035,7 +1035,6 @@ CURLcode Curl_build_unencoding_stack(str
> > +                                      const char *enclist, int
> maybechunked)
> > + {
> > +   struct SingleRequest *k =3D &data->req;
> > +-  int counter =3D 0;
> > +
> > +   do {
> > +     const char *name;
> > +@@ -1070,9 +1069,9 @@ CURLcode Curl_build_unencoding_stack(str
> > +       if(!encoding)
> > +         encoding =3D &error_encoding;  /* Defer error at stack use. *=
/
> > +
> > +-      if(++counter >=3D MAX_ENCODE_STACK) {
> > +-        failf(data, "Reject response due to %u content encodings",
> > +-              counter);
> > ++      if(k->writer_stack_depth++ >=3D MAX_ENCODE_STACK) {
> > ++        failf(data, "Reject response due to more than %u content
> encodings",
> > ++              MAX_ENCODE_STACK);
> > +         return CURLE_BAD_CONTENT_ENCODING;
> > +       }
> > +       /* Stack the unencoding stage. */
> > +--- a/lib/urldata.h
> > ++++ b/lib/urldata.h
> > +@@ -708,6 +708,7 @@ struct SingleRequest {
> > +   struct dohdata *doh; /* DoH specific data for this request */
> > + #endif
> > +   unsigned char setcookies;
> > ++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
> > +   BIT(header);        /* incoming data has HTTP header */
> > +   BIT(content_range); /* set TRUE if Content-Range: was found */
> > +   BIT(upload_done);   /* set to TRUE when doing chunked
> transfer-encoding
> > +--- a/tests/data/Makefile.inc
> > ++++ b/tests/data/Makefile.inc
> > +@@ -66,7 +66,7 @@ test370 test371 \
> > + test392 test393 test394 test395 test396 test397 \
> > + \
> > + test400 test401 test402 test403 test404 test405 test406 test407
> test408 \
> > +-test409 test410 \
> > ++test409 test410 test418 \
> > + \
> > + test430 test431 test432 test433 test434 test435 test446 \
> > + \
> > +--- /dev/null
> > ++++ b/tests/data/test418
> > +@@ -0,0 +1,152 @@
> > ++<testcase>
> > ++<info>
> > ++<keywords>
> > ++HTTP
> > ++gzip
> > ++</keywords>
> > ++</info>
> > ++
> > ++#
> > ++# Server-side
> > ++<reply>
> > ++<data nocheck=3D"yes">
> > ++HTTP/1.1 200 OK
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++
> > ++-foo-
> > ++</data>
> > ++</reply>
> > ++
> > ++#
> > ++# Client-side
> > ++<client>
> > ++<server>
> > ++http
> > ++</server>
> > ++ <name>
> > ++Response with multiple Transfer-Encoding headers
> > ++ </name>
> > ++ <command>
> > ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS
> > ++</command>
> > ++</client>
> > ++
> > ++#
> > ++# Verify data after the test has been "shot"
> > ++<verify>
> > ++<protocol crlf=3D"yes">
> > ++GET /%TESTNUMBER HTTP/1.1
> > ++Host: %HOSTIP:%HTTPPORT
> > ++User-Agent: curl/%VERSION
> > ++Accept: */*
> > ++
> > ++</protocol>
> > ++
> > ++# CURLE_BAD_CONTENT_ENCODING is 61
> > ++<errorcode>
> > ++61
> > ++</errorcode>
> > ++<stderr mode=3D"text">
> > ++curl: (61) Reject response due to more than 5 content encodings
> > ++</stderr>
> > ++</verify>
> > ++</testcase>
> > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb
> b/meta/recipes-support/curl/curl_7.82.0.bb
> > index b583060889..945745cdde 100644
> > --- a/meta/recipes-support/curl/curl_7.82.0.bb
> > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> > @@ -39,6 +39,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> >             file://CVE-2023-23914_5-3.patch \
> >             file://CVE-2023-23914_5-4.patch \
> >             file://CVE-2023-23914_5-5.patch \
> > +           file://CVE-2023-23916.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
> >
> > --
> > 2.38.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179016):
> https://lists.openembedded.org/g/openembedded-core/message/179016
> > Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000ca7c0605f7a748c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Steve,<div dir=3D"auto">Could you please build agai=
n including CVE-2023-23914 And CVE-2023-23195.=C2=A0</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 24 Mar, 2=
023, 9:10 pm Steve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve@=
sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
Mar 23, 2023 at 9:57=E2=80=AFPM Pawan Badganchi &lt;<a href=3D"mailto:badga=
nchipv@gmail.com" target=3D"_blank" rel=3D"noreferrer">badganchipv@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Pawan Badganchi &lt;<a href=3D"mailto:badganchipv@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">badganchipv@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Add below patch to fix CVE-2023-23916<br>
&gt;<br>
&gt; CVE-2023-23916.patch<br>
<br>
I&#39;m getting fuzz errors with this patch:<br>
<br>
Applying patch CVE-2023-23916.patch<br>
patching file lib/content_encoding.c<br>
patching file lib/urldata.h<br>
patching file tests/data/Makefile.inc<br>
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).<br>
patching file tests/data/test418<br>
<br>
Please send v2 which corrects this.<br>
<br>
Thanks!<br>
<br>
Steve<br>
&gt;<br>
&gt; Link: <a href=3D"https://curl.se/docs/CVE-2023-23916.html" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://curl.se/docs/CVE-2023-23916.ht=
ml</a><br>
&gt;<br>
&gt; Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@k=
pit.com" target=3D"_blank" rel=3D"noreferrer">Pawan.Badganchi@kpit.com</a>&=
gt;<br>
&gt; Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:badganchipv@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">badganchipv@gmail.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-23916.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 222 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 223 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/met=
a/recipes-support/curl/curl/CVE-2023-23916.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6a1be173cd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch<br>
&gt; @@ -0,0 +1,222 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Patrick Monnerat &lt;<a href=3D"mailto:patrick@monnerat.net" ta=
rget=3D"_blank" rel=3D"noreferrer">patrick@monnerat.net</a>&gt;<br>
&gt; +Date: Mon, 13 Feb 2023 08:33:09 +0100<br>
&gt; +Subject: [PATCH] content_encoding: do not reset stage counter for eac=
h header<br>
&gt; +<br>
&gt; +Test 418 verifies<br>
&gt; +<br>
&gt; +Closes #10492<br>
&gt; +<br>
&gt; +CVE: CVE-2023-23916<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/119fb187192a9ea13dc.patch" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch</a>]<br>
&gt; +Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@=
kpit.com" target=3D"_blank" rel=3D"noreferrer">Pawan.Badganchi@kpit.com</a>=
&gt;<br>
&gt; +---<br>
&gt; + lib/content_encoding.c=C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt; + lib/urldata.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
&gt; + tests/data/Makefile.inc |=C2=A0 =C2=A02 +-<br>
&gt; + tests/data/test387=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; + tests/data/test418=C2=A0 =C2=A0 =C2=A0 | 152 +++++++++++++++++++++++=
+++++++++++++++++<br>
&gt; + 5 files changed, 158 insertions(+), 6 deletions(-)<br>
&gt; + create mode 100644 tests/data/test418<br>
&gt; +<br>
&gt; +--- a/lib/content_encoding.c<br>
&gt; ++++ b/lib/content_encoding.c<br>
&gt; +@@ -1035,7 +1035,6 @@ CURLcode Curl_build_unencoding_stack(str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char =
*enclist, int maybechunked)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0struct SingleRequest *k =3D &amp;data-&gt;req;<br>
&gt; +-=C2=A0 int counter =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +@@ -1070,9 +1069,9 @@ CURLcode Curl_build_unencoding_stack(str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!encoding)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding =3D &amp;error_encoding;=
=C2=A0 /* Defer error at stack use. */<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if(++counter &gt;=3D MAX_ENCODE_STACK) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to=
 %u content encodings&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(k-&gt;writer_stack_depth++ &gt;=3D MAX_ENCOD=
E_STACK) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to=
 more than %u content encodings&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_ENCODE_STACK);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CURLE_BAD_CONTENT_ENCODING;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Stack the unencoding stage. */<br>
&gt; +--- a/lib/urldata.h<br>
&gt; ++++ b/lib/urldata.h<br>
&gt; +@@ -708,6 +708,7 @@ struct SingleRequest {<br>
&gt; +=C2=A0 =C2=A0struct dohdata *doh; /* DoH specific data for this reque=
st */<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0unsigned char setcookies;<br>
&gt; ++=C2=A0 unsigned char writer_stack_depth; /* Unencoding stack depth. =
*/<br>
&gt; +=C2=A0 =C2=A0BIT(header);=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* incoming data=
 has HTTP header */<br>
&gt; +=C2=A0 =C2=A0BIT(content_range); /* set TRUE if Content-Range: was fo=
und */<br>
&gt; +=C2=A0 =C2=A0BIT(upload_done);=C2=A0 =C2=A0/* set to TRUE when doing =
chunked transfer-encoding<br>
&gt; +--- a/tests/data/Makefile.inc<br>
&gt; ++++ b/tests/data/Makefile.inc<br>
&gt; +@@ -66,7 +66,7 @@ test370 test371 \<br>
&gt; + test392 test393 test394 test395 test396 test397 \<br>
&gt; + \<br>
&gt; + test400 test401 test402 test403 test404 test405 test406 test407 test=
408 \<br>
&gt; +-test409 test410 \<br>
&gt; ++test409 test410 test418 \<br>
&gt; + \<br>
&gt; + test430 test431 test432 test433 test434 test435 test446 \<br>
&gt; + \<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/data/test418<br>
&gt; +@@ -0,0 +1,152 @@<br>
&gt; ++&lt;testcase&gt;<br>
&gt; ++&lt;info&gt;<br>
&gt; ++&lt;keywords&gt;<br>
&gt; ++HTTP<br>
&gt; ++gzip<br>
&gt; ++&lt;/keywords&gt;<br>
&gt; ++&lt;/info&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Server-side<br>
&gt; ++&lt;reply&gt;<br>
&gt; ++&lt;data nocheck=3D&quot;yes&quot;&gt;<br>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++<br>
&gt; ++-foo-<br>
&gt; ++&lt;/data&gt;<br>
&gt; ++&lt;/reply&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Client-side<br>
&gt; ++&lt;client&gt;<br>
&gt; ++&lt;server&gt;<br>
&gt; ++http<br>
&gt; ++&lt;/server&gt;<br>
&gt; ++ &lt;name&gt;<br>
&gt; ++Response with multiple Transfer-Encoding headers<br>
&gt; ++ &lt;/name&gt;<br>
&gt; ++ &lt;command&gt;<br>
&gt; ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS<br>
&gt; ++&lt;/command&gt;<br>
&gt; ++&lt;/client&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Verify data after the test has been &quot;shot&quot;<br>
&gt; ++&lt;verify&gt;<br>
&gt; ++&lt;protocol crlf=3D&quot;yes&quot;&gt;<br>
&gt; ++GET /%TESTNUMBER HTTP/1.1<br>
&gt; ++Host: %HOSTIP:%HTTPPORT<br>
&gt; ++User-Agent: curl/%VERSION<br>
&gt; ++Accept: */*<br>
&gt; ++<br>
&gt; ++&lt;/protocol&gt;<br>
&gt; ++<br>
&gt; ++# CURLE_BAD_CONTENT_ENCODING is 61<br>
&gt; ++&lt;errorcode&gt;<br>
&gt; ++61<br>
&gt; ++&lt;/errorcode&gt;<br>
&gt; ++&lt;stderr mode=3D&quot;text&quot;&gt;<br>
&gt; ++curl: (61) Reject response due to more than 5 content encodings<br>
&gt; ++&lt;/stderr&gt;<br>
&gt; ++&lt;/verify&gt;<br>
&gt; ++&lt;/testcase&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a> b/met=
a/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; index b583060889..945745cdde 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; @@ -39,6 +39,7 @@ SRC_URI =3D &quot;<a href=3D"https://curl.se/downloa=
d/$%7BBP%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/curl.se/download/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-4.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-5.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23916.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;0aaa12d7bd04b0966254f2703ce80dd5c38=
dbbd76af0297d3d690cdce58a583c&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179016): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179016" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1790=
16</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97818991=
/3620601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97818991/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sako=
man.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000ca7c0605f7a748c4--

