Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D996C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 06:08:46 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v3 5/5] curl: fix CVE-2026-7168
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 23:08:37 -0700
References: <20260804103305.1180770-5-deeratho@cisco.com> <20260824094720.2194782-1-deeratho@cisco.com>
In-Reply-To: <20260824094720.2194782-1-deeratho@cisco.com>
Message-ID: <280546.1788934117186328631@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="v5sT21rK4NFJWrJz3ed8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245405

--v5sT21rK4NFJWrJz3ed8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Can you please review below curl patch?

Regards,
Deepak
On Mon, Aug 24, 2026 at 03:17 PM, Deepak Rathore wrote:

>=20
> From: Deepak Rathore <deeratho@cisco.com>
>=20
> This patch applies the upstream backport for CVE-2026-7168.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>=20
> [1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c=
8594507
>=20
> [2] https://curl.se/docs/CVE-2026-7168.html
>=20
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> Changes in v3:
> - Rebase on top of the revised CVE-2026-6429 patch.
>=20
> Changes from v1 to v2:
> - Rebase the patches on top of the latest Scarthgap branch.
>=20
> .../curl/curl/CVE-2026-7168.patch | 425 ++++++++++++++++++
> meta/recipes-support/curl/curl_8.7.1.bb | 1 +
> 2 files changed, 426 insertions(+)
> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> new file mode 100644
> index 0000000000..0669be6546
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
> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/c1cfdf59=
acbaf9504c4578d4cf56cdd7c8594507
> ]
> +
> +Backport Changes:
> +- The upstream lib/setopt.c hunk reuses Curl_auth_digest_cleanup() from
> the
> + newer tree. curl-8.7.1 does not expose that helper to setopt.c in the
> same
> + way, so this backport adds the vauth/vauth.h include before applying th=
e
>=20
> + upstream setproxy() cleanup logic.
> +- The upstream tree already provides a CURL_DISABLE_DIGEST_AUTH fallback
> for
> + Curl_auth_digest_cleanup(). curl-8.7.1 does not, so this backport adds
> the
> + equivalent no-op macro in lib/vauth/vauth.h.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> + instead of the upstream tests/data/Makefile.am and
> + tests/libtest/Makefile.am lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> + test_lib1588(), libtest_arg4, and CURLcode result handling were adapted
> to
> + test.h, test(), test_argv[4], and int res.
> +- curl-8.7.1 does not define the newer digest test feature in
> runtests.pl.
> + This backport defines the target harness feature as digest-auth,
> matching
> + tests/server/disabled.c, and makes test 1588 require digest-auth.
> +- The curl-8.7.1 server harness does not handle crlf=3D"headers" correct=
ly
> on
> + response data sections for this test, so those attributes were removed
> from
> + the two server response blocks and datacheck. The protocol block keeps
> + crlf=3D"headers" because runtests.pl normalizes protocol verification w=
hen
> any
> + crlf attribute is present.
> +
> +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/setopt.c | 18 ++++-
> + lib/vauth/vauth.h | 2 +
> + tests/data/Makefile.inc | 1 +
> + tests/data/test1588 | 106 ++++++++++++++++++++++++++
> + tests/libtest/Makefile.inc | 5 +-
> + tests/libtest/lib1588.c | 152 +++++++++++++++++++++++++++++++++++++
> + tests/runtests.pl | 2 +
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
> + return CURLE_OK;
> + }
> +
> ++#ifndef CURL_DISABLE_PROXY
> ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
> ++{
> ++ if((data->set.str[STRING_PROXY] && proxy) &&
> ++ /* there was one set, is this a new one? */
> ++ !strcmp(data->set.str[STRING_PROXY], proxy))
> ++ return CURLE_OK; /* same one as before */
> ++
> ++ Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++ memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
> ++ return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
> ++}
> ++#endif
> ++
> + CURLcode Curl_setblobopt(struct curl_blob **blobp,
> + const struct curl_blob *blob)
> + {
> +@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data,
> CURLoption option, va_list param)
> + * Setting it to NULL, means no proxy but allows the environment
> variables
> + * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
> + */
> +- result =3D Curl_setstropt(&data->set.str[STRING_PROXY],
> +- va_arg(param, char *));
> ++ result =3D setproxy(data, va_arg(param, char *));
> + break;
> +
> + case CURLOPT_PRE_PROXY:
> +diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
> +index 9da0540..bf5c7a3 100644
> +--- a/lib/vauth/vauth.h
> ++++ b/lib/vauth/vauth.h
> +@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct
> Curl_easy *data,
> +
> + /* This is used to clean up the digest specific data */
> + void Curl_auth_digest_cleanup(struct digestdata *digest);
> ++#else
> ++#define Curl_auth_digest_cleanup(x)
> + #endif /* !CURL_DISABLE_DIGEST_AUTH */
> +
> + #ifdef USE_GSASL
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index f673f86..461eb37 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -200,6 +200,7 @@ test1540 test1541 test1542 test1543 test1544 test154=
5
> \
> + test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1557
> \
> + test1558 test1559 test1560 test1561 test1562 test1563 test1564 test1565
> \
> + test1566 test1567 test1568 test1569 test1570 \
> ++test1588 \
> + \
> + test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597
> \
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
> ++ http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT
> silly:person custom.set.host.name
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
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm",
> nonce=3D"12345", uri=3D"/path/1588",
> response=3D"d0b2f000c7e3fca24452b5810713404a"
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
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm",
> nonce=3D"12345", uri=3D"/path/1588",
> response=3D"d0b2f000c7e3fca24452b5810713404a"
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
> +@@ -62,7 +62,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry
> libntlmconnect libprereq \
> + lib1540 lib1541 lib1542 lib1543 lib1545 \
> + lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib1557 \
> + lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib1569 \
> +- lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> ++ lib1588 lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> + \
> + lib1662 \
> + \
> +@@ -687,6 +687,9 @@ lib2502_LDADD =3D $(TESTUTIL_LIBS)
> + lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib2506_LDADD =3D $(TESTUTIL_LIBS)
> +
> ++lib1588_SOURCES =3D lib1588.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> ++lib1588_LDADD =3D $(TESTUTIL_LIBS)
> ++
> + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib3010_LDADD =3D $(TESTUTIL_LIBS)
> +
> +diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
> +new file mode 100644
> +index 0000000..00c6b35
> +--- /dev/null
> ++++ b/tests/libtest/lib1588.c
> +@@ -0,0 +1,152 @@
> ++/**********************************************************************=
*****
>=20
> ++ * _ _ ____ _
> ++ * Project ___| | | | _ \| |
> ++ * / __| | | | |_) | |
> ++ * | (__| |_| | _ <| |___
> ++ * \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or
> sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F
> ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++
> *************************************************************************=
**/
>=20
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
> ++ const char *userpwd, const char *proxy)
> ++{
> ++ int res =3D CURLE_OK;
> ++
> ++ res_easy_setopt(curl, CURLOPT_URL, url);
> ++ if(res)
> ++ goto init_failed;
> ++
> ++ res_easy_setopt(curl, CURLOPT_PROXY, proxy);
> ++ if(res)
> ++ goto init_failed;
> ++
> ++ res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
> ++ if(res)
> ++ goto init_failed;
> ++
> ++ res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
> ++ if(res)
> ++ goto init_failed;
> ++
> ++ res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++ if(res)
> ++ goto init_failed;
> ++#if 0
> ++ res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
> ++ if(res)
> ++ goto init_failed;
> ++#endif
> ++
> ++ res_easy_setopt(curl, CURLOPT_HEADER, 1L);
> ++ if(res)
> ++ goto init_failed;
> ++
> ++ return CURLE_OK; /* success */
> ++
> ++init_failed:
> ++ return (CURLcode)res; /* failure */
> ++}
> ++
> ++static CURLcode run1588(CURL *curl, const char *url, const char
> *userpwd,
> ++ const char *proxy)
> ++{
> ++ CURLcode res =3D CURLE_OK;
> ++
> ++ res =3D init1588(curl, url, userpwd, proxy);
> ++ if(res)
> ++ return res;
> ++
> ++ return curl_easy_perform(curl);
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++ int res =3D CURLE_OK;
> ++ CURL *curl =3D NULL;
> ++ const char *proxyuserpws;
> ++ struct curl_slist *host =3D NULL;
> ++ struct curl_slist *host2 =3D NULL;
> ++ char proxy1_resolve[128];
> ++ char proxy2_resolve[128];
> ++ char proxy1_connect[128];
> ++ char proxy2_connect[128];
> ++
> ++ if(test_argc < 5)
> ++ return TEST_ERR_MAJOR_BAD;
> ++ proxyuserpws =3D test_argv[4];
> ++
> ++ curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
> ++ "firstproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++ curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
> ++ "secondproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++
> ++ /* we connect to the fake host name but the right port number */
> ++ curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
> ++ "firstproxy:%s", libtest_arg3);
> ++ curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
> ++ "secondproxy:%s", libtest_arg3);
> ++
> ++ res_global_init(CURL_GLOBAL_ALL);
> ++ if(res)
> ++ return res;
> ++
> ++ curl =3D curl_easy_init();
> ++ if(!curl) {
> ++ curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++ curl_global_cleanup();
> ++ return TEST_ERR_MAJOR_BAD;
> ++ }
> ++
> ++ host =3D curl_slist_append(NULL, proxy1_resolve);
> ++ if(!host)
> ++ goto test_cleanup;
> ++ host2 =3D curl_slist_append(host, proxy2_resolve);
> ++ if(!host2)
> ++ goto test_cleanup;
> ++ host =3D host2;
> ++
> ++ start_test_timing();
> ++
> ++ easy_setopt(curl, CURLOPT_RESOLVE, host);
> ++
> ++ res =3D run1588(curl, URL, proxyuserpws, proxy1_connect);
> ++ if(res)
> ++ goto test_cleanup;
> ++
> ++ curl_mfprintf(stderr, "lib1588: now we do the request again\n");
> ++
> ++ res =3D run1588(curl, URL, proxyuserpws, proxy2_connect);
> ++
> ++test_cleanup:
> ++
> ++ /* proper cleanup sequence - type PB */
> ++
> ++ curl_easy_cleanup(curl);
> ++ curl_global_cleanup();
> ++ curl_slist_free_all(host);
> ++ return res;
> ++}
> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20..b40df55 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> + $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> + # SPNEGO enabled
> + $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++ # Digest auth enabled unless disabled by build
> ++ $feature{"digest-auth"} =3D 1;
> + # CharConv enabled
> + $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> + # TLS-SRP enabled
> +--
> +2.35.6
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb
> b/meta/recipes-support/curl/curl_8.7.1.bb
> index 882ab67aae..6b7f6f6f51 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D " \
> file://CVE-2026-5545.patch \
> file://CVE-2026-6253.patch \
> file://CVE-2026-6429.patch \
> + file://CVE-2026-7168.patch \
> "
>=20
> SRC_URI:append:class-nativesdk =3D " \
> --
> 2.35.6

--v5sT21rK4NFJWrJz3ed8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Can you please review below curl patch?<br /><br =
/>Regards,<br />Deepak</div>
<div>On Mon, Aug 24, 2026 at 03:17 PM, Deepak Rathore wrote:</div>
<div>
<blockquote>From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br /><br />This=
 patch applies the upstream backport for CVE-2026-7168.<br />The upstream f=
ix commit is referenced in [1], and the public<br />CVE advisory is referen=
ced in [2].<br /><br />[1] <a href=3D"https://github.com/curl/curl/commit/c=
1cfdf59acbaf9504c4578d4cf56cdd7c8594507" target=3D"_blank" rel=3D"noopener"=
>https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c85945=
07</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-7168.html" target=
=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-7168.html</a><br=
 /><br />Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br />---<=
br />Changes in v3:<br />- Rebase on top of the revised CVE-2026-6429 patch=
.<br /><br />Changes from v1 to v2:<br />- Rebase the patches on top of the=
 latest Scarthgap branch.<br /><br />.../curl/curl/CVE-2026-7168.patch | 42=
5 ++++++++++++++++++<br />meta/recipes-support/curl/curl_8.7.1.bb | 1 +<br =
/>2 files changed, 426 insertions(+)<br />create mode 100644 meta/recipes-s=
upport/curl/curl/CVE-2026-7168.patch<br /><br />diff --git a/meta/recipes-s=
upport/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2=
026-7168.patch<br />new file mode 100644<br />index 0000000000..0669be6546<=
br />--- /dev/null<br />+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.=
patch<br />@@ -0,0 +1,425 @@<br />+From 0f0bb5efbd1e4f2199eeb98e6c62a7a6724=
2cad2 Mon Sep 17 00:00:00 2001<br />+From: Daniel Stenberg &lt;daniel@haxx.=
se&gt;<br />+Date: Fri, 5 Jun 2026 01:22:37 -0700<br />+Subject: [PATCH] se=
topt: clear proxy auth properties when switching<br />+<br />+Verify with t=
est 1588<br />+<br />+Closes #21453<br />+<br />+CVE: CVE-2026-7168<br />+U=
pstream-Status: Backport [<a href=3D"https://github.com/curl/curl/commit/c1=
cfdf59acbaf9504c4578d4cf56cdd7c8594507" target=3D"_blank" rel=3D"noopener">=
https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c859450=
7</a>]<br />+<br />+Backport Changes:<br />+- The upstream lib/setopt.c hun=
k reuses Curl_auth_digest_cleanup() from the<br />+ newer tree. curl-8.7.1 =
does not expose that helper to setopt.c in the same<br />+ way, so this bac=
kport adds the vauth/vauth.h include before applying the<br />+ upstream se=
tproxy() cleanup logic.<br />+- The upstream tree already provides a CURL_D=
ISABLE_DIGEST_AUTH fallback for<br />+ Curl_auth_digest_cleanup(). curl-8.7=
.1 does not, so this backport adds the<br />+ equivalent no-op macro in lib=
/vauth/vauth.h.<br />+- curl-8.7.1 uses tests/data/Makefile.inc and tests/l=
ibtest/Makefile.inc<br />+ instead of the upstream tests/data/Makefile.am a=
nd<br />+ tests/libtest/Makefile.am lists.<br />+- curl-8.7.1 uses the olde=
r libtest harness, so first.h,<br />+ test_lib1588(), libtest_arg4, and CUR=
Lcode result handling were adapted to<br />+ test.h, test(), test_argv[4], =
and int res.<br />+- curl-8.7.1 does not define the newer digest test featu=
re in runtests.pl.<br />+ This backport defines the target harness feature =
as digest-auth, matching<br />+ tests/server/disabled.c, and makes test 158=
8 require digest-auth.<br />+- The curl-8.7.1 server harness does not handl=
e crlf=3D"headers" correctly on<br />+ response data sections for this test=
, so those attributes were removed from<br />+ the two server response bloc=
ks and datacheck. The protocol block keeps<br />+ crlf=3D"headers" because =
runtests.pl normalizes protocol verification when any<br />+ crlf attribute=
 is present.<br />+<br />+(cherry picked from commit c1cfdf59acbaf9504c4578=
d4cf56cdd7c8594507)<br />+Signed-off-by: Deepak Rathore &lt;deeratho@cisco.=
com&gt;<br />+---<br />+ lib/setopt.c | 18 ++++-<br />+ lib/vauth/vauth.h |=
 2 +<br />+ tests/data/Makefile.inc | 1 +<br />+ tests/data/test1588 | 106 =
++++++++++++++++++++++++++<br />+ tests/libtest/Makefile.inc | 5 +-<br />+ =
tests/libtest/lib1588.c | 152 +++++++++++++++++++++++++++++++++++++<br />+ =
tests/runtests.pl | 2 +<br />+ 7 files changed, 283 insertions(+), 3 deleti=
ons(-)<br />+ create mode 100644 tests/data/test1588<br />+ create mode 100=
644 tests/libtest/lib1588.c<br />+<br />+diff --git a/lib/setopt.c b/lib/se=
topt.c<br />+index 8a5a5d7..7eaf309 100644<br />+--- a/lib/setopt.c<br />++=
++ b/lib/setopt.c<br />+@@ -51,6 +51,7 @@<br />+ #include "altsvc.h"<br />+=
 #include "hsts.h"<br />+ #include "tftp.h"<br />++#include "vauth/vauth.h"=
<br />+ #include "strdup.h"<br />+ /* The last 3 #include files should be i=
n this order */<br />+ #include "curl_printf.h"<br />+@@ -76,6 +77,20 @@ CU=
RLcode Curl_setstropt(char **charp, const char *s)<br />+ return CURLE_OK;<=
br />+ }<br />+ <br />++#ifndef CURL_DISABLE_PROXY<br />++static CURLcode s=
etproxy(struct Curl_easy *data, const char *proxy)<br />++{<br />++ if((dat=
a-&gt;set.str[STRING_PROXY] &amp;&amp; proxy) &amp;&amp;<br />++ /* there w=
as one set, is this a new one? */<br />++ !strcmp(data-&gt;set.str[STRING_P=
ROXY], proxy))<br />++ return CURLE_OK; /* same one as before */<br />++<br=
 />++ Curl_auth_digest_cleanup(&amp;data-&gt;state.proxydigest);<br />++ me=
mset(&amp;data-&gt;state.authproxy, 0, sizeof(data-&gt;state.authproxy));<b=
r />++ return Curl_setstropt(&amp;data-&gt;set.str[STRING_PROXY], proxy);<b=
r />++}<br />++#endif<br />++<br />+ CURLcode Curl_setblobopt(struct curl_b=
lob **blobp,<br />+ const struct curl_blob *blob)<br />+ {<br />+@@ -1139,8=
 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option=
, va_list param)<br />+ * Setting it to NULL, means no proxy but allows the=
 environment variables<br />+ * to decide for us (if CURLOPT_SOCKS_PROXY se=
tting it to NULL).<br />+ */<br />+- result =3D Curl_setstropt(&amp;data-&g=
t;set.str[STRING_PROXY],<br />+- va_arg(param, char *));<br />++ result =3D=
 setproxy(data, va_arg(param, char *));<br />+ break;<br />+ <br />+ case C=
URLOPT_PRE_PROXY:<br />+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h<=
br />+index 9da0540..bf5c7a3 100644<br />+--- a/lib/vauth/vauth.h<br />++++=
 b/lib/vauth/vauth.h<br />+@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_di=
gest_http_message(struct Curl_easy *data,<br />+ <br />+ /* This is used to=
 clean up the digest specific data */<br />+ void Curl_auth_digest_cleanup(=
struct digestdata *digest);<br />++#else<br />++#define Curl_auth_digest_cl=
eanup(x)<br />+ #endif /* !CURL_DISABLE_DIGEST_AUTH */<br />+ <br />+ #ifde=
f USE_GSASL<br />+diff --git a/tests/data/Makefile.inc b/tests/data/Makefil=
e.inc<br />+index f673f86..461eb37 100644<br />+--- a/tests/data/Makefile.i=
nc<br />++++ b/tests/data/Makefile.inc<br />+@@ -200,6 +200,7 @@ test1540 t=
est1541 test1542 test1543 test1544 test1545 \<br />+ test1550 test1551 test=
1552 test1553 test1554 test1555 test1556 test1557 \<br />+ test1558 test155=
9 test1560 test1561 test1562 test1563 test1564 test1565 \<br />+ test1566 t=
est1567 test1568 test1569 test1570 \<br />++test1588 \<br />+ \<br />+ test=
1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597 \<br />=
+ test1598 \<br />+diff --git a/tests/data/test1588 b/tests/data/test1588<b=
r />+new file mode 100644<br />+index 0000000..8a3bf81<br />+--- /dev/null<=
br />++++ b/tests/data/test1588<br />+@@ -0,0 +1,106 @@<br />++&lt;?xml ver=
sion=3D"1.0" encoding=3D"US-ASCII"?&gt;<br />++&lt;testcase&gt;<br />++&lt;=
info&gt;<br />++&lt;keywords&gt;<br />++HTTP<br />++HTTP GET<br />++HTTP pr=
oxy<br />++HTTP proxy Digest auth<br />++multi<br />++&lt;/keywords&gt;<br =
/>++&lt;/info&gt;<br />++<br />++# Server-side<br />++&lt;reply&gt;<br />++=
<br />++# this is returned first since we get no proxy-auth<br />++&lt;data=
&gt;<br />++HTTP/1.1 407 Authorization Required to proxy me my dear<br />++=
Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"<br />++Co=
ntent-Length: 33<br />++<br />++And you should ignore this data.<br />++&lt=
;/data&gt;<br />++<br />++# then this is returned when we get proxy-auth<br=
 />++&lt;data1000&gt;<br />++HTTP/1.1 200 OK<br />++Content-Length: 21<br /=
>++Server: no<br />++<br />++Nice proxy auth sir!<br />++&lt;/data1000&gt;<=
br />++<br />++&lt;datacheck&gt;<br />++HTTP/1.1 407 Authorization Required=
 to proxy me my dear<br />++Proxy-Authenticate: Digest realm=3D"weirdorealm=
", nonce=3D"12345"<br />++Content-Length: 33<br />++<br />++HTTP/1.1 200 OK=
<br />++Content-Length: 21<br />++Server: no<br />++<br />++Nice proxy auth=
 sir!<br />++HTTP/1.1 407 Authorization Required to proxy me my dear<br />+=
+Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"<br />++C=
ontent-Length: 33<br />++<br />++HTTP/1.1 200 OK<br />++Content-Length: 21<=
br />++Server: no<br />++<br />++Nice proxy auth sir!<br />++&lt;/datacheck=
&gt;<br />++&lt;/reply&gt;<br />++<br />++# Client-side<br />++&lt;client&g=
t;<br />++&lt;server&gt;<br />++http<br />++&lt;/server&gt;<br />++# tool i=
s what to use instead of 'curl'<br />++&lt;tool&gt;<br />++lib%TESTNUMBER<b=
r />++&lt;/tool&gt;<br />++&lt;features&gt;<br />++!SSPI<br />++crypto<br /=
>++proxy<br />++digest-auth<br />++&lt;/features&gt;<br />++&lt;name&gt;<br=
 />++HTTP proxy auth Digest, then change proxy and do it again<br />++&lt;/=
name&gt;<br />++&lt;command&gt;<br />++<a href=3D"http://test.remote.exampl=
e.com/path/%TESTNUMBER" target=3D"_blank" rel=3D"noopener">http://test.remo=
te.example.com/path/%TESTNUMBER</a> %HOSTIP %HTTPPORT silly:person custom.s=
et.host.name<br />++&lt;/command&gt;<br />++&lt;/client&gt;<br />++<br />++=
# Verify data after the test has been "shot"<br />++&lt;verify&gt;<br />++&=
lt;protocol crlf=3D"headers"&gt;<br />++GET <a href=3D"http://test.remote.e=
xample.com/path/1588" target=3D"_blank" rel=3D"noopener">http://test.remote=
.example.com/path/1588</a> HTTP/1.1<br />++Host: test.remote.example.com<br=
 />++Accept: */*<br />++Proxy-Connection: Keep-Alive<br />++<br />++GET <a =
href=3D"http://test.remote.example.com/path/1588" target=3D"_blank" rel=3D"=
noopener">http://test.remote.example.com/path/1588</a> HTTP/1.1<br />++Host=
: test.remote.example.com<br />++Proxy-Authorization: Digest username=3D"si=
lly", realm=3D"weirdorealm", nonce=3D"12345", uri=3D"/path/1588", response=
=3D"d0b2f000c7e3fca24452b5810713404a"<br />++Accept: */*<br />++Proxy-Conne=
ction: Keep-Alive<br />++<br />++GET <a href=3D"http://test.remote.example.=
com/path/1588" target=3D"_blank" rel=3D"noopener">http://test.remote.exampl=
e.com/path/1588</a> HTTP/1.1<br />++Host: test.remote.example.com<br />++Ac=
cept: */*<br />++Proxy-Connection: Keep-Alive<br />++<br />++GET <a href=3D=
"http://test.remote.example.com/path/1588" target=3D"_blank" rel=3D"noopene=
r">http://test.remote.example.com/path/1588</a> HTTP/1.1<br />++Host: test.=
remote.example.com<br />++Proxy-Authorization: Digest username=3D"silly", r=
ealm=3D"weirdorealm", nonce=3D"12345", uri=3D"/path/1588", response=3D"d0b2=
f000c7e3fca24452b5810713404a"<br />++Accept: */*<br />++Proxy-Connection: K=
eep-Alive<br />++<br />++&lt;/protocol&gt;<br />++&lt;/verify&gt;<br />++&l=
t;/testcase&gt;<br />+diff --git a/tests/libtest/Makefile.inc b/tests/libte=
st/Makefile.inc<br />+index 9d3356a..4c42d34 100644<br />+--- a/tests/libte=
st/Makefile.inc<br />++++ b/tests/libtest/Makefile.inc<br />+@@ -62,7 +62,7=
 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmconnect libprereq \=
<br />+ lib1540 lib1541 lib1542 lib1543 lib1545 \<br />+ lib1550 lib1551 li=
b1552 lib1553 lib1554 lib1555 lib1556 lib1557 \<br />+ lib1558 lib1559 lib1=
560 lib1564 lib1565 lib1567 lib1568 lib1569 \<br />+- lib1591 lib1592 lib15=
93 lib1594 lib1596 lib1597 lib1598 \<br />++ lib1588 lib1591 lib1592 lib159=
3 lib1594 lib1596 lib1597 lib1598 \<br />+ \<br />+ lib1662 \<br />+ \<br /=
>+@@ -687,6 +687,9 @@ lib2502_LDADD =3D $(TESTUTIL_LIBS)<br />+ lib2506_SOU=
RCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)<br />+ lib2506_L=
DADD =3D $(TESTUTIL_LIBS)<br />+ <br />++lib1588_SOURCES =3D lib1588.c $(SU=
PPORTFILES) $(TESTUTIL) $(WARNLESS)<br />++lib1588_LDADD =3D $(TESTUTIL_LIB=
S)<br />++<br />+ lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL)=
 $(WARNLESS)<br />+ lib3010_LDADD =3D $(TESTUTIL_LIBS)<br />+ <br />+diff -=
-git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c<br />+new file mod=
e 100644<br />+index 0000000..00c6b35<br />+--- /dev/null<br />++++ b/tests=
/libtest/lib1588.c<br />+@@ -0,0 +1,152 @@<br />++/************************=
***************************************************<br />++ * _ _ ____ _<br=
 />++ * Project ___| | | | _ \| |<br />++ * / __| | | | |_) | |<br />++ * |=
 (__| |_| | _ &lt;| |___<br />++ * \___|\___/|_| \_\_____|<br />++ *<br />+=
+ * Copyright (C) Daniel Stenberg, &lt;daniel@haxx.se&gt;, et al.<br />++ *=
<br />++ * This software is licensed as described in the file COPYING, whic=
h<br />++ * you should have received as part of this distribution. The term=
s<br />++ * are also available at <a href=3D"https://curl.se/docs/copyright=
.html" target=3D"_blank" rel=3D"noopener">https://curl.se/docs/copyright.ht=
ml</a>.<br />++ *<br />++ * You may opt to use, copy, modify, merge, publis=
h, distribute and/or sell<br />++ * copies of the Software, and permit pers=
ons to whom the Software is<br />++ * furnished to do so, under the terms o=
f the COPYING file.<br />++ *<br />++ * This software is distributed on an =
"AS IS" basis, WITHOUT WARRANTY OF ANY<br />++ * KIND, either express or im=
plied.<br />++ *<br />++ * SPDX-License-Identifier: curl<br />++ *<br />++ =
***************************************************************************=
/<br />++/*<br />++ * argv1 =3D URL<br />++ * argv2 =3D proxy host<br />++ =
* argv3 =3D proxy port<br />++ * argv4 =3D proxyuser:password<br />++ */<br=
 />++<br />++#include "test.h"<br />++#include "testutil.h"<br />++<br />++=
static CURLcode init1588(CURL *curl, const char *url,<br />++ const char *u=
serpwd, const char *proxy)<br />++{<br />++ int res =3D CURLE_OK;<br />++<b=
r />++ res_easy_setopt(curl, CURLOPT_URL, url);<br />++ if(res)<br />++ got=
o init_failed;<br />++<br />++ res_easy_setopt(curl, CURLOPT_PROXY, proxy);=
<br />++ if(res)<br />++ goto init_failed;<br />++<br />++ res_easy_setopt(=
curl, CURLOPT_PROXYUSERPWD, userpwd);<br />++ if(res)<br />++ goto init_fai=
led;<br />++<br />++ res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGE=
ST);<br />++ if(res)<br />++ goto init_failed;<br />++<br />++ res_easy_set=
opt(curl, CURLOPT_VERBOSE, 1L);<br />++ if(res)<br />++ goto init_failed;<b=
r />++#if 0<br />++ res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);<br =
/>++ if(res)<br />++ goto init_failed;<br />++#endif<br />++<br />++ res_ea=
sy_setopt(curl, CURLOPT_HEADER, 1L);<br />++ if(res)<br />++ goto init_fail=
ed;<br />++<br />++ return CURLE_OK; /* success */<br />++<br />++init_fail=
ed:<br />++ return (CURLcode)res; /* failure */<br />++}<br />++<br />++sta=
tic CURLcode run1588(CURL *curl, const char *url, const char *userpwd,<br /=
>++ const char *proxy)<br />++{<br />++ CURLcode res =3D CURLE_OK;<br />++<=
br />++ res =3D init1588(curl, url, userpwd, proxy);<br />++ if(res)<br />+=
+ return res;<br />++<br />++ return curl_easy_perform(curl);<br />++}<br /=
>++<br />++int test(char *URL)<br />++{<br />++ int res =3D CURLE_OK;<br />=
++ CURL *curl =3D NULL;<br />++ const char *proxyuserpws;<br />++ struct cu=
rl_slist *host =3D NULL;<br />++ struct curl_slist *host2 =3D NULL;<br />++=
 char proxy1_resolve[128];<br />++ char proxy2_resolve[128];<br />++ char p=
roxy1_connect[128];<br />++ char proxy2_connect[128];<br />++<br />++ if(te=
st_argc &lt; 5)<br />++ return TEST_ERR_MAJOR_BAD;<br />++ proxyuserpws =3D=
 test_argv[4];<br />++<br />++ curl_msnprintf(proxy1_resolve, sizeof(proxy1=
_resolve),<br />++ "firstproxy:%s:%s", libtest_arg3, libtest_arg2);<br />++=
 curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),<br />++ "secondprox=
y:%s:%s", libtest_arg3, libtest_arg2);<br />++<br />++ /* we connect to the=
 fake host name but the right port number */<br />++ curl_msnprintf(proxy1_=
connect, sizeof(proxy1_connect),<br />++ "firstproxy:%s", libtest_arg3);<br=
 />++ curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),<br />++ "secon=
dproxy:%s", libtest_arg3);<br />++<br />++ res_global_init(CURL_GLOBAL_ALL)=
;<br />++ if(res)<br />++ return res;<br />++<br />++ curl =3D curl_easy_in=
it();<br />++ if(!curl) {<br />++ curl_mfprintf(stderr, "curl_easy_init() f=
ailed\n");<br />++ curl_global_cleanup();<br />++ return TEST_ERR_MAJOR_BAD=
;<br />++ }<br />++<br />++ host =3D curl_slist_append(NULL, proxy1_resolve=
);<br />++ if(!host)<br />++ goto test_cleanup;<br />++ host2 =3D curl_slis=
t_append(host, proxy2_resolve);<br />++ if(!host2)<br />++ goto test_cleanu=
p;<br />++ host =3D host2;<br />++<br />++ start_test_timing();<br />++<br =
/>++ easy_setopt(curl, CURLOPT_RESOLVE, host);<br />++<br />++ res =3D run1=
588(curl, URL, proxyuserpws, proxy1_connect);<br />++ if(res)<br />++ goto =
test_cleanup;<br />++<br />++ curl_mfprintf(stderr, "lib1588: now we do the=
 request again\n");<br />++<br />++ res =3D run1588(curl, URL, proxyuserpws=
, proxy2_connect);<br />++<br />++test_cleanup:<br />++<br />++ /* proper c=
leanup sequence - type PB */<br />++<br />++ curl_easy_cleanup(curl);<br />=
++ curl_global_cleanup();<br />++ curl_slist_free_all(host);<br />++ return=
 res;<br />++}<br />+diff --git a/tests/runtests.pl b/tests/runtests.pl<br =
/>+index ddfab20..b40df55 100755<br />+--- a/tests/runtests.pl<br />++++ b/=
tests/runtests.pl<br />+@@ -637,6 +637,8 @@ sub checksystemfeatures {<br />=
+ $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;<br />+ # SPNEGO enabled<=
br />+ $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;<br />++ # Digest auth e=
nabled unless disabled by build<br />++ $feature{"digest-auth"} =3D 1;<br /=
>+ # CharConv enabled<br />+ $feature{"CharConv"} =3D $feat =3D~ /CharConv/=
i;<br />+ # TLS-SRP enabled<br />+--<br />+2.35.6<br />diff --git a/meta/re=
cipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb<=
br />index 882ab67aae..6b7f6f6f51 100644<br />--- a/meta/recipes-support/cu=
rl/curl_8.7.1.bb<br />+++ b/meta/recipes-support/curl/curl_8.7.1.bb<br />@@=
 -42,6 +42,7 @@ SRC_URI =3D " \<br />file://CVE-2026-5545.patch \<br />file=
://CVE-2026-6253.patch \<br />file://CVE-2026-6429.patch \<br />+ file://CV=
E-2026-7168.patch \<br />"<br /><br />SRC_URI:append:class-nativesdk =3D " =
\<br />-- <br />2.35.6</blockquote>
</div>

--v5sT21rK4NFJWrJz3ed8--

