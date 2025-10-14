Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98190CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18451.1760453059635257349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lk929MVo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5ASQw3678738
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5BMx8xkpE
	rSSoCo5nojOJa9aO8qlHoz53n5cDmTtro0=; b=lk929MVohVTfxaex/ADM+pBu4
	UzUXbOg3Q4qLAETSyU52jKbMMUaxsBpPYxVzwiGyrxgTdd4faxbmk/1wa9lKQ6oX
	MGXvz0IUUNQnQhJbPxqHel2hO6JI6yN4P5ctHC9tttnqtmjc471mB1/lfjy2mQOl
	K/qCAbF1mTJVBwO5A9MkQZc/WppoPvpzT6pFMkVF7w703A1921n7NJRsfP7bd/ps
	nvreau1zdAwU3XmXgUizEdzuz9UBEUO+Dgg5Z5T3RSx1n1vNPwdu38uiLzk/DhlO
	lQj8KipM6716U+TteMEZBr2nIX/7yzjW1Ojwsc8jhy3AgqBFOCPFTPtzAY6Mw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewkb32-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk55ht6qVJBGSA/8N/e9Dxv6IF7hWw4ODhV9Qo8ivLmYFEbsXd/OKWYM/IrMArJI5WeaN7K42nsZ7hcF0XEsEl3uJ85LiK0DsY0rhPTYEmjdV59yl89hi+6T2XMyJz7XyDenC6PijXBgIc9wylnUPqAWotbv+Tc3Kx+skrL2PLHCXnMLEAh+aCYqFbLgmKNJp455FoVfcSid19qQ6EnEgcQKAGGYsGHz3EBYKazjuHBSca9ZVIjqi84F5sfP/9LmrL+jxvkISHkUJVW/HW5KhX1Br6ANunmGDesBx9NtjmprX1z0tqtaaNobXhq/Ldgw4n43MFguOXrMpxUIEVIk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BMx8xkpErSSoCo5nojOJa9aO8qlHoz53n5cDmTtro0=;
 b=KPGJrEY58afQ5a7dz4NXttgXFLG9sePs4drDf3ozq6wtmWLSKIxmPUG4APcJosMupCo7wofEP5JKSC9DXN0fyEYsabEJPYXvGnv+0SwaTpRyFmikYx+vsXIdkJ87KHHZLegImEf7gczd5TQjjTGG4oLPRxzy/8nBkPcpRvykRpge0Hvx6xO1fowF7+5zlTXcFruKbKhj7CDasWTfI9bB20II3m4FxhayH+i4mvVRvH2nQA5pouHyu1fAAnmR1o12mA93F/5fUBR4ksykWU1a+bfwDaGVSj6GoxrX4CM/LQ4KAR/+PPi5U1GrFQpv2BwRT6PmQtbsadqt6DQcgUII9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:15 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:15 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 00/11] glibc: Fix lost wakeup in pthread_cond_wait (BZ#25847)
Date: Tue, 14 Oct 2025 07:43:36 -0700
Message-ID: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f594c8-1c19-4f86-47e2-08de0b302598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ImYNkjGySR8lMDumutCzM5w6CAs4ovNqq2aZC66QO1LVH5DiHhVD1XDo3ttA?=
 =?us-ascii?Q?vFCtJSn+Ypw6wT5EYtc4ItL1Mq2Lxxh/KiHl9MuQsAeNWYpICoe4WFBVSdM2?=
 =?us-ascii?Q?q8KZxyYZa1cuxP1meFvzStDTirf65rF1XFuQ/At7y9vwzPTPJYa33UpsHJLW?=
 =?us-ascii?Q?PJg/wwBvrSsSzyCaxxg8LjXsOrkzmInThZ2Hbh/b93xOBcwg2otTkiXjf8cn?=
 =?us-ascii?Q?louLiWda7tBlL9v5pnXfUFh/2BIh/D3bVmaUCsJkjjqQ0dnbgZsua/fMtChe?=
 =?us-ascii?Q?VG1NXB40/R48MsL0ERMNDvPqe127irTFMtQIvUjfyV9G3zDn7p0xpajyDg5m?=
 =?us-ascii?Q?xspUiRTv/0GmWRUeaLnGlxtvKFjTp3GYt2yTx6wFukYha7C4dznqU7wkRB0M?=
 =?us-ascii?Q?uhqcr1uqJFrYwNGCwuSjfJZH1mC+2qwda7Hkd/MiA3z1s/LWcLrVH+fwqnso?=
 =?us-ascii?Q?1Ph5s1sDIhXedxr90EuEEy5HllRPYltMnVq4Zpkgvar4vfyhoJ+spQuAR2FN?=
 =?us-ascii?Q?2nNhayXzvLWDs4/at0N6vNbjSs+E/LqCXlts8gRMxQeA3tVD3vC9tyQeanr9?=
 =?us-ascii?Q?Xrxdad0R2szTtK6GIHIZxaMjFfTgw+gY3d0bcvjMqAIFMVFaBiU9xyQpWLzF?=
 =?us-ascii?Q?BxMYf26I3smGVXzMDl99a62wlfWqPo/AKOFkYGAkfE3n66yCe5xLUdJoZJbm?=
 =?us-ascii?Q?ckUVfNtmy0NeXuXO/4aFCZiZafcLSw6cx1bQ+m055f3L9p1RcLWrj0HhaI53?=
 =?us-ascii?Q?FfmsSOjgcbN42jfmoJZq4SOsPKIga107ZAt/ofiq+LuD9OjParKnApZAz/id?=
 =?us-ascii?Q?KHcsGC8NUCunaWATORGMBDDeuib6ucojTjtfOxBZJxI0YNBAABBFJ1Ydwuye?=
 =?us-ascii?Q?sgKpguujLnOQQ2zmC1WEzodNXz/Wlo07zMlw0+WaxLUmtA2lCzpJMIaYs5Iq?=
 =?us-ascii?Q?YFaavGqgXhM6cfkeZ5HcOq2CZAyeNAsUvXDIO3UTb1RlK+0CEyRKB8u58qxy?=
 =?us-ascii?Q?PFtk7cgE9hUD6iWbZlyemJVvYWWLo8QfRdja43V8ThLT4rqCNfLT2YChDMsR?=
 =?us-ascii?Q?eepKHc9ajD4lk/Y/u1J5f2M3AVBhwjRmtwaVSvL1J/++esf4/RbUuWzG6UBX?=
 =?us-ascii?Q?t8bWZtQ3PLciB53F1cHS6XZzzdJP7k3hk+G738rABVh2wSP2IueO2b0W/+oL?=
 =?us-ascii?Q?olT9ad25bZpX7Yc+SSwhF5xDVzzz1O77EAG/eDZUu8ASVMKTjPhXmsPLOvQp?=
 =?us-ascii?Q?1BuA2SLH9f95mmZjjAC7M1nJU9Fw+HPwnAvSts0Fpxo1ewRYLylYfaJGGVRy?=
 =?us-ascii?Q?W1csI4C+4Oc+qx5uN9rHcAl3zrw/TaAlv+EPv0YHheEDWIblTEawNRuxt9By?=
 =?us-ascii?Q?k9wap0mIlINp4HuMs+Rnvd8yPSGMYW1dD33DrSSrp6fkZyC95ILwmovS671B?=
 =?us-ascii?Q?q8rkpVYcdf+w1/8pmzEwH1dUUjdc3GkN1nyM9pOu2aW2jB8f0tJgrTRWy2EP?=
 =?us-ascii?Q?2hVZ5XMzxXXPQMd+mqKjSB2tPeVhKcKJRzoTEN2IdhOS0+vDfrWQeMD3lg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cytvYqhIWZ/RivR7V8DporhbWH2wSP8cQcmaIladaMsS4INB6BlxYb9COv5J?=
 =?us-ascii?Q?efDruZTriQ5tzgKZmxg+Kqa6ifWbnYNfPoxl/3lOOeYsUpgonPGX7BndHmFA?=
 =?us-ascii?Q?hNz9e4HFH/WucEOLPvPot5H6ALAmytwj92z4+ikVksygOg4J6wbyYXxb4k3r?=
 =?us-ascii?Q?rOT3RXlqSXIT9j3ygV6+TKNRUoksGUCuXpWdm0wp4PVa4WkLqGYwWoTOhn1X?=
 =?us-ascii?Q?0CWDnvzUZp2rxjtLihllOI6zxBBa8fnl5+i8uMJz2tnPnKo/tS3DEd0B+GFX?=
 =?us-ascii?Q?qfccvk70jPSeL+dmkylewltd9W/RBTP6SkyYK9OlO1N3lLTL2uqksnHQofMg?=
 =?us-ascii?Q?Ai8FNB1BqbaFyfMRxOPz7MoubC7pIMsO8x2DasARLPtpnfMiCMcLE44b7jw3?=
 =?us-ascii?Q?uWboTs8r9ss6ixqqexHcFHN8yz7cQ5EmpAYLX8pmJvyNiAfwgNg2l8WQhOn3?=
 =?us-ascii?Q?kNo660xqwv13I3Af/BR3KkC/5fJaKn7n8pUDsitv38Fzo0NeOM1f9QZgJ6vW?=
 =?us-ascii?Q?PFG1hmn3nVpDgWSty1A+EfVC38N/ruhvcKVz6WrvzKechGapP951up76gpdF?=
 =?us-ascii?Q?34fGSHzgV/4TXapeudU6LcuqLCsE10nwSH2Eru/YnU2I9hhP33RhdyXrkStr?=
 =?us-ascii?Q?KVZLQjbe8YQgAvGTd35M/oooCLsASrox0UN1XUXNYLobSlLb2x90o6RFkurW?=
 =?us-ascii?Q?O8fIORXy5MOIY9iUcnBcfAloCf2Crj/f2Zw81uakuirCDZbZJLTOFJfRaJ5L?=
 =?us-ascii?Q?ZSk7PaoxnptESM1qOCKBK+SUK+zYdMyC897UTdR1Ya5UpxxPrOVAfdLktvd+?=
 =?us-ascii?Q?Lts4hGkkgbpZH8eep/45FVQwN+zVYaJtfwArQ0iV3r+wS4K38oGRY7nBHaIL?=
 =?us-ascii?Q?c919GVRLjV4ldU3xxHxTQfF9uHV4YgIie0Cr3yEyhBn7u1okFCL163fCCHW0?=
 =?us-ascii?Q?HEGfNjCQwgb/U9u2CEvvhdfWM8ZMRxIFeyYMtkJkiO+G4WlLWiMB4S7klpjL?=
 =?us-ascii?Q?9d/RD05QO3tN4+QLqewatktV+drLcCa+7El7Ewa8XK7JT5b72Fc0kQ9E4E9A?=
 =?us-ascii?Q?mrlCHbHaGUlAv2lCWa1GR3lGcv/3vpP7hyyTLpl7+/EhZRTa9rFr36skRCuE?=
 =?us-ascii?Q?5uruj63ovLpoEbjcvh+OoAYQGHAg+K2s9ykAfhOVi9dcjtaGNwaic3nlP7y2?=
 =?us-ascii?Q?E1GgyIoDa7J9muGJpIra8b//3tsnQ6XWTlW44iWG0aQwfjVNJH99qWBfV3lj?=
 =?us-ascii?Q?ko0yJFZY9bwiKi4CdU2pN6MyqqBS10XGIQaqCinSLG1gA/KvoLvYPwduFxfU?=
 =?us-ascii?Q?vbYBpI2+z40uHovcLS0J/IRdNJlic0/S5snBEEPlg4+IDilp0EOf2r8Zk8Tt?=
 =?us-ascii?Q?36RdUcruM/fid25i/Cz0OQd36o+AFoujmXFNe903rxRmGFenNrrSifoyRIbu?=
 =?us-ascii?Q?ZgLrtgv02Gz532Yf+Z8cfOD/1pG0SG2OpWDdag1DA41SeGlhb07Sxlbim03t?=
 =?us-ascii?Q?AO37JZUiriN7Whh14VYHGhRqjrGDmDr21RhUkveQCEXtBQaEEhbTKnoiXAby?=
 =?us-ascii?Q?kbCLILWGP5EAUva2rYoSPXQQ7+GR6qyEM4fNLL3u/ZNH13suZkrrlqNyFmp9?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f594c8-1c19-4f86-47e2-08de0b302598
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:15.6733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDjrBUOnm6JCyzOIBqXK2p+wJXSNe4YFv2dCfni8JeWwZo968DTCxRPHldZijmCrgaOZNQbVMnU2X156AC6mrQFvEKG3ANogX66kDRVJla4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-GUID: scM7ibg1dco_SuCT_6jDSbhmyA1vPzGQ
X-Proofpoint-ORIG-GUID: scM7ibg1dco_SuCT_6jDSbhmyA1vPzGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX//sn/NZxjvl6
 Ct9U5MGY91bsT5XcPd20xIjfasiQJqDdXZq0fN6QgZLrnGPiI/N5bb0pO4raa8m3cUFCzbFZoIH
 HjvhT7E9cobfokAfO8it6mbycg+VnoUhqY4j07g0IKlN2YmQZO74i+hT7JNFIv35cgtGfmqidC3
 K4h0b6WPKkc9dOwVXajnNtX+zYVeFkcgzyM87Rie49Nm7OecUPmJrlYBcU9wclf8JV+RuoOC1BW
 wGF52tMiV+nvsOYtpVdIMXQcQdihdCo2zXc5aw9GVLz/lqrOmh2YVc24lDCXVO8KS1kizglITmT
 Lgb2RddKbU6V0sdpC3FFPX5k2te6C4Rx43vNdoUO5fJQPjUB4pLLPhfrUwKF/uzy/UqpDCQTRx8
 82EzZby52xqIHajyq/8t5jTCGce3gA==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ee61c2 cx=c_pps
 a=Fekr5IJHOwr6cQga7yOItg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=gRs58DyNQOztN9J3c7QA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224821

From: Sunil Dora <sunilkumar.dora@windriver.com>

This series backports the full 10-commit upstream fix for a race condition in
pthread_cond_wait that can cause lost wake-ups under high thread contention,
particularly affecting applications with many threads waiting on condition
variables.

BUG: https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Previously, an 8-patch partial backport was submitted, excluding commit
c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove g_refs from condition
variables") and its dependent dbc5a50d12eff4cb3f782129029d04b8a76f58e7 ("nptl:
PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)")
following guidance from glibc maintainer Florian Weimer (BZ#25847 comment #74,
2025-04-18). This exclusion aimed to avoid potential ABI incompatibilities in
pthread_cond_t layout for process-shared condition variables in stable branches.

However, per subsequent recommendation from glibc maintainer Carlos O'Donell
(BZ#25847 comment #75, 2025-04-29) to backport the exact series from main
development for consistency, this resubmission includes the full 10 commits.

The initial patch in this series removes the prior partial backport to enable
clean application of the complete series.

Glibc Upstream status: Fixed in glibc master till 2.38

[Root Cause Analysis]
 The lost wakeup occurs when all of these happen simultaneously:
 1. A waiter thread gets preempted between signal decrement and group check
 2. Multiple group rotations occur during preemption
 3. Signal accounting becomes corrupted
 4. Final signals are delivered to empty groups

[Impact]
 Applications using pthread condition variables could experience hangs due to lost wake-ups.
 This particularly affects high-contention scenarios with many threads.

[Fix Details]
 The fix prevents signal stealing by:
     Broadening scope of g_refs to cover entire wait operation
     Removing the complex signal stealing handling code
     Properly maintaining signal accounting invariants

Upstream Status: Fixed in glibc 2.41 and master:
 [https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c72]


[Testing]
 Verified on x86_64 with:
 - Custom reproduction test case
 - Stress testing with high thread counts

Reproduction Steps:
 1. Build glibc(2.35) with injected delay (usleep(10)) in __pthread_cond_wait_common
     Just before : uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
     File: { nptl/pthread_cond_wait.c }
     (Note: The injected delay is for testing purposes only to reliably reproduce the race condition)
 2. Compile test program with custom glibc:
     [https://sourceware.org/bugzilla/attachment.cgi?id=14360]
     gcc -g -o pthread_cond_bug pthread_cond_bug.c \
     -Wl,-dynamic-linker=<CUSTOM_GLIBC>/lib/ld-linux-x86-64.so.2 \
     -Wl,-rpath=<CUSTOM_GLIBC>/lib -L<CUSTOM_GLIBC>/lib \
     -I<CUSTOM_GLIBC>/include -lpthread
 3. Run with CPU pinning: taskset -c 0 ./pthread_cond_bug

[Behavior]
 Without the fix:
 - Process hangs for 300 seconds
 - Eventually crashes with core dump
 - Verifiable via gdb

With the fix:
 - Process runs smoothly even with forced delay.

Sunil Dora (11):
  glibc: Remove partial BZ#25847 backport patches
  glibc: pthreads NPTL lost wakeup fix 2
  glibc: nptl Update comments and indentation for new condvar
    implementation
  glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
  glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
  glibc: Remove g_refs from condition variables
  glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested
    loop
  glibc: nptl Fix indentation
  glibc: nptl rename __condvar_quiesce_and_switch_g1
  glibc: nptl Use all of g1_start and g_signals
  glibc: : PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions
    (bug 32786)

 .../glibc/glibc/0026-PR25847-1.patch          |  24 +-
 .../glibc/glibc/0026-PR25847-10.patch         |  54 ++++
 .../glibc/glibc/0026-PR25847-2.patch          |  13 +-
 .../glibc/glibc/0026-PR25847-3.patch          |  18 +-
 .../glibc/glibc/0026-PR25847-4.patch          |  11 +-
 .../glibc/glibc/0026-PR25847-5.patch          | 237 ++++++++++-----
 .../glibc/glibc/0026-PR25847-6.patch          | 220 +++++---------
 .../glibc/glibc/0026-PR25847-7.patch          | 277 +++++++++---------
 .../glibc/glibc/0026-PR25847-8.patch          | 269 ++++++++---------
 .../glibc/glibc/0026-PR25847-9.patch          | 193 ++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
 11 files changed, 773 insertions(+), 545 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-9.patch

-- 
2.49.0


