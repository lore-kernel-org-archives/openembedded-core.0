Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2915F99343
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:25:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14353.1776929148777928421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8573dc5874=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2CXds1722714
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 00:25:48 -0700
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8sr0a2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 00:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrSHJC5C/fxUU52wHnqwKZZ7zbL0oMvb309Ooc0n46HHZtykgZWD+FzKDd6JArtUgGxgRVYzT8E1VOS61BSyfyS3e9HTJvEU+sYHypB0FyCm3dYlsIHCyFYb6g+dgoLj3nlxzfDMU35ebcMWotGV2I3jPK/gkJkNZIiU/E57HpLYqbaZ9DocevGdCndPXzBDyZ1Xeot3gppEtOkIBvPgk5s71tV+TNxELNY88d82Y04ma6bVt7b4y3z4F3b6qDrzRXshoYlMUOWcZ+33i6CZstzQqRlGM6FAimI5406BCllriYWbu/60oRIa+ZBicKKp0nVG0qXbaUxlzjBNr+4TZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vEXEPB2NFbXq3WdSSbQVDv1YP+jxSbe78EQxOfK6GU=;
 b=MyR68nhUvB5+oiEX75H4Afc6zq1Sv335fLSxFN/9NTVRA9ouum5onp632JRBvK86LZEby/ACpwvaSvXpD3G6xnMT9wodqEYN9tLSu3bJVvBqDKFH3ob7gBRLYeyhPSQz1jzTvO5obLB18k0Dg7TbBb1pDW46soa3+KNA4YBIrymBvcIgFj1di+if5nar4PsWgubwCIIfdwv4otKyQyshIF6n1jy4WqrPBG+V8RrXyfRtL2n1V6L7/IQUAJe71JijkdOoGcO2N0nJUb+AoLnjhltT34hxYSQk2Ak9J0/2yiO0gkeGoIu7FX13gMIc6c5hIS6qUbHuZqDKYuy0KyYBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by PH0PR11MB5783.namprd11.prod.outlook.com
 (2603:10b6:510:128::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 07:25:43 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Thu, 23 Apr 2026
 07:25:43 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][scarthgap][PATCH] grub: update search parameter
Date: Thu, 23 Apr 2026 15:25:31 +0800
Message-Id: <20260423072531.2122498-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0227.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::19) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f52ef5-a322-40a6-dc6a-08dea1098792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	kBebUVoNCGO4+PzDJk57lK+n7fB/sWYMiXl69SmjpQ4m3FBEawwDypJScxBj6CxyIpuiLLkgmvLta+M3cMeWRdtyCT27LNlpAnXubeM+UfN3Xmcj1Xmw1BsOs9m3/Vy9NfOr9WbE3FLH5ZVcD0qZ9jHTwUVbiXcc9nFLt5oqTRLMMF06IHDhSC45dUMo7brGeEtBiNqQ2+rM7xToXeN9ZIVXn//qptGMgFzWwMHgvj+37AC8YlsN87FBlB7J/jo3QU5brNZJKdGC02ga5Aupj79L/o8afhl310zmyVqmgbIF0fDJpT8XesNQfVKxvkvEOBRWYn0EsZ1qX4nJ/TAOjVEX3n3b2qWSLbhYMQ+PjIGiWyrSzRaAvDMxJtcI0SqDn0CNhjVzhmbZRqMnDe1+qwguew6ztKbHKMo0pk2xdzQOaLgEaHUJvEH1Jmmu2AhKgnqSV9nVFeEERPrpM1/6ZMZ14ZctkkkuHvNG46auwQfAVTTego2Bb98KZe20rjJgYEMMBce53B1JiAHI5K4DRvhLAct5byz0moRxG/fFMjQKV5icSzy9HvW/Tfjcdrf9zcLKI/nWqapbY5EtijlsqSLi6OqMUySA08Kn6Qzp2AZDDvjpkluz1WURlPkUVIQdESpkRJqi6OB1aaWqcwkLwRTGicXuqerUeSqsyvSPcAfAGF/NaX0UGKZs6l56p4Knp2cr9nlHd0B3OocNBgv8M1SW1htMIP3pKcoLpAnhg6vbE+h0dI3B4Rkm6QBcA1depwUJxcpGEzs+j1fxNs8r1RNdU4ziORCI+YLq0gQcUSk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nlx6+SOwBmaQeE1p0nkJMd057bT8aU74L7KyKmLbHmtdW2RaipzoTc9LHaQ9?=
 =?us-ascii?Q?BOSEzrYgJ85iWFyUx/SsAM0a3xqysN5P6UMX0PdF+J0pM78lsqQiQ+ouMJVI?=
 =?us-ascii?Q?zInDiNRBdnngSh8BkVkn/xN1xgDYOcoSqBrCSxQMsDHAwoAd8wL+4FVMQZ6G?=
 =?us-ascii?Q?7can9l6rU/JPtam86LyCKiLE0J5o3s1eGkx3YoMzIwiQY++mACn5mb5bfNmH?=
 =?us-ascii?Q?htqKi+xObEOTLCy2mb/jpw3V9vYBFrB3s0iRGCtGY/7pYRkH/JbjlZ3nYmQb?=
 =?us-ascii?Q?C5hcxF+QJNI2gLeVuzCkecKH9bQYtxvzr9r917q1obk/UfPuWwEzmmDbGIFj?=
 =?us-ascii?Q?yG5P5k5obssEVIyqFSDUXUT1vfAhpweF+FKPyBg7/JZpfijft0ux0FVlNQQV?=
 =?us-ascii?Q?sNRBwOiyyDVYtVLO/Y3Lrs1o/AiLjVN7HM//tGWDczuKpny/lpfQzfWFTiNJ?=
 =?us-ascii?Q?kUspidk7rH0lY/ls/VMIWOb8scRzadpM9MEEx0Ah2Na5/mut8fEuLMHy97Ue?=
 =?us-ascii?Q?P7YYay8RMlib1dgieGnA4w09SkF0nSQ91rZdhxUBlJjSwLxuuLhXhFEk5kfD?=
 =?us-ascii?Q?Y8s6pPRI/Nl520Y0/w3TrPHNidzQKwtHfNw4usW1nrLxMMUuQYsXKWgP67pZ?=
 =?us-ascii?Q?A61upIaq5Pc7eZPoCBDPGl0wqZifTzGN1Enk9Q1iIA71sjfg9xtNRzaSIWGu?=
 =?us-ascii?Q?8841kzRYUnPYPd1BAvln8n94k4t8/uraTUlpUsJB/j9TTg9Tqbdsx2xcIXlv?=
 =?us-ascii?Q?TSogVBt1Uh/Rci6mHehCMYItnsazok6HO9YzqiohT4QpRwN4KFmez/6mllpd?=
 =?us-ascii?Q?an02QvONnPCZUlXmsdcB0Z9zFCxku/4dLia15yGlNUWdCVVUu0mjytQz37sH?=
 =?us-ascii?Q?yCsDqmIQ4FyQKHUxNCcKzIM+l7CYcKIHPleeljWDTIMMk0nsErgbl7vZBfCw?=
 =?us-ascii?Q?z6zsu0uiptzFaNHTmY3giclT89qogbybeGfQNxS5eI0ImDwrnEVICmSkVUA2?=
 =?us-ascii?Q?3S5Pz8iUPnSxYXpoJ+nIaHSnO2oWkkKJuJscdnQ16o3kZ301R+ne7bCgT8xW?=
 =?us-ascii?Q?u3AIUAXhJqTyQQsu+uaQsB6dqWNjl6AqA1pZs3d6HFwBt3tp0iu4b2U5Jstq?=
 =?us-ascii?Q?veyXU1w7SRV25GmSQv0BJpbaCabGMn0XQFY8031N/kC4eLpNFCv8UNRef3U8?=
 =?us-ascii?Q?DNj6Sk3hPG5I1BJLwrZTbSasj4fpao/cN3831bYrHAbYv80+MQCKLR2iCWW1?=
 =?us-ascii?Q?9VokzLC5yVfANPzuM5poMgCqK3l+SKNRoa0s7D3j6PRk4bhEI3jScHgJd6B2?=
 =?us-ascii?Q?ltmV0aJTXGHlGiEFSR0+j9l3Sob3WZF/yBZPHFnA34K1Ubun5eJlaL1ANOqp?=
 =?us-ascii?Q?u8qDjFnQwMUHMdw6qeKJ7AC+S0dJnrll4oUR0stITdVARDfOu+nyQGjUlbgt?=
 =?us-ascii?Q?a3LN7+W5IYJLIF1lqanS7yLX1a+oX63TNKgYPAm1bI7QbPlYOkZkf0lmHZ+a?=
 =?us-ascii?Q?HJCuT6Q1WYeluD9KMixLb7jZ+IKIEjUcTz/zx8ZpC2USekvNM00+AlTODy9O?=
 =?us-ascii?Q?qV4xQDZ4uE8b+2tjoJ5QNKE44MF5Q54AlFHLDSVT18zWPzxXYwQtViNyJPKe?=
 =?us-ascii?Q?6qMJO9po+Y7wt2cntrYAVOjdBOXoT72NWxUXAGJvxGw5SRZixieHFoNeTahA?=
 =?us-ascii?Q?PjsX7TK/IeFcNdcpLlqm+Wmrt/MB5E5PcAiWKQoBVmKfKjMr6Uz72sUSztI1?=
 =?us-ascii?Q?gDf/AYik5IE16AyVm2FJFkZ+e+7YSuc=3D?=
X-Exchange-RoutingPolicyChecked: 
	Rf9OU7iHZd3JqoI1pH+Kpjgj6nDwOQFzmq2P/uerIbjZ3kEyIQvUSccGwUBr4M/IX7fKqVI38w/Pzfrt4o2fYWJ0rDA6GP4Nfkrexiq5ZjifFAnhfhZW2wY9P17lsXy0zpwCRIzvxBU22pRwtCMAEZ92AoFQea6jpxdBIcvs+Fb2yHjFNWh3YmLBl7gPelIuKSW1ksx86yr49BCUAGiavMLkNj5wHQerHR0dh8Mu5K7jdAJYrYOdY7Rljz9xH89tILHqFchkHQEtJhpJFea7fKsWj1vFSk3kAlLFi6x2vn62XGNCNm8S2mBBWtUoy/EHFyj/YAhEjSfUDNT4mByasw==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f52ef5-a322-40a6-dc6a-08dea1098792
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:25:43.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ0jcIIM94KPPaO6JNJG5IggmczFlZ+w1sKE1U9+MgTNVatD0nWU8uaFcl0SAObFuNE07Kd7ZzcjqCJoYbUKiNC9/fib6AqMRmlLpk5onbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2NiBTYWx0ZWRfX0Y0L/ujDohd5
 cdEC+e+Jalkcn7lCED182ZleqOmVRSKrhOFBqBz7UJiQwlPw0m48PEC/n00Jp+ckYGqXJKX+Bnj
 CWF501qw2SOAlqyDzz1eTrHMlC6zR8GmtmihpHscjBlUOdZwB8fyqQ27dlXR0V+aZ7Jsuc0gsH7
 mK68wu/EdXKI2KXiQ80HqBOgfROcKHyao8Olqt1Gbnm4L6WXvmtZLtAagoSGe9KKsfuCRfe3hSb
 4JKC1ZPRoJDUKM7BzSQC6KoG8ydj+ogq2G8T8zDO0/0Jy7cdXM4c7HjkI6fhDNdIJroDb+BB6UB
 fXXyNC7vT1EyNjFrAATq0ePn4vGxf5r7aPz/spRHPwlDPJLWxCGH9pkcw5pgyRyEav0ci4hiARe
 tKxOnJ5Dz1yIxqHdBf6/vb+UUyB9LyuAj6IwdgNZcHSCFfxnJmlNnqcAJbxMNDKrMXcbHsSR/i+
 Fr94wg4YujGpweci73w==
X-Proofpoint-GUID: EGHMqCDL239FCX9JLoiMj9Yh9jSTHe6a
X-Authority-Analysis: v=2.4 cv=PfPPQChd c=1 sm=1 tr=0 ts=69e9c97b cx=c_pps
 a=IxQEmK7OG+ZB3KQxmUR4Jg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=bP8yuihqUULSQ3ZdrO8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: E5BWXaiTB-4Cm6GNQ3ekSW5YjmZwFsM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235746

From: Xiangyu Chen <xiangyu.chen@windriver.com>

[ Upstream commit 42b530581f7246b3143ee50e3c6f981dcbb1dc74 ]

Grub would report an error message in boot stage as below:

   "error: no such device: ((hd0,gpt1)/EFI/BOOT)/EFI/BOOT/grub.cfg"

Consequently, the root variable is not set, and the intended protection
against cross-device configuration loading (the purpose of the original 2014 commit)
is lost.

The most robust fix is to use the --hint parameter.
This separates the search target from the device hint, avoiding
fragile string concatenation and supporting both prefixed and
non-prefixed $cmdpath formats.

Fixes: 5ce73b6055ac ("grub: add cmdpath to grub configuration file")
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-bsp/grub/files/cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
index 8ca53d24d7..8fe1a8d0c7 100644
--- a/meta/recipes-bsp/grub/files/cfg
+++ b/meta/recipes-bsp/grub/files/cfg
@@ -1,2 +1,2 @@
-search.file ($cmdpath)/EFI/BOOT/grub.cfg root
+search --file --set=root --hint-efi=$cmdpath /EFI/BOOT/grub.cfg
 set prefix=($root)/EFI/BOOT
-- 
2.34.1


