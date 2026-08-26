Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BFEC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:40:36 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6234.1787722832586932639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K1ONTP5G;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1050; q=dns/txt;
  s=iport01; t=1787722832; x=1788932432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vmUni+NmSp0K405iqXtVdBdo4iubEGWXu5Urt42/tYk=;
  b=K1ONTP5GKv1JMXYOz4Qn+Spxx7dQEOxU2k9vKV8KC0WxElWNhaAztJYG
   +goXns20683WeGS/+OxGOrXxvEyLbd6sezIcA08L9R2tEMjBZ+1vcpmh7
   9fkQXRnTRPwJeZLLNvTulnITD0Ldqx1r23vgKR1nzv5pNIrHS2gSpBgFV
   hof0OfDh5YI+Qw9MJ/uX2NqvpFLc2f912j8w1EAG1wusPB4HSMuw9WoIw
   s8ehlspgOQRW2weV5AHYWEwCmiUEl8keBBh/aYIpT1nD7h6QnNvCDGWiW
   TWgYA3tHe87vMsQGyJjZ4TuPCiIysqeA5poEeupPx0pIIsUb4JwQmDRAl
   Q==;
X-CSE-ConnectionGUID: Kwejy0owRY2f0ysXbFuDRg==
X-CSE-MsgGUID: JHQLo4PMTM6PCtd+CsSJMA==
X-IPAS-Result: =?us-ascii?q?A0BDAgByeo5q/44QJK1aHgEBCxIMggULgld0X0JJlk2eG?=
 =?us-ascii?q?4F+DwEBAQ89FAQBAYUFAo1sAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyARgBLRAgMSsrGYMCAYJ0AgERBr5AgiyBAYMoA?=
 =?us-ascii?q?T8CQ1DbMAELFAEFgTOFP4gidoR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDJNiS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJX?=
 =?us-ascii?q?oErKWABEheBCYIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSYEOL?=
 =?us-ascii?q?II9o0SCIaEPCiiDdowilToaM6psmQiOCpZQhGmBaDyBKB8LB3AVSAGCWQlKG?=
 =?us-ascii?q?Q+OOINrgX/KOiQ1AgE6AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:WLes+qNQ5cAjnbLvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUp3gWYCy
 TBOUGzQbKqDY2f0L9B2O4q1/UsP6JCHzNNlTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69ZxAUMnZYoHwNctDzlf7
 swSBi0hVB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY1BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFUggeSwboWPEjCMbed1p2Kf+
 lrjw0GnOjoGOJ+00gGn11v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkveS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:fgtxR6G2Oi5u2H9CpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:m2zAImHP37AnpSpPqmJE60MWC5gibUfslnmIMlSIA0h0ZIeaHAo=
X-Talos-MUID: 9a23:PrjQuAWMz1wf0BLq/B3MvRVlaP9N34HwMGsRndYtoPKmEAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819945672"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:36:58 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id E677018000220;
	Wed, 26 Aug 2026 05:36:57 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 84BB2CE1BBD; Tue, 25 Aug 2026 22:36:57 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/5] apr-util: Mark CVE-2026-34191 not applicable
Date: Tue, 25 Aug 2026 22:36:25 -0700
Message-Id: <20260826053627.1798620-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260826053627.1798620-1-hthakar@cisco.com>
References: <20260826053627.1798620-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244296

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-34191 affects only the apr_dbd_oracle provider [1].
The apr-util recipe does not enable --with-oracle, so configure keeps
apu_have_oracle=0 [2]. Hence mark the CVE not applicable to this build.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-34191
[2] https://github.com/apache/apr-util/blob/1.6.3/build/dbd.m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index e3d6a23fcb..3051a08eaf 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -102,3 +102,5 @@ do_install_ptest() {
 
 # Add CVE_PRODUCT to match the NVD CPE product name
 CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
+
+CVE_STATUS[CVE-2026-34191] = "not-applicable-config: apr_dbd_oracle is not built because --with-oracle is not enabled"
-- 
2.35.6


