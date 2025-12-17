Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0490BD65C45
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:07:07 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.86])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14441.1765976820173048158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=MnAjyuhZ;
 spf=pass (domain: phytec.de, ip: 52.101.65.86, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNrdAP5Su7r5/HUfhPukD+lBTe2uvAz5E+kDnJdD+HJ0lJiVK/YFOrDM0E/n4pxqrD207l09ceso6HqFB7MFAQPZ0QFSQQtSdaEyDsJfAn12/c3kwCWagRg0hybQfz1b5esBzs7QB7Yrj0gMkls9D7veQndNxr5EdqT1mHhhXbFpeQzPcKACmhNwGg3niAHG7vk1i5aQwombaPY4/rJ+03I07+F8b56z/YczAfW/3yLkcL0QH85Cmq1OfvJhHlAUMShPbOl+8BCVFR7PGXFFko2ZG/fUQS8O+66L/jJJ5Mngq3ud/U7DKy2LXwMCTtHeRkXTp6S1rqpveSoojrDLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cJ5p0nzvdPQXeTH9N7zPF4a1k1l69RwOJg6xENLNqw=;
 b=MjXo+4l4S71l8Mzo1kMR+2+qcJyZy6gSweJ2cp9qKR7Jm+gz6nsFrnoFQURUCr9Dcs4PclAGBT1hpIIhT3QA2DVbH6OXPDKxiW9Q4T6GZWyJLwXy/YLELSUicZYMF/2PHOv/C8kBqWQa0Y+DSBXHfqRg4PyW/sE4EQkN/LYLcXWRnYwbxu8fs+4T9fYOYwn4OTF4rmGSNmFEQWAQU62Xd56wSFkW25bj6p5kO7g8AsZEfQ4ArVwlY0IJ89KSBlF4SFhNS/3nodhiYAM5rdabule19YMen8sVb3mzYFsgZT3v12Xt+41hSMJUE7TtiLkFEtXacwNJev7HnZedfIM8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cJ5p0nzvdPQXeTH9N7zPF4a1k1l69RwOJg6xENLNqw=;
 b=MnAjyuhZVD0guKzruyJl9wlt0QMCDQcghPRYDv/0l+AFdoXz+mifPobdwdaBuqzK3oe7pq/wLqWBCxEAW9RkXIQ+qTwgIphBzYrMsqYlPI/DEPSIP8lWYIFCavI8agmoyxBAQT/iKG4RjhxRYwA7VBfsRBmL8lF3uXTx2BiqkhdZH57/qkxpsd57GkYAw3QJz4Dj5d2c9/dLhuTa0k4dGh798toM7zybkCwqaA6jfg4Kc5DtA0Qikz6pF1PWrDE+aKewe1VANm9T49PKcgBY1kCtFDIU6IzYBSg5UQuYkFMgp9sIx0oI9QH56bbGfCsjO/yzo65twx9rSSpABIGIGw==
Received: from DUZPR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::26) by DU2P195MB2442.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:46d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:06:55 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::1b) by DUZPR01CA0144.outlook.office365.com
 (2603:10a6:10:4bd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 13:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 17 Dec 2025 13:06:55 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 17 Dec
 2025 14:06:54 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 2/2] cargo-update-recipe-crates: Properly close target file after writing
Date: Wed, 17 Dec 2025 14:06:44 +0100
Message-ID: <20251217130644.2710575-2-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217130644.2710575-1-m.schwan@phytec.de>
References: <20251217130644.2710575-1-m.schwan@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU2P195MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: 098d4af8-1a50-4f8e-412d-08de3d6d2769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?01i7br+85GIhb7s2i74juvetAPLwOjufi6k7oa9ex00xP4HLfrol+eDw7HeF?=
 =?us-ascii?Q?43lQ3bA66b3G1rZZ+SQekqBzMGH3RkosGkolijugE9/4cp1lExky/XuIVjYj?=
 =?us-ascii?Q?E4WWfxVt0Iot1k0go0RAl5pKX0lx/q+CAQfzO6z1F5TwEl2tf9j0x3czoOLn?=
 =?us-ascii?Q?PxEmry8y6gYn+YZEVntKdt2vYaUNIRCOMGTgurcBfQUCG4rFqI4CDERw5/PI?=
 =?us-ascii?Q?Qd+CBs5Auj2VU3xS1JrLhaYRX+VtZP1EvZsFkF72N/Kl7g1SHEvkEGKLFjtt?=
 =?us-ascii?Q?EN1A40UplA0UQ37308S69Vp2AImkcmtvqDRwy3FampZ0YxNXi209f+E65ipO?=
 =?us-ascii?Q?pjYAdrDD7WTTuvAlDn5i//auElQNSyZtPkwxe7aOmnwwr7SBjIzCEMXmGkro?=
 =?us-ascii?Q?3jYp9UpiHiAkIqR2z2rTqynDI1u1w0N4HsrK8yOYR41BFvFHWbrpN3qoDsJJ?=
 =?us-ascii?Q?psIjmgJjMgZ9Lxw6JjNgN9o9RMg5tYyQAmSIOquRJwBJ9hjB0dc7ZkBusKrr?=
 =?us-ascii?Q?CdBVbxhQTOSR3Yw1fTSYQ4aTq/aVTcgOSw9o76jQu+/034X7NMwlitjPen5r?=
 =?us-ascii?Q?tqyq0Kkv91NFbnesFZpHA+SPZc6Nz7Dcqj7AcbCjvTjuVAyDQEYxIWvm3xtm?=
 =?us-ascii?Q?l3RSPxXypUkWLTwxrLt3uWHkIiIsqNLLbBjLAiUWuUaf2ov7ck+5Gk4ZkZWB?=
 =?us-ascii?Q?YYTiZKMl9CE6zgyF/BjMsNcseO/aVATe3KAXXBzHZfWTDIqpETnr6ZX5Motb?=
 =?us-ascii?Q?sb3RI1rVTH5W8LOdiw6w9QzTljE+INrqZs97h2CO/wVBGfu8j/vBABc0cT00?=
 =?us-ascii?Q?fvFC3cmIr/Fb8nm6x0Sxu3GP8J5ueAfV1QOBjr/k8WayLFM60cj4/FyxAta7?=
 =?us-ascii?Q?4xT5KB8p45u9uTLoGbrRQP5nX2Y+LbGQuOAy5UxohRyWaQMdTXmp3nfQ6tAT?=
 =?us-ascii?Q?KFn1D5zVXtZwSKYdSjc6FJY5ETFm9yvxQvppoEgVZlb50KGArnHrfNh3DfPF?=
 =?us-ascii?Q?uEU+pxGvJdoiyadBjOjegYh4A0MCLMcGYyDMxl+F3+bhrKljSd1RfXt5I75m?=
 =?us-ascii?Q?6r6GdPCFHnk0V+d7MuHdC9RQ17XgD+pQ1zgvUnGi3/9qS7brIjpEHOOcKXgU?=
 =?us-ascii?Q?sV5j5ntvCuSAf3Tudv3aNELwvi8VlLOaWwPQEiGsZ1qjsQiYO6xBVvb2JENR?=
 =?us-ascii?Q?KxAwPI3qcmSTQZaaVvmisk4GFN9/Ovcr3inD4b0E+XCRYwfBsBFCFrbikAn2?=
 =?us-ascii?Q?81gPX3xpoKZAThONyndyGIEEQNa5RIh5WDXjb/QrrM8MJR2kUy+CzzCmVn0I?=
 =?us-ascii?Q?Gv3Pg4CrC/N/Z2M/ASXlmwQHpL1+qYcN+eHK9UWA25erHj5icbFFsd3wmRaP?=
 =?us-ascii?Q?Vj/l586j/ezZ+UTyHQelDq3ug190NhdLer1h+/wIF4CA3xBVuymk62lOB/sH?=
 =?us-ascii?Q?yV8gQrNai8xAtfvvL/Zj55dystp/nXDjf87gL9OPn4xzxWHbREkOMdsExOmk?=
 =?us-ascii?Q?SSID7c0uDMB0yYYpWE1K5+pt+Ha+jLAT5vzj4r1CDYuwYTk9WpxdpSm/Gakb?=
 =?us-ascii?Q?VEQhiuzKhINEIsBL51o=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:06:55.4362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098d4af8-1a50-4f8e-412d-08de3d6d2769
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P195MB2442
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228039

In do_update_crates(), properly close the target_file after writing to
it using the "with" statement.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v3:
  - Revert back to piping Python code to native Python
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index ffc658f0f1..47e845c822 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -72,7 +72,8 @@ for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}')=
:
                 crates +=3D c
 if crates is None:
     raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DI=
R}")
-open("${TARGET_FILE}", 'w').write(crates)
+with open("${TARGET_FILE}", 'w') as f:
+    f.write(crates)
 EOF
=20
     bbnote "Successfully update crates inside '${TARGET_FILE}'"
--=20
2.43.0


