Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B05EC0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 10:16:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14445.1738059414210446617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 02:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31232f65e6=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6Mx5l000526
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 10:16:53 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny709nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 10:16:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzKl4wbMSxHuly+/LqKEEKlpe7LoDdiYw3Kf2vxNOz7STVx3CRffCTSnD7fHAJlKNqYoEZp2SVicv0/MvNmledwR4dMniSb420MVJ/1eyQPD6iG7zpSmNC/tV8tK6Fj6c9Oc2LlNwIjNvBpOqLyam8ILPq0QzqmdJCvFAduBOu8CfMQvY0ye0JGE9BFUJw4TNRXJEhnqrXZPsS4PgorqyJoULUoYIKTAyS3lFbSvRDwSwXqKlHH+wbKmgyZ7ISaeHBsplRvuc2GnpGUj7lRk1sAGoMQY3ThWxotNXyTqu0LVM9LxS3jpx8iMNdhKbE/5lJt/qmRTlEFSFb5+g5j3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x06AjF71gzOidiTy480hvPknVyMmbcCRM04grWR1UiQ=;
 b=r/VnLNOWRDn5I2pUOnktSnvhZSFO5x9kAGKJ5aYAFsPlG5at7yBZikPsesEW2azAO37hgrNYe/e94OyeHsVqZandlZxtx1SfinzyUynQWCZxPenElpCVT53SceEp3McaUhDmkHlReemCCfVRvMhGY1W+2i3RKxifkOt+wsNNwX1cwUJm8wi51C71ztUeKgYqsGk7kKMVVk1Wrc3QUOLyNgPeAIVYxDstAX4010DV+0PxnkwQK79DPe8haPucsHoBngVYS9G7iVwK21of4PBnK2nDB+Ap9qCkNDs1WzLFhnMczsBU+nFbZWS9ja9SP3E6zKBqUYIoccutjE/Criy4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 10:16:48 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 10:16:48 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
Date: Tue, 28 Jan 2025 02:16:33 -0800
Message-ID: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: a83aff38-db23-482b-5b68-08dd3f84dfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cDdWPo0jF7AVcxyxnFOb487fhGiBO7qEBJF9/9A24Iq+3xqVXy0fMSpdOVwg?=
 =?us-ascii?Q?fUcX9zAqBs3Y8qi9QEH+GfFIeWPXAxUfRg5evxkexIWncRqPKYiD7Ct/yL85?=
 =?us-ascii?Q?j11X2HDXtA1T0y2OrYKyzTYLwPzwNpokQUIGHDVxF8en736w3vS3XyBOzqeU?=
 =?us-ascii?Q?cKrXya9vl9JtgBCR5FzaghV2Oedg7ep62yxHsrO7MnxLi6YoZuysJ4sl4vvr?=
 =?us-ascii?Q?9XmtRc9AE8rnm6HTGPD6Ic4sbRUdKaVpuSMQSRGh6mQTsyUX8Q0466u6xsYE?=
 =?us-ascii?Q?IFLIZJ8f9/ebuKQk0c9Sj+ZJZz+FtGU+ebibXwDL/PsgffV5VA4+klOrRqwr?=
 =?us-ascii?Q?4Tt5qU03K38TA5jvVP3HiduiSRvWZRTdQGRRD9v9EmS8XxGhyJ0bHy3ERm1c?=
 =?us-ascii?Q?Vdwa64ZgvrDqnX0MVjIdy6ErqlFzWRQbow9qEGuDY8e2UmGYyIjTwc9VAhgM?=
 =?us-ascii?Q?1sCu51CcWny1/VGpGU5YLCUKuKhjlbPSxl++x6CN4JfXzjdz+nuyXGyCQ4vK?=
 =?us-ascii?Q?srlY6K/wJPS6PCGr0as0zjWcyi1V0w+A0NJBq+A0NOz1HNfJftE72Wk5d+p8?=
 =?us-ascii?Q?bNM9pi3xHbcGjWRIY6X10YdPakKoCZ2Ec/0aCqPanD02R6nFMQrM4sEDrN8l?=
 =?us-ascii?Q?zOry/Kg2+FrTVfmImwS7Pd0T/jwzzvS1eq/V5Dcp4zkf+cxNH4FqzKurKZ7n?=
 =?us-ascii?Q?WpjOvbTVGAUvEKSV4n10ftRxDREd3KzsCjgz1rpqwgRDs3oPKmIkkckFpXum?=
 =?us-ascii?Q?cz9d5EBpQv05O340kYbVBgjuZ9ORACT2SXgmtA5T3CPKjIMzIunVrgM4JcVt?=
 =?us-ascii?Q?+sqp8t4x/7nDgN9dxGUwSu9g2x6CdiX4Nw1FvqpTt22Q66XL7IZEKFnAqAfQ?=
 =?us-ascii?Q?yz7G3XBcm57w8N2X28JFaZyTWPOMgyZqkYoHt6gaOHqTXgIxRPJxZRCizfbD?=
 =?us-ascii?Q?DtLsydGHeYabqqjbux+OSyjewmRb2EOj8EwQWwsZVKGMWSgl5vS+9G02rqVW?=
 =?us-ascii?Q?V2f59rbrFf9xAlMmUmcN1xfXmXmFITlaXLY8B0qDFLDIR/jTQRTKB+Rd++Iv?=
 =?us-ascii?Q?GgfZ38ekMurDq0BNEWgoV97uSdZMB6qPbGgFkZY1AbTkjI7bzqmI3YrkoTqU?=
 =?us-ascii?Q?10zgC6v3V8DNMywSDhdOgY7XBzg8XTEaH/8zPD+QQE5R/4z5JzGR4i9l3H5L?=
 =?us-ascii?Q?6sJsNrDPwTcXYpovvCxuiQBwSUc6nrUXik+i3QV9qmNg6m9OxEjFCNGU9KJv?=
 =?us-ascii?Q?Mk4z/CM+YVBUyVmeXPldSiGcnkDU0fFPlb9UPHPY4icF1DNLoJrtYZnzYSGF?=
 =?us-ascii?Q?EcIjzN6Q3Pt64yZaP7ue+o8GSyPrOTL4ENhzkDX0vWi9yTf0izKeT8Ati2bw?=
 =?us-ascii?Q?XeZYAXlpEM4aerym180z58qGxliEDXBqmkZLR8/GsLToW9TgAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y3OvQ9LdKfFqJHoUP/W/dOR0Yga8WlcyXBs/iabuexEhg2KDtoDxqZbbuxJI?=
 =?us-ascii?Q?0h1w5kYEIFltnRS9nxwiaTfKlNqeWXZ5HF2rrGT39C8hBdLudBxUDZx2pk1E?=
 =?us-ascii?Q?2eloP4/8FBct76jqU4MZxEhsTlRF0AFkohrattNt2lhe48on4mEjCCgOsDOT?=
 =?us-ascii?Q?S4NMU8J38OmphU0krpIYZb4WgsPE9mQHBhjwB9292IhO/ZlmSEGKF2xfTuj2?=
 =?us-ascii?Q?krtlT6QlOyi/V8YLpBBi1RUK4Gk4hH1FcKzUTHk41ICC8sdBK8NU7mMYhuex?=
 =?us-ascii?Q?ulyb6IYoy0ECopHIqz6gxLqjy63tz9bjDny24kvsHHp7WfcaeVVuf2LTt5DH?=
 =?us-ascii?Q?qjP00ICK+k6mRB9wXr0w3FLtY0GcQuAlzQDNcnVo//3I/3U1nOrK7uGSmCTi?=
 =?us-ascii?Q?ulMscl5BiUV4BF89FNVjXyuBhBponhzerFXC55pQcVv+4DJctRD9yrAvgM6A?=
 =?us-ascii?Q?0XTlqYR4F5J+POTwkkLZkd68pp6aWEsQ+N3OiFOrYgfNQT2sga1gu/4UFanD?=
 =?us-ascii?Q?mJ06mY44q7rOGzCxm8uZYapzl+SUNEIQgJMvRAvePgkag4CtvWM4ze68S+n8?=
 =?us-ascii?Q?PAHa0UT6y9FHBFzThzBg32ZlX/Gi6qLDa1Nvwz9LTdxcvVVX4PZebUbATfwv?=
 =?us-ascii?Q?LAE7XkB67t2Z1sPfWlZlGSzWCkQZZSVz//neNGt1oFGFixK0FaQBZudlnHDj?=
 =?us-ascii?Q?qyJmTNF/KDTvZJ3j+bpQYDuNjSg/tI6IT3b7fRv6ab0DBRLEXXYwl+UXF/mO?=
 =?us-ascii?Q?Mf2BbwMY3zIjlN2NZyfrsLGNtFCgh58FtSUkr+UaCGmXDVMehVlLkg7BBKi3?=
 =?us-ascii?Q?XVmzADSjUwSQO5hoRTFj3zEKHbFDEV9n1M09cFAWzHKbWVqMDMNzdSyPfPdV?=
 =?us-ascii?Q?tXCMKWkiuJtLHkKDc25Dp+o4QZdAT4aFGW3F185DLUbW2K6kePbZ6XEIuJ2m?=
 =?us-ascii?Q?EYnu1OLhLUaKBbE8qDHOLgjO+rS/c33RFKHez/fWJ2n90LU69JDc2jLnBc22?=
 =?us-ascii?Q?7ASBS4JlOKQfrvav8CuzWqi5jeQio6EdQlYPcYlsdjjHwFJmnnC+cH9ptGL3?=
 =?us-ascii?Q?T/hst2to5D3KEKQepdXbs37LADp55IEJx+rvln6GVu1ro8uLZj+7WejVHtHg?=
 =?us-ascii?Q?R6HKjREePLgPLemiyKkk3jwssAiw8g8hgo9ZcIY8PPcVLPFugyqd/fkixErW?=
 =?us-ascii?Q?fp7T8g343zm74Cn+khdXPg+PJXphixQy54Iom18AjFoPnIEfWN8+cF1DuFXp?=
 =?us-ascii?Q?6IdKK44IjFcBGlnnkuQ22yWIxubwgT9qmsP/S29YRUD3Hj76ekbR3qf4940D?=
 =?us-ascii?Q?ALvzyc101RmXw/CiAxZzZVLIDABz6FMG1PRAlZPDcwBgSywUqc+ROLgVe64F?=
 =?us-ascii?Q?0KMjWXhCAFXG9FzFW7+bXfpeTK0DMBYKzsBt39BgkkYpGWQXZwwZ+Sg3DGZV?=
 =?us-ascii?Q?NOuGGdl2KsGxyRfW7YVQuCozfW9IroXMkh31qXq1MtTTAKd5QvTcL7lAKaXa?=
 =?us-ascii?Q?vSI2fbJddht9bAjIuPcKscyNAxx7SRHR/0CApH5MotaYY2jYA2pSv47h8M4C?=
 =?us-ascii?Q?XtBMVebSrwO+q7drWM5CgLkC57SkP1gyGVgcCDyMMIXiJe1+2K3lE0Tv1ug8?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83aff38-db23-482b-5b68-08dd3f84dfdf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 10:16:48.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSU4wAmiEKoYSd/n+SwH4fHTppcObmEujlSa69eiO+RKgPQobVdyoOu9mrYt0HLnRjy2wGoqsuIVv4MuJM9UKMo59UkFNSBmaz0F/PCreyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-Proofpoint-GUID: B2IpmY2_ZZylMEHe4c_abCFcvoqXGQNU
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=6798ae95 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QIPeOADUknOK0j3mi54A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: B2IpmY2_ZZylMEHe4c_abCFcvoqXGQNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501280079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 10:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210315

From: Yash Shinde <Yash.Shinde@windriver.com>

Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv48/Sv57.
This fix enables RISC-V's configuration for Sv39 by default when running `runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qemuparams="-cpu rv64, sv39=true"`).

Fixes [YOCTO #15691]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15691

Reference: https://git.openembedded.org/openembedded-core/commit/?id=4b4450ff695ef73bf7a2437e142d2e0730d6a547

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index d01d988eee..6170ce65f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 = "0x80200000"
 # qemuboot options
 QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
+QB_CPU = "-cpu rv64, sv39=true"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-- 
2.43.0


