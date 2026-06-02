Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08869CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:29:46 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21828.1780396183244722724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cRo5bI7V;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=983; q=dns/txt;
  s=iport01; t=1780396183; x=1781605783;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eNNQ52WZ8dwR8cZ/zKE8nSmtk7sg+yK+Y5f70CCn9T0=;
  b=cRo5bI7Vo0+L26d/gAlZ1cnPYCG+E4m5ttBPhKLIbjFKcX3DspuVQIhj
   aX996STlqrLNSyenChRiCUm+bMtpBA0eE6cC6lnqmd9JE16ic65+k85zv
   VbSi1j/Wrrm+sfeQQJOdntSQGg0yZrIBcpzli1k6hpW+vlt1fYwSHsOTo
   uoS/P0U0keaVV7xGrKNS48wLKyahOlGu3FsUOM/rtaQ6/GREhL2yD9qUt
   OpB85SgDmLXUCaPX+DkbfxMVX7RqHHtsbYYUFnOEk9pXvQH8I71/bM7gb
   Lp4JMZ1uirDEt5kqC3UwZpyxQfiZXOk0XvKv4tmGJulmLauMma8kFrxhH
   w==;
X-CSE-ConnectionGUID: aVc0IT8jTCexvAZaN6Aqng==
X-CSE-MsgGUID: YN4Cy+4pTmKl1SLf02jOww==
X-IPAS-Result: =?us-ascii?q?A0BAAgDXrx5q/5L/Ja1aHgEBCxIMggULgldyX0JJA5Qno?=
 =?us-ascii?q?D+Bfg8BAQEPPRQEAQGSOgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYcTAXZcHQEmgwIBgnMCARGyW4IsgQGDaAJDUNsoAQUGFAGBO?=
 =?us-ascii?q?IU/iB1zAYR7JxsbgXKEfYEFgVwBgi6FdwSCIoEMhyqIV0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYFKgVVqgQSFFSMfAzmBF4F/gStpaRADC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB4tuFw+CNVY4LCCCDKV2oQ4KKIN0jCGVOhozqmsLmHuOC?=
 =?us-ascii?q?ZZPhGiBaDyBRwsHcBWDIlMZD444hWqDFMRMJDUOLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:h5a2F6pRlZ5Aa2dpD78cS/z8q2heBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnXb6qKajPzKd8kaYngoBgPv8fWmNJgHlFtrShmQixE+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8Ek35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0u9JCjlvy
 awaFBsAfg6qteuQnpuiTOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7WyZFpE+Qr6o+y2PS1wd2lrPqNbI5f/TWFZ0Nwh3B/
 D2uE2LRMzdGH83clSK591Go39Trk3uhWqUNC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:rqp9r61zguE8mDgI7wfEYAqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:R61KLmMIafaqye5DURdsrG8oSsIZWXDN0l7iKmnmIH9vR+jA
X-Talos-MUID: 9a23:JP4N8gXkGj51LxLq/A7K2Bpzd5tw36GNDBk2tZte4cujKjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="480043127"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 10:29:42 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 4DA8818000203
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 10:29:42 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id E9FDCCB6A93; Tue,  2 Jun 2026 03:29:41 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] go: set status for CVE-2026-39836
Date: Tue,  2 Jun 2026 03:26:17 -0700
Message-Id: <20260602102616.180676-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 10:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238028

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..b6bd4cc280 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -45,3 +45,4 @@ SRC_URI += "\
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.35.6


