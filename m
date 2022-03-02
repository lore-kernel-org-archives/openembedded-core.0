Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862C0C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 14:17:50 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.89])
 by mx.groups.io with SMTP id smtpd.web09.7642.1646230668681902599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 06:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mWOZc8Us;
 spf=pass (domain: arm.com, ip: 40.107.15.89, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1owDDengTx7Gr0t0u2E2yexiSZnxwRb60vX97z+6dc=;
 b=mWOZc8UsTDRMv+tKt/8YNLhj+tIXoVZ1DoMStCwoFnixm9DwSShr2kjm2iiqpN7fkllCqj7AeAsjs3eFSvnPPI70sgwBkZVmOihxJiTVhh0IKQQWekrhqtof00XuIVktjXh2pf6SMPN4p+/0IYREKJLD0n7/m6vurgqEPU5EHjo=
Received: from FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) by
 PAXPR08MB7106.eurprd08.prod.outlook.com (2603:10a6:102:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 14:17:45 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::f3) by FR0P281CA0003.outlook.office365.com
 (2603:10a6:d10:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.11 via Frontend
 Transport; Wed, 2 Mar 2022 14:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 2 Mar 2022 14:17:44 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 02 Mar 2022 14:17:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8ff65d6cd376812
X-CR-MTA-TID: 64aa7808
Received: from 081b05a96d13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84387087-5F2B-468D-93B7-1253C9915B95.1;
	Wed, 02 Mar 2022 14:17:38 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 081b05a96d13.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Mar 2022 14:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVguHMIh/TZmfURLD4YjINrjFAw7jKrmUdabD+5Tjz1Nl/09tsAG8trERotEOoHK3NLLthTKgFPEtwOlLX9Uy8XFWGctQ7+eoLifD5V4DnQpLglHHg3jirIJoDT0XskM2Dtgvl5YXVI8GpO8yGCN99WgKJnOBo/bzZsAMRtlnJ/f1rw9hFXvUvKXgmyrCETtwVByxeLgMvuOItr1McgRpFzPC3sVzq4RhW3WTPm4PcN6Vd4folCLPw/iUxzKUtfg23MO/9JXugWO0IzD9yVtpImU10xU2QSoEsqfudGKf+C31OjXGMM/CLZnJhiu3xNjc/jRkMpRFhR8TOHYpEEO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1owDDengTx7Gr0t0u2E2yexiSZnxwRb60vX97z+6dc=;
 b=fxonx7dCw89sXBsTl5fDm+TKyJnoJ0Zpt9omg9AIv/byQNCCKIrwrC0fzE5iSWLMkwsuqfRh0cYsLeuxMVyngJ3u9ox4RVvCN2fIaobH1d2l8S7ENByvcZUVUevcXldbrwt69cBgNKne7/EnMldvkJNKPe+/G6YIAqj3ErPFJbMz5pKjPUUMBDwcZsWHWPOUgGP1u/5GscdtWzjamoTYv2YpjsK0+Dhiwi5+lVUKAmhz+Hn3B/xFRt3aUr1g/N+4kxQy12C5bSaj2Ztdb0VNdSTL7suc8PJ4FZ/aIVMQ0Q6paSTEhwiWbscn8ySVHataZns9IJKKonwdee8nWNFphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1owDDengTx7Gr0t0u2E2yexiSZnxwRb60vX97z+6dc=;
 b=mWOZc8UsTDRMv+tKt/8YNLhj+tIXoVZ1DoMStCwoFnixm9DwSShr2kjm2iiqpN7fkllCqj7AeAsjs3eFSvnPPI70sgwBkZVmOihxJiTVhh0IKQQWekrhqtof00XuIVktjXh2pf6SMPN4p+/0IYREKJLD0n7/m6vurgqEPU5EHjo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 14:17:36 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::154f:63b1:4cd9:cf1c]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::154f:63b1:4cd9:cf1c%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 14:17:36 +0000
From: Kamil Dziezyk <kamil.dziezyk@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libacpi: Build libacpi also for 'aarch64' machines
Date: Wed,  2 Mar 2022 15:17:02 +0100
Message-Id: <20220302141702.5383-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0148.namprd11.prod.outlook.com
 (2603:10b6:806:131::33) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 505f245e-c4c7-421e-89ad-08d9fc576bb6
X-MS-TrafficTypeDiagnostic: 
	AS8PR08MB6712:EE_|VE1EUR03FT004:EE_|PAXPR08MB7106:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB71061744509A6A083513F583FD039@PAXPR08MB7106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hPMS1YfW9iL4bZWnP3pBANL2c7PcGbFPePKIPiKw9rWUDV3byF+CrhBFe/gOw67NI962z6od2dPlWDQmkPzVBGdSaUEVY3lDL0airT6yT0D5/3XOdjwsTM3kRi/pOHsIlXjKs3L45gz++hJYkwz4jHmgvOIXT66ZueX1ONuRcacRoLm8XypsFy43RthMlpFLmMDZ7XxOvnbdaJi2+4t2nhbU9OmefOiCZxlZiv9iajCCVPTmqhIvLpQv4jCwU9hvgCoEmuUSNh0fv7+yOcbaLpoPTtftHd6mLipwJ/m4zUMJrSlKqSJ6xiP8CjSlg6BacZSS+MzjpfNuk+LxXAkpUPZ+L6OXlvLZSxaKXmOissoWNtXlcjd0cVtYw4RYNKjxQfeowPk7Of8ccI8yUTFmx8dwn4IXpJpZxPfCu36Uiot4QYwNcRyOd908IPJPaEB8cX/LADM51SBhC2ykkMmCXKEwSiHSgWC9ihveN3B0k2TcG1qdtviBdpQGhVlqW7JSl/JN7xu/fT8LHo3XBM4loddatNi/Ml/BgPI9rHTIw/Rre6u/5SdMGzFkHIlldoEU6VPYK+VA7jpUdI/2MrEoHdLvM93EqbW31FkBkC5N5X1n5qjkj7YJtGh7gmjr5CEK6nVNZuiHxNZn559f5dawzYyVDdoaqDfg+9IzDCq14Ytjtn5j0QGeAbTmkVtYmC1ublLV8K0FDqmv9jce10RDmsCIVnSLaH503EBDx4xt2ZsP119ZK2zi+xO6Mtv7y3thDKZtRrqY8dwEsEBWaJtmwh8+3hbzREpWYxlpDpTwAs8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(6512007)(38100700002)(38350700002)(5660300002)(36756003)(8936002)(6506007)(1076003)(52116002)(83380400001)(316002)(6486002)(86362001)(4326008)(2616005)(6916009)(6666004)(508600001)(66556008)(2906002)(66476007)(8676002)(66946007)(44832011)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9fd2b885-6a6b-4335-7dc5-08d9fc576673
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i1yKuuP0wTkMWKCtpWrQGVsqlrzFkAeWlVOQt0Gc4nq8+OhDQZ1FgfwGBokLkpc8XHMEFcIhYeaM7WFINVow7lLXOxgC8NLqyA1JUgWywhIgIKiPuoFI/WqmQgUwJ7kUSLJ/X2IaP3dWoam56ap5BtT/cV/i0Yit1j+xYwKd3OTx1XQAGAE7iup28fl36lc4Pl1tTQw2C+7DsBuwhzM7uAqGky+tQtQEg/8jj8TcYdba5pRPyLgVGmdMiM+KQZ20aEJwmcLaNVlJzBPY1/hHu3Ej347R6XaIDCrF87TxJaeu3Buw8OMKU2C9HyijA1xM+xbMVjw40C4L5q/DO51SjO61zZm9T6YOGmz+4J1WVmFuTKqdCvFu8roaDaROFL26cAVJieaP7EZKFZ0Q6VaOyjeF2gKn/vsU4AtU/WDr2zGSAmZhj0JVrVo4eaA9Hsrje+OOXHe/C5AUVtgMcd9K/o8iA2rSKIco+a+kFPHVQSCUTEuXjayxG0iBZXHugu0TeNQJsYQZS516homeeutWxJv2BmbSf96L9nKVh/LzZ2uj3eMGrfVQC1Jp16s17qRVH/2odWVnOx1Ysi31z+1j0MG0TuQHKXW2wbOaMlH+l+FTo8aS4EWuqURY4uXEhEx+wB0Ea6Wt7hcNRmbznA+qGvPF2IkXdwdyZSYR5dPpLykliI+fiHqCgtGaLUp451/5mawCaZvwkCEuDe9m8SqKfPYVCfETtZ5i6jLAO4qyE+Ar+nsoCx2B5xa+MDxIsHc7DYIxsyTuVSsr3nr2rwUwJg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(36756003)(8936002)(40460700003)(70206006)(70586007)(4326008)(6916009)(316002)(8676002)(508600001)(86362001)(6486002)(6512007)(6506007)(6666004)(83380400001)(356005)(81166007)(336012)(2616005)(26005)(1076003)(186003)(4744005)(5660300002)(2906002)(82310400004)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:17:44.7865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 505f245e-c4c7-421e-89ad-08d9fc576bb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 14:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162611

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 meta/recipes-bsp/libacpi/libacpi_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index fa9e3d4894..6d4be76bab 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -22,7 +22,7 @@ UPSTREAM_CHECK_URI = "http://www.ngolde.de/libacpi.html"
 
 inherit lib_package
 
-COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-(linux|freebsd.*)'
 
 CFLAGS += "-fPIC"
 EXTRA_OEMAKE = '-e MAKEFLAGS= STRIP="echo"'
-- 
2.17.1


