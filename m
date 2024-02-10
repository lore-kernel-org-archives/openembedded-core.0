Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BF1C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 11:15:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.11788.1707563701136262575
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 03:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=e2O+r9pg;
 spf=pass (domain: axis.com, ip: 40.107.21.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ozqqs3r4ufS7uhZN8v/YwVp1Guy/MSe5+NBy5zHS1wUaMdYULQh0Qlf3EcHc+c7avYNvZ3i9yisTgfJf9wdBXx9EAUO2bsL+zNNYqzx696380DRpHgfHnWeZeTvJ/PZ2EDDxk8ZK4DTUBIvsz1kOdaGvSxDQpcQsLAetkHoKrMvepWMjyC8jQ/f9wqZPFZAGFI/iijSWXTekh0xThUNwdsQPz1T6xMnJ8TqYFZmsiMIaxvCZLkpeADopZ3CtV+zZ4haSPlQI+aKRo+CfkjEyqWSltEwY32kFV2vn1vnukC7lz9hPxFl5ZdNeRkHOkh9fDvurBg036vNAWjyVz1+z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/U+p0PdpOVqFq4U68OOmYukhsheqn9+suhNhhlyjOY=;
 b=jK4XOns0iJ/iVL3oepobX4Ljzg7IhNek0FDRh6qwbpfJeuuz6tFB1g+65ktUXZ/++MHMHx99QhsuxWujtLA8zyLJtK/wW52G51z7LyIm+LZZHh0rNWP4sQ0BaD/9bbECDCiRu7JdUbm8YL7iL9XG+Lorj6yCACDSO5CSmHz11No2aXddEX6qBLTxPj25RoHAe2aZPIhNaVm2eunRglIIuz75dIW/yeJmlWCOQoYVule1Sq5oj45BJt1VRVjXwaqNZWmTQDKxAIMqmb9LFxpFhLRk6wEUeRkfSAOuux8ASwyCnlPjbzMDcnlRAqoXYVwpvlxtxD+SyxKSN52m1lD5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/U+p0PdpOVqFq4U68OOmYukhsheqn9+suhNhhlyjOY=;
 b=e2O+r9pgoRLU0XKlKgisT0mRa9r0apsvpVuMZJVzxQXSEzNMJzDGmHbRSrmGLBQKI12ADGWSqL8ABE+p29u1v6mUY/EBoL3odmAAUVJphgFdjm3pn9j/j4wOwLL/GawoYY8iXe9MVEZqCVX/L/T+BztD6KEkYKzA2ciHIf2x+TQ=
Received: from DU2PR04CA0259.eurprd04.prod.outlook.com (2603:10a6:10:28e::24)
 by PA4PR02MB6512.eurprd02.prod.outlook.com (2603:10a6:102:f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Sat, 10 Feb
 2024 11:14:57 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::8e) by DU2PR04CA0259.outlook.office365.com
 (2603:10a6:10:28e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Sat, 10 Feb 2024 11:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Sat, 10 Feb 2024 11:14:55 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 10 Feb
 2024 12:14:55 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 10 Feb 2024 12:14:55 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5ED8D13B83
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:14:55 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41ABEtxS2112529
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:14:55 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41ABEsVB2112528
	for openembedded-core@lists.openembedded.org; Sat, 10 Feb 2024 12:14:54 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC][PATCH 1/2] license.py: Add available_licenses()
Date: Sat, 10 Feb 2024 12:14:50 +0100
Message-ID: <20240210111451.2112513-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|PA4PR02MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: df74c996-2333-4bdf-6b13-08dc2a2982ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hmwIM5/i8p8L7uiHIqqcbS8JXJOM962GV+5q3F4Wc96434fEPK47MmLpgR5TrepdM473rr0ZTDOOyztBWBO7rHG2JXVfPLcD+COxLaZHQXxFB4cUzAy+k8ozhvN3RsLKSTrXOtjxDmSBVY3N7Q4GIrVTLWkc7sYqdEfUMNQA2IFityrl9oC6g8XgFhhfqUB/kLM+mRwfgigznMcWwostnqp3nY55JFQVtcqxkLDHsydRjCsHHJNfiD02avB5z2oTGeUprsPaxGYaH+YlkV6X5gqR3Vc4QSFTpO5ojsVTnoKAtlSLPoRQZtD5uhOUWr25Wp5r8/YlfhwpwSoDo1FzXmcBJ7Ftv9TJPoDGP6V933+vJj2b9LRy2OitGZzHnVT7IdEwh/X+QkejNmPLzjW9rpBnWNvtsLrSDwt9LwGT8fMgYs46P5fK6opd/WceSLWVMlxArldHgsGF+MCX1i/200dRIzC8k9ubuISUyNrOaMRofYI6CNcUFaMdQJ6p+vAGOMSdS1wGN+aucpcoX0OUWe1cICoaFczpSx8olVH2UZhGrIXNYwF/iHC64pfI0KQltXxe1p+79zSHHXxf7ZsDj0G0BYi9+j6EQ2f8SpGJsvs=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(36840700001)(46966006)(40470700004)(5660300002)(8676002)(70586007)(8936002)(70206006)(6916009)(2906002)(81166007)(36756003)(356005)(82740400003)(83380400001)(478600001)(6666004)(42186006)(316002)(426003)(26005)(2616005)(1076003)(336012)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 11:14:55.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df74c996-2333-4bdf-6b13-08dc2a2982ff
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 11:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195260

This function returns the available licenses by searching the
directories specified by COMMON_LICENSE_DIR and LICENSE_PATH.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is the same function that was removed from OE-Core in commit
aa662aae352c65cb5d13172bf98ed4ae3cb46c26 as there were no longer any
users of it then.

 meta/lib/oe/license.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index d9c8d94da4..7683bed624 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -259,3 +259,17 @@ def apply_pkg_license_exception(pkg, bad_licenses, exc=
eptions):
     """Return remaining bad licenses after removing any package exceptions=
"""
=20
     return [lic for lic in bad_licenses if pkg + ':' + lic not in exceptio=
ns]
+
+def available_licenses(d):
+    """
+    Return the available licenses by searching the directories specified b=
y
+    COMMON_LICENSE_DIR and LICENSE_PATH.
+    """
+    lic_dirs =3D ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
+                (d.getVar('LICENSE_PATH') or '')).split()
+
+    licenses =3D set()
+    for lic_dir in lic_dirs:
+        licenses.update(os.listdir(lic_dir))
+
+    return licenses

