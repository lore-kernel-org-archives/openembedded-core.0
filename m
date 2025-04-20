Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841E5C369D3
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:05:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2980.1745121950850403358
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45cBc012818
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rqsk-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDFLJ1w3nJ1ozIHyD2K40zZ4GsFyhR76dDoONAmgqpQ70RMknzUXSZVS3/0mknTF7ti6cIfbDsn7vVJOnLVwlIj5IZGEb20gmc4pLU1//zT4dKWk+8LgeyXsWFFN0dU1QMzssXXQFpiLp3k0/5So3Gi1hkRYe8NizKmfqLd2zRFfqRt7R707OFdyhZhltZKvpYET0FfzTfFo3UZEjwnH8CEgMNcPj6NLc6jcWm8SJJG16YUPEbtUOW1BFrrKym+lKo0uE7OrAe9GAJ4a2evAQUGzPKCJFQlZDtGR8A23jAKAJSNqTsVmg3J5DTyw6DtLUzKlhq+ubEISrJysJYizBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnEqko4LgkK5KfTZb4611ZXD71BxKVWuNja43npYnSU=;
 b=JKUmL13QFhwGt72VD7dL/UPCCix1NIAQ714eEa0l6f/EcVWLl7fyYCQ3viUaX1dDHUD8spwdH1ptFQ0U6P7KMqWWHt6QveutgUIER3CvSjpFQWLMHyNSEUf927WvWcx4x2i7sVgpX3FoF97cNXj4gD4LBw3EPgP0iYuQeCaupWADjzmQjOfAUxd1aMMjLAgYFTrIbY0uv0uuljG/UKfS7X93xx4GHGqBY3erXzlSsroPTzUFEWj4u8b2xU0Uv2BIfm/JQHG/J+cEdb7Y42FAUfOIAxzdO37kuXsIAvr9PmF2gESZKuTzdMuGuZwtuspeDXG8ym0VQaNGQ1cqGgIrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:05:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:05:46 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 3/5] nativesdk.bbclass: handle PACKAGE_WRITE_DEPS
Date: Sun, 20 Apr 2025 12:05:26 +0800
Message-Id: <20250420040528.4012613-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250420040528.4012613-1-Qi.Chen@windriver.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c7f83c-ebdc-452c-06b5-08dd7fc0a0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v5FcdW6GQZ7ZDm+LAxA01PwD/RZOXVOVBT1Be5LqFH3Rq2gqajVGCzFCNgLG?=
 =?us-ascii?Q?j6pK6z9eNQSSM44+DhKmnvJPkREtBVjG0duCoqD8Ow2Au5Lykz6r935/pcRC?=
 =?us-ascii?Q?EfwAf6X9Lmn8/oxJUH1tHn3GsBqOqal5xhC8Ua6Oa1fa6ENX2JcFDa+oE8ll?=
 =?us-ascii?Q?uUmSBlC1sMhO7te8M4jahxwiacMJ/NIf5WhCIPJPLVVdGq9wX4qK7pEb3Ulo?=
 =?us-ascii?Q?kMoY3ErZBr94HAReJHyS6yRFIvjPmXl5J24bIufmnh4QXjxllhV+dq6I9ssQ?=
 =?us-ascii?Q?cNHJkNAGg0s6i0G4vQ0n/4TCmWH+ueqQENX+8kCU/ladbDCXRbOSt+eKxBFY?=
 =?us-ascii?Q?sWQktXljCztj8jtR4VNA+SMdRM/mIhwuKzc2Bk2x4XJQN31dtL48MBSZ7UYl?=
 =?us-ascii?Q?apEGvrU2Fub94LYI0y/5vmMe/JbuWQ+a6FqCdlEN2/FBPxzlKnYn8TV47F9o?=
 =?us-ascii?Q?gaj3NQwgezASwh1SNRV6xQ12tiswyEN78k8oiiwo1T7s/ilDpnWdf4K8YgdU?=
 =?us-ascii?Q?Jizhkf+x4AodR9DWrMa47v43nf6Mp/PTuv8ltIrybX/TKLyVZn6ltBIX17zf?=
 =?us-ascii?Q?ekfCs4t2J2vCRgJHbpmnp4UeUPK/rdvHj37eHRNWpVQUyRv54sBkUK32ptbK?=
 =?us-ascii?Q?xdBoIuS+qGLGFTsljnxU3SskY+/eOsnPcJZzS4bDSN2JDjiZG9zzxPT+3z9P?=
 =?us-ascii?Q?p7aaI3Z0NgNIfDRFXK+e90QBXOiSQeVIPSGKLL6EjtfRu/OwW9V5VtAdmf/E?=
 =?us-ascii?Q?d7wG7WknCiwa8VVs+2SptUehnhoaHcQvjHziKr2r/pO/VdJP2SKPh0BOMOLj?=
 =?us-ascii?Q?DDdCRSKvE/7OFSdrs5cir9f3+Z2imS2N57XPoJaqQ6EjJ+6SoiWncsZSpl/9?=
 =?us-ascii?Q?H/g6ZQvOiIcVrNDYTV0gRzYPXpa2OmbmJvgWpvG2Fl6J+T+qdumIFyQPhbbn?=
 =?us-ascii?Q?MDdi8abJF5w5EiRW3X6V4H2BpaTBko+6OViwzUflxqbSmRjGpmD1cx8GcWiz?=
 =?us-ascii?Q?NLKc3mFt3JoEfnhLaUP/MxIfU4puqSUgLCmG1AyDNNUjIZEm7sqdZILqfxd9?=
 =?us-ascii?Q?5Sxia3WIdcGz2J8w4VOzVNEGHJzLhswoUnPOt7vSunfcQgFc8UE1cSqbFDBt?=
 =?us-ascii?Q?JcMMv/D9fyWfwfQqnOp+UZw1M5UEnbAzBEU0KjYRMCuA7u14+9ZonVcuNmfV?=
 =?us-ascii?Q?tDeA+bjklRnrhmhtDa9ZvC2PYaclbz6OGIapSrHczFLCnXwcYrv+BgUrCMCZ?=
 =?us-ascii?Q?PS5c/zesvwsVxr2A1OrRComHEKpBekxT9fad8qxSE8q/bw9eUSle04dYNrdq?=
 =?us-ascii?Q?qnlchtlinVQIaLqS7aBAJzM5/l/SMqGF/ZyThhd3OTfkmMGhWH/2m5uDZzy/?=
 =?us-ascii?Q?WQNyH/iF2Vno+cTpBDt2CwRMy1v1luJKZaiF/1J7BoHGDVcnazfYE38bhe68?=
 =?us-ascii?Q?6Lgc0LlRQUqLf5ydhkY0kVLcorNHGwOlCzUUgA30EJy+ApUV90Q1zw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kbrQNTL6fUDw/9wwYt1FdamRk4gYB92XIb17SBPKZ2m8/3j/XPAq3kpjM9jS?=
 =?us-ascii?Q?LzyzlHmnuvECP6S4yJmdOmXfIFvCDIyMDuLn9prsZ5oqjztY9eDwvEmO/e+W?=
 =?us-ascii?Q?WBB41mwllWVvrJ4mBjxzKUyIhsXaqUSblpe9Y46aror70gXNELMopsP1+Ncc?=
 =?us-ascii?Q?ehVU7gY2WvOeIivg7hW+mPWtaCfH3CfphqiTWsIKoBmBu3sf2uiZP3QoEmGk?=
 =?us-ascii?Q?iB/2RxOkVPcLuMbx7ZWXlj9HTj0RYJmxfgD20xaDgT1y4kcr7ihVqoPaD+k8?=
 =?us-ascii?Q?JF33vr9ewD2m5sr5WacEXasnSQtElOQFBxv7T7eq+4jm8hflNw52LBMGIXUe?=
 =?us-ascii?Q?NfOGzNif5xixnMX9+feVV9Q05WsfNh898XKjzqZSFjC6MKHO5BrfgYUb+kAI?=
 =?us-ascii?Q?MSMOekruMkZG6p7yJFuHlfc6fryml+jJ5YYG3J6NJXB2INv7vRpUasN4ZDrq?=
 =?us-ascii?Q?r78u9EnhIZEVABH8yMY3EvTjzLFPAWakqMoUKcIFDIrDxdoNBtR+3tVNNUPf?=
 =?us-ascii?Q?xuJoNgGl76Vsw3eiEB9RUNW8/iNGYqd8CqupvoCV/rhEZVVlXkRaYKGLb4NC?=
 =?us-ascii?Q?h9YEjh3RATbbgi9C//LLkhxiQTLBC3aSSXCyhdnX3Vx+Qqjc7msHs7vHMdSd?=
 =?us-ascii?Q?MJaEGaNWuuPByRgo100ezuXaxiQNzAH216wuus5pLHZTx0Q9CWu3TF7LAXiM?=
 =?us-ascii?Q?Ks2VctEFrccUh7bJL3hnPt7nmBKUzh0OhtnNZlvnlCwjUyKovDU7ZfgkAGch?=
 =?us-ascii?Q?zudfux34+erw78BYV5UqayQQezyCpx08/+x7NBDfdPeb8jLE5stMkkXi/SG2?=
 =?us-ascii?Q?WO3eI+VwIxMLGHEr+GgYbwlGVdSGBzhT/9U0kZVrnIq3Qz/UE4gFSD8yrTkt?=
 =?us-ascii?Q?1s9aTiBM0R9+KvlrTr/Slz6hoaRfueXy0fZSkOWm3rOGLkrIZDFggTn7mWco?=
 =?us-ascii?Q?HzY+1kmox6NTocB2M3yTKvo8kEH5rN3lYOZMl38Uxy4pgHMjT6eqmJYyKaji?=
 =?us-ascii?Q?VnYxg0ySKhTeKqIHeyLOox7IeXszoFe2GYabi6T/p1c4Pfi5gOYHF8rUEYiq?=
 =?us-ascii?Q?TaZzz+/REY891t3ic/bMl8e/TeACpf/MOpABWEhGoNRaZAuuuFSODciQWgf/?=
 =?us-ascii?Q?z7wbNeIN2nEksKNqc/eYbysK2jKKCZAiHoEkhhzhZPchP6pw92YdBAPBB4PQ?=
 =?us-ascii?Q?JYDXV8JZ4zZsPNDpq36GOlZnyNlPqJSkZm+JzVDMG+Ose1IrbqqjktQPcGLb?=
 =?us-ascii?Q?VXAKKydotbvI6HA0wonWZmJjuPKbq4HfRNkgFsla2sH+gmGCIfSq1/xccyQs?=
 =?us-ascii?Q?amsRcTtkTdF7iYHahzNo7DJlyh4aQ99vkV35ysRSg7giU9b/yp5t+R8ARLtM?=
 =?us-ascii?Q?hlL9eeVXJG+PsE2OpGcketK5vNcMzlaHcAHRD/lfBmQ/ydjmsQKsoXi9Ur0h?=
 =?us-ascii?Q?0cdcH8J+sTeBqonvdGw8r1kENvKhNl+3OtTYYXIS7aTe+c6c87As1kbm2PMD?=
 =?us-ascii?Q?pl/ky/YmQ3nZLQ4GCR3FgpNWW8YR+nouWsK2FqlLUcplMHxhoAzYMe9dyD+3?=
 =?us-ascii?Q?OfJEkYKzUxUHsmalArLAXEiwuIhs28SyZT0GlKCJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c7f83c-ebdc-452c-06b5-08dd7fc0a0ae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 04:05:46.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpoczjk4MfGbWzTnI3fiCyQmL1yiGOZn2llvder9ywIiaMoUKJP00A7ymdPxbTHSvMuOJgK9K5QAAJe4hQicOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: MK8MrthkEwu1_GFhWy2PNHFj7rEf94Lf
X-Proofpoint-GUID: MK8MrthkEwu1_GFhWy2PNHFj7rEf94Lf
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804729e cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=i6GXUCRvfqvi2kUFSWoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215147

From: Chen Qi <Qi.Chen@windriver.com>

We want nativesdk packages to depend on correct recipes introduced
by PACKAGE_WRITE_DEPS, so do the same mapping just as we do for DEPENDS.

Before this change:
  nativesdk-glib-2.0 -> qemuwrapper-cross

After this change:
  nativesdk-glib-2.0 -> nativesdk-qemuwrapper-cross

This can fix do_populate_sdk failure complaining missing of
nativesdk-qemuwrapper. Error message is like below:

  NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
  NOTE: Exit code 127. Output:
  /xxx/lib32-core-image-sato/1.0/intercept_scripts-xxxx/
  update_gio_module_cache-nativesdk: 13: nativesdk-qemuwrapper: not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 4e57349aa0..7ecb4c12c1 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -104,6 +104,7 @@ python () {
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
-- 
2.34.1


