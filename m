Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADE9EB3650
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 01:59:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9057.1772503145368424865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 17:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qv9+rrEe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7522756f9a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231iL1h3404835
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 01:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rPYEzZeKMCEMWFlpflmV
	TUzFw4NUcrZQ3LWdod54Mok=; b=Qv9+rrEeYLB+nxEPHkBEuldMqU4Ki0FonuCc
	RHijXMD0RMIdtmFJQgN9mTRhs2h43tuMdHjeVukrCIUMrG/N1tCtTK9sxOzs7sm7
	ImmYVGOasMEvBBIqNAiuXhiwYErJL3pFpr7Xv3tyCluHadh3v3JTKVWCLxhvuXxx
	GrYujJG8npy//HBhaKjk6b5uTctCx7ORT+yx8WNqwql1ULSs1AVXrzoSwjcIf2TY
	Fue5R51IO2zkXgPQtgM9k/LxUAU87RGh+diIDS5xTovAp37TqTFSKUz5GcVmr6Xl
	A1wBSDuUBb1YP5pGXombjTeJuZyfkKyJrdpuGFvHIbiZLFXvxQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvk63m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 01:59:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhVJw2aQDSzwJRLDsmAV3KNkt0serrIrq8nBBgMRKipvmveQJMF5/kT7MX/n/ZPfrUG/jr2vyJeN2cyHjCeW9CQUnLem+vYEV2y+WrfR84H7s8n2M15uMJFJxK/KXqrtrZ5YOMGHty6gMs0EKGkeWGUxhOPsCBWVTpNCEPQifwqs8Agi2D0zjdtXBn4xwaIW46eOGxCUb3VeJXzccwQtIjqcan6+8B3S8fYPpAnB/QLDDLb9sahkFuj527sZX0jDM+mQinbOxvR5gDVJLoaopap2m5OznDYF04/WcKXNDRzJTlZUwuFFVqcdeDJ0QoYhh9vKAVtmk8AYk/TyxMhPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPYEzZeKMCEMWFlpflmVTUzFw4NUcrZQ3LWdod54Mok=;
 b=WGhFPtpeN4wELkB9TjTc4tcdtFE1Cf0YupktamK9rfv3mBZQ+i20mWLurOFtt6Bhl1kzsU/vJvFr6Vo7whMjWaQeighWlXd/6Wax22fBhjDaO7yDFf55EdkgoZV+08A6VU8Bf3V+Q7cneWvlGehyNh+65DkRi2w7l/TDal2/TlOfG7eWJZHtEvff9I7iOmoYx/Whd45ynLcKgV8a0RS65vD6s4w5XM08Cy+zAu2DioX7mMqxLtK5t2dIXXI5OljRtGQR9/b7yH77SAqd1Y7nBLKzoFCAEU8kfBSuCaYDNr3WK3FLI3k6IvJz++iEL7LrqvRHnvib1eexjdv/B3QYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 01:59:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 01:59:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] grub: upgrade 2.12 -> 2.14
Date: Tue,  3 Mar 2026 09:58:44 +0800
Message-Id: <20260303015845.2213124-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 390f9091-64a6-4560-5d99-08de78c8700a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	36QbwEj9HFvTUqU37JytjVaXTbS+8qL+YfSKI+EkFt51xw6WpAzlwa91L+cJVgr8qadEovQYnnPa54W9QVJ6Zmm3KzI93+LMyFSvVTmmZUv2fG3a07QSS6YGJt6s2+MtiyNZQ0bos6WzkYzqzK7S8DUQlIX3b+dk27x9S/9Jy0CiWeSvDBAkDDz5PA7bKH3kZMKeHVvK2shoVOemWi8siSastl8aygitZ3+UcqiFIksRj87g+uZOYCzIKNWrtyy0FL0QkVc1Dvqim58ldXNXGHLDfZhD7Z5TqW3x2fd1kN0gk5Cw8trXfrs1PsjrJqX3Dt9JuFxB1SQUDROHgDXXhtJyNbqkU1wUn7iRzaMRTEkA0loQ8Tp9WxceJTnGAUOnIHoLsVGTwqToHeJDK/XYvzykDqbsSXhDzkuzLkS/igGA0Go+foZpTLA9WF5X/meo6nNmlskpRGM9yp5NCHpA7ij6l4N6wShyY6hzUrAVFzbvgkZX4rQKsYDMYyUYOxnxrqr5O32pTvGr7er8kAArvNWVtQVHEW9RFFa/O1XVJGAUkuC0QABj2nAhxPAjXCx9vrLy4qz9iCqLZM40fNpZXGBGupJpculT5OMBzll+xw4q46jN6CNC10M82y6bKp9FnYvhFeuV1DsjVcVJqKZRhx3Nypm00DnkTmEdUUnA63U1rTqpOyPs56WCkiQjd9Z44QrBvJHcZdOyjDq+udTDIK45LLeoErVlpv77ZTk+XVuYahMMX3PF0OOB3W6HzqWZIpAefTui3IAdorBzajKvp/JPUJ08oRtPQXtcO0J8RO4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VOgcJr6HovSh68NqIRRvZnRHA1IcFWa4mNkofrcobeM16A+pmzyN0BDXGPDe?=
 =?us-ascii?Q?UnYldUQ40dxXwYCE0rGaD88XuCk8wk5eTEHLdEqPWoacS4gmbZmGUXW34ybW?=
 =?us-ascii?Q?a++Z90dIalDjSbF371jm1nlxSA+beROLSL/Xllp5PcBO5bF3ao09g6/G9v+C?=
 =?us-ascii?Q?dKLwqHcF6dkZj8Z+AbKvGzIx0e6ACD8X5hUlkW4bYA92NyK9rZXxgAGirTzg?=
 =?us-ascii?Q?yTZ+14ynB2IEbv7RTYbeUpwewAlXrutJWPntRGyuzdt1gxEV1g61bVFzvsnU?=
 =?us-ascii?Q?nq5p/gU6qn7Q1w0VsuNKHYKEdr6ETLHzFqkPhQUnGlNiLch3FAGDZIYylkcw?=
 =?us-ascii?Q?PNe3bD67KVnh1K+d13p6UZpm3oUQC0yCFkkqf7ycEuStiBmUWWztG2QFc07S?=
 =?us-ascii?Q?rDHcLSdtZZLY9Cd8ICdFWKqzL1ItUEIH74OChXRzIpv6Eo7/PxMQSpdW3ZH1?=
 =?us-ascii?Q?3w47G1YxpYHRUiy8UIBsZl+5ZKffn44zJQ1uHJ3d+hm/K5EhAwP094wlHl0E?=
 =?us-ascii?Q?a+xQCwacg+0WXc6dn54+LeKZl2DDMufBs9aBVg1WYUC+6lta2ErzdskLg4/9?=
 =?us-ascii?Q?TGTcC1tjAuf5k77/L2ug1c2/RocPf36/edmvERfoZHyot6vI+DQbkIlkvwN3?=
 =?us-ascii?Q?fUcsZAOvkpJzN3ov80sH8ESEcOsxeIrB1awKOpKV9FbOHRIc3+Hglj+jSH58?=
 =?us-ascii?Q?ZUNQVU9g5vsrGUzUJX20aovfMEo61dLH8O9g/L/cp7d6UEZkIgfFf76ThLd3?=
 =?us-ascii?Q?g2CE77d6C3F47R0VKKHED+jzN3Co4CXebDd6IctsDvIo1A2Z3fVpweKfXdTj?=
 =?us-ascii?Q?7cDsycTiwt/ySHrGxydX8B59xx8gDpA3JUm3hYg/urqBQWVQB131rClOUeDv?=
 =?us-ascii?Q?xmwVYBfMolm3efMu8XoUUOJV4jqfvnddzjUve3S8dOttdrl6muGHq1rhAvye?=
 =?us-ascii?Q?FybFIA1MXt68MFqbpHykq+zFsE7P5JbLoE7IIMc1g5URnjGGCXbSWnDTdeWF?=
 =?us-ascii?Q?2W0snL7IbaowIa67/oU0+JgGDC8IBR8/XXNJkfBb1qKBjA3QCbgEGa0MN1Vh?=
 =?us-ascii?Q?c/IC++1v0VFT/ILVCRMOPU5H/11pLJX8HqC0AtP9gHMs76/HjrU1FNnHcJOj?=
 =?us-ascii?Q?L0bxpJKGa2gqnnHlhQDJr7XHTN1GANupTC8+jYHc25atyDmaSsIBVRKN/cCN?=
 =?us-ascii?Q?Nj+51+K7mc85E7WCR0NfvvPHy2R/wBQS/66FyVFRex5897eVvJvwlWkJNKTA?=
 =?us-ascii?Q?yuTLOlhnA4bcCHtfPg6dy8+F6MV/CfQaPnOirJTHfUvYFjQPbeQC7W2l2t66?=
 =?us-ascii?Q?pJngd5JgwdldyJcDLww9ik6giA3j1k3PweEeQpeTmIsHM2lWyNgJnb8eSv3d?=
 =?us-ascii?Q?X3kas5qUl3SU8HNPD/6AhdJUC9t+7hshkt+6w8SNoE5Lh7kgx9npiNKuPFcT?=
 =?us-ascii?Q?lgpcD5ybKzl83PTFPKw7MTaeS2hdTWTuv7r+L7foX/DppM1yh98OwrdrKwbu?=
 =?us-ascii?Q?Y+QjxAXBOFFwD+mP1k6KMbEc2DK/4GlwJxxdJIXlO4OLa/aS1ZqVcRVdfG/j?=
 =?us-ascii?Q?2Yk8y2OYHvfxYPGxlH9Ibg7J/BSRBPGBojG89UWYwY1YiULsDUIvxzeWgCiD?=
 =?us-ascii?Q?XtksyCQ/1lJIKqBZk45asRDzwUNdL2OMJU3LwcBQ7/vROdUOtXOyjzH6Sk9z?=
 =?us-ascii?Q?6UDGykn3ii2XoModIL3882rgd1R6WMHRsqfMNqlu+ahoQ2lH+10c9JfLnDtU?=
 =?us-ascii?Q?rnUZGOp/hQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390f9091-64a6-4560-5d99-08de78c8700a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 01:59:00.8168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Fof9zqLwZ0uBaoa+W6tapAT33QXj3URpnzUHJc3PG73FzhTy1FgrhZR389gTwu126IrA7bZPdOqeUk2EcTfIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
X-Proofpoint-GUID: SwFLorblL2lL91CDCdFmAZuTq5n-0oyf
X-Proofpoint-ORIG-GUID: SwFLorblL2lL91CDCdFmAZuTq5n-0oyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNiBTYWx0ZWRfXwPIQobZ1Oh+7
 8JV4G/l6DHqGgOL3c+DkoUMEzHmkP/V52hY8acIoq2k5mpLsPSThaMDYbeS+Yo/T5cLBSIw9Azf
 OoOIqNo1SJYNV9Q2d2JA0eIn6Vpzpygx2TphvGEDjkjZiqu/yXED/C5rnsLEyyQMnbQ8Nrizhz0
 2B4rq1p7hrB6cc+FxLM5hLOw7V4WgOim9uezWB+c73EoOR0zM8+BR+W6FAyiXUo/qX+lES2rtbU
 bx+JkBVGZZZz0sXz5EyPTVbnE6hUSYoYw5GeD9fPVWDMjJg9CNUPLhnQu6OYq17Uv+bNO1zjdzm
 /UxQY79cu/v5UJ5sNwKRRki4jGqY5uAHQ4A8BEpaFrgg+8CcPKw1SU3u3M0jQ1VwL7JGc6IY0se
 pDmI/BbMazVjd5p1ACl7ibUHBkm81Kcnw5fSmwnSVZhBH9AkPgV9EFQaEvCRvmOFMF42CPxG4Di
 erHFO0W/9DjDz0qs0Yg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a64068 cx=c_pps
 a=Q5I7zFPfgszDbE/a6V3qwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=iox4zFpeAAAA:8
 a=bH78PYQqAAAA:8 a=JF9118EUAAAA:8 a=QyXUC8HyAAAA:8 a=a_U1oVfrAAAA:8
 a=JuTF4qcAAAAA:8 a=7CQSdrXTAAAA:8 a=FczE4HKq_dbmbi1W0gEA:9
 a=PEUNhaoikVmJnXVe:21 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=TrXR8j8ql9YpJ1_1srv2:22 a=xVlTc564ipvMDusKsbsT:22 a=WlT8qwTXB_Kj6um4hl3b:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 01:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232234

ChangeLog:
* libgcrypt 1.11.
* LVM LV integrity and cachevol support.
* EROFS support.
* GRUB environment block inside the Btrfs header support.
* NX support for EFI platforms.
* shim loader protocol support.
* BLS and UKI support.
* Argon2 KDF support.
* TPM2 key protector support.
* Appended Signature Secure Boot Support for PowerPC.
* New option to block command line interface.
* Support dates outside of 1901..2038 range.
* zstdio decompression support.
* EFI code improvements and fixes.
* TPM driver fixes.
* Filesystems fixes.
* CVE and Coverity fixes.
* Tests improvements.
* Documentation improvements.

Drop backport patches.
Refresh local patches.
Split grub-bash-completion package by inheriting bash-completion.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...1-RISC-V-Restore-the-typcast-to-long.patch |  37 --
 ....sh-exclude-.pc-from-po-POTFILES.in.patch} |   5 +-
 .../0001-misc-Implement-grub_strlcpy.patch    |  68 ----
 ...citly-keeps-symbole-.module_license.patch} |  11 +-
 ....d-10_linux.in-add-oe-s-kernel-name.patch} |  11 +-
 .../grub/files/CVE-2024-45774.patch           |  37 --
 .../grub/files/CVE-2024-45775.patch           |  38 --
 .../grub/files/CVE-2024-45776.patch           |  39 --
 .../grub/files/CVE-2024-45777.patch           |  57 ---
 .../files/CVE-2024-45778_CVE-2024-45779.patch |  55 ---
 .../grub/files/CVE-2024-45780.patch           |  93 -----
 .../grub/files/CVE-2024-45781.patch           |  35 --
 .../files/CVE-2024-45782_CVE-2024-56737.patch |  36 --
 .../grub/files/CVE-2024-45783.patch           |  39 --
 .../grub/files/CVE-2024-56738.patch           |  75 ----
 .../grub/files/CVE-2025-0622-01.patch         |  35 --
 .../grub/files/CVE-2025-0622-02.patch         |  41 --
 .../grub/files/CVE-2025-0622-03.patch         |  38 --
 .../grub/files/CVE-2025-0624.patch            |  84 ----
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 377 ------------------
 .../files/CVE-2025-0678_CVE-2025-1125.patch   |  87 ----
 .../grub/files/CVE-2025-0690.patch            |  73 ----
 .../grub/files/CVE-2025-1118.patch            |  37 --
 .../grub/files/CVE-2025-54770.patch           |  41 --
 .../grub/files/CVE-2025-61661.patch           |  40 --
 .../grub/files/CVE-2025-61662.patch           |  72 ----
 .../grub/files/CVE-2025-61663_61664.patch     |  64 ---
 .../{grub-efi_2.12.bb => grub-efi_2.14.bb}    |   0
 meta/recipes-bsp/grub/grub2.inc               |  45 +--
 .../grub/{grub_2.12.bb => grub_2.14.bb}       |   0
 30 files changed, 18 insertions(+), 1652 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
 rename meta/recipes-bsp/grub/files/{autogen.sh-exclude-pc.patch => 0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch} (94%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
 rename meta/recipes-bsp/grub/files/{grub-module-explicitly-keeps-symbole-.module_license.patch => 0002-grub-module-explicitly-keeps-symbole-.module_license.patch} (89%)
 rename meta/recipes-bsp/grub/files/{0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch => 0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch} (93%)
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.12.bb => grub-efi_2.14.bb} (100%)
 rename meta/recipes-bsp/grub/{grub_2.12.bb => grub_2.14.bb} (100%)

diff --git a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
deleted file mode 100644
index cafa711731..0000000000
--- a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b47029e8e582d17c6874d2622fe1a5b834377dbb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Mar 2021 11:59:43 -0700
-Subject: [PATCH] RISC-V: Restore the typcast to 64bit type
-
-this makes the type promotions clear and explicit
-It was already typecasted to long but was accidentally dropped in [1]
-which stated to cause failures on riscv32 as reported in [2]
-
-[1] https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2bf40e9e5be9808b17852e688eead87acff14420
-[2] https://savannah.gnu.org/bugs/index.php?60283
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Andreas Schwab <schwab@suse.de>
-Cc: Daniel Kiper <daniel.kiper@oracle.com>
-Cc: Chester Lin <clin@suse.com>
-Cc: Nikita Ermakov <arei@altlinux.org>
-Cc: Alistair Francis <alistair.francis@wdc.com>
-
----
- util/grub-mkimagexx.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
-index e50b295..2f09255 100644
---- a/util/grub-mkimagexx.c
-+++ b/util/grub-mkimagexx.c
-@@ -1310,7 +1310,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
- 		  */
- 
- 		 sym_addr += addend;
--		 off = sym_addr - target_section_addr - offset - image_target->vaddr_offset;
-+		 off = (grub_int64_t)sym_addr - target_section_addr - offset - image_target->vaddr_offset;
- 
- 		 switch (ELF_R_TYPE (info))
- 		   {
diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch b/meta/recipes-bsp/grub/files/0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch
similarity index 94%
rename from meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
rename to meta/recipes-bsp/grub/files/0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch
index f8dfda90ab..85fb0f1e39 100644
--- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
+++ b/meta/recipes-bsp/grub/files/0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch
@@ -1,4 +1,4 @@
-From 14c1d0459fb3561e627d3a5f6e91a0d2f7b4aa45 Mon Sep 17 00:00:00 2001
+From 5614602d31d32f59f31c0ec36a59526575b855df Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Mon, 15 Mar 2021 14:44:15 +0800
 Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
@@ -14,13 +14,12 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-
 ---
  autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 195daa5..773b7b4 100755
+index 7dd26cd..c3334dc 100755
 --- a/autogen.sh
 +++ b/autogen.sh
 @@ -26,7 +26,7 @@ fi
diff --git a/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch b/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
deleted file mode 100644
index 0ff6dff33a..0000000000
--- a/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From ea703528a8581a2ea7e0bad424a70fdf0aec7d8f Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Sat, 15 Jun 2024 02:33:08 +0100
-Subject: [PATCH 1/2] misc: Implement grub_strlcpy()
-
-grub_strlcpy() acts the same way as strlcpy() does on most *NIX,
-returning the length of src and ensuring dest is always NUL
-terminated except when size is 0.
-
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ea703528a8581a2ea7e0bad424a70fdf0aec7d8f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- include/grub/misc.h | 39 +++++++++++++++++++++++++++++++++++++++
- 1 file changed, 39 insertions(+)
-
-diff --git a/include/grub/misc.h b/include/grub/misc.h
-index 1578f36c3..14d8f37ac 100644
---- a/include/grub/misc.h
-+++ b/include/grub/misc.h
-@@ -64,6 +64,45 @@ grub_stpcpy (char *dest, const char *src)
-   return d - 1;
- }
- 
-+static inline grub_size_t
-+grub_strlcpy (char *dest, const char *src, grub_size_t size)
-+{
-+  char *d = dest;
-+  grub_size_t res = 0;
-+  /*
-+   * We do not subtract one from size here to avoid dealing with underflowing
-+   * the value, which is why to_copy is always checked to be greater than one
-+   * throughout this function.
-+   */
-+  grub_size_t to_copy = size;
-+
-+  /* Copy size - 1 bytes to dest. */
-+  if (to_copy > 1)
-+    while ((*d++ = *src++) != '\0' && ++res && --to_copy > 1)
-+      ;
-+
-+  /*
-+   * NUL terminate if size != 0. The previous step may have copied a NUL byte
-+   * if it reached the end of the string, but we know dest[size - 1] must always
-+   * be a NUL byte.
-+   */
-+  if (size != 0)
-+    dest[size - 1] = '\0';
-+
-+  /* If there is still space in dest, but are here, we reached the end of src. */
-+  if (to_copy > 1)
-+    return res;
-+
-+  /*
-+   * If we haven't reached the end of the string, iterate through to determine
-+   * the strings total length.
-+   */
-+  while (*src++ != '\0' && ++res)
-+   ;
-+
-+  return res;
-+}
-+
- /* XXX: If grub_memmove is too slow, we must implement grub_memcpy.  */
- static inline void *
- grub_memcpy (void *dest, const void *src, grub_size_t n)
diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/0002-grub-module-explicitly-keeps-symbole-.module_license.patch
similarity index 89%
rename from meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
rename to meta/recipes-bsp/grub/files/0002-grub-module-explicitly-keeps-symbole-.module_license.patch
index 7c8770ce8b..7dc5fb2daf 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/0002-grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -1,4 +1,4 @@
-From b316ed326bd492106006d78f5bfcd767b49a4f2e Mon Sep 17 00:00:00 2001
+From 33cb5eb091dff62b45c6cb990b55fc29cc6d4175 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Aug 2016 04:06:34 -0400
 Subject: [PATCH] grub module explicitly keeps symbole .module_license
@@ -40,13 +40,12 @@ SYMBOL TABLE:
 Upstream-Status: Inappropriate [workaround that needs investigation into @TARGET_STRIP@ behaviour in oe-core vs toolchain used by upstream]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  grub-core/genmod.sh.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/grub-core/genmod.sh.in b/grub-core/genmod.sh.in
-index e57c4d9..42bb1ba 100644
+index 337753c..0488285 100644
 --- a/grub-core/genmod.sh.in
 +++ b/grub-core/genmod.sh.in
 @@ -56,7 +56,7 @@ if test x@TARGET_APPLE_LINKER@ != x1; then
@@ -55,6 +54,6 @@ index e57c4d9..42bb1ba 100644
  		-K grub_mod_init -K grub_mod_fini \
 -		-K _grub_mod_init -K _grub_mod_fini \
 +		-K _grub_mod_init -K _grub_mod_fini -K .module_license \
- 		-R .note.gnu.gold-version -R .note.GNU-stack \
- 		-R .gnu.build.attributes \
- 		-R .rel.gnu.build.attributes \
+ 		-R .note.GNU-stack \
+ 		-R .note.gnu.gold-version \
+ 		-R .note.gnu.property \
diff --git a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
similarity index 93%
rename from meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
rename to meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
index 69dec7695a..2bb0aca5cf 100644
--- a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
+++ b/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
@@ -1,4 +1,4 @@
-From a80592e20f6c4b928a22862f52f268ab9d9908b2 Mon Sep 17 00:00:00 2001
+From 3715ca04466dfa120e18650d2c481f40d2066ca9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 19:28:00 +0000
 Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
@@ -9,18 +9,17 @@ that the grub-mkconfig and grub-install can work correctly.
 We only need add the bzImage to util/grub.d/10_linux.in, but also add it
 to util/grub.d/20_linux_xen.in to keep compatibility.
 
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Inappropriate [OE specific]
 
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  util/grub.d/10_linux.in     | 6 +++---
  util/grub.d/20_linux_xen.in | 2 +-
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
-index cc393be..8545cb6 100644
+index 07649cd..d5ec745 100644
 --- a/util/grub.d/10_linux.in
 +++ b/util/grub.d/10_linux.in
 @@ -166,12 +166,12 @@ machine=`uname -m`
@@ -40,7 +39,7 @@ index cc393be..8545cb6 100644
  	done ;;
  esac
 diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
-index 94dd8be..36cd554 100644
+index 27bff00..6cc7bfc 100644
 --- a/util/grub.d/20_linux_xen.in
 +++ b/util/grub.d/20_linux_xen.in
 @@ -181,7 +181,7 @@ EOF
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
deleted file mode 100644
index 55aecc17d7..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2c34af908ebf4856051ed29e46d88abd2b20387f Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Fri, 8 Mar 2024 22:47:20 +1100
-Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
- JPEG
-
-Otherwise a subsequent header could change the height and width
-allowing future OOB writes.
-
-Fixes: CVE-2024-45774
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2024-45774
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/video/readers/jpeg.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
-index ae634fd41..631a89356 100644
---- a/grub-core/video/readers/jpeg.c
-+++ b/grub-core/video/readers/jpeg.c
-@@ -339,6 +339,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
-   if (grub_errno != GRUB_ERR_NONE)
-     return grub_errno;
- 
-+  if (data->image_height != 0 || data->image_width != 0)
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		       "jpeg: cannot have duplicate SOF0 markers");
-+
-   if (grub_jpeg_get_byte (data) != 8)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "jpeg: only 8-bit precision is supported");
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
deleted file mode 100644
index 70492b8c2e..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 05be856a8c3aae41f5df90cab7796ab7ee34b872 Mon Sep 17 00:00:00 2001
-From: Lidong Chen <lidong.chen@oracle.com>
-Date: Fri, 22 Nov 2024 06:27:55 +0000
-Subject: [PATCH] commands/extcmd: Missing check for failed allocation
-
-The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
-a grub_arg_list struct but it does not verify the allocation was successful.
-In case of failed allocation the NULL state pointer can be accessed in
-parse_option() through grub_arg_parse() which may lead to a security issue.
-
-Fixes: CVE-2024-45775
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
-
-CVE: CVE-2024-45775
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/commands/extcmd.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
-index 90a5ca24a..c236be13a 100644
---- a/grub-core/commands/extcmd.c
-+++ b/grub-core/commands/extcmd.c
-@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
-     }
- 
-   state = grub_arg_list_alloc (ext, argc, args);
-+  if (state == NULL)
-+    return grub_errno;
-+
-   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
-     {
-       context.state = state;
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
deleted file mode 100644
index 8deea958b8..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 09bd6eb58b0f71ec273916070fa1e2de16897a91 Mon Sep 17 00:00:00 2001
-From: Lidong Chen <lidong.chen@oracle.com>
-Date: Fri, 22 Nov 2024 06:27:56 +0000
-Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
-
-Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
-overflow leading to subsequent OOB write or read. This patch fixes the
-issue by replacing grub_zalloc() and explicit multiplication with
-grub_calloc() which does the same thing in safe manner.
-
-Fixes: CVE-2024-45776
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
-
-CVE: CVE-2024-45776
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/gettext/gettext.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index e4f4f8ee6..63bb1ab73 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
-   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
-        ctx->grub_gettext_max_log++);
- 
--  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
--					    * sizeof (ctx->grub_gettext_msg_list[0]));
-+  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
-+					    sizeof (ctx->grub_gettext_msg_list[0]));
-   if (!ctx->grub_gettext_msg_list)
-     {
-       grub_file_close (fd);
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45777.patch b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
deleted file mode 100644
index 0305a95fd5..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b970a5ed967816bbca8225994cd0ee2557bad515 Mon Sep 17 00:00:00 2001
-From: Lidong Chen <lidong.chen@oracle.com>
-Date: Fri, 22 Nov 2024 06:27:57 +0000
-Subject: [PATCH] gettext: Integer overflow leads to heap OOB write
-
-The size calculation of the translation buffer in
-grub_gettext_getstr_from_position() may overflow
-to 0 leading to heap OOB write. This patch fixes
-the issue by using grub_add() and checking for
-an overflow.
-
-Fixes: CVE-2024-45777
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
-
-CVE: CVE-2024-45777
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b970a5ed967816bbca8225994cd0ee2557bad515]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/gettext/gettext.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index 63bb1ab73..9ffc73428 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -26,6 +26,7 @@
- #include <grub/file.h>
- #include <grub/kernel.h>
- #include <grub/i18n.h>
-+#include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -99,6 +100,7 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
-   char *translation;
-   struct string_descriptor desc;
-   grub_err_t err;
-+  grub_size_t alloc_sz;
- 
-   internal_position = (off + position * sizeof (desc));
- 
-@@ -109,7 +111,10 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
-   length = grub_cpu_to_le32 (desc.length);
-   offset = grub_cpu_to_le32 (desc.offset);
- 
--  translation = grub_malloc (length + 1);
-+  if (grub_add (length, 1, &alloc_sz))
-+    return NULL;
-+
-+  translation = grub_malloc (alloc_sz);
-   if (!translation)
-     return NULL;
- 
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
deleted file mode 100644
index eba013897f..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 26db6605036bd9e5b16d9068a8cc75be63b8b630 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Sat, 23 Mar 2024 15:59:43 +1100
-Subject: [PATCH] fs/bfs: Disable under lockdown
-
-The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
-This will also disable the AFS.
-
-Fixes: CVE-2024-45778
-Fixes: CVE-2024-45779
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2024-45778
-CVE: CVE-2024-45779
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/bfs.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
-index 022f69fe2..78aeb051f 100644
---- a/grub-core/fs/bfs.c
-+++ b/grub-core/fs/bfs.c
-@@ -30,6 +30,7 @@
- #include <grub/types.h>
- #include <grub/i18n.h>
- #include <grub/fshelp.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -1106,7 +1107,10 @@ GRUB_MOD_INIT (bfs)
- {
-   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
- 		       sizeof (struct grub_bfs_extent));
--  grub_fs_register (&grub_bfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_bfs_fs);
-+    }
- }
- 
- #ifdef MODE_AFS
-@@ -1115,5 +1119,6 @@ GRUB_MOD_FINI (afs)
- GRUB_MOD_FINI (bfs)
- #endif
- {
--  grub_fs_unregister (&grub_bfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_bfs_fs);
- }
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45780.patch b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
deleted file mode 100644
index 1de0099f94..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 0087bc6902182fe5cedce2d034c75a79cf6dd4f3 Mon Sep 17 00:00:00 2001
-From: Lidong Chen <lidong.chen@oracle.com>
-Date: Fri, 22 Nov 2024 06:27:58 +0000
-Subject: [PATCH] fs/tar: Integer overflow leads to heap OOB write
-
-Both namesize and linksize are derived from hd.size, a 12-digit octal
-number parsed by read_number(). Later direct arithmetic calculation like
-"namesize + 1" and "linksize + 1" may exceed the maximum value of
-grub_size_t leading to heap OOB write. This patch fixes the issue by
-using grub_add() and checking for an overflow.
-
-Fixes: CVE-2024-45780
-
-Reported-by: Nils Langius <nils@langius.de>
-Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
-
-CVE: CVE-2024-45780
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0087bc6902182fe5cedce2d034c75a79cf6dd4f3]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/tar.c | 23 ++++++++++++++++++-----
- 1 file changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
-index 646bce5eb..386c09022 100644
---- a/grub-core/fs/tar.c
-+++ b/grub-core/fs/tar.c
-@@ -25,6 +25,7 @@
- #include <grub/mm.h>
- #include <grub/dl.h>
- #include <grub/i18n.h>
-+#include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -76,6 +77,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
- {
-   struct head hd;
-   int reread = 0, have_longname = 0, have_longlink = 0;
-+  grub_size_t sz;
- 
-   data->hofs = data->next_hofs;
- 
-@@ -97,7 +99,11 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
- 	{
- 	  grub_err_t err;
- 	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
--	  *name = grub_malloc (namesize + 1);
-+
-+	  if (grub_add (namesize, 1, &sz))
-+	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
-+
-+	  *name = grub_malloc (sz);
- 	  if (*name == NULL)
- 	    return grub_errno;
- 	  err = grub_disk_read (data->disk, 0,
-@@ -117,15 +123,19 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
- 	{
- 	  grub_err_t err;
- 	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
--	  if (data->linkname_alloc < linksize + 1)
-+
-+	  if (grub_add (linksize, 1, &sz))
-+	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
-+
-+	  if (data->linkname_alloc < sz)
- 	    {
- 	      char *n;
--	      n = grub_calloc (2, linksize + 1);
-+	      n = grub_calloc (2, sz);
- 	      if (!n)
- 		return grub_errno;
- 	      grub_free (data->linkname);
- 	      data->linkname = n;
--	      data->linkname_alloc = 2 * (linksize + 1);
-+	      data->linkname_alloc = 2 * (sz);
- 	    }
- 
- 	  err = grub_disk_read (data->disk, 0,
-@@ -148,7 +158,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
- 	  while (extra_size < sizeof (hd.prefix)
- 		 && hd.prefix[extra_size])
- 	    extra_size++;
--	  *name = grub_malloc (sizeof (hd.name) + extra_size + 2);
-+
-+	  if (grub_add (sizeof (hd.name) + 2, extra_size, &sz))
-+	    return grub_error (GRUB_ERR_BAD_FS, N_("long name size overflow"));
-+	  *name = grub_malloc (sz);
- 	  if (*name == NULL)
- 	    return grub_errno;
- 	  if (hd.prefix[0])
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
deleted file mode 100644
index bd0b6aa04a..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Sun, 12 May 2024 02:03:33 +0100
-Subject: [PATCH 2/2] fs/ufs: Fix a heap OOB write
-
-grub_strcpy() was used to copy a symlink name from the filesystem
-image to a heap allocated buffer. This led to a OOB write to adjacent
-heap allocations. Fix by using grub_strlcpy().
-
-Fixes: CVE-2024-45781
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2024-45781
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/ufs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
-index a354c92d9..01235101b 100644
---- a/grub-core/fs/ufs.c
-+++ b/grub-core/fs/ufs.c
-@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
-   /* Check against zero is paylindromic, no need to swap.  */
-   if (data->inode.nblocks == 0
-       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
--    grub_strcpy (symlink, (char *) data->inode.symlink);
-+    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
-   else
-     {
-       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
deleted file mode 100644
index 41cc025b81..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 417547c10410b714e43f08f74137c24015f8f4c3 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Sun, 12 May 2024 02:48:33 +0100
-Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
-
-Replaced with grub_strlcpy().
-
-Fixes: CVE-2024-45782
-Fixes: CVE-2024-56737
-Fixes: https://savannah.gnu.org/bugs/?66599
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2024-45782
-CVE: CVE-2024-56737
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=417547c10410b714e43f08f74137c24015f8f4c3]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/hfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
-index 91dc0e69c..920112b03 100644
---- a/grub-core/fs/hfs.c
-+++ b/grub-core/fs/hfs.c
-@@ -379,7 +379,7 @@ grub_hfs_mount (grub_disk_t disk)
-      volume name.  */
-   key.parent_dir = grub_cpu_to_be32_compile_time (1);
-   key.strlen = data->sblock.volname[0];
--  grub_strcpy ((char *) key.str, (char *) (data->sblock.volname + 1));
-+  grub_strlcpy ((char *) key.str, (char *) (data->sblock.volname + 1), sizeof (key.str));
- 
-   if (grub_hfs_find_node (data, (char *) &key, data->cat_root,
- 			  0, (char *) &dir, sizeof (dir)) == 0)
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45783.patch b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
deleted file mode 100644
index 99c769961b..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f7c070a2e28dfab7137db0739fb8db1dc02d8898 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Sun, 12 May 2024 06:22:51 +0100
-Subject: [PATCH] fs/hfsplus: Set a grub_errno if mount fails
-
-It was possible for mount to fail but not set grub_errno. This led to
-a possible double decrement of the module reference count if the NULL
-page was mapped.
-
-Fixing in general as a similar bug was fixed in commit 61b13c187
-(fs/hfsplus: Set grub_errno to prevent NULL pointer access) and there
-are likely more variants around.
-
-Fixes: CVE-2024-45783
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2024-45783
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f7c070a2e28dfab7137db0739fb8db1dc02d8898]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/hfsplus.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
-index 295822f69..de71fd486 100644
---- a/grub-core/fs/hfsplus.c
-+++ b/grub-core/fs/hfsplus.c
-@@ -405,7 +405,7 @@ grub_hfsplus_mount (grub_disk_t disk)
- 
-  fail:
- 
--  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
-+  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
-     grub_error (GRUB_ERR_BAD_FS, "not a HFS+ filesystem");
- 
-   grub_free (data);
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
deleted file mode 100644
index c7b64aa6ed..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 9 Sep 2025 14:23:14 +0100
-Subject: [PATCH] CVE-2024-56738
-
-Backport an algorithmic change to grub_crypto_memcmp() so that it completes in
-constant time and thus isn't susceptible to side-channel attacks.
-
-This is a partial backport of grub 0739d24cd
-("libgcrypt: Adjust import script, definitions and API users for libgcrypt 1.11")
-
-CVE: CVE-2024-56738
-Upstream-Status: Backport [0739d24cd]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- grub-core/lib/crypto.c | 23 ++++++++++++++++-------
- include/grub/crypto.h  |  2 +-
- 2 files changed, 17 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
-index 396f76410..19db7870a 100644
---- a/grub-core/lib/crypto.c
-+++ b/grub-core/lib/crypto.c
-@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
-   return GRUB_ACCESS_DENIED;
- }
- 
-+/*
-+ * Compare byte arrays of length LEN, return 1 if it's not same,
-+ * 0, otherwise.
-+ */
- int
--grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
-+grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
- {
--  register grub_size_t counter = 0;
--  const grub_uint8_t *pa, *pb;
-+  const grub_uint8_t *a = b1;
-+  const grub_uint8_t *b = b2;
-+  int ab, ba;
-+  grub_size_t i;
- 
--  for (pa = a, pb = b; n; pa++, pb++, n--)
-+  /* Constant-time compare. */
-+  for (i = 0, ab = 0, ba = 0; i < len; i++)
-     {
--      if (*pa != *pb)
--	counter++;
-+      /* If a[i] != b[i], either ab or ba will be negative. */
-+      ab |= a[i] - b[i];
-+      ba |= b[i] - a[i];
-     }
- 
--  return !!counter;
-+  /* 'ab | ba' is negative when buffers are not equal, extract sign bit.  */
-+  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & 1;
- }
- 
- #ifndef GRUB_UTIL
-diff --git a/include/grub/crypto.h b/include/grub/crypto.h
-index 31c87c302..20ad4c5f7 100644
---- a/include/grub/crypto.h
-+++ b/include/grub/crypto.h
-@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
- 		    grub_uint8_t *DK, grub_size_t dkLen);
- 
- int
--grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
-+grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
- 
- int
- grub_password_get (char buf[], unsigned buf_size);
--- 
-2.43.0
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
deleted file mode 100644
index 09dbfce5f8..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2123c5bca7e21fbeb0263df4597ddd7054700726 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Fri, 1 Nov 2024 19:24:29 +0000
-Subject: [PATCH 1/3] commands/pgp: Unregister the "check_signatures" hooks on
- module unload
-
-If the hooks are not removed they can be called after the module has
-been unloaded leading to an use-after-free.
-
-Fixes: CVE-2025-0622
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0622
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2123c5bca7e21fbeb0263df4597ddd7054700726]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/commands/pgp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
-index c6766f044..5fadc33c4 100644
---- a/grub-core/commands/pgp.c
-+++ b/grub-core/commands/pgp.c
-@@ -1010,6 +1010,8 @@ GRUB_MOD_INIT(pgp)
- 
- GRUB_MOD_FINI(pgp)
- {
-+  grub_register_variable_hook ("check_signatures", NULL, NULL);
-+  grub_env_unset ("check_signatures");
-   grub_verifier_unregister (&grub_pubkey_verifier);
-   grub_unregister_extcmd (cmd);
-   grub_unregister_extcmd (cmd_trust);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
deleted file mode 100644
index be01da3355..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9c16197734ada8d0838407eebe081117799bfe67 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Fri, 1 Nov 2024 23:46:55 +0000
-Subject: [PATCH 2/3] normal: Remove variables hooks on module unload
-
-The normal module does not entirely cleanup after itself in
-its GRUB_MOD_FINI() leaving a few variables hooks in place.
-It is not possible to unload normal module now but fix the
-issues for completeness.
-
-On the occasion replace 0s with NULLs for "pager" variable
-hooks unregister.
-
-Fixes: CVE-2025-0622
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0622
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c16197734ada8d0838407eebe081117799bfe67]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/normal/main.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
-index 838f57fa5..04d058f55 100644
---- a/grub-core/normal/main.c
-+++ b/grub-core/normal/main.c
-@@ -582,7 +582,9 @@ GRUB_MOD_FINI(normal)
-   grub_xputs = grub_xputs_saved;
- 
-   grub_set_history (0);
--  grub_register_variable_hook ("pager", 0, 0);
-+  grub_register_variable_hook ("pager", NULL, NULL);
-+  grub_register_variable_hook ("color_normal", NULL, NULL);
-+  grub_register_variable_hook ("color_highlight", NULL, NULL);
-   grub_fs_autoload_hook = 0;
-   grub_unregister_command (cmd_clear);
- }
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
deleted file mode 100644
index 79078a4350..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7580addfc8c94cedb0cdfd7a1fd65b539215e637 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Fri, 1 Nov 2024 23:52:06 +0000
-Subject: [PATCH 3/3] gettext: Remove variables hooks on module unload
-
-The gettext module does not entirely cleanup after itself in
-its GRUB_MOD_FINI() leaving a few variables hooks in place.
-It is not possible to unload gettext module because normal
-module depends on it. Though fix the issues for completeness.
-
-Fixes: CVE-2025-0622
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0622
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7580addfc8c94cedb0cdfd7a1fd65b539215e637]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/gettext/gettext.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index 7a1c14e4f..e4f4f8ee6 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -535,6 +535,10 @@ GRUB_MOD_INIT (gettext)
- 
- GRUB_MOD_FINI (gettext)
- {
-+  grub_register_variable_hook ("locale_dir", NULL, NULL);
-+  grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
-+  grub_register_variable_hook ("lang", NULL, NULL);
-+
-   grub_gettext_delete_list (&main_context);
-   grub_gettext_delete_list (&secondary_context);
- 
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0624.patch b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
deleted file mode 100644
index 229fe6399e..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 5eef88152833062a3f7e017535372d64ac8ef7e1 Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Fri, 15 Nov 2024 13:12:09 +0000
-Subject: [PATCH] net: Fix OOB write in grub_net_search_config_file()
-
-The function included a call to grub_strcpy() which copied data from an
-environment variable to a buffer allocated in grub_cmd_normal(). The
-grub_cmd_normal() didn't consider the length of the environment variable.
-So, the copy operation could exceed the allocation and lead to an OOB
-write. Fix the issue by replacing grub_strcpy() with grub_strlcpy() and
-pass the underlying buffers size to the grub_net_search_config_file().
-
-Fixes: CVE-2025-0624
-
-Reported-by: B Horn <b@horn.uk>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0624
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5eef88152833062a3f7e017535372d64ac8ef7e1]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/net/net.c     | 7 ++++---
- grub-core/normal/main.c | 2 +-
- include/grub/net.h      | 2 +-
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/grub-core/net/net.c b/grub-core/net/net.c
-index 0e41e21a5..9939ff601 100644
---- a/grub-core/net/net.c
-+++ b/grub-core/net/net.c
-@@ -1909,14 +1909,15 @@ grub_config_search_through (char *config, char *suffix,
- }
- 
- grub_err_t
--grub_net_search_config_file (char *config)
-+grub_net_search_config_file (char *config, grub_size_t config_buf_len)
- {
--  grub_size_t config_len;
-+  grub_size_t config_len, suffix_len;
-   char *suffix;
- 
-   config_len = grub_strlen (config);
-   config[config_len] = '-';
-   suffix = config + config_len + 1;
-+  suffix_len = config_buf_len - (config_len + 1);
- 
-   struct grub_net_network_level_interface *inf;
-   FOR_NET_NETWORK_LEVEL_INTERFACES (inf)
-@@ -1942,7 +1943,7 @@ grub_net_search_config_file (char *config)
- 
-       if (client_uuid)
-         {
--          grub_strcpy (suffix, client_uuid);
-+          grub_strlcpy (suffix, client_uuid, suffix_len);
-           if (grub_config_search_through (config, suffix, 1, 0) == 0)
-             return GRUB_ERR_NONE;
-         }
-diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
-index 90879dc21..838f57fa5 100644
---- a/grub-core/normal/main.c
-+++ b/grub-core/normal/main.c
-@@ -344,7 +344,7 @@ grub_cmd_normal (struct grub_command *cmd __attribute__ ((unused)),
- 
-           if (grub_strncmp (prefix + 1, "tftp", sizeof ("tftp") - 1) == 0 &&
-               !disable_net_search)
--            grub_net_search_config_file (config);
-+            grub_net_search_config_file (config, config_len);
- 
- 	  grub_enter_normal_mode (config);
- 	  grub_free (config);
-diff --git a/include/grub/net.h b/include/grub/net.h
-index 228d04963..58a4f83fc 100644
---- a/include/grub/net.h
-+++ b/include/grub/net.h
-@@ -579,7 +579,7 @@ void
- grub_net_remove_dns_server (const struct grub_net_network_level_address *s);
- 
- grub_err_t
--grub_net_search_config_file (char *config);
-+grub_net_search_config_file (char *config, grub_size_t config_buf_len);
- 
- extern char *grub_net_default_server;
- 
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch b/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
deleted file mode 100644
index d5563cecc4..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
+++ /dev/null
@@ -1,377 +0,0 @@
-From 47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Sat, 23 Mar 2024 16:20:45 +1100
-Subject: [PATCH] fs: Disable many filesystems under lockdown
-
-The idea is to permit the following: btrfs, cpio, exfat, ext, f2fs, fat,
-hfsplus, iso9660, squash4, tar, xfs and zfs.
-
-The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
-reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
-
-Fixes: CVE-2025-0677
-Fixes: CVE-2025-0684
-Fixes: CVE-2025-0685
-Fixes: CVE-2025-0686
-Fixes: CVE-2025-0689
-
-Suggested-by: Daniel Axtens <dja@axtens.net>
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0677
-CVE: CVE-2025-0684
-CVE: CVE-2025-0685
-CVE: CVE-2025-0686
-CVE: CVE-2025-0689
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/affs.c     | 9 +++++++--
- grub-core/fs/cbfs.c     | 9 +++++++--
- grub-core/fs/jfs.c      | 9 +++++++--
- grub-core/fs/minix.c    | 9 +++++++--
- grub-core/fs/nilfs2.c   | 9 +++++++--
- grub-core/fs/ntfs.c     | 9 +++++++--
- grub-core/fs/reiserfs.c | 9 +++++++--
- grub-core/fs/romfs.c    | 9 +++++++--
- grub-core/fs/sfs.c      | 9 +++++++--
- grub-core/fs/udf.c      | 9 +++++++--
- grub-core/fs/ufs.c      | 9 +++++++--
- 11 files changed, 77 insertions(+), 22 deletions(-)
-
-diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
-index ed606b3f1..352f5d232 100644
---- a/grub-core/fs/affs.c
-+++ b/grub-core/fs/affs.c
-@@ -26,6 +26,7 @@
- #include <grub/types.h>
- #include <grub/fshelp.h>
- #include <grub/charset.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -703,11 +704,15 @@ static struct grub_fs grub_affs_fs =
- 
- GRUB_MOD_INIT(affs)
- {
--  grub_fs_register (&grub_affs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_affs_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI(affs)
- {
--  grub_fs_unregister (&grub_affs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_affs_fs);
- }
-diff --git a/grub-core/fs/cbfs.c b/grub-core/fs/cbfs.c
-index 8ab7106af..f6349df34 100644
---- a/grub-core/fs/cbfs.c
-+++ b/grub-core/fs/cbfs.c
-@@ -26,6 +26,7 @@
- #include <grub/dl.h>
- #include <grub/i18n.h>
- #include <grub/cbfs_core.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -390,12 +391,16 @@ GRUB_MOD_INIT (cbfs)
- #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
-   init_cbfsdisk ();
- #endif
--  grub_fs_register (&grub_cbfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_cbfs_fs);
-+    }
- }
- 
- GRUB_MOD_FINI (cbfs)
- {
--  grub_fs_unregister (&grub_cbfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_cbfs_fs);
- #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
-   fini_cbfsdisk ();
- #endif
-diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
-index 6f7c43904..c0bbab8a9 100644
---- a/grub-core/fs/jfs.c
-+++ b/grub-core/fs/jfs.c
-@@ -26,6 +26,7 @@
- #include <grub/types.h>
- #include <grub/charset.h>
- #include <grub/i18n.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -963,11 +964,15 @@ static struct grub_fs grub_jfs_fs =
- 
- GRUB_MOD_INIT(jfs)
- {
--  grub_fs_register (&grub_jfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_jfs_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI(jfs)
- {
--  grub_fs_unregister (&grub_jfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_jfs_fs);
- }
-diff --git a/grub-core/fs/minix.c b/grub-core/fs/minix.c
-index 5354951d1..c267298b5 100644
---- a/grub-core/fs/minix.c
-+++ b/grub-core/fs/minix.c
-@@ -25,6 +25,7 @@
- #include <grub/dl.h>
- #include <grub/types.h>
- #include <grub/i18n.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -734,7 +735,10 @@ GRUB_MOD_INIT(minix)
- #endif
- #endif
- {
--  grub_fs_register (&grub_minix_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_minix_fs);
-+    }
-   my_mod = mod;
- }
- 
-@@ -756,5 +760,6 @@ GRUB_MOD_FINI(minix)
- #endif
- #endif
- {
--  grub_fs_unregister (&grub_minix_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_minix_fs);
- }
-diff --git a/grub-core/fs/nilfs2.c b/grub-core/fs/nilfs2.c
-index fc7374ead..08abf173f 100644
---- a/grub-core/fs/nilfs2.c
-+++ b/grub-core/fs/nilfs2.c
-@@ -34,6 +34,7 @@
- #include <grub/dl.h>
- #include <grub/types.h>
- #include <grub/fshelp.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -1231,11 +1232,15 @@ GRUB_MOD_INIT (nilfs2)
- 				  grub_nilfs2_dat_entry));
-   COMPILE_TIME_ASSERT (1 << LOG_INODE_SIZE
- 		       == sizeof (struct grub_nilfs2_inode));
--  grub_fs_register (&grub_nilfs2_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_nilfs2_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI (nilfs2)
- {
--  grub_fs_unregister (&grub_nilfs2_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_nilfs2_fs);
- }
-diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
-index de435aa14..8cc2ba3d5 100644
---- a/grub-core/fs/ntfs.c
-+++ b/grub-core/fs/ntfs.c
-@@ -27,6 +27,7 @@
- #include <grub/fshelp.h>
- #include <grub/ntfs.h>
- #include <grub/charset.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -1320,11 +1321,15 @@ static struct grub_fs grub_ntfs_fs =
- 
- GRUB_MOD_INIT (ntfs)
- {
--  grub_fs_register (&grub_ntfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_ntfs_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI (ntfs)
- {
--  grub_fs_unregister (&grub_ntfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_ntfs_fs);
- }
-diff --git a/grub-core/fs/reiserfs.c b/grub-core/fs/reiserfs.c
-index 36b26ac98..cdef2eba0 100644
---- a/grub-core/fs/reiserfs.c
-+++ b/grub-core/fs/reiserfs.c
-@@ -39,6 +39,7 @@
- #include <grub/types.h>
- #include <grub/fshelp.h>
- #include <grub/i18n.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -1417,11 +1418,15 @@ static struct grub_fs grub_reiserfs_fs =
- 
- GRUB_MOD_INIT(reiserfs)
- {
--  grub_fs_register (&grub_reiserfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_reiserfs_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI(reiserfs)
- {
--  grub_fs_unregister (&grub_reiserfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_reiserfs_fs);
- }
-diff --git a/grub-core/fs/romfs.c b/grub-core/fs/romfs.c
-index 1f7dcfca1..acf8dd21e 100644
---- a/grub-core/fs/romfs.c
-+++ b/grub-core/fs/romfs.c
-@@ -23,6 +23,7 @@
- #include <grub/disk.h>
- #include <grub/fs.h>
- #include <grub/fshelp.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -475,10 +476,14 @@ static struct grub_fs grub_romfs_fs =
- 
- GRUB_MOD_INIT(romfs)
- {
--  grub_fs_register (&grub_romfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_romfs_fs);
-+    }
- }
- 
- GRUB_MOD_FINI(romfs)
- {
--  grub_fs_unregister (&grub_romfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_romfs_fs);
- }
-diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
-index 983e88008..f64bdd2df 100644
---- a/grub-core/fs/sfs.c
-+++ b/grub-core/fs/sfs.c
-@@ -26,6 +26,7 @@
- #include <grub/types.h>
- #include <grub/fshelp.h>
- #include <grub/charset.h>
-+#include <grub/lockdown.h>
- #include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
-@@ -779,11 +780,15 @@ static struct grub_fs grub_sfs_fs =
- 
- GRUB_MOD_INIT(sfs)
- {
--  grub_fs_register (&grub_sfs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_sfs_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI(sfs)
- {
--  grub_fs_unregister (&grub_sfs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_sfs_fs);
- }
-diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
-index b836e6107..a60643be1 100644
---- a/grub-core/fs/udf.c
-+++ b/grub-core/fs/udf.c
-@@ -27,6 +27,7 @@
- #include <grub/fshelp.h>
- #include <grub/charset.h>
- #include <grub/datetime.h>
-+#include <grub/lockdown.h>
- #include <grub/udf.h>
- #include <grub/safemath.h>
- 
-@@ -1455,11 +1456,15 @@ static struct grub_fs grub_udf_fs = {
- 
- GRUB_MOD_INIT (udf)
- {
--  grub_fs_register (&grub_udf_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_udf_fs);
-+    }
-   my_mod = mod;
- }
- 
- GRUB_MOD_FINI (udf)
- {
--  grub_fs_unregister (&grub_udf_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_udf_fs);
- }
-diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
-index 01235101b..6b496e7b8 100644
---- a/grub-core/fs/ufs.c
-+++ b/grub-core/fs/ufs.c
-@@ -25,6 +25,7 @@
- #include <grub/dl.h>
- #include <grub/types.h>
- #include <grub/i18n.h>
-+#include <grub/lockdown.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -899,7 +900,10 @@ GRUB_MOD_INIT(ufs1)
- #endif
- #endif
- {
--  grub_fs_register (&grub_ufs_fs);
-+  if (!grub_is_lockdown ())
-+    {
-+      grub_fs_register (&grub_ufs_fs);
-+    }
-   my_mod = mod;
- }
- 
-@@ -913,6 +917,7 @@ GRUB_MOD_FINI(ufs1)
- #endif
- #endif
- {
--  grub_fs_unregister (&grub_ufs_fs);
-+  if (!grub_is_lockdown ())
-+    grub_fs_unregister (&grub_ufs_fs);
- }
- 
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch b/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
deleted file mode 100644
index 14e67cf35b..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 84bc0a9a68835952ae69165c11709811dae7634e Mon Sep 17 00:00:00 2001
-From: Lidong Chen <lidong.chen@oracle.com>
-Date: Tue, 21 Jan 2025 19:02:37 +0000
-Subject: [PATCH] fs: Prevent overflows when allocating memory for arrays
-
-Use grub_calloc() when allocating memory for arrays to ensure proper
-overflow checks are in place.
-
-The HFS+ and squash4 security vulnerabilities were reported by
-Jonathan Bar Or <jonathanbaror@gmail.com>.
-
-Fixes: CVE-2025-0678
-Fixes: CVE-2025-1125
-
-Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0678
-CVE: CVE-2025-1125
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=84bc0a9a68835952ae69165c11709811dae7634e]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/fs/btrfs.c       | 4 ++--
- grub-core/fs/hfspluscomp.c | 9 +++++++--
- grub-core/fs/squash4.c     | 8 ++++----
- 3 files changed, 13 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
-index 0625b1166..9c1e925c9 100644
---- a/grub-core/fs/btrfs.c
-+++ b/grub-core/fs/btrfs.c
-@@ -1276,8 +1276,8 @@ grub_btrfs_mount (grub_device_t dev)
-     }
- 
-   data->n_devices_allocated = 16;
--  data->devices_attached = grub_malloc (sizeof (data->devices_attached[0])
--					* data->n_devices_allocated);
-+  data->devices_attached = grub_calloc (data->n_devices_allocated,
-+					sizeof (data->devices_attached[0]));
-   if (!data->devices_attached)
-     {
-       grub_free (data);
-diff --git a/grub-core/fs/hfspluscomp.c b/grub-core/fs/hfspluscomp.c
-index 48ae438d8..a80954ee6 100644
---- a/grub-core/fs/hfspluscomp.c
-+++ b/grub-core/fs/hfspluscomp.c
-@@ -244,14 +244,19 @@ hfsplus_open_compressed_real (struct grub_hfsplus_file *node)
- 	  return 0;
- 	}
-       node->compress_index_size = grub_le_to_cpu32 (index_size);
--      node->compress_index = grub_malloc (node->compress_index_size
--					  * sizeof (node->compress_index[0]));
-+      node->compress_index = grub_calloc (node->compress_index_size,
-+					  sizeof (node->compress_index[0]));
-       if (!node->compress_index)
- 	{
- 	  node->compressed = 0;
- 	  grub_free (attr_node);
- 	  return grub_errno;
- 	}
-+
-+      /*
-+       * The node->compress_index_size * sizeof (node->compress_index[0]) is safe here
-+       * due to relevant checks done in grub_calloc() above.
-+       */
-       if (grub_hfsplus_read_file (node, 0, 0,
- 				  0x104 + sizeof (index_size),
- 				  node->compress_index_size
-diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
-index f91ff3bfa..cf2bca822 100644
---- a/grub-core/fs/squash4.c
-+++ b/grub-core/fs/squash4.c
-@@ -816,10 +816,10 @@ direct_read (struct grub_squash_data *data,
- 	  break;
- 	}
-       total_blocks = ((total_size + data->blksz - 1) >> data->log2_blksz);
--      ino->block_sizes = grub_malloc (total_blocks
--				      * sizeof (ino->block_sizes[0]));
--      ino->cumulated_block_sizes = grub_malloc (total_blocks
--						* sizeof (ino->cumulated_block_sizes[0]));
-+      ino->block_sizes = grub_calloc (total_blocks,
-+				      sizeof (ino->block_sizes[0]));
-+      ino->cumulated_block_sizes = grub_calloc (total_blocks,
-+						sizeof (ino->cumulated_block_sizes[0]));
-       if (!ino->block_sizes || !ino->cumulated_block_sizes)
- 	{
- 	  grub_free (ino->block_sizes);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0690.patch b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
deleted file mode 100644
index be585c96ad..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From dad8f502974ed9ad0a70ae6820d17b4b142558fc Mon Sep 17 00:00:00 2001
-From: Jonathan Bar Or <jonathanbaror@gmail.com>
-Date: Thu, 23 Jan 2025 19:17:05 +0100
-Subject: [PATCH] commands/read: Fix an integer overflow when supplying more
- than 2^31 characters
-
-The grub_getline() function currently has a signed integer variable "i"
-that can be overflown when user supplies more than 2^31 characters.
-It results in a memory corruption of the allocated line buffer as well
-as supplying large negative values to grub_realloc().
-
-Fixes: CVE-2025-0690
-
-Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
-Signed-off-by: Jonathan Bar Or <jonathanbaror@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-0690
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=dad8f502974ed9ad0a70ae6820d17b4b142558fc]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/commands/read.c | 19 +++++++++++++++----
- 1 file changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/grub-core/commands/read.c b/grub-core/commands/read.c
-index 597c90706..8d72e45c9 100644
---- a/grub-core/commands/read.c
-+++ b/grub-core/commands/read.c
-@@ -25,6 +25,7 @@
- #include <grub/types.h>
- #include <grub/extcmd.h>
- #include <grub/i18n.h>
-+#include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -37,13 +38,14 @@ static const struct grub_arg_option options[] =
- static char *
- grub_getline (int silent)
- {
--  int i;
-+  grub_size_t i;
-   char *line;
-   char *tmp;
-   int c;
-+  grub_size_t alloc_size;
- 
-   i = 0;
--  line = grub_malloc (1 + i + sizeof('\0'));
-+  line = grub_malloc (1 + sizeof('\0'));
-   if (! line)
-     return NULL;
- 
-@@ -59,8 +61,17 @@ grub_getline (int silent)
-       line[i] = (char) c;
-       if (!silent)
- 	grub_printf ("%c", c);
--      i++;
--      tmp = grub_realloc (line, 1 + i + sizeof('\0'));
-+      if (grub_add (i, 1, &i))
-+        {
-+          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
-+          return NULL;
-+        }
-+      if (grub_add (i, 1 + sizeof('\0'), &alloc_size))
-+        {
-+          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
-+          return NULL;
-+        }
-+      tmp = grub_realloc (line, alloc_size);
-       if (! tmp)
- 	{
- 	  grub_free (line);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
deleted file mode 100644
index e6906d909c..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 34824806ac6302f91e8cabaa41308eaced25725f Mon Sep 17 00:00:00 2001
-From: B Horn <b@horn.uk>
-Date: Thu, 18 Apr 2024 20:29:39 +0100
-Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
-
-The dump enables a user to read memory which should not be possible
-in lockdown mode.
-
-Fixes: CVE-2025-1118
-
-Reported-by: B Horn <b@horn.uk>
-Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
-Signed-off-by: B Horn <b@horn.uk>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-CVE: CVE-2025-1118
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- grub-core/commands/minicmd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
-index 286290866..8c5ee3e60 100644
---- a/grub-core/commands/minicmd.c
-+++ b/grub-core/commands/minicmd.c
-@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
-     grub_register_command ("help", grub_mini_cmd_help,
- 			   0, N_("Show this message."));
-   cmd_dump =
--    grub_register_command ("dump", grub_mini_cmd_dump,
--			   N_("ADDR [SIZE]"), N_("Show memory contents."));
-+    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
-+				    N_("ADDR [SIZE]"), N_("Show memory contents."));
-   cmd_rmmod =
-     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
- 			   N_("MODULE"), N_("Remove a module."));
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770.patch b/meta/recipes-bsp/grub/files/CVE-2025-54770.patch
deleted file mode 100644
index 7df1d8534b..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-54770.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 80e0e9b2558c40fb108ae7a869362566eb4c1ead Mon Sep 17 00:00:00 2001
-From: Thomas Frauendorfer | Miray Software <tf@miray.de>
-Date: Fri, 9 May 2025 14:20:47 +0200
-Subject: [PATCH] net/net: Unregister net_set_vlan command on unload
-
-The commit 954c48b9c (net/net: Add net_set_vlan command) added command
-net_set_vlan to the net module. Unfortunately the commit only added the
-grub_register_command() call on module load but missed the
-grub_unregister_command() on unload. Let's fix this.
-
-Fixes: CVE-2025-54770
-Fixes: 954c48b9c (net/net: Add net_set_vlan command)
-
-CVE: CVE-2025-54770
-
-Upstream-Status: Backport
-[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=10e58a14db20e17d1b6a39abe38df01fef98e29d]
-
-Reported-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
-Signed-off-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- grub-core/net/net.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/grub-core/net/net.c b/grub-core/net/net.c
-index 2b45c27d1..05f11be08 100644
---- a/grub-core/net/net.c
-+++ b/grub-core/net/net.c
-@@ -2080,6 +2080,7 @@ GRUB_MOD_FINI(net)
-   grub_unregister_command (cmd_deladdr);
-   grub_unregister_command (cmd_addroute);
-   grub_unregister_command (cmd_delroute);
-+  grub_unregister_command (cmd_setvlan);
-   grub_unregister_command (cmd_lsroutes);
-   grub_unregister_command (cmd_lscards);
-   grub_unregister_command (cmd_lsaddr);
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61661.patch b/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
deleted file mode 100644
index 9f6cf68e4b..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c24e11d87f8ee8cefd615e0c30eb71ff6149ee50 Mon Sep 17 00:00:00 2001
-From: Jamie <volticks@gmail.com>
-Date: Mon, 14 Jul 2025 09:52:59 +0100
-Subject: [PATCH 2/4] commands/usbtest: Use correct string length field
-
-An incorrect length field is used for buffer allocation. This leads to
-grub_utf16_to_utf8() receiving an incorrect/different length and possibly
-causing OOB write. This makes sure to use the correct length.
-
-Fixes: CVE-2025-61661
-
-CVE: CVE-2025-61661
-
-Upstream-Status: Backport
-[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=549a9cc372fd0b96a4ccdfad0e12140476cc62a3]
-
-Reported-by: Jamie <volticks@gmail.com>
-Signed-off-by: Jamie <volticks@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- grub-core/commands/usbtest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/commands/usbtest.c b/grub-core/commands/usbtest.c
-index 2c6d93fe6..8ef187a9a 100644
---- a/grub-core/commands/usbtest.c
-+++ b/grub-core/commands/usbtest.c
-@@ -99,7 +99,7 @@ grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int langid,
-       return GRUB_USB_ERR_NONE;
-     }
- 
--  *string = grub_malloc (descstr.length * 2 + 1);
-+  *string = grub_malloc (descstrp->length * 2 + 1);
-   if (! *string)
-     {
-       grub_free (descstrp);
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61662.patch b/meta/recipes-bsp/grub/files/CVE-2025-61662.patch
deleted file mode 100644
index f04a52fe76..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-61662.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 498dc73aa661bb1cae4b06572b5cef154dcb1fb7 Mon Sep 17 00:00:00 2001
-From: Alec Brown <alec.r.brown@oracle.com>
-Date: Thu, 21 Aug 2025 21:14:06 +0000
-Subject: [PATCH 3/4] gettext/gettext: Unregister gettext command on module
- unload
-
-When the gettext module is loaded, the gettext command is registered but
-isn't unregistered when the module is unloaded. We need to add a call to
-grub_unregister_command() when unloading the module.
-
-Fixes: CVE-2025-61662
-
-CVE: CVE-2025-61662
-
-Upstream-Status: Backport
-[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=8ed78fd9f0852ab218cc1f991c38e5a229e43807]
-
-Reported-by: Alec Brown <alec.r.brown@oracle.com>
-Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- grub-core/gettext/gettext.c | 19 ++++++++++++-------
- 1 file changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index 9ffc73428..edebed998 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -502,6 +502,8 @@ grub_cmd_translate (grub_command_t cmd __attribute__ ((unused)),
-   return 0;
- }
- 
-+static grub_command_t cmd;
-+
- GRUB_MOD_INIT (gettext)
- {
-   const char *lang;
-@@ -521,13 +523,14 @@ GRUB_MOD_INIT (gettext)
-   grub_register_variable_hook ("locale_dir", NULL, read_main);
-   grub_register_variable_hook ("secondary_locale_dir", NULL, read_secondary);
- 
--  grub_register_command_p1 ("gettext", grub_cmd_translate,
--			    N_("STRING"),
--			    /* TRANSLATORS: It refers to passing the string through gettext.
--			       So it's "translate" in the same meaning as in what you're
--			       doing now.
--			     */
--			    N_("Translates the string with the current settings."));
-+  cmd = grub_register_command_p1 ("gettext", grub_cmd_translate,
-+				  N_("STRING"),
-+				  /*
-+				   * TRANSLATORS: It refers to passing the string through gettext.
-+				   * So it's "translate" in the same meaning as in what you're
-+				   * doing now.
-+				   */
-+				  N_("Translates the string with the current settings."));
- 
-   /* Reload .mo file information if lang changes.  */
-   grub_register_variable_hook ("lang", NULL, grub_gettext_env_write_lang);
-@@ -544,6 +547,8 @@ GRUB_MOD_FINI (gettext)
-   grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
-   grub_register_variable_hook ("lang", NULL, NULL);
- 
-+  grub_unregister_command (cmd);
-+
-   grub_gettext_delete_list (&main_context);
-   grub_gettext_delete_list (&secondary_context);
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch b/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
deleted file mode 100644
index bfc05008bf..0000000000
--- a/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8368c026562a72a005bea320cfde9fd7d62d3850 Mon Sep 17 00:00:00 2001
-From: Alec Brown <alec.r.brown@oracle.com>
-Date: Thu, 21 Aug 2025 21:14:07 +0000
-Subject: [PATCH 4/4] normal/main: Unregister commands on module unload
-
-When the normal module is loaded, the normal and normal_exit commands
-are registered but aren't unregistered when the module is unloaded. We
-need to add calls to grub_unregister_command() when unloading the module
-for these commands.
-
-Fixes: CVE-2025-61663
-Fixes: CVE-2025-61664
-
-CVE: CVE-2025-61663 CVE-2025-61664
-
-Upstream-Status: Backport
-[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=05d3698b8b03eccc49e53491bbd75dba15f40917]
-
-Reported-by: Alec Brown <alec.r.brown@oracle.com>
-Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- grub-core/normal/main.c | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
-index dad25e7d2..a810858c3 100644
---- a/grub-core/normal/main.c
-+++ b/grub-core/normal/main.c
-@@ -500,7 +500,7 @@ grub_mini_cmd_clear (struct grub_command *cmd __attribute__ ((unused)),
-   return 0;
- }
- 
--static grub_command_t cmd_clear;
-+static grub_command_t cmd_clear, cmd_normal, cmd_normal_exit;
- 
- static void (*grub_xputs_saved) (const char *str);
- static const char *features[] = {
-@@ -542,10 +542,10 @@ GRUB_MOD_INIT(normal)
-   grub_env_export ("pager");
- 
-   /* Register a command "normal" for the rescue mode.  */
--  grub_register_command ("normal", grub_cmd_normal,
--			 0, N_("Enter normal mode."));
--  grub_register_command ("normal_exit", grub_cmd_normal_exit,
--			 0, N_("Exit from normal mode."));
-+  cmd_normal = grub_register_command ("normal", grub_cmd_normal,
-+				      0, N_("Enter normal mode."));
-+  cmd_normal_exit = grub_register_command ("normal_exit", grub_cmd_normal_exit,
-+					   0, N_("Exit from normal mode."));
- 
-   /* Reload terminal colors when these variables are written to.  */
-   grub_register_variable_hook ("color_normal", NULL, grub_env_write_color_normal);
-@@ -587,4 +587,6 @@ GRUB_MOD_FINI(normal)
-   grub_register_variable_hook ("color_highlight", NULL, NULL);
-   grub_fs_autoload_hook = 0;
-   grub_unregister_command (cmd_clear);
-+  grub_unregister_command (cmd_normal);
-+  grub_unregister_command (cmd_normal_exit);
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub-efi_2.12.bb
rename to meta/recipes-bsp/grub/grub-efi_2.14.bb
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 125490183b..434f977667 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -14,47 +14,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 CVE_PRODUCT = "grub2"
 
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
-           file://autogen.sh-exclude-pc.patch \
-           file://grub-module-explicitly-keeps-symbole-.module_license.patch \
-           file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-           file://0001-RISC-V-Restore-the-typcast-to-long.patch \
-           file://0001-misc-Implement-grub_strlcpy.patch \
-           file://CVE-2024-45781.patch \
-           file://CVE-2024-45782_CVE-2024-56737.patch \
-           file://CVE-2024-45780.patch \
-           file://CVE-2024-45783.patch \
-           file://CVE-2025-0624.patch \
-           file://CVE-2024-45774.patch \
-           file://CVE-2024-45775.patch \
-           file://CVE-2025-0622-01.patch \
-           file://CVE-2025-0622-02.patch \
-           file://CVE-2025-0622-03.patch \
-           file://CVE-2024-45776.patch \
-           file://CVE-2024-45777.patch \
-           file://CVE-2025-0690.patch \
-           file://CVE-2025-1118.patch \
-           file://CVE-2024-45778_CVE-2024-45779.patch \
-           file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
-           file://CVE-2025-0678_CVE-2025-1125.patch \
-           file://CVE-2024-56738.patch \
-           file://CVE-2025-54770.patch \
-           file://CVE-2025-61661.patch \
-           file://CVE-2025-61662.patch \
-           file://CVE-2025-61663_61664.patch \
+           file://0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch \
+           file://0002-grub-module-explicitly-keeps-symbole-.module_license.patch \
+           file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
 "
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
-SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
+SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
-DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
+DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native autoconf-archive-native"
 
 GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
@@ -74,7 +46,7 @@ GRUBPLATFORM:riscv32 = "efi"
 GRUBPLATFORM:riscv64 = "efi"
 GRUBPLATFORM ??= "pc"
 
-inherit autotools gettext texinfo pkgconfig
+inherit autotools gettext texinfo pkgconfig bash-completion
 
 CFLAGS:remove = "-O2"
 # It doesn't support sse, its make.defaults sets:
@@ -109,11 +81,6 @@ export PYTHON = "python3"
 
 do_configure:prepend() {
 	cd ${S}
-
-	# Remove in next version.
-	# See: https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b835601c7639ed1890f2d3db91900a8506011a8e
-	echo "depends bli part_gpt" > ${S}/grub-core/extra_deps.lst
-
 	FROM_BOOTSTRAP=1 ${S}/autogen.sh
 	cd ${B}
 }
diff --git a/meta/recipes-bsp/grub/grub_2.12.bb b/meta/recipes-bsp/grub/grub_2.14.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub_2.12.bb
rename to meta/recipes-bsp/grub/grub_2.14.bb
-- 
2.34.1


