Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D29CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:19:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14726.1781770780089276486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HkMPDvrg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0629aa11fa=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FOg03904280
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:19:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=M1RDYI7bD
	0C644xJfM6NEvzXZbJFrpEnThoxTpvE5TE=; b=HkMPDvrg6aCNjDOWCoUW1oInI
	TOHU/nmChQV8QXnki4i1SXpw9i+tocF8rxPFd0tBvgxQ0D+GZipoQ5SbgITsCWKf
	VzwkBRa5/aLPxqCNhOUDtbqs5iMyy5+bpC1MfGtSxFWASBzmgXcdNpmuwQXQXLfA
	sObAO7g3oxo4XjpOQfrF/TpY8hzNNjjJezE/BNa+99cdk/3BrsNKChhH5P6OiJ+h
	aQXR+L+wRRKoOv+oH3C69vT3Cgf4qtU+NodUgchnzJuYHEIH+cvgB5gBqB//edZx
	T59a/7SpJ+rBtMFe7qztBhqoOp6GbHp0h76gNxfu9GAGaxAxWh3CLKnzPbKtw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefbtc0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj77qXdYXVtpYyk0IEOQ3UJ03j3EOz026C2I7V9uyXfW8+oswflALxrT5hx1gWrje6QFqTD9fPXN1VnXXrBQYdIKxE1YKnD5nO/Ufg30OjHAMglV0Lya43Gc0Qfb7jVISXJZK4sN7ahK1wFQZOhPGZ3JLVU0BnNPtCkvOr7In4UTnIChgfbqeqRmzbY7xwgLOkRmHVX8R6vwBLqIvDhgvE087mQwGqzFQVtRADC4242ds/fpNVibuQ9nHyzt/3krpJuStZsFrlYEEI+fk3rg7aVdCCFm+Sw5H7XpjI42ljPwH+8W/q8BWr9C4aJFKr1BPoNxRnD3eqJlKYH/sDCpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1RDYI7bD0C644xJfM6NEvzXZbJFrpEnThoxTpvE5TE=;
 b=rQJK3ixmb4zeqMGbG6DGLi/3d7nCl3SvXr8ZSWCtTJ4XinjrzXj0UlIFM2xLXEqKMYiM1mQaP3Tcam5rGB1LZS0wzritlcHbpThU6l5jCP/Q3AcjgnY0Zhyr4fKRvitAFTXhFGv8ZK3WUHn5MahivRG/mRUSazoQRmKLZyZAxoV3q9ZvKp+oUArBn1W53kwJRx5J7A6sy+UVV5gPBJjfMuBG+ZyzYAosmGKqcRdffeDK/XIJQovIbNJtMkgF6m4eGP/YxUBQmHvnaIxgYhnyCLpsatHaZvHnVD1LPVEUiz/vf8j50The3aomQPuTVPP8MDznwCSQHjwO8o/rKWyD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 08:19:36 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 08:19:36 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com,
        Sanjana.Venkatesh@windriver.com
Subject: [wrynose][PATCH] binutils: Upgrade to 2.46.1 release
Date: Thu, 18 Jun 2026 01:19:18 -0700
Message-ID: <20260618081918.1816421-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:408:f4::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c6c876-0e3b-4952-7d95-08decd125586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|38350700014|56012099006|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	+B1TZ/Pohx8d/siyKTAB065v7OG8TjJrtsS5/ZrfEJzlDfHUiMfjT7lvMcuqwqJkgUnFnqT/E9ooGTYu3tnB/IdMF9R0ZPzOBi6uNifqI6xzQ3LKBSs5sM1ObYkxhIPOoRKBrl2Ozen2SpiTl5aE6jstsbwGdKOHIE8YhVwp9cALbSv7FQuZ3VDLd/17reoezhOW9+mDfixg+/tOThQlQIkiqhnv0Ma5xf2AKPJWXzCdgrr7FTH7AFyM4yE5N0CdYHG3UaBoAyrA2INqkdZjHNhPtM40um57I72LuIm/C1LuKSgrHpI5nrUn74ZO3TEYCFahpGdzgf8bbt35euW95tKqW8g+euG4brb4YduP/4nqRjlrluarsv1Uvspm9dSnqTyahx9ZhC+81RFZM2DaKytWoSqm9NXnBI41syPbjs9ZUoI7XkqNlke4upVRsLzGoOhuh28g4FVkYy6ZEr/7v5RWO/9shcRTm0+1ovHTuOaaK1Mk+SGn9OTahgulHV6Gc5BvZfFuSd4w+ZXtYWSXTGnGVPyb243wsFOEuMR7Nn4+QKwOkEL8sjpW2iADoGqziW11AY9fN2VofxxPNSZdFr9Umoqe3RNzb9vUFnXstMwc56INghqmnhZNzAadoRk+e9E4tQm0LJFnOgbaQfYqs3daeu+k8ffzlSPrpUZsRhr1VmxqIvxfJ4up8YylIS28sffxQ8FXkZgLBtUqz84s6Uo3994ExvFC1Y/+GAUSURC4BAllDhJ4EzAdmkok/gHd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(38350700014)(56012099006)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XwR3ZfEQoFCsmLPEWo0yU+gQ0gmgc1MgTNzwzFlKy9kKi5LPu4dcorh7MI/j?=
 =?us-ascii?Q?IUvzR8a9RZYC78psBVk8ggryvsSm2zWaev05cBscrE8fQiatniDzuqdjiYng?=
 =?us-ascii?Q?nBZ08XuHZP8CIX1WfZsDFFLwFknC/xJHQtRP1c6ZkOBGWnHjrabjJ2r7V8jP?=
 =?us-ascii?Q?qLEv3PmMgYFt8zbMxrAosnMjMSFC6RaZnrIqdvOc3YIMYEvY0TTyeP7x6D3d?=
 =?us-ascii?Q?uK6sDTtGMsoKyYtpnK8KXayso/uRcBd8s9GgpNleEbTQ1tP3FgsGOVkkZaXA?=
 =?us-ascii?Q?iwgOXs5fIx4SjI9iyeN22G6mpuhCDYcjxAhMYVtDnTm1YMHNXhu/RgIwY7oQ?=
 =?us-ascii?Q?05+SaHxLUsXFHBhbFL76i1PNirdqVqYPp3yYbRU0ViU46V0/gyfjQ8kj6T67?=
 =?us-ascii?Q?CrZgzp72WirLQ+0JszkgehmSJRqL/1n2LpsCSvIlTp0hY97nb2Ms0kzKG6kS?=
 =?us-ascii?Q?0YevFIO4nuYb9s0sfU6LCl89y7TrKsGgnFwwmfAiFgTScTXFOu9+OFZx7U+F?=
 =?us-ascii?Q?fsKRb0ZvF7HR72Hq5zEr1vpD8hM+Q2/hYidcW7LlKWhwaDUYJrpJLaP7I378?=
 =?us-ascii?Q?4EkknIdkEuOZVRBwUVlkFqa6BxNnm70Pf5iWIcx4CKE+jdMyLJJozJ4llmqe?=
 =?us-ascii?Q?W5V66dBweJH6QE0iRmdkqkbYaZtOcnKAQ3RYDvhd6hU10z3qkzgcjIrnsKvQ?=
 =?us-ascii?Q?ru9ByCF99VLJzEzS1XlO7o+qguUHBlYD+WU7ANFO6HB7sdVsOYpgSJUDXkdh?=
 =?us-ascii?Q?uOuQmNNczzMqb3WifMtiKcBahAba14+TWV2wzL8v4s4uB1HY4uJtKdJiGDaz?=
 =?us-ascii?Q?IXpCcYKYwF0dljI8Ey6e6qr33NAMpTNjz0OcLPnM6KCrg+xFWIQrDhd29ua7?=
 =?us-ascii?Q?yHv96DihZoBNA7QoEBwrImgZ2rw5y3EuF6yocMLfre3n9uMV0D7soGx+ZmhE?=
 =?us-ascii?Q?eRQCy8M9+miI1LrG595/UhJbiXCLe+dwKZo8kKekDUeEdwiq3Ixk2+9MwMay?=
 =?us-ascii?Q?IIbtv6bB7ZkB8xTn1bT+6K48crmde+++iUXcEfh7Pvb0h5cYkb+8q5bedyKC?=
 =?us-ascii?Q?RG/ZZAAzp1OWsDjD+syRPVYlCqT8MQyPFvm81eS4l0dbE5mZZiRh9XHAe9jo?=
 =?us-ascii?Q?0D5EQ+NrE+IHN7bfLQRNYETO+V7sH3q7UqyFV5jfiKwQ88B60eYaJ491JwO+?=
 =?us-ascii?Q?G/h0AXdcLQOlreuMnA1mZqYxmwpCVJMAIin0NQbb0aNpHgUGEANwaB3AFnp3?=
 =?us-ascii?Q?HXMm8Xhgm63C2ETSoGuZAVPt8J2Rigvieyhg/jDHtt1fgdZx94Vfq4YERY1Y?=
 =?us-ascii?Q?I921/YeHuxqOzebZmfSmbHZGzYfQjfeNWXFgaLnFVXtkUw0RFp971hOnzJ1g?=
 =?us-ascii?Q?SVdNvG9joHPZLpjhST8oE6uBCqtfqNuZeS1DGjdf9arV19nkUEei6Mx3R5V4?=
 =?us-ascii?Q?7FeIVwwPud3R+w4cNPDHzeioQ7uAKx1xJLIQUhYftlA6L0z1IpXHWbZklRSo?=
 =?us-ascii?Q?Hdu3J97+juI24pxes5FNRAobFsYhzqouttpIGugOiRvnsTpVEYAXJUNKV3fd?=
 =?us-ascii?Q?BdmRwrgSty6th4pQcGrZO9VCVOjkZjBXakIIPs3iudyc/3D32czvGIYmJtDq?=
 =?us-ascii?Q?p0yQX9g3FnkH3e6o9Jx9hBosc/e5mO2vpzni3XBsnG4oI/7a41HY8DnPOay4?=
 =?us-ascii?Q?iA+VLj6UtunkFr5M0wcwaQ1Q56daw3YUGxKe9nPMOOPRegkm+KhR4w6UFBz/?=
 =?us-ascii?Q?1tANHTQNTW5w461XXefxAn0/urtfyBw=3D?=
X-Exchange-RoutingPolicyChecked: 
	PlLe+tzCbHkx1L6o2kK80PJO+fBsK5kQZbSN1tRAUEIWiT5zuXMaSpNBTXzySHfOPJL5F1WeIec7uTNBpCo3V77vfOOxsaaqlNv5P6gnmFVzPlqB0ZYbyitYOSuoBz4pleH6ag/08vvXB1iYdAHlQlt6yjGVQb1p0qdHWLfmIqsBsKEtAdHyxXcY6ts69DBojFvk1A7GTF79ZhmlKVJqG9O/hWDuzrjDsNnVJN59n8pO6xTGsORIwbZmQasn9iAvgSaASY4zvtkgJGPReTZ7gB6NN8xbaf0DyXrMAGH+oCTvRQ0IcurMwOe9zyv0yu8IlVhEEaByx+rGTMWhhgyssg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c6c876-0e3b-4952-7d95-08decd125586
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:19:36.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTi8cDVpqxHD+mvWV1TjpQgeyT0GXPoFzS1lo9A39MCEqmaJDPP9yGHJcOryTRhnwBwO5/gJMQrSHNIRaipOlW5muh6DKrd8MZRM0z0IwyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-Proofpoint-GUID: pwAUbTA6rRv6Jjh6tYmjx8fzlMMygQ6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX5eF6WBQ9aByY
 FbL2NUFeqq/o3opH33YgGZs5puRzKmpbvMWald0kX6bxH7CTV3g1TrIS76d80LYFym7xH0UVflU
 mddiy/UwHXwMIQYl7Qm6KpwW3RPxBHX6rGpfky7PDK8YrG0kofUHeUY1GoSqannv2Z9ULAxoJf1
 fqUtOXPyVIWGWlsWQsBpvs3YoQxVHfKtxlgIfCklo+DgH1EJ4OOqfRSauRVAZVnDmmmdSjXoRfz
 AcVAzwBMWsVzyTgE+mHOyIO71HmvPeu+PiXzuCHQ58yBVP7GAclLdEKstTdOPqNentVVBjbRzFA
 hBoay/sW/AFh+6e4g/ZPSuiUTmqW8ZucPidDB5tP/Dr30wnMg+cv6E7/kzCz7v/WEWSLMQzpj/8
 rYYjixlLb+jPbX0FaQFXSLAGY+AfD0Qv55VLH4wIkMqhzrD4QRcmsuZmMV3pwRca5spixIVfTx2
 4eBZnZrFrE9XcqkyZUg==
X-Authority-Analysis: v=2.4 cv=B4qJFutM c=1 sm=1 tr=0 ts=6a33aa1b cx=c_pps
 a=wYVaD1eOHCZ7T07lO2spig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=NE7GJypMABHaeQ03Y88A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: pwAUbTA6rRv6Jjh6tYmjx8fzlMMygQ6J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX4QYouhKkmzFA
 j6Oh/iRWx7VV08WK0axWtRt1bKKqN1rbI8RYb5pOJK/PmE++G1H7WjqCU3uk5zP1jXqkBM5qCxg
 Ym4HlyBTSjJBwaWlPO5wmyfruzoha0l7iVlGH9/Ff5ho7n5cf/EL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239066

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This release contains bug fixes for:
* PR34028
* PR34088
* PR34125

Release notes: https://lists.gnu.org/archive/html/info-gnu/2026-06/msg00003.html

git log --oneline 49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db..5e56594815854de5eca35c7c04b11705d0f19c02

5e565948158 This is the 2.46.1 release
a195046618e gprof: fix testsuite with older glibc
4bcbe5932ae sim: fix a few -Wdiscarded-qualifiers errors
66bf5c4dd9a Fix even more -Wdiscarded-qualifers issues
3e4fd1a57ec bfd: fix 2 more -Wdiscarded-qualifiers errors
e7b4e8eb10a check sframe version in _bfd_elf_parse_sframe
e6336a0b1c4 Correct calls to sframe_encoder_free
09a510d7e3f Correct calls to sframe_decoder_free
1f5796eedaf Fix discarded-qualifiers problems in ldlang.c
1d74be61a50 ld: Fix calls to strchr that discard or use wrong const qualifiers
922d530f0aa binutils: fix C23 -Wdiscarded-qualifiers errors
b88558ce1a1 Fix the strrchr error for DOS based filesystem
36ced277bcc gprof: Fix strchr discarded qualifier call
c27aa8783da ld: Limit PR ld/34088 test to Linux/x86-64 and Linux/aarch64
2cd5360f35a ld: Maintain the input file order
155188ea10a x86: refine special casing of insns with MSR as immediate

Testing Results:

1) qemux86-64
+-------------------------------+--------+--------+------+
| Metric                        | Before | After  | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 327    | 327    | 0    |
| Untested testcases            | 5      | 5      | 0    |
| Unsupported tests             | 9      | 9      | 0    |
+-------------------------------+--------+--------+------+

2) qemuarm64
+-------------------------------+--------+--------+------+
| Metric                        | Before | After  | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 267    | 267    | 0    |
| Expected failures             | 1      | 1      | 0    |
| Untested testcases            | 1      | 1      | 0    |
| Unsupported tests             | 11     | 11     | 0    |
+-------------------------------+--------+--------+------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 4948e9b576..13d2a02108 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.46"
-CVE_VERSION = "2.46"
+PV = "2.46.1"
+CVE_VERSION = "2.46.1"
 SRCBRANCH ?= "binutils-2_46-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
@@ -23,7 +23,7 @@ CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release co
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
-SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
+SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


