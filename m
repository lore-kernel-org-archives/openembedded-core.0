Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA89AE9B37F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.160103.1772458114338970709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 05:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AKR3jvlP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7521572ddf=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225VANW1328217
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QB8dBQfSO
	Q1wfGYB3I93FW/aobY0rOC6xC0Jqxs1s5I=; b=AKR3jvlPSiRzO40vtC2ZmcNiJ
	AbYbzIMW2qJtNXgjS+Fdv4PxAQq5km8J1Atmf9pEWzDhTrRPUG5HtnV76RMDu5Oc
	EPwMVDoecPlws5KYE5YkVq9mh+HKr+UKmXScACAu0JknRWCi49lFyaE7qq3det29
	XN9JPm269H81VOIVcmG2B3/hs885FgrRQ+FX2X8GENDTl0ddxtE1hkk+PD2J9oEY
	2GkTxPxD8oLpZ675dDkoIdVjQzBq0fNeHK3SIRSNrsp38X9GTX3/KuaRlwy1kJG8
	8ai0wm+L2IQJqIID52e2mUOY1ishBunQdzoAcGXyM0EbQc+hq604UgGZVhLTQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvjdxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 13:28:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtEl3U5McQ9FcHOPGWuu1ZvrJ0xMKuMTZO2gVgrZRLNZWFyZV5r2afmdNh4X/M5N2yDj/R4zrSHcEz2jiXezecMler0tH0S0mn2YMmzc+L0mnO+oODbfxLDcyN7iCmnNfrRba32OFz+632Hwd5rVPJdAATSg0NkNtFVVQJmilqiyJsEv2YX3y5TQ0eNagIacgj1sQxyntML5XkBH91s78rA+95dIojIB7E6dcLJwRZQLGRPX7NajgsLirJDOZ6efvmeEWYDWkgvTASEk1V3NRzAronaYZ/lhh4OoSHUc3IdNXhjWOvEnkQ4u0lPbDEp/5lCtbHL7ly2r6SVQgiYl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB8dBQfSOQ1wfGYB3I93FW/aobY0rOC6xC0Jqxs1s5I=;
 b=sSf0arxi/gNGUrrmojcSvYNicN1Z2JKXze28xAkrHeWFLmao+CyP2JNGab1F8KC1vO7kOG55kQ7QOU/t7RIcrQ92BwQWKBBCJrjQHnT6c7UIh4mKYFIaD420yjdDUustGPyXYzHsQWnNpnzap/2rlufjCEuimgu+8FeW5nVtMe8kpBhveumsJqOyqam2zvtO3CxJnyGooZj5uvm/qY/e8Ar0haDQZXH80qpQG8gldkoz2sSe0P02WWkWT+Gi7pmtb23zlAAeTBAVTBiMp8y7pqhHr4N8GkDrhzKLLzNH4lholnvGhAetE+fo37Ziv9GDXcRQOVzvVkuP9W3Bt++krg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 13:28:30 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:28:30 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH] rust: Enable dynamic LLVM linking for nativesdk-rust
Date: Mon,  2 Mar 2026 05:28:15 -0800
Message-ID: <20260302132815.2922014-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b808b9c-b973-492b-20fd-08de785f9856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Hs+rnh/IAEmuo+h3SojqjgFXxKWrQHLWM2G4aY0KcTRToO+/i99I93MMGWnNtxM9B584y16O2Ntxv79lOo2+SWBJNj8amx4RWplksZk+oL7iWTap6pxWfUI1mFJUkG9m5VbppFoA6qAy7Y1GNrtvYqgmnNigQqnoaco8cPSKTwspdiYiOqIu+WfFS8w8AKDApcHw5IuXErUk39GzVGK+MN+/91L/mRDXeAKHpDaLxuKwFowpMgdA0U6b7c0xygo0Szsw/VYwPzN3fWB8sTPEYvFKr/WiOs4mZIe+IgpZtGV9HR6aD3oMKRdCD1YphwUdQaP0Un9Y8ntXtxNOdQUJ+Cpcw4Waj5JASVOeT+v/UqRZpWX1GYFmoc8TztvE6AvWZJdUBmtiQON0IA8mNzPbdgTkyFQD7N9PXlXoryRcD12SbYaD8S/AGViMw4rmmf0Zdk1MMuEz0BMLpizI0E93BsdixONSvVWSsCyi4Ng2yeOIeN1xBk6O+TSt4pCdCBuBhTea6VdPuXjsID/hIXQW2TlIfoW2mUU48LKMkI3UwwnYReMCm3yeyBFC9Q88OJKscvGtHX6QMsb+fwcquaFs6fK967l7PIhwDdr2+rcooDmJmOd2BQ1W6AMzvme/nwjv/fgUHRcJ1RxDXdOnqpHU8tr1x94Xw3JePEt2gyaDupE+BZmm9MVUBvGZZBq099nZI5ht4MoI6c/0wst4LBBcRp5LjzmYWmRVARvQOTw6vab/p6ElNb5dq1rQVD4AXwWoOmeW89q4P0olMAucgOqZQjzxAz/K22/KeYPT04b8NPc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l3ls2Sqg8YPSKb5asV8+CoI34EewuXPwNGzC/6fwgcooNJUOJoXfOPC0bHfo?=
 =?us-ascii?Q?j2xdbp+VQasY6a3ZwmugHevxgTbiXrnFcbR4g3FJb5TuGhkTHVnqj/gl8fit?=
 =?us-ascii?Q?riDaOV44+yWZKjJMrj6oomUDVoh42f6j16+W/q1OFpkJUSWbdJNsLxsFQOr0?=
 =?us-ascii?Q?3Ix0dCoZWNdjSC+RVmDwZzqvh5sTUqmqrpauPl+cDmosZuYwzNKvAndp6cl4?=
 =?us-ascii?Q?/x4TEM8ylRRsQVeH38Pb5CbKvBZtGyRvgCn+oX1VQeNbiDYH/5RMxUK5/s6W?=
 =?us-ascii?Q?PwVY5apbmTtuiKubigacPcB3Ybd7vNhm8ciEVOKqDIRVMTKPiClXKNOnfuXg?=
 =?us-ascii?Q?fen72EMcEjrfZ0jpmEVMi8ifClaK8x1tPtPf75yJCE+hlZmE/IA/w34Djhep?=
 =?us-ascii?Q?+7v1b9FieHKw9JismCwiRYkgjhLEZusVDtxsHXzKzC0ElZFYAMMx3E3yaXb2?=
 =?us-ascii?Q?FgEOtMeB1bGD7oxbeMWsoHmGWOndEsWzKqYvZ6q/tBeYlsj49XPvYVJwYx9M?=
 =?us-ascii?Q?3glUJtuMqqBTRoTzD1p8qCL0iXwf5ii7WOV5sAJ5TQUInNz1AbZexsMeJlgN?=
 =?us-ascii?Q?W4QXFoCJRkurJOcbTxJvuvtkUOa925DaFVNrad//55FZ0oUq60XyTFXFGeYc?=
 =?us-ascii?Q?rfZ5VqZTGuvW1l4J33p6yMBCeaLaJJbLcLfCymSo8vRKyh5D/gR+Fh+kI953?=
 =?us-ascii?Q?SO2cYoH2QissPsKzPEOMh2cEW65StRgF/vQ1BVhysBP2Ag7i+qwu4OH77kug?=
 =?us-ascii?Q?K/2NcHTTlCA037eLvSUWRL5Drt1xvEUiHfs5bMPrmgMGcNcaaXJszomyE0sK?=
 =?us-ascii?Q?J6vX1/siz9lZpZHD+Le78RXZv+vSixczs09sBAhVGLsWAUs/jRJSr1ZSpEjd?=
 =?us-ascii?Q?Wwqy3mnMROiZ9CdQpEWZytPwxXEmlJVpinkK5qL96XeI4Vjha8OUAgLseuFn?=
 =?us-ascii?Q?Vsaj4zh50C14edOgnHJW7zcYV5sPqsaEqKLIz8PXs2WO7OBtOdNZOAq6nAFU?=
 =?us-ascii?Q?UG+P8/dtwS06pLB4t2B8OiJ/kxVYhKaZeMPIr1EbR6Kmx/7+LaOzGjUT4g9+?=
 =?us-ascii?Q?WqLmBqg8+MOORuTiRSQHg901QnKW95s5gq4AuGoffpwDSD0HeE9hFX/d+/ku?=
 =?us-ascii?Q?kaoAs47/x+LewMcot4dnpU72NpoEJrRYF78+8iWRdXe4EoGq+O9Gkr097+tf?=
 =?us-ascii?Q?IeWVVQFu5vywmyzNGJU7skdml7WkuEqckB+uvVVMSFfGhbjyfgm4+dezS6dk?=
 =?us-ascii?Q?MzAcIb0CArc4i5GLfj0ZQnlkuZQRuG6QhiJliJLHOJWCAmsPIwDQeEcuy5ck?=
 =?us-ascii?Q?Ijyynu3t9MNHqkDisu54I8zhbswHFGQA9kRaoMOeCPoxt4Zu6S8KB7hCHLpO?=
 =?us-ascii?Q?F9ply942DtgrdhdLWRVU53z22QNvDUiw25ist82lc8HF1fPkil0si+Tu0odU?=
 =?us-ascii?Q?cggRYfu8DY7hrQPo9rlzmJ5VfvfV/2QYMMkXykt6a5VQYg1BvT6UhlMawOZC?=
 =?us-ascii?Q?lU0A2DklB5OPCgpyc+kjnxbVlAUQQmNn8oY0Bu2iaduMlxYdkhkHJhERChRL?=
 =?us-ascii?Q?sQpwKlLmIBDB1D263YwEnRRAHQ1Z5+Xom3yKIKN1JNWP0kaILx33UZLyDEVE?=
 =?us-ascii?Q?fQ5BrI6tppTLZ2uYl/oNyU6+eMKwQh3jHn+SyltFr/H9FuRbt8Vl1oETLHGa?=
 =?us-ascii?Q?72xX28v3TTStjXS20q/fE91ZKUOG/ncIeMlm44olpIqVpPddqyO4bgF2paN6?=
 =?us-ascii?Q?VN1YbMce/pCp/DzOp0m2d2USiv8Up3g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b808b9c-b973-492b-20fd-08de785f9856
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:28:30.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrXWGEC7F5IX6AvlCZLLGiwXwft6VFvehy9k5doGxZqM+nieSR2TaTnM3z28hxxVqQg/kB59bk2J29fauEZY6eYnxz5oxVTGfiTZVt1ZpRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
X-Proofpoint-GUID: l1FlwEq0nDW3MjUA4hk2TqNxgXss7Dpr
X-Proofpoint-ORIG-GUID: l1FlwEq0nDW3MjUA4hk2TqNxgXss7Dpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExMyBTYWx0ZWRfX96sbzxxHbuc/
 u6pk4dkedr8NZGlWb60nvUvbVGlF7/KgMmfxTsU8ZVRCHx9NYVvrvCad8QhgbOoq+2VufiEm4SA
 ue5zea83LLBCIxf7+3XnIhskkpLGyIMon7AA5LcawWEIVknEM+odxP51EDoINDrLgMNmRO9tPpN
 Z0lUE3XtnrOZFjikCH3tQ3tnQ2Zi5+SsWyTd5UmJO/o90F5JsMlN+FFMECloxGZrc8qsSvKI5Bx
 bfys80fP29TyHc5Xy6GZX9L0cJ6vJWkbkgLx73Xz0ewX8bnaFSbPni5TInxxPwPzRhwh0CAXU71
 8RSXuxmosT9Ws2gpLt4qx8yDqqlkz2xJUhxTcmGPAZ/8nHnZaeCgSRJvGDEw4HxdJfjVOrqRHet
 n1HIRRo8Ux655qpKP9gtq2LBaUnt7jHi4RYYjZnbippu/qmu5KTRO13PJA+ThXyqcu9wsvi7CMf
 kylvJhBvWKRCcQDT0gg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a59081 cx=c_pps
 a=Wms0yhV2hyGqr6ZNmSx9tw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=Cb1b7MLjfXANUpp3KNAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 13:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232201

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [Yocto #16058]

The issue is still observed with nativesdk-rust when sstate artifacts
built with different host toolchain versions are reused.

Although dynamic LLVM linking was already enabled for rust-native,
nativesdk-rust can also reuse sstate artifacts across host toolchain
generations. In such cases, static linking of LLVM objects may result
in mixing objects built with different toolchains, leading to runtime
segmentation faults.

Extend the fix to nativesdk-rust by enabling dynamic LLVM linking
(link-shared = true) to avoid these crashes.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..06dc8a376c 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -124,7 +124,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
-    if d.getVar('PN') == "rust-native":
+    if d.getVar('PN') in ("rust-native", "nativesdk-rust"):
         config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
-- 
2.49.0


