Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134C0C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:40:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34432.1744292433601957016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A1BJf5021255
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q18p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm7VWoB244dqil827JzsniLbRYYz/81nDuWTWJs/nE9uWnhRF1RmowxqZbFtuyczLb+1bF/BPNyNMwhVjcpFIRCEpyJHE0XI2n0tOaNo/Dn86EsCrT/g5Zz7aricX+r0DfbSWLNiodwpcD0Nf3iac436VLw1ZYgoiegRIyA3vd5GzsGM+Ti5QhqWx5w6taRE8YgX5keEtJUGXIsui/OvgeCv6W5oIpQwmliK7Sm+eJP+za6mL3rZtj4y/l6XakI3bvgCFnoNkzDIooGX7QL5QfLu64T1U/WLTFsnaiAYTpWbVudjhIQ3ZJh7rrCvT7RX8t9P2ePBjiPqStlepOx8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGdYfzPUKsc8jzEn3J/UMDA+8Y8oif3arGkXt/Hh9G4=;
 b=GkMQe+dELWDnKGTpw6QcpmSZ0Nsx75SvRa5md7DOaJPG+94FVUqnsHqqduPf9unjyujJx6zAm2RCqEwCiemXENVJ///6KI4h7wh5x2dyge0yeTl/ZRTSF/CcGlh0Wbs0eStVgkdIU0V3euNRCFSm6ovmTOF2PMAzUb09nlkhjRMMIEkb2+6BrQKcXAd40j3w38swXiGIwtatIzZgOeHCGu8tCN5QfVtR4Lj+Rqb3I1jTtrEwmJYV2/a/eB5rsgnIaEiQJ38KiiS2+ZhhJOvFw6GhZBL4kSVYzf+5PqzZpoS+5tKOavPIk/bqnO6tQNWDzbTmlopzEp+cX8jQSwV8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 13:40:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:40:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 3/4] image/populate_sdk.bbclass: drop qemuwrapper-cross from DEPENDS
Date: Thu, 10 Apr 2025 06:40:20 -0700
Message-ID: <20250410134021.1299595-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134021.1299595-1-Qi.Chen@windriver.com>
References: <20250410134021.1299595-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc02672-d4ae-4100-4053-08dd783541f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D3Ezl0qPK+uOQEYhmUbush1IJkVrA3Ow9ybbZ+KVMvUfzGPVigNbKYZgzWor?=
 =?us-ascii?Q?5QIVVP8DweRtSdaE3JsSgNOmqXYbwUS2VoxD2yVmDnCZInteA9qtk/k649WT?=
 =?us-ascii?Q?QYak5MZAJnW56981fBTNYxJ/Cx9AH1E8wCbIE7+FM9akKYosYhtWzNU0TXEw?=
 =?us-ascii?Q?q+RzOMAkngpCDwF0TR1iR/uTC3TFgch8+eKOXTZCHU95salJn+KBJ1/Ls6r6?=
 =?us-ascii?Q?DA+eu8cc1IM0ZRvL2M7n1OXDo8PkDpfvyqXi/WSBItzAMzvqDINcQSc7zf62?=
 =?us-ascii?Q?pqn3qWIBZoLl8wkfHdt8tk538c/PyTRXZCWabiv4Q2YBG5vmlb0nUh9YjcCs?=
 =?us-ascii?Q?OnThYG/5F72Mw/KQ1gFnW7SvxiLAuE9GrigZK9/nHSyrnyKXvCj0Ax3ZI59O?=
 =?us-ascii?Q?vedsm5hMH9N0bMj+CfTNNY9XXAA5uHXSiNTYaYHYhBsd8ZOHoo9ytTZ9/oIT?=
 =?us-ascii?Q?5tAMtNUaxmrLZ/9AUuCh2LD0a4kj3wqtmpGLTgiM9LT8psf3Wzk88sADs7Wy?=
 =?us-ascii?Q?k6z2U6MZDZmnVTD2zTnWm2ZXwlx8TrSnxYaI/enM4H28Rb1qdzhs8YZe801m?=
 =?us-ascii?Q?FmZARkgbAqti6jscTmIzFp5+CRXUju9iq0DqtnR8Jnj4O+E4GuCFCn7yFVyh?=
 =?us-ascii?Q?btxW35OiNdVKmHIPmNCYT2rDRoJrphA2WkpGwzdY1eWeFnOZJP6Or2ZYMaXe?=
 =?us-ascii?Q?O6zQdnx9i7dyOXh66QjuMIYBVtYz0t1rty0ctPDUbZ315VMg4qCkz9FPw40y?=
 =?us-ascii?Q?d2JWl0oyOY80/bUXfER8NuWwcRT+1DOwxxGxXuA5F2qIeDEdedfWJ/gomGkt?=
 =?us-ascii?Q?saBzYYhQm7QGecPTZPcHlQNDlKwDIbZxqEd8Hgrmd4zsAeLEk8x5ZpR7yGkf?=
 =?us-ascii?Q?ksZg8ERc4VJFL2neNiYyr7KXnjKA+86zjTQ27/A9QpgYzzrPvcdoHEf2gjDw?=
 =?us-ascii?Q?XdWW7C0+6xaJ+mF63LjlHJZTBJwlE7EXhjSKYXbo2AzGbH3BYhOppTduGnGB?=
 =?us-ascii?Q?bAfVN7dnopZc0kF6jxv47H2jxADhqPbpbBJ52gZ2k0Y6F0EfufBKT+LBxEch?=
 =?us-ascii?Q?nj8N7rPUoUs8NeWEML97/68Xu7V4AtvNNF6+w1K49jM0t8F6t5SINnEU8QRQ?=
 =?us-ascii?Q?Xo1MGCYpOMQBJ7pDBumXS7cG8WRbHpYt1OF01RHH/skxrMgavaCY6krgPm+s?=
 =?us-ascii?Q?Rb4fxC4+RrDgBxoQI2mJZGwi8g7IXCYFVcdt3YknQnJa8iZNTDztb0dtpunJ?=
 =?us-ascii?Q?QOWVO+/am1zb+xSs6T2qUzaVi8A2OdiBlzkcAdnUlVBc+iptWNrDXrDuQeXI?=
 =?us-ascii?Q?Rf7aqJ1whZiSDTLZBujzBVl5kUlMi3MZJ93EOtjEEzBDm463OjbYePYGp2bw?=
 =?us-ascii?Q?kqmXXgCyCpbL8k63ZqJqCUkSDA8pwgThQLuUqREtML2tGUMYzd55qTY0uZgh?=
 =?us-ascii?Q?37jCKayUTe6QDHrzp0g9OC1Ug+IPTqjqA4Vy7KJWKbITF94KkbAq0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8H9OBz0rQNj2kyj/Nteo5cAYROvWqu2Ld5Wk/h0WWto+jqaLZepoYoRa1Kt1?=
 =?us-ascii?Q?eOvm9aCkZ98uScOh/r03lLUOWsPux75jxQPVLaTtHRmefd22ULb6XGZMsVZO?=
 =?us-ascii?Q?/QFhkMzqkrN/XtLtcmAER30/SlHGElGYOImNVL5a/lYt3tw8rltv+e8jpmkj?=
 =?us-ascii?Q?H1GVB8NK/c2olY+qVNv55CUxCrN8DtSc86WehsI1CjyiOVGM1NENwYJSJ8F3?=
 =?us-ascii?Q?FiLo/UjKgKiBukV8nUZX7xBfHhf1sZRvXbK4sCJO028LeBjdwAIppFgBxbAg?=
 =?us-ascii?Q?TnCX+21RODVKSzt9ejBrRuY1HNrcyjrDLEnuZyyy2DM7omZzefuYmEuTY2Gt?=
 =?us-ascii?Q?gZCPlO95yb0Ghv3djAXragBv3eQfsDXCHXn4DLSk7xroJXBYnzcxYSOY1H85?=
 =?us-ascii?Q?i9Mz977Tzrte5ql1Xa0S2USEwOvGfgoXdkS8h7BEy2cn89TQogjHZem7JNat?=
 =?us-ascii?Q?t4M1o77JKkKSt5mPUVHpDqOStoZDjPrCEXJAQD2HHWDLWamirlptqp5ETBrO?=
 =?us-ascii?Q?1gvqJRRVOWcXW4bNU0Zp5QuSaj07cY3skmvIuDqYFkpRwIqHs+ESRHQlGO/V?=
 =?us-ascii?Q?gvUj9ZFjaks8dSW5d+WLJNSTvwHyIGinDDMkor9Ngqwh8ytPgq/5kBAXK6fV?=
 =?us-ascii?Q?UvDvMlRa+tH+uGnFCLoJi/zRbfUpdlHvnTggznK0y4RW8hLHqEDhAutwKDrl?=
 =?us-ascii?Q?tL54ecnpcbHBLH4rPP8vlt9ONCATvifqeZKDiKvzG1EEHAiNk1RjFM4nMrbH?=
 =?us-ascii?Q?7n6TXKYJRZQoEmwHcTBOlzF+pDY0iOx8gj7tK6s+CptycwUXeQeuYisZBETU?=
 =?us-ascii?Q?rrZJS3yS0fsQ5M6JMoZ9WT4WhC2E3117FOZ5cZfXtBuPcqCW1XWoZJhOKXbF?=
 =?us-ascii?Q?hYnE1hSu9EFib8+9YloOfKhNwHX+RmuvjGTzcctcYyh20c79v2mZWg76Mogg?=
 =?us-ascii?Q?6e7Y68BTOQuKEDSRu8EaIeEPfzvFDPjsvz+aXa3V73sRLnF8sHHpLs6QqUyj?=
 =?us-ascii?Q?RvHk+J3IIq77pyAADH0HdnfcnaslQ6M1dPmFmJ4GP+CzB+2X7kNFwFz159v+?=
 =?us-ascii?Q?7AJjRXn1T8GVUIO3juuXeIckdKaBGAzhvOZdch1hGiLDUujjuGg4hUuDI+gR?=
 =?us-ascii?Q?4cJ2OXhy5b8Dg4pvcbhcUzh3AZ8ih9dygnsVebFfLzoXXLCDeRiNQda2vEoq?=
 =?us-ascii?Q?CT/X+uOMYqoqPMbf9pYl6KkMAEFGp1hcuHBdANGTtgxyYxzU6Bza8AWS0z0i?=
 =?us-ascii?Q?JKpj6qNFHs5RVNTrt3H0LN3flYT6RWgBGrtcB+w/bdOUEMPN+2e3/X9c0wR/?=
 =?us-ascii?Q?jeLQ6o2qk5lIKJ5FV4yBljwZ2Fz5w0IGoDg/PrCqEKKpGp8CQDEfRywa7QWm?=
 =?us-ascii?Q?oc13UnA8YJAinYteJXswmx7pEBkfpNxVoNRclWT+qu8erPGg5x7WNA8Ow6tq?=
 =?us-ascii?Q?NulaeWCseflASqXcO1a36JEIcDIn/Z02S+5g7w3dUDkixRuoAbU6gooino1m?=
 =?us-ascii?Q?S/OsIyRiOcJ/FZwSArp6QndsbMpSS0U6fTiChVpScbOejRI3Hx0FHhc4DmZ9?=
 =?us-ascii?Q?LYFNMRtUSnsRP6Pp5G9DkHIgNEUk1teQbsJR54+OcrLnYNp6MEh8kYQSP0a+?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc02672-d4ae-4100-4053-08dd783541f1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:40:29.2644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKzbLSZiXEC/hNTSgHHtts2iFf3yscRsK/XyLyT99ODnsMGy9BLBDHh83ylbqyGlRSnspycWNki0dJ6EeUigEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7ca50 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=20Y_Kt9r-2Gad0TaIGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4DpGHnS4jaQR189pfQJ7TowBy3TgEIMb
X-Proofpoint-GUID: 4DpGHnS4jaQR189pfQJ7TowBy3TgEIMb
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=993 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214672

From: Chen Qi <Qi.Chen@windriver.com>

For packages that need qemuwrapper-cross, they should have it
in PAKAGE_WRITE_DEPS.

Now that we've used 'qemuwrapper-cross' to replace 'qemu-native'
for recipes that need qemu-native for their postinsts, and we've
now mapped PACKAGE_WRITE_DEPS for nativesdk recipes, these
qemuwrapper-cross dependencies can be dropped from image.bbclass
and populate_sdk.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/image.bbclass             | 2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 378d3bd0d4..dc4ce5c0a9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -30,7 +30,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks"
 
 LICENSE ?= "MIT"
 PACKAGES = ""
-DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
+DEPENDS += "depmodwrapper-cross cross-localedef-native"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL} ${IMAGE_INSTALL_DEBUGFS}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 PATH:prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index f111466b4c..238cb1ee6e 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -109,7 +109,7 @@ python () {
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native"
 PATH:prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
-- 
2.49.0


