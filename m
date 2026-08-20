Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DD4C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:23:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4254.1787221433831708254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uhjF+mD6;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476a130c138so2291036f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 03:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787221432; x=1787826232; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOaeHipqaPJD0rVOtLf1RM+cxUHOrEtnKmi4sxbacvw=;
        b=uhjF+mD6sDFljj104Izy3ZTGlIcMTLoPUuktTlFFRQ/gzXctGMB6N0QcKdISewPDku
         6ZUClhm9Cz3tf3vIorUQM2VC4znCW7m3qdKvVhQ93aJL3inu1nJs6akqWgbMGjkJ1pdl
         Hx6/gLLVGioHQDtQZbYGnCcOaU1CceCMhwAhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221432; x=1787826232;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOaeHipqaPJD0rVOtLf1RM+cxUHOrEtnKmi4sxbacvw=;
        b=FHZF+lV1H0drPQDIv+2C1DWxMgG3FfQO65bFOp6IZM/Thszn20UPbMepLI604wrYD8
         3Y6+tbDcfIRgHuxyg4rYg+cXGEr04mT6Apqbt0fWFLtJQrrbnYKDnLdWA5Qs2oyJK06b
         HYDtEegmXUr2R1ThVjH16A9s1NlnA7MDRCKW69E2VmoS2ZC1ZNV9bWDrsgUuaeU65K/u
         ECrAFVTq+6tpK0USQd6FVxxOE4YPsWdWqNhxwBpmduBNYY9QGO4/sgQZUwliEEWH4Jd/
         Dy6xGrBORwJlOQGz9/qoxswsBez+4W5w/X+er8YoZj5KZJ+RcXlo5nh4ytjCC/ZCfGuA
         YAxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp57Ykn4LRWXzzlanGeuSrP1hdZcTz/MWZ16ZWy98CKvKXpRw1mJCzZASs0rSOYY2UXy7pTg9+ccOAWBShTgLYhpQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n59jaE5mJHOcoLafo7qNsa8TeK21XamYpfCaRUsrVIuc1G8qYo
	EJ51KMsTB0g8F2AbFE3Z5WShlWjgFPQb/dXI4fIRKu9mE923fXsYTgLVTv8FBnjHwZA=
X-Gm-Gg: AR+sD13QNF0YMx1v9Uc3fr7gLXia6sfI3pIcyPPBzoEMKXNZPqLRGqJVCZaBlO9qGc2
	xtqcZ36rkuaPXMiqGRHXNIx4Cvm3bIWjwtWSO716uVIN2eIwG1vV11y/9VpukvwD6k39750Fu+M
	jLhe2zDPWw+mFqiHB8TwPcC5gOkq1NAfiolhZIPqaIGUFoqjORBjLSTrpMOL5pg28AN8Ceqsgte
	BP4yZy8+R8r+C1KCIxt9btIkNRb4jbqDXJBfIepB05FF+aOjaYFRpMJvxsjFxgcrYb6QnOkx9Jy
	pW5C1/YLoRojdQPLh8Ihw202hnFhetx6fWjnwR6tKuSc+H1D0A+slK4U3Md5pf0geiKoHswoK9+
	z9eS4jOd2c+bbwBc9ZM54OW87zOuPhsqMkYYj7BfekViNm9r+AqAPkkYTWmBQp4+cbHGfb4f6xY
	S6NmKZx8qzVgTH15dlE/qy135FjC4Gkz40yDmIj7ntsgcLMxQ0VV/UMzBWdSjAmMpRgBEJFnlJN
	6mpcn7dz733IADAleWn+jnNCvxXilKpDCqkF5OK7dkQJQ3zbepJxr26HIPQIcd6GLSkvz61PkH9
	rWdPAhHnz6B1GgaTiwf9HRWhwU8JbJl3CbQ=
X-Received: by 2002:a05:6000:60c:b0:47f:71a6:970e with SMTP id ffacd0b85a97d-482b1e84686mr22051879f8f.2.1787221431865;
        Thu, 20 Aug 2026 03:23:51 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441c78sm12066727f8f.2.2026.08.20.03.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:23:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 12:23:50 +0200
Message-Id: <DKTP4ETBSBHF.1LWD2OE8VROP3@smile.fr>
Subject: Re: [OE-core][scarthgap 23/37] curl: fix CVE-2026-7168
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <fabien.thomas@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <cover.1787154074.git.fabien.thomas@smile.fr>
 <18CD4012388268D1.189677@lists.openembedded.org>
In-Reply-To: <18CD4012388268D1.189677@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 10:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243849

On Wed Aug 19, 2026 at 5:56 PM CEST, Fabien Thomas via lists.openembedded.o=
rg wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-7168.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c=
8594507
> [2] https://curl.se/docs/CVE-2026-7168.html
>
> (From OE-Core rev: 2fa295fe7473c6df94175de36528736bf32f1e9a)
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> ---
>  .../curl/curl/CVE-2026-7168.patch             | 425 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 426 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-7168.patch
> new file mode 100644
> index 00000000000..0669be6546d
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> @@ -0,0 +1,425 @@
> +From 0f0bb5efbd1e4f2199eeb98e6c62a7a67242cad2 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 5 Jun 2026 01:22:37 -0700
> +Subject: [PATCH] setopt: clear proxy auth properties when switching
> +
> +Verify with test 1588
> +
> +Closes #21453
> +
> +CVE: CVE-2026-7168
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59a=
cbaf9504c4578d4cf56cdd7c8594507]
> +
> +Backport Changes:
> +- The upstream lib/setopt.c hunk reuses Curl_auth_digest_cleanup() from =
the
> +  newer tree. curl-8.7.1 does not expose that helper to setopt.c in the =
same
> +  way, so this backport adds the vauth/vauth.h include before applying t=
he
> +  upstream setproxy() cleanup logic.
> +- The upstream tree already provides a CURL_DISABLE_DIGEST_AUTH fallback=
 for
> +  Curl_auth_digest_cleanup(). curl-8.7.1 does not, so this backport adds=
 the
> +  equivalent no-op macro in lib/vauth/vauth.h.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> +  instead of the upstream tests/data/Makefile.am and
> +  tests/libtest/Makefile.am lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> +  test_lib1588(), libtest_arg4, and CURLcode result handling were adapte=
d to
> +  test.h, test(), test_argv[4], and int res.
> +- curl-8.7.1 does not define the newer digest test feature in runtests.p=
l.
> +  This backport defines the target harness feature as digest-auth, match=
ing
> +  tests/server/disabled.c, and makes test 1588 require digest-auth.
> +- The curl-8.7.1 server harness does not handle crlf=3D"headers" correct=
ly on
> +  response data sections for this test, so those attributes were removed=
 from
> +  the two server response blocks and datacheck. The protocol block keeps
> +  crlf=3D"headers" because runtests.pl normalizes protocol verification =
when any
> +  crlf attribute is present.
> +
> +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/setopt.c               |  18 ++++-
> + lib/vauth/vauth.h          |   2 +
> + tests/data/Makefile.inc    |   1 +
> + tests/data/test1588        | 106 ++++++++++++++++++++++++++
> + tests/libtest/Makefile.inc |   5 +-
> + tests/libtest/lib1588.c    | 152 +++++++++++++++++++++++++++++++++++++
> + tests/runtests.pl          |   2 +
> + 7 files changed, 283 insertions(+), 3 deletions(-)
> + create mode 100644 tests/data/test1588
> + create mode 100644 tests/libtest/lib1588.c
> +
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 8a5a5d7..7eaf309 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -51,6 +51,7 @@
> + #include "altsvc.h"
> + #include "hsts.h"
> + #include "tftp.h"
> ++#include "vauth/vauth.h"
> + #include "strdup.h"
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> +@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
> +   return CURLE_OK;
> + }
> +=20
> ++#ifndef CURL_DISABLE_PROXY
> ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
> ++{
> ++  if((data->set.str[STRING_PROXY] && proxy) &&
> ++     /* there was one set, is this a new one? */
> ++     !strcmp(data->set.str[STRING_PROXY], proxy))
> ++    return CURLE_OK; /* same one as before */
> ++
> ++  Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
> ++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
> ++}
> ++#endif
> ++
> + CURLcode Curl_setblobopt(struct curl_blob **blobp,
> +                          const struct curl_blob *blob)
> + {
> +@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURL=
option option, va_list param)
> +      * Setting it to NULL, means no proxy but allows the environment va=
riables
> +      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
> +      */
> +-    result =3D Curl_setstropt(&data->set.str[STRING_PROXY],
> +-                            va_arg(param, char *));
> ++    result =3D setproxy(data, va_arg(param, char *));
> +     break;
> +=20
> +   case CURLOPT_PRE_PROXY:
> +diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
> +index 9da0540..bf5c7a3 100644
> +--- a/lib/vauth/vauth.h
> ++++ b/lib/vauth/vauth.h
> +@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct=
 Curl_easy *data,
> +=20
> + /* This is used to clean up the digest specific data */
> + void Curl_auth_digest_cleanup(struct digestdata *digest);
> ++#else
> ++#define Curl_auth_digest_cleanup(x)
> + #endif /* !CURL_DISABLE_DIGEST_AUTH */
> +=20
> + #ifdef USE_GSASL
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index f673f86..461eb37 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -200,6 +200,7 @@ test1540 test1541 test1542 test1543 test1544 test154=
5 \
> + test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1557=
 \
> + test1558 test1559 test1560 test1561 test1562 test1563 test1564 test1565=
 \
> + test1566 test1567 test1568 test1569 test1570 \
> ++test1588 \
> + \
> + test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597=
 \
> + test1598 \
> +diff --git a/tests/data/test1588 b/tests/data/test1588
> +new file mode 100644
> +index 0000000..8a3bf81
> +--- /dev/null
> ++++ b/tests/data/test1588
> +@@ -0,0 +1,106 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++HTTP GET
> ++HTTP proxy
> ++HTTP proxy Digest auth
> ++multi
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++
> ++# this is returned first since we get no proxy-auth
> ++<data>
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++And you should ignore this data.
> ++</data>
> ++
> ++# then this is returned when we get proxy-auth
> ++<data1000>
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++</data1000>
> ++
> ++<datacheck>
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++</datacheck>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++# tool is what to use instead of 'curl'
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<features>
> ++!SSPI
> ++crypto
> ++proxy
> ++digest-auth
> ++</features>
> ++<name>
> ++HTTP proxy auth Digest, then change proxy and do it again
> ++</name>
> ++<command>
> ++http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT silly=
:person custom.set.host.name
> ++</command>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm", =
nonce=3D"12345", uri=3D"/path/1588", response=3D"d0b2f000c7e3fca24452b58107=
13404a"
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm", =
nonce=3D"12345", uri=3D"/path/1588", response=3D"d0b2f000c7e3fca24452b58107=
13404a"
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 9d3356a..4c42d34 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -62,7 +62,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmco=
nnect libprereq      \
> +  lib1540 lib1541 lib1542 lib1543         lib1545 \
> +  lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib1557 \
> +  lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib1569 \
> +- lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> ++ lib1588 lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> +  \
> +  lib1662 \
> +  \
> +@@ -687,6 +687,9 @@ lib2502_LDADD =3D $(TESTUTIL_LIBS)
> + lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib2506_LDADD =3D $(TESTUTIL_LIBS)
> +=20
> ++lib1588_SOURCES =3D lib1588.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> ++lib1588_LDADD =3D $(TESTUTIL_LIBS)
> ++
> + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib3010_LDADD =3D $(TESTUTIL_LIBS)
> +=20
> +diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
> +new file mode 100644
> +index 0000000..00c6b35
> +--- /dev/null
> ++++ b/tests/libtest/lib1588.c
> +@@ -0,0 +1,152 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++/*
> ++ * argv1 =3D URL
> ++ * argv2 =3D proxy host
> ++ * argv3 =3D proxy port
> ++ * argv4 =3D proxyuser:password
> ++ */
> ++
> ++#include "test.h"
> ++#include "testutil.h"
> ++
> ++static CURLcode init1588(CURL *curl, const char *url,
> ++                         const char *userpwd, const char *proxy)
> ++{
> ++  int res =3D CURLE_OK;
> ++
> ++  res_easy_setopt(curl, CURLOPT_URL, url);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXY, proxy);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++#if 0
> ++  res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++#endif
> ++
> ++  res_easy_setopt(curl, CURLOPT_HEADER, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  return CURLE_OK; /* success */
> ++
> ++init_failed:
> ++  return (CURLcode)res; /* failure */
> ++}
> ++
> ++static CURLcode run1588(CURL *curl, const char *url, const char *userpw=
d,
> ++                        const char *proxy)
> ++{
> ++  CURLcode res =3D CURLE_OK;
> ++
> ++  res =3D init1588(curl, url, userpwd, proxy);
> ++  if(res)
> ++    return res;
> ++
> ++  return curl_easy_perform(curl);
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++  int res =3D CURLE_OK;
> ++  CURL *curl =3D NULL;
> ++  const char *proxyuserpws;
> ++  struct curl_slist *host =3D NULL;
> ++  struct curl_slist *host2 =3D NULL;
> ++  char proxy1_resolve[128];
> ++  char proxy2_resolve[128];
> ++  char proxy1_connect[128];
> ++  char proxy2_connect[128];
> ++
> ++  if(test_argc < 5)
> ++    return TEST_ERR_MAJOR_BAD;
> ++  proxyuserpws =3D test_argv[4];
> ++
> ++  curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
> ++                 "firstproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++  curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
> ++                 "secondproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++
> ++  /* we connect to the fake host name but the right port number */
> ++  curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
> ++                 "firstproxy:%s", libtest_arg3);
> ++  curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
> ++                 "secondproxy:%s", libtest_arg3);
> ++
> ++  res_global_init(CURL_GLOBAL_ALL);
> ++  if(res)
> ++    return res;
> ++
> ++  curl =3D curl_easy_init();
> ++  if(!curl) {
> ++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++    curl_global_cleanup();
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  host =3D curl_slist_append(NULL, proxy1_resolve);
> ++  if(!host)
> ++    goto test_cleanup;
> ++  host2 =3D curl_slist_append(host, proxy2_resolve);
> ++  if(!host2)
> ++    goto test_cleanup;
> ++  host =3D host2;
> ++
> ++  start_test_timing();
> ++
> ++  easy_setopt(curl, CURLOPT_RESOLVE, host);
> ++
> ++  res =3D run1588(curl, URL, proxyuserpws, proxy1_connect);
> ++  if(res)
> ++    goto test_cleanup;
> ++
> ++  curl_mfprintf(stderr, "lib1588: now we do the request again\n");
> ++
> ++  res =3D run1588(curl, URL, proxyuserpws, proxy2_connect);
> ++
> ++test_cleanup:
> ++
> ++  /* proper cleanup sequence - type PB */
> ++
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++  curl_slist_free_all(host);
> ++  return res;
> ++}
> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20..b40df55 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> +             # SPNEGO enabled
> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++            # Digest auth enabled unless disabled by build
> ++            $feature{"digest-auth"} =3D 1;
> +             # CharConv enabled
> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> +             # TLS-SRP enabled
> +--
> +2.35.6
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 8e39d821626..7d55f72b03f 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D " \
>      file://CVE-2026-5545.patch \
>      file://CVE-2026-6253.patch \
>      file://CVE-2026-6429.patch \
> +    file://CVE-2026-7168.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \

I'll have to drop this patch too because it doesn't apply anymore without=
=20
the previous patch of the series (curl: fix CVE-2026-6429) which cause some=
=20
ptest faillures.

--=20
Fabien Thomas
Smile ECS


