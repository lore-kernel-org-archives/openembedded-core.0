Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD19C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:37:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4191.1787222227932548073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DtYWcZsh;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-480001972b8so753003f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787222226; x=1787827026; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7UON8Dh5YdRLaVTrqjF7JsBNwl8y05eUUQe2k7N+uw=;
        b=DtYWcZshdQBsK3hAzoClV6066YG7/Ko8VZiE6h1ZnE0K/iFgfciRQQy5UaBvbRUG17
         4Pe8uIbmzEDq8+G71No+xknrU6VA1Gn3m87mXelOUgFyt3UUUWpEXMWYhfKvdhjfiWlg
         z+sm6va+9L6d+AEGsPdghK96kz2TIHZ7065BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787222226; x=1787827026;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7UON8Dh5YdRLaVTrqjF7JsBNwl8y05eUUQe2k7N+uw=;
        b=UokeeMn68XTtHrDA8J7n679vEWR71MRykntlHQcckO+1DlH2B9gE14HZ928oZnLPtk
         E76YEKUN6GwyhJ5R/zFGbqJTBo2glD3JbtUwDUqVXoRKHDY6NInw1q4mgBpwHLoFDYUm
         RCYUp3AJm9eV9u1pYD+q4IuxN8VImknsRXSoSJs5CsHEaktipo1YgoEOT35LuIxn5+l9
         +DDS35g+YjztCy8iVZ0EcNDyhR6fGlVilRS2vNsDA/DLX8SUJZVrG5ahUg0QnDdPg4DB
         5O2u8d5GIgl95xEYvcg7qJT3udPY8N+KEj0RSq24iKbfsIJcC2RW04AVP55AS+8r2MtU
         alAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpE/NeJUB/WeI4mWYdrBIaDOHaBAUTJEZeIJb8OSQP98ajj+z8+jCZMR4Ga5Bh95gvFRTFK/bPuiooQc18N1/qCpg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mXDZbYnI1gBdnTbbVjOnbt+nwvrOJZ3rHXo1NXsOHewEFmvK3i
	ILXr/cIVKHO+8T86DAnJj0+hkB9fRjObGR2STtKxx7e5nd5k3OX5wtn5n4cVr/IE33s=
X-Gm-Gg: AR+sD12mH7l4MJxFF/otShlvEdf7jTdRec/YdCA644Tu51+5C6laFxpX/9XlYXthiIZ
	DtQSelZh0+zmTP3T5VKXXlLUXcM7nA2teDefrjXnM3hga8DXVtYhjPgxBf7CW8QyVCwomkuk1yh
	NDQw1YbWMuXfvecL99r77hrYeAYAnq+6w4yNPSDInY34j2Qvah9OHfllEU3zALMipFAHqMo9o+C
	TYss7A6IFUt597sUuhzEdufs45Lw11zrRRWl9NYDla9VaOLGS3+OLEN0uxP1edqHIC8H4jNdwmg
	mThNQFrB55DzJSnEa92kvpx/aWs8BcEMbjSO72k96C8ijJohQBBX4C7PZLlXpdEYMs+aXHJTHMT
	yJRccv2QhT1GTFpqbiu5CeHFlw5ESpeOhvBaklRhH0/CMBnzkQyL0LU7zFPb2nM+CUAi6FeuXb7
	BcPvqp5ohf9EyDExl6t9mx0SwIl5kKUuP/Q2mg5R8cVsUYIDBAV26BkC0jXpTw3Gtb3llrpzUJb
	Gami0KZeJKj2xaG5sGUOR0U+kzjVP2HvR3Pwb6IMqKo/sWZi0IVkU9BY4r96m5XNJfIZIF3L4TB
	iAIYCk2UJ5GtvejfTNxB8XsJjK2aIVYO5I4=
X-Received: by 2002:a05:6000:4b10:b0:47f:97f6:d39a with SMTP id ffacd0b85a97d-482b1fece9emr22172902f8f.17.1787222226050;
        Thu, 20 Aug 2026 03:37:06 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b802dsm10781063f8f.17.2026.08.20.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:37:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 12:37:05 +0200
Message-Id: <DKTPEJQCSYQE.1F5LU52QXH9MA@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 4/5] curl: fix CVE-2026-6429
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260629104801.972184-1-adongare@cisco.com>
 <20260804103305.1180770-1-deeratho@cisco.com>
 <20260804103305.1180770-4-deeratho@cisco.com>
In-Reply-To: <20260804103305.1180770-4-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 10:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243852

On Tue Aug 4, 2026 at 12:33 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-6429.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f19=
9ace306
> [2] https://curl.se/docs/CVE-2026-6429.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v1 to v2: Rebase the patches on top of scarthgap latest
> fixes.
>  .../curl/curl/CVE-2026-6429.patch             | 367 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 368 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-6429.patch
> new file mode 100644
> index 0000000000..f4df441aa2
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> @@ -0,0 +1,367 @@
> +From 8191fd6d5677c30579c09a8d0988b47bbf33f65f Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 5 Jun 2026 01:20:50 -0700
> +Subject: [PATCH] http: clear credentials better on redirect
> +
> +Verify with test 2506: netrc with redirect using proxy
> +
> +Updated test 998 which was wrong.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Closes #21345
> +
> +CVE: CVE-2026-6429
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf80=
8bd558026fdc6096e8457f199ace306]
> +
> +Backport Changes:
> +- The upstream lib/http.c hunk adds the same-origin credential clearing =
to
> +  Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirec=
t
> +  handler and carries the equivalent redirect logic in lib/transfer.c vi=
a
> +  Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> +  instead of the upstream tests/data/Makefile.am and
> +  tests/libtest/Makefile.am lists.
> +- curl-8.7.1 does not contain test2504/lib2504, so the new
> +  test2506/lib2506 entries were registered after the nearest existing
> +  test2503/lib2502 entries in the target-version test lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> +  test_lib2506(), and CURLcode result handling were adapted to test.h,
> +  test(), and int res.
> +- Scarthgap curl-8.7.1 keeps the same incorrect redirected-request
> +  Authorization expectation in tests/data/test998, so this backport remo=
ves
> +  that expectation with an equivalent target-version hunk.
> +
> +(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/transfer.c             | 103 +++++++++++++++++++++----------------
> + tests/data/Makefile.inc    |   2 +-
> + tests/data/test2506        |  64 +++++++++++++++++++++++
> + tests/data/test998         |   1 -
> + tests/libtest/Makefile.inc |   5 +-
> + tests/libtest/lib2506.c    |  71 +++++++++++++++++++++++++
> + 6 files changed, 198 insertions(+), 48 deletions(-)
> + create mode 100644 tests/data/test2506
> + create mode 100644 tests/libtest/lib2506.c
> +
> +diff --git a/lib/transfer.c b/lib/transfer.c
> +index a73462928d..0f5bd8ce59 100644
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -865,49 +865,62 @@ CURLcode Curl_follow(struct Curl_easy *data,
> +     if(uc)
> +       return Curl_uc_to_curlcode(uc);
> +
> +-    /* Clear auth if this redirects to a different port number or proto=
col,
> +-       unless permitted */
> +-    if(!data->set.allow_auth_to_other_hosts && (type !=3D FOLLOW_FAKE))=
 {
> +-      char *portnum;
> +-      int port;
> +-      bool clear =3D FALSE;
> +-
> +-      if(data->set.use_port && data->state.allow_port)
> +-        /* a custom port is used */
> +-        port =3D (int)data->set.use_port;
> +-      else {
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
> +-                          CURLU_DEFAULT_PORT);
> +-        if(uc) {
> +-          free(newurl);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> +-        port =3D atoi(portnum);
> +-        free(portnum);
> +-      }
> +-      if(port !=3D data->info.conn_remote_port) {
> +-        infof(data, "Clear auth, redirects to port from %u to %u",
> +-              data->info.conn_remote_port, port);
> +-        clear =3D TRUE;
> ++    {
> ++      bool same_origin;
> ++      CURLU *u;
> ++      char *oldscheme =3D NULL;
> ++      char *oldhost =3D NULL;
> ++      char *oldport =3D NULL;
> ++      char *newscheme =3D NULL;
> ++      char *newhost =3D NULL;
> ++      char *newport =3D NULL;
> ++
> ++      u =3D curl_url();
> ++      if(!u) {
> ++        free(newurl);
> ++        return CURLE_OUT_OF_MEMORY;
> +       }
> +-      else {
> +-        char *scheme;
> +-        const struct Curl_handler *p;
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, =
0);
> +-        if(uc) {
> +-          free(newurl);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> +
> +-        p =3D Curl_get_scheme_handler(scheme);
> +-        if(p && (p->protocol !=3D data->info.conn_protocol)) {
> +-          infof(data, "Clear auth, redirects scheme from %s to %s",
> +-                data->info.conn_scheme, scheme);
> +-          clear =3D TRUE;
> +-        }
> +-        free(scheme);
> ++      uc =3D curl_url_set(u, CURLUPART_URL, data->state.url, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_PORT, &oldport, CURLU_DEFAULT_=
PORT);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &newschem=
e, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0=
);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
> ++                          CURLU_DEFAULT_PORT);
> ++      if(uc) {
> ++        curl_url_cleanup(u);
> ++        free(oldscheme);
> ++        free(oldhost);
> ++        free(oldport);
> ++        free(newscheme);
> ++        free(newhost);
> ++        free(newport);
> ++        free(newurl);
> ++        return Curl_uc_to_curlcode(uc);
> +       }
> +-      if(clear) {
> ++
> ++      same_origin =3D strcasecompare(oldscheme, newscheme) &&
> ++                    strcasecompare(oldhost, newhost) &&
> ++                    !strcmp(oldport, newport);
> ++
> ++      curl_url_cleanup(u);
> ++      free(oldscheme);
> ++      free(oldhost);
> ++      free(oldport);
> ++      free(newscheme);
> ++      free(newhost);
> ++      free(newport);
> ++
> ++      if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
> ++         !data->set.str[STRING_USERNAME]) {
> +         result =3D Curl_reset_userpwd(data);
> +         if(result) {
> +           free(newurl);
> +@@ -917,12 +930,12 @@ CURLcode Curl_follow(struct Curl_easy *data,
> +         Curl_safefree(data->state.aptr.passwd);
> +       }
> +     }
> +-  }
> +
> +-  result =3D Curl_reset_proxypwd(data);
> +-  if(result) {
> +-    free(newurl);
> +-    return result;
> ++    result =3D Curl_reset_proxypwd(data);
> ++    if(result) {
> ++      free(newurl);
> ++      return result;
> ++    }
> +   }
> +
> +   if(type =3D=3D FOLLOW_FAKE) {
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index aafd309a9d..f673f86384 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test230=
5 test2306 test2307 \
> + \
> + test2400 test2401 test2402 test2403 test2404 \
> + \
> +-test2500 test2501 test2502 test2503 \
> ++test2500 test2501 test2502 test2503 test2506 \
> + \
> + test2600 test2601 test2602 test2603 \
> + \
> +diff --git a/tests/data/test2506 b/tests/data/test2506
> +new file mode 100644
> +index 0000000000..9c65002496
> +--- /dev/null
> ++++ b/tests/data/test2506
> +@@ -0,0 +1,64 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++<reply>
> ++<data crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 301 redirect
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 3
> ++Location: http://numbertwo.example/%TESTNUMBER0002
> ++
> ++ok
> ++</data>
> ++<data2 crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 4
> ++
> ++yes
> ++</data2>
> ++</reply>
> ++
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<features>
> ++proxy
> ++</features>
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<name>
> ++netrc with redirect using proxy
> ++</name>
> ++<file name=3D"%LOGDIR/netrc2506">
> ++machine site.example login batman password robin
> ++</file>
> ++<command>
> ++http://%HOSTIP:%HTTPPORT http://site.example/ %LOGDIR/netrc2506
> ++</command>
> ++</client>
> ++
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET http://site.example/ HTTP/1.1
> ++Host: site.example
> ++Authorization: Basic %b64[batman:robin]b64%
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://numbertwo.example/25060002 HTTP/1.1
> ++Host: numbertwo.example
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/data/test998 b/tests/data/test998
> +index 0969d4704b..17c0a0e150 100644
> +--- a/tests/data/test998
> ++++ b/tests/data/test998
> +@@ -82,7 +82,6 @@ Proxy-Connection: Keep-Alive
> +=20
> +  GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
> +  Host: somewhere.else.example
> +- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> +  User-Agent: curl/%VERSION
> +  Accept: */*
> +  Proxy-Connection: Keep-Alive
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 9f7cec6027..9d3356aaf5 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -75,7 +75,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmco=
nnect libprereq      \
> +  lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
> +  lib2301 lib2302 lib2304 lib2305 lib2306 \
> +  lib2402 lib2404 \
> +- lib2502 \
> ++ lib2502 lib2506 \
> +  lib3010 lib3025 lib3026 lib3027 \
> +  lib3100 lib3101 lib3102 lib3103
> +
> +@@ -684,6 +684,9 @@ lib2404_LDADD =3D $(TESTUTIL_LIBS)
> + lib2502_SOURCES =3D lib2502.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib2502_LDADD =3D $(TESTUTIL_LIBS)
> +
> ++lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> ++lib2506_LDADD =3D $(TESTUTIL_LIBS)
> ++
> + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib3010_LDADD =3D $(TESTUTIL_LIBS)
> +
> +diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c
> +new file mode 100644
> +index 0000000000..e6dde18507
> +--- /dev/null
> ++++ b/tests/libtest/lib2506.c
> +@@ -0,0 +1,71 @@
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
> ++#include "test.h"
> ++
> ++#include "testtrace.h"
> ++
> ++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *ud)
> ++{
> ++  (void)ptr;
> ++  (void)ud;
> ++  return size * nmemb;
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++  CURL *curl;
> ++  int res =3D CURLE_OUT_OF_MEMORY;
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
> ++  test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);
> ++  test_setopt(curl, CURLOPT_PROXY, URL);
> ++  test_setopt(curl, CURLOPT_URL, libtest_arg2);
> ++  test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);
> ++  test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);
> ++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
> ++  test_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++
> ++  /* CURLOPT_UNRESTRICTED_AUTH should not make a difference because the
> ++     credentials come from netrc */
> ++  test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);
> ++
> ++  res =3D curl_easy_perform(curl);
> ++
> ++test_cleanup:
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++
> ++  return res;
> ++}
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 19f24c3205..882ab67aae 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D " \
>      file://CVE-2026-4873.patch \
>      file://CVE-2026-5545.patch \
>      file://CVE-2026-6253.patch \
> +    file://CVE-2026-6429.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \

Hello Deepak,

I'll have to drop this patch because it is triggering a warning in the
autobuilder's ptest jobs qemuarm64-ptest[1] and qemux86-64-ptest[2].

It causes curl ptests 1159 & 1543 to fail :
	`FAIL: 1159 - HTTP Location: and 'redirect_url' with non-supported scheme`
	`FAIL: 1543 - CURLOPT_CURLU, URL with space and CURLINFO_EFFECTIVE_URL`

I also have to hang the next patch of the series too (curl: fix CVE-2026-71=
68),
because it not applied anymore without this one.

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4320
[2] https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4336

Can you look at it please ?

Regards,
--=20
Fabien Thomas
Smile ECS


