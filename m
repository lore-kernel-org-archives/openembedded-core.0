Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56647C83F05
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.504.1751384879697702159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561BJwtO010292
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9b6c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOciOnd46BmN6bk6xNDuWSgliY9f9w7v1Ulscec3O8LPVybTIAdJEV8VPjW5REfUkR0mg1HpWkJH1+poBVQyQ5jcZDDvlNswGIbv3USoRtRfxc1A+VhO1g/F52NgC/JK2k75+F0oyrc7NoxMlz12LA/S9/3iBJ7qbMwdUZ2/76PQ8gdhsMeOPC1QOhf6J1CiHeKTDdPNXuisq5sr6zMDJgT7+GIWOIvHi1efnlpA+L9aqyH2dRtZtMW5kS8HMks284iyDmwvXkzxhlMBd2R818G3ley1TsQcrRgql4GxzDLZusTlivTNSFpyCIMVRtyx46Z6At3pxiXOaYvcmW+Afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WecHCrtaPyF/1QCduC8FvFhxWpeq8AOS4MRM6aIxbjo=;
 b=hGgF1YOfHx4DcBIt3B/Eaf9BiaePhT7z769JWOwI9qAHwMunEqz94zHbH/tG2kDesfTmAnWWr/vpaF2rU8tFrqcRt0VXL9hJMFt3E4tR8mDC8XVDnIMGNx7ufav3l2xfK0SztAaxrIokkjK9akk0YhAj0jJCtDctNBWdpA5pkCIrtvsHSO6oOSi0t2PK64UxbKxIq+Wob5ItCBbiDriNnqbqfuX8t0bBidi7vBgbD0gwhztkj99cRSEeqy1Zb3c/GK3COWR7HbEz06Z9WHdGlyVQCO3auAnosQEFOaP7Nly6MhAqFJS9UNu106+EKVNjcLUB/EuJwO9immFDk0Noaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:57 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] libassuan: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:28 +0800
Message-Id: <20250701154731.1465906-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: d971d53a-c9ba-49f9-a313-08ddb8b6a5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YOnWyrFlBfjKK9bM98ZFfbQnPNIa88qjNkGCGmsT71nehGI3O4fu8Y6zCRYk?=
 =?us-ascii?Q?tySx1A1gyPsdsgCS51tRnPwAQJHWM2/7kd/VvpD2hs21i6UmkxnUMD9artJv?=
 =?us-ascii?Q?I1bISf894FectS+qITFEDfG3qlzcExeP8zFugMEYOCBMcliClto5c0lEzkkM?=
 =?us-ascii?Q?3jCEJca/C1GWRNGBI776NSk+QS40ernPRqsIbnltCsED9NrDIhBCIGCLl1lG?=
 =?us-ascii?Q?uPT3lZy2CvfP3VHD4gGod7KOetDyUFRlBrsTl6GODxgImmTkxkDxfPruHYfO?=
 =?us-ascii?Q?IB/a4HIDQM5/Qrn/aCcbjlPa+hFy8xY6EYWmAfldRyrUBk95oqumB1SjyZZL?=
 =?us-ascii?Q?wj4V7v6IuOWpQv1gMKiLEP3S6h0vVjUiWVK7TZOpaO+/RyusXGe2WcGd8W8v?=
 =?us-ascii?Q?T9Rbj7PRlur/vz5N95pIvqzNNgRnl4EnU2roXQynUIjxwvrDqxRZ82nBPbC9?=
 =?us-ascii?Q?QCRqtAdXDhvxCknZucTh5aD044XFSANfizfwVyOjBVnFx7l7FHIEGyuTij16?=
 =?us-ascii?Q?0n6MGXTDfffDT0dybqCbtLlESOUSiIqBmbE+YWdw0O6HFTxmhvIXsWo46eva?=
 =?us-ascii?Q?4JdfjKH2fBbuDsUEJEX0sQsgOV0T7dJiV4wturzvqjhbDTXCNlbszV6IMwrf?=
 =?us-ascii?Q?0rnijcdR4oifoia8GJxhBOMkm4ghoBIpcK2Ktlc40Vi9j8XR2T/xQR8mB8SU?=
 =?us-ascii?Q?V/V4f9vPLdJYzt9P2ZPGfzcMKzqT3jt+cKpkxT0YTySHLXyhXEbV6SqIRj0j?=
 =?us-ascii?Q?JiBU1yfM6f2bi4dVBceCDplLc6PyjctE51cbLOvKvoXqQNmMkIXgltQ0M/oj?=
 =?us-ascii?Q?kx6HtPYJm1be74Qr13rhFG4DN/zk5zd6zS9Htwp0FjdTj3SWykjttgwA4sbL?=
 =?us-ascii?Q?WQj5X7LS2Zw/VHRF2rkBVPu9JdTKkSyrxsP79KBO0YaPlRQ6iEqpwE8Q3dlC?=
 =?us-ascii?Q?2H8S2IztMTkPkvcMvbpXLJcICR9nVR7RZPqumkN3FvxuC5rLJMsNi0WAderz?=
 =?us-ascii?Q?U9RjjOyuYWdQbbOnD0ID4u7FrGaZbDBqzljnI8OZwm0njC90APVML0Zvfm8H?=
 =?us-ascii?Q?vWurswrS5P0ejvt0yeuI2ZRlTWQg0YKZVHK7Nvj8blVLLyJTBsKEJ5YQRkhJ?=
 =?us-ascii?Q?gYruHD4cw6mXrgyr9IlYx2JnOVsvFaU1NqGUTUTgu57RtLJzs5+NkxttZjjT?=
 =?us-ascii?Q?7U09Qy42yNg6ttQPoKmut4rIHZ7il/aPvoUBecy4zxsaxGWJMT9/BbS9FUKN?=
 =?us-ascii?Q?xjcKKE2RG0F0ElyE/GeMmfw4x5CTjcWXUBmrjy26FmUrok4NROY/KhFUQamW?=
 =?us-ascii?Q?CVRxtQDivNdwBRaxM0cPXc+dq5PRlIJqsGmHbhMfAb+FsIC6j5ivuF54k0bG?=
 =?us-ascii?Q?lyOok5LuvsXzFIrXa2aZtJSt2d7qwWO5NO2iKwGvaE7074gvdnS/NVzQ0IiE?=
 =?us-ascii?Q?Ur8AOsR7Iq6z/ZkzPEtTcmCH5jCmUT5igg5NKfY2EBVXLMiEAVrEQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5M1s2xjL5mbJPo0SNduLKXi1U2WBD51vhBJD1rmbUVBJ2668NP/ofyoMmv4N?=
 =?us-ascii?Q?T4cBdCPpLSTwkjO+PpatJG8f9qH1oh94xAmV0xkcEtYNRTrQb74H8ptgkrnN?=
 =?us-ascii?Q?EvavUl1IlAvi11Wvjm/rzxA28qRg88cN9FbOHeukoBRO0BmSsoGgUVBJ/r4Q?=
 =?us-ascii?Q?4g0BojPx2cZAQACDXo217zWEZnYDiWVLLI6jKHSLWrvgKq1/49+Tivt0jKXK?=
 =?us-ascii?Q?W73WBQoPQhN0l5lAj4MVFCpiNU0TCCmeYf7wk8pzPFhJ4tJSlN4Ee2+z50GC?=
 =?us-ascii?Q?NlLBt+KBdrtygCsomksxV2hJZHcKuXjoy7ho8WAm7RZ6d9G/SevoLKr5Z0td?=
 =?us-ascii?Q?4D1jF2GSW4mv21QUjUcxtxxyiLbHTSHrdDB0XXEcUGsoonWQ5mU+6Vf0ZlUP?=
 =?us-ascii?Q?aj2q9jX74lbPqWiR7LXLiTddES36bDXfak0I2VGnewR17WPTBYkTyMCyCotl?=
 =?us-ascii?Q?O/Ux8+7QCMAO+XYJ4g9scnJAyAklnN95e5yJS9TxjVoEEUtQP9PQnbZulImf?=
 =?us-ascii?Q?VyELeyDzuF6aS/Pv4tmWeGxMZIsdvWZtjcLRs0jkOf3Rsyd3842x062lFdgn?=
 =?us-ascii?Q?klqhzmmoWay6/kmxk9+K5jqzdX9TfG8F/yNOuNwqVcC80o2cKTPijL8dFC4w?=
 =?us-ascii?Q?1BjQDNGr5NBlMoFQp2FYriuk8KUbLjhnN4/RP/fFHsodkAbghZOn1ZxQicTo?=
 =?us-ascii?Q?/qqlx8/QUAmF1tpbNobzIT8rXuAH5CsagY/ZPrO1K1bstMWIG+kQgCSjWMPU?=
 =?us-ascii?Q?3/7P7SDVdBq9T9YxM77DlO35k835svSx4n0VcJwZIB2yxyi3GnIHDH5h8ouW?=
 =?us-ascii?Q?FMNDScV+WDeZobGMuLbJv8c1mwUeDcTTNgr6DU0adUNNXRWBLgcIo88pjjL4?=
 =?us-ascii?Q?PDzOURh1XQZSnLRbuxkJfRfQvbS+JXXAZzj6s3F1RzeJnOSe4mjExoUHP11M?=
 =?us-ascii?Q?4/zKok83eccQYacU2753ajJf/SHN5OLuW0YbZ2K0sGBDVkvK1ZZhwW0BdQO2?=
 =?us-ascii?Q?WHHUcYDx7ZpD0ZPvV9O0guxMe0La+/FiFqAcN+gZASvhc4sD4Hk/Zs/OW5ZK?=
 =?us-ascii?Q?3rWrSAbKjVUdvTIZ7P0uQ8nI8fl3uTjtwK1RnppMHxJYt4bycK+S3+PVzKBe?=
 =?us-ascii?Q?7gBLvJxahvmkij0oHhFc4o9ICO7MjBbihrN2+nHgJ6S1GVOk8/uS3oCDLWKE?=
 =?us-ascii?Q?gZ5u8Mgfo8iDi3Gpmd6t1O6K7sak3DOcY1VBfYrFnpOutfYUpTHj8C6QWtaQ?=
 =?us-ascii?Q?jyOzrVhC/AEgk8RrZryaQV0eNJFvaVLyGFIJKIF+DYU099s010OdrXbj3zaq?=
 =?us-ascii?Q?kyFGbtk95flua9DRSkA6qB4kX5H3M67rfwM4mb+dOyWAJWKCOf0ih/4K0VLL?=
 =?us-ascii?Q?SX8Trg3EmZjSHY9b9jfqB0xX1yfEBOjHaBwGnb/YLNt8lTlxDDdo3nBdThLZ?=
 =?us-ascii?Q?kwEwJGylzTGdg7dfhWb3dCNoNtbeo6Kl5FPCX/M7MRb7rwBmxmsRrf3j7cDQ?=
 =?us-ascii?Q?Ymwl5ZsqpE7kjcA1Sf8GbkjYrGk/owJb5Im6B9iy5N7axDuG5KPA2KKkrhMz?=
 =?us-ascii?Q?wpahIM/hGJhoOSWNgyCoTt8uDiBpkZ5f+BC42PqV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d971d53a-c9ba-49f9-a313-08ddb8b6a5cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:56.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFJTkw/oZ9up97vI0CK6cx7/AS9OfHSu97YhqEJSXRFnCqsYBne+U6Dvu8MosNs5nQ1iGKGSx5YfKEDawQTV3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-ORIG-GUID: 80FuVvnrQrPTr8QNXbuoTmFKR0I9fJQj
X-Proofpoint-GUID: 80FuVvnrQrPTr8QNXbuoTmFKR0I9fJQj
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=6864032e cx=c_pps a=mTK3PmBKiS78iTy2M0NrJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=XrBnibYRAiu-7fe8YkYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfX6AE4xXtcJCan xIuE+E8Ojrl6JLQWps/Nh0euWMPBVfxiK0ov+slXmc37yCQp3GN0g1vjXW4OrnOzXjAVczmFeSo BBz2b7KserUiWkW+1r4883SQJfb9G2czKFvVx0dxm+u4ObR4/8ZeC06BrVGRFzxn+8gyONWJUgB
 wP7LhSMmMZcOeFAI3PDVYRLXXb0Y1JEduo9uhMBz7dxoxRbZ0KwsdH6LqoFUFtwiyeIrWFWz+is mQoWwhnyUg8ZZ+Il+it6TQ+Y2HoGIpgFtEc6Bp0fIFpUU8kSSCfQ/3iD/ciMS+vjLKSSZ/ttgpt v2IZLASgv9Rr9w52gRZwW5tXuZ+vqEd7Gf1+W+t3Axd+lWzjSgUDO+Rcx77GSRHPcozYCuyHU3z
 VlSdqJaivh5UuYkEcxBAMZ9G7sSSmZ7pZc1CfMD/CfL2Hjx6Wi5+Ef9Xx/ldyOJWp01NX4Gr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=830 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219594

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.

Befor the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libassuan/libassuan_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index f0b7746284..6ffe1154ee 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b807
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig multilib_header drop-unknown-suffix
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.34.1


