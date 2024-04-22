Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346B4C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:26:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12274.1713767176952614900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48425fb84b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M59pqU022222
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 23:26:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900s8f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 23:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJJ9tyS+dhn/i/0HX4RtYEo/3ZtOnsBy6p1FTROfnotBEfQXdGHUf84VC84IRO3mtduX0fNv3cHIt1Az9NVdC1ulHRqYE7IEFTZ8l9B0CKujaNWjS0YpAjP9zfM3ykpfXjkA31Z/IjWtsI+4nZVEaMbwJrIQ/IxLgkxr70GY34q8fKk0T2N0zuZBQXVAOQhZpfGuJv/+BHdgWKC/Z2q8T74r0J/PbP5nXeVbrTLA3OM49pGdpfkMwRT+gzLYhx2WgMoi8omF+Hfvj6+IdQPB3XMKiqHmpsjVY6d6h/7NPjGT74HwdNZgzSuZVRKpuG1HEDg24UZIxUiEwkjMJ2PnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9aS4YKMP4JauM70Mh/3CxUpZt/usvyjqKXcRiCov4o=;
 b=OS/sxKuQdmc5v3N2t8yLigeAkG1CtUxm4FrqeV9mi50HuD5V9W5E4NMMAgMw9ZA8X3chHQ8qlJPNsjxVzzJch61jYQvdDNjKFuUF60mkIUpbQ2151xdS2Ffnyu8/IkMfj+syItL7iC/f7Sv0hkme2EUtLHHCE5iviwlE5JoJVNSKt7Izamz9vMogSyMuegbUXOAF/Zv5/Bdim6Jgpj//gwUa4zg0yTqoAqq3FWGrntyqvckPQ4a9lDbKNdYef60Vg7RKzq01Ktcg5+VwyRM+RtnLeJKJRN1MXK6JXW/ggpes5rDEMUAG4znDpQbVd1Fu6qqsx4lRuNszYf8VRfTljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 06:26:14 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 06:26:14 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ltp: add iputils-ping6 to RDEPENDS
Date: Mon, 22 Apr 2024 14:26:09 +0800
Message-Id: <20240422062609.3874807-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc5f865-004a-482f-cee3-08dc62951c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s/uZp0sMyieAqi44wAjCCJdIujSUZMugCacg47pBijeb6S64IcRKsHI0dGnQ?=
 =?us-ascii?Q?dJ0YbHPHU0BHdZp/4XPSwg+rLi3HvFlpOR88Sneeit2U87X6ZbvqLLvkijJd?=
 =?us-ascii?Q?dyrlXsCMBnSL6mLZYyBYdrPQha37Y7RnJtrM9/zd7n0RY5be1ZtXEjBJ1U7h?=
 =?us-ascii?Q?RUAwHYfsnkbFzTuCJqIJj06Nai8m7KEeXVcbdPXfyXDS3FYZv5wXJebFXvgS?=
 =?us-ascii?Q?fan2klglFYTGSlUqqupeYsdczcMt2cn9LAj9+qpLu3AYXKvhBeONbv8YsIVo?=
 =?us-ascii?Q?JMYlS8r84vGh5UHROZEOMBEAeQ2nz2CoYkPSFZE2BZgm2OrRGa78cmHC1Shk?=
 =?us-ascii?Q?E/EjAr4zgIPl5P6yuIQeRyqLB3wkvjOkzFP80FsYKwQwaI0G6u4T7+JD7MIG?=
 =?us-ascii?Q?6qAYgpeV/K7UkG2oTYgXbg8CcQyFM/Nk4oJ9O+YHA8DI3fwISrYQ9hJsKMgM?=
 =?us-ascii?Q?I8Cc4KZcKszpJj5pR8/mDPlhgvW+kR6j39fa0OXJPmGdHOHoYwPiGzWhMpDA?=
 =?us-ascii?Q?j+mcxWloHFPmR7YhsdhFdDAWNWAq/F0UJlFq1ZUVi3DOjDjeDsaW7ci5MDfE?=
 =?us-ascii?Q?ODn9KFkQm+kJXSkSVEA6h8XHPNfe3cQqqvRI6w3kX0eds5ibxQUONlmPABx5?=
 =?us-ascii?Q?hPVRECRqKaJ/WD2bghHlXJ7/CB5Qc74w7zMb7Y/E7kmR5Z/68iSp0cp7+QrE?=
 =?us-ascii?Q?0rVRRvTsYsUG2ktjos3/3Rp7fuuAOIIIFebUT5UC7hnEHiNrCZKBNP3OZ4Ft?=
 =?us-ascii?Q?pz93Al1yoQE+p0XUK8tplfRzCE8Uxe/MnAp5LfHECr8EVDJ/xW0RiX/xK72D?=
 =?us-ascii?Q?QOnxv+v9fMFT03uFvmIoSZRJ/FfY3nS8me8T3fTrSgrQ4FvCHEcISKBlwg/v?=
 =?us-ascii?Q?4lt/zZHirVKNo9Uine4AwCo6tcnPczlQXQ05muglFFqVwWIH6vo91zxX7iao?=
 =?us-ascii?Q?kKfDSvFzkwbApOe7KmcFfQfj/jG2p9scHIFcEjmStaY979zUB/utpxklxWi+?=
 =?us-ascii?Q?96sq5NLqkqmpORPRLRo2MAC1/AFLJXVVqi68ebDexuGtsc63NmrvLXor0+JE?=
 =?us-ascii?Q?SlJFH8rT5aOsxdhRraPEKU2PYFj+M5nXL8L9qyrubhCh6kT9+dYN8LebEb01?=
 =?us-ascii?Q?MwZgrfBc8/MMpNAkWDwQUoYBXYBs87ZrjLgSZbORSGkDS3B1dDiu9B7SQTrK?=
 =?us-ascii?Q?7Re4YeNvfSND5CN/JrZt9pVXs1EGHYtbXl2HFJ5zCeGM8d3+7ikuAufcJQvf?=
 =?us-ascii?Q?vJH2tUNctFaH2nV3v0cC1X/dZaUKXf6HGoIyN8Wr6Be2EX8b5dGbDV67smT8?=
 =?us-ascii?Q?bebRz4l8pStn65D93RW+NhZnY2M6/UhgVmP1B7TjFRlA6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2PZTj5kYn7x83cZytRm57PcpbN8TtUuBay4BnPD3eFOCSZgST9uh3HCvnFgF?=
 =?us-ascii?Q?JishISJEokXQ5fSjBqCd58Xt7zbD1FaremAenC07d+18TtI8iTUUQt0sEVdS?=
 =?us-ascii?Q?nDiOgxihgSaYFZM3gNQVE+0WWVufA0UdcDPNyEo5Ui7Y4ma8g5P91X/F7EJj?=
 =?us-ascii?Q?8KfMSG3cuq9e3jpaYbVz9mLzdhtymvnJV+/v0wUFoqlQKj8LbrTlfLzHR0um?=
 =?us-ascii?Q?zI3Miac0ZBGkeD0KSN1CL2yy109oW0POLC05SXNQaTbzrrpn0wOnhU1Qkncw?=
 =?us-ascii?Q?Cf/v4QmCZ8HQDX8A61JU4JzbralgfdVp7zqMHlZ3r3e3JTW5v7609LLiSswm?=
 =?us-ascii?Q?WzwLZtMV6kXlbsEwnJWew1s5ytLrWKCw9mODrxoUMW4jfBJSriqFGAq/tK/I?=
 =?us-ascii?Q?FxpbvlhiX7IbiW2ytPYrfAq/zJ1IqQKmFZ90uBfejey0q85GX5O79rAGkYHh?=
 =?us-ascii?Q?IU6NpqGdyrDSJ6mkcQTbXt4gUbzQ/VHb/LX7eG1pfUb0TFC5q1J+Srg+I0cv?=
 =?us-ascii?Q?9uYkrfq/WRpwCXvGP3Gd94SNkYeR2y84J1Bh1l2z9YoWvIVb4DPrrz/XAiFd?=
 =?us-ascii?Q?gPFuduSJIkRYXd33LV3JxuboJNzaCqGq/4RWyZQO97Z3SCwDrQSwpX2ebnVL?=
 =?us-ascii?Q?whwdDSZ7JkZwA9W2esHFfm6wugt4K3jpT+6BURmGVxruUkFz1XILBCFgsonf?=
 =?us-ascii?Q?N04G9L1P/ayUeomFiJDQ15DtyXHvQSDcXUuB3VWNp0eAKv7S+f+iIKbj9NvS?=
 =?us-ascii?Q?TvnCEB/7HcfJAcZW6rmAuWT2upzjQ0HQBOzNSdLprLpDBtiC7HDdJiYDIMZ6?=
 =?us-ascii?Q?MOwhkQ/7V1G7Ov4rdiVToqTJM/+g90xTbvj1dYdILNo52+4b+9sT1c1EHGL0?=
 =?us-ascii?Q?hKZaBev6Tn7CO0918afRmIyZ4lBskivKp+QWYORCQD4LyB2lJRV5k7wRePJd?=
 =?us-ascii?Q?zp2JD+kEZW0qWr9EjWgzM5vxpLZ2Gg+whGh4lGPDuepF5LY80BQNgrUZjXQU?=
 =?us-ascii?Q?rBp+ZEDAi0ZVBsek+mVGn1SBlI7sLTbhdEjODvb0fG7iUg6vIVp31wY8GSiv?=
 =?us-ascii?Q?JCLI8vQXZi4XwqbgkZdU/On/kRegjO2tDvIdGNDdUD3azs7YGnkJilxEKxcJ?=
 =?us-ascii?Q?VICcQxcD1wQWQxZdk3uNE3nlrvJjmFbNGZOwBnbswf9TCmsrYBaGgWC7EKAB?=
 =?us-ascii?Q?+1fJP4tyD7cNB4/koDrE1qlYvm68Wps8Fi7oYRq921pt2OSWmtR3zJN6p5ug?=
 =?us-ascii?Q?202keqLstBB/8GXHum8tEbfNjQdK8BtdqiS6wVV562FrIw5iv2Jtrr+FDvAB?=
 =?us-ascii?Q?wTDAevXwioqf0bZHQl1h5p3c7Rlr4/YZHmOIfFdruNnnqsK7pqMu+qYusGNZ?=
 =?us-ascii?Q?BHoTh5pInauDfYQaGOnfoF+O8OsJ18C/zFdZNDRDGuznoZ04vPcU7LtfFEQC?=
 =?us-ascii?Q?EEDPphKm4ZVp540SLpE5Uh+bUBydoNdZ2MjHKQPqKJIXPn3kfImxJPZjt+eZ?=
 =?us-ascii?Q?v2a7A7TON5bS8yjPlTUW7Fq7AMolLylgyvBiN39kv+6huSBzxktKoAAcl+sY?=
 =?us-ascii?Q?wCpY5tnNRICPVrYw1JQhJwF4aiBFarM95mIVYJ/pf90LEi98Ybxx9cIG61o5?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5f865-004a-482f-cee3-08dc62951c06
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 06:26:14.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyppiBFcxcEMPGXTMCp5FZVUaGR8bXl5Oay7fiYSjku/mLbiqvT3EI5Aj2DqUm7A6nZ63FiFLBJCJuIybe9S+3a4UlIDCBQ487kcYtciZRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
X-Proofpoint-GUID: VXEl8Px7TyFKr6m3CJATPp5lB97SakzP
X-Proofpoint-ORIG-GUID: VXEl8Px7TyFKr6m3CJATPp5lB97SakzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_04,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 06:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198581

From: Xiangyu Chen <xiangyu.chen@windriver.com>

According to the LTP documents[1], it using ping6 from iputils which
support "-I" option to bind the interface[2].

Ref:
[1] https://github.com/linux-test-project/ltp/commit/6f97789c
[2] https://github.com/linux-test-project/ltp/commit/64b11656

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20240129.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 3e896957d1..e88e931a68 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -98,6 +98,7 @@ RDEPENDS:${PN} = "\
     gdb \
     gzip \
     iproute2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
     ldd \
     libaio \
     logrotate \
-- 
2.25.1


