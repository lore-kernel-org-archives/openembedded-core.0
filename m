Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B14C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8298.1785320816720152092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 03:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XadlMdFL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2670d174d6=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7dLGM844633
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=H/Qqr4Gaq
	b1JYUe+1+pOsSsJtjxrs3eGPYh3lseEWWc=; b=XadlMdFL/hrv2MWeUqvaPoUl4
	/fXRYLzfWpjgUQLlNOpVWuN5tfJvEoi2k2kwnwbPHANQi+YNKtQr5KohMpFQviOQ
	X5Xc4b01dHnVbx17+q4xdJIKAgl0l2VLG4fxY10v4wOAZNbCb5Y0BmKWtCs1aI5X
	3ydYk+Kgb4U0cCOVW4rkEWQn/O0jwGLBqu3aVtRoqf9VA+fnRj8B89f2yv0aPme4
	eOGjORmgVgoJPa1glQ/+POwcBRzxxdwEXLrrt7P1AvEf21ML6avnu4/QsXRFm4mL
	ApwHTdU3jqetnke5jaamcj1SADkpSJdV5b+iBppkqcNcmBEKS0HYB/WELNC1A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq877ghsf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:26:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUredjgWAuBNJyka2FYF9C0KZT/8h96vtFy8IfUg2IB+VHykkLgKXRxc+72Tmnx6a5gwINp80gG2BZCVq1ZxaRxQ/iPJbofayKIEySVBD5xEQOmXPDgc5vYhDpm2Kr6tSKeaJCsKJCU8Gw9bOw0vsLRUF4WIRPaPijSsC6189F/ozzeePGmt5T4IxIgZlunRI98eQTx4EqjanhmBG01ADgjqK1UymAfZEbqs4nuLkQQZ+50t9l5GeDtek8S1qGTWrhIgs8n52LgPoSrXM2wIrw6GTnd0SkHWURgPdzUe9Cn78r1yC4MXk/dlWvI40ROAmz2P8WJ0ddoMJn0IjK5uGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Qqr4Gaqb1JYUe+1+pOsSsJtjxrs3eGPYh3lseEWWc=;
 b=rhMWI1bAKpHRw7qXue08UaDPfae/HOI+KTyoKvE9U95kNRC2/4GI86J+Y8UpytTqW/kK1XnfExj5h+dVUW72b1vmLe5y6aw0pcKCwKydiQkbQVw0WD/9DEOqybjVVMTRL5CIL7I63HJ/Z/UHW8YCKbzKifPPxgD0IvAEmSdCPQYsEFR1SHUAu3GJr3bNJS48btzK1RSNe355X2gZhAbXDYfY1JuVTXAu9lc9lb6TjtHNrNJimDLy14DCGH/8MBzEgErlQHFG6cidboGgCTnps8WA6YIaE/jDp0LtGVQZ7Ag/yWm0uNsE3Bp0X+R5qq8zHT4bQMObBgLssO8v82uFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Wed, 29 Jul
 2026 10:26:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 10:26:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Upgrade to 2.47 release
Date: Wed, 29 Jul 2026 03:26:01 -0700
Message-ID: <20260729102601.2542218-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:408:e1::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d31ea9-07c9-40bd-bf0e-08deed5be787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|52116014|376014|10067099003|56012099006|6133799003|11063799006|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nMXrX2K8MHn3MzF1/dIjUk9hgJxRyilnyrXjE70AdUa2JA5X8tIELgIK7KiXBXwlh3tybpBaweHL5uzSYfLNYyEvV35HgwIFWm+ERqo+Fna9neohP2GLgn4gr9+zBws3U9nNZy/iLJER7mpuqSc20Y0rQV1Trp6dbDP5L6YBHRFXQamX9KIPOrJ9AOdxk+GOyJvblfbetZqrFeymnDVgixy0ng0eRlelxX5OG/BNdmY71dVpNhZgaSR7LnkZDKpAhd7WORUn+T4S/foyRpgBe32dWFj6RCudi/B+ym6vwRJYIZDLvhJan60YsUPGAd2/c6iykjIWJ+RKJdPOHYl8lZhi6pdgLGym+WM3PlhEAmQiUYIJxX0q72lVykxaXyNv/G4hELm9S5lJUrI6mSEuBV75sNVaGS4IoRRdaByy22Rdvxsthgnu9fWTP5U/RSfdxrXgk55GFOSLu9W95ZmemtGYPX8U59td5EINOLcGbJvo8KkvsN6pr5mzxRkE7lRQySfPppM0jHNAyvPDzYPeZ/ktRJ2PAnLYi5qGxb6zLeuMTDQz/kcgiaWjLsfGB1/jlkRN9IzGoEM/8ukA3yVScmEyvQbXSsdPcbQXyQo3uvguYBWSJo1reGfvHSf4KPnG9Yz7juP8qPSdpK7R8wmkdrWGfayP1TvLFc8ASpuxCF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(52116014)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qVygxlvskoRNBxZ8oEPrhfBqdva1LSNnTTyo4HiKeN2j2HO4n83BEreQR/NZ?=
 =?us-ascii?Q?eXt0f8gZhtTUtrQlewnWkIOU0kF6ddrUo7MQgROjQWwj8Lum6Iws6koHqOHx?=
 =?us-ascii?Q?UK62jjNNC/N4/p7JD4JvT6bvaq6Eo+HgtTbrJDnW1rnaTbU9+WWXGQv+cUoF?=
 =?us-ascii?Q?20I6uZwIIWlLceYJKR7fZZDHGRpoqctZ6LbGYFosFyuVkQ8muZ278th6Q/Fp?=
 =?us-ascii?Q?VSJGfFby8EQi7pdcLhWVtdkXAZej2AnmOxpKn4PqmBwjOGE+jBhqUmPMspVp?=
 =?us-ascii?Q?l6TTxlMF6ceSk4Z2b1vGHxcKLS+aM0YQGNBj2QGEd+vutMiv5m9cH13d2bbD?=
 =?us-ascii?Q?aRCHZ+Qn3l2yWq5IT9QDTHDkxO5neJTDW47BrGp/Knf/pvUMB1NkcsLjxDH4?=
 =?us-ascii?Q?AVUHTbDyo6Wvxugb3Oqy52NoJ0CG+ZuzV8fUZEfkuecaaz7s4x0gnSXdRMRE?=
 =?us-ascii?Q?gOT0afys2X2LCKvC6sbDbxOcJY7Kb6TfYlH8IABmngBXIScCmWY9HMjo72m1?=
 =?us-ascii?Q?gnNxhjtDHMOLK7RmK2QPirAjc5xFPtqcS/Eyp40i3iits0g8QCENYr0GPGpB?=
 =?us-ascii?Q?PzSlVpO5V8QTjQZsYr1gCWN8gNFZKikEJZsaKrXrvSC+qGz4odMZuN4kbb+w?=
 =?us-ascii?Q?gNwl36+xg+d3B5lrUmAcG53ajTahvmqwxEETlK4CRM9CZMyjwB7stksidW8V?=
 =?us-ascii?Q?Lfeq+ejXIPsOl/MOZ/9r/r5ti3jO5vpeYzh9OSbnUk6vg2EMg4SUZHo2QdOv?=
 =?us-ascii?Q?F8dzGTuBPmTM51qXMkIX9ughn8d+b12cRqCix8CJu5+3OEGhj/Kw/ATPepaJ?=
 =?us-ascii?Q?VgIvaqiGIj3oFcALZBbEqsYrhUwMatXsAlj3O69hBGueNzoA67QoRcVDMnX/?=
 =?us-ascii?Q?ZZrpSyrauJK04yDbwlE0YiBe4OaX5mb3wQNsaU9jcp4TLlqzE7IBrHXXaNJd?=
 =?us-ascii?Q?XsLyzRGNCLJ39MlxPv2ydRWTvEVeIdER1AOdtO53feyeVblcZ/POHu5I6lHw?=
 =?us-ascii?Q?jVyg55/ntzCtL525AzVMNhbEqWYDAv+EKbbVzuFFWJuCfAhB6+IWLfr0zt1+?=
 =?us-ascii?Q?4tLxmqODjGGfHNmkiUTx7DDmEe2XwElTARRbgq+DMLmqzDljPitFJtJB4jcc?=
 =?us-ascii?Q?7BbzWOwyHMQjmNZcJxPuvk75MklIKRQfSnxUv/t0rB6wCjyw1jjafbCOAgQg?=
 =?us-ascii?Q?T76uK/m5Lk29Hi3hL2A5AGaWMGlzRru5b8SdmGFXX7l7lfFCZpSQrcvKElk/?=
 =?us-ascii?Q?Yy1HBcJnucsVs7NnhSFN4DPFrdTow7t3NYdz3mfa3BEB+6SUVjus4bMWdwRL?=
 =?us-ascii?Q?cC4qdSQSRh4VrzdwQmidWM6Jn0IoEfhI/NMyvgFABB/RVeVNfxYe5jFyyDbt?=
 =?us-ascii?Q?7+ImKyNl2rlR/ArWFnVgiGT2flrPlUuog5hsW3HeX5gEsLxcleFIyqIfkCDx?=
 =?us-ascii?Q?m40MMt/mub0vrYJEQKv7OwuBRciqFc648Gx5XW5zn6SE0pw34sQ3ZvCPuwXV?=
 =?us-ascii?Q?g6Jvs9MdFrcym5d5JyjOqtr+gMOjz53aPOsBKtO2kAPqvsawS1LTU6yTs381?=
 =?us-ascii?Q?LCacDdP603wViDsLMTyLwqkd1kOxWotHMP33vICPAVwanazGnCkfxXk7r05j?=
 =?us-ascii?Q?01+sbcGF5ZlRiKy9chdRChYH7ec2LHOVroeZZXCHkLzNqcpli4DhCHqOWmUk?=
 =?us-ascii?Q?rXRBrlmMl/UGwFN2zKuBasasW9G6sdhWsWnlFjnwjGtIHj2VHdHJt7/5kBBm?=
 =?us-ascii?Q?hlcDAPpibfCU2XVvLxbjbQO3Yn1TSE4=3D?=
X-Exchange-RoutingPolicyChecked: 
	cs/S84js1f6Ok8NjqxYm5gApbKZj1rq26B3k1JUDQq3AjpKAN5EhB7idJpZycduBl4Aad+nadAJl4PhJd7VW6coN75msGt5tyq4wCW9ZbsWSLKa4E8Rp9Jruu3mnZhW2zyLvq1AT3dQXyB03WLKRwYZw/TQ3BXTQp4hEXid2Psq8EwBu7sumquh/BfLsgjP96mVCl2mydTgPfYzGYQF29rFAm42r5Q4xCbMelEujp2xqpgoMeWN8wjgx0XwTZaHiYfYOJ1doCeF6t/NifWzn3KzSQeFJTJS8iHpHgQ7s6EtjSEz1MxHJZTfGqksuJTQJ0nfNQVlYMQPGOUj4akaTgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d31ea9-07c9-40bd-bf0e-08deed5be787
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:26:51.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8nXtrEs6x32+TxkhqRhMIa8ud9fWChGCpWY4e8fPZzBMntTB41cDDgVRZzVVvhRwJrOZu0yGiSTmMQ8LLc+C6oXlmgXMMRj++0gnirce3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX0tL1nDGCqFzi
 SAZu+hi0eJkh4olxJvVNB2efcCd25ABqsDZwoaAI/JO7DzqID9bOzjLPPdIzOmcB+3Zu+B4mdOY
 UrqOqTNQHgrq51RTgL/HFrYkSeQc0Z3YOe1GVTUEjbCju5LKqo42mvArOS/XEPUDuBE6rzUu3Wc
 KMZkjSD1OhrRHcSmO/whYqgwcJdnZ48BqoQ4byGGEqK3FVqV4F2vuBCPaM1vEIUDTGyQR0kpYsS
 yw5SdH1TJNxQRPZr2WQMhFjSwwpa9PUQtJdF/kXcu5q84x87xZ/SFFg+e6b5ImpqC9zJvGL20Dw
 MHj+JKXet4VRuI+CBVALyfdTRsvkou0wkZbBCmbCgM24jnphGZp7pDJ+0fIcaDKL9Lbxh6pDqa9
 vuBgAz/Y+JKS4MW5Yc+X+Fsds3bhOXzIx7l7YwghMcnKgXzWAgtSq3pfhUe2qYIZdT/hUeEsd0Y
 Axzozu1wid/RNC3p/Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX6pF4rJga2eBP
 ugbWJg3l8PQEGyHdek9rDSL1TpxErx5jniqVFwzghJSt1H7ggx4qF2by22bDDzx1cJsUomJdhAI
 xe1MkAuz2gvFd/KHZJt9eXnbXD6Vh5UMVTJ1bax59dwuhe76kNRa
X-Authority-Analysis: v=2.4 cv=YdyNIQRf c=1 sm=1 tr=0 ts=6a69d56f cx=c_pps
 a=VugNgcmXu5HSfOtR6yJkXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=a_U1oVfrAAAA:8 a=wNfA8NPpZo5YRA_9xhEA:9 a=o4cQlKbrX13J-gsm:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3yV2DBr0-sbZhO6jJUJCt7ZUZcXQ_xrZ
X-Proofpoint-GUID: 3yV2DBr0-sbZhO6jJUJCt7ZUZcXQ_xrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242269

From: Harish Sadineni <Harish.Sadineni@windriver.com>

New Features:
 - New assembler option: --reloc-section-sym=[all|internal|none] to control
   whether relocations referencing local binding symbols use section symbols.
 - RISC-V: support for zalasr, svrsw60t59b, zvabd, smpmpmt, zvqwdota8i,
   zvqwdota16i, zvfwdota16bf, zvfqwdota8f, zvqwbdota8i, zvqwbdota16i,
   zvfwbdota16bf, zvfqwbdota8f, zvfbdota32f, xsmtvdot, xsmtvdotii extensions.
 - AArch64 disassembler: "-M annotate" option for undefined instruction symbols.
 - x86/x86_64 disassembler: "-M annotate-immediates" option.
 - Objdump/readelf: --debug-dir=<DIR> for separate debug info files.
 - Objdump: --map-global-vars to display global variable locations and types.
 - Linker: -O 0 optimization level to skip merging mergeable sections.
 - Linker: --start-lib/--end-lib and LIB linker script statement support.
 - Linker: archives with no symbol index support in all formats.
 - Note: 32-bit s390 target support deprecated (s390x still works).

Detailed release notes:
https://lists.gnu.org/archive/html/info-gnu/2026-07/msg00006.html

Dropped patches (already integrated upstream in 2.47):
 * CVE-2026-4647.patch (PR 33919 - XCOFF relocation OOB read)
 * CVE-2026-6846.patch (PR 34049 - xcoff_link_add_symbols overflow)

Drop CVE_STATUS:
binutils 2.47 has needed fixes for CVE-2025-69649, CVE-2025-69650,
CVE-2025-69651, and CVE-2025-69652.

Testing Results:
+-------------------------------+--------+--------+------+
| Metric                        | 2.46.1 | 2.47   | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 327    | 336    | +9   |
| Untested testcases            | 5      | 5      |  0   |
| Unsupported tests             | 9      | 7      | -2   |
+-------------------------------+--------+--------+------+

Assisted-by: kiro
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../{binutils-2.46.inc => binutils-2.47.inc}  |  15 +-
 ....46.bb => binutils-cross-canadian_2.47.bb} |   0
 ...s-cross_2.46.bb => binutils-cross_2.47.bb} |   0
 ...ssdk_2.46.bb => binutils-crosssdk_2.47.bb} |   0
 ...ite_2.46.bb => binutils-testsuite_2.47.bb} |   0
 .../binutils/0008-Use-libtool-2.4.patch       |   4 +-
 ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |   8 +-
 .../binutils/binutils/CVE-2026-4647.patch     | 223 ------------------
 .../binutils/binutils/CVE-2026-6846.patch     |  59 -----
 .../{binutils_2.46.bb => binutils_2.47.bb}    |   0
 10 files changed, 10 insertions(+), 299 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.46.inc => binutils-2.47.inc} (74%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.46.bb => binutils-cross-canadian_2.47.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.46.bb => binutils-cross_2.47.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.46.bb => binutils-crosssdk_2.47.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-testsuite_2.46.bb => binutils-testsuite_2.47.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
 rename meta/recipes-devtools/binutils/{binutils_2.46.bb => binutils_2.47.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.47.inc
similarity index 74%
rename from meta/recipes-devtools/binutils/binutils-2.46.inc
rename to meta/recipes-devtools/binutils/binutils-2.47.inc
index cab270cea5..3b2dfa4187 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -12,18 +12,13 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.46.1"
-CVE_VERSION = "2.46.1"
-SRCBRANCH ?= "binutils-2_46-branch"
+PV = "2.47"
+CVE_VERSION = "2.47"
+SRCBRANCH ?= "binutils-2_47-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
-CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
-CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
-CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
-
-SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
+SRCREV ?= "6ce87bbc521cf46eaee9a1f7ef61cee2cdfb3e32"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -38,6 +33,4 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
-     file://CVE-2026-4647.patch \
-     file://CVE-2026-6846.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.46.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.47.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.46.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.47.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.46.bb b/meta/recipes-devtools/binutils/binutils-cross_2.47.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.46.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.47.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.46.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.47.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.46.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.47.bb
diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.46.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-testsuite_2.46.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index 33ec24ff6f..529aa629d7 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -5522,7 +5522,7 @@ index b97a2c6e6b6..3e171c6c536 100755
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11153 "configure"
+-#line 11155 "configure"
 +line $LINENO "configure"
  #include "confdefs.h"
  
@@ -5544,7 +5544,7 @@ index b97a2c6e6b6..3e171c6c536 100755
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11259 "configure"
+-#line 11261 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
index 87ffc95ea2..29601e4373 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
@@ -18,10 +18,10 @@ Cc: Zac Walker <zac.walker@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 3e158913b89..be62b312a8e 100644
+index 60b62e69c08..60efa496910 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -1008,7 +1008,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
+@@ -992,7 +992,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
  			;;
  x86_64-*-mingw*)	targ_emul=i386pep ;
  			targ_extra_emuls=i386pe
@@ -29,6 +29,6 @@ index 3e158913b89..be62b312a8e 100644
 +			targ_extra_ofiles="deffilep.o pdb.o pe-dll.o"
  			;;
  x86_64-*-gnu*)		targ_emul=elf_x86_64
-			targ_extra_emuls=elf_iamcu
---
+ 			targ_extra_libpath="elf_i386 elf32_x86_64"
+-- 
 2.49.0
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
deleted file mode 100644
index 5a51ea2d45..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From 9e99dbc1f19ffaf18d0250788951706066ebe7f2 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Fri, 13 Mar 2026 17:28:28 +1030
-Subject: [PATCH] PR33919 Out-of-bounds read in XCOFF relocation processing
-
-	PR 33919
-	* coff-rs6000.c (xcoff_calculate_relocation): Don't use explicit
-	array size.
-	(xcoff_complain_overflow): Likewise.
-	(xcoff_rtype2howto): Return a NULL howto rather than aborting.
-	(_bfd_xcoff_reloc_name_lookup): Use ARRAY_SIZE.
-	(xcoff_ppc_relocate_section): Sanity check reloc r_type before
-	accessing xcoff_howto_table.  Print r_type using %#x.  Remove
-	now redundant later reloc r_type sanity check.
-	* coff64-rs6000.c: Similarly.
-	* libxcoff.h (XCOFF_MAX_CALCULATE_RELOCATION): Don't define.
-	(XCOFF_MAX_COMPLAIN_OVERFLOW): Don't define.
-
-CVE: CVE-2026-4647
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
- bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
- bfd/libxcoff.h      |  3 ---
- 3 files changed, 41 insertions(+), 31 deletions(-)
-
-diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
-index 62caae64f4e..00e0f5442f7 100644
---- a/bfd/coff-rs6000.c
-+++ b/bfd/coff-rs6000.c
-@@ -155,8 +155,7 @@ static xcoff_complain_function xcoff_complain_overflow_bitfield_func;
- static xcoff_complain_function xcoff_complain_overflow_signed_func;
- static xcoff_complain_function xcoff_complain_overflow_unsigned_func;
- 
--xcoff_reloc_function *const
--xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
-+xcoff_reloc_function *const xcoff_calculate_relocation[] =
- {
-   xcoff_reloc_type_pos,  /* R_POS   (0x00) */
-   xcoff_reloc_type_neg,  /* R_NEG   (0x01) */
-@@ -210,8 +209,7 @@ xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
-   xcoff_reloc_type_toc,  /* R_TOCL    (0x31) */
- };
- 
--xcoff_complain_function *const
--xcoff_complain_overflow[XCOFF_MAX_COMPLAIN_OVERFLOW] =
-+xcoff_complain_function *const xcoff_complain_overflow[] =
- {
-   xcoff_complain_overflow_dont_func,
-   xcoff_complain_overflow_bitfield_func,
-@@ -1158,8 +1156,11 @@ reloc_howto_type xcoff_howto_table[] =
- void
- xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
- {
--  if (internal->r_type > R_TOCL)
--    abort ();
-+  if (internal->r_type >= ARRAY_SIZE (xcoff_howto_table))
-+    {
-+      relent->howto = NULL;
-+      return;
-+    }
- 
-   /* Default howto layout works most of the time */
-   relent->howto = &xcoff_howto_table[internal->r_type];
-@@ -1183,7 +1184,7 @@ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
-   if (relent->howto->dst_mask != 0
-       && (relent->howto->bitsize
- 	  != ((unsigned int) internal->r_size & 0x1f) + 1))
--    abort ();
-+    relent->howto = NULL;
- }
- 
- reloc_howto_type *
-@@ -1236,9 +1237,7 @@ _bfd_xcoff_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
- {
-   unsigned int i;
- 
--  for (i = 0;
--       i < sizeof (xcoff_howto_table) / sizeof (xcoff_howto_table[0]);
--       i++)
-+  for (i = 0; i < ARRAY_SIZE (xcoff_howto_table); i++)
-     if (xcoff_howto_table[i].name != NULL
- 	&& strcasecmp (xcoff_howto_table[i].name, r_name) == 0)
-       return &xcoff_howto_table[i];
-@@ -3763,6 +3762,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
- 	 the csect including the symbol which it references.  */
-       if (rel->r_type == R_REF)
- 	continue;
-+      if (rel->r_type >= ARRAY_SIZE (xcoff_howto_table))
-+	{
-+	  /* xgettext:c-format */
-+	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
-+			      input_bfd, rel->r_type);
-+	  bfd_set_error (bfd_error_bad_value);
-+	  return false;
-+	}
- 
-       /* Retrieve default value in HOWTO table and fix up according
- 	 to r_size field, if it can be different.
-@@ -3782,7 +3789,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
- 
- 	    default:
- 	      _bfd_error_handler
--		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
-+		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
- 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
- 	      return false;
- 	    }
-@@ -3858,10 +3865,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
- 	    }
- 	}
- 
--      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
--	  || !((*xcoff_calculate_relocation[rel->r_type])
--	       (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
--		addend, &relocation, contents, info)))
-+      if (!((*xcoff_calculate_relocation[rel->r_type])
-+	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
-+	     addend, &relocation, contents, info)))
- 	return false;
- 
-       /* address */
-diff --git a/bfd/coff64-rs6000.c b/bfd/coff64-rs6000.c
-index fa1759b5925..f6a60433e62 100644
---- a/bfd/coff64-rs6000.c
-+++ b/bfd/coff64-rs6000.c
-@@ -177,8 +177,7 @@ static bool xcoff64_bad_format_hook
- /* Relocation functions */
- static xcoff_reloc_function xcoff64_reloc_type_br;
- 
--xcoff_reloc_function *const
--xcoff64_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
-+xcoff_reloc_function *const xcoff64_calculate_relocation[] =
- {
-   xcoff_reloc_type_pos,  /* R_POS     (0x00) */
-   xcoff_reloc_type_neg,  /* R_NEG     (0x01) */
-@@ -1439,8 +1438,11 @@ reloc_howto_type xcoff64_howto_table[] =
- void
- xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
- {
--  if (internal->r_type > R_TOCL)
--    abort ();
-+  if (internal->r_type >= ARRAY_SIZE (xcoff64_howto_table))
-+    {
-+      relent->howto = NULL;
-+      return;
-+    }
- 
-   /* Default howto layout works most of the time */
-   relent->howto = &xcoff64_howto_table[internal->r_type];
-@@ -1473,7 +1475,7 @@ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
-   if (relent->howto->dst_mask != 0
-       && (relent->howto->bitsize
- 	  != ((unsigned int) internal->r_size & 0x3f) + 1))
--    abort ();
-+    relent->howto = NULL;
- }
- 
- reloc_howto_type *
-@@ -1528,9 +1530,7 @@ xcoff64_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
- {
-   unsigned int i;
- 
--  for (i = 0;
--       i < sizeof (xcoff64_howto_table) / sizeof (xcoff64_howto_table[0]);
--       i++)
-+  for (i = 0; i < ARRAY_SIZE (xcoff64_howto_table); i++)
-     if (xcoff64_howto_table[i].name != NULL
- 	&& strcasecmp (xcoff64_howto_table[i].name, r_name) == 0)
-       return &xcoff64_howto_table[i];
-@@ -1574,6 +1574,14 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
- 	 the csect including the symbol which it references.  */
-       if (rel->r_type == R_REF)
- 	continue;
-+      if (rel->r_type >= ARRAY_SIZE (xcoff64_howto_table))
-+	{
-+	  /* xgettext:c-format */
-+	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
-+			      input_bfd, rel->r_type);
-+	  bfd_set_error (bfd_error_bad_value);
-+	  return false;
-+	}
- 
-       /* Retrieve default value in HOWTO table and fix up according
- 	 to r_size field, if it can be different.
-@@ -1595,7 +1603,7 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
- 
- 	    default:
- 	      _bfd_error_handler
--		(_("%pB: relocation (%d) at (0x%" PRIx64 ") has wrong"
-+		(_("%pB: relocation (%#x) at (0x%" PRIx64 ") has wrong"
- 		   " r_rsize (0x%x)\n"),
- 		 input_bfd, rel->r_type, rel->r_vaddr, rel->r_size);
- 	      return false;
-@@ -1668,10 +1676,9 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
- 	    }
- 	}
- 
--      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
--	  || !((*xcoff64_calculate_relocation[rel->r_type])
--	      (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
--	       addend, &relocation, contents, info)))
-+      if (!((*xcoff64_calculate_relocation[rel->r_type])
-+	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
-+	     addend, &relocation, contents, info)))
- 	return false;
- 
-       /* address */
-diff --git a/bfd/libxcoff.h b/bfd/libxcoff.h
-index c116d9b795f..e6b87975ff6 100644
---- a/bfd/libxcoff.h
-+++ b/bfd/libxcoff.h
-@@ -217,9 +217,6 @@ struct xcoff_backend_data_rec
- #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_power))
- #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_power))
- 
--/* xcoff*_ppc_relocate_section macros  */
--#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
--#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
- /* N_ONES produces N one bits, without overflowing machine arithmetic.  */
- #ifdef N_ONES
- #undef N_ONES
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
deleted file mode 100644
index e7d1c3aa00..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7a089e0302382f4d4e077941156e1eaa68d01393 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Mon, 6 Apr 2026 22:58:22 +0930
-Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
-
-The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
-sections can result in target_index > section_count.  Thus any array
-indexed by target_index must not be sized by section_count.
-
-	PR ld/34049
-	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
-	using max target_index.
-
-CVE: CVE-2026-6846
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a089e0302382f4d4e077941156e1eaa68d01393]
-
-Signed-off-by: Alan Modra <amodra@gmail.com>
-(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- bfd/xcofflink.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
-index 1781182fa6a..7f1c0df760f 100644
---- a/bfd/xcofflink.c
-+++ b/bfd/xcofflink.c
-@@ -1335,6 +1335,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
-   } *reloc_info = NULL;
-   bfd_size_type amt;
-   unsigned short visibility;
-+  unsigned int max_target_index;
- 
-   keep_syms = obj_coff_keep_syms (abfd);
- 
-@@ -1398,7 +1399,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
-      order by VMA within a given section, so we handle this by
-      scanning along the relocs as we process the csects.  We index
-      into reloc_info using the section target_index.  */
--  amt = abfd->section_count + 1;
-+  max_target_index = 0;
-+  for (o = abfd->section_last; o != NULL; o = o->prev)
-+    if (o->target_index != 0)
-+      {
-+	/* The last section added from the object file will have the
-+	   highest target_index.  See coffgen.c coff_real_object_p and
-+	   make_a_section_from_file.  Sections added by
-+	   xcoff_link_create_extra_sections will have a zero
-+	   target_index.  */
-+	max_target_index = o->target_index;
-+	break;
-+      }
-+  amt = max_target_index + 1;
-   amt *= sizeof (struct reloc_info_struct);
-   reloc_info = bfd_zmalloc (amt);
-   if (reloc_info == NULL)
--- 
-2.43.7
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.46.bb b/meta/recipes-devtools/binutils/binutils_2.47.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.46.bb
rename to meta/recipes-devtools/binutils/binutils_2.47.bb
-- 
2.49.0


