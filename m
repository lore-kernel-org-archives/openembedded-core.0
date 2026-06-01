Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26725CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 19:59:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8339.1780343964519682330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ImDEslB+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651JB7um3898535
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 19:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PbmgsAseAvmk+xQjQkzQ
	kR15CPfXESgG0P3KC8mElnw=; b=ImDEslB+a9Ijov6o/ytcZEkXREwNG2n0AcW/
	fI0XYu6NhCFaz4dup+qnePsCZaexEk73ER8soJZ85vsKjlAhcXpcuba4CoI1uNnf
	x7tO3f0xp4EORaVwGEvXe6jhZKiiZsuee/Si6vECClus/+SdeR2vDSPUCGXZiuXQ
	ibBegEmTx/LEsfUM9YISxFhv135PCMZV6NM9wMH5S23zoCmpgk3l5mV7RDLupK/e
	8XHWiCLQNdaI02huQxuPPxrkde2ANICi9gbvChcU9OJF8fyKORuvbT6FMuEWAGJD
	UR8cAyTDQ+4mKeGrr+B8LrFj1UiTjb9uWgBg1bvrZlpyt268Kg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8bmc3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B032Trl8bOwuxytDv1I2YNryBjVHae3qeslxu8p1pFJgWmHEC08WFxjUFLdU1pqNy320CRMriog0+5HI3m4Yxrrgnnq+DZG4M7WXgxBANKguCJnl3/Jpfdz/2k7NXpNoDAJMz0ReG8QVO78o3HfBUjbtTb4fftaIjT0X1ItqKRnnSD+gOjyfpm+vP/9Zr+Qvk8P7cUoRueiblkb9yR+zGa2lhFjJB/xvI8y4doxnur4Y8rEItaRM22dTGzN4DxnaLSsHBMwsh+ehaPCL+ARtSyzoPaqh6/FbuarzucrgSLZr6V6T1oxFROWM3knpt06v35c4nMigEp7l2v7JiBZ5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbmgsAseAvmk+xQjQkzQkR15CPfXESgG0P3KC8mElnw=;
 b=dNpDbhzvAUdOGa8rdENYOH4wIGhO8qqrjJZ0zvygPmoh77ADa9GiHzGjihg9zJkq+lsmVcEtvkm02SGGEPU+aInJXikA98+YFheDCGUPe+Kfm0uJzdh8eKFuDcA7qc9AhIZhaujJ0+lRTKrPHkTiVJGDGMnDqb0OB3Dcjs6h4UerGmRdn1qeDZmiVYCEI1m/K36wmWmHIq0fpjkIQ1nm+boS2SgVPxPvBw+RMRYS/eM1sejDv03D9YrpGfbgIXKge9GpPZm/Zmn49GW1Wu+dzt4J9uv3n90ul6WeJ9eH7OYE+EWtqQRse8+krLwgUogkszBz3/6bcY3TbZGAkbc+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:59:20 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 19:59:20 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6][wrynose][wrynose] cups: fix multiple CVEs
Date: Tue,  2 Jun 2026 01:27:55 +0530
Message-Id: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 459b9322-d8d0-4c43-4615-08dec01844c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	8Pu+YY9T0aFI80iNkB8YNBxGEKpLumes3s0wBafv6Q38NIlZZd8QjvkF7cxhz+Wu2jun2QLUc8fFAZHnf2h5tyPgj14aSAOmG+G69Biu3Mrha2BU7vS55/tvoKmIIRJnDgeFX2LGCSWHANy6h4TBEhEvawxSdrkJS8jNk1U2Kjq8NbLqnuUy6h8SVNVtPldJf19vdbpF7rnqGRwGc/eTbPVpMu/i179bxHlmLvSZ8MEQC9Q75tihas3uSC4KmfRfNGutj3ZJ28G09daozZ2WbWtVxg1mC0ziaWlAnijlGUhk5nxs933ThFEuBDexJ0Gvu+zw5BaYL1gYI6nUaWkcauwbzKfRQHBetdGkTieT80W0j56B4Glk9WQQI/YUzHoA9l+7/7yATfpWJn/Y3VPIdghB1f+7WdOsFeHfNNZCaWfIjy2o+AHCUeS6rR1p6efzek21G8vCiUTSaqd2dRuuHs5Dg5uJ5kshzj7dGPDkr6yusZGaOGk3fXINT76NLO0iaYVmHd8paoZpIz9d3LCSp6x/rnSZ8W0pc9LjKhwl/YKqSQVCVKlwmKdcTKWCuZ80sr5xqHpqgpce2+1YSMsFZnKoMUXdCCLvOdOK3F4EAxYepCDjPdWOga0aFiBLsg6nykksysMBdSjWa8uX7I/USMYSypVpaYN+uFkI9CLMprHiVe7y39K98Jx43hFdOyAEieOdIGzZP0eOIVB1rAQtqbkbQ1imDr1fESEJG5EqnTDHF+98Tbua5c+6XWtAd17I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ND3Bl/5MApWfGHYiDQP7P5OXA8H9XFddaxnsMNjkFaecDAHUMTE0kX1l9gvB?=
 =?us-ascii?Q?cvyJlfS4GjLNI03dR7FYFsqwJXwtkZ48kjMOWgowE81ZYmOpCFPtQdZXtTBa?=
 =?us-ascii?Q?3PdtxWV5tzHOHoi64WUQHcixB8XFtwv2Uqx4PmlQoiHW2m7IuE9UKvGVKc7s?=
 =?us-ascii?Q?VuU3YX6ES8oqQX+c5aM3YWyv7V+3tZiTu5iOl4YNXTeDQ0byFcmsyG3AMZ2o?=
 =?us-ascii?Q?tMUyjP7xYj0bJQ84eiVvWuj/D7Edmtcczg95PEe3Vy/C9cPe6iYMDpFIpfzl?=
 =?us-ascii?Q?0PjaC9leYWMjZp25dgO1GVa9N62+aQTRZgnuufkf5MjCShVN5STcoTTnkWP/?=
 =?us-ascii?Q?OaLZcRYbS2NF3mEAzyfyxNhy0bvDxxM6Yeo8gBP3Ux8bh/Nt25q8yZSwu83Z?=
 =?us-ascii?Q?IVvGjCw70YMaVI6dDE7EaXE9/lwQepDN4bGuaGk6VQuLZWsjSUz/zr2JQo5D?=
 =?us-ascii?Q?4YhAk/ZpqQSFy14VCS8J2rzR+bb0f0kQJi9fVMS6YoqvdG0BpLfTyJGmNDm1?=
 =?us-ascii?Q?gW4y/SWn6WD5q18FWB+L65YVEZqQZmCQblPDubqoXjn/mlsk4sbELQl8RAxy?=
 =?us-ascii?Q?gHgA5bYaXNwe9t0+uFBfN3xAIki8xRB+cPoI4OE94REPx3AcxDtwdzSVO7gs?=
 =?us-ascii?Q?de/r02h/C6XyPopBttUpG92ZYjyhBaYbVt6pwVOolqlDU2WOmV8yWZ8VsV8m?=
 =?us-ascii?Q?DLLU4T6uDoQZ/OxMllFitJfKRvoPiw9/ujJgbuGpfav+aww2Bak/kYpjMSsq?=
 =?us-ascii?Q?TdhJ0H/yzlequqjbBQBNKD8WLyilUABYtoELIFhSssdYExDiAhPy3xgqbvHy?=
 =?us-ascii?Q?zCJkYt5bqVUnd0kri0vzu71oJcjG0+jb/Divg8lwcJuILsItjhr58O0mvOb5?=
 =?us-ascii?Q?/nXyV7hHyl3ima9HHFxBIbYVI9h3jXruUiGp8CDwPdga1tTZIi6kFpPcsMhK?=
 =?us-ascii?Q?UiE7uIkvLfjfwq/XLS94DBBT/luGDwqgiF34xifs2n1u2hb+RpjN3Dn6Pr1J?=
 =?us-ascii?Q?I3mnNuYdgBZ3X71cGYYYEw5tlbwyw2J4WSQKIsHuxtQ5RVv62uEyB5hlqVbr?=
 =?us-ascii?Q?6l1yzrGFZ6PottDwhVC6wsQZhpSFrswCVqGqwGa0NOw9ALItEFvVgjXwfxjN?=
 =?us-ascii?Q?YWlDk72j+ZYHNVIEFwDbxl/UuVS1x4UZfCKdtNpAKvXB+3ezZJ8kWtYXXiCb?=
 =?us-ascii?Q?RR7k/0uqext5N9uEEikZXO3bQuqqA3dqpYu9LbPnosOp9rJBGwalb8biIY5R?=
 =?us-ascii?Q?jbcsz4SlT1rL0Vxnf31/gvoiUOkWVEVpnt9C6ju/wWgi+zclpvJJoRfwdaSF?=
 =?us-ascii?Q?loL95EsXXgELO3nKxbqFa3byc9sklDtNRU2yFbeOyAwsdmINgjWHZClcRN0Y?=
 =?us-ascii?Q?fGcaGZTkuBHcxao7Z3OeqgH4BoTkWJCReQHGskRSsNXkE2y51Z5ObKyo7aLr?=
 =?us-ascii?Q?VxjZrtKLZHV1QoYn6mt8LwKgptVSFQDJnpNGNLhI+I5EvT53LXibEFdfg4De?=
 =?us-ascii?Q?u3e56AoEbOvsdU224iQRUJrGsBHuiAEidREevzhCRK7+2WyNx6C/4skZqWf7?=
 =?us-ascii?Q?Lr6v0Aw7DdjFE7mWKB4TISmH8NWjQqIhOg8ChfZgXGNQguPJYqzMkMCHJQzl?=
 =?us-ascii?Q?DOpfHaSzoO8PWrcPCMeQdDYruM2OmC5nqd4beY5/eL5UdzBInie8W7x/wjTu?=
 =?us-ascii?Q?YTl1XghggwA6BlnwgA/f0r1h5581qHAlMsO7uLuoleFV2GGk6R76IafODxj3?=
 =?us-ascii?Q?2sfvUaPtzBkwjjMzIGDYF4qv6OKNV0Epoi8W1ONHaGHc/b/DNJmb?=
X-Exchange-RoutingPolicyChecked: 
	opkhlYDz5ZCPPXZxdisZHQPY9CKqC9nyoBYs3qmyuQE1AGhhbK83eawNe/r3Chf0vZ/m0PfsYmsCzgk+nGonH3ris5VtGEYtNAphg1niCqGqNklaFUqUDZTtLW9/2ff2VHBR7J4HJzX02zrF+VgWgix7nHVLsXd+AQPMK+3xoaSzwR1f40obJxqPycFtJ1Zo0yZh+nEw6E7IWCnlJsfHBYV+zSU29hfd9AcRlFtt6B9hYaqjx1/rdTJoVPbS1B8vtoV7F1SpJvsas8LOEo3nxFWt4Cm0fB+TrCL6dtFLcwxu6LHneeZgwTj0PxmwA6b3Xm3HQrDzIx41JE2ACgYkmA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b9322-d8d0-4c43-4615-08dec01844c3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:20.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ws7xAZO3w/Tbsc0YdZXyQbUF0FAofUwOp+V6rs9v94q7N+XxeEPLc4uj6DjbpolzKdMiEllQeeE4Bmwidcaz45/nzzxupYnEEimNb2BaSUYnh0QEvwAGTO2gVcPedmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NCBTYWx0ZWRfX+yYZV4deeO35
 JxwHN1RZ6TuXjUahTUvPm3eA0mWgA4JVuCMdsXJJTHrdWLh19aPCQRV1Zw45kdkQIaDnO7k5qai
 38Ham91T+dqGlCPogYbGOuPHIHdwahzDwcXCCTrrD+km+rRNTArmeCgWvRpWYVvFmKGHFQaHj8n
 CFV8aPdIgOusV5vjeZnGAXqAx3Is/N1bFxvxPXoOTgCeeRRtyMFrSS290Wuo4HmBqCwzX0bT3+Q
 U/scO4p0Wo0LNvTGI37kSJHubGwMrjtch8u4QW3ouC9VxdrkfoO5o1vDwc0fF5h8Z2FXXloWOag
 px1HxZBLo08/VygFeYdisql6do+/11vhw4R6Bair9i3RC/3Vx56sx7BMZ8+45NBfZstYxt0VwmZ
 majz/ojBrlV0qxTSB/XOxMdo2aDnudEhtozdcolzLQrhY8IRegcRMyyXgu8bB2/psvzxzIC1HoK
 L5wxW+eSPWBVzZxBmHg==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1de49b cx=c_pps
 a=ISb/o6YKWqc6zLqDT+CYOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=-RnzOER2bHOHE0ycucQA:9
X-Proofpoint-GUID: qM0LXicvNQr3KjWLD1Bo2sITvpIj1tQs
X-Proofpoint-ORIG-GUID: qM0LXicvNQr3KjWLD1Bo2sITvpIj1tQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237988

This series fixes multiple security vulnerabilities in cups:

- CVE-2026-34978
- CVE-2026-34979
- CVE-2026-34980
- CVE-2026-34990
- CVE-2026-39314
- CVE-2026-39316

The fixes are backported from upstream commits where available
and adapted to apply cleanly to the version currently used in
oe-core.

Changes include:
- Importing upstream patches
- Updating cups.inc to apply the patches

Tested:
- Build tested successfully
- No regressions observed during basic runtime validation

---

Abhishek Bachiphale (6):
  cups: fix CVE-2026-34978
  cups: fix CVE-2026-34979
  cups: fix CVE-2026-34980
  cups: fix CVE-2026-34990
  cups: fix CVE-2026-39314
  cups: fix CVE-2026-39316

 meta/recipes-extended/cups/cups.inc           |   6 +
 .../cups/cups/CVE-2026-34978.patch            | 120 ++++++
 .../cups/cups/CVE-2026-34979.patch            |  57 +++
 .../cups/cups/CVE-2026-34980.patch            |  88 +++++
 .../cups/cups/CVE-2026-34990.patch            | 348 ++++++++++++++++++
 .../cups/cups/CVE-2026-39314.patch            |  47 +++
 .../cups/cups/CVE-2026-39316.patch            |  42 +++
 7 files changed, 708 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

-- 
2.40.0


