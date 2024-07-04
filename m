Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986AAC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 08:25:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5680.1720081501555004083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 01:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915407677=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645ebaY010928
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 08:25:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg8uf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua31gppnwzoIXhwex/mEeTS2DcJgJRr3xbOmtjMWTpWl9S8qHsOHck6fqi+QRvTHA5NLJqtgzGZMnG6tzydlRjc1XUBXm4355fSi8pk9ZPi4gFE7CquspBLFyULrLqJisjMTHCtXmBoBEqF2A+LDHal9kcBgEpQYOdRkjmncSsjmPsCf0yM39vtEpwvzb7O4PItqpqwbgq9PTvR3UNGQ4pd6Rl5fKjLWjKZoFfwfzUbLWI46rGyhmoGlYIjP8lvnIGCyn0k6Jcyho4Q2CAYopplmz1sULpBwEDvTM/CGnQp2FznfBTG20SNAXXCb9Y9CDBy9uGH6zT7hmFo1hbOHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS+g8d/c6c9pfGtQUsB+JotWbxSoW66nkgBJtjjUXcM=;
 b=lqY4VrJKsnfi84NyTlfR1q8Dngqt211FYAkGsp+3zPlOJZyOwtPImMIRx0KW4DYWeFZPI7R3SQ3HHqDAGMo/EC4w9u60F0qmSnI/rpefJmbARQDrhEexc8XR16QRCSUH2w3SH3v1bIWkLmzhPQt6sFz5dxwt7pRYDn38I58P6Hcsr2+KjXGqP5GQCoYsl9Btq2kzLe8lJ3gkyex1QKX1+Onzw4M6s/h0XkfWdYuOuBIs0HvrAipORgM7gvGeM6nv3YmKgz4I0QuhHRDcVt7gUrLjeILY0Ls+wWUi+tLkVxbMrAyewZAPGaGHG8ntdCx+KX3xW+LosWIbNs1PnWAwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:24:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:24:56 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] systemd-boot: upgrade from 255.6 to 256
Date: Thu,  4 Jul 2024 01:24:40 -0700
Message-ID: <20240704082444.3886275-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704082444.3886275-1-Qi.Chen@windriver.com>
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e103ea-de97-400f-1c73-08dc9c02c9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mxjvpq6mH7YS9VEvQmQcO5pK/FMlZmTfRpsGSYUmeec/mUMpR081qp9sa+Tl?=
 =?us-ascii?Q?4o2T2BqgijPQUCv7hys9562kRo0EyuWafnNLFk8AHyvzHGRDqmgk5DwMs2h6?=
 =?us-ascii?Q?LRJjoErFFY25cl12OS1qsGbkjDs6nyywJ68mdgCF97waXVzFe/XfG3dVodiR?=
 =?us-ascii?Q?yfhNWyjcel7Yl8SVDIE2lkts63uDpDoiBTb3OoymgT7S/UF9E0AixbL3Vo9k?=
 =?us-ascii?Q?jyclc6ci65et9Oh41NXa+DzKH64bpzyKKaJm902dGvhZnou5MxQuSs1VKf3b?=
 =?us-ascii?Q?vpY2hduh60fQ14s5Lx/HA03a0KEe9NvvqCXyj38Ozpd/pUth3F4tiIR8U3Fe?=
 =?us-ascii?Q?MgIqY9PVklOVkDs2DGChy6FvWKUwu2IL9drePnGMySfGkEIWg6LNiTkPjYs7?=
 =?us-ascii?Q?Px6hbOhqdqM7YE/0y/HeHrjECp6aVQuCIafmzvcfZJoJjJJ4aNg4i/PWGfly?=
 =?us-ascii?Q?YXoNCprK3W/6y0vnxiXHvgREWdM9HI0c6Oy+oQJgywBI5/Zh/r1TQ8+/8ILv?=
 =?us-ascii?Q?SR31gCc+Ch62A4RpBZ5RyVnLFZTleR/2jqGw36BT42Issh3B2KjSu3s+ImYE?=
 =?us-ascii?Q?rd+kn1WNFV3fFzJ7fwEjlYqBCkn3rp4ttIBE/UjMkORcuex7hgRMdvwt22bv?=
 =?us-ascii?Q?l/45cAS0+3aQUtcfbv1BCk/PIrJh+Yv9kcS2trVPD2bneypjTETb5Ce8Q2On?=
 =?us-ascii?Q?bsqnMf6dbfELDW5n0HCBuPxsbJQJrBril9YWJGhnHh0crs94z5K4JMemki2X?=
 =?us-ascii?Q?iARSfFAqfko4Vz+6MfUP6ie5Fd6AYvcmLocweyVWKUBB0F99a2imFttspCaF?=
 =?us-ascii?Q?jCOmVcQdKYEMZYNwkVixHcMSYmHE2BL8kaaKCHgqNlIR/Y8O8zpKZuNbL8ad?=
 =?us-ascii?Q?PSS2I/1kttQf67POptfexSjYTxxrryLe7CMz82GyvyBf/8acNy8azxWKHxy6?=
 =?us-ascii?Q?XA4gpEI3KoBJnPpV5CibXgojksnjkeo4744RKXjmBkfGarC5D99RwKbVL9eB?=
 =?us-ascii?Q?DIZdgVXfLKtsTAE0rf1mx5LkTPmadostEAphl2+MWsJ6GSqT57XrDfwku1Ig?=
 =?us-ascii?Q?tGlYcc8QBUPR/fqVBEF+oxPLPfLgo1HveZp9owG0TRsO4RvPttUNJAuP5ZLx?=
 =?us-ascii?Q?/64r8n4xFGxyTFPgNWvH90K/RUY7Xywlef+YSW/3jMIV2PADxC0ZW3tTWNER?=
 =?us-ascii?Q?cCgkycjyLt/JNU+VHVyXZC+zoEYxCJRGIYMuxaWRcHKyMT4ui8+vyFPDWLVE?=
 =?us-ascii?Q?Up6elGaPT71lMe1ZHR3rUvfKFsMj79H4F5ski5nHZvks0jFERAPXqOYOlvy0?=
 =?us-ascii?Q?9YJUC0xH5nc8uqkGJ/QyZwPdbFc0Y+h10z02D2cuszEoRHZTdXj54k/gXZCU?=
 =?us-ascii?Q?W1wMoiI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/dyxi2bNHg6HuiI+UtCf7TKQCVijNHsZyo2pjHdQSZmL8K4hLc5+eGzplvFP?=
 =?us-ascii?Q?H4RG7AL0UY9lR8MW+OW6NkGLp8nK9lFZ7NFnfPfI/boxs8pjPbpLhU7bLrQj?=
 =?us-ascii?Q?WaN+S5s3pooqD4iHSoxygY7x12JUeHPcfzb7vksGlCGBOl5416e6Wvxdrp1+?=
 =?us-ascii?Q?ILiheY8RJ+W+UfKcEwF+neWxqMi8syQMr2wt4cTZzPVs+ny//Pw47vV9z7pb?=
 =?us-ascii?Q?9vlasGwmWwx01rMV1gM1WBGfZ5892I1MNzuV3FfDm5f1n/h1LrNVry/eK5Hy?=
 =?us-ascii?Q?ZQV6LFC4QHuz3WG8nv4FpmkfnLP+XA8vTWS197IG6eJRfkGmuZiddAlt0uCR?=
 =?us-ascii?Q?yhhCbIC0NgyTVvN+3PklWkEpnlSo+gBTuCvY26Oj1IgPjw7lFBu76rA8/TkA?=
 =?us-ascii?Q?DGBN5TnbPnEmNgRE3sivuVHvcfjUbeEi5+lslDxVFAPu0nFI5cgEk9CGVrdH?=
 =?us-ascii?Q?SiWy/+9SiRMo+P3zhbOVcDlPzY5Gq5N3W8Bcz6y9472S4KZQiXCRv6BzLux+?=
 =?us-ascii?Q?YIGf6aWOlNFYMjJ4MOUsm+ierSrFNcS2EwiNprAq+pnNP//LVgXsh5L62c4t?=
 =?us-ascii?Q?7qzuJ2khiscbQEhXiQOrLvb1lnkx6x45vYcvm/Y25Dstup8amhuFuQaNVvyf?=
 =?us-ascii?Q?fsSXakBI3Zyf6YDq1hOMs9MUBtH6K+SffV53tB8jw2Sfb2mab80SOr/ayO5/?=
 =?us-ascii?Q?RNb4hUgeJ1KwXoqUjIG+pzvZbFTrzTFE7xI2xmmSbdmZ8n2fwCRw6cwYMm+0?=
 =?us-ascii?Q?If87Jn2BvMb0u2Y6PnJagfewgrn8n3OAyKiNQvk1HvE4CdXwbNjpVpovh/G9?=
 =?us-ascii?Q?4+XsTQBMZNvXZ7xiM6u+qyDerC/T2SljMTbfaw+FAILtxcDyq2Wqa+nlczf1?=
 =?us-ascii?Q?Bls5aJcvaH67XvaxQcn3Y2K//VnESjUCQcY0RMQ0p3mL7enFEw7HEyAu+pVh?=
 =?us-ascii?Q?/inOqFjghIkFKVEZRLRr7//pObjmSCUflMsmw7NxTju9+xSeKW8ZLwseqFrM?=
 =?us-ascii?Q?TkqsYdObMVzH4/+hOpT0uRRkqGOULEAPUzZD94qrEyAfJQx8TP1oD7iadhgP?=
 =?us-ascii?Q?9pcI24RRa6tBiC3vn/996waXZTgox4NyS40yM5rfWnBpF1sgb6rwYpfjBWX8?=
 =?us-ascii?Q?dGrxjRkrVccF0p0AkRLOwqnK+bNUii6yrpQwG6lKnmFtoYMbHvaFyvtopPMo?=
 =?us-ascii?Q?YaCB8Kr9ylPJ2Iryl+ddALWUSk09dBopOxl5nH4DioF0qFXcR5uV5M24v5Bx?=
 =?us-ascii?Q?eZeXJYsU7xIG2zvyDCGqgQajixLc2rrczAk8peAg976WEAGfdUjm5KBnHyOT?=
 =?us-ascii?Q?Ux7Ilom69zrBSJs/AgL0RQbNnmRUa9vtfFOtad4omlFxBqYmTcnUQqhmVyJd?=
 =?us-ascii?Q?I3+fuOQUSwvhmV4PetJEi8KtPzpRRJZYDxUdqckF8QdNx8ODHbFukIK+5x5+?=
 =?us-ascii?Q?5Pv7BqhnExUAmhT35SfJqP/mpz4FlWMrQ9vtn3lW9KuNRwKS5CxmRzklR9tI?=
 =?us-ascii?Q?9UjLvWQ9u0wPEni+Nr4BAVheSDTlloPxbYArjefQv2CR+r5xQMrVKcUNuEDr?=
 =?us-ascii?Q?grL2DoZtaUoSd2ivj4hqSHcEu2EkXSqqn8qxmvQZZwm0VJO31AvPSMX5e5eG?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e103ea-de97-400f-1c73-08dc9c02c9ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:24:56.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LE7jZkoK58DdAoRbnHO2v2D9vlw1RXGz+/+1xYlaE6EBk2P7mIDzr5yLthVe6Xkk5FrE8sa0/+ox0025yXtRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-Proofpoint-GUID: G9LCVVx1iqQrI3WjANLlA-1-DyPpeMag
X-Proofpoint-ORIG-GUID: G9LCVVx1iqQrI3WjANLlA-1-DyPpeMag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201525

From: Chen Qi <Qi.Chen@windriver.com>

Patch 0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
is added to resolve build time error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ve_255.6.bb => systemd-boot-native_256.bb} |  0
 ...temd-boot_255.6.bb => systemd-boot_256.bb} |  2 ++
 ...on.build-ensure-VERSION_TAG-exists-i.patch | 32 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.6.bb => systemd-boot-native_256.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.6.bb => systemd-boot_256.bb} (95%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.6.bb b/meta/recipes-core/systemd/systemd-boot-native_256.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.6.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.6.bb b/meta/recipes-core/systemd/systemd-boot_256.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd-boot_255.6.bb
rename to meta/recipes-core/systemd/systemd-boot_256.bb
index 9a6d8e9d6e..dd06b6218b 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.bb
@@ -1,6 +1,8 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
+SRC_URI += "file://0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch"
+
 require conf/image-uefi.conf
 
 DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
diff --git a/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch b/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
new file mode 100644
index 0000000000..6f02ea2f43
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
@@ -0,0 +1,32 @@
+From 9df06062cebd0390d33de9694e9cb1c9fa7b8697 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 3 Jul 2024 23:18:41 -0700
+Subject: [PATCH] src/boot/efi/meson.build: ensure VERSION_TAG exists in case
+ of cross build
+
+The GIT_VERSION is changed to use VERSION_TAG, but in case of cross build
+for src/boot/efi, it's not set, causing build error because the compiler cannot
+know it's a macro thus treating it as some variable and error out.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/33612]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/boot/efi/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 7a60b0ec7e..99d108d6e8 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -65,6 +65,7 @@ endforeach
+ 
+ if meson.is_cross_build() and get_option('sbat-distro') == 'auto'
+         warning('Auto detection of SBAT information not supported when cross-building, disabling SBAT.')
++        efi_conf.set_quoted('VERSION_TAG', version_tag)
+ elif get_option('sbat-distro') != ''
+         efi_conf.set_quoted('SBAT_PROJECT', meson.project_name())
+         efi_conf.set_quoted('PROJECT_VERSION', meson.project_version().split('~')[0])
+-- 
+2.45.1
+
-- 
2.45.1


