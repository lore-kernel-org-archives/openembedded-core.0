Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2D8CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19538.1779885869564425451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CdkB/zxn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ndMG2633662
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Yfo+Bw7D0xeDfJ8Sk/obMEbK51A+TL/34t8J81/AxW0=; b=
	CdkB/zxn30yAbHez8djjZGFPg1ZLnbaNF3YKbeTgeJYUZlWhYN4TV2BipArDQkj1
	hjzrn1ZsU3BFYTh1RJtJihq8mIwQq+jKbQct2YBzm2djCq2F29EARhGGPkZ5+U8Q
	Bw4IOWA/enJmPEh6XNa1aDQ9Y+v5Xg+pqFgdCY8PUcqYzi/6XllK4QvN169Gy4k4
	jIs/JGmEwmy+43f7IP2fyAmjOkrAI/drhnkcT5npxjP1E7HYeKHgXT8IQyjvqEwl
	1hzUKXdFOFnz0Bh38ykwjGiWXNoyVH4aJqj6Mi17dyaLg3utkvnxgnmoC4KMjck/
	HjcO13Omem8UmjPVe/ZNRQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dvx5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Btjn3ybakQxPpJhr7KZpRbdylIe6krWNIdMJNEQ0LxgtYORnj5m0DipG9bYCTIj0cXLz9RdxbS24cBU0PfxQxWpHK8mv2QuD2nJaFfRfOJv6e9ccwMXhS0FH5yeGh8xaoOVa2iGpywVxsSZ4eBRO7CRwoHkHI7nQmzSupsToh0sjWsxYYr0kMoZ89UbB5b2C5ULfjU3hg/U8lrOVjaELXbQAm4FIqsCzRbH63jw4eBbPd4cirBSQEPpI21ZVS1/XTgtE36K44t+c3NsHvf5ttDtxSl02OxqUnljN0qnASwMID1yVpjaEji+nEsYCbCc7Ai3XESUjb0hu/HPPNYP++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfo+Bw7D0xeDfJ8Sk/obMEbK51A+TL/34t8J81/AxW0=;
 b=yIsGV01c7g5HP/m2EZSBSyPkbjqLDE7pjH7n4Tfqm6kgc26XSLYCYDGXwPv7dl97TwYgmC0oaYgZoT5PzYKCa18fByaPgZml/Khu44a4oeIQf79GI7JWA8Ct6JVxUG2qH/Om16ml62jEg9aBzH1lif2k0kP+r9buveIJtQQn9IrbrEpX0wyQtNw6yZQ805wSkqzNvkSRppp7O0wgJ2T6J2jFfjQK7HC2U/wwF7FGQuUQRHPL8T4sIeFBU5kCJaeh12oYciRW3J/j7lBHx3uNIaJL+jih1G+egvS8r3SQrtjn0ii2OO1lbC6859JZStZR8Mtyq3XGhcvZMlxGcFLB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:44:26 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:25 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 1/7] gcc: Upgrade GCC to 16.1 release
Date: Wed, 27 May 2026 05:44:08 -0700
Message-ID: <20260527124414.1728434-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9a24b1-dfe7-4b58-4771-08debbedaf5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|18002099003|22082099003|12006099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	rxlz8ZindEjbx7yVjalPhbxVZ8mlXOP5RULItf5UwHLL8eo1lBXEVH/1G5vKbApAJTbgbzF5dqgzW8MSBiqO+Sm45FFNXjdc0AC8wgZTeG9vCdVkpqfMxQqqCHcI0/X4AS6nc4UyqNT5EqX4zRP6mxVDuDkenGqnpv7y1Qkczgei9VVrrga90tZNwYZnYK9/cMTw5zIQgPEjOQFy1/5v0AfWi890V77l5SAOTD2VJ38hEGsrZKhJ4dhruXHdPe7jdZo8ea7Zr8dv1TPH2Ae5hqWBU8zF+J8xLkWbAtkmcYR/YaJFIdD220+cmrLsbc31R+wUVVTtLS3pHMTmDBC2q0vafg2wD6uYi+HU8DFstQsfeKdJYpfdNxpq4Kgde5emfUzTyyiHM+MTwRLQvEvrdCpQ1aRA7IlT0mIq+lH8+Kg2aRSpfKRUl6JtmyTOJmtWU7rnXB9DLHGTZZHWKDJghOu8s2k8XOui8Uq9aM7Cj9YVgYCph1eb1Ie/m4NTfxOPsAjiN4TDJRCLE7UWkPeAreYs6HdFxcH2xuI65LEEJod75vs4WkxaCTcPqtOKg7FV2dmUqaPjZM/8QeOFsvvV1J82Hwu8oqJNBV/5+TbGOtWThNLw9bSHumdffLWRvCx9Av1HxkIzaAeikcgzRb8u4Z3seI4cj7ockI35I63p7x1oXiRtlalNEnIK+32ayL1vr9Dk3DmIaRzRznBUdmkHjzDIVVdnl/PAfuJW2r3cYeD48L/af9pyOQpZaqMk/KoT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(18002099003)(22082099003)(12006099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UZsEZMonGEFdpgexjZJNMxJSLCOoXLMUtcRpdwrZVGYLseKNmj04AeoAz49z?=
 =?us-ascii?Q?noHqn4Bl7MEOLLjmT2DCThwJfJXsDU8yA3+teNitxcahMChMtuIeOG7szFFS?=
 =?us-ascii?Q?fuIthseVrC1ffqJBB3ZhV2c5BjxDPm9HxihC0VY+wrbtj5el+HxJHx5d4qBP?=
 =?us-ascii?Q?aGCoFBj9rCuPY6Py0SKjQurNNKzOVNV/y0OLpDb3QJ8zgLl+HaGqJTl+iTAE?=
 =?us-ascii?Q?Wsv1/xKpAGd0mFPaC7Tt1Y2Mu5ZNpd476SmCj6z5GOWGOdb2qoak6Ug8soxT?=
 =?us-ascii?Q?kiBnMoVQk6Y4dZgy8Fv/gt5tD1DomF07mIR0VTHiqawKc0caHS85SSFSBm22?=
 =?us-ascii?Q?L5CLob2h5TxgGFuVIkGMj4QEF/8r6RFDeVbgS6D8xfEMiDozA/fwNNaw24cm?=
 =?us-ascii?Q?hYIzzU1hENTbumm/7a4vH4MD5CsGu+BX2wXsJGE6srM4C8rBSGkcfIrebMn+?=
 =?us-ascii?Q?gVHxA+2b2CFwBFVjgrHjRQWxd2t0rHso4QzSTb4ceKl7gOppNzNzlNtvuY8N?=
 =?us-ascii?Q?aBp01wa4Nn2q/lOV1wQEoFllC1l60wtHqk/DpZ2pKGMWfL2fDIcNih9pGNI8?=
 =?us-ascii?Q?vqojcqoLdJb3EK0/1tHoJ7nAk72TmKrYHAzcOSR8cnbBwttc+uhI+JJ29ToK?=
 =?us-ascii?Q?Ldk3T0ZzArxnkB/PFmNkwRKlDLwLvliIk1vuD0CHF4rsMxq7bzOHmsAkW+zU?=
 =?us-ascii?Q?iIVR7tUCW8gDLvDCVc4ZqGuuxA3Nxzfn0ShpiRW6cu8g22ySOR7DOYUxMLcB?=
 =?us-ascii?Q?udIt+kL2m+HBWMQh5E4MZAqJOtxxwRlF3ljEuzm5aU3/dxQnDr7P9nonfsJV?=
 =?us-ascii?Q?r23SPoCUQ6curPwGfpijpWS6Lu/pPRCQXPD4GhtDzaVwh0M4MJI5hbAocPXD?=
 =?us-ascii?Q?FnwPTub7cRBJkowT56hLQA3GwG3NedO5njSHn1bYyHgViU2suBQWIrpp5o3K?=
 =?us-ascii?Q?HrUZTqsCxxIung2ulPX9+PtnKh/ybNBIsFPdD86sK72B3GXD7kbFXcynVGCI?=
 =?us-ascii?Q?LJd30ds1XHC8Zx2msVVZhuSW8fadvVHpr7qtX1ec49hkvgS9/dRUsDq4GyHe?=
 =?us-ascii?Q?ylpG9SHOx3PgynxjUG/ZhF8TTMND4HWwYoj9+5VD60atnfKFMOvKmwo4P4R2?=
 =?us-ascii?Q?CL5cyPR5D9rVNYISU+dW7HILGPCmu0xCtKjPveCzJSaPGz3dv6VzsvU8u9Lo?=
 =?us-ascii?Q?+hnP9w4IY16vmX7Kh2+sWnAp1/dV6KJNkxhVYOsj8440F4MxmEtG66V4Xo23?=
 =?us-ascii?Q?dQV7SKlPe3Pt53D4x3KtgXEpd6hHsDE5BcDC2PAugpLJzzlGVBp2bF6gpPZf?=
 =?us-ascii?Q?wuRLcjLvVavY1AU8U+tuoHhPqyaWmZ/A+7W/VJXH3LxZJTD4rk1gsdgIlPR/?=
 =?us-ascii?Q?4INvDxpAKFSEQVlqOlu+5+534Jj/N0pwtNO8EUu4Nn5WEM6kGS3WJsrHb4dE?=
 =?us-ascii?Q?23CwNFtu8Z5LgMQcPkKVp82jE7jUgnZa/1ZWOq6EEad+8fjh2zzIpgh8PnUI?=
 =?us-ascii?Q?G8hQvSkFdZ52eMiY312zkZOcADukEXoD97uxfxEuGKpFflxYFjt7tmS34NGE?=
 =?us-ascii?Q?T+4XB52cDHuoqFkKky3M3xwXagR1PmmfdQY301acIe8MCNy9tKafCMwMLhBZ?=
 =?us-ascii?Q?2W6GsysCkYSdFcTd8FliNYI9wuJoTfaQb90KaOc3qSjM1dbeK8DrjzCWgvUx?=
 =?us-ascii?Q?X34vzPC8AvYjt+4/0QiqtTXvU/piiKHRODPzSzZSylrsHq+5v2zzweUrbrNo?=
 =?us-ascii?Q?NnHNgIYoM1oUf6gWtpEfb1VB7U/+3E4=3D?=
X-Exchange-RoutingPolicyChecked: 
	JWfk/0X0fOQVmbuwqDSLSQaVr7gS1X4XfP4WsIFcRN8Af7Lmj7JiqRLRKV+RnwlSYpaavas6VIsD0Akeb7I651lGJD95kgmT2cFpf46UMnwuD8QVK7DRKtgX0MHrGdiw/JFMJfnLBpK54ViZzdL2egY45Rn56Unp+W9hg5G3e0d94/l2ShLdEscq+uY0fBvJW+UqxgiHOXHWeP5gb2eBsDPF5SxxyaT/XN+prBDhRpWTp3i+QfmSFrjFTofI/8obWhdc6VA7+wjMXbD4PfFQRbARqJRZvcPFIBXD65UYF2fYLB2D816x/iHYttW4hqGR45q+MHEPWzB4Qb8N5W6k0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9a24b1-dfe7-4b58-4771-08debbedaf5a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:25.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSQtKbWf/IOH7bXJnGQPPHlIqp9uOLgLeoPXNK6XMwdra+vgSaHaYhmY7CD7FT8/5ZDd49yL524B4E35GhknSWzTfNrgKhlKHupuJEg/ncQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyMyBTYWx0ZWRfXyKqD8rmAaFUW
 DdApfueRmWoseoJXd3uRy9COinwko+h7mSDpdKyz2kt+oXZ5JT3EZXPjQKre8mCEkBEvHlx2ZtB
 rYy8PJNYMW/sXNT5YoJA8gA3RbzWoFLMNtLq9g5EFYD4u9jg6yrIQ3RPT3ee7HwhckHh9P1/c1u
 8r3Z+rvYFEyZOxaitHIY7PWgJsz8X2/sxYrUkQliiZxieLEKWjQojCpRBaiIqk5hEqjlfojJLf1
 TiOL1XLdt41ZJFfUomU9+bSwlcL1zYrRIJPzs4sU7ndGYRGPnZXtEzVLWZ5IfbNBsi3V9N4uclH
 VDZAsb/JAYlO5tvPJlfYW3AOjkj3Kh7CgM7zEIcBJ2L3JNBuaXBPtKCheptx8P1po/EtaeylTE0
 VFhecclSveX1DX3uy0umXhkIsDX+z6qxPVOpK4Y67QniCbDlnqQKULjznP+ivvPSXjD7U5A9RzJ
 vhmqWD3xAKSF1pAm2zA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16e72c cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=uCaEEmbJTeulPlxkI8cA:9 a=b05lPj1fihGE9SP1:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 1em5bxI16QClnu05xHugvjSjJ6ldkIXK
X-Proofpoint-ORIG-GUID: 1em5bxI16QClnu05xHugvjSjJ6ldkIXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237649

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Notable changes in GCC 16 include:
- Improved C23/C++23 support and initial C++26 features
- Enhanced diagnostics and static analyzer improvements
- Optimizer and code generation enhancements
- Target-specific updates for AArch64, RISC-V, x86, and others
- Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)
- Multiple bug fixes and performance improvements

* Rebased existing OE-Core patches for GCC 16.1 and dropped
patches merged upstream.

For detailed info: https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 17 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++---
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++++--------
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  0
 17 files changed, 66 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c5a9d712..fdfdec28b5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-16.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 3c956dfb12..33d3efd845 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "15.%"
+GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
 RUSTVERSION ?= "1.95.0%"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-16.1.inc
index a96f2b8411..3a96228631 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "16.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "16.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -34,17 +34,17 @@ LIC_FILES_CHKSUM = "\
 #SRC_URI[sha256sum] = "41bf7be5dc029112a9df625266e7de030ffc36ff3638f270b180ae8c91fe6449"
 
 # from snapshot
-#RELEASE ?= "15-20250420"
-#RELEASE ?= "15.1.0-RC-20250418"
+#RELEASE ?= "16-20260502"
+#RELEASE ?= "16.1.0-RC-20260424"
 #BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
 #SOURCEDIR ?= "gcc-${RELEASE}"
-#SRC_URI[sha256sum] = "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53e2f6d21b139b0af3c"
+#SRC_URI[sha256sum] = "e8edc2aaf0affce7020658b0be9a3fc820aa33dc610640d3fe1ba1aee360051b"
 
 # official release
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -72,11 +72,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
-           file://0028-fix-gcc-libitm-false-postives-01.patch \
-           file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 621f8bc41f..07e9e23f3d 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644
 +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
  
  #define MUSL_ABI_SPEC \
-   "%{mabi=lp64d:}" \
+   "%{mabi=ilp32d:}" \
 @@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.  If not see
  
  #undef MUSL_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index a087ba17d9..678457bbc9 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644
 +	            {
 +		      memcpy (path + len, this_multi, this_multi_len + 1);
 +	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
-+	              ret = callback (path, callback_info);
++	              ret = callback (path);
 +	                if (ret)
 +		          break;
 +	            }
 +	        }
 +
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret = callback (path, callback_info);
+ 	      ret = callback (path);
  	      if (ret)
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index 0f2a9d8c1f..5a8a79c0d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644
  
  endif
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 9798e7c09e9..3b3027eb77d 100644
+index 887ae41..b3d5e6f 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -452,7 +452,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
- libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
+@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS = $(libatomic_version_info) $(libatomic_version_script) \
+ @PARTIAL_VXWORKS_FALSE@	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_2) $(am__append_3) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_4) $(am__append_5)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=i586
+ @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -mlsx|-mscq
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index fcdd79a840..dc708942b4 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index c0376b04551..5d053dfe726 100644
+index 55775d0..df161a9 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
-@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
+@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644
 -		return 0;
 -	      }
 -	    } "-mloongson-mmi"
-+	    expr 0
++            expr 0
  	}
      }]
  }
-@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {
+@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {
      if { !([istarget mips*-*-*]) } {
        expr 0
      } else {
@@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644
 -	}
 -	#endif
 -      } "-mmsa"
-+      expr 0
++    expr 0
      }
    }]
  }
-@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
-+    global do-what-limit
++    global do-what-limit 
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
-+            set do-what-limit link
- 	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
+-	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
++	    set do-what-limit link
++            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+ 	    }
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
-+		set do-what-limit run
++                set do-what-limit run
  	    }
  	    $runtest $testcases $target_flags ${default-extra-flags}
+-	    unset et_index
 +	    unset do-what-limit
++            unset et_index
  	}
      } else {
- 	set et_index 0
-@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
+ 	$runtest $testcases $flags ${default-extra-flags}
+@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644
      global EFFECTIVE_TARGETS
  
      if [istarget powerpc*-*-*] {
-@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
  	    }
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif { [check_effective_target_x86] } {
  	lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_sse2_runtime] } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++         set do-what-limit link	
++        }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_mpaired_single "-mpaired-single"] } {
+@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget alpha*-*-*] {
  	# Alpha's vectorization capabilities are extremely limited.
-@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
+ 	# It's more effort than its worth disabling all of the tests
+@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget ia64-*-*] {
  	set dg-do-what-default run
-@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [is-effective-target arm_neon_ok] {
+@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget aarch64*-*-*] {
  	set dg-do-what-default run
-@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [istarget s390*-*-*] {
+@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {
  	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget amdgcn-*-*] {
  	set dg-do-what-default run
+     } elseif [istarget riscv*-*-*] {
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_16.1.bb
-- 
2.49.0


