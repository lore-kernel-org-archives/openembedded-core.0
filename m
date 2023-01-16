Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8106C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 08:48:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.162225.1673858909287916156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 00:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=r5y1P8X1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03803bb0c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G8crGJ016662
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 00:48:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=BaVbKAbYdmUViUDLRb6nQDsApT5hKi1MuzbFQmqGmWY=;
 b=r5y1P8X1Biq/yZupyh3+FaYZiUDzwpB91wST4f77jQBNeTT5I6mXKqO4OcOrTy2c8weS
 YnvqN0z4tgO8gH8z+A+GXWkVwhlb7fR6SjAjPzulRNkoNl+oeavYVw5E1owEnxo0VbhT
 Jnn0rQMrmOyhlDrNxVY8rE4lyxum/nnOySFBGRillp7GUQ5GHuhmNvVLynDbWngdXXBs
 qZA8uoFotr+u1ct9ZVNuPA8wzm/dAfk3RESOqHdbnJYU9wOzQA9rRq/sy/bfRL6U0JSZ
 OG7PYN/KYBZCCF5NELP9vNNLXgJgo3/fwiWcdnFiJEBkvI3P1buE9EEXckofSa0KfU+U ww== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6sjax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 00:48:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur7gX+x3bc+6ClD15hBl9iaVxZSYCiOZikCyDblk3BeQLjUtZVhfCDoj9pNgfvdoG2nOC49Oi8YJgaePAAJWiQiaXG/2wR2yYO+O+gxsBNliFMFsZLzHVeiqGi+Y37fH6FkBMK3sjZ2fNQhghbQEgV+I8/K4fisE1jqGZ2EYNkMXkWtCHe+s6kO8H/WvdAMt31AF+A8ip69cxOmAi0t5lYJ7tGMW1xPL9avCAogQN9dYQ6zdFdHKHh/LBu7rhfeDfofI62x6QSUacv7NJs88vGbpBXflNNnVv7If1Qko96Y0Nw/g+0xeo6SGj25DC1XahgA/s+BdNPWJJy6PzK5dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaVbKAbYdmUViUDLRb6nQDsApT5hKi1MuzbFQmqGmWY=;
 b=DxTLXhdLEnkxhjt4fb3E3cN7OnIWHBi+RHmHUefShELgyCyZT/LQ90wamFAywICagrEYNAEBJs9EYCbdzBsy7jh81NRkexDlls3nEINn3qCgb6TVMebNqQT1vdIh15jDWu2fKEaRIpy/nv8OtEyqmqbGJRoTP25LCa2GShu126h2Iks9kQU9z7MX8JP914+3KqyET2X35WE8kTHvuyNSTuDOjPWHVvaZBrGB3pDhIbV5V5XoNIudWL08gaJx/upjKDLlkRqHy7F2d3ZG1x5AL5Xv6q3884gIMvf3GXROAMFiuIBkRzLOuilH/GCTUpFjOUbsEVwI+wudz1T70x5rzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 16 Jan
 2023 08:48:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 08:48:24 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
Date: Mon, 16 Jan 2023 16:48:09 +0800
Message-Id: <20230116084809.16470-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: d17807b1-78cf-492a-c7c6-08daf79e6dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VR0NmYNlH0lbxt5c4OlGgfbtVJzDMFrsQO+dH7O29yamanlYynMWtSjHype2r4RL7Ji6lfU6m4F0zjxLtngwB9WwvgLjetJR+1CWdFQ4IADRG8HhDlTBWrbZgMMTM5pZVie1U2rpj4ZFpYsfWQoX+z/vwtyMv/K7If4I5gU6oE3uN+k43tK5G9KFdrGxkHDgmAukpa489pmPcULY9Pm6NL12jstsChy+w3EeiyLv0GGKhb7JlcPd6VpOuXdHc8dNYfsq3NiS7mH19BOBxd/uJOagpwZZu6lcRzJwHjGr97I4hDxshMgTA2h3TPEstyrWj+54Iz1PHBWS1Y7qNxkTX+gvY+ELNlI1Q2otYJsYmTthLJOAUKtqJFxhlghgecSDw//HvWbJREVD2AjxIjklO1pGPfDGDKBye0Bma2vmeJ20hrONrEq9OlrihYQ8FRMRezgfX5UKgPNAJ4QgHK1Ph69+URSbLzj3h7emGf+bmGD/iHr+mObRpfVnNMUeGN1IZx7fD/VlTrg4aiRqSwTi/8ci2Ogxok2VxwZosbp+45hKG87QtKp7IXNZ7Z4c05FOiLH0/CaXnP8qJMpB+6W9iIuY5xIC0lIY8o2iQIzrRnq9UvmcbZFDEnDwYqx2t7Nr4VpJXn/dn1hKe+3ZK65woaxXNr+hMM93bk2YxdyjXN5OnWZBx0avaVqvc8FeYXABVKJ9quMicVVIUxefiWRfmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(451199015)(26005)(8936002)(6506007)(6486002)(478600001)(6666004)(186003)(6512007)(6916009)(2616005)(66476007)(8676002)(52116002)(41300700001)(316002)(38350700002)(38100700002)(86362001)(66946007)(1076003)(4744005)(66556008)(36756003)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6zNhHrSZh0+vTEmC3eQ710GVXCBaMRDAKj1tQuLKAPNTUdRJa6QlQatOSybt?=
 =?us-ascii?Q?14qjj92JnFUS0wshjX8HKf88PnbiRjzmvjV6P24gxy0J7mMqtLjMMBV4nUpw?=
 =?us-ascii?Q?xcuqbcVFJ4a9jrmZOvY4YejQlwKtvZ1cbfwyjCw+Nmi3EPxCbztSPwkMMRmU?=
 =?us-ascii?Q?InQIMoukOfr282OXkP0wAmDRgJ7zyzOglxBGSDR1uvK91o+a1dvK0B+OgVEl?=
 =?us-ascii?Q?QLt0DsxNEwn5v6tEcmFQBhQJsUfYo8K8Ass0u+gU79p+r1NuXXCN4EAcssmu?=
 =?us-ascii?Q?VeIuSCZUQlenMyS547IAB72WEsEybjPff6ZzR8DcZp4KQDxeYWRTSDZQTXzu?=
 =?us-ascii?Q?n+DfezKViOddYDmPs7TkFJKmuezcJVW0123ALQoiGQ9den8/eKVoQN4+MdA1?=
 =?us-ascii?Q?bfu7bvdgeZViKcxSJ+NBT36Qxxds0I3VJErtuBVYKkxUJLop5uESl3Z2xWlF?=
 =?us-ascii?Q?JUqtdtTA6b5xVGO8v+oiaw3tMpB6AItmZadzEFhAGajT4R+XPkjyZOOpsK0L?=
 =?us-ascii?Q?Wq3Za0kCCCJYK5ROfKx4uWLNwNPFgjq+KW29xcEwBbfUoUe1NeBVEnmCb3Nz?=
 =?us-ascii?Q?1erKmUIFNzOdpU/YDOe/KR0kcl3UneIaCg9Gg1PHzhpOm39HJzpZ7CesD29C?=
 =?us-ascii?Q?s6+nETGUpIcX3eVEp6W7So0Rnre64ELOGIlvOslCRqLjLCpeshfK/otvNYkV?=
 =?us-ascii?Q?iSBkSSUosnfP9Oyu4r9NtmFlaoKj5Sm8gTysULOpY/3bQSHpa4V5sTd8a3j5?=
 =?us-ascii?Q?djYb09HImyVaPiaoqCJAZtRN/cLtdQvFSKZjUUgsNPXC2cgHCBsAN0G4H90M?=
 =?us-ascii?Q?h2GBpgM/8Svh2E99fYbZBU0G+mBXjaTVHiYxEls+2uP7AKfefNtdTCKVlkXF?=
 =?us-ascii?Q?ajsiA38bMDlxYCxsDafmB/Ql7BFPy3iX0kuaI1rTwq/0218q1YJY30i8genJ?=
 =?us-ascii?Q?xKB+hh/kHtMrJwi+6c9TIHM2rPt2z4sgBhhwQUUgMEFEM47rwyBoNmTWP0A9?=
 =?us-ascii?Q?TJyU52DsRdkQDWbD95SSZQyCCMyJB4cc8XratHJXBabIryK5vV56x+JNifPK?=
 =?us-ascii?Q?MJ9t6S21wQNK56P8icbkWpP4vPpGh9fLXK9sj3F9TZyk4rz45RZRAKTIrCYG?=
 =?us-ascii?Q?3fDvfH75/GY5qYrS2HbCQj/0sB02VkxzI54jjS39p5sshEtQNsm18Ue7R8qP?=
 =?us-ascii?Q?uhrVf2kYdgP79holhj5hyH2LdSd7x+RAYKzROSqH/rw0TrWRHjGHPl82ExG1?=
 =?us-ascii?Q?ynElc7jABth6Dz2Cf3HwrQB2Yca70V6tFuzKdo8nF0uoFQ5Crcon0Wh/wm90?=
 =?us-ascii?Q?RG8HndtOP+ULZVVUi27/vBuInn2JGzbsuvY+4AENkpDIJ68QlX380zpkoUUy?=
 =?us-ascii?Q?gbN5GbGNckLnh1AtLIBFYswxEK7Nz6mfi1UUYsxpvXqtkAd6LN5K5UIKt8Hv?=
 =?us-ascii?Q?IDwaB73wZH9Sn7fIo/dHxcMH1TMIkf6dgxBTNpRNvPlBYgEhIyltLQX37FW8?=
 =?us-ascii?Q?N0GQ1jw9dtOXTIF3HP2epeOBv2/5fLoppnNLsR29gg2AofdSehPXj5LOaPEx?=
 =?us-ascii?Q?1YlUERUxsFw86h7XcG79eTgYayxggZWuIvRdXBq7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17807b1-78cf-492a-c7c6-08daf79e6dbb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:48:24.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhB2VmMbrpMkip4rV/A389gy+C4ohp0YhBfZSkv4j+KYAPneZK7rdeF1NtSValeQEvXFnd06WWhKEFmkLtRtiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-Proofpoint-GUID: C7P2a6SPPYWeZBL4M20A4Uffy1apmTSn
X-Proofpoint-ORIG-GUID: C7P2a6SPPYWeZBL4M20A4Uffy1apmTSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_06,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=749 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175963

For now, running `file' inside SDK errors out.
  file: could not find any valid magic files!

This is because nativesdk-rpm exports MAGIC. So let's
make nativesdk-rpm depend on file for better user
experiences.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 8eb0ab207e..3b7d4d640a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -188,6 +188,7 @@ PROVIDES += "python3-rpm"
 FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
 RDEPENDS:${PN}-build = "bash perl python3-core"
+RDEPENDS:nativesdk-rpm += "nativesdk-file"
 
 PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
 
-- 
2.17.1


