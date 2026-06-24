Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3AECDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:46:57 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6181.1782305215277477341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=sr96tVk8;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout12.t-online.de (Postfix) with SMTP id C2D9EE4BD
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:46:52 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcN0A-2Ezfhx0; Wed, 24 Jun 2026 14:46:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] curl: update 8.20.0 -> 8.21.0
Date: Wed, 24 Jun 2026 14:46:39 +0200
Message-ID: <20260624124639.371381-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782305207-D37FC5DD-1A505FAB/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bbec1f1-c9cd-4511-b09b-e4eb1383fcca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782305212; i=f_l_k@t-online.de;
	bh=qCZjjDnqa9NM1flZxfW4lk+xKuJVSnFw2DoGoeucbGo=;
	h=From:To:Subject:Date;
	b=sr96tVk8WMLqB0BLofc9LcG8N+AFG9wjYFQi1zCzB7yhGkuRHGuj9rvyj36rPM0q3
	 pcAg/nWrHo/BYS4zi/9d5TNaPUSt+hqQQk4bjLzl3+p7AMh9DcXicWWcb59+JzEu9C
	 /q2aJ+jfvj8SRKcfHyHo3Ql4pHafEPpccCeL8Vd2+cj68csR6RQQF1UPETyYqumZDO
	 BDT/Lxnjva4fhS3fGh25fSNPsczrC7GE0IBQve7MrU8M4bktCJcE2LWY3Hwlolt7Yo
	 CEYWJOWsNRszwC2n6gw1oiZTuQpIstyvy+CFg9RiF75TNGtRLX9qwLjTVlXee8rcWt
	 SXzYfQuzKCs7g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239504

After updating oe-core and meta-openembedded I see this error in curl bui=
ld:
| configure: detected GnuTLS version 3.8.13
| checking for nettle_MD5Init in -lgnutls... no
| checking for x86_64-oe-linux-pkg-config... (cached) /home/flk/bitbake/b=
itbake-builds/oe/build/tmp/work/corei7-64-oe-linux/curl/8.20.0/recipe-sys=
root-native/usr/bin/pkg-config
| checking for nettle options with pkg-config... found
| checking for nettle_MD5Init in -lnettle... no
| configure: error: GnuTLS found, but nettle was not found

This issue has already been fixed upstream and a new curl version was rel=
eased today -> update to fix build

- adjust no-test-timeout.patch
- remove backported patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-event-fix-wakeup-consumption.patch   | 39 ------------------
 meta/recipes-support/curl/curl/mbedtls.patch  | 41 -------------------
 .../curl/curl/no-test-timeout.patch           | 14 +++----
 .../curl/{curl_8.20.0.bb =3D> curl_8.21.0.bb}   |  4 +-
 4 files changed, 8 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-event-fix-wakeup-=
consumption.patch
 delete mode 100644 meta/recipes-support/curl/curl/mbedtls.patch
 rename meta/recipes-support/curl/{curl_8.20.0.bb =3D> curl_8.21.0.bb} (9=
7%)

diff --git a/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consump=
tion.patch b/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consump=
tion.patch
deleted file mode 100644
index 7f22e19c05..0000000000
--- a/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consumption.pa=
tch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 590e31dff8aa4c5ff8be761128e38ac751aed875 Mon Sep 17 00:00:00 2001
-From: Stefan Eissing <stefan@eissing.org>
-Date: Mon, 11 May 2026 14:56:04 +0200
-Subject: [PATCH] event: fix wakeup consumption
-
-The events on a multi wakeup socketpair were only consumed via
-curl_multi_poll()/curl_multi_wait() but not in event based processing on
-a curl_multi_socket() call. That led to busy loops as reported in
-
-Fixes #21547
-Reported-by: Earnestly on github
-Closes #21549
-
-Upstream-Status: Backport ["2a2104f event: fix wakeup consumption"]
-Suggested-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Tim Orling <tim.orling@konsulk.com>
----
- lib/multi.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/lib/multi.c b/lib/multi.c
-index 7520253d70..a0012d8faf 100644
---- a/lib/multi.c
-+++ b/lib/multi.c
-@@ -2479,6 +2479,11 @@ static CURLMcode multi_runsingle(struct Curl_mult=
i *multi,
-   Curl_uint32_bset_remove(&multi->dirty, data->mid);
-=20
-   if(data =3D=3D multi->admin) {
-+#ifdef ENABLE_WAKEUP
-+    /* Consume any pending wakeup signals before processing.
-+     * This is necessary for event based processing. See #21547 */
-+    (void)Curl_wakeup_consume(multi->wakeup_pair, TRUE);
-+#endif
- #ifdef USE_RESOLV_THREADED
-     Curl_async_thrdd_multi_process(multi);
- #endif
---=20
-2.47.3
-
diff --git a/meta/recipes-support/curl/curl/mbedtls.patch b/meta/recipes-=
support/curl/curl/mbedtls.patch
deleted file mode 100644
index f2f2c457aa..0000000000
--- a/meta/recipes-support/curl/curl/mbedtls.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 50b1408f97d9e8fc585c5351cbf86bf60a30eb59 Mon Sep 17 00:00:00 2001
-From: Viktor Szakats <commit@vsz.me>
-Date: Sat, 23 May 2026 01:05:10 +0200
-Subject: [PATCH] autotools: mbedtls detection fixes
-
-- fix symbol used for first-round detection.
-- skip detecting mbedtls on custom path if custom path was not supplied.
-
-Reported-by: Ross Burton
-Fixes #21727
-
-Closes #21729
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/50b1408f9=
7d9e8fc585c5351cbf86bf60a30eb59]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- m4/curl-mbedtls.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/curl-mbedtls.m4 b/m4/curl-mbedtls.m4
-index 7c5bccd22983..6887302592d6 100644
---- a/m4/curl-mbedtls.m4
-+++ b/m4/curl-mbedtls.m4
-@@ -42,7 +42,7 @@ if test "x$OPT_MBEDTLS" !=3D "xno"; then
-     if test -z "$OPT_MBEDTLS"; then
-       dnl check for lib first without setting any new path
-=20
--      AC_CHECK_LIB(mbedtls, mbedtls_havege_init,
-+      AC_CHECK_LIB(mbedtls, mbedtls_ssl_init,
-       dnl libmbedtls found, set the variable
-       [
-         AC_DEFINE(USE_MBEDTLS, 1, [if mbedTLS is enabled])
-@@ -58,7 +58,7 @@ if test "x$OPT_MBEDTLS" !=3D "xno"; then
-     addcflags=3D""
-     mbedtlslib=3D""
-=20
--    if test "$USE_MBEDTLS" !=3D "yes"; then
-+    if test "$USE_MBEDTLS" !=3D "yes" && test -n "$OPT_MBEDTLS"; then
-       dnl add the path and test again
-       addld=3D-L$OPT_MBEDTLS/lib$libsuff
-       addcflags=3D-I$OPT_MBEDTLS/include
diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/=
recipes-support/curl/curl/no-test-timeout.patch
index 3ece55cab6..f432279728 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -15,12 +15,12 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index 5d5d98b..442cfaf 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
- my $sshderror;   # for socks server, ssh daemon version error
- my %doesntrun;    # servers that do not work, identified by pidfile
+@@ -124,7 +124,7 @@
+ my $sshderror;     # for socks server, ssh daemon version error
+ my %doesntrun;     # servers that do not work, identified by pidfile
  my %PORT =3D (nolisten =3D> 47); # port we use for a local non-listenin=
g service
--my $server_response_maxtime=3D13;
-+my $server_response_maxtime=3D600;
+-my $server_response_maxtime =3D 13;
++my $server_response_maxtime =3D 600;
  my $httptlssrv =3D find_httptlssrv();
- my %run;          # running server
- my %runcert;      # cert file currently in use by an ssl running server
+ my %run;           # running server
+ my %runcert;       # cert file currently in use by an SSL running serve=
r
diff --git a/meta/recipes-support/curl/curl_8.20.0.bb b/meta/recipes-supp=
ort/curl/curl_8.21.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.20.0.bb
rename to meta/recipes-support/curl/curl_8.21.0.bb
index f4a0a2af71..56224f8063 100644
--- a/meta/recipes-support/curl/curl_8.20.0.bb
+++ b/meta/recipes-support/curl/curl_8.21.0.bb
@@ -14,15 +14,13 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
-    file://mbedtls.patch \
-    file://0001-event-fix-wakeup-consumption.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
     file://environment.d-curl.sh \
 "
=20
-SRC_URI[sha256sum] =3D "63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59=
fab4b79d3ce2b896"
+SRC_URI[sha256sum] =3D "aa1b66a70eace83dc624508745646c08ae561de512ab403a=
dffb93ac87fc72e6"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.54.0


