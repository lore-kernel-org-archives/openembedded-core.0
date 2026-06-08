Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81812CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:06:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55496.1780927618844414370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U6Ev/Gc/;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b7866869so50799795e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780927617; x=1781532417; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxXQ0Hgab44jm5CAD0Z1ZrZ4AFcKynt05mndaChKaXE=;
        b=U6Ev/Gc/dBGtbPFeiY88sPtiWNq3/0rmH1WMNjQwZYLKQEo6b15Bn7U2Yp5ipXFZJ+
         G256lTE764N64DZoroR/L00Ki7UppgOztSOz4XF5pRSBu4ze6WEgGoKz7p4DV96YDY+0
         AHfUoYdN5Z2xGjJNEV9qarltty8EjD3vFc/Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927617; x=1781532417;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxXQ0Hgab44jm5CAD0Z1ZrZ4AFcKynt05mndaChKaXE=;
        b=ai58MlcV2pyO+p3qxnpb6S/jhr819N7/cgDlaqvU9loFFYFVSMOw2TfyVp5lO1MZNJ
         AsL7LT7m6YNiBCd+/1eJGxGBfSLA0Cpj6ws8KPplOsKv38Q4LpUtVsBi3SSueUMFUDq1
         6DDqEbVaMEDZ6/nXrkc8pNPAaJdYce5nkXdzBsJ4MOW7LRvQrcb5vAzOnvnD4poQbijt
         Ua6Uoq8rmSCdihW9c1q/lSVDT0d/kTc+3Mu260H/ie0lHLAHQSN2BhJa9hEQwFLA3EzB
         FhTSnUYyhS3lqlXaaI3hf/UdkNS0jzvZXOFluXDhQSieqoS4i3oskNNexZ72bXUkWarZ
         m6yg==
X-Forwarded-Encrypted: i=1; AFNElJ+hkYQMQCkqXaj8CfKGhlEzuTbDfxYDFa+APAaSXhA0APNiEoYIxrNT0zzEOpwEymLR/GeeCqw7Io1JLaza5R85PQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYrVIge8Z6jN1tHQH2bpFFkx66CI27wADSptBKlRnGtxZqNESu
	UrZsK3x6ZuUiacHvCF6z6HhPBgSZDxQa+NaOoHM42fJFHClH5NybdMDu4ir0gG2HYoE=
X-Gm-Gg: Acq92OEpTWn8lImth9H1Bqp/E5iqEcY3WIfuYheYiZ4x6yJB/8VmzM2PgfubDsJvnjt
	yL5evI+ogv3vzm+isv5mmcBSEi1EiU7DaKaumGWpdT+wSmQkWdol3VwqnoTbX5Tn7Ccub2Z4US/
	heJ3Z4ciwjqOXuU2VGSbDSCLrPyYHv9m1XJBu8K8u4Nr9evHukmHZhoiJ77TeA7zfXO3z9g7wnU
	3K5HawxlcpdTvNdwqxvPBoJSefZjbpIANMK1lNJvbc8uERKTrcGjFDd8lApaDeqCi0q9mabV4VZ
	BTZoNoAhzYDXX5Y8ctgAvrggBZvBVyk0A1cmCOuVUo0/bP1TdP2wnG4M1vaQgM8a9Xz3OhIB1Ip
	QBqYRKBW82xFd5qRi8OpNWcEjkZXnns80vsTq2roAV9SSMXnYYizC1oGJJ+SSiUDgGSHcMMxFpi
	Q52QRiOgaSYJGeQjz+fDi9hVLEBG1t6Y9YHo0h+xJmZSBsOxRaRmFc9IBN/moB5bt6j0DQe9RaF
	kTvlULy7APk4S2uDy3qTQ==
X-Received: by 2002:a05:600c:35cc:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490c263fd13mr306885995e9.28.1780927617105;
        Mon, 08 Jun 2026 07:06:57 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm399767295e9.15.2026.06.08.07.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:06:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:06:56 +0200
Message-Id: <DJ3Q5GCNO1UT.3AGC33VNG4IK6@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260602140623.762455-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260602140623.762455-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238244

On Tue Jun 2, 2026 at 4:06 PM CEST, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-6276.
> https://nvd.nist.gov/vuln/detail/CVE-2026-6276
>
> Upstream fix:
>   https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263=
c92db
>
> Adapted for curl 8.19.0:
> - Use Curl_safefree (upstream uses curlx_safefree, renamed in later versi=
ons)
> - Drop req->userpwd/req->proxyuserpwd context (not yet moved to
>   SingleRequest in this version)
>
> Tested with ptest:
> Before: PASSED: 1000, FAILED: 0, SKIPPED: 0
> After: PASSED: 1001, FAILED: 0, SKIPPED: 0
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 316 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-6276.patch
> new file mode 100644
> index 0000000000..68bec24e94
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
> @@ -0,0 +1,315 @@
> +From 48d71bc976572aaf09c63ab86b5165762450a507 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 14 Apr 2026 08:51:44 +0200
> +Subject: [PATCH] urldata: move cookiehost to struct SingleRequest
> +
> +To make it scoped for the single request appropriately.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Verify with libtest 2504: a custom Host *disabled* on reused handle
> +
> +Closes #21312
> +
> +CVE: CVE-2026-6276
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/3a19987a8=
7f393d9394fe5acc7643f6c263c92db]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + lib/http.c                 | 14 +++---
> + lib/request.c              |  3 ++
> + lib/request.h              |  3 ++
> + lib/url.c                  |  2 +-
> + lib/urldata.h              |  3 --
> + tests/data/Makefile.am     |  2 +-
> + tests/data/test2504        | 52 +++++++++++++++++++++
> + tests/libtest/Makefile.inc |  2 +-
> + tests/libtest/lib2504.c    | 93 ++++++++++++++++++++++++++++++++++++++
> + 9 files changed, 162 insertions(+), 12 deletions(-)
> + create mode 100644 tests/data/test2504
> + create mode 100644 tests/libtest/lib2504.c
> +
> +diff --git a/lib/http.c b/lib/http.c
> +index 188da5fd83..7ebbdfa551 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -2002,6 +2002,9 @@ static CURLcode http_set_aptr_host(struct Curl_eas=
y *data)
> +     data->state.first_remote_protocol =3D conn->scheme->protocol;
> +   }
> +   Curl_safefree(aptr->host);
> ++#ifndef CURL_DISABLE_COOKIES
> ++  Curl_safefree(data->req.cookiehost);
> ++#endif
> +=20
> +   ptr =3D Curl_checkheaders(data, STRCONST("Host"));
> +   if(ptr && (!data->state.this_is_a_follow ||
> +@@ -2037,8 +2040,7 @@ static CURLcode http_set_aptr_host(struct Curl_eas=
y *data)
> +         if(colon)
> +           *colon =3D 0; /* The host must not include an embedded port n=
umber */
> +       }
> +-      curlx_free(aptr->cookiehost);
> +-      aptr->cookiehost =3D cookiehost;
> ++      data->req.cookiehost =3D cookiehost;
> +     }
> + #endif
> +=20
> +@@ -2538,8 +2540,8 @@ static CURLcode http_cookies(struct Curl_easy *dat=
a,
> +=20
> +     if(data->cookies && data->state.cookie_engine) {
> +       bool okay;
> +-      const char *host =3D data->state.aptr.cookiehost ?
> +-        data->state.aptr.cookiehost : data->conn->host.name;
> ++      const char *host =3D data->req.cookiehost ?
> ++        data->req.cookiehost : data->conn->host.name;
> +       Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SIN=
GLE);
> +       result =3D Curl_cookie_getlist(data, data->conn, &okay, host, &li=
st);
> +       if(!result && okay) {
> +@@ -3545,8 +3547,8 @@ static CURLcode http_header_s(struct Curl_easy *da=
ta,
> +   if(v) {
> +     /* If there is a custom-set Host: name, use it here, or else use
> +      * real peer hostname. */
> +-    const char *host =3D data->state.aptr.cookiehost ?
> +-      data->state.aptr.cookiehost : conn->host.name;
> ++    const char *host =3D data->req.cookiehost ?
> ++      data->req.cookiehost : conn->host.name;
> +     const bool secure_context =3D Curl_secure_context(conn, host);
> +     CURLcode result;
> +     Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGL=
E);
> +diff --git a/lib/request.c b/lib/request.c
> +index 66077530d7..765dbac058 100644
> +--- a/lib/request.c
> ++++ b/lib/request.c
> +@@ -113,6 +113,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, =
struct Curl_easy *data)
> +   struct curltime t0 =3D { 0, 0 };
> +=20
> +   Curl_safefree(req->newurl);
> ++#ifndef CURL_DISABLE_COOKIES
> ++  Curl_safefree(req->cookiehost);
> ++#endif
> +   Curl_client_reset(data);
> +   if(req->sendbuf_init)
> +     Curl_bufq_reset(&req->sendbuf);
> +diff --git a/lib/request.h b/lib/request.h
> +index 5332d48538..6e4bd0fb6e 100644
> +--- a/lib/request.h
> ++++ b/lib/request.h
> +@@ -95,6 +95,9 @@ struct SingleRequest {
> +   char *newurl;     /* Set to the new URL to use when a redirect or a r=
etry is
> +                        wanted */
> +=20
> ++#ifndef CURL_DISABLE_COOKIES
> ++  char *cookiehost;
> ++#endif
> + #ifndef CURL_DISABLE_COOKIES
> +   unsigned char setcookies;
> + #endif
> +diff --git a/lib/url.c b/lib/url.c
> +index ec0457bcdd..b9e308add2 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -304,7 +304,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
> +   Curl_safefree(data->state.aptr.ref);
> +   Curl_safefree(data->state.aptr.host);
> + #ifndef CURL_DISABLE_COOKIES
> +-  Curl_safefree(data->state.aptr.cookiehost);
> ++  Curl_safefree(data->req.cookiehost);
> + #endif
> + #ifndef CURL_DISABLE_RTSP
> +   Curl_safefree(data->state.aptr.rtsp_transport);
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 5ae148054b..d71337c8f6 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1052,9 +1052,6 @@ struct UrlState {
> +     char *rangeline;
> +     char *ref;
> +     char *host;
> +-#ifndef CURL_DISABLE_COOKIES
> +-    char *cookiehost;
> +-#endif
> + #ifndef CURL_DISABLE_RTSP
> +     char *rtsp_transport;
> + #endif
> +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
> +index 53abf60901..da0f8f55d4 100644
> +--- a/tests/data/Makefile.am
> ++++ b/tests/data/Makefile.am
> +@@ -264,7 +264,7 @@ test2309 \
> + \
> + test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407=
 \
> + \
> +-test2500 test2501 test2502 test2503 \
> ++test2500 test2501 test2502 test2503 test2504 \
> + \
> + test2600 test2601 test2602 test2603 test2604 test2605 \
> + \
> +diff --git a/tests/data/test2504 b/tests/data/test2504
> +new file mode 100644
> +index 0000000000..8cec1c8210
> +--- /dev/null
> ++++ b/tests/data/test2504
> +@@ -0,0 +1,52 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: server.example.com
> ++Content-Length: 47
> ++Set-Cookie: sid=3DSECRET123; Path=3D/
> ++
> ++file contents should appear once for each file
> ++</data>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<name>
> ++custom Host with cookie, handle reuse, no custom Host:
> ++</name>
> ++<command>
> ++http://%HOSTIP:%HTTPPORT
> ++</command>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET / HTTP/1.1
> ++Host: victim.internal
> ++Accept: */*
> ++
> ++GET / HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++Accept: */*
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index e3202804a9..2319bafe72 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -113,7 +113,7 @@ TESTS_C =3D \
> +   lib2023.c lib2032.c lib2082.c \
> +   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c=
 \
> +   lib2402.c           lib2404.c lib2405.c \
> +-  lib2502.c \
> ++  lib2502.c lib2504.c \
> +   lib2700.c \
> +   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
> +   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
> +diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c
> +new file mode 100644
> +index 0000000000..72b965d6e6
> +--- /dev/null
> ++++ b/tests/libtest/lib2504.c
> +@@ -0,0 +1,93 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
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
> ++#include "first.h"
> ++
> ++#include "testtrace.h"
> ++
> ++static size_t sink2504(char *ptr, size_t size, size_t nmemb, void *ud)
> ++{
> ++  (void)ptr;
> ++  (void)ud;
> ++  return size * nmemb;
> ++}
> ++
> ++static void dump_cookies2504(CURL *h, const char *tag)
> ++{
> ++  struct curl_slist *cookies =3D NULL;
> ++  struct curl_slist *nc;
> ++  CURLcode rc =3D curl_easy_getinfo(h, CURLINFO_COOKIELIST, &cookies);
> ++
> ++  curl_mprintf("=3D=3D %s =3D=3D\n", tag);
> ++  if(rc) {
> ++    curl_mprintf("getinfo error: %d\n", (int)rc);
> ++    return;
> ++  }
> ++  for(nc =3D cookies; nc; nc =3D nc->next)
> ++    puts(nc->data);
> ++  curl_slist_free_all(cookies);
> ++}
> ++
> ++static CURLcode test_lib2504(const char *URL)
> ++{
> ++  CURL *curl;
> ++  CURLcode result =3D CURLE_OUT_OF_MEMORY;
> ++  struct curl_slist *hdrs =3D NULL;
> ++
> ++  if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
> ++    curl_mfprintf(stderr, "curl_global_init() failed\n");
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  curl =3D curl_easy_init();
> ++  if(!curl) {
> ++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++    curl_global_cleanup();
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  hdrs =3D curl_slist_append(hdrs, "Host: victim.internal");
> ++  if(hdrs) {
> ++    test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2504);
> ++    test_setopt(curl, CURLOPT_COOKIEFILE, "");
> ++    test_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
> ++    test_setopt(curl, CURLOPT_URL, URL);
> ++
> ++    result =3D curl_easy_perform(curl);
> ++    curl_mprintf("req1=3D%d\n", (int)result);
> ++    dump_cookies2504(curl, "after request 1");
> ++
> ++    test_setopt(curl, CURLOPT_HTTPHEADER, NULL);
> ++    test_setopt(curl, CURLOPT_URL, URL);
> ++
> ++    result =3D curl_easy_perform(curl);
> ++    curl_mprintf("req2=3D%d\n", (int)result);
> ++    dump_cookies2504(curl, "after request 2");
> ++  }
> ++test_cleanup:
> ++  curl_slist_free_all(hdrs);
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++
> ++  return result;
> ++}
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index b9251336b8..9bbbb5e36f 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -161,6 +161,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>  	perl-module-memoize \
>  	perl-module-storable \
>  	perl-module-time-hires \
> +    file://CVE-2026-6276.patch \

This should be in SRC_URI, not in RDEPENDS. Did you try to build this
patch?

Regards,

>  "
> =20
>  PACKAGES =3D+ "lib${BPN}"


--=20
Yoann Congal
Smile ECS


