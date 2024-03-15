Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9D6C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 15:36:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.25499.1710516986096165211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 08:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ho5IURKE;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6098a20ab22so20016317b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710516985; x=1711121785; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2OX+HSz/3YQqicSPpaYy2/4ZUkgtCmUy414pfP3nwI=;
        b=ho5IURKEYLPcqXei/sxCrNXoQrcVr0ojgTtuxNbFbxFNebuwIGECr5mgZUJRZ7doJq
         8HqGHePPsbB3EdD7dIa6eu2wDCIM6vqnQ4l4Amdsbzxj2/hQ0OpgCA+bV3fyr2nx46QL
         qpxtev9sZL0vh7HDTD73tVxqZI4voMUmUEd1w5g4lUIOPBiJfq/ZJOUFyVyB44IUvBwD
         AARac+vD494JSRd/hZ0Qvx3dGdetReH37hD8Qo1k9FkeiAFzEOt0Dbg6y77smSAIqYPa
         /Y8rEQgSQpQf18Pm17GafIXdTcgkKURMd8ks0dN7D0sXrWA+H1vPyAqGS6M4RAS/4EL2
         9OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710516985; x=1711121785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2OX+HSz/3YQqicSPpaYy2/4ZUkgtCmUy414pfP3nwI=;
        b=BkoMy6T5/aVdT1bG1kRiDGcPvQSFLsfjZAS715b3NmZkCojURxvTjwMZfSzWKaytrh
         gyA2lHQe0/tygnEOtJ+i2JbdVmtJFpbvHWg1Dqt1ZC48Hj0Ae1k/LF0sOW8hnVRD5ssi
         copzUC9sTCEDw+mYBfGlmY3yHPaV419hJz+NMs93R3p81u1HpOYld09/AO70IJ1eUOce
         s+uuUV8elZFYROqf9eeGtBQF0gwe0F9UwHKbJaos0QUAaFsfYnoX+nJarSGGoMF8ynVS
         w1rjeQMlc859NNiSPKQbXJ2jxa5EPMQWNKVep4SVpgIFckp3GoVAoXAezyJVwZUH+SzI
         z6Gw==
X-Gm-Message-State: AOJu0YyQsg2x2z4MMz/4TIfJ96T9icjKUSaEwFde8nVn+UYgZc9tXWzi
	k8V3bVBiYzO/SIOxPZX0vYUFPkh66NVFGZMZQICktmI6AZLH8xhacGHdCx055brumnZVMPdYjYI
	vVG4u1PtEYCZDFoiagCehY31IcjzjSKpVpCn7Lw==
X-Google-Smtp-Source: AGHT+IFLiQz5vmQr18jT5PR3Yf9B6aDzWuDS+Wh8Nd7dfy4+jiFUUG41keRcARkpl2mxWhutjDUto+LF9ueqhUxHRF0=
X-Received: by 2002:a25:aaae:0:b0:dcf:464d:8ec3 with SMTP id
 t43-20020a25aaae000000b00dcf464d8ec3mr5393484ybi.3.1710516984826; Fri, 15 Mar
 2024 08:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240313200343.15817-1-asharma@mvista.com>
In-Reply-To: <20240313200343.15817-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 15 Mar 2024 05:36:13 -1000
Message-ID: <CAOSpxdY39+iGe=uELt6Y8LFA85k0VumAtcSGYhAq8uw+dYzdaA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] expat: Backport fix for CVE-2024-28757
To: asharma@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 15:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197139

Fails at build time:

ERROR: expat-2.2.9-r0 do_patch: Applying patch 'CVE-2024-28757.patch'
on target directory
'/home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux=
/expat/2.2.9-r0/git/expat'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux/=
expat/2.2.9-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2024-28757.patch
can't find file to patch at input line 38
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 1d50b80cf31de87750103656f6eb693746854aa8 Mon Sep 17 00:00:00 2001
|From: Sebastian Pipping <sebastian@pipping.org>
|Date: Mon, 4 Mar 2024 23:49:06 +0100
|Subject: [PATCH] lib/xmlparse.c: Detect billion laughs attack with isolate=
d
| external parser
|
|When parsing DTD content with code like ..
|
|  XML_Parser parser =3D XML_ParserCreate(NULL);
|  XML_Parser ext_parser =3D XML_ExternalEntityParserCreate(parser, NULL, N=
ULL);
|  enum XML_Status status =3D XML_Parse(ext_parser, doc,
(int)strlen(doc), XML_TRUE);
|
|.. there are 0 bytes accounted as direct input and all input from
`doc` accounted
|as indirect input.  Now function accountingGetCurrentAmplification
cannot calculate
|the current amplification ratio as "(direct + indirect) / direct",
and it did refuse
|to divide by 0 as one would expect, but it returned 1.0 for this case
to indicate
|no amplification over direct input.  As a result, billion laughs attacks f=
rom
|DTD-only input were not detected with this isolated way of using an
external parser.
|
|The new approach is to assume direct input of length not 0 but 22 --
derived from
|ghost input "<!ENTITY a SYSTEM 'b'>", the shortest possible way to
include an external
|DTD --, and do the usual "(direct + indirect) / direct" math with
"direct :=3D 22".
|
|GitHub issue #839 has more details on this issue and its origin in Cluster=
Fuzz
|finding 66812.
|---
|CVE: CVE-2024-28757
|Upstream-Status: Backport
[https://github.com/libexpat/libexpat/commit/072eca0b72373da103ce15f8f62d1d=
7b52695454]
|Signed-off-by: Ashish Sharma <asharma@mvista.com>
|---
| expat/lib/xmlparse.c | 6 +++++-
| 1 file changed, 5 insertions(+), 1 deletion(-)
|
|diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
|index b884d82b5..d44baa68d 100644
|--- a/expat/lib/xmlparse.c
|+++ b/expat/lib/xmlparse.c
--------------------------
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
Patch CVE-2024-28757.patch does not apply (enforce with -f)

On Wed, Mar 13, 2024 at 10:03=E2=80=AFAM Ashish Sharma via
lists.openembedded.org <asharma=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream ref:
> https://github.com/libexpat/libexpat/pull/842
> https://github.com/libexpat/libexpat/issues/839
>
> Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/07=
2eca0b72373da103ce15f8f62d1d7b52695454]
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../expat/expat/CVE-2024-28757.patch          | 57 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-28757.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2024-28757.patch b/meta/re=
cipes-core/expat/expat/CVE-2024-28757.patch
> new file mode 100644
> index 0000000000..c4bdb4621a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
> @@ -0,0 +1,57 @@
> +From 1d50b80cf31de87750103656f6eb693746854aa8 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 4 Mar 2024 23:49:06 +0100
> +Subject: [PATCH] lib/xmlparse.c: Detect billion laughs attack with isola=
ted
> + external parser
> +
> +When parsing DTD content with code like ..
> +
> +  XML_Parser parser =3D XML_ParserCreate(NULL);
> +  XML_Parser ext_parser =3D XML_ExternalEntityParserCreate(parser, NULL,=
 NULL);
> +  enum XML_Status status =3D XML_Parse(ext_parser, doc, (int)strlen(doc)=
, XML_TRUE);
> +
> +.. there are 0 bytes accounted as direct input and all input from `doc` =
accounted
> +as indirect input.  Now function accountingGetCurrentAmplification canno=
t calculate
> +the current amplification ratio as "(direct + indirect) / direct", and i=
t did refuse
> +to divide by 0 as one would expect, but it returned 1.0 for this case to=
 indicate
> +no amplification over direct input.  As a result, billion laughs attacks=
 from
> +DTD-only input were not detected with this isolated way of using an exte=
rnal parser.
> +
> +The new approach is to assume direct input of length not 0 but 22 -- der=
ived from
> +ghost input "<!ENTITY a SYSTEM 'b'>", the shortest possible way to inclu=
de an external
> +DTD --, and do the usual "(direct + indirect) / direct" math with "direc=
t :=3D 22".
> +
> +GitHub issue #839 has more details on this issue and its origin in Clust=
erFuzz
> +finding 66812.
> +---
> +CVE: CVE-2024-28757
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0=
72eca0b72373da103ce15f8f62d1d7b52695454]
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +---
> + expat/lib/xmlparse.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
> +index b884d82b5..d44baa68d 100644
> +--- a/expat/lib/xmlparse.c
> ++++ b/expat/lib/xmlparse.c
> +@@ -7787,6 +7787,8 @@ copyString(const XML_Char *s, const XML_Memory_Han=
dling_Suite *memsuite) {
> +
> + static float
> + accountingGetCurrentAmplification(XML_Parser rootParser) {
> ++  //                                          1.........1.........12 =
=3D> 22
> ++  const size_t lenOfShortestInclude =3D sizeof("<!ENTITY a SYSTEM 'b'>"=
) - 1;
> +   const XmlBigCount countBytesOutput
> +       =3D rootParser->m_accounting.countBytesDirect
> +         + rootParser->m_accounting.countBytesIndirect;
> +@@ -7794,7 +7796,9 @@ accountingGetCurrentAmplification(XML_Parser rootP=
arser) {
> +       =3D rootParser->m_accounting.countBytesDirect
> +             ? (countBytesOutput
> +                / (float)(rootParser->m_accounting.countBytesDirect))
> +-            : 1.0f;
> ++            : ((lenOfShortestInclude
> ++                + rootParser->m_accounting.countBytesIndirect)
> ++               / (float)lenOfShortestInclude);
> +   assert(! rootParser->m_parentParser);
> +   return amplificationFactor;
> + }
> diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/e=
xpat/expat_2.2.9.bb
> index 8a5006e59a..ea50533ed9 100644
> --- a/meta/recipes-core/expat/expat_2.2.9.bb
> +++ b/meta/recipes-core/expat/expat_2.2.9.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "git://github.com/libexpat/libexpat.git;pro=
tocol=3Dhttps;branch=3Dmaster \
>             file://libtool-tag.patch \
>             file://CVE-2022-40674.patch \
>             file://CVE-2022-43680.patch \
> +           file://CVE-2024-28757.patch \
>           "
>
>  SRCREV =3D "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
> --
> 2.24.4
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197079): https://lists.openembedded.org/g/openembedde=
d-core/message/197079
> Mute This Topic: https://lists.openembedded.org/mt/104913576/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

