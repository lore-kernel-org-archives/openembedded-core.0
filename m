Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C487CD2FEC0
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:04:41 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16604.1769533475131063797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 09:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rlBA/O2H;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.71, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AknCEheHP+Y8O/Pe4s+MYnSAd+8kELLpjs1Ib8hzVuWJT7AxfcFHfpYo08nyDj9lxTv2wDdTQHJimM4ojqCk07XXLcV+z92RMH6pc7tqQCSxFCZGVi3iQHZ3Iykc1WmCkftCJFFFG922N2EDOcF4x26DnwdaWJvXNrzhDkxFULLluuZeqO3ksQXC18gL8atc3NE7A6gDRooJELxaqadInimJFD49UXB3jU1Qt5O5/MWLWhep/k3sXvPjT1WdYOv9+s9SgZSAmax7W5gAtwh3B/atxZU1Q42ZCqcBwHnnp+7V6SGSbyDu9dSUfuoS0wVFXjtXUVofeXFe/W427NGKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzXWbsUFSM8Q0H4N4pTUPsk38AncqG4AjnDZxjxm/pQ=;
 b=M9IZgx2GQFnQgrZx3Eko6LAZv+vUOySS4n283ewx6FEO0eRbgyLRbFk14akax4WHBET9QmuF+SaPC70bW/4j6gGfdCI+kVkkm72S27F6eaQxCf9ae8iEK8WEuBmzEmyTb40j+gxIuZimhLtJ/I+0CHoLJhwMlwfibjxeh8SmxNrjJMhqAhL7jT38++KHrrfNU9A4Agxh1D14N2qmycjL111rqJtabXTqA2cpUDEjtrBEbWgvm1PirWsuw2/r4cDYdTL0xGnS4isyVE36V+02ix5F8L4arpButOmxSuIX0sfYbvi/14VC9kNZadnlsyutoGRDCEYqPFC2OzrOFt7Y0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzXWbsUFSM8Q0H4N4pTUPsk38AncqG4AjnDZxjxm/pQ=;
 b=rlBA/O2HrOhBz+La5dAZM7en61TZxUD/qXErQV8AAxAFkR83Zx+qHb2RL9Zv6A6kKcKpUBnivPEFgTaHlde27B6t6mi/v2x1pEdeTJKOjXBvLxhq548yh9ioLs/oxJ3sdFS6pXI7Fdp3SBrcUsN2LjdLmy13V3F5daGw9mU1NHA=
Received: from SJ0PR13CA0185.namprd13.prod.outlook.com (2603:10b6:a03:2c3::10)
 by CY8PR10MB7196.namprd10.prod.outlook.com (2603:10b6:930:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 17:04:27 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::68) by SJ0PR13CA0185.outlook.office365.com
 (2603:10b6:a03:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 17:04:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 11:04:24 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 11:04:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 11:04:24 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RH4OHl849056;
	Tue, 27 Jan 2026 11:04:24 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <changqing.li@windriver.com>,
	<richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>
Subject: [oe-core][PATCH] go.bbclass: remove macro prefix maps on CGO_LDFLAGS
Date: Tue, 27 Jan 2026 11:03:45 -0600
Message-ID: <20260127170344.2960247-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|CY8PR10MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9b4d31-7c40-4846-5925-08de5dc61ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K08eVnOGDVS2KQs6IIDKMGkaY2s5VXC8UDdWHFD4v45fFNMJeA6EUyUjPTol?=
 =?us-ascii?Q?5DYo0bOFSF/k4hDev8Xl2KhFIMOXvyMbXHef+ZD7Hq6eBKgETpL/qI5SN0lq?=
 =?us-ascii?Q?g2o8kONZv8Ik+ksvI46hXkUg0+nmQHxpMpQEfNQJOD6uqhZcFUfStr4X5aMV?=
 =?us-ascii?Q?jeHo3200I3/5fAY5yz2BCFqaRakFIED05bZ1niOHMqTn1lNsf7bE27Hmdn6Q?=
 =?us-ascii?Q?HODnrPwke8KI+RWNj0yntL8VIbFVyJxroxCkfNgHMX5HUSyd7hYYzeu9VLP9?=
 =?us-ascii?Q?imgJ1WEypFlcWYsX+5y+bOtT4uaSHnXKSq7N7diUH6S5p48y4ZxkrUM4KScB?=
 =?us-ascii?Q?/Im8XsddoU+SDqK0abNAxZ9T4ZodSwxc/qz83KDXuGJFDtWN7Wl9MrKnYKQ3?=
 =?us-ascii?Q?x+gtio4Od2Uizm2n76+rpNqm/LVL1lZG1wvpUz8nmeuJOFBwhF7sfUnCk+4w?=
 =?us-ascii?Q?R30Oy8x3iZmEKAte//rPoKAdHSH0Xu4wmcy8rkQaWCF2nKYEYPT/etAPuBOH?=
 =?us-ascii?Q?Fn1fleM176H1IHyiIy2MmFWOF0SlduigjBh/wVPaLr8B4ujqPa9mwo8VZlN6?=
 =?us-ascii?Q?zdawy0+kPoTnGRCsUdozsPGFF7AMaxJ+pdJTd4ZJX4WNqnPImtToAd8zUdaK?=
 =?us-ascii?Q?342CwBqONXRYmjBDRQqLPMOorXWPOzL/e7lR2eHNymxr8xJeJRjxV2iFXWhW?=
 =?us-ascii?Q?vozW3tcB3yiiIdSoINnXPswDwWSmcli7ey30b4U0dbnmA9wjopaxkxD2haGm?=
 =?us-ascii?Q?5Vda/5lKWpKvdpui2ndpFffKljAOoyiRjX+KGVatGDwSrruZ7ND9cQYpXw8W?=
 =?us-ascii?Q?hWYE67QsnVNUiay6wfoHuv75uMLNRWKuIAP+9czy19sb4Be8nt83NC8EAv/W?=
 =?us-ascii?Q?CWwSoTAlxJNta2AZUgv9CXwgLyVT0cSHV5ildEaXBTb/PM0zAtccbiSRHku9?=
 =?us-ascii?Q?Pe0xxN8DXB7FUv4KiCSgTe4smxe2Tp3VtpZ7rbSw9wrRfx9TqokdnxQZNwdP?=
 =?us-ascii?Q?KRDWp4fQR8tBobYfl3mrW2oeqQbwGmUzu4Qh5dasf6NESh6VKiHqlNc90cQy?=
 =?us-ascii?Q?CLBuo3l06nepq2wzzFjTMpYxCGVNaiGmn0ifKJX5BX/1LPgcrI0KJRp1vh3u?=
 =?us-ascii?Q?asEX/TFW7ysnrTict7wbYkGzfJSNaO63IX5jgsBS+2CIPWcFVN2/9kQScEYs?=
 =?us-ascii?Q?qiXfC7YQX1pqR2N8PVx8eTMDraJHoWBmFvDSAvBkDhI/6fNUqclN3fVu3xea?=
 =?us-ascii?Q?JYJYGpAmuTshmmwr0XyXTF0Rim3qA/+8pJ8nnkh+DUAgkW+k6T0EQLHJsWE3?=
 =?us-ascii?Q?2MPi/sGdXFI5jkz4K/cc9SxFdJDHxRf+zILXG+XCEFBoZiW05KYSYVR8xOK2?=
 =?us-ascii?Q?DERdRfEe87YXshJo5MRhjJjQOi+iZWQhBWu8TtYv4ACgn1ida4xYERx7hIPU?=
 =?us-ascii?Q?C3Ov9bBeXPj8Nlpsc9byMvvMm842tdPJCyDUyobOixHyj9feUG/7KxbMgzsv?=
 =?us-ascii?Q?To0R4ATe2I/JeumiHMpWnvrttlHYKTT/syKTL3CHhPsy7ecIXyewGhCh1uM0?=
 =?us-ascii?Q?XM5mkvizFGsn+JX0eDHRF9K0M/iHyhqXDX6p5gWGzVZP5QZtGQvuG1gX5x7B?=
 =?us-ascii?Q?mVyShilwp8NZtkoHTm2XLQN3B8UopxCsy8tDou53ggaYrGHDhjm7Z2rqXjir?=
 =?us-ascii?Q?F3mTIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:04:25.2839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9b4d31-7c40-4846-5925-08de5dc61ff4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 17:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230059

From: Randolph Sapp <rs@ti.com>

Due to GCC behavior with LTO, prefix maps must be passed as part of
LDFLAGS for binary reproducibility for some packages [1]. Unfortunately
passing build paths as arguments to CGO_LDFLAGS changes intermediary
output hashes (content IDs) during Go builds [2].

CGO binaries do not currently support LTO, so right now we can safely
remove these prefixes for anything using the go.bbclass. This will need
to be reevaluated when LTO is enabled for CGO [3].

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
[2] https://github.com/golang/go/issues/77086
[3] https://github.com/golang/go/issues/43505

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This also unblocks the previously posted emptty series.

 meta/classes-recipe/go.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclas=
s
index b540471ba2..7dbd66c5ce 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -71,7 +71,11 @@ export CGO_ENABLED ?=3D "1"
 export CGO_CFLAGS ?=3D "${CFLAGS}"
 export CGO_CPPFLAGS ?=3D "${CPPFLAGS}"
 export CGO_CXXFLAGS ?=3D "${CXXFLAGS}"
-export CGO_LDFLAGS ?=3D "${LDFLAGS}"
+
+# remove build paths from LDFLAGS since this will change the content ID
+CGO_LDFLAGS ?=3D "${LDFLAGS}"
+CGO_LDFLAGS:remove =3D "${DEBUG_PREFIX_MAP}"
+export CGO_LDFLAGS
=20
 GO_INSTALL ?=3D "${GO_IMPORT}/..."
 GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
--=20
2.52.0


