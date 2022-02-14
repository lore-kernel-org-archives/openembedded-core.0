Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1634EC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:17:56 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.126])
 by mx.groups.io with SMTP id smtpd.web12.36258.1644855470090667260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=MoBKrMVX;
 spf=pass (domain: arri.de, ip: 40.107.2.126, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIt3Jj9fXT1M8HRbLofPNCp33B6HE1SSghCBWq/tlNWqAJsBSnKaEXH8V8fDLwbmu5Idu1poyUlpNlnE0M+XRGtb9MjaNSJ1m1vg7w0NAKr4WwfVkF7DDXTRIPusrAVa1b5VOhf4yzWmGLDXfzvXCDnFrTC3Et4WItHdnHePff38W7RhPKSm7/M98zy+5s8vVFsbR+NEI2JOAANnZVmyIlDiF57eO2Ad3nkzhiFI0onBlMop+jxuKFiucDmO5q3v+N4SIGoI+m5jZxgrQEuqt2Wn4W4XSmrZJDHynYG3L03fRLwta+XiSNeDgRCZcAmxrWEcK2nqkfovevxc9oaAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMKaM24s0K/DN5XfLi4Phknfvb2jSPUjW4mfxtmwFms=;
 b=jYUmEKk5Q5w8oQuxHIwRZbDh8jlBCWpOSjxQ+Kb8zpE5cSduTYjWfG95NVxmfjJ7GI8TI+THUFZGITqXYtYlZlkrW+6ufrVpPHB+mzklGhF/npJOv5x7GF4nVoOe9dpKw05ShRIyM6QpFD/Hzn7u9oUNP0+oeBP+OMhWQc2FyJ6/Dt5ZhBynh3uu+HPKORywJ5EFPVMImhcxHb1uGXvaWBeRr1thzpFsshesc2I2rcCWrgoXnmznIdeHZBVnXRZAo5kt4q7FxYzCsGO/F6xL9zpErqxdqq6zvU8q37URzKYRRcDVrbHIg6T3TM4dOOBwNMC9DQRUCpqaEihJF3Crhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMKaM24s0K/DN5XfLi4Phknfvb2jSPUjW4mfxtmwFms=;
 b=MoBKrMVXdS77BkX29UNlkHeLg9qaWl3jJTT0X7vd+UMOIAEfbggo1t4sQwULK53suKA/zvNA2v8GsKpZjL8zDRqk2UZvgp5IBbX2VN5y4BHjAId4uvrGNxbeT6PFXOQc7aym4uPlBQGrJSyAB7yaQtyToIMgr4uS0Ln8H83WA2k=
Received: from AM6PR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::37) by HE1PR07MB3146.eurprd07.prod.outlook.com
 (2603:10a6:7:2c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 16:17:44 +0000
Received: from AM5EUR02FT048.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::d2) by AM6PR01CA0060.outlook.office365.com
 (2603:10a6:20b:e0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.16 via Frontend
 Transport; Mon, 14 Feb 2022 16:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT048.mail.protection.outlook.com (10.152.9.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 16:17:43 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 17:17:43 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 17:17:42 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 17:17:42 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] dev-manual: update example from kernel.bbclass
Date: Mon, 14 Feb 2022 17:17:32 +0100
Message-ID: <20220214161732.15475-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b2e6ff-064d-475c-4664-08d9efd587c0
X-MS-TrafficTypeDiagnostic: HE1PR07MB3146:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR07MB3146FAE556C420E1BA8DD018BF339@HE1PR07MB3146.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BTLyrchq3F1UpWqPOWCtjFnzLfdbkQzEUePanBmGJ+Qc9zXla3TGtR9KmxegtbWcxRgue2xggVLG5ibMi0JLLhWfuwdJgVoNOlMuVSANSx3cUitNdl6CjlSHkVc9X6enUw9YZZaIaqKpWBtGZ69H5rEMfy6C7cuqMueBXFgomqKnJKZvTng7QeK3LGthnRW9ptzIDQoVheXjIMwutQPcz6wD2XrjYCyDAlR0IoOJCQ5FxhIBfL2iBMOksd/6VSVq3rhKM4/9qslXOFeBOtxI2AjcexwjkKztQ94nInhz2lqCt1dVUelbTyaKTOkYetgA8L1T3XcCpFiZGizopTzkx6mQ7GCujQeaa5TlcvTp7ahMGUE+/lSd4SqLGMxSKeNVGjXTI8kAP8wVVX0avrzpm9YDfARK0LQxa/ccf9KghL5YxCBHOtR5uqEWj0RXdEIPA+l+bLylUxgHbp6o8jlJ3Utbkv/e2e0fx4OIK7s5elaKCVnqrrLWhjTADVFxJDI72PPhhYF/bV+AbruZWqa29Eo6HbUESFnwSuKRb6MvzLzWBkUSSaHZTrbTpskDnpm+R1BJaEOJxo51AUfDocuKB3Pw3oVmoMSDH6yfZO6dlP0OSkdhz2iiE4NMmzZZxngmdSp/BElrWhC+KTfcdq4HPY8W2qx+G8g+/QwWBxEKj/GynR76kcYAzbYBZX8oKsNA7JFv+Uw1VqpfiQbi7xdKlQ==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(83380400001)(40460700003)(107886003)(82310400004)(81166007)(6916009)(36756003)(2906002)(86362001)(316002)(336012)(8936002)(36860700001)(5660300002)(4326008)(8676002)(47076005)(70206006)(70586007)(16526019)(6666004)(186003)(2616005)(26005)(1076003)(426003)(508600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:17:43.3764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98b2e6ff-064d-475c-4664-08d9efd587c0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT048.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:17:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161720

Since f7485646534e ("kernel: provide virtual/kernel for all kernels"),
all recipes which inherit kernel.bbclass provide "virtual/kernel",
independent of the value of `KERNEL_PACKAGE_NAME`.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-=
manual/common-tasks.rst
index d35b590ee185..1856d4c3ad53 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2114,7 +2114,7 @@ statement that essentially identifies itself as being=
 able to provide
 ``virtual/kernel``. Here is one way through the
 :ref:`kernel <ref-classes-kernel>` class::
=20
-   PROVIDES +=3D "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME")=
 =3D=3D "kernel") else "" }"
+   PROVIDES +=3D "virtual/kernel"
=20
 Any recipe that inherits the :ref:`kernel <ref-classes-kernel>` class is
 going to utilize a :term:`PROVIDES` statement that identifies that recipe =
as
--=20
2.34.1


