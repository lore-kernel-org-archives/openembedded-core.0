Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE34BC8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 03:25:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6022.1752031503845030807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 20:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9285b621bc=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568NTrW9001689
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 20:25:03 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5kktq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 20:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwNJ/v7o3d3grwgJRoNYdV+y6eQ9P/hl8A8TMsS1z9205paDURDfSa4WT+3syoAC2+mrGhrPCGTa/WedpHmYxpr3+PgoDcoJGRAvCtHBkEU/LWe+nsg3Fuj0ELaliDPTr+2SsuOz3A6d6bsLCqPbBplftUkbIu/xfAlASCIwe1qBYl0ngTYlnPjiFtzgJ4k6PMmJTLYMgTr6ISLXBdQM//s+A7qaUxrNaUkFOrtq26Onqv0uu7wOhzbrQ3LmbnstYH9wWtJSwFQr0knBQHxoCJrIJh7l5G9rMHDZx/EdokuBTgPS0h32R9mfUc7dSZtW+CGDaWBRIfPQ3nPbsaj0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZOOoVOVgufOsPcdpRSxouPGEIKFsPof9AEzysWMXZs=;
 b=EFgwEWa6GW/oM9t32JM59fqrRbNhLo2kBlZCGrQo7gAShByLyd+k8XNOYeHezRS/NRU3GfAexSbW2WBR3w4mVRGyMr83uxd+qh8hVyjXajVERH2+6neYVoXgf9XmZl2CDgNbjIFWHWmU34q2NS1V0eWZ19JoAIBLebYz6BthJStUlgAdVbLkmyBNyi+K95IjkDD6KG8t8OXvx0lmzEVpX/1jDLm/weNF8u1UAmFzFFgiLIIffxN+WTNOXuicby+rX/BVEzVAa9uUJwPXNPzs9437E/NKW20JSVPNRIpVbw0SZaHQ+GpE0+8l5tKUGCoE/syCVExAjBBXhTXi9Xky4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 03:25:00 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 03:25:00 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/1] oeqa/core/decorator: add decorators to skip based on HOST_ARCH
Date: Wed,  9 Jul 2025 11:24:45 +0800
Message-Id: <20250709032445.1641168-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0047.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::8) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5dfce5-00d0-40bb-9f7c-08ddbe982fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?stH8RVnawXxU5S4qFvKZrBLs23G/H6YfO8jz/kBSJ5wu8aqIECSg0Kwd+4aW?=
 =?us-ascii?Q?aG5XO3bw75rbDV0yM1Pbful832Tuoh+pxR2vouYfgYoeP0Ajk3fQmCAs3KGy?=
 =?us-ascii?Q?tj7YgxXrpltlAepRl1duDdwXfrSjytcDUBLGh5qlJcLMW6BaJC6fYkN3qVE0?=
 =?us-ascii?Q?gDTf28/ESh8tpDQkHKk0CFYQRmvxKWcrqzkBEJ8U+BpIjKBrsbkL89Ju+Ppx?=
 =?us-ascii?Q?rL0cMNHjY7RdZAMYvE+yPVLvd5GK77bOVrUmOlwCztOXiStjTBg6UICNffBm?=
 =?us-ascii?Q?82SzQEVVQQIeXO0Mm3BgINTzxFyIANkZ5XRSIdjOuAEn4Ij1z1sBOyjK6wsB?=
 =?us-ascii?Q?tdJgE6mcq3+BTULihSjFo9s2AG2yxrg3K/X4BYvretirteYovYGJMX4ep9dw?=
 =?us-ascii?Q?2NsGfrsRyvQRJmfnmb+f0xCFtQSJ8p6+M3MnsmmYvWoZY36hVaPqDNcZfGIJ?=
 =?us-ascii?Q?dbDkgEFgInBNsjfMrwI2/a5OgxIivpyrTI1KQlIYB8Xr3HdbxXwCl4c020AQ?=
 =?us-ascii?Q?HfVxPISDTrr/43BAPZ0T7ePcv71qCsHkqd8XWu4ZOFVlhYdTMjJ6JSnMI+i1?=
 =?us-ascii?Q?ObJ2pWJwhF504Hx8naaUkXvhD1x7QyDlRQk3x25mu86EIC46CxEtE5uQSAaE?=
 =?us-ascii?Q?Mb5LARud/RgP4H49aWPITEQ1AcCkLk1VJMGHwJ7e6MmRIuRVmzhKD3L0XW56?=
 =?us-ascii?Q?3HNdKRXhJZ9RmSkVptTnwdTH4Om/FUV4JsGylCJ9HMKA5kcLwJGYka/TUARy?=
 =?us-ascii?Q?mKeHJXrj4RrjsJwQTE5b8bTupNr+TeXXBg+lbVLHTtTVBl7mRYKzcqfC0Yc8?=
 =?us-ascii?Q?IuOZl1naC5s8pUCxZ0w7jTv247f58ssL0RjcofWmyOTVoITMk7v2UjKQY8ue?=
 =?us-ascii?Q?13sve2PMV97PebMDop8lXcoSSuv+4H3d6dxpzgHL2+fTXQAsATSI0V/Iunnz?=
 =?us-ascii?Q?G8lrvUQsNy34rppgLUWLlYahubUNuz7RiJ4eDYn0MJ+EARMuWH0D3fq1Uixl?=
 =?us-ascii?Q?EsgX2LFRndZl6ZfYuNOFC30Nvz7dj01OWGZc+w9YlyFUz6O3fVE7Wpd0gb19?=
 =?us-ascii?Q?sQakZH/nQu3jX3WkNRjZ9492agLOt8wyzYhzS/EPeHS+N39gaSbtYii4gOcZ?=
 =?us-ascii?Q?sg1bRKNmCC1VTuatDM1WhLX0/H63x4NS2YpO6T0zrKhvll4vpWoCXRArmQHN?=
 =?us-ascii?Q?oYyb35BOlFNbHjBat5t/6VJVsp9F+L1NYBjFwO5Qt4xTflA9oxSalTGt9GhI?=
 =?us-ascii?Q?r5+F1yLJAci0TU/N2hVnwBjUQ5u3Dc090UiOWmZjDhaSRno0dQgFLGoJhh/1?=
 =?us-ascii?Q?WRJ8773RTFSjHHiPM/alUAZRlDPcRbIo0a2zZua9D+zj+mhZBXDqBGPdKhm0?=
 =?us-ascii?Q?ZIU+h0fDI01hlAPwueVhVrAK4SYTcTT7sv2lCtUagulyTEAzThkp0DQ4kocV?=
 =?us-ascii?Q?f0kQYuqa+/ST90sG9eL8jkM69fkr7KgAzdsOwdAi7Q0lPdlpSrAwnQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?27AW4vGUX8uUILLOM2fUbllrsfoxvtFsmmLaD5qE4srQxSXTHL3PPcqHEQe4?=
 =?us-ascii?Q?d23v0utczwAM8VX0wFyQ3Bj3rCdXeOnY0RSc8gXn07QKA79/JoYNCFAKXTJL?=
 =?us-ascii?Q?cbqS/B21JeqEFGNdACRRTRvpny3H21NBL9PqnROtLMLjgi0fSlypTz4mJzg2?=
 =?us-ascii?Q?pVr89B4IHb5DXFM58OMnvS9xkZVt+UEjD0M7IiC8m2yb3NGvDlHy+e/5vm2W?=
 =?us-ascii?Q?ZS1W+4Fw3Gdbt2TEI8Sxq6ppCexflz/fmvxK1SNBXo+XW0+ywbCKbonVsplk?=
 =?us-ascii?Q?+53yNfCKjmJV/sQXF96KVbjtgAatpr/LhMrftOg2a3Ig3I5TvwhcNRs96Qeq?=
 =?us-ascii?Q?i4U0Qv3/GcwufW29s91zZgWmP7SzbuXNZWnpQ104oiTArEftdDTwtOkZiq7D?=
 =?us-ascii?Q?Jc67svHbzO7QRZLhRZ/eSZGYKVyGEg9M2wfahAaB/i+4BFfkZHIM2ecoI5iH?=
 =?us-ascii?Q?y8Y3RBxGgiXELweymoqgjJWfLf/APNPrySQ8D0rwD8tt7SFFIIep/s2TjDYG?=
 =?us-ascii?Q?LID42GTSCEYQlA/bWFBEASMSHOUjVTQoLjMOW4R+NXcmfECobmUZBSabjVdT?=
 =?us-ascii?Q?I/BGREKS/7ifyNJyMbEJs8pZEzz7pSAh1Lb+PmIYIYFMNzT+C7YF2Dm2vtsA?=
 =?us-ascii?Q?6BDp+BW3HJKr7nZ19niLYmzo5aceIksE0vDrdpKIdqx03gmZDFq5DVoxDlvg?=
 =?us-ascii?Q?jPrsqdwZT/qyMVStgGaKUAi3iLDVKs5SiH36aefXAnZwJZ9EkiIyKbG6HW1o?=
 =?us-ascii?Q?aTG5Znjx9LtnF+odwa//0YQwwV28feixqenZzzvdpxdjeC5spbhZFD8IK8XQ?=
 =?us-ascii?Q?qXUCkPl0EAOizgTHesBq+G/BEwJlni8v1JHYB9MUdyFTYiPtP/cCmCIX9Z3y?=
 =?us-ascii?Q?moNPaH0HD7eGHR6vKBpEw7xmqJEnz0PZLVYVpCM9Ez3kE8ubzbFaTXGDZX84?=
 =?us-ascii?Q?Uhf5i1jOVFVdPVZfYw6mT4iIOTsTOsiK3MYUlp+COG+6BzAZZOjIMUEptuwz?=
 =?us-ascii?Q?QFwPwLD6xAqEmIlUAAez6Se1S9xVdKucDF4dV6NiymrMeBOBlngURLvdMinS?=
 =?us-ascii?Q?BjH8LtwKbFe3NZAWGj9aSKOFau5xZ1dKOnWRZARZ8L7nhAFiNi1d3d+ubC8U?=
 =?us-ascii?Q?+6O/0DUgT3Og1YChFHaFXR5C4sBiEY8p9GwdTZ8Lu0tSnpAC3YyI0Hamzguf?=
 =?us-ascii?Q?1zb20aVSnbnbDevYhgG/Yo6Rfo8yeBTz/3PzRtLE4S7alvy9t9gJYSVfvOzB?=
 =?us-ascii?Q?KTvfvFXadbFXqxF6if+eIkicPZDSIopGc2q0qFCiDN90MNd8rhL0xMntRW/9?=
 =?us-ascii?Q?XZq1CsgKu55wbAj3l8FoKHU3fuQpTu9Op5WOMbhC2NeFI2OBC61T2YbaHXog?=
 =?us-ascii?Q?fNSQC3rWJ6vP0SM8ZNF1VwtYNjJePLr2X7blyl7nlv4AkM8jQkDdgdB9ZYl4?=
 =?us-ascii?Q?Y3ASE+kOCE2q/5l+IvZ9nhnTu9FDvrutCyIbL3uwMd5hUWgMFQhjds4W/z1S?=
 =?us-ascii?Q?+xx8Rmb53MFl5aC+ZAUQk6ltWFRrF7c+1/kiMxIbDqAu+jAkFOhELnbsvbOt?=
 =?us-ascii?Q?cv1Le06Ow1xSE5Q37O/knZQKO0REn3oVdWcj3k3M/mntW9QeJc0nK113a8ww?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5dfce5-00d0-40bb-9f7c-08ddbe982fe9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 03:25:00.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD3SQHY1IWg2I10jait3W6u/2ePcFPrzWMCrxCQvcdO8AU8Or/UndxKmEQ7d0/xyfU4a+8cwjyQqORIGARsf1fjvslfCHHaXIpJA0iMqhgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX80ccN5bHmGOT HVQW0lYgcs3XQaOH4m3qu3CTlqtzMWkquK1cGuywKhB0eMGa7w55cktY2fEFeENvavpTMGvLuDL CE6rFBWmwsENOWeUbIPy36FRB1wGPaTo3CCnyZk/gltUkBRLNG1R6wi55iOipgJwhFn9YYdpC/l
 S3xeMEPSWa4J35qPwI40ytJ9L+ARiGmzJHrk8JJD/a839bSGyQZ1m2MnWBJPQFT7gurkaVvN273 0Olt6fGjDB2ZxT0o9gK7uyi0rkh7P2jyMDj1QBSOpXVm8Pxudw5okcnTnWehW+ADU1YKUxRmoC/ 1+d01DPh7/jGMK7XlxTjQg6C3TIjfIbSmZxDYX3sGvUjq2vyzR40lULFzS7y4R/II5a/uFvOXaw U/EtVXxT
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686de10f cx=c_pps a=5CpET3F+obEq8wTakKEnog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=7CQSdrXTAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=rIvAofDosvWQ615aCA0A:9 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: R4YgkLoAmvAkU_2quGAd-c6mKYYp01WN
X-Proofpoint-GUID: R4YgkLoAmvAkU_2quGAd-c6mKYYp01WN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 03:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220071

From: Ross Burton <ross.burton@arm.com>

There are already decorators to skip on the value of MACHINE, but for
flexibility it's better to skip based on the target architecture. This
means, for example, the ISO image tests could skip if the architecture
isn't x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0c21ff0a92906b6b4820eb8beddf8762fe70653d)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/lib/oeqa/core/decorator/data.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 3ce10e549996..de881e097ab1 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -194,3 +194,27 @@ class skipIfQemu(OETestDecorator):
         self.logger.debug("Checking if qemu MACHINE")
         if self.case.td.get('MACHINE', '').startswith('qemu'):
              self.case.skipTest('Test only runs on real hardware')
+
+@registerDecorator
+class skipIfArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['HOST_ARCH']
+        if arch in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['HOST_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.34.1


