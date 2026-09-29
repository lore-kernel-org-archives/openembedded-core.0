Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE408C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:05:27 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.494.1790654720812347114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=abo9TvD7;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1148; q=dns/txt;
  s=iport01; t=1790654720; x=1791864320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ier127GFlls8GViAUyhj5QhmUQ1kaSexF2bi/+UtDk=;
  b=abo9TvD7ow+HD1Dyg8o1XMySKWete7gbCLhP9AABAiL7IVhY8ABcu7Np
   Ppek5zOkCvVasbv/joZc1O8BvWuJD2rEu9yqJGXzFXFb13MykK7VmaNUi
   v822AHKUxBCnneo8GlBok2mj167Myl+QH4wwphqjG/kGXwyOx2CCBzrZE
   +JvgjmmoxQGppE35NnIOAD5ZmSFz7ncDCqY50zHtjaMiStjR4UGnzpjzN
   vE8AnO8K4xr60SsgR38ejuQl+gR7LPCFsGU6nKEg2MSL1gnQOlj4DqSfZ
   +twCOETuT4uKAoBKhUmkfmH5/Ihuu+DzXkFGwT6e5bnf24m/yyq+71DoZ
   Q==;
X-CSE-ConnectionGUID: GiYC62+qT0GTIo4c/HGnLg==
X-CSE-MsgGUID: OqrjucY7TbSFOKN8ss3l4Q==
X-IPAS-Result: =?us-ascii?q?A0BDAgBdOLtq/5H/Ja1aglmCV3VgQ0mWTZ4agX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjggCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBMCAQMyAUYQIDErKxmDAgGCdAMRwAmCLIEBg2kCQ1DbMgEFBhQBB?=
 =?us-ascii?q?YEzhUCII3UBhHwnGxuBcoR+gQWBXAGCLoV4BIIigQyVMEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCGSMZNnqBCV6BKylgARAXgQeCB?=
 =?us-ascii?q?wKCVIIBAgFJQw4HRVMJJUUSRyYiCBIJARMaMAuBIThBCSg/GA1IESw3FRkEP?=
 =?us-ascii?q?m4HkD8egmWBDiyBbBg5pWWhDwoog3aMIpU6GjOqbwsjmFqOCpZQhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIlMZD445hWrKOicyPQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:eV0SDKPB1OWMvgzvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUohhGYFx
 2YfCG/XbK6PYDejctsgb9y08h5TvJ6Bx4I1HHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgf0gW4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69pvPWpoZ84Bxr5YPUBJq
 fdfCB8LSh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FErgOm9aouNJbRmQ+1yh1yau
 2n3oFjzOT89F/rP0iHe9i6V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:BnXRx6oqr47nJWi6vWOVlqMaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:j/NPdWN0544opu5DdyhW3xBOWdkZKlLh7XCMKAiYJmBNR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AjHix4g0T04dFv/NfxrYNvA7fgzUjxL20Cl0GoMo?=
 =?us-ascii?q?6sfKqEg9WayyG1zDre9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528982907"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:05:18 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 04BD018000592;
	Tue, 29 Sep 2026 04:05:18 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9C122CBF201; Mon, 28 Sep 2026 21:05:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 2/2] vim: set CVE_STATUS for CVE-2026-51401
Date: Mon, 28 Sep 2026 21:05:17 -0700
Message-Id: <20260929040517.330335-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929040517.330335-1-hthakar@cisco.com>
References: <20260929040517.330335-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246807

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51401 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51401

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index afdb46b4be..d299b7a5be 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -51,6 +51,7 @@ PV .= ".0340"
 SRCREV = "6addd6c101117706bc9b3609d3a418e26e92618f"
 
 CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+CVE_STATUS[CVE-2026-51401] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.6


