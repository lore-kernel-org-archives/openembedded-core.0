Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3439EC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12989.1784293290421259221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c8+/SUIq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJ6FS1111860
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1Jv/bDQ4Y
	sepxj/DkAhBpfCqrBzla0EDTyLe2BB7Z1s=; b=c8+/SUIqnDzpxPuJ70H4FTI09
	aVHzEYxQfNVWPHla3HbUuwwAIyZ3udVZ24kz+x3iwp8Wz3QEFMEhO0u5CDgfs2K0
	y32NrgLgFacE+GgSQ41C2+hyK/LBiX+skO3gZ7IqArYH8SlvlSPaJmi5GcEIU7jM
	WW1VqDep5v92OzIMI4jDViJKdGcqxyIDPqpPtl6Lye8+4Osaewxo9UCFCjazqBGR
	cqyTDbsI6g3lC2TpUFlchrKPOBzW8z05XK7Dz38cL7Rnt+waRu7FMvkpt3wYBcrg
	pBdpMBrc4d09kC+uteLXGOQXGPWev59SsDKazXBK3kBkftqaxn+rD0XJBuFyQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn58b4j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0v+u27CpnyJ22nN9iyva4O8w+niePN6gyUcUyJ3i/BNGhUNLkGo8SQQ1lBl/ELbbbceML4CCZt67dsgpxtriDegUAEUYI9tOjzVMbTdFUyM1vab2Hkd5IQU3QBhfEwInbKonIZY/A2h+nWcxSDuU0/NiccQKKYmb5tUjAiax2p21MC1PpPOsPJlwMFYw2Vm/Z7Wp15BfaLxjUUjpAGoWTuoI+k4sFy6USgQQZ6PIoQRA5pPYc6yHXD35mT7ybP1hydoKUQMhDFoABQDvx1/sn22RoACr/rIujF/L0UaztuW56EHbJ6V9+YKqb0aF2U8kOIRtCQIgbLC8D4sbDHZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jv/bDQ4Ysepxj/DkAhBpfCqrBzla0EDTyLe2BB7Z1s=;
 b=OovbvAWUD89vkkSsPZsHql2iSjaBNRf5gnV479dw8HPBB0gagHnKTVzDQ14kSWuFNv/YA7tePaXwtLnIgw33QZIZTKuh/lDxDL0st7Rqps3D0VA6lA09HWycpnL3HOABaa2J+8YMPs4UXeJ5E71XuD/PBj2PA1uziU6YUKMCbD4jreyxKr+Qt47GXRNjCA31nJhycfklv3SL0w3DWDHY4r/uQBIskFFpRNi8mqMhnhHd53E1r2fZg44PYh8K/oMie4LBVEpqnszgn/dTxZ4ByKAGy5BXx8e0iX8q9Q28Rt+0FZsD1Gsd5A4SirOo9k/rD1m+eDygy8Cm6M7ol7kY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:01:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:01:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/4] packagegroups: Add packagegroup-core-buildessential-rust
Date: Fri, 17 Jul 2026 06:01:06 -0700
Message-ID: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab94a08-10fc-4017-54c2-08dee4038271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|11063799006|6133799003|10067099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	jMj5CKhiCKcHVqIWOygKTnwfrGd1Xrwf0AlCxTa5Gvw8Q/bI8hC0EE1BC/8YgzEepUFaOirGAWNizhFlSK+R3r8m5mFA5Ejg0Abe6qXQFQBJzuKFlES3hTPCpSUBVeGE0V4EQInf7yw+9v2VmfocZ0tMIkhY80NhNrlPn6zEx+Xmt6gd2JrpwdY2n0tX5A2BzYXYjwHs9FebQGj0nLlTZsIwc00ORAzZwk76GKbSUgidfwwHqZOmbNb/yehpf8pSw3qgKWhBNpuQs01cbEkfQP1aXah2ZwDkwzd98JAYuZFB6jO1Eq0cULtD6aDuZIWkKtuosEMeI2MSuChyyIndbYqEoggi0uhZ09W7dU88RFHJ3/emNn7hoYyPuqD01syqwk5Fj+1qs/u/gomF8nwelaHHCkivNEbSBQp2ebRo3n6Af6CBHHT20uMJHAwtGm9VdZHE+Z25jCJ8ZhWb2P+OShNCp3iJbcI7iyCMalkJ5MgAqx7gO/S0b44K/gf21D2NhWNjSOGsZSiuRoVJ0/sAcpYgygwsuoRjzciU0eqMm8ecw1Giom5Rl3+tjNeraRS4hq3KZSSoac3FGizgyZekJTLFSFhHHOGjD2m6j9ARxu1catbBbIdVV6qARWs8Fqde8JdHmp+1R0KMXVocUHlf1ubqASVvdFIcitOUGlXZdiRx8YZ9aqH44Pra8s6cX36NldGTBTKXM2py/6OanHjwbh5qnnJ5M84dQtukdDt3mBc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CWq5LO0kH1jIWMG23qBbvwYyveaPFZEbFltwu1uhgA9gGlT55XD1enDir4tp?=
 =?us-ascii?Q?fa2jEMzHfMdq5EppxMGScVakvqfJj63FU2U4zhE71K7+IRGic+geeeY5TUOe?=
 =?us-ascii?Q?lb2uMOd/JnaJ1+nIzZAmAXL2q8c5zG3I6g2r/p1+wiIfRJhrsyTi+mUhCO7o?=
 =?us-ascii?Q?qvI5sSW0MX12umZpzorCxYlOL+C916emnImjUdtdP+0jhSOuOkJchMrMyURv?=
 =?us-ascii?Q?ALIbZY+koHyW3ahiDo/sCFdg56AzbKKVIqVaXSD8ygJbzjaHqUsSI+lgnLdT?=
 =?us-ascii?Q?0OUsKFJDTYvyGpyVCq+F9h4ZYKl7wI3xjD955bVlbw8hlWR5pD0fCIwSRy0s?=
 =?us-ascii?Q?cqectR8NTtOFLqVt2tWusSIiiiow0BfwLUD1Ucjul7OUoMrt/31b8kMeKozh?=
 =?us-ascii?Q?wwCQaU46rea/OaPCefUX6BsrW5vJGrzVl+d8kD9vVu2GQp1xlsz5SyxQsGrU?=
 =?us-ascii?Q?Z5mLehHEJup/zrsjz/PrGl4phxOy+P1+Xy7Rjw5Z0k8xUe7wOoA3snpVNn1p?=
 =?us-ascii?Q?AtE8NcQjfVC84rvT2oPsRdJotiogXTTQL7fEg0KKHGea9HZ/xYCOCfMj9kjI?=
 =?us-ascii?Q?07ujP7NMMpFjp8zQJFeuYEW2kHXlyS1ZvcuUNKFJlBGzRk3QtCQf1oWJriS/?=
 =?us-ascii?Q?dHLGgzN0ErHgcW1vH1M9HCjnPK9rQaAxpPwjsxMCXLRW+qXqesxraVT5GvIW?=
 =?us-ascii?Q?rVKeQCgy8NllzG/9ZsVJPwtPHodQvab9uygtkhq3j02Q5lXnpQTf7BhMDrzM?=
 =?us-ascii?Q?p/euTxB0Ar1BgYoD9Ky+T9n+k6cfhfCX+Ux/mHomBSl6Qxm1yeVweSb4QWqg?=
 =?us-ascii?Q?JDVp4J9WEJEJf0qYQ5gMTbLYkLZDsgJLr9bwUeZyhjusNokU1ONPRJQqMeuW?=
 =?us-ascii?Q?x9cKoK6gRlyGvDBoXrKBdrSAlTmlZopdQBxpwK/mGJ9+aXExNdUIsqCc459p?=
 =?us-ascii?Q?biaRN/eHgMJPkFORmgMPkDHwbeiRuwii/HfYOf9RwUO3eRdt5pxZoQZhje9s?=
 =?us-ascii?Q?QNPZ5PyZ1lHZArg4gtQvmsgF83rbxiuT71JkRxL7ar+FAvJYohhGTU1yGumt?=
 =?us-ascii?Q?/YK/6KIqiy0XF8YSVfgbmONtBdcJetqZ3tLvvfthb22mtQDdRhI4ZS2FF13C?=
 =?us-ascii?Q?E5ag7p8JyqaVXuEGRFpSwJygEJ/e875yB+LMXxg3pHpdllIRDwyAzzXkDGzO?=
 =?us-ascii?Q?xg2Hh1s4dwAbif/cEt8NtKJHmL4iyLcmHt8OMBOKsaNlgNVb9gBva0KKB02r?=
 =?us-ascii?Q?9hZ9jZAeKmvSEcqHDjjmn2er9LPdltA+gjXrObAxX0BS/GK/uKzRvVd44fE8?=
 =?us-ascii?Q?PxFj/hkzrgaMV8NDP6AQAnx3nqsXbjpLz1wiCWFEnGy4oR2+djhweLWWDI+t?=
 =?us-ascii?Q?l/l3jfQdPY4HvolYGdxvXlnJZLZ19AVucOEcPTmracUjrcO6gTzM7dzK9nfR?=
 =?us-ascii?Q?nLVODh1ajGWdcHd2kJOmwOzlBMH+uF5dtJoihlzj6g4/7BA6IJM4XKKIVKNC?=
 =?us-ascii?Q?xdZChFw8TN3wKG0QCdvv4vFLU72HDOIkVk6oxvx+7I0UclcF9bu7amd2QYhk?=
 =?us-ascii?Q?yMGaJrRgt+zIQDQ85T0zamb5pja3qjssYqG3ODt6dO4Kq2Zc5Ct761hYjj7t?=
 =?us-ascii?Q?+yBDdl+nb8pmqC0mWM07zywpPpKmqSJkF4zDmzTasqJKI1+lgUmGeKRwqETx?=
 =?us-ascii?Q?xbFoLIg3b4q+1hzWftIzJIIeYxk2PWmP3elgPRdbNoATn9wftsUfTAZVV5R2?=
 =?us-ascii?Q?vO81Gs4B/1G3zk9sRMHdYjFTDy4h8+8=3D?=
X-Exchange-RoutingPolicyChecked: 
	IYWpd5udPibxRhlM2Z7PX8cy+2cn89HFNfNQm5KZQMPsOw84MSquhtrfHhy9IeaF+KBcruL1ozjPMSIQuTiB/fWbWzbSXgp1qkbLY3Qd/jPacWNKHX8f83XCnPAv+/FjB1AnHSI9rrjPBNvhKTA3E04R1cli4PiKVNYrDhIBU7cahP9ALZ2DgB3CmNCXvJgFx1KDCaQu5V6jHTRu4eXGH/lujCMke+Vo9IiMYNIjTLPXalLOzLXrqCBfAWFkHaXOwhuVYSsQx/NGtyDcluHpQeSWI09qxrbq3btImEmtkmDL7nrwB465yEDkbIoGJw2ZTOPBqWu0YEx6GllwSxDApw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab94a08-10fc-4017-54c2-08dee4038271
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:01:25.8534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNfETHGkmpx1CVggjN/1c1ImJphdhU+vMcM9ip0UP1E+Seyf4wMt+4VwjDec9/JlwL0rJnMaaKU2vWRDCpxyl8tFJe+E8xOdpebxm/sLKtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a27a9 cx=c_pps
 a=P6W5axN73kUBBlOjEPV+4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ykIo3778XL2VIhXAJQcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZD1tyYKGA8nnzGYBkq37AZORfh2gBV0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX3jmfb2NOBR//
 lrpQRG2Bs1KlpiQW4coyh7u0RBGXaCd/O/StjRAG1c0pVzaWfBTah1spSLf6plYHH5Za03bXn+j
 kcl2MBccT1d3BrO6yWRMvsq7YIEFy55z+r1T9ST0SnpqBjCLSIX22QIPkm0GMih/S6pQlcEwb30
 RiP4Ri7Jw5oF28iYc02L7O0bfUcdsDunA+FFd0i2or+JKFM8jM1AFm08w6mpFAp7qJUdrnjPh1S
 ERKL4lAy1Ppf5+0kRu09YAjNyvBoMT+DhZgrm6I6sQP81Hw+fF0S+YtSBZA6GjiNIAL9OZ1Kug6
 47jcb4+3UQfhzOEHb+rhd+DDCpDDk3WqfCAjnVqkioJ+AcJjZJCyJ1jbfq1NuMSXpXZE/OGnvc1
 ED1uwOL/DnTGMnTI8Jp48VDS/5lKJRFiqWHHiBavnYUaklY3HSPi8OflMd0RZ+Wa7W6G71T+201
 8RNOkt7pM1n1LqxYVrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX2Rvp/tgKzq/N
 QYxvVcfFfIAivBwVdosnJBRHg0NgBFwy1TNN90M/q9QNCoEEPt/CDtj1tmHZqH5VBQKnPfXvY6p
 phq1F2HbUNRoZSq0lemD3qLgSXlqTRXBnW7Ftd/wSt3DaJG98B/A
X-Proofpoint-GUID: ZD1tyYKGA8nnzGYBkq37AZORfh2gBV0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241176

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Introduce packagegroup-core-buildessential-rust to provide the
on-target dependencies required for building Rust-based kernel
modules, including the Rust toolchain, bindgen, and libclang.

Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
default of "all", since libclang is dynamically renamed per
build (e.g. libclang22.1), which is incompatible with an
allarch packagegroup.

On riscv64, also pull in clang, lld, and llvm-bin, since rust
support in the kernel on riscv64 requires the LLVM/Clang
toolchain rather than gcc.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroup-core-buildessential-rust.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb
new file mode 100644
index 0000000000..c1993af9aa
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb
@@ -0,0 +1,23 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Essential build dependencies for building rust kernel modules in image"
+
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = "\
+    bindgen-cli \
+    libclang \
+    rust \
+    rust-src-lib \
+    rust-tools-rustfmt \
+"
+
+RDEPENDS:${PN}:append:riscv64 = "\
+    clang \
+    lld \
+    llvm-bin \
+"
-- 
2.51.0


