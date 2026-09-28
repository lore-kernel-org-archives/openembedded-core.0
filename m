Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1239CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:04:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54849.1790593493930515395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rs2ccbRG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473121832d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SA6wXq3335246
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Bjjcpfu/q
	N1FbDu+Cc9iOsF7SwnDhJoxOu05y+NnlX8=; b=rs2ccbRGvGSisqAyxzpB3p1GZ
	xneNiFiL+iIPrJwdXjG6fsUaVfDtvPlaatPYpmYsM0SPm89EJJey2LStmz9/i+8a
	ud/2WuT3Ft90Y2GBTbHjyDxclJBH04FhdCTx5lGBXTLfY5liapLw0XPdfcY3Xf+n
	cT7RBhp/f52g4M/hWImoBW74XkVctmhudrniYZXw7cnR9k9Hi+B1AIC9H37nOy+m
	sngSyGkRLEVbpmVqM6OWJaiKLjRZlUt/6OmAc1f9Pg10C4Ad6St9pXf9WOij1mbA
	QxqqyOXjXQecvhsun9ocoWiP3rLMOfAvpwq0/Wbd4iJ3xDJWDtwXEkkWJT1tQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021103.outbound.protection.outlook.com [52.101.57.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515ae3q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:04:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYPz5virBw1ru8u+dr3UY4eMjzdTMqUW6FcH1I9ATV9skVVGtaWZTqVHoH3Pjt+uJDej7Z+c/X2Mo9rpt5/q9p7/9GpdRG0zuIJRw403cxJ0ybo0m+F2lvltKIwzxiR+/7+NU4liX1ODlKWrarO/vhEcpEMqvedD1gqckMWCho82bOvJXff1q5R8df04UnT2XD483cue2rWf3GKLqgCWzyR6I6L+/V4xb3yIwjs6Nkad47FEu7nA6MnJKqKMxWAgE2jC8jtRFZ/+ct8LGtO5ZRRjUKiLNdNX8/OtoC4T87OYBRHlTdDnAEeKpLTd7bt4u6If+HC25Ue0vFWjuiEWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjjcpfu/qN1FbDu+Cc9iOsF7SwnDhJoxOu05y+NnlX8=;
 b=hyWCsm/C4eRHZkpd7otXnp/gZgOGbupaG5LM+UclIsH3nh4Ur5NRz/ovJStqUWn2frTGHfHCl/JSM/4By7ySplxSYk5dVnF+R0RHAqz3JM+c6NDFPibEmcxCPpjh1d3tKFdH0GttRtH4mZhV8TX8rHuiGtYv0HNxenNUrnAJimj5QMucucZsjGmEpy4afbJsQgSD7v3Iv2ZphqkXmFOXUeMXhBIHBSqJ0IzjqhAL3qQYtytNPz5Y+vaPgDB4/kiCsD6OGqwdFWajOx2hxSnyL68k85sw5c9oSDOxyo2ZV8iWJnjNBvd8zN5y/zFXSW6SWihIrf7otIAg45kBsfeWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:04:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:04:49 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH] qemuriscv.inc: default to fw_dynamic.elf as QEMU BIOS
Date: Mon, 28 Sep 2026 04:04:33 -0700
Message-ID: <20260928110433.843477-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY8PR11MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 86543d15-86b9-4db1-7415-08df1d505019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|11063799006|10067099003|56012099006|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	jZgq304iZP3F2DSjcHes6RVUSjgzYVcNbDt3iOktPoSCG4u4zF4DKEQMt7MtIvWuYhRqd5+2+h1H3Jm8EnwxOo8et1tAz2bjIln9VYO6Ow6tMdjEshGbWhn1GJMMHxZ0E6qDjODuPJVWJ9J5ULGSYxx/DGPdxPnd+0/+oUQTHp9XtLyXPOf45bjxDwdqb2Ci3Rs5TD4eFvPz14IzUYYRHfNagxHdmJEsHE17nsAYPIVNMh6sqxGDmJVHTEqlzfXlXDPfenwwL6ZeBm72uqXEEapKf41K5fsyK2D7VSkAjbD5g3y2PIVV/O+ulTld84iG/5fnGlQDD970j04cCWYDd/7FJvo6TfJ2T5Jyd0DaPd1GfsWf5ylGfxo7eNnwzaTBsNh3numanU9ElWisBszyqInST9+TiAd0z74HoQPKm4KHWXDhXrLgssUkGYovJc8iMowmZlIO84Dl4G2MLqC2JNf9zXx/Cp9SfkjifFYdIUfyoWgc2Fc8G/t9r06T2lYfSScJ6rN0qyjwyYTP0lu9+s6yL4YKk+tdhKrz+52Zh3V+kLg2Zc7n7naD4xIZOqLtObC1+c2pWbRTcggg2Xl8UizftbSHY/tPrWc9/lewe+FvMG9GZAKrKqhoqlCOfA+zVAWWjnEDCitbAFmoZhOh+vle55+8L35vMzaqILlOooI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I8+6DhYLBFRa5WkOtZP1ZZeCBM2tuy+UmRI7QvtgnGQcGdlYQipgnMFeQJr1?=
 =?us-ascii?Q?WPohCD8FXEUl/tCY1uz0vR14E6hS4PYlR68nwCuxlbDf29z0MTw6wq4mx0Z0?=
 =?us-ascii?Q?gj9OLK0tEuX9UP38IflfBO+DDqpmot8P2vW0k9VwyJ4miSl3w36wo4UEwLgw?=
 =?us-ascii?Q?yI61Om1s0WrJZ2q+qfuR3bPl0Zrk6V+0WhXAem/9jtkglhnHHUpCd9RXFHPi?=
 =?us-ascii?Q?CFojMOsrybG9yIWdl/XDdV4rKMM6vBrHoCP8e1H43NRO9WxWk4SwJuMm5eDs?=
 =?us-ascii?Q?iKOPz0JqTCmToftvq2DS5iu6lw5uQosxjUSjrrXLKq2av9KiQ/ZkX1PVfLvA?=
 =?us-ascii?Q?W2Nhcc0kSkBGOsN9Gvi4tghLfybJjJEpQhLr1fzYYsqHr2mBlSZhg8J4/0+R?=
 =?us-ascii?Q?bAhin/Cu9CyLe0LlGzUKYvZg1oNyA5dRxnFpCWJQLWcOJlBr40sxc9NO3duV?=
 =?us-ascii?Q?DjkwsAkpkGPlQ7xO+ahhrv/JqvlzsQxTfaXepoqcj8tcHadSY5rmVA9FOFJT?=
 =?us-ascii?Q?xBGvYSj9m0+mvoHkQCYxPuKkyU83AEcWufNoXyCh5xOktuhGi6kBSvwPwbpo?=
 =?us-ascii?Q?xq2LKMVh2G7IYrovtHQ2XlacpJiE+AfwX21FcO9k1zxp9dx0pI/O2EdVocVt?=
 =?us-ascii?Q?w6PyvWBt7oBiMFf/PDO3m+Ms7wldeHnn+FZkh4P/Wch/ov5GZ3s+Vs1894eh?=
 =?us-ascii?Q?hIrmroCrll6pO8kDj6slRoMPfG0zZf8BfsNFjDohStKU8J5t/pB5g1DKJ65/?=
 =?us-ascii?Q?fn/DWRTauKe2F0vZPBwg//wJoVbh936YUColZlFNDRP86nmUOvMaKa6lQt1f?=
 =?us-ascii?Q?FtDnxSvbkzakgZ/yzxgwPrD9cvqBXMSow6eqt2RYWsWrRhxRh3mOjm7OFmMi?=
 =?us-ascii?Q?aTI+9Q9tBSCoyNkS5/w2XYNbqBaSiZ6pqyb7zSwxSPqm08FwZ7+prheu+mZQ?=
 =?us-ascii?Q?OMCVUSLncQ3zOf7RBnYthL7xILBNXRYHJvooP3tBvrNULEfb0/ZqHR/kzn9d?=
 =?us-ascii?Q?y6Ex02klXYkJ/QYQwC6wSGWF8Nr8I6kpzrZH1CYv3NngxM3MYChrn9Qj3GvW?=
 =?us-ascii?Q?nQqOlpaTmpCv8+mUh3p77BcaEmQI6/pMFxFMhrRasOY4Ci0Pl5f45gSobVJ/?=
 =?us-ascii?Q?PnQWW2DCbmbFyEP+3KWQMXoPJS5tWKAFc1pkMDSzzKiV46L4OrwZiUiVkmqi?=
 =?us-ascii?Q?VBwxNZAgquv4hmaPulpJ20nAFOcgl8k0RAmFBCgu2mWWjeU3LTR625Hi46XZ?=
 =?us-ascii?Q?X1sHkChp4fpDpmPvpkp3eQs8wVaEtvwwf5GCxaP3ezlq98cNHoajXC7QLkI4?=
 =?us-ascii?Q?E41QxTZbNB9tQIgCA7PNnFNBkJoW4ykFar7ueO3lN+5ys73T4WLJvaeXInV4?=
 =?us-ascii?Q?x4KzdI6rvWHS0bFJpljchnTNMY9tvZycwbyX+OqRuGFUb14soWKIeSE5pi1K?=
 =?us-ascii?Q?LcN6n+ZTUyD3Trl/BX9J6HlxLUDem4nKViABIKiyXt+jcNMK2N4+UvtmfOu+?=
 =?us-ascii?Q?IfREEGSMJD5pxw+Ipdg2nm5S3Ep3rB4tTQJutVYNKnBKhCj8zuHyV/bCqQUk?=
 =?us-ascii?Q?u8KwnYDWN1Ze5U5uQI6eipVBBPNCnAP+q8hIjQuUVeumiY0gRpFogKJauPVP?=
 =?us-ascii?Q?M4+y8vPcJuH1yfBU961Sta7aoMeZ4LgoitHqy0VA/MzlLhf906kqhEALKShg?=
 =?us-ascii?Q?4g/SqKg9k1XP+N1bQ4iQZ+MRRDkCB4Fp3zrGGCZrSikUbFM3cnWSYxWj32K3?=
 =?us-ascii?Q?RaeTcNBXO6ZewjXpj2CYkLrcOrpe1ss=3D?=
X-Exchange-RoutingPolicyChecked: 
	WOTgRR+cL5lYYEEUER1PoGe8lTk5WS819JuGnWKuCJCvKJBc5ejIiQvr2pkH40SIAwkFN4sQbk3hd/9ZDMJEDS/5HNGgKgZ7hTPxK7h4Jvh7xOP9lde6exeADXqryPDLeZGEkRexYpmx024KkNlkrfofdh55g6QyJodXz31jqnC1jg90Es6+W0VFrUeoJU1xbl0/oLBRkcri7hHyDHyouqS7EdZVnG0Z/yvI7B7wB73xBzrWvWLqW447Jh061vWvNF5te0Fy4Pr7UN9AOJJWbf8xRzPlKODP+vBFo2ARMkct/sb1vQIzNl94b12iSj3yS9Tug6fknkmdbSbTMfzXew==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86543d15-86b9-4db1-7415-08df1d505019
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:04:48.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nz+jpZWmMxq63a7E9nxZmruvcvZpMv/Ofu1OXDh6THn4bsBr6OmmAq9oXnCqtQ3IawpVqtgNtIGOAsEz7tLL1IaelXmlyhVeUfm69/c10Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfXy40T02PnXHxg
 +V1WCDFLdM9BjLChiKsSjLhm5S9Ijl0vTSlWjP8RsF9nPPfl3sj+y6Td316daQuz1+cm7sTNW2P
 Pz1BQh3Av7yqRWkSbmnFL5D4mK2c362DnYNBvgdmaP8G6IGfDQnJ
X-Proofpoint-ORIG-GUID: e46Bfo5926aB8ZGp3cxv9t5k9xRTTk8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfXzgYMuBpxYyNi
 UQMlKk7MLuQYkg2CZw0tiPpvfqmd71H4isTseIcAK/tq/F4YHTYROzdnrVCT4QEVAPc4HhwtsX6
 CfGsH3jm/kSR1b1C0eXMlBmtl7fhm5sRe4wzGo83vdL/A9rrXwv8+Vx7P/YhUx0t3JUHLT4mYov
 i02A0mQZkec4pRbx95vI2Vm1vF1nQqbJbREJdmZNQgZ/2ErjmXs7CG8I6IrCQXAHXnC562Fbo2S
 OQCd7HcRJM/md+RAhXOgv8BUxUIZUAasGrJ9sXLPa3FAR5L5v4XeTRSna7jYKzuLwIHncn1BkPO
 sD0zTMyf2AqozPWG1qUFdQca2Hibo8YYyFJGg7+i6q0Ir2jg6iazv+3coyDjszL6QvstHG42q88
 T9VwB2AlIdKIr4dkKoXhM0uA1qeTHaAdan4yBaLfFA2GmSzKoz9uUduP2q1xYg11I45mH5tLuT+
 IyRK+M3ue0hsPKZFmhA==
X-Proofpoint-GUID: e46Bfo5926aB8ZGp3cxv9t5k9xRTTk8I
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6aba49d4 cx=c_pps
 a=FfGi2H57Qjid8cR7gtztuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=IpJZQVW2AAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=weNUJIpGn5pap1sctJIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246751

From: Harish Sadineni <Harish.Sadineni@windriver.com>

QEMU RISC-V can hang at boot when using fw_jump.elf as the BIOS if
the kernel Image is large enough to overlap the memory region where
the FDT (device tree blob) is loaded. This was observed with
KERNEL_DEBUG-enabled 6.18 kernel builds, which inflate the Image
size (e.g. ~27M -> ~33M on qemuriscv64), but the underlying issue is
not specific to KERNEL_DEBUG or to any one kernel version, it is a
property of fw_jump.elf's fixed compile-time boot address layout
which does not adapt to a larger next-stage image.

This was confirmed by dumping guest memory from the QEMU monitor at
the kernel load address and finding the FDT magic number
(0xd00dfeed, see scripts/dtc/libfdt/fdt.h) sitting where kernel code
should be, i.e. the DTB and Image had started to overlap [1].

fw_dynamic.elf instead receives next-stage boot information at
runtime from the prior boot stage rather than assuming a fixed
address, avoiding this overlap.

[1] https://lists.openembedded.org/g/openembedded-core/message/246090

[YOCTO #16409]

Suggested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51b72fb2e8917a8627023f419b27a1d83132a361)
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a..d8522fd552 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -29,7 +29,10 @@ QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_CPU:riscv64 ?= "-cpu rva23s64,pmp=true"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_BIOS = "fw_jump.elf"
+# fw_jump.elf's memory layout can be overrun by a sufficiently large kernel Image,
+# causing it to overlap the FDT load address and hang QEMU at boot (see [YOCTO #16409]),
+# so use fw_dynamic.elf in that case instead, which avoids the overlap.
+QB_DEFAULT_BIOS = "fw_dynamic.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-- 
2.53.0


