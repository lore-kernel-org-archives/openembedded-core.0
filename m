Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE7ACFD318
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 05:56:06 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10054.1763963760050080942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 21:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=QwDPP+P5;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=4160b5489=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1763963760; x=1795499760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dNJmp2EKQ+34Zhg6KNbTHB7JDMj2NplFpQgdSZXl4xw=;
  b=QwDPP+P5fDRKyVAzPnud9nieTY+jxM8BOTufkzg+6BJF/qt/h/xStnpl
   vvJnq9Im7SI7XUMktTdAQwCD3kAxsyRE/SOtyNv7359bdtz79FDwnLEIz
   MO4bGRG1F8AEKaPDbP5KzYfKaFGG1P4L4PS+rGSCNb+9g9nmrUj95HesB
   o=;
X-CSE-ConnectionGUID: tgR/OZGrQm68gbp+Cml8Dw==
X-CSE-MsgGUID: yRnNmaISTgWQWlw0i4X4wQ==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Nov 2025 06:55:53 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw2.muc with
 ESMTP/TLS; 24 Nov 2025 06:55:53 +0100
Received: from smucmp16d.bmwgroup.net (HELO smucmp16d.europe.bmw.corp)
 ([10.30.13.146]) by esabb4.muc with ESMTP/TLS; 24 Nov 2025 06:55:53 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16d.europe.bmw.corp (2a03:1e80:a15:58f::1:57) with Microsoft SMTP
 Server (version=TLS; Mon, 24 Nov 2025 06:55:53 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.201) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 24 Nov 2025 06:55:53 +0100
X-CSE-ConnectionGUID: XsSjOdjhRVe9Qe8ZmHOA7Q==
X-CSE-MsgGUID: IKcUoBOSSi+7kbGxPKdLzQ==
X-CSE-ConnectionGUID: hAwzhkgGQDynRyTvHZ2L/A==
X-CSE-MsgGUID: u6NKq7MVTXW59qC8mwU+eg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <changqing.li@windriver.com>,
	<raj.khem@gmail.com>
Subject: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
Date: Mon, 24 Nov 2025 06:55:33 +0100
Message-ID: <20251124055533.857103-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18e.europe.bmw.corp (2a03:1e80:a15:58f::1:75) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 05:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226734

Due to what looks like a copy'n'paste mistake, the environment setup script
might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
untouched. Fix that.

CC: changqing.li@windriver.com
CC: raj.khem@gmail.com
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
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

