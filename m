Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56454C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 06:07:46 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v3 4/5] curl: fix CVE-2026-6429
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 23:07:44 -0700
References: <20260804103305.1180770-4-deeratho@cisco.com> <20260824094620.2189899-1-deeratho@cisco.com>
In-Reply-To: <20260824094620.2189899-1-deeratho@cisco.com>
Message-ID: <280196.1788934064753767175@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="h6y4zvu9rnWRZK9XfMMN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245404

--h6y4zvu9rnWRZK9XfMMN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Can you please review below curl patch?

Regards,
Deepak
On Mon, Aug 24, 2026 at 03:16 PM, Deepak Rathore wrote:

>=20
> From: Deepak Rathore <deeratho@cisco.com>
>=20
> This patch applies the upstream backport for CVE-2026-6429.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>=20
> [1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f19=
9ace306
>=20
> [2] https://curl.se/docs/CVE-2026-6429.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429
>=20
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> Changes in v3:
> - Preserve URL parsing semantics for URLs containing spaces.
> - Treat unsupported redirect schemes as a different origin.
> - Restore the truncated lib2506 cleanup and return path.
> - Correct embedded patch hunk counts and statistics.
>=20
> .../curl/curl/CVE-2026-6429.patch | 376 ++++++++++++++++++
> meta/recipes-support/curl/curl_8.7.1.bb | 1 +
> 2 files changed, 377 insertions(+)
> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> new file mode 100644
> index 0000000000..5f99318c8a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> @@ -0,0 +1,376 @@
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
> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/b4024bf8=
08bd558026fdc6096e8457f199ace306
> ]
> +
> +Backport Changes:
> +- The upstream lib/http.c hunk adds the same-origin credential clearing
> to
> + Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirect
> + handler and carries the equivalent redirect logic in lib/transfer.c via
> + Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
> +- The inline same-origin comparison preserves upstream URL parsing
> semantics:
> + the previous URL is encoded while allowing spaces, and scheme/host are
> + compared before resolving default ports so unsupported redirect schemes
> + are treated as a different origin rather than as a fatal parsing error.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> + instead of the upstream tests/data/Makefile.am and
> + tests/libtest/Makefile.am lists.
> +- curl-8.7.1 does not contain test2504/lib2504, so the new
> + test2506/lib2506 entries were registered after the nearest existing
> + test2503/lib2502 entries in the target-version test lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> + test_lib2506(), and CURLcode result handling were adapted to test.h,
> + test(), and int res.
> +- Scarthgap curl-8.7.1 keeps the same incorrect redirected-request
> + Authorization expectation in tests/data/test998, so this backport
> removes
> + that expectation with an equivalent target-version hunk.
> +
> +(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/transfer.c | 108 ++++++++++++++++++++++++++------------------
> + tests/data/Makefile.inc | 2 +-
> + tests/data/test2506 | 64 +++++++++++++++++++++++
> + tests/data/test998 | 1 -
> + tests/libtest/Makefile.inc | 5 +-
> + tests/libtest/lib2506.c | 71 +++++++++++++++++++++++++++++
> + 6 files changed, 203 insertions(+), 48 deletions(-)
> + create mode 100644 tests/data/test2506
> + create mode 100644 tests/libtest/lib2506.c
> +
> +diff --git a/lib/transfer.c b/lib/transfer.c
> +index a73462928d..0f5bd8ce59 100644
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -865,49 +865,67 @@ CURLcode Curl_follow(struct Curl_easy *data,
> + if(uc)
> + return Curl_uc_to_curlcode(uc);
> +
> +- /* Clear auth if this redirects to a different port number or protocol=
,
>=20
> +- unless permitted */
> +- if(!data->set.allow_auth_to_other_hosts && (type !=3D FOLLOW_FAKE)) {
> +- char *portnum;
> +- int port;
> +- bool clear =3D FALSE;
> +-
> +- if(data->set.use_port && data->state.allow_port)
> +- /* a custom port is used */
> +- port =3D (int)data->set.use_port;
> +- else {
> +- uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
> +- CURLU_DEFAULT_PORT);
> +- if(uc) {
> +- free(newurl);
> +- return Curl_uc_to_curlcode(uc);
> +- }
> +- port =3D atoi(portnum);
> +- free(portnum);
> +- }
> +- if(port !=3D data->info.conn_remote_port) {
> +- infof(data, "Clear auth, redirects to port from %u to %u",
> +- data->info.conn_remote_port, port);
> +- clear =3D TRUE;
> ++ {
> ++ bool same_origin =3D FALSE;
> ++ CURLU *u;
> ++ char *oldscheme =3D NULL;
> ++ char *oldhost =3D NULL;
> ++ char *oldport =3D NULL;
> ++ char *newscheme =3D NULL;
> ++ char *newhost =3D NULL;
> ++ char *newport =3D NULL;
> ++
> ++ u =3D curl_url();
> ++ if(!u) {
> ++ free(newurl);
> ++ return CURLE_OUT_OF_MEMORY;
> + }
> +- else {
> +- char *scheme;
> +- const struct Curl_handler *p;
> +- uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
> +- if(uc) {
> +- free(newurl);
> +- return Curl_uc_to_curlcode(uc);
> +- }
> +
> +- p =3D Curl_get_scheme_handler(scheme);
> +- if(p && (p->protocol !=3D data->info.conn_protocol)) {
> +- infof(data, "Clear auth, redirects scheme from %s to %s",
> +- data->info.conn_scheme, scheme);
> +- clear =3D TRUE;
> +- }
> +- free(scheme);
> ++ uc =3D curl_url_set(u, CURLUPART_URL, data->state.url,
> ++ CURLU_URLENCODE | CURLU_ALLOW_SPACE);
> ++ if(!uc)
> ++ uc =3D curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
> ++ if(!uc)
> ++ uc =3D curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
> ++ if(!uc)
> ++ uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &newscheme, 0);
> ++ if(!uc)
> ++ uc =3D curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0);
> ++ if(!uc) {
> ++ same_origin =3D strcasecompare(oldscheme, newscheme) &&
> ++ strcasecompare(oldhost, newhost);
> ++ if(same_origin) {
> ++ uc =3D curl_url_get(u, CURLUPART_PORT, &oldport,
> ++ CURLU_DEFAULT_PORT);
> ++ if(!uc)
> ++ uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
> ++ CURLU_DEFAULT_PORT);
> ++ if(!uc)
> ++ same_origin =3D !strcmp(oldport, newport);
> ++ }
> ++ }
> ++ if(uc) {
> ++ curl_url_cleanup(u);
> ++ free(oldscheme);
> ++ free(oldhost);
> ++ free(oldport);
> ++ free(newscheme);
> ++ free(newhost);
> ++ free(newport);
> ++ free(newurl);
> ++ return Curl_uc_to_curlcode(uc);
> + }
> +- if(clear) {
> ++
> ++ curl_url_cleanup(u);
> ++ free(oldscheme);
> ++ free(oldhost);
> ++ free(oldport);
> ++ free(newscheme);
> ++ free(newhost);
> ++ free(newport);
> ++
> ++ if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
> ++ !data->set.str[STRING_USERNAME]) {
> + result =3D Curl_reset_userpwd(data);
> + if(result) {
> + free(newurl);
> +@@ -917,12 +935,12 @@ CURLcode Curl_follow(struct Curl_easy *data,
> + Curl_safefree(data->state.aptr.passwd);
> + }
> + }
> +- }
> +
> +- result =3D Curl_reset_proxypwd(data);
> +- if(result) {
> +- free(newurl);
> +- return result;
> ++ result =3D Curl_reset_proxypwd(data);
> ++ if(result) {
> ++ free(newurl);
> ++ return result;
> ++ }
> + }
> +
> + if(type =3D=3D FOLLOW_FAKE) {
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index aafd309a9d..f673f86384 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test230=
5
> test2306 test2307 \
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
> +
> + GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
> + Host: somewhere.else.example
> +- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> + User-Agent: curl/%VERSION
> + Accept: */*
> + Proxy-Connection: Keep-Alive
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 9f7cec6027..9d3356aaf5 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -75,7 +75,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry
> libntlmconnect libprereq \
> + lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
> + lib2301 lib2302 lib2304 lib2305 lib2306 \
> + lib2402 lib2404 \
> +- lib2502 \
> ++ lib2502 lib2506 \
> + lib3010 lib3025 lib3026 lib3027 \
> + lib3100 lib3101 lib3102 lib3103
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
>=20
> ++ * _ _ ____ _
> ++ * Project ___| | | | _ \| |
> ++ * / __| | | | |_) | |
> ++ * | (__| |_| | _ <| |___
> ++ * \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
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
> ++#include "test.h"
> ++
> ++#include "testtrace.h"
> ++
> ++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *ud)
> ++{
> ++ (void)ptr;
> ++ (void)ud;
> ++ return size * nmemb;
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++ CURL *curl;
> ++ int res =3D CURLE_OUT_OF_MEMORY;
> ++
> ++ if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
> ++ curl_mfprintf(stderr, "curl_global_init() failed\n");
> ++ return TEST_ERR_MAJOR_BAD;
> ++ }
> ++
> ++ curl =3D curl_easy_init();
> ++ if(!curl) {
> ++ curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++ curl_global_cleanup();
> ++ return TEST_ERR_MAJOR_BAD;
> ++ }
> ++
> ++ test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);
> ++ test_setopt(curl, CURLOPT_PROXY, URL);
> ++ test_setopt(curl, CURLOPT_URL, libtest_arg2);
> ++ test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);
> ++ test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);
> ++ test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
> ++ test_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++
> ++ /* CURLOPT_UNRESTRICTED_AUTH should not make a difference because the
> ++ credentials come from netrc */
> ++ test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);
> ++
> ++ res =3D curl_easy_perform(curl);
> ++
> ++test_cleanup:
> ++ curl_easy_cleanup(curl);
> ++ curl_global_cleanup();
> ++
> ++ return res;
> ++}
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb
> b/meta/recipes-support/curl/curl_8.7.1.bb
> index 781b37c5ad..4f828ffd79 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D " \
> file://CVE-2026-4873.patch \
> file://CVE-2026-5545.patch \
> file://CVE-2026-6253.patch \
> + file://CVE-2026-6429.patch \
> "
>=20
> SRC_URI:append:class-nativesdk =3D " \
> --
> 2.35.6

--h6y4zvu9rnWRZK9XfMMN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,</div>
<div>&nbsp;</div>
<div>Can you please review below curl patch?</div>
<div>&nbsp;</div>
<div>Regards,<br />Deepak</div>
<div>On Mon, Aug 24, 2026 at 03:16 PM, Deepak Rathore wrote:</div>
<div>
<blockquote>From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br /><br />This=
 patch applies the upstream backport for CVE-2026-6429.<br />The upstream f=
ix commit is referenced in [1], and the public<br />CVE advisory is referen=
ced in [2].<br /><br />[1] <a href=3D"https://github.com/curl/curl/commit/b=
4024bf808bd558026fdc6096e8457f199ace306" target=3D"_blank" rel=3D"noopener"=
>https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace3=
06</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-6429.html" target=
=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-6429.html</a><br=
 />[3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-6429" target=3D=
"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/CVE-2026-6429</a=
><br /><br />Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br />=
---<br />Changes in v3:<br />- Preserve URL parsing semantics for URLs cont=
aining spaces.<br />- Treat unsupported redirect schemes as a different ori=
gin.<br />- Restore the truncated lib2506 cleanup and return path.<br />- C=
orrect embedded patch hunk counts and statistics.<br /><br />.../curl/curl/=
CVE-2026-6429.patch | 376 ++++++++++++++++++<br />meta/recipes-support/curl=
/curl_8.7.1.bb | 1 +<br />2 files changed, 377 insertions(+)<br />create mo=
de 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch<br /><br />dif=
f --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes=
-support/curl/curl/CVE-2026-6429.patch<br />new file mode 100644<br />index=
 0000000000..5f99318c8a<br />--- /dev/null<br />+++ b/meta/recipes-support/=
curl/curl/CVE-2026-6429.patch<br />@@ -0,0 +1,376 @@<br />+From 8191fd6d567=
7c30579c09a8d0988b47bbf33f65f Mon Sep 17 00:00:00 2001<br />+From: Daniel S=
tenberg &lt;daniel@haxx.se&gt;<br />+Date: Fri, 5 Jun 2026 01:20:50 -0700<b=
r />+Subject: [PATCH] http: clear credentials better on redirect<br />+<br =
/>+Verify with test 2506: netrc with redirect using proxy<br />+<br />+Upda=
ted test 998 which was wrong.<br />+<br />+Reported-by: Muhamad Arga Reksap=
ati<br />+<br />+Closes #21345<br />+<br />+CVE: CVE-2026-6429<br />+Upstre=
am-Status: Backport [<a href=3D"https://github.com/curl/curl/commit/b4024bf=
808bd558026fdc6096e8457f199ace306" target=3D"_blank" rel=3D"noopener">https=
://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306</a>=
]<br />+<br />+Backport Changes:<br />+- The upstream lib/http.c hunk adds =
the same-origin credential clearing to<br />+ Curl_http_follow(). curl-8.7.=
1 predates that protocol-specific redirect<br />+ handler and carries the e=
quivalent redirect logic in lib/transfer.c via<br />+ Curl_follow(), so the=
 full upstream lib/http.c hunk was adapted there.<br />+- The inline same-o=
rigin comparison preserves upstream URL parsing semantics:<br />+ the previ=
ous URL is encoded while allowing spaces, and scheme/host are<br />+ compar=
ed before resolving default ports so unsupported redirect schemes<br />+ ar=
e treated as a different origin rather than as a fatal parsing error.<br />=
+- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc<b=
r />+ instead of the upstream tests/data/Makefile.am and<br />+ tests/libte=
st/Makefile.am lists.<br />+- curl-8.7.1 does not contain test2504/lib2504,=
 so the new<br />+ test2506/lib2506 entries were registered after the neare=
st existing<br />+ test2503/lib2502 entries in the target-version test list=
s.<br />+- curl-8.7.1 uses the older libtest harness, so first.h,<br />+ te=
st_lib2506(), and CURLcode result handling were adapted to test.h,<br />+ t=
est(), and int res.<br />+- Scarthgap curl-8.7.1 keeps the same incorrect r=
edirected-request<br />+ Authorization expectation in tests/data/test998, s=
o this backport removes<br />+ that expectation with an equivalent target-v=
ersion hunk.<br />+<br />+(cherry picked from commit b4024bf808bd558026fdc6=
096e8457f199ace306)<br />+Signed-off-by: Deepak Rathore &lt;deeratho@cisco.=
com&gt;<br />+---<br />+ lib/transfer.c | 108 ++++++++++++++++++++++++++---=
---------------<br />+ tests/data/Makefile.inc | 2 +-<br />+ tests/data/tes=
t2506 | 64 +++++++++++++++++++++++<br />+ tests/data/test998 | 1 -<br />+ t=
ests/libtest/Makefile.inc | 5 +-<br />+ tests/libtest/lib2506.c | 71 ++++++=
+++++++++++++++++++++++<br />+ 6 files changed, 203 insertions(+), 48 delet=
ions(-)<br />+ create mode 100644 tests/data/test2506<br />+ create mode 10=
0644 tests/libtest/lib2506.c<br />+<br />+diff --git a/lib/transfer.c b/lib=
/transfer.c<br />+index a73462928d..0f5bd8ce59 100644<br />+--- a/lib/trans=
fer.c<br />++++ b/lib/transfer.c<br />+@@ -865,49 +865,67 @@ CURLcode Curl_=
follow(struct Curl_easy *data,<br />+ if(uc)<br />+ return Curl_uc_to_curlc=
ode(uc);<br />+ <br />+- /* Clear auth if this redirects to a different por=
t number or protocol,<br />+- unless permitted */<br />+- if(!data-&gt;set.=
allow_auth_to_other_hosts &amp;&amp; (type !=3D FOLLOW_FAKE)) {<br />+- cha=
r *portnum;<br />+- int port;<br />+- bool clear =3D FALSE;<br />+-<br />+-=
 if(data-&gt;set.use_port &amp;&amp; data-&gt;state.allow_port)<br />+- /* =
a custom port is used */<br />+- port =3D (int)data-&gt;set.use_port;<br />=
+- else {<br />+- uc =3D curl_url_get(data-&gt;state.uh, CURLUPART_PORT, &a=
mp;portnum,<br />+- CURLU_DEFAULT_PORT);<br />+- if(uc) {<br />+- free(newu=
rl);<br />+- return Curl_uc_to_curlcode(uc);<br />+- }<br />+- port =3D ato=
i(portnum);<br />+- free(portnum);<br />+- }<br />+- if(port !=3D data-&gt;=
info.conn_remote_port) {<br />+- infof(data, "Clear auth, redirects to port=
 from %u to %u",<br />+- data-&gt;info.conn_remote_port, port);<br />+- cle=
ar =3D TRUE;<br />++ {<br />++ bool same_origin =3D FALSE;<br />++ CURLU *u=
;<br />++ char *oldscheme =3D NULL;<br />++ char *oldhost =3D NULL;<br />++=
 char *oldport =3D NULL;<br />++ char *newscheme =3D NULL;<br />++ char *ne=
whost =3D NULL;<br />++ char *newport =3D NULL;<br />++<br />++ u =3D curl_=
url();<br />++ if(!u) {<br />++ free(newurl);<br />++ return CURLE_OUT_OF_M=
EMORY;<br />+ }<br />+- else {<br />+- char *scheme;<br />+- const struct C=
url_handler *p;<br />+- uc =3D curl_url_get(data-&gt;state.uh, CURLUPART_SC=
HEME, &amp;scheme, 0);<br />+- if(uc) {<br />+- free(newurl);<br />+- retur=
n Curl_uc_to_curlcode(uc);<br />+- }<br />+ <br />+- p =3D Curl_get_scheme_=
handler(scheme);<br />+- if(p &amp;&amp; (p-&gt;protocol !=3D data-&gt;info=
.conn_protocol)) {<br />+- infof(data, "Clear auth, redirects scheme from %=
s to %s",<br />+- data-&gt;info.conn_scheme, scheme);<br />+- clear =3D TRU=
E;<br />+- }<br />+- free(scheme);<br />++ uc =3D curl_url_set(u, CURLUPART=
_URL, data-&gt;state.url,<br />++ CURLU_URLENCODE | CURLU_ALLOW_SPACE);<br =
/>++ if(!uc)<br />++ uc =3D curl_url_get(u, CURLUPART_SCHEME, &amp;oldschem=
e, 0);<br />++ if(!uc)<br />++ uc =3D curl_url_get(u, CURLUPART_HOST, &amp;=
oldhost, 0);<br />++ if(!uc)<br />++ uc =3D curl_url_get(data-&gt;state.uh,=
 CURLUPART_SCHEME, &amp;newscheme, 0);<br />++ if(!uc)<br />++ uc =3D curl_=
url_get(data-&gt;state.uh, CURLUPART_HOST, &amp;newhost, 0);<br />++ if(!uc=
) {<br />++ same_origin =3D strcasecompare(oldscheme, newscheme) &amp;&amp;=
<br />++ strcasecompare(oldhost, newhost);<br />++ if(same_origin) {<br />+=
+ uc =3D curl_url_get(u, CURLUPART_PORT, &amp;oldport,<br />++ CURLU_DEFAUL=
T_PORT);<br />++ if(!uc)<br />++ uc =3D curl_url_get(data-&gt;state.uh, CUR=
LUPART_PORT, &amp;newport,<br />++ CURLU_DEFAULT_PORT);<br />++ if(!uc)<br =
/>++ same_origin =3D !strcmp(oldport, newport);<br />++ }<br />++ }<br />++=
 if(uc) {<br />++ curl_url_cleanup(u);<br />++ free(oldscheme);<br />++ fre=
e(oldhost);<br />++ free(oldport);<br />++ free(newscheme);<br />++ free(ne=
whost);<br />++ free(newport);<br />++ free(newurl);<br />++ return Curl_uc=
_to_curlcode(uc);<br />+ }<br />+- if(clear) {<br />++<br />++ curl_url_cle=
anup(u);<br />++ free(oldscheme);<br />++ free(oldhost);<br />++ free(oldpo=
rt);<br />++ free(newscheme);<br />++ free(newhost);<br />++ free(newport);=
<br />++<br />++ if((!same_origin &amp;&amp; !data-&gt;set.allow_auth_to_ot=
her_hosts) ||<br />++ !data-&gt;set.str[STRING_USERNAME]) {<br />+ result =
=3D Curl_reset_userpwd(data);<br />+ if(result) {<br />+ free(newurl);<br /=
>+@@ -917,12 +935,12 @@ CURLcode Curl_follow(struct Curl_easy *data,<br />+=
 Curl_safefree(data-&gt;state.aptr.passwd);<br />+ }<br />+ }<br />+- }<br =
/>+ <br />+- result =3D Curl_reset_proxypwd(data);<br />+- if(result) {<br =
/>+- free(newurl);<br />+- return result;<br />++ result =3D Curl_reset_pro=
xypwd(data);<br />++ if(result) {<br />++ free(newurl);<br />++ return resu=
lt;<br />++ }<br />+ }<br />+ <br />+ if(type =3D=3D FOLLOW_FAKE) {<br />+d=
iff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc<br />+index a=
afd309a9d..f673f86384 100644<br />+--- a/tests/data/Makefile.inc<br />++++ =
b/tests/data/Makefile.inc<br />+@@ -251,7 +251,7 @@ test2300 test2301 test2=
302 test2303 test2304 test2305 test2306 test2307 \<br />+ \<br />+ test2400=
 test2401 test2402 test2403 test2404 \<br />+ \<br />+-test2500 test2501 te=
st2502 test2503 \<br />++test2500 test2501 test2502 test2503 test2506 \<br =
/>+ \<br />+ test2600 test2601 test2602 test2603 \<br />+ \<br />+diff --gi=
t a/tests/data/test2506 b/tests/data/test2506<br />+new file mode 100644<br=
 />+index 0000000000..9c65002496<br />+--- /dev/null<br />++++ b/tests/data=
/test2506<br />+@@ -0,0 +1,64 @@<br />++&lt;?xml version=3D"1.0" encoding=
=3D"US-ASCII"?&gt;<br />++&lt;testcase&gt;<br />++&lt;info&gt;<br />++&lt;k=
eywords&gt;<br />++HTTP<br />++cookies<br />++&lt;/keywords&gt;<br />++&lt;=
/info&gt;<br />++<br />++&lt;reply&gt;<br />++&lt;data crlf=3D"headers" noc=
heck=3D"yes"&gt;<br />++HTTP/1.1 301 redirect<br />++Date: Tue, 09 Nov 2010=
 14:49:00 GMT<br />++Content-Length: 3<br />++Location: <a href=3D"http://n=
umbertwo.example/%TESTNUMBER0002" target=3D"_blank" rel=3D"noopener">http:/=
/numbertwo.example/%TESTNUMBER0002</a><br />++<br />++ok<br />++&lt;/data&g=
t;<br />++&lt;data2 crlf=3D"headers" nocheck=3D"yes"&gt;<br />++HTTP/1.1 20=
0 OK<br />++Date: Tue, 09 Nov 2010 14:49:00 GMT<br />++Content-Length: 4<br=
 />++<br />++yes<br />++&lt;/data2&gt;<br />++&lt;/reply&gt;<br />++<br />+=
+&lt;client&gt;<br />++&lt;server&gt;<br />++http<br />++&lt;/server&gt;<br=
 />++&lt;features&gt;<br />++proxy<br />++&lt;/features&gt;<br />++&lt;tool=
&gt;<br />++lib%TESTNUMBER<br />++&lt;/tool&gt;<br />++&lt;name&gt;<br />++=
netrc with redirect using proxy<br />++&lt;/name&gt;<br />++&lt;file name=
=3D"%LOGDIR/netrc2506"&gt;<br />++machine site.example login batman passwor=
d robin<br />++&lt;/file&gt;<br />++&lt;command&gt;<br />++http://%HOSTIP:%=
HTTPPORT <a href=3D"http://site.example/" target=3D"_blank" rel=3D"noopener=
">http://site.example/</a> %LOGDIR/netrc2506<br />++&lt;/command&gt;<br />+=
+&lt;/client&gt;<br />++<br />++&lt;verify&gt;<br />++&lt;protocol crlf=3D"=
headers"&gt;<br />++GET <a href=3D"http://site.example/" target=3D"_blank" =
rel=3D"noopener">http://site.example/</a> HTTP/1.1<br />++Host: site.exampl=
e<br />++Authorization: Basic %b64[batman:robin]b64%<br />++Accept: */*<br =
/>++Proxy-Connection: Keep-Alive<br />++<br />++GET <a href=3D"http://numbe=
rtwo.example/25060002" target=3D"_blank" rel=3D"noopener">http://numbertwo.=
example/25060002</a> HTTP/1.1<br />++Host: numbertwo.example<br />++Accept:=
 */*<br />++Proxy-Connection: Keep-Alive<br />++<br />++&lt;/protocol&gt;<b=
r />++&lt;/verify&gt;<br />++&lt;/testcase&gt;<br />+diff --git a/tests/dat=
a/test998 b/tests/data/test998<br />+index 0969d4704b..17c0a0e150 100644<br=
 />+--- a/tests/data/test998<br />++++ b/tests/data/test998<br />+@@ -82,7 =
+82,6 @@ Proxy-Connection: Keep-Alive<br />+ <br />+ GET <a href=3D"http://=
somewhere.else.example/a/path/9980002" target=3D"_blank" rel=3D"noopener">h=
ttp://somewhere.else.example/a/path/9980002</a> HTTP/1.1<br />+ Host: somew=
here.else.example<br />+- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D=
<br />+ User-Agent: curl/%VERSION<br />+ Accept: */*<br />+ Proxy-Connectio=
n: Keep-Alive<br />+diff --git a/tests/libtest/Makefile.inc b/tests/libtest=
/Makefile.inc<br />+index 9f7cec6027..9d3356aaf5 100644<br />+--- a/tests/l=
ibtest/Makefile.inc<br />++++ b/tests/libtest/Makefile.inc<br />+@@ -75,7 +=
75,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmconnect libprer=
eq \<br />+ lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \<br />+ lib230=
1 lib2302 lib2304 lib2305 lib2306 \<br />+ lib2402 lib2404 \<br />+- lib250=
2 \<br />++ lib2502 lib2506 \<br />+ lib3010 lib3025 lib3026 lib3027 \<br /=
>+ lib3100 lib3101 lib3102 lib3103<br />+ <br />+@@ -684,6 +684,9 @@ lib240=
4_LDADD =3D $(TESTUTIL_LIBS)<br />+ lib2502_SOURCES =3D lib2502.c $(SUPPORT=
FILES) $(TESTUTIL) $(WARNLESS)<br />+ lib2502_LDADD =3D $(TESTUTIL_LIBS)<br=
 />+ <br />++lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WA=
RNLESS)<br />++lib2506_LDADD =3D $(TESTUTIL_LIBS)<br />++<br />+ lib3010_SO=
URCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)<br />+ lib3010_=
LDADD =3D $(TESTUTIL_LIBS)<br />+ <br />+diff --git a/tests/libtest/lib2506=
.c b/tests/libtest/lib2506.c<br />+new file mode 100644<br />+index 0000000=
000..e6dde18507<br />+--- /dev/null<br />++++ b/tests/libtest/lib2506.c<br =
/>+@@ -0,0 +1,71 @@<br />++/***********************************************=
****************************<br />++ * _ _ ____ _<br />++ * Project ___| | =
| | _ \| |<br />++ * / __| | | | |_) | |<br />++ * | (__| |_| | _ &lt;| |__=
_<br />++ * \___|\___/|_| \_\_____|<br />++ *<br />++ * Copyright (C) Linus=
 Nielsen Feltzing &lt;linus@haxx.se&gt;<br />++ *<br />++ * This software i=
s licensed as described in the file COPYING, which<br />++ * you should hav=
e received as part of this distribution. The terms<br />++ * are also avail=
able at <a href=3D"https://curl.se/docs/copyright.html" target=3D"_blank" r=
el=3D"noopener">https://curl.se/docs/copyright.html</a>.<br />++ *<br />++ =
* You may opt to use, copy, modify, merge, publish, distribute and/or sell<=
br />++ * copies of the Software, and permit persons to whom the Software i=
s<br />++ * furnished to do so, under the terms of the COPYING file.<br />+=
+ *<br />++ * This software is distributed on an "AS IS" basis, WITHOUT WAR=
RANTY OF ANY<br />++ * KIND, either express or implied.<br />++ *<br />++ *=
 SPDX-License-Identifier: curl<br />++ *<br />++ **************************=
*************************************************/<br />++#include "test.h"=
<br />++<br />++#include "testtrace.h"<br />++<br />++static size_t sink250=
6(char *ptr, size_t size, size_t nmemb, void *ud)<br />++{<br />++ (void)pt=
r;<br />++ (void)ud;<br />++ return size * nmemb;<br />++}<br />++<br />++i=
nt test(char *URL)<br />++{<br />++ CURL *curl;<br />++ int res =3D CURLE_O=
UT_OF_MEMORY;<br />++<br />++ if(curl_global_init(CURL_GLOBAL_ALL) !=3D CUR=
LE_OK) {<br />++ curl_mfprintf(stderr, "curl_global_init() failed\n");<br /=
>++ return TEST_ERR_MAJOR_BAD;<br />++ }<br />++<br />++ curl =3D curl_easy=
_init();<br />++ if(!curl) {<br />++ curl_mfprintf(stderr, "curl_easy_init(=
) failed\n");<br />++ curl_global_cleanup();<br />++ return TEST_ERR_MAJOR_=
BAD;<br />++ }<br />++<br />++ test_setopt(curl, CURLOPT_WRITEFUNCTION, sin=
k2506);<br />++ test_setopt(curl, CURLOPT_PROXY, URL);<br />++ test_setopt(=
curl, CURLOPT_URL, libtest_arg2);<br />++ test_setopt(curl, CURLOPT_NETRC, =
CURL_NETRC_OPTIONAL);<br />++ test_setopt(curl, CURLOPT_NETRC_FILE, libtest=
_arg3);<br />++ test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);<br />++ test=
_setopt(curl, CURLOPT_VERBOSE, 1L);<br />++<br />++ /* CURLOPT_UNRESTRICTED=
_AUTH should not make a difference because the<br />++ credentials come fro=
m netrc */<br />++ test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);<br />+=
+<br />++ res =3D curl_easy_perform(curl);<br />++<br />++test_cleanup:<br =
/>++ curl_easy_cleanup(curl);<br />++ curl_global_cleanup();<br />++<br />+=
+ return res;<br />++}<br />diff --git a/meta/recipes-support/curl/curl_8.7=
.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb<br />index 781b37c5ad..4f82=
8ffd79 100644<br />--- a/meta/recipes-support/curl/curl_8.7.1.bb<br />+++ b=
/meta/recipes-support/curl/curl_8.7.1.bb<br />@@ -41,6 +41,7 @@ SRC_URI =3D=
 " \<br />file://CVE-2026-4873.patch \<br />file://CVE-2026-5545.patch \<br=
 />file://CVE-2026-6253.patch \<br />+ file://CVE-2026-6429.patch \<br />"<=
br /><br />SRC_URI:append:class-nativesdk =3D " \<br />-- <br />2.35.6</blo=
ckquote>
</div>

--h6y4zvu9rnWRZK9XfMMN--

