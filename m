Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6971C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:05:06 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.24688.1752678298093939662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZQQnH3t0;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-711756ae8c9so52784647b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752678297; x=1753283097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl3dBEHfIHqHiOwqJX5V4ecia9a7+PdcQETPJLH2DNU=;
        b=ZQQnH3t0WjOS1lPRIwiv9+aFr35iyBGHHyaATYJdC17m9OoLlBJXUDNBJI8UmqnI/4
         dEnghphSryRx1srOTB9tzdiaXqYcl6nk4sE7No3OUmsvyTOeOVJjJ8zz5F12dKrTSvWq
         +24ernwqmZmfzOsYR7kYd+/CnENazGwOqQ9O2fdAQZ/RELS74Swls4akrdW2qs17cSt7
         dIOaMMMlHZaoPnNO/DIuJNozppQfDSlCuz6U+6INolOy/ZKtkq19oqOP3sG08cvzg3oW
         AdnjYn8fHtIdJ6xJEuNhJvxUpYVQwS+cprDc9seuO77v2ubvxQPdFylQxpLgyNQtjk+h
         GM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678297; x=1753283097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl3dBEHfIHqHiOwqJX5V4ecia9a7+PdcQETPJLH2DNU=;
        b=fjzS6sGRdUx2Pe4gLXmDRFIJbDQpAomjWvDSE+dAEphpbmiQJkAGospBfEkO2p6K8n
         nLpGqkLjw2aefTsgntvX/Lr+34Zb27QbEfRbSaMbyefqUl7AruOJquAANFb6n1kbkzme
         AKTdeRyN8WmjDm+Ka2Oml9ALJifXETVFf1fLYCH2PEX3LxaXpvtuxrhlb7hv9QV6F2kZ
         IF8Rho7sU2/Q3uwEtPe+PeXeav54iNqdy71uWQWRch4ej6E+XtB9ikDC9GyJkgV14XgE
         ubooOvzlboKnOpPfI8ZJOBa7lp0MoaCgR91WJgZXNduYtpQIUSQ2eYPZvwpaDv7ZW156
         M7pQ==
X-Gm-Message-State: AOJu0YykFSMGCqfstpjuP9+WnP2/5X+iKyQkyfSMDKsnbftdpG+Kw0fr
	Nu2owYJNf2kCHiGCarsquduvEql66b7dU608/p9YpB2CRRR3mysuiXeIeGo/fgqXu0lcq1/Wo4e
	q13Gud6DfLqv6P6C9X2xqqkyXfQcCiw52rDyEEaeYgrptgrKBfYkBeVg=
X-Gm-Gg: ASbGnctrj5woFPPowAnFtt9kfiRWgpKYNnMTa7ZlNUzBXTAU2o6npA46/aBmdZLFbeW
	olPiPXpYMmB3JjoRsBxUF0j5MfzWK4DY6N3JSNg3s9APlKnOXlMM3RPQ6DPefwBLNkvdgxshLyg
	lOphxBqCZzBgAi7yMWpNiiOEqErANINaTvoQ2wqCEqrvTUeBWiY/XVwUHtiOtfo+Zkav/fCGt6b
	zFGpDyhYzewQsqfnEIZ7QmJp+DSCzECsMn8ULK78g3IXwd2gA==
X-Google-Smtp-Source: AGHT+IEfLIuFbGpDi/hEmcrJ3vTWKfyfuWtM08evV7Xp1hKzknW7476owkGWR8kNqmiuJlDWDwB5D8kq+vjVTyR0vtg=
X-Received: by 2002:a05:690c:7308:b0:70e:404:85e5 with SMTP id
 00721157ae682-71834f85922mr45175437b3.11.1752678296829; Wed, 16 Jul 2025
 08:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250711091527.15224-2-roland.kovacs@est.tech>
In-Reply-To: <20250711091527.15224-2-roland.kovacs@est.tech>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Jul 2025 08:04:46 -0700
X-Gm-Features: Ac12FXyrZoQWFixcPTAmTR1kKvbifc0pgIbgFfjLQS4oVoubT7fyN1Ost7zfdsU
Message-ID: <CAOSpxdaRkeNgh0E=m76vMOMsLhn4B2MoKgbpJEa-GtxXFqP-og@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libxml2: fix CVE-2025-49795
To: roland.kovacs@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220468

I'm getting ptest failures with this patch:

WARNING: core-image-ptest-libxml2-1.0-r0 do_testimage: There were
failing ptests.
Traceback (most recent call last):
File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core=
/decorator/__init__.py",
line 35, in wrapped_f
return func(*args, **kwargs)
^^^^^^^^^^^^^^^^^^^^^
File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core=
/decorator/__init__.py",
line 35, in wrapped_f
return func(*args, **kwargs)
^^^^^^^^^^^^^^^^^^^^^
File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core=
/decorator/__init__.py",
line 35, in wrapped_f
return func(*args, **kwargs)
^^^^^^^^^^^^^^^^^^^^^
File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runt=
ime/cases/ptest.py",
line 27, in test_ptestrunner_expectfail
self.do_ptestrunner()
File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runt=
ime/cases/ptest.py",
line 120, in do_ptestrunner
self.fail(failmsg)
AssertionError:
Failed ptests:
{'libxml2': ['runtest']}

I'm seeing it on both x86-64 and arm64:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1900/st=
eps/12/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1897/st=
eps/12/logs/stdio

I do not see the same issue with the walnascar version of the patch,
so perhaps that is a clue that will aid your debugging.

Steve

On Fri, Jul 11, 2025 at 2:15=E2=80=AFAM roland.kovacs via
lists.openembedded.org <roland.kovacs=3Dest.tech@lists.openembedded.org>
wrote:
>
> From: Roland Kovacs <roland.kovacs@est.tech>
>
> A NULL pointer dereference vulnerability was found in libxml2 when proces=
sing
> XPath XML expressions. This flaw allows an attacker to craft a malicious =
XML
> input to libxml2, leading to a denial of service.
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> ---
>  .../libxml/libxml2/CVE-2025-49795.patch       | 238 ++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
>  2 files changed, 239 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2025-49795.patch
> new file mode 100644
> index 0000000000..fd784ea45b
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
> @@ -0,0 +1,238 @@
> +From 68ce19940f8e08c85f9c8ce65180cdb90bf4b0d2 Mon Sep 17 00:00:00 2001
> +From: Michael Mann <mmann78@netscape.net>
> +Date: Sat, 21 Jun 2025 12:11:30 -0400
> +Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
> +
> +(CVE-2025-49795)
> +
> +Fixes #932
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/comm=
it/c24909ba2601848825b49a60f988222da3019667]
> +CVE: CVE-2025-49795
> +
> +(cherry picked from commit c24909ba2601848825b49a60f988222da3019667)
> +Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> +---
> + result/schematron/zvon16_0.err |   3 +
> + runtest.c                      | 139 +++++++++++++++++++++++++++++++++
> + schematron.c                   |   5 ++
> + test/schematron/zvon16.sct     |   7 ++
> + test/schematron/zvon16_0.xml   |   5 ++
> + 5 files changed, 159 insertions(+)
> + create mode 100644 result/schematron/zvon16_0.err
> + create mode 100644 test/schematron/zvon16.sct
> + create mode 100644 test/schematron/zvon16_0.xml
> +
> +diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0=
.err
> +new file mode 100644
> +index 00000000..3d052409
> +--- /dev/null
> ++++ b/result/schematron/zvon16_0.err
> +@@ -0,0 +1,3 @@
> ++XPath error : Unregistered function
> ++./test/schematron/zvon16_0.xml:2: element book: schematron error : /lib=
rary/book line 2: Book
> ++./test/schematron/zvon16_0.xml fails to validate
> +diff --git a/runtest.c b/runtest.c
> +index c78eec81..736cae5e 100644
> +--- a/runtest.c
> ++++ b/runtest.c
> +@@ -52,6 +52,10 @@
> + #include <libxml/xmlschemastypes.h>
> + #endif
> +
> ++#ifdef LIBXML_SCHEMATRON_ENABLED
> ++#include <libxml/schematron.h>
> ++#endif
> ++
> + #ifdef LIBXML_PATTERN_ENABLED
> + #include <libxml/pattern.h>
> + #endif
> +@@ -3881,6 +3885,136 @@ rngStreamTest(const char *filename,
> +
> + #endif
> +
> ++/**********************************************************************=
**
> ++ *                                                                    *
> ++ *                    Schematron tests                                *
> ++ *                                                                    *
> ++ **********************************************************************=
**/
> ++
> ++#ifdef LIBXML_SCHEMATRON_ENABLED
> ++static int
> ++schematronOneTest(const char *sch, const char *filename, int options,
> ++                  xmlSchematronPtr schematron) {
> ++    xmlDocPtr doc;
> ++    xmlSchematronValidCtxtPtr ctxt;
> ++    int ret;
> ++
> ++    doc =3D xmlReadFile(filename, NULL, options);
> ++    if (doc =3D=3D NULL) {
> ++        fprintf(stderr, "failed to parse instance %s for %s\n", filenam=
e, sch);
> ++      return(-1);
> ++    }
> ++
> ++    ctxt =3D xmlSchematronNewValidCtxt(schematron, XML_SCHEMATRON_OUT_E=
RROR);
> ++    xmlSchematronSetValidStructuredErrors(ctxt, testStructuredErrorHand=
ler,
> ++                                          NULL);
> ++    ret =3D xmlSchematronValidateDoc(ctxt, doc);
> ++    if (ret =3D=3D 0) {
> ++      testErrorHandler(NULL, "%s validates\n", filename);
> ++    } else if (ret > 0) {
> ++      testErrorHandler(NULL, "%s fails to validate\n", filename);
> ++    } else {
> ++      testErrorHandler(NULL, "%s validation generated an internal error=
\n",
> ++             filename);
> ++    }
> ++
> ++    xmlSchematronFreeValidCtxt(ctxt);
> ++    xmlFreeDoc(doc);
> ++    return(0);
> ++}
> ++
> ++/**
> ++ * schematronTest:
> ++ * @filename: the schemas file
> ++ * @result: the file with expected result
> ++ * @err: the file with error messages
> ++ *
> ++ * Returns 0 in case of success, an error code otherwise
> ++ */
> ++static int
> ++schematronTest(const char *filename,
> ++               const char *resul ATTRIBUTE_UNUSED,
> ++               const char *errr ATTRIBUTE_UNUSED,
> ++               int options) {
> ++    const char *base =3D baseFilename(filename);
> ++    const char *base2;
> ++    const char *instance;
> ++    xmlSchematronParserCtxtPtr pctxt;
> ++    xmlSchematronPtr schematron;
> ++    int res =3D 0, len, ret =3D 0;
> ++    int parseErrorsSize;
> ++    char pattern[500];
> ++    char prefix[500];
> ++    char err[500];
> ++    glob_t globbuf;
> ++    size_t i;
> ++    char count =3D 0;
> ++
> ++    /* Redirect XPath errors */
> ++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
> ++
> ++    pctxt =3D xmlSchematronNewParserCtxt(filename);
> ++    schematron =3D xmlSchematronParse(pctxt);
> ++    xmlSchematronFreeParserCtxt(pctxt);
> ++    if (schematron =3D=3D NULL)
> ++        testErrorHandler(NULL, "Schematron schema %s failed to compile\=
n",
> ++                         filename);
> ++    parseErrorsSize =3D testErrorsSize;
> ++
> ++    /*
> ++     * most of the mess is about the output filenames generated by the =
Makefile
> ++     */
> ++    len =3D strlen(base);
> ++    if ((len > 499) || (len < 5)) {
> ++        ret =3D -1;
> ++        goto done;
> ++    }
> ++    len -=3D 4; /* remove trailing .sct */
> ++    memcpy(prefix, base, len);
> ++    prefix[len] =3D 0;
> ++
> ++    if (snprintf(pattern, 499, "./test/schematron/%s_?.xml", prefix) >=
=3D 499)
> ++        pattern[499] =3D 0;
> ++
> ++    globbuf.gl_offs =3D 0;
> ++    glob(pattern, GLOB_DOOFFS, NULL, &globbuf);
> ++    for (i =3D 0;i < globbuf.gl_pathc;i++) {
> ++        testErrorsSize =3D parseErrorsSize;
> ++        testErrors[parseErrorsSize] =3D 0;
> ++        instance =3D globbuf.gl_pathv[i];
> ++      base2 =3D baseFilename(instance);
> ++      len =3D strlen(base2);
> ++      if ((len > 6) && (base2[len - 6] =3D=3D '_')) {
> ++          count =3D base2[len - 5];
> ++          res =3D snprintf(err, 499, "result/schematron/%s_%c.err",
> ++                   prefix, count);
> ++            if (res >=3D 499)
> ++              err[499] =3D 0;
> ++      } else {
> ++          fprintf(stderr, "don't know how to process %s\n", instance);
> ++          continue;
> ++      }
> ++      if (schematron !=3D NULL) {
> ++          nb_tests++;
> ++          res =3D schematronOneTest(filename, instance, options, schema=
tron);
> ++          if (res !=3D 0)
> ++              ret =3D res;
> ++      }
> ++        if (compareFileMem(err, testErrors, testErrorsSize)) {
> ++            fprintf(stderr, "Error for %s on %s failed\n", instance,
> ++                    filename);
> ++            ret =3D 1;
> ++        }
> ++    }
> ++    globfree(&globbuf);
> ++
> ++done:
> ++    xmlSchematronFree(schematron);
> ++    xmlSetStructuredErrorFunc(NULL, NULL);
> ++    return(ret);
> ++}
> ++#endif /* LIBXML_SCHEMATRON_ENABLED */
> ++
> + #ifdef LIBXML_PATTERN_ENABLED
> + #ifdef LIBXML_READER_ENABLED
> + /**********************************************************************=
**
> +@@ -5117,6 +5251,11 @@ testDesc testDescriptions[] =3D {
> +       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
> +       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
> + #endif
> ++#if defined(LIBXML_SCHEMATRON_ENABLED)
> ++    { "Schematron regression tests" ,
> ++      schematronTest, "./test/schematron/*.sct", NULL, NULL, NULL,
> ++      0 },
> ++#endif
> + #endif
> + #ifdef LIBXML_PATTERN_ENABLED
> + #ifdef LIBXML_READER_ENABLED
> +diff --git a/schematron.c b/schematron.c
> +index 411a515c..c970d31f 100644
> +--- a/schematron.c
> ++++ b/schematron.c
> +@@ -1484,6 +1484,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtP=
tr ctxt,
> +             select =3D xmlGetNoNsProp(child, BAD_CAST "select");
> +             comp =3D xmlXPathCtxtCompile(ctxt->xctxt, select);
> +             eval =3D xmlXPathCompiledEval(comp, ctxt->xctxt);
> ++            if (eval =3D=3D NULL) {
> ++                xmlXPathFreeCompExpr(comp);
> ++                xmlFree(select);
> ++                return ret;
> ++            }
> +
> +             switch (eval->type) {
> +             case XPATH_NODESET: {
> +diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
> +new file mode 100644
> +index 00000000..f03848aa
> +--- /dev/null
> ++++ b/test/schematron/zvon16.sct
> +@@ -0,0 +1,7 @@
> ++<sch:schema xmlns:sch=3D"http://purl.oclc.org/dsdl/schematron">
> ++      <sch:pattern id=3D"TestPattern">
> ++              <sch:rule context=3D"book">
> ++                      <sch:report test=3D"not(@available)">Book <sch:va=
lue-of select=3D"falae()"/> test</sch:report>
> ++              </sch:rule>
> ++      </sch:pattern>
> ++</sch:schema>
> +diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
> +new file mode 100644
> +index 00000000..551e2d65
> +--- /dev/null
> ++++ b/test/schematron/zvon16_0.xml
> +@@ -0,0 +1,5 @@
> ++<library>
> ++      <book title=3D"Test Book" id=3D"bk101">
> ++              <author>Test Author</author>
> ++      </book>
> ++</library>
> diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.12.10.bb
> index 2eea65732b..ea40ca68ed 100644
> --- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
> @@ -20,6 +20,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
>             file://install-tests.patch \
>             file://CVE-2025-32414.patch \
>             file://CVE-2025-32415.patch \
> +           file://CVE-2025-49795.patch \
>             "
>
>  SRC_URI[archive.sha256sum] =3D "c3d8c0c34aa39098f66576fe51969db12a5100b9=
56233dc56506f7a8679be995"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220138): https://lists.openembedded.org/g/openembedde=
d-core/message/220138
> Mute This Topic: https://lists.openembedded.org/mt/114097487/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

