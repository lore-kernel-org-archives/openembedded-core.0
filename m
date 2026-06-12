Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C73ACD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:31:11 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69337.1781267469884727577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TMjnrAy4;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1493; q=dns/txt;
  s=iport01; t=1781267469; x=1782477069;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u0bW4McqxGjIjc5bLNF3Xr//W3aCx9owai2+C7GSFVc=;
  b=TMjnrAy4Iz3zH6ch4ssrIVFWHpmeaUGlkP/Dv/FSZK37pWMbx+fkr/y8
   ZgQUA521yDijTB+USUQaGWrmthMfMzitkg2MMWGRWZ2/RkpRssQ0rCQR+
   pobHLRoRx4lUe4pGAOZFzizjP7cGT9Zoyq3AtPkPrIGlb+HvkDzqG1ikI
   T99s5xLsFwpTlmXLOpjrCOifWtSoq1CQEa4NtLW1OnCdhm4CWCObyWT2o
   6RRsWv6RvwYlpo61ur9eyml2Vi28U7fQO5rs4j2kqRnZc6GxQhp/oijua
   y2EwBtBpJU+19Z6a0PH+puYkvkF6NGDf9S2HVvWujRgOn57/clESunvTA
   A==;
X-CSE-ConnectionGUID: 6HGngQC8TvmPd1yg+qhppQ==
X-CSE-MsgGUID: 6aOsZbjiRjyMvX7zSZ4mGg==
X-IPAS-Result: =?us-ascii?q?A0COAwBQ+ytq/4v/Ja1ahTB0X0JJA5ZIoBwPAQEBDz0UB?=
 =?us-ascii?q?AEBgXEBgxSNQgImOBMBAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8Nhl02ARgBLTBcRIMCAYJzAgERsyCCLIEBgygBMQWBHtssAQsUAQWBM4U/i?=
 =?us-ascii?q?B9zAYR8JxsbgXKEfoEFhAuFeASCIoEMgXuCL4YVhidIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQwbBwWBSoEraoEDhQ0jHwM5f4F0gShnaRUwNYEBA?=
 =?us-ascii?q?RESAwsYDUgRLDcUGwQ+bgeMQhcPgXFNWigMLASCACgckwlXkXqhDwoog3WMI?=
 =?us-ascii?q?ZU6GjOEBKZomQiCWYsxllCEaIF/JYFZcBWDIglKGQ+OOIh+wwUkNQIMLwEBB?=
 =?us-ascii?q?wIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:gzsIi6nnyvKpkgv89NrxtTvo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeW2nQaPiLYjDweogjbNyx8h9QuJTdy4MyGVFsq3wyEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdM41eB4OEoey
 eIdEDxUfx/AnuKu2IvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKJJY3XHJ4NzxbwS
 mTuoW3eGSMQNt2lyyug7ELzlNT9wSbUV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:6nwwfqwiiRK9KBS/xQqTKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qBHnlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ArVT0OWtk923ix1PO7v7yQj+o6It7UlLbw077c3O?=
 =?us-ascii?q?mDF5lEayaCkaQ4Ltdxp8=3D?=
X-Talos-MUID: 9a23:i/GBVAXf3mfzm3bq/GHloypQPsVp2aa/LV49zoc9iZWBGiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="479513098"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:31:09 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id F26A618000203;
	Fri, 12 Jun 2026 12:31:08 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 9ED6ECC12A6; Fri, 12 Jun 2026 05:31:08 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH] apt: fix CVE-2011-3374
Date: Fri, 12 Jun 2026 05:31:03 -0700
Message-ID: <20260612123104.1230832-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238615

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

The vulnerability is a design-level flaw in the legacy apt-key utility regarding
the global trust model of GPG keys.

This is marked as not-applicable-config because apt-key net-update is
disabled by default, and Debian vendor configuration does not define the
archive keyring URI required to use that path. Ignore this CVE in this
recipe due to this configuration.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..ad75f3b32a 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: Debian vendor configuration does not enable apt-key net-update.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: apt-key net-update is disabled by default and Debian vendor configuration has no archive keyring URI"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.51.0


