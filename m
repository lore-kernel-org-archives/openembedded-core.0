Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60488C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:57:11 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8173.1787734627781901674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D5f6mKDL;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1303; q=dns/txt;
  s=iport01; t=1787734627; x=1788944227;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2eKpRbuM8bNLwKiHZQ/46CsHTot0Jg637sfjSPPeq9w=;
  b=D5f6mKDL+r3oyf6zRu2bqftYFMHAhH1idDi2/Ch/9t1gTvplxU1EGaQ+
   +pSMaPKxjqsTh+I0QwPDO54O37TS4UlrtJ1OqgkyQOgT0w0ZYLgFHb2Mh
   akQAIIp3fLfHeWV6USjrjzlMWe0yvN6ZUyjMPk1SH7mfz4YK9Qfiv5ceq
   NsJYVRzAnV6mg/mlpnOti/pj9HLY/ie8m2agNkGRsGUt9OT1AJJV3m/ba
   c1oXjQUTgHRMDU9sIuH/TrD3aSyBvAlsBIMwodS+6G7LNro/vhfZwZ7AV
   WVi7XROZbMtDypTxHtnWSl/tnbn6XbHv1PuHoX9s1NXNXM0FwS2oM0xxu
   g==;
X-CSE-ConnectionGUID: 0OOBW39fQyq8ELPUXaklhA==
X-CSE-MsgGUID: l6aWN4IGQ9+FTJrvG0liGA==
X-IPAS-Result: =?us-ascii?q?A0BCAgAcqY5q/4oQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO/EYIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CKFcicbG4FyhH6EF3mFeASCIoEMgXiRbEiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFAgFJQ?=
 =?us-ascii?q?w4HRz4LGA1IESw3FBkEPm4Hjm0fgk4BPFEZgX9ck2CReqEPCiiDdowilToaM?=
 =?us-ascii?q?4QEpmgumFqCWaIBhGmBaDxGgRNwFYMiCUoZD95cJzI/BwIHDwKTcQEB?=
IronPort-Data: A9a23:UwumWauFQ/15PLYcOouXU2TvjefnVABfMUV32f8akzHdYApBsoF/q
 tZmKTqCPviDZTage9F1b4ix8B4OvcPWy943HlRsqCE9QS8TgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwosFQK14Vp
 PIhOSldQzS7utK/w7a7Y7w57igjBJGD0II3s3Vky3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQd/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KobXHp8Oxh7Gz
 o7A12CnCy48aP2w8GvG3E6OnPHgxSf6d6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:7niTCqy9U7MadDeimwNzKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:MCS9PW1fxhC8ySB4JVljDrxfQucCWEKGnXnpMlboJEJRdY2cSluQ0fYx
X-Talos-MUID: 9a23:wKtUNArVsONNJnjkSJAezzU8PfhOv4WBMRFOv6kkoderbShxFB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="825323006"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:57:06 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id B1D82180003CE;
	Wed, 26 Aug 2026 08:57:06 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 4B774CC12A6; Wed, 26 Aug 2026 01:57:06 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] openssh: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 01:57:06 -0700
Message-Id: <20260826085706.17841-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244382

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE. NVD
deprecates each openssh:openssh record in favor of openbsd:openssh, the
active dictionary CPE and configuration identity for the packaged source.
The deprecated spelling has no exclusive CVEs in the frozen backend.

This changes the generated product identity to the active exact CPE, but
the frozen sbom-cve-check database leaves the 137-entry CVE report
unchanged, with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.5p1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index e4b6ddef9d..b0d7962063 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -43,6 +43,8 @@ PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
 
+CVE_PRODUCT = "openbsd:openssh"
+
 USERADD_PACKAGES = "${PN}-sshd"
 USERADD_PARAM:${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
 INITSCRIPT_PACKAGES = "${PN}-sshd"
-- 
2.35.6

