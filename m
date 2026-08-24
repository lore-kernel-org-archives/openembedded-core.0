Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F16C61CE4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:05 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14070.1787569318262275169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Bpz1lDBM;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1148; q=dns/txt;
  s=iport01; t=1787569318; x=1788778918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TPkp79Xp6JAgWnKCbPHS1tzvKPNI3Cp2spKVCak79NY=;
  b=Bpz1lDBMssChRJO9gwqMclHDtfG/2sFbHDc4oci3I2//9by9DD20wslY
   t1kU2agw0KEIBXR9X5XLlYmKucRs0VqC6StKP72GeKhDEp9NBTG/KCGUu
   ZeaWPJpFpUtg8G2MggxDvc2B2yqRnr64GzoA4pYG/lxyMX8Ex15gDxMMG
   vS6O5V6kWlUElJSdKFVH9l7MAVKN0Qei/Nh/5AqjMyBlMJoirfRiG1H7t
   4ZCazsPQXY3OjwgNgjQOMQb9JyaAADhTpTZoEfjGCxcD6pRUdnNgUnDJ3
   Lh6IvkhH4UiKAq8NblFPDzLBNrbY15DOaVJZW7FLwX4T0bYuiACaLdTy6
   A==;
X-CSE-ConnectionGUID: m7DVkhPHRQSjgIxGxl+YuQ==
X-CSE-MsgGUID: ZCmzpO/eTVCG8+q/DQXitA==
X-IPAS-Result: =?us-ascii?q?A0BBAgAuJIxq/5IQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwIBgnQDwkyCLIEBhH3bMAELFAEFgTOFP4gihXInG?=
 =?us-ascii?q?xuBcoR+hBd5hXgEgiJ6EoF4gkyPFkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFAgFJQw4HR?=
 =?us-ascii?q?yILGA1IESw3FBkEPm4Hjl4fgkcBPFEZghaUJZF6oQ8KKIN2jCKVOhozqmwum?=
 =?us-ascii?q?FqkWoRpgWg8gVlwFYMiCUoZD95cJzI/BwIHDwKTcQEB?=
IronPort-Data: A9a23:JwV5R6khVzm7kZB5QZPD79vo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWGqPO66DMWH8KNpya4q+90tSvJaBztRmHVRspSE1EVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsf7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYhH1th0AVluz
 8UjKj8sfj+Tg6GH3YvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMKoHWG58Oxy50o
 Er01GHrGjZdOeCh4hXVsWvrqtb/nD/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:TFwU8K2GouLvqU4iSj0JhgqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3A2F4YPWpiZ6y7VQvdw79SLhbmUcV6XkPezE/wGXa?=
 =?us-ascii?q?DC2lIWJKFTRyh5Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:M93Gjwq9yo5rPfjGkz4ezwNJMdVwxOOjNH4mvsVFoo6oDBxxJx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="818546231"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 4F4BA1800016E;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id DDFD3CC12A8; Mon, 24 Aug 2026 04:01:56 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] binutils: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:56 -0700
Message-Id: <20260824110156.25702-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244086

From: Devansh Patel <devanshp@cisco.com>

The current "binutils" mapping generates a vendor-wildcard product
identity for the packaged GNU Binutils source.

Use "gnu:binutils", which matches the active NVD dictionary CPE, NVD
configuration criteria, and CNA affected data for the Sourceware project.

This changes the generated identity from
cpe:2.3:*:*:binutils:2.47:*:*:*:*:*:*:* to
cpe:2.3:*:gnu:binutils:2.47:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
with the frozen 2026-08-10 databases has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/binutils/binutils_2.47.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.47.bb b/meta/recipes-devtools/binutils/binutils_2.47.bb
index 79bcac2025..798d886614 100644
--- a/meta/recipes-devtools/binutils/binutils_2.47.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.47.bb
@@ -1,6 +1,8 @@
 require binutils.inc
 require binutils-${PV}.inc
 
+CVE_PRODUCT = "gnu:binutils"
+
 # perl-native for pod2man for man page generation
 DEPENDS += "zlib perl-native"
 
-- 
2.35.6

