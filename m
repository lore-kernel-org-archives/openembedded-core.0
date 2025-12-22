Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB8E67482
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:25:31 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78307.1766402725748722976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=LT5jsjUm;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=44487fec1=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1766402724; x=1797938724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CCAEMFqkHUIpmna1y6+QamSQXFuo+Qi8zsei65O275Q=;
  b=LT5jsjUm/p9919pJ5v589FzueIkG0ON7QSVu3N/DqAtVw3LeX6D+TKPk
   CdIHGEwvCguKXutTEcP3BaYEXyfR+DDJxU/yWS8E03D2oq8kQC3cjSdHb
   nd3yoOoN09Dool7CtH/R8J8ouZujtlPxyzDklkNwlJFP/a/sbWyrE/JG1
   o=;
X-CSE-ConnectionGUID: 92oHasrcSyK2TaYFSOl18A==
X-CSE-MsgGUID: WNAHRxxgR1SkmqdO42UURg==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 22 Dec 2025 12:25:21 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw3.muc with
 ESMTP/TLS; 22 Dec 2025 12:25:23 +0100
Received: from smucmp18e.bmwgroup.net (HELO smucmp18e.europe.bmw.corp)
 ([10.30.13.163]) by esabb4.muc with ESMTP/TLS; 22 Dec 2025 12:25:23 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp18e.europe.bmw.corp (2a03:1e80:a15:58f::1:75) with Microsoft SMTP
 Server (version=TLS; Mon, 22 Dec 2025 12:25:22 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.206) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 22 Dec 2025 12:25:22 +0100
X-CSE-ConnectionGUID: zXjkjVvATp2YouJudGF7Ww==
X-CSE-MsgGUID: DSXrklURSN2x8X/gTTlWxg==
X-CSE-ConnectionGUID: /oTVoGa0Rdq44Yl51n1/pg==
X-CSE-MsgGUID: spnoOASOQh64oNkSsKQKeg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <matthias.schiffer@ew.tq-group.com>,
	<Peter.Marko@siemens.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] curl: Use host CA bundle by default for native(sdk) builds
Date: Mon, 22 Dec 2025 12:24:54 +0100
Message-ID: <20251222112454.637921-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18h.europe.bmw.corp (2a03:1e80:a15:58f::1:6c) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228295

Fixes YOCTO #16077

Commit 0f98fecd (a backport of 4909a46e) broke HTTPS downloads in opkg in the
SDK, they now fail with:

> SSL certificate problem: self-signed certificate in certificate chain

The root cause is a difference in the handling of related env vars between
curl-cli and libcurl. The CLI will honour CURL_CA_BUNDLE and SSL_CERT_DIR|FILE
(see [0]). Those are set in the SDK via env setup scripts like [1], so curl
continued to work. The library however does not handle those env vars. Thus,
unless the program utilizing libcurl has implemented a similar mechanism itself
and configures libcurl accordingly via the API (like for example Git in [2] and
[3]), there will be no default CA bundle configured to verify certificates
against.

Opkg only supports setting the CA bundle path via config options 'ssl_ca_file'
and 'ssl_ca_path'. Upstreaming and then backporting a patch to add env var
support is not a feasible short-time fix for the issue at hand. Instead it's
better to ship libcurl in the SDK with a sensible built-in default - which also
helps any other libcurl users.

This patch is based on a proposal by Peter.Marko@siemens.com in the related
mailing list discussion at [4].

(cherry picked from commit 3f819f57aa1960af36ac0448106d1dce7f38c050)

[0]: https://github.com/curl/curl/blob/400fffa90f30c7a2dc762fa33009d24851bd2016/src/tool_operate.c#L2056-L2084
[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl/environment.d-curl.sh?id=3a15ca2a784539098e95a3a06dec7c39f23db985
[2]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1389
[3]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1108-L1109
[4]: https://lists.openembedded.org/g/openembedded-core/topic/115993530#msg226751

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: matthias.schiffer@ew.tq-group.com
CC: Peter.Marko@siemens.com
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6c02746394..0af6a41399 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -92,16 +92,21 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
+# Use host certificates for non-target builds. As libcurl doesn't honor any of the env vars (like
+# for example CURL_CA_PATH) that curl-cli does, we need to explicitly set '--with-ca-bundle'
+# accordingly, so that there is a working, built-in default even for those tools that use libcurl,
+# but don't have custom env var handling implemented (like opkg).
+CURL_CA_BUNDLE_BASE_DIR ?= "/etc"
+CURL_CA_BUNDLE_BASE_DIR:class-target = "${sysconfdir}"
+
 EXTRA_OECONF = " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
     --without-libpsl \
     --enable-optimize \
+    --with-ca-bundle=${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certificates.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
-EXTRA_OECONF:append:class-target = " \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config

