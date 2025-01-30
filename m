Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A05C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 11:33:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13427.1738236836434546889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 03:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41258a3d49=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UAj3B4019021
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:33:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72kh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:33:55 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UBXsnr024457
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:33:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72kgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 11:33:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uub4N0eqrkU+zfB8cV+ExSFFpIORH6mZqRMfMg9ux2l2ExvSHIqtK9t/QJ1SBnNq3ZdPRUf22rT5UuhMCx+zQLDRBrXahg50ihm5TKyDgccVekVB9LU6P0mg51VtKSUrL/vXgzENTdIkGFWzS7g3Gjtv/LJ+gZEhl3EJx0VowEtS56RBvgROprnJmLJXOe39lDphsjloaBQzFmN4aS4m3CzLMoc8Y38D1napPZmMxWVOGlQhpBVYCq6eKQMI+z5UWjNwBlh0I7N+zk9TpUeh/4Hyfgpbu+XnQE8yFmNGgkcS7DFWwjZNUbw33AXOxz/Ingpzx1dZGQDCnSI89TyCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR1Y8XwAshTGLwGKj4MG8i2y0XFoYmE77LC6mW+342Q=;
 b=k/4VA+lTdWmFtdL3RMUHS0XgP2Xaau8FMER/4PwPBE/+oaflDbSawe//JwUdIXMemzziSMfOCOm6F8e54dvR6cguo6HdD6eD/AjjiW//X66glyp//KRWanlqELx0Segq7uUT+HdwkF9i4bfIjViCm/TLDtOgiYTGZc6HqpIZb4J/ruaIwGR1gQVggmYmCKtLHhRlYDCGNSVNReIkLeYEljWmNVdIOwl8yj0bx6YQKYXkPZNilK0u5tbX80PH1MSTz2xlKsQIwhb0gyXegJXzpWtawYUaCf02fvmcrxUXcyommrxCid+n78YZQ16wf9k6XrIdQ1dHBrqeIFRtqQ0uRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 11:33:51 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 11:33:51 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH] binutils: internal gdb: Fix CVE-2024-53589
Date: Thu, 30 Jan 2025 03:33:33 -0800
Message-ID: <20250130113333.2212824-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: d0aadb1a-e80d-4fff-e105-08dd4121f832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d0sXNfeIv3FUVrupWaa27QH6eVygw2VIdtlUeS1ALf9MIpA66ZQzQIC/J1+5?=
 =?us-ascii?Q?Q4X/XcHTe7vvsnJ15QMzHt5YrsRoh2P2zX8jRD+7aI1N286N5RQ5VdiVOpD/?=
 =?us-ascii?Q?yQDuLxTyQvRIBn1LBf+ODes7zqM9hUYeUy/E4xPgE7hbEG6XJrne78UJ5xut?=
 =?us-ascii?Q?3F26sREG2t3GEu1ISTI8f3TELXSi4AySUksPpemRJAznwFWYe4oyO88SI4or?=
 =?us-ascii?Q?98CcIsuTD2Iv5oSPPC4Tl+49Utz9dF++zVg6aUv5rNdV7Qr/ZyfLHvM8s/u3?=
 =?us-ascii?Q?zZMXbpYGstmj+AGXcb5kRYIvyPA8YwMn6OL4nLrqbO6HaoPCmOFa3CFO0eO9?=
 =?us-ascii?Q?AutNGVxohght/tKxK1OxrFJZ0pFX+pZ9u9otaVCRjcvDo5qn//Y9WGg/ZtBT?=
 =?us-ascii?Q?wlJD/V2BERAooZ2E/SFEMi8hOYlb4dtaiDCssUP6soTJ4FwNYutVdeSMJxEE?=
 =?us-ascii?Q?shYKXv7PnEEgF9yp8xkOCXi/hTQf0dt2x2P4Oy8SDL0sWGHnn/gSxtnpVeJy?=
 =?us-ascii?Q?EhF9ODXcP/tRXzVsxtKnvc3P0Oj6WKUk4kGz4VMLzqCxMaCVlkF8rt7dRpn1?=
 =?us-ascii?Q?0n2IKrjZ5eyINlqWGUEDH2S/N9F6DR+ge5PFuQhxDEKry5vjcqyhDBpddShY?=
 =?us-ascii?Q?PVRbP595kV0kdR/rja5Er9HzOGBImLNKB+Yi4v3u5WYrSOtuvJMde0GmvdLH?=
 =?us-ascii?Q?1BZKrs3cQwYmgkLpgPHgdubmQUWyUdOvNwvzCmYAEzdQ/S41opuvwIQ0wxoF?=
 =?us-ascii?Q?Y7A4CaNpZf6LQ5p4Mz3Nv5gNAwGiLo2LiP8QeI1GqdP3PYX6v++YDTNXq9l/?=
 =?us-ascii?Q?6ZFmkBs9zIZHpgHuPOAwE7hmKBYx446sa3u4qgaN2YBBpTtwztrjbi9bfrpj?=
 =?us-ascii?Q?9roiQ2e1fPrX5vHoLCVEO5Qlf5o6llKmXu1kl3K75qgtmYmCORmUulJ8E/3j?=
 =?us-ascii?Q?rrLzjjeQz9Xf6LtYgO+Psq6FMTsa0j0MAgOHQ0Qc4Thz4867psyh/SA/ykp/?=
 =?us-ascii?Q?JjUP8WX+R1y2fe1Pih4vyKopQ2gQCU67Yqus+wSGXuw4akayObDl7cOlUrLs?=
 =?us-ascii?Q?Bne5mRTXe1vNT0hNZrleKHNsqPQo7V0oxhB8AQy6bm4GRVpSsf8CdISb6ei5?=
 =?us-ascii?Q?10EARoBbJwIAbeZQJweKXkhZ52Nqsic1o9LNU8RQst+DHmDtRrYhoLXSevcr?=
 =?us-ascii?Q?W66xvLkMlA7dlclPa5ThcizgG68b2zqYt1Ocy3O3LAvl7HuAfBnAeRYgRDEH?=
 =?us-ascii?Q?Rm6cEAcNsQIJH+ubJrcAqVpZmGt2AYRDN5qAD23xTfb/c5c0/OLo4LhxicZi?=
 =?us-ascii?Q?pxTy/E/HfaQtifnhZ0Ih2SsdWsnPDJvSLGTsIqFK3auHP8mYChzBvfPJiHO7?=
 =?us-ascii?Q?xeK3FyDAkzjPNwc7DqTV1jHrNTW5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1S6X7MBS0EiYIKmyTRVmrRd4mrYHdYVewKi8aIuJ/t4gwqb9b9lTXO6y2h16?=
 =?us-ascii?Q?Bza85uPS09+KTc2Mlo7NakLYE20CzEIyChABNOLHfx8J8KkE6DGC2HoYW3Nz?=
 =?us-ascii?Q?nt4OwGKQlnzAqso2vixJL4IzJY3yRLJJPQySwPw+c3EmjyJW7GO7kU0oVpFj?=
 =?us-ascii?Q?2sFNPFLX0d/k3GIUH1dP2Pa3QVbQJKc5SIBPYVrNTjKfBb3d6kn14Wr6f+oT?=
 =?us-ascii?Q?EnSulXRe40iENalGpPDclPjajdF9MmPja0mE9W+BT71rr4dtjvq9dZ2etvQo?=
 =?us-ascii?Q?yysXymGuUFqKmEPF24fOWIjzIcaXTK211zjmD8E8aWJcn7A5f1hui2vhJU2U?=
 =?us-ascii?Q?KUZSvuCJ1UmyYnoCiSgwVC1hTYR4cXfoBewVXzszHH0KDqcPzPSoXbsmALzv?=
 =?us-ascii?Q?KsYdVtRT+CUC83L6Bh2Pz8TUh6I+91cB2UE2Pf06lhnude2C3a5w4UPAmJH5?=
 =?us-ascii?Q?yxiH6+P4GgLXMNRFd7zuUfLTUyh5MQ5tf+TDacaR+XA0bNmfr68d1YNCKR65?=
 =?us-ascii?Q?EhUp47grIO3GCBLLWfTi/VPXtnZRedj1jhjygIptCOoz8IQdcqooUg+krApk?=
 =?us-ascii?Q?un3Yak35j7/c9bK7FeiXGIB20OQZmtq1csjO4EcxZZI4TjXKSxXtUCvXsOIm?=
 =?us-ascii?Q?yff9SUYlDE7Jtg712T6cEoECeEDUqkyOBTT5HXrnvyBzPXvjNG7LBpcU429V?=
 =?us-ascii?Q?tMQL+G355oHDnwgmpX863zQVi5HV7xZZoF0gMv8SgurVjVFKYfXwMrjEejUC?=
 =?us-ascii?Q?tw3aANszjC6z/dn/QAQONs2focSeROtpCCj8Z75vdXJzL2btzUKyYZK+nuBv?=
 =?us-ascii?Q?DdzOfGFldkYAuMjI1zFSiEVMhZHW3HXgMO0kwPAQNryiHNA0A0RfQXF2PVem?=
 =?us-ascii?Q?sWSFctxqbpMUs6Y4bAyYxPk2WRe33D8D/lZuiC/iDUMglhWOuTluwHZeAcak?=
 =?us-ascii?Q?a9jiYbddSnUtXHzrmJgD+DrworjYNmYXcq6cND5u2fjwiSmW4yJIpRmMlYA7?=
 =?us-ascii?Q?D6FSV4Uw+L6xgCXGbu7UDFISvLENYgnguLR0wjKZdpOGA2oLG+cw/IuHuVsS?=
 =?us-ascii?Q?X3y99ZqiHAms10Q+Xbj0ERYDecFrdFhTuy7M4bufW93cux8IHbV87WrdrnGW?=
 =?us-ascii?Q?MHZh90TF21GTMFPwI1hC09EVsnNzdIg5ZPTDnP/Tt5bjY/IxlLEvc2UWYPaT?=
 =?us-ascii?Q?x0MPQshJiV2k/hEDfRMJlpw2e7nvvpFeVlPnLchcq6eza3bxWcpyNC0anQTF?=
 =?us-ascii?Q?WcoRDutP5BcBPCfB6JGAzr0s6LxXzmjxX2goXGmGMG1nk/1L03fcY7+6HGNk?=
 =?us-ascii?Q?UGel20U6T5y4IOeLgLfui/rN+Q0GvBud8W7Vb1JqL8A4j7AuXpLU4btpoNTE?=
 =?us-ascii?Q?bBBQfk3b0XGYeCBVCseIAqT+9KGhZpCPl3d2gcq3X9V45iVmACRJ/TQN6Zuz?=
 =?us-ascii?Q?BtjtG3iIGsfaY0nUO5GdqJ2Pp04Jyoq3HvlPAgSUxfsyJZMtPbJFrLIhCvyi?=
 =?us-ascii?Q?LOYza/gE3QqqG4wX0E4vjNgq04UbnevacgPb0x9HpOYLWCGkXOKmWgB9H268?=
 =?us-ascii?Q?Qi3kisQ7K/1igp6Vo6e/lPRILwIXma9NDB5x9oJJNeedI/4kmWIPtdEjKOIM?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aadb1a-e80d-4fff-e105-08dd4121f832
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 11:33:51.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +c4gxhb+YzEmWhBLRWykuZc+zCZ5mHTQJ5ZaaM3ZJqw3JVkdSVpA0vmzhsYwLSauZLOqYKpsNYkmet0PMC1u3XHn3t/kTSOsZGsRIv/vHrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-Proofpoint-GUID: 8rVjuuun7QZGVRuvTkfH9t3s7U5stazK
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679b63a3 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LSWmyYrqe-3-NsyWFpEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kw_pMFMr7F_zBBU8ZnVJqhGfebxLIGZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501300089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210438

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2024-53589

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0037-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 032e67a213..e577a10cb8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -71,5 +71,6 @@ SRC_URI = "\
      file://0034-CVE-2022-48064.patch \
      file://0035-CVE-2023-39129.patch \
      file://0036-CVE-2023-39130.patch \
+     file://0037-CVE-2024-53589.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch b/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to be
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src += 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src += 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val = section->vma;
+-	      section->size = val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma = addr;
++             if (val < addr)
++               val = addr;
++             section->size = val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+		  new_symbol->symbol.flags = BSF_LOCAL;
+		if (stype == '2' || stype == '6')
+		  new_symbol->symbol.section = bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype == '3' || stype == '7')
+		  {
+		    if ((section->flags & SEC_DATA) == 0)
-- 
2.43.0


