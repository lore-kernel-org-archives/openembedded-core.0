Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.49])
 by mx.groups.io with SMTP id smtpd.web09.1695.1614199537197178831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 12:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kauzHdZB;
 spf=pass (domain: windriver.com, ip: 40.107.92.49, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+/jKcbw05r3d6/4/F3CZb6Ki9Ktze1vmOKteDUzKjH63NmT0cq/XDVFUAR/YmoUGcHSQai7doca71Eefrau0cw4ma+7+tEmoucMAi8rhMp1ybJtCCfq6kgDjpPNPqEpV4ClDk9p7/NOtk1BYi0LbMnUFWWdKHNN097Tl94vCWZLhvSfSNmkq8F08Ko6WH74XovfuuST6NQu8blomtD/zDA0irP6dH5JmDuWo2ayek8AtOgIRbST7dI1SRUMTdGatsfo1hc/TWq1kbrzLZNfQ9dFB39cK83SCMDis/UARcbPs3/4U9/ebEZg4ovv5hzVgPsbqLL6Q/yKoZqJ0hDG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqpM+HPOCsalMIaVooVz15m/DCP+XSuONh25FDDocGk=;
 b=knrrrPWXwk+DOXQAl/M8saEAOgrcFSx3N8qOVw6M9KZjV+VDEAPCtEsKrNpy1RSNvn8/DC0VRK3YjIlo4tVnSRhOdcbGBSBYTFBxu1Rf/vfTy2iS2RD4j0HCAun37BwEyTI+mI6rGW/K5HHWbFvdhvCaxtm7Tzu37ZnpNqpwwiA07gjwt7yux3HFZog8CjZbN4xLG5cqGacg48eQQYTqO05hT8BD5ghUR7CLZhsm+VGR/XW0e4t/V5SDQpMcYc3Xrcxcxbfq6Y06CP32zSFkDN3VwDRAug7R1kN0r4u3sA4B0bOOmbb42S5cPjormXuv1EmQnLwIlboGwOCbd1WKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqpM+HPOCsalMIaVooVz15m/DCP+XSuONh25FDDocGk=;
 b=kauzHdZBlrjrTNA9m4dct0/WUPWIEIDrGc28mFpU5EDmPOH5+LEIov/hTMPVoatrXnwM2569NVhQjEL2mMXbZCtO4d0mbbEHReKcD3y3gHQJV9waIS/i1mGd/A5faAJi272zxZGB4tjzbmj2p2QTVi1DipP7iosVZCZd57WUEzw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12)
 by DM5PR1101MB2362.namprd11.prod.outlook.com (2603:10b6:3:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.30; Wed, 24 Feb
 2021 20:45:35 +0000
Received: from DM6PR11MB4708.namprd11.prod.outlook.com
 ([fe80::8d6b:40f8:2b9c:6145]) by DM6PR11MB4708.namprd11.prod.outlook.com
 ([fe80::8d6b:40f8:2b9c:6145%9]) with mapi id 15.20.3890.020; Wed, 24 Feb 2021
 20:45:35 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gdb: Remove "ALLOW_EMPTY_gdbserver" on riscv
Date: Wed, 24 Feb 2021 15:45:23 -0500
Message-ID: <20210224204523.32267-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::14) To DM6PR11MB4708.namprd11.prod.outlook.com
 (2603:10b6:5:28f::12)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0069.namprd13.prod.outlook.com (2603:10b6:208:2b8::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend Transport; Wed, 24 Feb 2021 20:45:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f14963f-d665-41ae-6b29-08d8d905223d
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2362:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB23626104334BE27ABC782581809F9@DM5PR1101MB2362.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ipmYbMeAHT/6UACq9P3I1BmaslACyOmXZ6vfA+6tRQxtSLRfILoOCRwxeMPNM2/rvjK9k2QX0wzeWvg81SS+hEO6hspDOAwJc/kVio+DrnJD72ZknVrY+rgqBzojBnAq78vI99DcwW4RAnXNG3pNxpUdr9tUVsLiSQJpIvKKCkPbVUlwpi2IJ76gXSGhpauF1/ntgK3Y9KwDeKgyL3YIe/XEAS4y9yZpg/tpEcb/hrYTMIiv4ANwmjdP4wQP3ASdOpMO4h79iIrl8KJ2giLzb11gcxNwfET3ubUen4sCp6rjFOLhrAApeB5NGuAcuq4YzKgWw+1OM1GfjFvN2S2aOEcMcbB+3VyX182ORvJ3B1KtI+dHANA73vVUdQtpWyw8mZ8MuPEnb7o8fLS/mcDZg/GJNMPJEoLUeHA3NdTaSlIIetD8s497edu5UeXm6hC8+ARyGv4kwwWXBNEXQoeVj+N3bssGiZ5Sc7vjettX213qq+N/WyE56mnEv7lJV0HEI0asZDN1OggudCrZ3LQxqw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4708.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39840400004)(136003)(66476007)(6666004)(2616005)(4744005)(66946007)(26005)(6916009)(316002)(86362001)(36756003)(6486002)(83380400001)(66556008)(478600001)(186003)(6512007)(8676002)(52116002)(8936002)(16526019)(6506007)(2906002)(1076003)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3MN17L4jQojH3XiYAFYQC2/aMJC1xgQW+uV1QHC9jctYpOfOwIfrOCgXbkOz?=
 =?us-ascii?Q?rGrgzlCqs9gUG7cPltwc3FHpCkzLoaKXS+BciqgWBpxtAO5inHLBV4hRL4Rt?=
 =?us-ascii?Q?CZsKvz2ywNEm5FeDpEM+W4Z2ys4/NlLTYhKDeUVYlVwRTTPWYF6ii7Fb9f3y?=
 =?us-ascii?Q?DV03Qn6tsQZEXkhXHhzWp2p3yZp5zXCEY2fOv6E4XQhOvUFoHv00cN5SpPmK?=
 =?us-ascii?Q?IkG32wE8GhIyS346lGJ9HdZFAN1jYI7mVWKOukh25RcWHgKv8zk8SdymYEhz?=
 =?us-ascii?Q?rUf3Q2lC3YJV/bujgdnVt2k7BBcW7BE23cc/UFlZq1zyTwLPX4P7dOq0MoT/?=
 =?us-ascii?Q?8ACWj7rDQAV5ptDplDBAcdYtSwvLB+s+RCerXDsFs7QDa6K+klzN9DOyGkao?=
 =?us-ascii?Q?FTnfsG9bVTFdeCT5aEPHcAaGRdHjjo8LHAjHjS0oZM+3q6ZtFBXsw48KIGAY?=
 =?us-ascii?Q?2UDa4qBH43g4hY6dY45BumMrlEIb4biTttMndLQMfm36GnJBdZsQWLMWOpYn?=
 =?us-ascii?Q?o7+cCFG4oOZQFG0RcH4OF4gIwFz9AvPgPbWQFKyjfdwJGKyVvPMxtHfq0nCQ?=
 =?us-ascii?Q?Qqigx6k1OFCL46CYiEeqRfAySVwnmGwzh2WC7smttROMtDMEpTjzwugJujUg?=
 =?us-ascii?Q?enFd+WmVLbgHeLWXeD9ZDEL/Sm6rcyhJL2zAhA0GFTJkiCr4ySL9OLE/VNKn?=
 =?us-ascii?Q?5P03b37p2XnoaRcGfjd61zi6yDd+oBJlKfHHBShnxSFI9bJaDieUDIbuWU6/?=
 =?us-ascii?Q?+nXKYi/XD5yofoN9/rOHDSKER1TnTU7B39IECDz+zS7ITeCyZvNzZQuZEW/v?=
 =?us-ascii?Q?LTaHEM/tfI37owvVzsNhfVYvZ4fSaJsbpm5qqudtO4ZwS0/GQE/0BIWo264M?=
 =?us-ascii?Q?pd9MDstMMoVmtrjIZGQWcyqUS3133hjlHOTC4FajGWjt0VD66eFOfmHnQFeZ?=
 =?us-ascii?Q?NEAWV+xh0ACSWQ/ZoOwWZzjzyAsPnFWhuEjK4fvRAZZzEZ7LhUzAhQtJD3Ot?=
 =?us-ascii?Q?U3NUmU8+oMvFK1t68pSrT5VjFaNQ9xKyDAn/QXCMQ9zdqrULIVnGK18aq6BM?=
 =?us-ascii?Q?odN7hX8N7V/Suz0h/C+UNhoIvjN+cLmmSn0mc6Ems311C7QdgEuCWl9BYfkQ?=
 =?us-ascii?Q?YiwNQ2X9IkhordPFhVNxkAEwc5EhDZSwiXIvPFPs7WbBOCU9drQC6iFZptwx?=
 =?us-ascii?Q?xZNXpIIDwh2vIoQd5x0x9+bdzoZvbUOEvuo4TyFIAQe6K9YZiAlcPkZ57OxE?=
 =?us-ascii?Q?tcs8reitr7ArOOg3sARMlAJJkaLghUK5qdgsnoGiz/xdd0PD8VfYr+J/Iubk?=
 =?us-ascii?Q?GjIkAG0N79XNBpHt/imGFSTp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f14963f-d665-41ae-6b29-08d8d905223d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4708.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 20:45:34.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMxQlX5DwqIKikGmspdXYTMXTwfTVQK6IeCe1KoOZjDFHb6ytkKlc7Q+1y67w7RUsub1ImTFGDn6hjy6vj6Eig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2362
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Revert 21e748d620022a75c0c2d0ab4a763a5992e8f154 "riscv32"
Revert 111f65528e3c0b147c1713cfc684958f94c41cd6 "riscv64"

Reason:

The following commit present in binutils-2_35

commit bf84f7066626c78884436e1c39fb60f04c665f21
Author: Maciej W. Rozycki <macro@wdc.com>
Date:   Wed Feb 19 01:24:37 2020 +0000

    gdbserver: Add RISC-V/Linux support

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc
index 249e24dc52..aa845b5c49 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -9,6 +9,3 @@ inherit gettext
 PACKAGES =3D+ "gdbserver"
 FILES_gdbserver =3D "${bindir}/gdbserver"
=20
-ALLOW_EMPTY_gdbserver_riscv64 =3D "1"
-ALLOW_EMPTY_gdbserver_riscv32 =3D "1"
-
--=20
2.29.2

