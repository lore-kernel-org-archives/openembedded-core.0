Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B3FC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:16:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12400.1788524161986165903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=j7kQ0BjV;
 spf=pass (domain: ericsson.com, ip: 52.101.72.63, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQUYbrEMpYYi9Ki7yWIjS+nXDmdU/wxHwwlaebp3a7yJNoeHVeL4xaKHiqx1hf8GBxNzXfFMymCwrUIqYfrwfsrn0JLkQtIbRxSGYcgunNhU+lXDL7w22Y9PBPJC8GbK8o4gNfOmO1uBUB/5plhxiD9yTAxnGBQWMLu42o+Z+Q9MMcd7CIsdaEaWtUwOUB/DHDmWbpTldPs1SbS06ZWdljqdOmMjckVO9vnrTo+3aCUtPUCOvoztW166+vjKAr+XWq3ljBpSXorxVlEUWLW7MbQPynpkJCqViUfOn9qhfQJ2KWt/kVHhdD7fW0R0tcAM42gzhlHdob5rXrvA1OGVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxMOjZQshR0cI5jVkRrf1hau43GVOrWX4xDyNmIgdDo=;
 b=M97TlKKRRis2GiS/5KRDbCks0y6eczsk8P6I9PAClMtEFGLdO/ly5qKQ2vqQKm0zJVhpeQzYjQW2dF2dxOwIWhrWDLxSBM9oH4yVsEipEDMnOy3ASjvNVqU3RWpkDBENTlCkQCy5HxKlIcAYglq64siMlLBvM045XuFUbRuvexYc5B3nP4DkDz4mdEec80So0i7YERYnWD1YDd6FD5pEBR1UoGMnMFnTLKcHK7qR3ALlkbJx9D9OULN3SQEIg+mNXbKDjNpVH5tujChTUZOBLimA67XILTpB/IY6c4SJZSodSlRdStQGLcEQMm+keWMDcPOwYZg04HWc2k901pFC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxMOjZQshR0cI5jVkRrf1hau43GVOrWX4xDyNmIgdDo=;
 b=j7kQ0BjV9S83xczwvwN6wpBNPHbUBvSy52E/CzGViBLHzHgDyQZJrcd4NvJNtvAcfNJ7qB5uvY7XjI804JZPih6wFg0LP4wIXzA+1Vk02BsqsYcGuxBuWZLu1IpNb56gQDjmZP375BfMCyJL7nWoIpAut5ZaJ/71cT5qjns1/ApkCS6CzfQoSgeZe3O9/9kHn8PVaRn+fPpHJAcwOuT5imAaBf9ZUSAKRUKrPR4Riglz3d3oc1BtysNKY80gqQUfE7MDDQD/veWE4jA4rlMoX9w2EC5fNfMyyS/Gov/6UNvf7Zi47H1JcZpXuj9duGvHovXpPaERdlcwKn6YwkxRhQ==
Received: from AS9PR06CA0396.eurprd06.prod.outlook.com (2603:10a6:20b:461::9)
 by AS8PR07MB9567.eurprd07.prod.outlook.com (2603:10a6:20b:62a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:15:53 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:461:cafe::9f) by AS9PR06CA0396.outlook.office365.com
 (2603:10a6:20b:461::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 12:15:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 12:15:53 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 id 15.2.2562.37; Fri, 4 Sep 2026 14:15:53 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 990C340E636B;
	Fri,  4 Sep 2026 14:09:36 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6D070700CF25; Fri,  4 Sep 2026 14:09:36 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH] libarchive: mark CVE-2026-14164 as fixed-version
Date: Fri, 4 Sep 2026 14:09:16 +0200
Message-ID: <20260904120916.3609491-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|AS8PR07MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fbf0f1-6ac8-49c5-af44-08df0a7e4418
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|13003099007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1u3wfuRvDbCp65C6xl6aBPVObniUxpQCt5b9tmWc/UzXittLRXLQwfHpz198/IR0ltVbo0syuOMvK6L2X23ukC7yINsCcQlvIMVjpyaQf9RKoUEBeddjs/K37Z7Z2VD4tHeXkHDfs81jIp8gYpmSMFsRe4EcZ3xyW++JO6vdCgoE0xbqlJqtZ64+x9dpVZ9D6ogUbZOPOcGfB7W4O8yx60bqx8PVwtfM6gRpoKrgXNKnO0lLQwwcU9ogC/0WAQo+Hlu6aSaOAAOpU38CA6NRkV8xWQTFpoYncEk/AdJ47BHl+cl9GayiFSTDf4E8GlgMGogX84nBmVpS/7P0z57wo+C4WKwL3RWDN5ksOX7+44ztn2SdpvG5Y1/LyDVNEvdmsR/CMmWJU8uS2r/pk+EaTpjomQ28rGuXsIJBPJXfrwI4tNWg/yz9LvRunUJrx8OGFAP17yxmnh9PL21J35CB1X2iAfo/e4gs8t0qqlwZi0dT+OGpRkMOmD53PgekYG/+d2e4yojLFJJ6Hr/TJveSR8tVFK188VLXLEJkodYYVHwfnyAmXhsCUVBCK8BjNDNSAsa6oTzV4x54pLvJDybYU0qYmBLq8v+VknrP+FgxPYTzM8dxMHQI+ym46z4TpLjukqZVFVNNpi1smfdvIjkkEPY2QwiI06W41RPOc4cnBG8=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	02FYsdfxPP4gyNkcGEQvxh2p/xc+fSQcazkbDcFOEFJz3SU+FPwXe4afbgD8ufqy5MS43e/Qz2QTCA5LB+LAZUxkpE+RXs+Dx7+tqZYm7MoH94p7YCkQ93+hs3k6R1Ap/T541E0FWRQr6UOU6vGIODP0RYY1vn1zzyyFH1wiWkDyf2kxFlL/hJ1jMhYBpu/Zrij/uEJDc4INKEg7NlD3flz45PsbQWPBhYlScEY5y2MhdULaowWn/DNQ9EqCvW6mV2SToo8VIx76Im+jRLRXgm2MRGM/0Yq3scHf9D8Vp7oHTYCiCRhwWjoLLDfUYmo2f/zktgmibDTch6vITdbO0pSdAlIUDv3zeoTos5yP4m9PXMfUQiPcKpeIFthVDPt9JXcqYeAV9hvwgcVsziEHCr+/Vp4OjAcatKs+ix0PDWGeSh+HJy+IMnZmcZ1Uu5oe
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:15:53.3867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fbf0f1-6ac8-49c5-af44-08df0a7e4418
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9567
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245093

From: Daniel Turull <daniel.turull@ericsson.com>

- The RAR5 double-free in init_unpack() is a regression introduced
  upstream by commit 620bdafa on 2026-05-16 and existed only
  on the git master branch until it was fixed by PR #3071 (commit
  1c914cdf) on 2026-05-24. It was never part of an upstream release.
- The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
  init_unpack() with unchecked calloc and no early-return path, so the
  freed window_buf/filtered_buf pointers are never left dangling and the
  double-free cannot occur.

References:
 https://nvd.nist.gov/vuln/detail/cve-2026-14164
 https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f155ed4=
f880d072.camel@pbarker.dev/

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.7.bb
index e8c3a3bfe3..afc06f85d4 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -92,3 +92,7 @@ RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio"
 CVE_STATUS[CVE-2026-4426] =3D "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] =3D "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] =3D "fixed-version: fixed since 3.8.6"
+CVE_STATUS[CVE-2026-14164] =3D "fixed-version: Double-free regression in t=
he RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-0=
5-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf,=
 2026-05-24). It was\
+ never part of an upstream release tarball."

