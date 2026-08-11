Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1290FC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:57:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51939.1786445820351870658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g1a8SYZD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26837d46ec=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAO4ar114110
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kvII8+az2
	rO+gqDco+Zq3S7jlya9eAtGD0DM5Fe+aOw=; b=g1a8SYZDsAeBcCuPVxvwW129j
	zo3SY25PiPy0G7KWHNgf3axzdLE38CtNs+mvDKGbZS78PquZBs+KjI7Z10+mEY8X
	REg1fUJWmmr9w5o/bsokH26MtNk/r+TPE9p0pTlvCp7v27ZhsfzSCcFprzjUvPAa
	VS1ZL89RlAqI/z9ahdg4FKuCoNeRzEMz2uL+r87mssNzMnaANywDo0t9wRMmyDPr
	hU1GAy7h1iZTJOQY1KKhnQBUt5t9bDIFyvNnFdS1LT3uXp++xw6ptUoSXXdwcUYl
	LvBlfBFUg/L7mhLFcW9uheKgvE1NY6tEwh1KKlvi3QjCEl2tEnMg8denjfR2g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022078.outbound.protection.outlook.com [52.101.53.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwrhwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 10:56:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deFFJMeGU/VhAABs1uxXBxl2p32S02aCpD7tR3z70BLHBR44XqGbn+ZLluFfBwH1YR8BoXbk1KXNLQBgUAENufQMRtJzss5xT3/vFtIbI4MYnOO8FCdUcsqt7wOZRUTXGKPDoJEne7iTvw37+oykDLytRSv60Hzh3J448PA0jzn/zjTkUf6tOL8NCU19LJhaoq5SG6wLHRp8x8EcfTJweFmoJNQH37jYDYznme6gQ5ATsiyT/HWN2hNYuOZHLFyul+UCJywUHT8rSFGF0KOi4HKR7kyjih2B8nc5jLDVgx3vvkz1v2I2c2KCfo0XJ0efvD+69lnbFpnW1sTYMjE1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvII8+az2rO+gqDco+Zq3S7jlya9eAtGD0DM5Fe+aOw=;
 b=xzb94SQj2XnSRsx1bON4Xpwa1YY0lu+hzRTPnCkzIUS/lLseY/rzUvjFt/wFzhnr760BNK2m9l3D00KK/H1XpoarXKyNJS616DJ0ZI6U1aF6HhptNYFnFr7DrapRVizeX+GH86hL12iMxY8uu1kaqR98+tQwB7T401QWmVFL48wEofmj6sgOshCZ8DwLbK9BuchUsqJjKGKIZyvtUkN4PgDD1OkhXUAoiRf79wJflKiG4et5V9lJ4sVkJ6iKzEXsvkcQny0auRD+r3YVqvIozIz8mancncw1PqwxhFjJ2fGkD8Y4laXIrNvyno4RSnhxuiluxDqLn13OgSQXmZ6Bww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:56:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:56:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] u-boot: add support for Clang toolchain
Date: Tue, 11 Aug 2026 03:56:03 -0700
Message-ID: <20260811105603.3447122-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 02012306-e9ba-401c-3ca3-08def797425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|56012099006|11063799006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	CQPQz9t6aAYqb5MJ1rSt4TIj/g/d8D5/mRGRB+Y5woM59Z00cfm575p/pHe5kHWgHGA73N15O/3MiWgNbntBj/2bpdIWFI5X1DGDkkgVxVVic+kLW0sjv9PZKvIzA8KHgU/BeneMKUUiq3R4Ih+cm10Al6oSYUBTVXFg+6ViEPDy02HygPzOOuAdp4doET3P0AEcBt283g1Ic2w7X9O76DHqO0CHwvuh2PW3gmMv6/mUvWMqFtAU+ZqYYIbRCppG4g62rBPDrlZxbMjKjCmks/reuvYVrlnJGXb9dVZ0aAmIKu+yuOofaGEEuURnpwH7MJ31tqXqLKQpxNOO8VX8ayygNak+7Mg3La8gXriY+ey3EXTz4q7X/TjicdU3uCpKELQC27ZkTimsGtA0umL3SomfDvP4VMekVvh9RIKtStewj9thW9i9FM31R3+/FTZJaNBzF0zf3W6OptBZPd/cepy7YR1MBEtvUcoF0fekkHO1aJSND9OwVgP+8N3S0jSZezN7vqHpMRRBwmtJMaYLt66SuW6tizq5+Wf1WBObwP2D1eWyOjkXTeguBNXARK4tDJTMcowJ2wfIGj02mbkyuCmrDvVYzzzfiKVnpAu3ixB186RS+vEnrqmO0Vz+kIfWuPlfogbhWZclZN3i/mNz7O4rorQ6HqERYf4vJo9FyUc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7414mKusvfwOOIRPSvdi1Xg30hXSmw+bQQdY61nDyvUuPaJgYOFz6Aq832aA?=
 =?us-ascii?Q?H+W8xx5CD8+C+eJL6ZCM9L4ImGW3WEYNS4zdcN/hApWhwB28Jl6Jgd1hml65?=
 =?us-ascii?Q?XLRrbTHswjFUYVJcXyiT6nnueyZhgBggmgwts9ZG/yiZl+XQpZOz6BOQ7sE3?=
 =?us-ascii?Q?frX2GscmhOQwJCPTKkjlm1H0PWTtX+9vEUBZnnaxm4eCZ9LP/3mE7wld8J71?=
 =?us-ascii?Q?eeHHArA2dgAa4dZOpYDgWWmA7seddh2eaj+ZKRjuKD3K2cPMC4oJkqhyrsTU?=
 =?us-ascii?Q?qNA8r98paUHYHPTOcdClFI6bwUfyZdayhmGUkGnxGmy9VKd3TW08nT+Kd8SM?=
 =?us-ascii?Q?J5h8BTnNv+6Nbtmk8xsDU8/TGhCw1OrJpm8rp7NWr51GbOdYW1og68HmGpy1?=
 =?us-ascii?Q?e2Kd5D7XuCmf6Stq2aV+DmDnIzbIH7kIuSwXV1ntgsFwxzyUzxsTVo3VFmtj?=
 =?us-ascii?Q?I7m/64z3R85JRGF8Ir7AZBCbkpSV7qwb9EZZATyBbSK3qYetBQiyRyp91IYH?=
 =?us-ascii?Q?3ES1UBOyYvW7Gj+A6iezkI5Hm8tF8vJ+8af0JErdX0vbtOuOXivZFMSzeE9g?=
 =?us-ascii?Q?ECNAFcToOLtfLIR8wt5jcXfwgTeVvntBs2Fkp6OQafX8Q6baCi8Si5eXB78a?=
 =?us-ascii?Q?dmHi5+RJTA26GBIBPFlXasVosNotDIr2OMy7PZKOCTzKIXBjOOPFN2F7G+ru?=
 =?us-ascii?Q?sZ3q8rZxbBfn31PoW90Rt1z9KnBVrQ4XnmE39eqwrt+rQUh2XvukszaDPVc8?=
 =?us-ascii?Q?4I7/BBx/Mo+vMRSxfPVECpADSlwZ2upF7Srg397UAQduArCaSZdqeEH+VI3H?=
 =?us-ascii?Q?Wvga80Dxpc7wj/Xk2AdqTPblV0c0Iy7vuFUPfpT4lLra3+mzZIbF46sQQZoK?=
 =?us-ascii?Q?cO/E2NNs5KZl5LmA6fQsIjvAyU2Sc6knXt0xSTrbTbWYHMxJmvSiIMoi1+e1?=
 =?us-ascii?Q?I74G6+7VPhYlhBqduLwV9Mc9NPPidZSxZNoe8tUIvbY5QpooBNIBFKK31Wmi?=
 =?us-ascii?Q?+MjaPhoAmFGpB2MDLVX9NugoDsENq5CogekXk14zXGcHumA9NME6rUt8qG2G?=
 =?us-ascii?Q?z1M4MIHqCg719KDUExmvIQaqsn0idU0gs0I4qFbAGd+Lt+91u3MwBOw5mp+m?=
 =?us-ascii?Q?KXNqUIPb6K55oLDD9oQGaeRmnBiKgU8IQbvX3CBbKByssaPIYNdTupW1QuX5?=
 =?us-ascii?Q?9T5UcANPSuIQvT8K61gRQp9vuPuKtw8Ogn/yvZjRzD1+sqCrcZdYioSz5x1Z?=
 =?us-ascii?Q?rV8eodaBMmiceTqIc+mbeNjJOvLwhLIv6Kx4XuF4o9meY/nOvj+tUgLqeseT?=
 =?us-ascii?Q?ixlfGYPne4+b6snO5ao6t2Xkj+wMGMBeNUuced3bwb4h1LJ0BRkjhqn8ofo4?=
 =?us-ascii?Q?Fmow2kt1M/Wh9WgSPKqH8yiV76JMAFymZBZWxjWdx+cGqxs+39W5O92qc8VE?=
 =?us-ascii?Q?SLd3XKEhuvAwDLY8fcv/Quj7HVavtNp1gKyLOIuxO/gRp0TnhD9Fdj8wJ7Dd?=
 =?us-ascii?Q?uIuxNCVNYv/c58i+58/01WGFCEew/Z/jpaA7gZuaabvhPPQXY4T65UDq14K9?=
 =?us-ascii?Q?KAnIGFHogjWG/GM1aiagJ5jd9pv+L8YrIS1mfTmGF7g6Jvp/F7mXMs/nCfVV?=
 =?us-ascii?Q?GxpNtMzgsOfueMIKUQQGmU+xWIhh8itOi+gxpEY7fXRRsvTMPyK+gNq1zPq4?=
 =?us-ascii?Q?+s4lQ1ycnnJIU1gOC5bc8dSq4s9WemHaEOPrAEk+Es3VpbBkiuObziQXWVCK?=
 =?us-ascii?Q?2dgOzvF6jW/PjLvBs1dZ+diYBhEhXsQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	QyntZt66A7TmeiPtg1h0aG5n1CYB/Y3MEuyRVIMjnZ8alXsVWcUoruWOuu/ddaBgphQGfIfA5YSCCJnv5gsK7K/2uUnRvx9h3VqKF+5XAd7gqSC+KG3HXlpgawjYj5Pr2GgIl3rBbDKxtN4InNe1kbo4cYQLDOSWHw7f63F3PhzClWltUn3yIaxDahCuDDTNHJfXsrHOibTutsAu1H9F9kT1ylhI3GnKvyEreCuXXxsk0gAR/7S5xvOyl941M3N8QkbwaAaDeFS3HMNfqFjY+PaFDwFlkDcVb4gJlQOJU282H9qaskWp3BErCJlMgEh+55d59NvBQY6fOkuib+d8VQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02012306-e9ba-401c-3ca3-08def797425d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:56:55.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 300gQaUCAAcT8lCO/5rjq8fZB7bSvjV3KsIkKhet4GQ02vQqmDkIK3nKgDqAKmnPlhBWmVJvSol+beGJ2VElkVj4xBzF+U5jqnuGvGcZQWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7afffb cx=c_pps
 a=exbubrTJ8Zn0/ec8zVjoOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=1VxDqnHFAAAA:8
 a=t7CeM3EgAAAA:8 a=oy9P7YDnrVfcFnozSnsA:9 a=aZ5uHUMKh6B-zo3GvD48:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX0FSlQJ6sXGCU
 cdVtf3jfdmyD8VdgZfCmaAoBF7YbVzchNE+2XxZBV6Xt1h+yeOWwwE8FxL3rt8YYW8IqTDGPYP1
 R5K25wWGM/eNgxfygTwkF6UPGvy1tu92zjIR4Ct6mZmvy3CSdlEX
X-Proofpoint-GUID: hzJpbsU4J0ZX5N_z6BpD9qJUnN-8sKko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfXx7z7Pida+F+8
 Zi+LUvCUeMrlAaP0mB8739bDLspgFQm0mQOmDiSmC2k/HL433Q5QxOcK9itTxPpgAzc0vvU0ea2
 THs3/C2w9PN5+w6pgjmDaqnI5XhMY3gc+y1JoN3g+pxkd/rlJtmySh1NB9D6TTOANgS2YLT/zcc
 Z3T6s0vmHVgVNbP5bEnTE01RtZ2fa/ppADFd5qVLsqjmlNobv+kgrTx/bpEpgUB1DnnBh8fCfz3
 1SdjdxLXxGX+HgizsprvP9lnBI5P9UKdVYl9A+h9JCFRfUAurNoUx0PFKB544Qzcmkc/nafj5Ge
 4saowi8J3gDY431sREiwoaSlawlC8Da8qRIH9InRiJWXs7z8PduhC0/Xye4JP4vAPPWv0wgLdhF
 KvnKq909jiRapQZhEE3vQvc+x5S/NjaXGCUGTZKMGfG7ndXrUveghQo2kFNEDaX3OZ3grRX522g
 w1HCQL+IW7XrrBg4OQw==
X-Proofpoint-ORIG-GUID: -aevVSAr8OtkUVxV6YbwG7Yhuu-V7AOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243186

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fix build issues that occur when the Clang toolchain is selected.

Remove the hard-coded TOOLCHAIN = "gcc" behavior and make the target compiler
selection conditional on TOOLCHAIN. This preserves GCC as the default compiler
while allowing Clang to be selected when TOOLCHAIN = "clang".

YOCTO [#16385]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 00a12f1bb9..2197039dbc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,10 +3,6 @@ PROVIDES = "virtual/bootloader"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# u-boot is best built with gcc
-# https://docs.u-boot-project.org/en/latest/build/clang.html
-TOOLCHAIN = "gcc"
-
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 DEPENDS += "${@ 'u-boot-mkenvimage-native' if bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
 
@@ -15,7 +11,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native
 DEPENDS += "swig-native"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} V=1'
-EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'
+EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}${@bb.utils.contains('TOOLCHAIN', 'clang', 'clang', 'gcc', d)} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
-- 
2.51.0


