Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA9AC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 07:12:58 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.60000.1742886771597380971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 00:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E4w+8Q+2;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1147; q=dns/txt;
  s=iport01; t=1742886771; x=1744096371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5E6xKcCUkQqXTHa2ipAgrYfoqWckuIRnn+0ZRN/82IA=;
  b=E4w+8Q+2Hvo3WUEkzVjgFynNnAx//7QLQgIQ4SGPsPgTZGJkdVZ84lzz
   vKxK10sdDM0O4U9PgMXcCP4upgYkVIXjEpOoc5yPAWgc9nguTv4sdn+FR
   E5NvE3cIPN86Wcijw4FH8iM4T4rL+1AtzyB9L+YzafEJpy2h+G0ZidtsO
   RKTsVaGD7b+zh0HIcBBYG5Kzr6W1NVMrYngIDOaB5+vknegp/Ip2TVVct
   h0glPte6HnuGVwtzcar96T71zqfAT7UBTUlMVJdfySoFNhae+8nCDS1jQ
   NsyOhj0K/jq/g7oagdFIruxBS0vlCNhu5KffwFO3PDvbWfTlBiu57Bwnr
   g==;
X-CSE-ConnectionGUID: cw79Zrk9S3yAuun/OPY34g==
X-CSE-MsgGUID: JF53KZNfSzOdV/0nZpMcwA==
X-IPAS-Result: =?us-ascii?q?A0ADAAB7VuJn/5P/Ja1aGQEBAQECAgEBAQEBAQEBARQBA?=
 =?us-ascii?q?QEBAQEBAQEBggAEAQEBAQwBgkp2WUNIjHGJVZ4WgSUDVg8BAQEPOQsEAQGFB?=
 =?us-ascii?q?4sjAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4V7D?=
 =?us-ascii?q?YZdNgFGgQxEgwIBgmQDEQauP4IsgQGDWgUJAkNP2TiBaAaBSAGNTG8BhHcnG?=
 =?us-ascii?q?4FJRIR9gQWBXAEDGIIThXcEh1mrCUiBIQNZLAFVEw0KCwcFgWwDNQwLLhWBR?=
 =?us-ascii?q?UM4gkRpSToCDQI1ght8giiETYQ+XC8DAwMDgyiFUIIRggSJJ4RgLU+DEkADC?=
 =?us-ascii?q?xgNSBEsNxQbBj5uB6JxATqEQw6BACwEHIIMkyKSP6EGhCWEb4cplTAaM6pXm?=
 =?us-ascii?q?H6OBZVdaYRogWc8gUcLBzMaCBsVgyJSGQ+OOINjgX/BFyYyAjoCBwsBAQMJk?=
 =?us-ascii?q?WUBAQ?=
IronPort-Data: A9a23:DdF+PKA3vSmRLhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGhw0z0On
 GsZWGyOOa3eYmKjLowkO4yw90JX7cLTxoBkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZsCCeB/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gX2thh
 fuo+5eCYAT/hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyOoxXXMsPtwjofdeHHxIs
 tsgGWtRYUXW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/DZsyme6ynHjXeDxDo1XTrq0yi4TW5FctiuGxYIGII7RmQ+13sBvDh
 VDg8V/rJR0kc4SZ+yKg+W2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:qdTnQalsdBO2d4MjkSFLIp+wte3pDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:uqfHq2Dz+7CMEcv6EyJ4qx8mAMN0SSbM5WrNJQifMVcyFLLAHA==
X-Talos-MUID: 9a23:L/Mf0waKGqLxkOBTlRGx3xJQEslT8YOiNgdVl6censKbHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.14,274,1736812800"; 
   d="scan'208";a="342148351"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Mar 2025 07:12:50 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 994A71800088E;
	Tue, 25 Mar 2025 07:12:50 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 31BD0CC12B5; Tue, 25 Mar 2025 00:12:50 -0700 (PDT)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: ignore CVE-2023-1386
Date: Tue, 25 Mar 2025 00:12:48 -0700
Message-ID: <20250325071248.882336-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 07:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213589

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4dc6c104c7..25e57b9006 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -81,6 +81,8 @@ CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 a
 # NVD DB has this CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
+CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.44.1


