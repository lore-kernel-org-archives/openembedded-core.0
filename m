Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F270D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:20:00 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15854.1764335992412865182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=EZKZ1LW+;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=4204b036a=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764335992; x=1795871992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z5aeN4Z/iwQlGLGVxP5z1gJqqjt4aLWGTyOsv1+zz6I=;
  b=EZKZ1LW+bKb5rdAL4UaQcHzcpvdhle+HSZiWy1raQd/8pqa1ZnKYfLg/
   /KXqq3vsTkXiKrafcEE4pZ/B+uUBcUdLW3Rk33sShI5IY3AQXaapU6igc
   KKMa2NCABa9DTw3Llrk1KeO2YzxFhw4Cadj/WzfMjvCzdbkuIjRvca/qi
   U=;
X-CSE-ConnectionGUID: vFIMWJ7jQgyRjsZLlGxd6g==
X-CSE-MsgGUID: oZJgpbY3QfCXYPByahzvBQ==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Nov 2025 14:19:50 +0100
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw2.muc with
 ESMTP/TLS; 28 Nov 2025 14:19:49 +0100
Received: from smucmp15b.bmwgroup.net (HELO smucmp15b.europe.bmw.corp)
 ([10.30.13.136]) by esabb2.muc with ESMTP/TLS; 28 Nov 2025 14:19:50 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp15b.europe.bmw.corp (2a03:1e80:a15:58f::1:4b) with Microsoft SMTP
 Server (version=TLS; Fri, 28 Nov 2025 14:19:49 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.210) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 28 Nov 2025 14:19:49 +0100
X-CSE-ConnectionGUID: 8Zp2OuV+TJ+sk7AfFkxhlA==
X-CSE-MsgGUID: 9B46Iay8Rnm4FCWEXLfFOw==
X-CSE-ConnectionGUID: EiW0sb26QWKkNq7spLiwgQ==
X-CSE-MsgGUID: Cp4O6BfySQq/Jw3kU/TwUA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <changqing.li@windriver.com>,
	<raj.khem@gmail.com>, <Peter.Marko@siemens.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][scarthgap][PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
Date: Fri, 28 Nov 2025 14:19:23 +0100
Message-ID: <20251128131923.2980510-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a16:52a::1:147) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226906

Due to what looks like a copy'n'paste mistake, the environment setup script
might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
untouched. Fix that.

(cherry picked from commit 545e43a7a45be02fda8fc3af69faa20e889f58c4)

CC: changqing.li@windriver.com
CC: raj.khem@gmail.com
CC: Peter.Marko@siemens.com

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 581108ef35..b948db2cf6 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,6 +1,6 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "${CURL_CA_PATH:-}" ]; then
+# CAFILE/CAPATH is auto-detected when source buildtools
+if [ -z "${CURL_CA_BUNDLE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then

