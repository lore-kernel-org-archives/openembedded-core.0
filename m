Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C452D6CFA9
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 22:05:02 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50571.1769119496632420085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 14:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TW3VGH9a;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.70, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaVAOco+7iiPtE5aXOfqF8HKg6Nfsy0dqgydunJHIEHZpYWDUn5BdIQpoVZGlT3aHrwP5gDkwtUUsCjJTwCvKNTVWHrilr3Vz08K1hy395O9xhKmDrbgycXRudjl7wbrz2iPTZ7xWIyqwF2S+SAAb1arjOLuqAVQCyv7RM4/3A6j40ovj5O/8SSTt7JvH2yFS4ojbw/vOyXchpl+PwFRp0Avx+IhaVKezMxnSZv39ZCQLS1FZVhXEcSN4wreSEbA71e1FYvGNAkZXPlsd73MeIdKgvA3Sbbbdc2Ruhd3pUagZkUX+bgwqhBreS3ZEqAyeKzeDu4KY4DM2YLAhcU6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rxFvUiwU2Egx7nC4WSparZ5ngMDYv1WBtla0H1SmGY=;
 b=ysdSucHRof6kRDZZXJ3JRIwEB8lvKVB7g84tkLUoYGyggb0EZfMnQq6uzbXckqn/z2p+aIBW9K7iCt+umyKP/AylMjmGDOhSbHWhf6Q0CqYMWK2Pt1NPnpAnMlCI4jYhp4lr2H8J05GicHT7u1HxUrno4ipCkDgCZdybjradWhCHWId0RuQ3G1zuv1hunTvpRjxMcwyll3G4qB9CKFAbKS8MfPbBP/YTZNRPZLzvWbHmRvmxfeB+nCToIp0zS+9nyGjFk4w9MRCdYzLyuFucZrQfu0cGY+N0wNISL2xLR4V2dZPakamiaEUvIJAI9uYlUhzm9Y4arV+i0HZ8A0/T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rxFvUiwU2Egx7nC4WSparZ5ngMDYv1WBtla0H1SmGY=;
 b=TW3VGH9axXXiNw3y6FdHJTiu31Z6+Oc1etTa9C7A/Mnzo27NHiXaMXan2ScTyPqv/qbXlkL7RfJkGjJqCH9GGc4bLNQOlWdLuFGg38xvuY7jEz5VBr+TCbXmr9G1G6WPLqEJ0NqbnzSaSBb/e/U2CNMQTZ4mFpasLMdTQ1X3VE4=
Received: from CH2PR15CA0019.namprd15.prod.outlook.com (2603:10b6:610:51::29)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 22:04:52 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::ad) by CH2PR15CA0019.outlook.office365.com
 (2603:10b6:610:51::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:04:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:04:52 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 13:53:23 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 13:53:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 13:53:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MJrMIE1093678;
	Thu, 22 Jan 2026 13:53:22 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
Date: Thu, 22 Jan 2026 13:50:00 -0600
Message-ID: <20260122194959.13457-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 526540cc-b80f-49c3-1f84-08de5a0244cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QVHjiLl2dJ3aIyCUHuBRenzdzlaUQgtZ7SXpq1oDPAhmVPiJurtR7S5GnFlq?=
 =?us-ascii?Q?SORV7+6bV0OzrAKPPW+pbvC0ESoJfeuRGNx9n3kyA0pKZjn+wZf5H3jkrUbD?=
 =?us-ascii?Q?wlA69sWmqF9AEXz4H472zS+XYedI3Wnkl7DZ83V8wIubxUPc+2+QFyUO/omf?=
 =?us-ascii?Q?oTBY5+hBjKzX0HV2fmfi6YQutC0xsCHVn9OJSWwSD4JgpZArkDLfXCluuEVm?=
 =?us-ascii?Q?tqkAZGTlPOD+AGFYNMIDNBnMo5H3LI1yb8IfrJkdOCroBFq8Xqn//Et3dGcj?=
 =?us-ascii?Q?F9IBk5EY0FOAbyeoHIf99jv243H8APihTe+23yLehElwPxgoWJGlMOVm9iTu?=
 =?us-ascii?Q?8W2Q4io0cvFkj25YFtEDGhbgFbANyoVOx69bTdtjtpusdaZxGQwlrsf6KUTp?=
 =?us-ascii?Q?taureUMWGrLrp4Zode9DDc1DDgJCtUGHEW5VJXeV/GDc6wPajKeVGzc+6JLE?=
 =?us-ascii?Q?xWgMbTnxeU1mLggYp9HfYPNLssD4iuCa5xJy2In6m7EE/IoMNqA16OGeeUvQ?=
 =?us-ascii?Q?C1gEpSsDrHEQ98rD7a0rtmMQLwAzWqOOrFDHjNdKN/ksxY5PJeBUmv5ybsb7?=
 =?us-ascii?Q?bELPrGMsMjFkGWGf/g/TYutRPkpaDdDu3oQIU15jmXMIlL2dSsVNVe0stft8?=
 =?us-ascii?Q?TmgRTwU53ufb8ILejzzvvNnflbGSPmyQZghY9dvDVwk1AhGOvta/4TGDCtA/?=
 =?us-ascii?Q?rMvXt4Bnranfj1Hggw3jWeG0uYjqe3CiYunBiPXhyFNa7e+TaS1s5KY4SXBe?=
 =?us-ascii?Q?CYDPfu+N+n1o9gzf5B939wcOu88rh3gkkFxWkGq2MoAN9CqQ9iniwYP6yed8?=
 =?us-ascii?Q?zEFC+BKjMrOHcIjAMwRgwYqSqeTCW9Ou6bgCiKA/7fmVbE5CKDgV/MRbVYss?=
 =?us-ascii?Q?EQTpgEvv8kvN/0iMDTI6Sn5BVHX+pbkJfE7EIAmmqIOj3eae5k7nxtDl0x9r?=
 =?us-ascii?Q?pGsdSF+lcBWQBJ7pVCnkZeTrxRHTRlwuEK3JevwSRtTwTBoSu39/qWiZGml4?=
 =?us-ascii?Q?FFHFGvNUsr56Cz5SkaixtY8hBVuGkbm4qROlrr/EhyD8zGUOQzWYqpHFbDMf?=
 =?us-ascii?Q?p1CfJppMogEFlcv3dpCPvvv9er2NGFZ2OAdI7vUn0oeoGifhDmm+7ZQvys5z?=
 =?us-ascii?Q?0k2b5b+xh3NF7miXdfpipkm/nAWyRqqBP3EcElUfiVgvs9qcSJA8hQ8LYhlw?=
 =?us-ascii?Q?Y8OTsHlMHNiruHE771uBmPwAWr6dfOt9gcCQHNM2CVMgfeJJEL5Ihr4Wz9PM?=
 =?us-ascii?Q?x+ed4elXTUwQ7czQp1FMtJyjYTnXIfOUhg9tzUyE09zFhGAAauE2TVJtdzOu?=
 =?us-ascii?Q?WjgCrXzq9K0UD8a9SJo0jEbQ4KPIead649lWxh3K+xzy6LO94/lt7jnfk/Qn?=
 =?us-ascii?Q?yKcP0cJlwVHKS/Fo+gPzbntvXz51Bux0VHCyIlQWnQbezLJUasby7q7CTi73?=
 =?us-ascii?Q?RQaQk+NqkDtnsyQD7re3r7XJotSonmLWkxzai6aokiUAlT/PpRc7Q87iDHrC?=
 =?us-ascii?Q?qG6XWnPV7nYG8xfhh5sagdr8UN7k8yPyYBJndXLk3MUCqPyr0+e5bVNnYgYz?=
 =?us-ascii?Q?AQJY3FXFxS/r+y4t5xQMymryTN+wAkTtYdQaol8I2TTK4X7Bdf+Ex8aPO59B?=
 =?us-ascii?Q?Z/WdsSNNg1ITx5wZlZB5ytkLmwceok78SyOuP02rM22F46Zoq+DIldlEONl+?=
 =?us-ascii?Q?uTwyDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:04:52.3135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 526540cc-b80f-49c3-1f84-08de5a0244cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 22:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229857

From: Randolph Sapp <rs@ti.com>

Now that the previous bug affecting binary reproducibility has been
addressed [1], we can revert this patch. This will resolve issues with
cgo applications becoming unreprodcible.

Currently go considers link arguments to be sacred, meaning any change
should produce a different binary output. They ensure this by baking
link arguments into the intermediary output, changing the content ID of
that step. As such, the marco prefixes inadvertently end up adding build
paths to the output binary instead of removing them if they are passed
as link arguments to cgo applications.

These paths are later stripped out again, but at this point the content
ID of the dependency has changed and thus the build ID of the end
application will be affected by the cascade of hash changes. See the
upstream bug for more information [2].

This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
[2] https://github.com/golang/go/issues/77218

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This resolves the previously reported emptty issues:
https://lists.openembedded.org/g/openembedded-core/message/228549

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..da873c3f4e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3Dgn=
u',''][d.getVar('LINKER_HASH_
 ASNEEDED ?=3D "-Wl,--as-needed"
=20
 export LDFLAGS =3D "${TARGET_LDFLAGS}"
-TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_=
PREFIX_MAP}"
+TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
 # mips does not support GNU hash style therefore we override
 LINKER_HASH_STYLE:mipsarch:libc-musl =3D "sysv"
=20
--=20
2.52.0


