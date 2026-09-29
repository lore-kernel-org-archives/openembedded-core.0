Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB41CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:05:28 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.492.1790654718852388951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T5OPtaIz;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1164; q=dns/txt;
  s=iport01; t=1790654718; x=1791864318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ukFiPmxS8N9Z6T+V+IPlFKobnRfxM3YcuOWjb8ZswrQ=;
  b=T5OPtaIz46TGrKmTfZOhSCD8gH3pzn8rzbMCgvLseOUNHm/Mm1JLuVsx
   mgFMxVXh6iuvztlP3YI4KQufzoJAngMzAABEONk3SeCWv7O26jAYDFJk5
   4A2U4oXj2eAHXjPvP4iRn3meFd6LbwjQ7nn+wP4WddmpBjLcE0bAYaDic
   ROHSCNho3yt2u90An0XK5NArO6wL8NZ20FRiH+3mjaRtbAHv/8rv8cyHO
   1F6BTSuIu3tHAjbwImiW99lWWIOGY3InN3YimoSasBweiMw78lsWnq5TU
   LSZst5dIeBX3mis3WqHgYAzgbMRidf5b1hYc1vHMYLxwUi3METHj3JJlu
   Q==;
X-CSE-ConnectionGUID: NxFh/RC+QSuIG0TatbwRVg==
X-CSE-MsgGUID: r3snUq9IR++iSojZdSPY4A==
X-IPAS-Result: =?us-ascii?q?A0BAAgBdOLtq/5D/Ja1aglmCV3VgQ0mWSp4dgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQWOCgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QFTYBRjBcRIMCAYJ0AxHACYIsgQGDaQJDUNsyAQsUAQWBM4VAiCN1A?=
 =?us-ascii?q?YR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDIF4kzhIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCA?=
 =?us-ascii?q?QIBSUMOB0VTCSVFEkcmIggSCQETGjALgSE4QQkoPxgNSBEsNxUZBD5uB5A/H?=
 =?us-ascii?q?oJlgQ4sBIFoGDmlZaEPCiiDdowilToaM4VbpRQLI5haizeCU5ZQhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OOYNrgX/KOicyPQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ztsnoqOZLqrnCWzvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUpw1mYCy
 WFMDG2DM/veM2D8Ld9wb4my8UgE68XcmINhTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgf0gW4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69N+IkFxB6Zbw91qIE4Wy
 fUEIi83UB/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FErgOe0aoWLI7RmQ+1PxV2em
 3uX3l66QRAhM96txQG9wy6F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KLpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:L/TddKki9RD52qyRlmIL884TT+LpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:XvmuwmC904Di24j6Ew932k5TIOtmS0bA7ViIH0akA3lTdrLAHA==
X-Talos-MUID: 9a23:x0Aqjgnxuz8zYpgMe/Wndnp4b9xu3r3/KXpO0pQ9vMu2ORdICmu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528712761"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:05:18 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id F21B1180003DD;
	Tue, 29 Sep 2026 04:05:17 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9766DCC1611; Mon, 28 Sep 2026 21:05:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 1/2] vim: set CVE_STATUS for CVE-2026-51400
Date: Mon, 28 Sep 2026 21:05:16 -0700
Message-Id: <20260929040517.330335-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246806

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51400 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51400

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 77f681410a..afdb46b4be 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -50,6 +50,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
 PV .= ".0340"
 SRCREV = "6addd6c101117706bc9b3609d3a418e26e92618f"
 
+CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
-- 
2.35.6


