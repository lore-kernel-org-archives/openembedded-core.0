Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AAACD5BA9
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16405.1779175554216267480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ADP8Tb8A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40F3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ry7d7sFPetiIAeT/fbBz+52BhBojJRyXL91p/N+RlHY=; b=
	ADP8Tb8ArMyjz/QyPZ5W1wp1tog67MbxQ+94f/liE1vhkeraBvkFgP3gS8gIrizS
	xfBVpnIrdRV8JepfnIKUWvr9WN/tgkTE9lO3xvjiWLDgcllJlpX8FJ1idEkpUAda
	Vkms+7kRkk/tAk1zMVdP3HGuxAQo2x9LsnrcVbRSjY8MflVjL51tpX91EaYlYbAe
	9Tttzbx60lZcw26sKN6GfGVdxvFuop04C+3sMqjeR1uWpo2w8BIVoScXJvcBLww/
	sWeQH7ou9dNLr3/Nmg4poDkSoYBtHRYALA1pMkxPmLVr8aU9e0OfHB+zhBx83Hv4
	BoxcuRPEpAU8xaZbyGfwXA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWVf/dWSQ9l58y85kTd5G6ua632ATdtt5PydvTqLnezvPD5LpFEBgDuoBcBbuzISmcBK3CH4xwXYYIwiMYzCguoOmHmKoTyPfK6Fjq3i+FRTy3T3spdvm9QJQtornaXeBuMfOfNb6r7EQpFOba/LD5C2cqILM0kooY5NeKapN4yfDqAl/kGThWL7URgf5rBLPnSa1tZz2Zo70jt3gZEYvBIJp1ixD79KB591DVEGj9Sa9oNHyWH+xz6FqPW263OlupCpmvJmnIup3mytx33xFUJVbheN8uAdTA/tAz2oHydKvVjAymDsmIzNTP5FaXt+KghkiI5lKI3hh1CPBsIlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry7d7sFPetiIAeT/fbBz+52BhBojJRyXL91p/N+RlHY=;
 b=AILmUA/1QnWJ0NksnY0oOZaplzSZGY60v66dSoVFlLCat5TGqdlVpbj3LludQZjmpFtW1gsmV/Kv1CXnbSQOEP/zxjlo+iBCEoRy1LM3JKt7TQuBbl2Y4Yy41qgAdaqojTDKw4FdDCCmqc2WHtP0Zjjnk1/SYC8NPgmviYXatdt0tUz7zJ9t/qKFZ914bBZXPWwOYPzPY+469BinP6Jb9VY2aERliUW5LFwHGf9ZXsJTyNZjYRsXoKse3s2JRjduYE/lsFV3GRuAY4gYchI3c+kTx/SNglvom0rOeRMvJM0QcnjuBoT40TdevOJUG0ibxJNBE4YP+CHd9mMvR6oOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:50 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:50 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 03/12] glibc: disable automatic libatomic linking
Date: Tue, 19 May 2026 00:25:25 -0700
Message-ID: <20260519072534.24588-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f901a44-ddd4-4128-40ce-08deb577da50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014|22082099003|11063799003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	vOtVS/KWZMoKY8D3kFcFv1umd09/Z9sf+aylxGQLc28dXYK0hpVR0xaEODDWAmHmbP5qm9EciAaGjAZQb+9usfUkcJHBLRPDWOdDa+jCs6UGYWIkVGsgm9Gc4TR8vh7t98Xyurr191eByromKC9phtn6tz7V93IrRcT7GvNyZZVM/CHzYtF1oFdH5hX8jdimc03BAR+GcwYLk0IA0ONIW2CafkQnDOa07LurP67ONHoCLC/luSrVvDAbUR+g8Xvkk7kXy74pd+Ta3ceqDBiHKeF2EzBDAgrhqTZzBjbUMC5xMjUxbFZirMtZvn9OXAgSWPRqNe4UfXzbf70cBqc76mp16vvS0lkMFwCUop2Wl522Piy8jJw6PYLH8wiHsvtEzToySFO1psJK2QSNag7fBLcls+xrp8hO1YAbQwpLCcsP/6T2ljN1mWXVJ5MG/3QTQhCrJ/prWuySPutBHbMLpwf11mjcUorTbnOxc37iNUW+nuOQMh7ZZdIyQUXdr+b6jZUbJfaPUDOWV8oq2qY9uF1Fk81XzPRQpHb7dSbmxrdZ/vGQXtmw7E8Xvwb0JXCtSKQSvWOGGm0DCav54KltdoivOnaboZRp1eBkdfOe/ociYj/sWFFxmvCmf8rm86bcYaHoX3wzEEe1G8JmW/xABrB0i9KqM1m5cgzwMqcnxCM7ViS31OyGJLLLXXAlXw1JT3GDFIXISdXGjCMm9mSEKbu8l7l1Z/rmLcXMCMN7pjcgAAWWjhFiZVXn2IdMUv4x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014)(22082099003)(11063799003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4F2CE6sTt9Zmmm3BRnzBCNyI3Pu+72W6IQJo8l+3F8Mc7XKpOc5RHiYMpJq/?=
 =?us-ascii?Q?nl+VVBHcBNdyQVoWSogNKXfMVLlI6MSgVZk3gizi/BQy2PQAvnHJ9uRbR74C?=
 =?us-ascii?Q?Dj6duedt04TcUH3b36VBExeiJ2etHuSAAWmBD7Fk6LgBrDfJPHoMNFwGFK7D?=
 =?us-ascii?Q?7XAFe2mIEPkQby+z+hU2w9GvE4lSPFbG1ozbDQ+K9UjC8JPoTmbLZ+i/ys0f?=
 =?us-ascii?Q?RE5SER+hYnQKn3R4Nl/V1fc3YDvPpmBxtEK0k0H4/pVXbNcUGsA4Lx80uB+l?=
 =?us-ascii?Q?wKnW7gWbI+VSUQrOdX1OTk7OsaAbZHJIaa2sYV5vDdUd6o4FDK6dez58yjEe?=
 =?us-ascii?Q?7ENYH3DKzgPYmy7cl84EMr9MyRjmo1uTYZqBY+x5Crze3XzD+r+fuB0E7EvV?=
 =?us-ascii?Q?loAr5Z8MQ1Te/oRG/9WjiR9tdM6LL9JhxpscLi+Zf8eoua0pSKFn62UmznkR?=
 =?us-ascii?Q?xT49PD9KotEUw5cFzCruUBeMoUI2X8gZOW63LmLDcRfn2d4kS3k2JVjYf6+m?=
 =?us-ascii?Q?9OrleIiETP7vcgfoHWh5JkJ64ixfQg1FDamPz16q4y/Uq2bbSbP6Ng427AlF?=
 =?us-ascii?Q?YEEZNmlMZ4JZRIBg9v99RHjkGS2YSaGJXZSS2dtd9aS0BCWw2UNZGDQGEDUe?=
 =?us-ascii?Q?6M6fWQQOXyWEy/D4klR+YZbB9MNEF5muiiZvGqS6h41kZvjxx81bXF2U97Kt?=
 =?us-ascii?Q?2/FuJeZz23mbPY8h375ey1upSRFkItjnSVDwaxkc+H7r54jIw+7GSUteP/wV?=
 =?us-ascii?Q?tdu+p7TpXxARmEeMSBzjqtJ/5Wi4ZzYkJQ1GJSRKKWlCIF++8Rm03Kl5rYo1?=
 =?us-ascii?Q?H2Mxr6lg/ImhFBBkREV32G52QDOrBAEo3wP/dHVInTzIypmLrAIZjnwA5QkY?=
 =?us-ascii?Q?4/VYw7XJWY5mmr5JZrRUhMJCBBJbX3L2DaRBS6ChkPw/N9wnevB70Kfvi1NI?=
 =?us-ascii?Q?9tbGu3sedi8pwRSCcUIOm9cRQI07BEsUAQLSyGt6JhSncgBmvFti5wbxYVCx?=
 =?us-ascii?Q?crN5vuONzQiwWFbrpzYUT2KCMlZQPfL4Bfc6h0yzcVDavkscB+RnJkX6snpb?=
 =?us-ascii?Q?ZVo2x7k2uElwSoR18bNmNNV8L9q7UWT7TwOHyuIXtyu3fk3ZRdgEVSnQU2RG?=
 =?us-ascii?Q?P29g68giXzVzJXVl73iRSjGov2GSAiWAz9ns2T1mGH1/kBOR6UcfTc2PA06O?=
 =?us-ascii?Q?K5w9gQyjKob0CRUSNeAcV15WpbxULaDscolH2kwCA+RWl/TyUpqYWWCl76vH?=
 =?us-ascii?Q?UNaPWI9+LMIPSGeTEOnA2B4y105Fqbx4uvkQFBFc2YnTiiqlQ+xQwWcoI9bF?=
 =?us-ascii?Q?IBb+c7KYXHH/aNjs9Jr8g2eG+wLwOFuB8s4KXrwkyGPQ2hPC8dBGfJAuZlFM?=
 =?us-ascii?Q?/nhWHpGTkniJUjqL/qECeK/bK8em/aLIKnMtE9XGwgsggXyHDFhGobiu1WWj?=
 =?us-ascii?Q?uxbXzdu7cigK2XsxRSi/KespIlGw/PoqHY1YY2Pdm9rQQPjojajYrRwHEkzJ?=
 =?us-ascii?Q?31Kov82YoJOu0a+in/xGZlzOta+Vbd/X37L49H4LZAgtuOf4Zk0tqXl0kPrh?=
 =?us-ascii?Q?ugAaYLcUNGRBDCoMAl0HUF1Rw4t2H83ItQj6/tHF4dTjSFW9uobPK0Ae7YE8?=
 =?us-ascii?Q?dWg8GdacGqa9Qpf9j3qVqO+QA+PfLKxNptDWh9sB0sRHd35ULFcnydYULP9p?=
 =?us-ascii?Q?KEM/UtxaX3DoEDUliRrWWUCD2SKEAV3hC1rq7AC8kVTudnR+ouHYZwbNpGC5?=
 =?us-ascii?Q?jqUM9JJQ2vvW+O36Xa0i/Yz4Aonhdss=3D?=
X-Exchange-RoutingPolicyChecked: 
	MTnA+yeLNLTCVurt/i2tODgX141jiPoMINU6KxTBLFXyiRBdlrX56bx8OjMyuQeIuQdxQi0/hTJ3mGfRHKPN9MFa+E3mEe+xKJCDUqLTcENAXfhvPpHMkVjSaQB6Tf29crOyliNuPiwHnWr/q+KJkCf2KgrsbTpNOrVs4TJbJV9w3zdemLMA95nsnGauIYtMxVKPS5SKO8OeI8BbWhc+unxjSMdct7XeLBqQNWr8QRjxVv7gZvNVMad6U5/MuMzeuYIyg6zOjoen5ZdoJp7qjio3S9fBPd3hw2O+4J7gSWjcUOCKtdWOUyU4a1WnIMdMloWbMAdN3hH4zWVPESRQxw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f901a44-ddd4-4128-40ce-08deb577da50
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:50.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9MbAi69KetN4rAtDDJPkhcRBl6VOLZ07QQcfgjuG4iOiGurRCW8ErXiDqealgu1g8oTvHRcJ1wXi32ipkUMAOq/g/bw+3EwhxS2KsjVXJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: NwxobapHQtm0VtwJT6Uyepk9XS30cYec
X-Proofpoint-GUID: NwxobapHQtm0VtwJT6Uyepk9XS30cYec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX7PhNXDc6vZn/
 5W9uzIULv3lt8ckcjZJKlpCDzUZiw3RaGoSk/tIqnqpdMZ8AfysOoC5jV0NLEc+k/dRyubmNzmc
 mgsNGflbkx8XdbLMwXXnN6k7S6S+ix7aDQyOUyPHS2/B/osrl2UJ8mbbCWJz2GaUZHQ8B/55YxE
 rdGohINBsRHni8SKKV4BKMf5IQSEiTM/pJVUXe0YND8E2nsKpctGy/4Opz4dB0hD9ir7BPPkpPD
 9GTCDd4j1w9dMofBWHcD2kz4BN1GtRUMZlgAjGk+ro72btnRZembJ/pTQqoUPHhRhBzjJQrLrK/
 XkIL6gwhVNrSrdPMCmx5rp7rEtx9nD8TCPc87DsJb8kcuqgmOm2bL4gElUrp4EczrjVj+T97vUc
 P0P5QIIgUIdAO+42+RRpOaqowmnINjZPuY3bEycMTjzQXoHCheNngCaHzy6mr1h9xJ6yX5o4oby
 fYWB9EPRi1EFE9Fm2AQ==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c1080 cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=_ZnwpK3xq_8UVYgt9nAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237276

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
When glibc is built with a GCC 16 cross-compiler, the compiler
would attempt to link against libatomic which does not exist yet
at this stage.(libatomic is built later as part of gcc-runtime)

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index dae087d53f..751cc0c572 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -46,6 +46,9 @@ EXTRA_OEMAKE += "SHELL=/bin/bash"
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE += "KSHELL=/bin/sh"
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-- 
2.49.0


