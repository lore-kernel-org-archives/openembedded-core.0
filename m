Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2C6C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:23 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34945.1782730092615112411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iCxD7TTi;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1949; q=dns/txt;
  s=iport01; t=1782730092; x=1783939692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TSnukYQIcd+/W2tgH8+YHy6KAAyWU9lMPYSbir39aM=;
  b=iCxD7TTi34mlihO7gn7y5E9+sXs6z6MFEF2fi8v6zCuAfH//Zqd4Uirm
   bPLhJyh354MTFn9AsNvRdor/Kff1VP1AudRqJS4J/J13qrnZBxwCLXeyX
   Fup+lIcULq4BMtGXI1Zk3E2mlQxfWADUmYEa9/Jc0huN1/kaSaGqAzRSY
   pJ0+9PtjK08BZ26nCH22K0C4tGeE0+4dVJ0iMx81vjbYaoTMNZ+afq9Kd
   Lh6ghyyG9lDVRAMjVS2klmCchBJkM/rVRnM843XlfaZtuMnUTzrB3t8w/
   6pWhhlwCENRnnTqRTUUW3z+9rDKmrgYOmD+bWtyypUv2oXPMFJaCvW+lP
   g==;
X-CSE-ConnectionGUID: kXwAtDQcT3OsMZ7dVSW6zA==
X-CSE-MsgGUID: QR4e+SRSR9Kht8SmZ5l1OA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBFTEJq/5L/Ja1aglmCV3RfQkmWSwOeG4F+DwEBA?=
 =?us-ascii?q?Q9KBwQBAYUGAo1LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyARgBLRAgMSsrGYMCAYJzAgERBrYPgiyBAYMoATEFCQICQ?=
 =?us-ascii?q?AFQ2ywBCxQBBYEzhT+IH3MBhHwnGxuBcoQIdoEFgVwBAQGCLIV4BIIigQyBe?=
 =?us-ascii?q?I8RSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BaYEEhH0jH?=
 =?us-ascii?q?wM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPgj1hLSoCB?=
 =?us-ascii?q?IFoUaVloQ8KKIN1jCGVOhozqmyZCI4KllCEaIFoPIFHCwdwFYMiCRY0GQ+OL?=
 =?us-ascii?q?QsLg2CBf4RBwhAkNQIBOgEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:oZ0mp6D2FOeu7BVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGwk32RVm
 GQYWWCDM62CNmP0L4xzPYSzox8H7ZfVm9MwOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH/i2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwMVxJV0aBIYkocFsJFMR+
 cIjF24fR0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FEpieaxb4eMJLRmQ+1spBqV5
 Vn8xF6oIREGZOea+2eBq1WF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:p4niT6yIIzZau4ZmeiNYKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AM330jmlgHh37umnjZiEQM9Cdl03XOX7t017MD3a?=
 =?us-ascii?q?zNT1OU5inFlOuw5w6geM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Awmt5jAzQu2ZuZpYag+OptiJXYZaaqJ2UVE1Oqq8?=
 =?us-ascii?q?9gZinNTAgADKv0TDuZaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="501647516"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 10:48:11 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id A0C1C180004A0;
	Mon, 29 Jun 2026 10:48:11 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 4BB98CC12A7; Mon, 29 Jun 2026 03:48:11 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 3/7] curl: ignore CVE-2026-5773
Date: Mon, 29 Jun 2026 03:47:53 -0700
Message-ID: <20260629104801.972184-3-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239748

From: Anil Dongare <adongare@cisco.com>

- CVE-2026-5773 affects curl before 8.20.0 when an authenticated SMB
  connection can be reused for a different set of credentials.
- In scarthgap, SMB support is available only as optional
  `PACKAGECONFIG[smb]` and is not enabled by default for target, native, or
  nativesdk builds.
- I also did not find any scarthgap metadata in this tree that enables SMB, so
  record this CVE as configuration-not-applicable instead of carrying the
  SMB(S) reuse fix unconditionally.

Reference:
- https://curl.se/docs/CVE-2026-5773.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-5773
- https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-support/curl/curl_8.7.1.bb

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 5d0133f605..705b00351f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -53,6 +53,7 @@ CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of conten
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-5773] = "${@bb.utils.contains('PACKAGECONFIG', 'smb', 'unpatched', 'not-applicable-config: smb support is not enabled in PACKAGECONFIG', d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.51.0


