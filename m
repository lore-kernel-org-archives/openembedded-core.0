Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDA1C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:21:42 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.88421.1684156892304292199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=IDf/My2j;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=987; q=dns/txt; s=iport;
  t=1684156892; x=1685366492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R00AbQOvpLZBAa/kzvjgyiGb2bMYLPGp5uuSxZW8tg8=;
  b=IDf/My2j5Qz6ZLsTspH46DtxK15HxHXViCJ6tdUa1qW1EtGc1McvBC/G
   AcoKtkdrB1J/RWqiKLQVmG8cEUEWoql4HzU/N1uYga0lhI2PI1/GFCna4
   a5q2OS7M4hkKG3Zfmd6o80UjO+VPaBxQEMqLtOY9CCJGDCAnum62DY46Y
   c=;
X-IronPort-AV: E=Sophos;i="5.99,276,1677542400"; 
   d="scan'208";a="58694165"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 May 2023 13:21:31 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 34FDLUXu020890
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 15 May 2023 13:21:30 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 56A73CC1293; Mon, 15 May 2023 06:21:30 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, Alex Kiernan <alexk@zuma.ai>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sanjay Chitroda <schitrod@cisco.com>
Subject: [dunfell][PATCH] pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE
Date: Mon, 15 May 2023 06:21:24 -0700
Message-Id: <20230515132124.541144-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181250

From: Alex Kiernan <alex.kiernan@gmail.com>

The CVE product name for PyPI packages is (usually) the same as the PyPI
package name (and not our recipe name), so use that as the default.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61f6b0ad09bf87cdc2d3f08770b7c44cad1d0e58)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/classes/pypi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 87b4c85fc0..c68367449a 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -24,3 +24,5 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.35.6


