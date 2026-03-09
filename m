Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF87F3C277
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20755.1773078259898916185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Id0jb5JV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295JFuQ4055645
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aNFq14OFKsA5gj41/DL/VqWaBEGM3k+MaGMxmBePOF4=; b=
	Id0jb5JVMZy6CcWoKkBe4Q9zMzg228WDQdPiqR6gCXQEaNpnhr9A+FurgXe0rWeD
	WzjlVifw9bHqc+3fzEwoqZy2Py509Mk3p7CcT9wIgC6I0lnpGBo4cJ44cK9K7IBk
	ltHkk0dR1L1gVpHXpDQbqG36K6/DugH1D3cyggZKpnxwJ2Dqa9rpm3dfw3CcGX0y
	s3urD159YtJS+JksKg+e73tgPWk6YrxixtgPdO1fL1+pUAobKQ/j7T64rSCP8Nw5
	XT3CS7dcGwYF+dEN3O3Bmtp54ezLcNjTFT96SBqeGb62U3i9A8ISL00LnMtF7kVV
	wBXooAwpAHWQhUxwjimuEg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08277s-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXD+9bLq2eBE1U75mgQNXeyKW1kTs1h8ate29VS3TRMZDBnUOf2Aiky3zXNEkXhiIUUopsej+RRwJtieWXPTZft4OLnPlPIkRNi9XYdmdyUQdrm0erzCGpeFi+FetbsKn/TDIrabBcE3nylFPucjAjvscPUZXt6S+awjIS4cCcthR2huYeeP6oqTKeyS7x9/DpeL922nkMKPVY+DjKBWoBi2tSzgWOeNT4UNV44OnsZI19oZZMr0PYXTY1dYb1W+/l3zTaZ4Vqknw3M/E3OEALEpkfquLfcuoT/g3ocPdr8SvU6XZY7sOq9ze0ZDGcZ86jgR7iTvXDlxC5Heh6V7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNFq14OFKsA5gj41/DL/VqWaBEGM3k+MaGMxmBePOF4=;
 b=W83KVrSpo9O5LBMiWTjWOCKIu/6IGHbdd+jwlg7u2cg5QWpaQyOUcoEvIk3eUcnuWHO0DUiZc17YSfcrdthLw3XBHs96xPCRYFp2I8Ho96r/VKRq86ksNXn0ipZM/LQDnBVac3WA0r2R02sWwWtK/mV60ifBR8l2fqwcqpwrjD9qeCdDzPYMLbNtN9DSK73AGm2jTEMMYUB3q4EnQDbT/O7c0ny99a30WvpEEM+GXl6F5F216ww6bdEj9HxhV/Bg7JhsSt9rpq9NXBTCOBz+VM1xyW57MXvMFJlqx8PZJbd2KfmJ4EZ+A9IFomzp79vMSw7ZxzBbHVP9kNwloPhzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 03/14] kernel-yocto-rust: enable Rust kernel support via 'make rustavailable'.
Date: Mon,  9 Mar 2026 10:43:35 -0700
Message-ID: <20260309174346.3384212-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 4752bac4-e9c0-41c2-dfc5-08de7e037b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|19052099003;
X-Microsoft-Antispam-Message-Info: 
	jW8F0XiosPO+GqwdJdGbSGEIVjmkw13IP3GA80lj1WUSoc0r2UPeXSWqjELPkgClRvGghGvtPnFwaFjV2tqLKMMUMywi6nM1dxs1fYuhWQYBCG86kIOxs+dzondZiK+5FcKCQo8Zglnf3TBr1wz+uhAyhOCEw8idP+0KvExhkNtdzBIRP1rD7Xo4l2awdV+2DShDU7IOaGctCMniFLmd7yAJwxGH4t0gN1sDyflAkuptPQp5qc3DXb434Qk5Eqx4V+G1NooA0ZrJ7ZeeHMjtcdTY93HD6u8LO85nXUjKXvhjyaHROhtf6CO2efN3rRpTqRVNol9IFIrBUx9P+YrzgzivmOSpipm2jg7aEKXsCZqaCysrRfE/h/a5JNcOcE91vwOD1EXEgOVuh+KxUpBoUdCbIkkdq/3CGABN8NlahCMnYG4a9VFDK6q0chkDi2l3+1rfdKGy+dmrJYG5IzdTeyk3mxBGobBQR+l/V9QZ23WMHlKKpRDydjeYmj7Hzpyjqvjv2NItGb6dvxXtFTJx5KdaJsOBVM0KVBDD3RlK58biLmXvWAHrtXLr4cQ74z+Ns8s0TkU4x0V+4ftWrW23GHUVwkp3YqFInn8n2fpuFYFhMEzW1JIL84x1KwdxBsao3U/7+BH4hKDs3+oNjOM1A8ALMrEPM+P/Lh54amUBa+VBvSDqXQhSRzh9GOxlUhx4KgK0Jq6dCx8BH/fwS7VsJ0QL4VK5wWkD+1PXskhdP26/jByQKTZo9Ukrqa/Bf/GkFFCwzszDvuT+Sm3dN/LkEvQxJ+9F9TBEY9Q0PIVEfxs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?56DHd9RouutIqeFQQLRha/EZIY3pATgsCyzs7VXa63AyprntyeJ/vN+F8fDC?=
 =?us-ascii?Q?oMWYkBVtX6RWS9xtUv4NXvyIgIV8OUNUEUqfQ2EvySMFNWWu2hsRS3aCaN9E?=
 =?us-ascii?Q?+pR5tW6Wx42/rb7yPUOlQ4UqLxePIExH84eHkhgDU9BwdYVNY5B66MMaDiHM?=
 =?us-ascii?Q?PidcnnlgRrBIeAPXoBEsmZu9da9tK1DPK+ChjwxlfTZ61j84ReJcVD7oqHgA?=
 =?us-ascii?Q?eVCw3UTvsZQSzcL0jkxo+76Y+AxGEypcLneC2ZyVG746/e215L9EYOh6/usk?=
 =?us-ascii?Q?mGPlBYM1hBG4AFq2bCOoBbaGtTDsxRzuItGwhIHQ7n6hUyNPKfA/d8wgvqiQ?=
 =?us-ascii?Q?hdW6G4+NYlDa//Gw4mF0UHq9W8fvTAPQHL6FbN38DEAgygh0QszD4yy9zUt5?=
 =?us-ascii?Q?8frLdyr+MnvUlzjQpS1eJHG0iv9zRH7mlYLe0ko1ys3LdC8aLAkHoGOnQdHs?=
 =?us-ascii?Q?XFQR/MndX9p57YjJS4wp8jFHWE/Kp67jIRLmIw3nKHqt5bjUOS/Lfh6QUb9m?=
 =?us-ascii?Q?TdwTYfUYhiz+NmS+rhBUyaBwjEZ02+E/y09oTU7966XP+2pEJ1hBMehnHeuh?=
 =?us-ascii?Q?vEz+JdEJfrMBTko7Z9ORcBbDL8uMNpB6wvu71PPyw9PsP6adxF4kw1x0ehvk?=
 =?us-ascii?Q?tab5Fg9zKuoO6gs2fYW4nMKCJseBVdrjT8DPWlxthe/OLTdOAH4y+O9hlvR4?=
 =?us-ascii?Q?3YrVdVnTQUE6rpmK7/SXYR4qqo6HJ2Wfm2AAU510s0w4QiRyutvSVhz89zbJ?=
 =?us-ascii?Q?mmVBAGUg4DUEx6ztYsUntMz8xa/c/io16MdyXsAo38DLzJBcASYJNrI+hHBE?=
 =?us-ascii?Q?7AoOaHt9hMPEvKGw6CizVBPQPODPWoIC5aeDGfghc5cxSttB4tt2h5c2d8XA?=
 =?us-ascii?Q?xrE2c7yogU9JLPbqQW+OmbWkfJcIxLoxq3knuwOJB8Y/+L9eo1AvGFbv/JBv?=
 =?us-ascii?Q?pPmTGtYQsBhouu2QJeh/l5hcup+P+HG0LucyCR5/W5C4D9PZfS9oLnInTwoH?=
 =?us-ascii?Q?NfpsVaNTi+e3Vg++xpimixlRjj9sE7Eadey7W9608z223Rg1BM8vs/FhlzY5?=
 =?us-ascii?Q?SIr25Pf9XBwhS3Jpivjn9oK2DiQndZ9GuAF5wlmnuGWCV14EtR7BxQghcOnj?=
 =?us-ascii?Q?hSxoFbJtbj+HI+rHBkHvv5jWBS0/MhDdF1smzd5ZP6srMCYLmB1zarhsg+a2?=
 =?us-ascii?Q?z4L8UoOexIW+889zowv50kp7dhIXD+cj/zZi44gMdH3n2EYYk/U28tzSIbnM?=
 =?us-ascii?Q?qUBFMPPoQEd88aLGJwaD2pj8pQL5arF4HCel98etJLCil33cPp8nEPBiGhN6?=
 =?us-ascii?Q?b4ldMvwBxREpGziKGgdZZ0UMIToJsax3bK6B+Ha9MeYyFH7TdcOmdKA41rXj?=
 =?us-ascii?Q?/kOb9yEGFwV4N+RnWgYFI4JbzZuftSNBXBpvSr2SjYx2+SHEti/3qikRR9dm?=
 =?us-ascii?Q?wKPd4MyjGME3non3MtRfTA5MHgnKm5W2k5nLc5H6UrKLKdcUVw8R5g0hPATX?=
 =?us-ascii?Q?Ku9JCrkKK9BMvHChaTzggYIbLWnnQDH4DqIGI/ejteOcQqUJHx5C/5oABw0a?=
 =?us-ascii?Q?gE1rIWTOIVY5e5NxS6x5YQ+tFD2ReBIl60lbc4UoJxulV5dpwZAbkVzea1/8?=
 =?us-ascii?Q?+GqBwNmP+IGaznlSbfg7bdDcFiDZbJpBqUKenCRykNMLb/+oOvY06rUZHmbt?=
 =?us-ascii?Q?5QJafReA77pY1XzSMIIM7GNEgSOVs0AN5XrrdZFOCUHH94ACNqI7AtBAc5IJ?=
 =?us-ascii?Q?hSrNpRe3+99WS3qylsJFgfeAeUQgcJY=3D?=
X-Exchange-RoutingPolicyChecked: 
	jatyJhkaSfQMvVbjPFtB/6R2yFgAflrnf5YPbZW9AzKE2QMOUywijOXBhc1x5tj+SHsY0vjK1MlKVqfiZd4dGebWjA2HAdzOUP6WwVtIFh2SDEJGpw3Mj9oNlSJ/PBBAmiu/WwwHuW6XXpKHZG5/NM3ufSRYHCsYS8/Z05xjFLk4iShZoyvnuVSinHOncH1fELkWJSszic6mXk6Z6mFJJFSalO10UCoC0prZOqOeI92zhS72H6FvLCaMX/GFBPldxCs64GWDKvrtfmhQ3snDP1ak+DVC2nX0i7f27loiNkVkLxoX1+7gKUz1aCWVyT8dF6Sl110Rr4TIGs8EsI8f0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4752bac4-e9c0-41c2-dfc5-08de7e037b77
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:15.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBgqp2IJZOB+FELycEFI4nxQsirXtQWIB5FcjIPovICskaImZ/ACZkd/rQJC56CfzFxinthmgOxtcTnm+fska+/LG47vDZRbNUrKuNUIPgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: QrpKGtlhKESQlKeO3IyshAMbF7TwUbOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX2ckG7jc5ih42
 iXT7axl2aQk5bgF3/8hs9KlfqK0keSzeDZLQzN1mnk3xXNFdeB0mnj+MHDZ8s5QgdEaAq2qwCsb
 NhLhQaksEPmUf4KCQVZriq8phsOQHPUv9I2TT6NrnFc01hyiKLLzS9Xxmc6SIFdNgRowCQKfVQt
 dIkVsFgYeI+5ICWm161syEhYn3Iawr9FSaJtVyN7bsXjuVizE1VvsBG2C1v3etDUmAv+S0wqYCo
 ky5SEuxhQAhCa0MAZ47oZI8oXXlTA007fPQN0MOxtFx/RYX19GYeRs8tgG4B4E2qHWrzU3sG5rh
 lgdrM75aDuRAnKu6otlwBWsWIvLg7oXljRKd8hwZjYAsY00yHny3kMh0sPHRpH9FSy/tyceaCqi
 4MKY/WIYYw8tIRojYZYNdss1TZ7/5U6kevtP0rOWQm0R406b6TbI3Q5rvNl7rHFtutQ5XmF726K
 QtbkIvY+I7dPYCQlIdg==
X-Proofpoint-ORIG-GUID: 62dhIyXkbfOB6zHbplRrEyAPjtWvlLFr
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af06f2 cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=-yn6Wxg1_zSQloxVRBgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232738

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 12 ++++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
new file mode 100644
index 0000000000..7acc81764f
--- /dev/null
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
+
+do_kernel_configme:append () {
+        oe_runmake -C ${S} O=${B} rustavailable
+}
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..00271e466b 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit_defer ${@'kernel-yocto-rust' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else ''}
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
-- 
2.49.0


