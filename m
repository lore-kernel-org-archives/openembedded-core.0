Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web12.5619.1607414653781965212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 00:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hubf+Iju;
 spf=pass (domain: windriver.com, ip: 40.107.93.82, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTOjVAaGchv4H407wgYRgEylYCQ3Gi0y3JCkjoFWRhgepBuKrEHiXoO2+XbQPkdw+EKyAycSIxg/Xdv6UKgeGIin5M5ktarhTBgCybocy40Gc0u5UYHtdp+3HYw3JwK9WnyLr33UDXyNNFqrVVNkJIfuLUUiyJL2wy9JTN3Rg2ec32WP4rwWnjsCcV8feD7/1uFckUHX2Kd+UAAordAFd5wdMpAdpkrKwZcpft6EAWcVyURKQjdzhRtmN5LWv3I0oxn8B6km5XS50UtqH0uaMBwayzj+1af+Du8K/KR+bugX/N/xw3219j5FI9OjNET/EKGh7SvdCHcaMivYFqEJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jW6SwJhdF5wZSE7+MzxkaeSmideUqBhHdhtVW18Qm0=;
 b=HhwKjRhHsfcQYkej+TPc9lYNDY9Wth1ch/ypGiIksTkSyzOZUQiG5tDmUJH75FAWuEvesnqF2Cy+aOArT7A0IdduC2kTNXhAZTXlmPfAqNLFG2P+evZCnU7GKuEU9zMoc2pfAYG6u90QROhGjYqIuTouccjVCSYY1Pth6jlLva9pYZPqyqvGT3zPO194jkzPYQtfMTrTCFnPRLHxRKHxdditIG4s4BgPGa657yDuq6X68/hSIaXsKsQAQvsx0bTyyss4Mh7J0RaMuTdYEJrTxOpfp47GCJR2Y1wlG3fhMpNw3IN0elpBIMMYqmP2cnUE2fdhWq6o0GsRNpfRDDlngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jW6SwJhdF5wZSE7+MzxkaeSmideUqBhHdhtVW18Qm0=;
 b=hubf+IjuCT/65mEFDda3x582/qyiPosQnnvmcG1PV1RQLYMDOJ0dym4LcUqcj1wqoGRkotQIjhR4EnLfmvA2tpQktwG4gU41OCzuBPodX9fZeKCdpudICV0TzmFG7/PXSxYpvbzi+tTOO1hXzGLE4oSNoPdSzT15We1b3NRIw4o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:04:13 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 08:04:13 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] archiver.bbclass: Fix --runall=deploy_archives for images
Date: Tue,  8 Dec 2020 00:03:57 -0800
Message-Id: <365004069db0ab7de09f8da1ede825ca37cc716b.1607414579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607414579.git.liezhi.yang@windriver.com>
References: <cover.1607414579.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 08:04:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 518439d4-ce3a-4ef7-6d2c-08d89b4fd9bd
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45741CE8C8236FA3F2A52B23FFCD0@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9SaokczPorhq2Zu+v9U2p5zHEz8hMQqHFpJ+iZ56d0+mMbuT+Nh38/S4tFXYFNGWKSStpyUXskmAOVn0pJ+8AQGp7vfs+1yq6qNb5qUr5kbiNtMKd1Ns2WXxuKsS4cmxrP8nq6Sjqis14nQQfsHSdLp6uejbFe5ouosfrrZ7/5jMF1/ZGH5AWeZPB7k234njz9jnuYscDPcmltzF/JK8Fr+V9VzEqkioEXOC1l0yuixuzuChJmXHs5qH4jJz2ONERYcwlj95O1ZiaYYTaN5tH0Uhhj6tFVaVHdTeEIDrcQrd03mnrQc0UM48wbGBgzGu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(5660300002)(6666004)(86362001)(2616005)(6486002)(66556008)(316002)(66476007)(4744005)(36756003)(16526019)(8936002)(26005)(956004)(66946007)(6916009)(6506007)(8676002)(186003)(6512007)(2906002)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9MFJY9Dkm/Y462TANyo4r16AuNdGT7HCiE4KyEm2MuL14o3EIy5mMNQSqX1z?=
 =?us-ascii?Q?PHngVPksTWkbRl0pLzk4SbDBZDH+zMFlRjZtcGomzVls3fXhGbIDcYQZwjPE?=
 =?us-ascii?Q?/PbDyG3weGigCpIWTDd4unqTjwvN8J9lVI2G2KqT9YsnyF3gn7y8nrA0Sl1c?=
 =?us-ascii?Q?aINE7RjeJAxrS14Y192Fpq44J9yxNscgWOlx2lajjRxMMAjNnWt58I3En0t0?=
 =?us-ascii?Q?DwVWCmHb+hV4kkRvqnnQBeU4SqvvU2RT3eKB1ADe78LnPNdxTgeCpeMhOjRo?=
 =?us-ascii?Q?US6GSOB9N5HkoKcyFY73iv0NzoHWoeXjvEMhVkXQd6eKLMojBCP/zaPDXI+i?=
 =?us-ascii?Q?VBEs981bHfRut380lqhUlRK7+Y1hD3V9/f6uS2EsHtBEsznk+FOMLs5Tdu6P?=
 =?us-ascii?Q?iDn1cqrqPzB8w8mr1fV303f5FT7Y9DxFaGxFMcky5SZn0eJ8vEgdQrMsz4W9?=
 =?us-ascii?Q?sGIcm3zBRYBC+xPU16MHmiA2WtKSJDRfYAoPCB/SoJxbtx0F30390lzVMx+h?=
 =?us-ascii?Q?kxQE1D6XJut+sGR3yYoSR6lRrpsWxW/UPSzn+N5R5zvF1H1YZ7rzUABq7jrD?=
 =?us-ascii?Q?20kGCM773FtZsnLsRUF1x/reMN3oBpA69qSx88b6aHjR8NUUBcPyL1YW930+?=
 =?us-ascii?Q?bN6ZLVn8zCi3IYir2GrH0UnxnmmggzgJEPsx/mLqOwCOzQdpAd7lVKqUc79W?=
 =?us-ascii?Q?1U5XFVodeO0EMgVU9Z6eG5qtFpoBYb1ENcqoPkOSuQW3PzdW6EX01Sfl1GBU?=
 =?us-ascii?Q?GVj7mB1o/zG83+FoHlHz9NNSJJe54dbxg665LcwTh9SwRNC4PdH/2/8XbgTp?=
 =?us-ascii?Q?w7bvzJkrTMfcmkqLWZ1hyzdeo4voIlKZ9EbI5x5Os4ehvKTyXTL/cRZ6kwzV?=
 =?us-ascii?Q?guEIiVgcN8wb4vZzMghuPWrv4m+LGTdnABhrz3nn3qf7SjzXFEUKWPN3rw1v?=
 =?us-ascii?Q?KrYtk2iNNk89pB6OYZoRZsUaG5pqZEDLiinlRVWYPcXzlJfvBpv2EER5B2Sp?=
 =?us-ascii?Q?cE/b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:04:12.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 518439d4-ce3a-4ef7-6d2c-08d89b4fd9bd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLGARg5X56+JiNLbIeAeuQ/ySpS8WaK8BaaQHV95UIrCsaPpKGRxjme82OeyTKh3+tAAYHtOVl00ZHx5ou9TeVZo4uvG2CrPiMpRfkz9z9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

Fixed:
INHERIT += "archiver"
COPYLEFT_LICENSE_INCLUDE = "*"

$ bitbake core-image-minimal --runall=deploy_archives
[snip]
KeyError: '/path/to/meta/recipes-core/images/core-image-minimal.bb:do_ar_original'
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 598298ef6f6..858507b3439 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -590,6 +590,7 @@ addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives
 do_build[recrdeptask] += "do_deploy_archives"
+do_rootfs[recrdeptask] += "do_deploy_archives"
 do_populate_sdk[recrdeptask] += "do_deploy_archives"
 
 python () {
-- 
2.17.1

