Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D21E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:12:25 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15983.1771513942159542455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 07:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=oqZh/byZ;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=50341e3db=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1771513940; x=1803049940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W5tIqT8eI+XWTpsox9dzm30UYbaFyyr2RodR+/wRhlI=;
  b=oqZh/byZehI6Su6KAJ1uKEfktIOc93WGKF+6+QPFx1j1L/NThNj+jzFM
   I6Gk47U2iqo8Ld/ashOKO8FlfdzSGvSSSV8sZR/TsP5NNuzc5aSDw+Xn5
   QBY6/tVTdJEbyze2mI/iaRymHlRG/o/qVWepfxmlvUSl2MU88X9ZJhF/j
   Q=;
X-CSE-ConnectionGUID: NYxK6/BHRau6G9CTihdGTA==
X-CSE-MsgGUID: qA2dILAJQ+adiAengCccQQ==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Feb 2026 16:12:17 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw1.muc with
 ESMTP/TLS; 19 Feb 2026 16:12:17 +0100
Received: from smucmp17b.bmwgroup.net (HELO smucmp17b.europe.bmw.corp)
 ([10.30.13.152]) by esabb4.muc with ESMTP/TLS; 19 Feb 2026 16:12:19 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17b.europe.bmw.corp (2a03:1e80:a15:58f::1:4c) with Microsoft SMTP
 Server (version=TLS; Thu, 19 Feb 2026 16:12:18 +0100
Received: from marvin-ws (10.30.85.204) by smucmp21a.europe.bmw.corp
 (2a03:1e80:a01:524::1:44) with Microsoft SMTP Server (version=TLS;
 Thu, 19 Feb 2026 16:12:18 +0100
X-CSE-ConnectionGUID: UK3UuLcDQmSYwBjNdL7CGw==
X-CSE-MsgGUID: uNXbRzS6TjSu33jqhsfcQQ==
X-CSE-ConnectionGUID: jHseCcmkT/mTC5NrGjMiSg==
X-CSE-MsgGUID: LYuNlXcVRFu4/iYwZZyMaA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] populate_sdk_base: Make SDK_ZSTD_COMPRESSION_LEVEL overridable
Date: Thu, 19 Feb 2026 16:12:08 +0100
Message-ID: <20260219151208.1429114-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15e.europe.bmw.corp (2a03:1e80:a15:58f::1:61) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231429

Like the other SDK_*_COMPRESSION_LEVELS users may want to override the
final compression level.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8e671cf28f..b427ff2761 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -92,7 +92,7 @@ SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 SDK_ZIP_OPTIONS ?= "-y"
 SDK_7ZIP_OPTIONS ?= "-mx=9 -mm=BZip2"
 SDK_7ZIP_TYPE ?= "7z"
-SDK_ZSTD_COMPRESSION_LEVEL = "-17"
+SDK_ZSTD_COMPRESSION_LEVEL ?= "-17"
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {

