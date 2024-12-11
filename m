Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151DEE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 17:14:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.115.1733937282146557538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 09:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2075040ffa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBBrvad016900
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 09:14:41 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u4fjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 09:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACwQjIJ1LuPl/Xp5vpgWfmsTQXiVhkfHGw8AVlrDYzlGabwr2vob+iQToknziAZDTeDAYa5PB60g3mtJOPSHCJIrljxYX1G3cgLJIxv7NoHS0uCb1o8ERzPn9GAoGDLi06mn31PcMoTlTN29k/fzv4OGJakTjFqy2BkN/eFxiI+kpOttA2mHwGRBZti8ugYUBRInPF71l7aqNsLhpiM+21tuaPNwNEz57dEzlwZZzfpUAWNBLUliVXbkvrsFcNevYFhSnQ5JdXN+SID/DkPt/qt9N2Btz41zn+bPgroG+Wp0WWMY/V1j4v2uXSxohL9Y39MIqeC7uxLZYji9xlY07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDx5caKUje3L2QGKfoGb/EuuoeOourIZbaDnu402bRI=;
 b=DFsBWKyV59+TCRT+63c8l0sk0nvV9CWOIuKyvKq2eGkqVegiJqwG7UF248uxpi7+JAwv7DJqJNKYwJtFlau9bmHJtnjrzQYEVgpQrZs5DbpxmXyyucB23GPJrKOxzNlGgeNOfwzjuyvCo/xdCBM1/dc8lssoElxZ9x85knXYVyYatVoC7L04kklP8vz4etlJcVdjcSFt+eaXJD0xX1ZwXSn97ebqW4EfDZ1E2lpyzoYSuhJ3liPZdtIefQGM9MOObAbRIgDTTtrzmG7aEcg5ktTLMgNC1QTERHeXD7WgLRK636eR4a+rV/e1CFWf2CYGWeTtRbVtESk/VlVLv0RFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Wed, 11 Dec 2024 17:14:36 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 17:14:36 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 11 Dec 2024 09:14:20 -0800
Message-ID: <20241211171420.3859335-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 72cfd5dd-627c-475f-4a03-08dd1a0749dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yBtRGkc4c6gAGZFcsgOa93qrjX4eC3rG+fSIsjfOud+Gok/4ABKYsTCfuPXw?=
 =?us-ascii?Q?P2kSO2Z5Y7U0LbTvcAaoMmufYV8UdwPO68bkgR4fr4PtEFnN50TOpkEIgSDv?=
 =?us-ascii?Q?GL3HizIFgZD6WM1nWNhZj9jUH0hisyNn0NstDSkAP642wzzIE85UnYsy18in?=
 =?us-ascii?Q?uvniQZXwGJPgHVqKAi23Ojhyljbu0i7/tEBR8u8dPsRocCfVJlu7+3blxopl?=
 =?us-ascii?Q?2xe7KawT24FVlWHiKvrdl41siY275CE3Krl/7QLrvKHslxDoOukuO2QxzfSt?=
 =?us-ascii?Q?9mEdaCOKV5cQF9ad6kAkKwXqftZUMCz8ORA+Yf9HWLQJxmsPboVe8yRzdWgd?=
 =?us-ascii?Q?vzlJ7DjoeZNWZnp+94qBbK4mh2R75acznl3ZysHHQhUgrG+/pZyIrLhVp+Pm?=
 =?us-ascii?Q?QShi7M14JHmWFDoaJ7cYDHsYfDmpejJJKRUm0ulWgKcdPArTVEFV5YtIduad?=
 =?us-ascii?Q?yerP9sJ087Ca6y6ZCWba+PbjaBSj1WpsLadbZc1mtyYchTcQP6rLU0u9xlaW?=
 =?us-ascii?Q?eNRCe0Sfkywe8wChw/lzzFcC2CAsyFL7jugkLgdhQA6FnN4an+QZeSHCFgsq?=
 =?us-ascii?Q?csEhCYHMOVit1L3zJP6vQhczNIXBIpbUYlLdgJlkRHFc7kY+FWmsy0dQjRA3?=
 =?us-ascii?Q?CfGz0GXMPGzUsiCUIL5CU9FFBzSgp3/MiDncdwy3CqZCTyGI/Pxg286JQs4/?=
 =?us-ascii?Q?kLZdvZfg1/jrPTdVj0KheYJ7pkNaQ4VIxPb2AUn9V0926B9J23iLPMbZfcUE?=
 =?us-ascii?Q?6bjGRjisgDE8oKPIAG5j3Pfv5UjdgeGkmHh/MmCKzV/KoWtz8vC1O4QUK7iy?=
 =?us-ascii?Q?g7rurOUEzvTSxZeXeCn3+DzazeTaDVbiThWMGQ+qZvXj0WtEnY8w6zosyaqM?=
 =?us-ascii?Q?0KQf0cIxFF/xcysZMxyWv0K2FPPAiMvnE1COkoJ3pnn4Blj8WwsY+LD6sxR/?=
 =?us-ascii?Q?5c9QPzzyFSPSbz4dRQRC/dnT490lWg68+9yH8oQGKgE3OD7lVqtLzTvjut1j?=
 =?us-ascii?Q?mbontluRLsFgcg2o6XJv5uCDVcIzNVjLU5Kng/GxnNMoBlbDWYsg2+1z3tQg?=
 =?us-ascii?Q?GK48udH+vekh/bm03tcbHSWzzDkTLzU92y4JXpEOl9dwG5ZjjxmAxXu89g8I?=
 =?us-ascii?Q?L0vMmbCZVT3Dg0i3h5QJCpyQchvq24g71kyK9YO0PbMdOBbhwCvfcgEvRJjN?=
 =?us-ascii?Q?Azn91KU1RDGf55asEELre4HWR9+bHqwZhG6KO0OWA77sMrUToHgJywBqS+d5?=
 =?us-ascii?Q?bMjLG5F6QKB4xc7bj8HFnklVAQcuMnnZcZ2H5C8biuefB3t715Igr9L68UoS?=
 =?us-ascii?Q?48f37zyFHi0Rh2+/TvpTasenwIq1eR+YmdyU4Gsq5cHZsrLW9NYwX02JQlqp?=
 =?us-ascii?Q?WNDp9Hw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9mK4tKCbetPbu6kU/XpGXMFtgh052lL8ACYk/anGKT9XO/sMmrMhCB6aHwAV?=
 =?us-ascii?Q?LKSKmWP0qlNpq6vHu42OECbYODiS69XDbWcOBv/lUkyZLvzhx2hZKE7DFGNI?=
 =?us-ascii?Q?YvEFe0C8L/td3Y/GTQOWSmLilBkbGxfAyqDskr2rICoZTK/FzrXVGyWF4ur5?=
 =?us-ascii?Q?tjKD4nRYHCeRxl37RhqBodH9QbeFdf+gy/GejE9oZ8WmCSggZ8n1QySLkKHD?=
 =?us-ascii?Q?WN4bp1P2k1CYYzWu+cXF9v9xxfl6GaXxfuSmfIz//YTw3+yXo/f46pIklszX?=
 =?us-ascii?Q?yUnzzk0WmSs/kj8vvR8fucADV9Aaf+BEVYqtapcQ2hyXmcr6Zko0EFZz8+tY?=
 =?us-ascii?Q?HxO25lNd/FfXBzHtSGKgdgmPxijavQMuniTzwixPMtMOgrXe7kjrY9gUOsx9?=
 =?us-ascii?Q?mBOa34sRKIkfTlPOpGUyxpZkO4OjXDKYzvkVGwt3C+k2nOCNYWJa9X4J8UgV?=
 =?us-ascii?Q?es4sF/bub1Pmy76gxxBWijubpYtrXZid9035SoPstOfmqpd/+t1FS9W1zHw5?=
 =?us-ascii?Q?WuraTsb0mS7gQncKAX6oehjeh0M5EAvrE/fQQP+LASoKdRpfmIl75no/YwaU?=
 =?us-ascii?Q?yq9MiddWlS3Bcgb2BDrzuhIylawhAkQoC6B2NG6WDDwMAJvksc+3xQtQpyA7?=
 =?us-ascii?Q?52/UDlHtg0GbEje8GFpoti9bF+9P0NyamuVGJN6XZSOEE2uM43HWW7BfDN7P?=
 =?us-ascii?Q?C7laLSa9A7TmsMQL3qMoxhnZ/O67fDbWOu2rNse0dkW4WC7yLrcnQhULoooY?=
 =?us-ascii?Q?PHFCXAPyTFKBzxvPu99FhKFQ8+UQXaOYU3uLAM8xVq2dEcz7ywTKBrkdKfN7?=
 =?us-ascii?Q?JV9sabWM0bS7i6LiJB3t5ZYl9dZ2IBtugMnQo0RAZk3su8nO5dn1a4SsKCBM?=
 =?us-ascii?Q?jZP6/3JnCb0X9r9YHugY1co/1Eh5zmlxiZHIYJJbIl/c0ZsGVTFOAexAkOKv?=
 =?us-ascii?Q?2dG7xxRQ+urql0OA+cZ1j7yNeAT+JqC3hcosFHEVVsBCrHm7Py0UieRR+d1D?=
 =?us-ascii?Q?z9/k8qmQhyqNw2jUZkD0pAHKqWvunkBdmJlSxKGw8HAPCWhneZKCObhsG7mv?=
 =?us-ascii?Q?34j8/s889KEe3lhdMpP1JuTkEWO+6D+8MqT7m4i6ef+zMv7W6EH+ldeLnzXa?=
 =?us-ascii?Q?PCU1OthUAeI9vUVKNjCngX8C09yyAVvZnhBmJD2tOfNPtV7FT0daNOULcc2S?=
 =?us-ascii?Q?q+Jr1BvblO4TJrJWpPYSF2JIdThvKszlWHQztpE//ga47Qpaa5pJi7GwWS/u?=
 =?us-ascii?Q?oMGCrOpNUG+if3Wltd+yUSWvVu9dwZN+20Jp/MebMTrukdMVPeNboLeherm+?=
 =?us-ascii?Q?am5Fv1p9WWw0xiNo8JhiaLPrb8QnGPUNjfb1KY41jYrCCqAi9yTC7P66lO8l?=
 =?us-ascii?Q?rIJrTy3sXVw5+Laqye+yntsjaHpsNpXeVtuJ7QJDB9nbm7b40p7/hYUEv/W9?=
 =?us-ascii?Q?sos1Bigw3SQqL/oQI6gWfru/MWk2wYHHuGQqn4wjC8v1MkA5CX4+ZvtgDW+G?=
 =?us-ascii?Q?SjGw9AZFW7PjzjrN3pioptiQHOf4gS5vcGDSNv2RYDF+sDYHCacSO5x0cKyp?=
 =?us-ascii?Q?IoA19vMa/QUNmpjuIoAzXs2Z+ph4IW0MAKWC3f64R7NLCMgoW7TIRitQbDOn?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cfd5dd-627c-475f-4a03-08dd1a0749dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 17:14:36.4777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: are/5ARdZRzE6cjUcdmGpCO+zj7dz0/Ljq53/sJbkKlJYzrY6mgYLtTmLhC00l/PUnCI01YrlquYb2EcBtLKkqoPTTksP+PdHS9m3dLec3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=6759c881 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=CwzhqiM_r4gBRsMSDHgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9jkJh3dTuLZ6WXnMGFXnH_tvd97EBG1g
X-Proofpoint-GUID: 9jkJh3dTuLZ6WXnMGFXnH_tvd97EBG1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208596

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430591b9891ce96c26e]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtools/gcc/gcc-13.3.inc
index ffe90c7188..65477a29bc 100644
--- a/meta/recipes-devtools/gcc/gcc-13.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+	   file://0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 SRC_URI[sha256sum] = "0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..406578eebf
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,113 @@
+From 096ff216265bb114b28a5b717d0139f37d03c322 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 00:53:31 -0800
+Subject: [PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
+
+This commit updates the warning to use a check for "trivially constructible" instead of
+"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
+to types that can be copied trivially, whereas "trivially constructible" is the correct check
+for types that can be trivially default-constructed.
+
+This change ensures the warning is more accurate and aligns with the proper type traits.
+
+LLVM accepted a similar fix:
+https://github.com/llvm/llvm-project/issues/47355
+
+PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
+
+Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430591b9891ce96c26e]
+
+Signed-off-by: Marek Polacek <polacek@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gcc/cp/parser.cc                              |  7 ++-
+ .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+
+diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
+index 4e67da6ff..5dd94357d 100644
+--- a/gcc/cp/parser.cc
++++ b/gcc/cp/parser.cc
+@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
+   else if (!CP_TYPE_CONST_P (type))
+     return;
+ 
+-  /* Since small trivially copyable types are cheap to copy, we suppress the
+-     warning for them.  64B is a common size of a cache line.  */
++  /* Since small trivially constructible types are cheap to construct, we
++     suppress the warning for them.  64B is a common size of a cache line.  */
++  tree list = build_tree_list (NULL_TREE, TREE_TYPE (expr));
+   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
+       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
+-	  && trivially_copyable_p (type)))
++	  && is_trivially_xible (INIT_EXPR, type, list)))
+     return;
+ 
+   /* If we can initialize a reference directly, suggest that to avoid the
+diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+new file mode 100644
+index 000000000..3d9d0c908
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+@@ -0,0 +1,57 @@
++// PR c++/116731
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wrange-loop-construct" }
++
++void
++f0 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr)
++    (void) r;
++}
++
++void
++f1 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f2 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f3 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
+-- 
+2.43.0
+
-- 
2.43.0


