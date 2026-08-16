Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CDCC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19457.1786921893455914659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A3phbCok;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMj2oK1220072
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=; b=
	A3phbCokHm/2a0tKBRotwMYSv/aaXWzkkUklS/v80AlKbdOHxn25H84aWO8PBn8T
	sh67B9LKpb/J2/3gTjQOOXaBPJtizzL976WY3Y86TEeAiXRE0qu6g/fwdmY6Lzyc
	HHuHxssVHri3FjXTD0PpBD7dJeK9ZseKnoAIN6i3q9WGmJUHckvqPoDfMJ9a9q66
	tr6STFMVqeL2iYEpW1anNDpF+B+IOVpZ3IHwaOHNIZRHYzm6nYqaZrO0AQr6Ycta
	6Jc6GFzU1DO/QBSutBqZEifGQqBUYpR5cLTe6hjeGkg/467X5b/nSQgx+kYd4FwX
	UckXZMHm9qUGuCtmY5hm1A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023140.outbound.protection.outlook.com [40.107.201.140])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eeb9t51-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVU5NTyGwa152lWwAVNVNi74zuRMDFeDcmEX5gb8KmeoxXa7iqduOyK30C94rkoUfz/Y13ee2coVz27cahCBEpK0x2ZppIMfoy+PWqcbP4OEF0b0DGfGjbNgI0hjz2UnLqSxHL0KFK0saCD3O0m7Bck9UvSLj800KH92KPbNLq5zX61JFqqrIFR39vQbOnMb1Sqr2ra+/h7EbDEewaXfbOPywC/VruVbQDhj64TAglw2rGqZhRg5H73sZroKvRRayF9kTunTfq0/xXalUfE8qUsW0c2v7rckmw51PT54aBKjOCl1VbXT0q6zncto95+JuNP/ul+lnVFE8qc7LB3CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=;
 b=Rsit7W+tLTXIaYDZ+9z6JeifpEqAtFwvXtk+jUG6e3LvufcMJpXhnwZ7Z3DDAoBClxJ4f3WCQgKB9n+CMi1DxE2VIDkevdo2uzqF5iSwaMaOyEuOAtXBIVESd9VZDeQsGgNT0xlXK38EW/ZRlwnT83kjDj0tYZu3Q4Y7XuA3nnj/nwZg7LtR4+pgx242wzb4wIyuENnq1fx5DfXfJ2X/oS11MLRKcD3hKtN5xg9MdkYOAf9h7azwbJ2qFhOjvJu/OWRJoIyI33w+BIBtqVUU1cEnFhGXozHNFvJWozVapcd5g4TnzPXATUVbohezNUL46GIf24Nsi2+kPjzhB0YUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:30 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:30 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 11/12] package_rpm.bbclass: Suppress pkgconfig() Requires for sstate compatibility
Date: Sun, 16 Aug 2026 16:11:03 -0700
Message-ID: <20260816231104.3871015-12-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b97360-f025-4fdf-0cfe-08defbebb494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kk807H3//VfXLmCdRmin9uZApPfmRIHrobrKIu9bwnpVgMAapI2GdGCNRZLq/N6z1fgQKrFEhLJr+6yyzFGWMRkwH0F+5fhHAwr+jRTzqIn1fXoWGScLPYJjvh/xTe4BQvlJfUqfncU1c/KO1lQwNv2XvzB7drZFx0+hBHQXacGBdF+O/NpkuSHAa45OalMSsVtHmbqJ97Agc88+t+VMQ5y2sJ4pYoZd0R5iQlvEjfWzdYUZupGnvPjNE+NV2RbRY0mVpZbaS+HOKyK6kMZPSpeY5nY46GV6LJXyPW/hpUajB0zZRMeOvHo9Z69gS7FA0VMPpeAAPzkQKSuuHrptA1mmAHt7SCzJ7k9vQA9yq7QmIUH3n2KeOA0arbei6WzTJ6eFPmgkyqwnCNVAr2yidmX8VbKcIl8RPcnZxBUOdoNkqJEm8FB8WyO5FhcDJPPV68D+ZcfaxGTmjG6IV8ggNUUa1ii9C6hPq3+Y29ZvzBgMRinvvzFlP0pBG4Vn2Ini32rAgSDI5u6c0/XkGvl5GLieVyaSe2rfwriFJes0xlpU28Tj20U5MFazDhDW6c+sXtg79XX1cnFM011CzT0UxIDnSAtF3kayoj6HFFo+eP+48sORoxgrS/orRI30J6Z62ZM0ZpmgSZbLGebdAVrFlXWFu2MD6tqGwzHMH1jUjn3otgk2AqugyoDOrhH58/w16+GbylN1wC2/NntrnjJXobplFMu2qcIxUgID5QVpdoM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HyZVtTV6JLntnT/elTRuE4p7tmSBVtDoM3dQIcN4D/tL7Qnl2QxFIf/pk7oU?=
 =?us-ascii?Q?q7QVC9tdkrHa/MmW1b1ZsXlj9U/yCG0UISioBSncC+ZqYvZjE4Vcc4vjk2wB?=
 =?us-ascii?Q?UgvQ/KrgVivDeFxKbA5ygsVUoFUlfjp/CJpxowJIveIPvw7wM8tXV4S3HV3O?=
 =?us-ascii?Q?7OL49JInOU/9jySiXtUH7Q2eHvwLNahlHMUq3v5zDKGEbpztMccs9uaY9JSi?=
 =?us-ascii?Q?9wiwz5sTpwp3Cxn1H9vFoqPBh6LmMXWzCWWqiW463lEsoKvzJNPGTWXgFx6/?=
 =?us-ascii?Q?hk1j4g//jhhs3JILiRhtblpe0zh5OLR5nNL1e7LPFlZmsFomUN/h0CTpvaFI?=
 =?us-ascii?Q?VPXcbQTKmbMLb59XLk8yCQ96YVa24QPo+klybKs5IxbqaxcjfOjCtB4Drl8O?=
 =?us-ascii?Q?CPXOROc7d5i91/j7+BOyVsZrDqF28EC2uLtM/TEKsLyXqutky9ONFoR4yxdh?=
 =?us-ascii?Q?HIPrYQW/E/FS+T/eKI52xA3LHJRcaSgA/8PlsJ/qD8EMt4dXn2UriWbdaXMa?=
 =?us-ascii?Q?XK3sroukh431A39sSpuUHvhbxky25ff1k5McGrWblEN2xQKv9doRGbIn9lXg?=
 =?us-ascii?Q?Phy6LlukQbUtI1zJPAwXb/GSignkM1g94SFVOgwnSWFF4BvYPFXN1mn3eCbn?=
 =?us-ascii?Q?CO6q1T06ojyp6MxiCrD+Z+hDeTrpnaC/yOgr7cITkdGFzurokXMMaxK6T7dy?=
 =?us-ascii?Q?cfoHwcG9l6nJAH73Hl1mOar46Di2o1LeSogPUc3Mf+ZYv0IkIzVD/tJDiryF?=
 =?us-ascii?Q?KsnEg/lPRS8y1zXKhEGWHI80QS/QauyQz7jL/kfe2eLnuJdUO2l7O9w5Dkm7?=
 =?us-ascii?Q?fx/pmqO2boB0lkkIF4lBdS6HD8qoAnaOxqqLVBTdjjMs/+XKKLb8Zj9PlyGP?=
 =?us-ascii?Q?3CBmOt0ipXja211MG0EV7tNKR/cdTBKnCu98mIhT120Q3/dOQtmBS3LR74Ax?=
 =?us-ascii?Q?MXReHO7tsSzDJ7jPKUvFoztqI6CymWXlGwc4ew/uDN7h1me/gjcl/gdixwIl?=
 =?us-ascii?Q?JjKdKIHgs9yiYt34KkPVDnfee4vTYlqLjAbLy2Ke081NJwqASzOQzTDr6a2K?=
 =?us-ascii?Q?3Sp0pd1zeIe7LN8LxUAxaDfMfAQ7jg7Qo0e3a2tTS925r9WZPt7kHADxPCJY?=
 =?us-ascii?Q?bVIDF1B8duta9NkkkKleoqNckRSL3fVowgJYRIDB+B0vk3ocKkfdsFYNi0Nu?=
 =?us-ascii?Q?TyvhCb1LvykMQqeNXIdNbCQlb5FyCiyULrX+RPYbMyKvZDldJ3n7fIUZHThF?=
 =?us-ascii?Q?4TL42lWMfonlDt5b1dPX1IAnhUEte/uJnf2WdO+gaR+mhZ8+8Kk8qoKl8+2b?=
 =?us-ascii?Q?ETcdACbnJShaqy6aYj0M0VdbMz4HDEsdeQjrE4S8bagtKK/d9d1YsQtncXrK?=
 =?us-ascii?Q?qxABkJY2waWWHHt0og1hKSkFWTpKd7vwgxVTNxR1U8715tS76yx6Vl67Lbv0?=
 =?us-ascii?Q?wK9/3PZ/5W1LSJ4HZuzAeLabyUzddYH7gNFza702LROzChfgHGcdd8PiIlHX?=
 =?us-ascii?Q?ynZB6TpBVXLgswdQ1X+BDfSVv0zrcvdVtflaIfwAMjQpTVadpfyWwYY/kReS?=
 =?us-ascii?Q?7EYa45Yy36zsPpiAu96d9Tk2MW0qjC+tKD63jPDKs8Af4/Mj8E3oYg3OsRD+?=
 =?us-ascii?Q?IWcd7kRvHBUx5+2MP9l+NKgb9jzbt8Mdi9MNbnGX7+8nKNnwlJWBkaPDGL2m?=
 =?us-ascii?Q?lVn4nsybjNCAhbd56izvnrjJcUbHFWPNKMHao5sCnB6huHnjVmx2WIeIXIk2?=
 =?us-ascii?Q?ikvHz8OgGwlQ0Ni6CLYMaWQs0nICA3I=3D?=
X-Exchange-RoutingPolicyChecked: 
	UY5fYOTvgiMJpVAnENj80Zy38r89sxaol3CuTfXJByvtka95LvYqjhTZaFOd5dtSCJtCpm9LJHPHp6rHVSOLUALQUUraMawGo8SzzWmA/Xz4nf5VKTHSDCspKphvNyWNtD+3mJ99Xkr91+k6KdgaEwwAA5683kGc5/KfcT5lX5PZT1kUF2toyRwGt1qAe3c8YXF0CqiOhvKglvYjn5DQkm8C/fzlEur9YWx6m3BpwN1+i69BW/SfYNiKqVQ2HnzFGc+vmcRm81fcxzuWB3tENVDVJVDpGABkbR205WNjhTfL2tI4p9XqdB8fQZfZ7vVN6QYy1stfHv72ZGfJc/kDCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b97360-f025-4fdf-0cfe-08defbebb494
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:29.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1U3mTedwBQ3CICsowPLll7Th7BCCs/66TD5gJzuT7M95gupTZOLtDZHLlxq33/VEr2gJsOhlEr4XZre9zRyE4E4/HYpz60VnD1jgJU2VH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Cqi4XIWoJVy0xxEiu708EIeVK2XJ4Zek
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a8243a4 cx=c_pps
 a=DX7yn1dTRzwlA/k+0Vei2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=0YVC25x4kLZrtsW4MIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX0SdoIVY0sHDi
 HOPONjucbys0jCI62oYJVsBP+5pA/f7qp2UJH6GhYVJNTGj6w5WQCra5Bv5WLqRtuIi/G67YSbJ
 NJB7nAQnumUraKBCW1G/dN4BSNy9r5hR5XFBDoBnICodTmZdLk7lRpXmbqcQ+KmMf55glsVf5Lr
 71aJRSG2kGfA9G4Y25DTrpqNvXQRl9gBPHLr+QzYFyNadh0iFQULJohSXJ1lkSW6tvDl96HX09Q
 SvL/omh7zL0Iikm3pmBQNPoy7yICu/8MpDDZ4BBcMqoHjX7DbqhBAk1u0iD1Ob7H2W80wI5feIF
 Fv2dfL2/EmTvzTCoF71ut8SwKtdzvG4/1GTGhJ7bKtxjIcOSQ/V4TM4/stvxAtLvkPHCI8BK/Kt
 6FvV/6ZqqieYSPk10S/riJRDYUwhbBQ0S1sbevExEftia/6lL38aLBYcanAIT/V+Vx9KpPGo9YE
 OMpH1C+T36KcfDyW9Tg==
X-Proofpoint-ORIG-GUID: 4Hit1RiOEOdgNtBe1uPQ7r8u3Tg2oqGi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX5GMmXMZXbHAJ
 1SZaYnbDP1bNnFuwzCiR2bao4gXZemCqoKll+FrlRpiEM3/3qng+wMWxQEZ1ihWoys92KgzCdxQ
 cMe+p461MYkVP99vBKgZdZWGXo3GjqUPA56PoQDR/YPQ7YwhlVmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243577

rpm 4 had two dependency generation systems: an external generator
(System 1) and an internal fileattr-based generator (System 2).
OE used System 1 and disabled everything via:

  --define '_use_internal_dependency_generator 0'
  --define '__find_requires %{nil}'
  --define '__find_provides %{nil}'

This meant pkgconfigdeps.sh (part of System 2) never ran in OE builds.

rpm 6 removed System 1 entirely. For v6-format packages it only runs
the fileattr system (System 2), and _use_internal_dependency_generator
is ignored.  So __find_requires %{nil} no longer works, and
pkgconfigdeps.sh now runs for the first time in OE builds.

pkgconfigdeps.sh --requires generates both "Requires:/usr/bin/pkg-config"
and "Requires: pkgconfig(foo)" for each .pc dependency.  This creates a
sstate compatibility problem: packages built before the pkgconfigdeps.sh
fix (which unsets PKG_CONFIG_SYSROOT_DIR) have no "Provides:pkgconfig(foo)"
because pkg-config was failing silently.  When DNF installs a mix of old
sstate packages (no Provides) and new packages (now generating
Requires),
it fails with:

  nothing provides pkgconfig(zlib) needed by elfutils-dev
  nothing provides pkgconfig(x11) needed by libdrm-dev

In rpm 6, the correct way to suppress a specific fileattr generator is
via its per-generator macro.  Set __pkgconfig_requires %{nil} so new
packages don't generate Requires that old sstate packages can't satisfy.
Provides generation (__pkgconfig_provides) is kept so packages still
advertise their pkgconfig modules.

OE manages build and runtime deps via DEPENDS/RDEPENDS; auto-generated
pkgconfig() Requires from rpmbuild are not needed.  This follows the
same pattern as the existing __font_provides %{nil}.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 51ad195baa..1e016971f5 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -599,6 +599,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

