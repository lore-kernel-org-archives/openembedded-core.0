Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B3FD11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 10:32:05 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15809.1764239519826062501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 02:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=In6RClCb;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=41907f1d1=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764239519; x=1795775519;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N6n79t76EVea/2KEd3WOgQsPwFggYZOdfyx90vRcoUE=;
  b=In6RClCbjQebW3Bo88/ag5jTE4EsMY9kSDSCyQgMECABEEUFNCahTBpw
   HRFHxDzxkcn/PMe6mbR018OgH+i7TNrPhSwGxfyptsxmak+wZVRkcKU4E
   Pga3w13bqrvNCn7AtlRHxtz6n93mLD7VhFlglrCJ5y1tbesZd2NlrjEzY
   k=;
X-CSE-ConnectionGUID: bMRPHYOjSyaV1DHzFSEddw==
X-CSE-MsgGUID: 1MzfEbolRaKFevvO3fe/hQ==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Nov 2025 11:31:56 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw3.muc with
 ESMTP/TLS; 27 Nov 2025 11:31:47 +0100
Received: from smucmp18c.bmwgroup.net (HELO smucmp18c.europe.bmw.corp)
 ([10.30.13.161]) by esabb4.muc with ESMTP/TLS; 27 Nov 2025 11:31:48 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp18c.europe.bmw.corp (2a03:1e80:a15:58f::1:5c) with Microsoft SMTP
 Server (version=TLS; Thu, 27 Nov 2025 11:31:47 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 27 Nov 2025 11:31:47 +0100
X-CSE-ConnectionGUID: vv3jBr9eRX2jwSynja9GgA==
X-CSE-MsgGUID: o+pv2a23QWCwCBOSpNHOCw==
X-CSE-ConnectionGUID: kJb3eEHXQwCFe7dCLFwZ9w==
X-CSE-MsgGUID: PORsSGrDQq6kpeAaPa/ksg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <matthias.schiffer@ew.tq-group.com>,
	<Peter.Marko@siemens.com>
Subject: [PATCH] curl: Use host CA bundle by default for native(sdk) builds
Date: Thu, 27 Nov 2025 11:31:29 +0100
Message-ID: <20251127103129.2564918-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226829

Fixes YOCTO #16077

Commit 4909a46e broke HTTPS downloads in opkg in the SDK, they now fail with:

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

[0]: https://github.com/curl/curl/blob/400fffa90f30c7a2dc762fa33009d24851bd2016/src/tool_operate.c#L2056-L2084
[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl/environment.d-curl.sh?id=3a15ca2a784539098e95a3a06dec7c39f23db985
[2]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1389
[3]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1108-L1109
[4]: https://lists.openembedded.org/g/openembedded-core/topic/115993530#msg226751

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: matthias.schiffer@ew.tq-group.com
CC: Peter.Marko@siemens.com
---
 meta/recipes-support/curl/curl_8.17.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 32585070eb..352f407d28 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -75,16 +75,21 @@ PACKAGECONFIG[websockets] = "--enable-websockets,--disable-websockets"
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
     --without-libpsl \
     --enable-optimize \
+    --with-ca-bundle=${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certificates.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
     WATT_ROOT=${STAGING_DIR_TARGET}${prefix} \
 "
-EXTRA_OECONF:append:class-target = " \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config

