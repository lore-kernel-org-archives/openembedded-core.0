Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5C3C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:18:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41981.1784701096580465829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FeXA/4N6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1663723a73=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5MUgP194463
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:18:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CGHBc6KlL
	NZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=; b=FeXA/4N6B+stAcnOTodgS8fuR
	vyD06008EOaqeyvSUy5P72ABmHLJ9hw8QGeqdf3s9y1KppgejlG3RN6f4EQrLR0V
	um9RKpVu9H3oLlElHo5lu6Ezc610f87GJtw9kdZYZ5IljQkgyJJyoj7GA/lbtDeL
	zKwTL+zis++SfZE5Z6uTxUy5YUkiuW0x+nrI5X1hRFhx8UTMYB/CLorrofOfW8Vx
	jqsa2mRdL7FbEiqarEWv+wtyZGl87DB3C1OAS91lsZwiK10GkIy34tVku7ERt1e2
	E37fD1r5p02Os5j8OCtJhWZeFhG/FiUz7+4/hdvrdZ/6zvGy9b3NXDyVpHubQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg4ryqdv1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojlgBG7Hst6teYe3T1okGjWXtvysMd4d8GlXKd+V/XJq8os63fGho/4S8Ni7i7ZTaufMcf2kw0P2I1p1demFXwwYWssbpeGgKm25AvWLLlQNZwV+kXhZODmigy1DGpDoSVJSimNCfM7NOVHZ9MPS45PauOpVV+EBVxPReHWgp+zlLM2hr1/ApN0IA1hlgr4QbBJdj9eN7AjKffYc+UUfJzJxhkIBhCbUjg/RN8iIXhuswtfYxZMpqzjki99x9UH1/bVWXmi0JPnG+DCBsVS9safcNL48VamC0Frhyf+RsNTFPDjBm2OmThHvc4/9Y+V8ER1hwwW6AdidKSK3RhDuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGHBc6KlLNZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=;
 b=gB9e0h0PzKPHCxHbFigJXN7aIK9fbp26gGK6cBBnVlT4uQtFZRSax7ENdkUlv56g87vr7AO/4LJrQeGe4z1WoBg9rtH3/GdDsbIidkjzdMyiHeKwSYoOIXvNIdA9sGno/05QVOhpLSj4NWYIhLBRP/ga3dMM6yTc+kQbywIgCCeJAtdLiNv/u7OIHAfTE5w3H7qvkJlJGG6cPQO23kN8zmqASv4vnnC0FHbfND7M2IEu/jBnyNXNedQnFWbJEq6fG4QPuU0mnGFvCOZoEg9BXtVwx10oFxfjuQl3dqeZKj2rY3eLqlTYuHPUVfy9rP9Bv/SLyn+N10cNHrcIEVQhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:18:12 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 06:18:12 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [PATCH v2 1/3] rust: Fix reproducibility with shared source trees
Date: Tue, 21 Jul 2026 23:17:53 -0700
Message-ID: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ceddb6-4af2-4dff-8ae7-08dee7b9020b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|12006099003|18002099003|56012099006|10067099003|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	7rjQRo/giibspIGlUljA2VjPAT7LTLLCtHFaRbEq/BBN2h5IK69g62e9gmX3zFhafogVXinNKO5LboWja8ZZ0rSSzzzTspjALeHyE4RC6NaCrjF4XBuLF/PIK1TnpmCFypEdEMjpdzqTwu6aWVS0QxrDeNp3xu63JCQPCXe5AMSnPY799YGzg9hBvHMMBfEH0UEQfZp/qpgPsLcmSS34MbpmaSZ/RNmERj0KRG3oDfp1fWRWusz9FeViyFFF0uCEsvhVwTMV6qDrsFZNL05Kwpb8G7JzL96UHSi4MlIsTGQlJOk8C4sj4nt/me9GRGJWp3RU0S3w4vsF71cUtbYiPTYCcs2J/QAiEJhtq/oiIAGjHRhd+UGG6VyD91wnxWRD0oBpkGUg5SF1Secz1qPmDg+Yl0p7eJGAG+XMRpaJQcks/JX9g/8MXjuGdLPoH8nwww4a37fR1P9iOMqtEZz/WPbnJJpRNdaHxRlE3H8fDStA6IgpUilYEOqwrjVxkrzARL4KZS4o7oxnlQDASVxcnRS+rYEdFmI55ckk+58BgTwIn3jbxdNj+MFIt4mo1PUaPxcAYj/aXXdetYXxXtTCeXXrWkDQhqg+9Bj3h2txSwQIiYHLc0YoIVJhsQrWfEJO7l+QVS5RleisGjCD5H1xc0p5vHU6otpB3Q2g6dwGKI4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(12006099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a1xoamSaCuCGptBBSjno4vdGf/U0txMxs8nMLgJ1Fq2dElJj9rn7CvBkMbgi?=
 =?us-ascii?Q?v44I1OyqiyWWeIxRg74sHl/LOEZhXApKrmUO/qHJ6DSxPfz0sm3MuXpWujci?=
 =?us-ascii?Q?o4jF5joeBIWvE1oZmK0aMPSGjd7D413hLzcjE7TKWNnKmK2SLvTSOOddTsQg?=
 =?us-ascii?Q?5QQ1Mn9sQz5WqUgAFeR/+ARibJsueo/sXURL7dNOgyVgzk9ViE3HkqweeYf6?=
 =?us-ascii?Q?9qYHmRHw+lf9Mg3qMObvPDVVVvEOkHGushhI6iH2n0tKAXMJ8c8AMHpk7l2K?=
 =?us-ascii?Q?oBYwsrPG8ChVWMBOIHUqIsCGaU2ApP9Ivcz+kcbncCp656BrqifHBHQaMFKb?=
 =?us-ascii?Q?7fyATmbQgFgj82iXLzmv3QQaCYeiXMbJJXbDQz3vPV5gI6pd2ndqLnBH3QEc?=
 =?us-ascii?Q?yBeKI4iR1C7HnbNxL6SMxLqEdbnUoP6sgPHSdmL44nN73FTBa1nSkkgl80Ld?=
 =?us-ascii?Q?xx5E5FGvQ5ReJYGNoZ7X52EDWqF3to9J6OjC0vjIbR1fRDfO+J8PIVmhMTr6?=
 =?us-ascii?Q?DU14PP5j+SuZqCGa4ZdQ6mq0bkFbGDeEQkGKLlgnGKXv76p1t6kJS4+ObbIL?=
 =?us-ascii?Q?sUpe9uovhsrUjfXdZGSzAo8MQrjg14EUYAUQ04npqsGGCXOV0C8aDsoI7nC+?=
 =?us-ascii?Q?GCsQxg+JepgHKKIo39tSvy9p91bo59rs6XcbF0ZmGUOI5ce49iNYmhliIt0I?=
 =?us-ascii?Q?d3Or6Nz4tv+CqOWpJ9EIGyPuB6mXZ005wW05YfbvoeGlhWVfWI+FnMvuBzPE?=
 =?us-ascii?Q?32YR1VJ4DrkWBOZgKcn1dBAfun9R3EbdvrNthhgMTeXyNCtsDNM+Sxe8vRuz?=
 =?us-ascii?Q?iniyI5/EUsW9HH+g9wzQWHp5Quune4PYi5LeItFlVamApoHQhG9Loy1oS5xi?=
 =?us-ascii?Q?zgklgW/EHxXrg9SbzGChYLPvSFezMzNQ77DdjASZIcxXE5JF92Ww7d6CvGcN?=
 =?us-ascii?Q?fQYvvXYjnJ84iyrfg1THQNwKAGldEIykLiI5XkbWZRoMGrp4mm5jn0dGlsM7?=
 =?us-ascii?Q?ZXZad/4k1ugJwdy3VUTNrBp87Z5YPKl4YIztY9A+SVISigYB/F22cdulY2OB?=
 =?us-ascii?Q?CBgo2AfICFzH5RM67yKWHQQtBsx+LAyEF/LqOfHW4qY+Tivkg5Xxs4saX7BI?=
 =?us-ascii?Q?YcYgBk+CY8Gs2Mivjl0jpLy7OfEvKmiuoz19XPVeVEczt5hx34dJ7Z8FvOp4?=
 =?us-ascii?Q?Jm3Lm1laY3EyHh9RnonOkUEtBdAKuqcYowCBnLkkYqb6LYD6u91QctcNFqo2?=
 =?us-ascii?Q?pUJlsQJN+2zim9aD3H6Um6dAY20O7kKYW/RCw3rOHMHFuBI2s+zs3ML2RC+R?=
 =?us-ascii?Q?H3Q3jMlhBDTPbydHJRsMcUuPI5m/qxgJsMbCFAX4xJb7MKhOM5jBxsJjReZn?=
 =?us-ascii?Q?Xd2XZC3xxFlVsv/Pwm6LGTSXtZdwjD9l+hFrV1qkpKQuIg+TkFZP2/n2Oc8W?=
 =?us-ascii?Q?L9ne+ds0HzQQ4Gnbqc9hQ6Df1+4f1H5JUxGih48Pksj69wK9OC55+8ImdMDr?=
 =?us-ascii?Q?YqRCdXplkE+K9XHQYTdOAiOHtyfcgZOu8QZMcnjm1uCZYWzA+2R2fGPOAw2Z?=
 =?us-ascii?Q?mBeTAe5VYauk7+vIc7QP65Fk55TZtHD5KPxjaDqbJg3pd3VDDjpnGMvSdPpa?=
 =?us-ascii?Q?vle4O+c9X71xF3fU75V8JnViSJejLMY8sZdfz9DI1HibpQpI/gMo+hfsEMw/?=
 =?us-ascii?Q?xtiBiD/S+hgvqEExsan4yNenRFM3UKJm2PFZsDGVRIZosOaH7NRzz4M7jv+V?=
 =?us-ascii?Q?wsTFZPB7plrb14BlEpN9/whOhhgcqzYd9MWr8Er5Bsi0KroawmIz?=
X-Exchange-RoutingPolicyChecked: 
	GLRIQt1roh8p2Rw5feIDKhSl8ZSpJyf4LSZTsq9VpfSZGIjmlom5I+arovRP1QRWX+NlZR0uIEOCVoyEMudQ+w9JHkdISPG1mygDAKztEBTqewt6tgt3lnMGWpIIJVxJBiBMn+P5/84Dv5P7zwk3gESMs9Rz5N9e9zD4C1tLAnKJZp/2mjbJAS3PINLOSk/lvUnnWgzMdh58ZREcwYNXqk/+q+Lq8kjKoAiuJiJVIe7nI0Z31PjPKQz4S/b4AuFkz+wSHbH8laMnCRnjfl1xn60YwTmBTA9NzAL57RsbWyRGvwrH9iQ+K8Z5sFsuaHnY51V1+kpontnEElW8BxN9UA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ceddb6-4af2-4dff-8ae7-08dee7b9020b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:18:12.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pj9Ht69CwcrzXYbELLBOfhHzM29FjMfZEuYJuRIdQk69Z5GFy24aa18iG8Z2KADSmyuOxQxppybAce9NkrMUhAR6ooaGqQU7rnPGTLdoXaSCq0Rt1CVgWlIX7TEo6Cv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-Proofpoint-GUID: 6PhCwUIm-sj3ar6fGgPaAID_Vd6jV6g_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NiBTYWx0ZWRfX7rGUc0zbkqYv
 yxOHK4xuTTlSORe/afNxUCxvoD2jagPzpNVpJgDcV/WhJ6/tz9m+7IPEFEvhMPLWneGe1qHz3fi
 DMFOfPYJ7liSYe2XcHEP2X8AINJj/XanjLrKhkvWu/GM/QpnIcdD
X-Proofpoint-ORIG-GUID: 6PhCwUIm-sj3ar6fGgPaAID_Vd6jV6g_
X-Authority-Analysis: v=2.4 cv=CfQ4Irrl c=1 sm=1 tr=0 ts=6a6060a8 cx=c_pps
 a=nfJ3K52CLbhVQgIdADXVOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=XTdeb_U8USiAPbms4-gA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NiBTYWx0ZWRfXw7M6tz8j2jCD
 cGAe0Zhd3hszXwkvrh9ajxLL9cj71F+Pay3cAMNenoJ2n6M1DOD4gXA8TpEoTndvLtIoGYIemxR
 YWGt2qBScQoJ2ldjhm/Pk+LEZrK4BM9z3VKcR3uBnGcO+TqngG1CmdXZWkOT9ftEt9DaOtdRkrz
 +bkPAsim0zUjjH4jHeUsqXwskqFUHAe3WbM2YBnzCZhWNtqSnmge+Ptj6wS5mEg2PAvEQJz7fgv
 dRECMQhf98l642nubMO/6OOGJIuwqJdgHunIOMH2FERr5IUx+oxnf45zuYiXhNcZV5FzZd36KJr
 VyJWFonJph/6V72FR7SVIwJvXbssUc8+MzsnzewNJDowsg7g7TVi4aleTLwWooYyeMCyv082ymR
 7Zuev+YrMXH/wBSK7Wt030m1gAjirHuh8i460oVB1mDA4zPlQxzH4ELgrAmitMsMiG5Igfvxxuc
 xKYr8+LYvTresF0zfVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241598

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport an upstream Rust commit to fix a reproducibility
issue when Rust family recipes share the same source tree.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ild-script-path-leakage-in-artifacts.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch

diff --git a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
new file mode 100644
index 0000000000..8c93624df7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
@@ -0,0 +1,28 @@
+Backport a commit that remap OUT_DIR paths to fix build script path leakage in artifacts
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e743a4db62336027dcc1f1a755f4ca35f56b67df]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
+index f785254..0264667 100644
+--- a/src/bootstrap/src/core/builder/cargo.rs
++++ b/src/bootstrap/src/core/builder/cargo.rs
+@@ -1077,6 +1077,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
+@@ -1097,6 +1099,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a8d8de7165..5678e00671 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
             file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
+            file://0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98"
 
-- 
2.49.0


