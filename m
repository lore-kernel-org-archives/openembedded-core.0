Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525CAD111BB
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 07:35:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52516.1730705746993318601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 23:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10388ffa1b=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A45BWNo029473
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Nov 2024 07:35:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0hjty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 07:35:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTLGEPQFzZf8phzO3u6x6Dc64FYDABnG0P4DqWbhlx6HdMRRc5O4Hyf0HE++tlCIB0FNXV9xvo+0zFkR7hy6R1QdlmKi63g0BhSjwJTJeBH3fNFDly9TD16rghsVQHApi6kUOMJL7fkgUny+ZCdLmvK8dyXa8dGNgyM1stBv0kYZgcRSPRzBRe9fAo+0XVrc+1R4iYs9vLbuXcPJPz+w4aOK0U/udvFQOdHcy5YHFUj9Mvm0jw8wtmrBT8Zh4fN8LzPXxWpMZBtptiMSJs+LdqqaKZBmWQFO2oQOt/28l2xrdoUDqLDYuX4/PofctDzoZZRZW49K84acILeL+2+7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE+n55gl+EFjnhgEL8rDMQA1UxmMcT1EFp4xqwFCIuU=;
 b=I2LiSpN+qaMBbwAPejZSOZVTFeBvBMro89x8xf0dj8EEwdfyK8IsTVoQEa4QK+8hExwf9gGewdWBXhVCBJBJgycW5Kt+WlHXVA9X9nfv6AHeH/5GCgVlQDeBDhaAVROpV09kxsZmMd7TKoqFsc7yu+4QoFj6/j/g3XNWZJg5JQcXbwqvIGpXnEXTJ2CalDRABXIu/Wy2aQPDYioUKxd9YV2dgfDvz3ppdQ07KykCer1hKzd48QQEPXLJxWMWR6uiHK58aG0HowZ1GhV37mpJQ5ZagKb7DR8sGibF+BeEvInM7yZvFtZvtauBk4hTuYTak3Cq/SkSWYnA+L3+ITHPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 07:35:39 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:35:39 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2]v3 glib-2.0: fix glib-2.0 ptest failure when upgrading tzdata2024b
Date: Mon,  4 Nov 2024 15:35:23 +0800
Message-Id: <20241104073523.3352231-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104073523.3352231-1-jinfeng.wang.cn@windriver.com>
References: <20241104073523.3352231-1-jinfeng.wang.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ff9d2b-8cb0-4bb9-f512-08dcfca347c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ulmXr7QodQ/jWASC8nK+kMfeiL3qwBtrH1Og9F73dlvkLKcUKU9DNA4MtSI+?=
 =?us-ascii?Q?XcMiQzFAewJUV/8Egb0a0SGZkBo3Jm8Eu5JQGrtJDnLDYnANm97Xi5nRxSIj?=
 =?us-ascii?Q?Hxgf5SQ3O8eDPU7TBoopROWEL3VHOY0X9UqoaqMq5YQpY4A44eYOQWzNN2Do?=
 =?us-ascii?Q?qxGS4z+0j6EofWXpzQBpjNBO+bwOr1WmBPDQvA5BrH8uYIusA5yWpR1yVmA2?=
 =?us-ascii?Q?tuWOcpoN9U1kwK8O877S8EDoSelI47Jl3hXafUbMHUFAcnYUgheCk9xN0ui4?=
 =?us-ascii?Q?QjqHrf9BwLbPkg22Ou280gI5GM38zOv+0MZZdDg6N38Qev1xP6VprSm4oobZ?=
 =?us-ascii?Q?Qvu2B58nAKcDkxaGLacH19lQB9nLL0E1Y/v/JcFtvvtrBPXSWkslBUSUsqIM?=
 =?us-ascii?Q?1+busSrVIE3JFEWdQ0HkmWFcQR3wyGES44x2Pq+EenPTRyk6M9uuw8Cm7qMB?=
 =?us-ascii?Q?XayVN7IafGmUN61Yell7b/RCAg+mGQVyteCP3KsJ5NwahWIXN5oPs1crJix6?=
 =?us-ascii?Q?Qo8/4x6PAQga+ns4lxDZYlDXLfFVTEdo5PO0XOyam6cKemIlFbANd+nSzSap?=
 =?us-ascii?Q?E5BwDt3jsej7qgSj7esEPQbjXYPtNCDZ1pv28zO+EEKEudV2DZ+2yVh+Rdcv?=
 =?us-ascii?Q?RAFJxyIOEa3TerIg3S+KmVrFVUzc2Z55aa6f7Y1+5bjw0ITxnAq6O7A74UZX?=
 =?us-ascii?Q?cJ2RxlxLnt6nctjflT/jTBazHi3MW0Ea1U6TTmyCtAK5D9LoYJRM17LSbbod?=
 =?us-ascii?Q?XqAroFoxKGN5QNCtmX+m0ydV+dOB9/3n7Hw3zfnyPaojywvAeUfTDYQLTVMs?=
 =?us-ascii?Q?W7fuRwYRz/lRKVyjX12qhZ0c/g/X61zdys08W/xiJwfGK2WmkOa6oAtD8QFh?=
 =?us-ascii?Q?gDP9pLoRLVePrQ5jMkliZhGk7s5U44msnjAQ4Wn+UzvC9m+QrzTC3VgA53fy?=
 =?us-ascii?Q?842RJ4axM8mbYhRVOq7s/eJR1vIY0yODYqIumIBiUq0TOQ0feEHYxr409IFC?=
 =?us-ascii?Q?JYgLTqJu6ipnE5o0HSBtYmwc1tKejdlsFMPhfHJTxcVRSyUi7VUWF+Pcqcq1?=
 =?us-ascii?Q?xJlFJuHjkJYISiQcaqpoyu8wWmPCtxwr7WlJQ7oE00Qjdb7kFYtHMODEqDET?=
 =?us-ascii?Q?w333EBmMl6Inm3sVaCv5hEPpjLgfazJSoHfvV2wbxDiDHLYGdSHkI5V93w/F?=
 =?us-ascii?Q?8dJKB/WOHzoOh1JdrhVDx/B4/nkN9pnV7TIgdqte7gAprIbHJIaoRDlefV9b?=
 =?us-ascii?Q?3H8Dr4BwVGjYP3l6dlBxQPwCznVzbRnmWgwpcSf0iOWNQaU/n03B4j/bNx79?=
 =?us-ascii?Q?Sh3pHK3XTy6r06FYJZfrGKOmk2flr6kgaUP5I+TqK5+XYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LpS4wmHhFJJa+Xa7qjGkl6ETAkdwMCf8w5rCS12RJCTEszo07ZFdX/r4dS2l?=
 =?us-ascii?Q?9RFP/ERl01UuVJFo85FSQkW6ihzqbLinfxcatFWZXKqeX8dEmdTocaX+/+k1?=
 =?us-ascii?Q?B2TqdWT9eO8ivsXEgP3LgYkMb0BYfGn1YbM/nvzM2pFIv2pkZJrU5wWje8mu?=
 =?us-ascii?Q?hz09XCbi1mDjvMzaYut5/FyhgMpwP1S2D4CuttcmlPBMQvto20DPvDliJzaw?=
 =?us-ascii?Q?YM7K3UwHqX0rvOdDUqK4fSzmpUUpphJF/NV1wh3X2xZHwZYH8M0ng3Sq5LHP?=
 =?us-ascii?Q?1AEh5LSh892MX9h6rnEhWCUFPGWXsC8UaRD1Ael3YxSNsun3SRH4I4pndlAO?=
 =?us-ascii?Q?d0ghvP32r6xutz9ru+DH5X1fGgIDh6jFWIlHAK/4B4xUTOKTJ9iKMBYBngGx?=
 =?us-ascii?Q?Zoc2354CKkVrrkgC+oITRa1BPWNX5/ZLx10okAkzmnsx0jy+uWGb71V4l+vi?=
 =?us-ascii?Q?xGXNDlfalGL4n92kufHiZLk+MnHdYxBFiIMrNy7xuiCvWwQCV7l+aWDf/E5i?=
 =?us-ascii?Q?ujjrsTAg7V+U63+xcUJ/vZeGzjpvAnwhW1s5jM87KtM4BdszQ3pWiX0PPaW/?=
 =?us-ascii?Q?Pg4HVdvOqDfa3M6HQdXDdb2etejic9BizKFZYLuIfkqBpLqgzPWcUGwSL5HK?=
 =?us-ascii?Q?kKpZJkQvl4bdsByBYc9N9shot2S1JzQIsLZnCfbEqSgZA6VxAQ9jIHgk4coG?=
 =?us-ascii?Q?/okOE5m05sSHPpzUrnuUHaoCWHryyCkLo3yVeWbUpWJNABP3ew+ltnucjJaP?=
 =?us-ascii?Q?tZJiZQZ31GS/1HDeTgetbqRQWxlEmz530vsSvrieEATgh/18gdqXhGI7Opfz?=
 =?us-ascii?Q?5e9JZMUtMadavCTLnR2wRmJ1YR3He7zJtULJdL7UrdnbAYczwbvBHiPWPM86?=
 =?us-ascii?Q?4snI0Pm+iKgFqTKIxyQ6+qsPbjDf8EHXaQ6m+muGH89bizNcr5zYUwU9OXV2?=
 =?us-ascii?Q?eXT/PCw23ukayzQ0GVUGV1Qhxeq3c3r5y02+EVErguKYwLV6ldOWK2CTnqZP?=
 =?us-ascii?Q?hmMG/ZIWK+naJnMihlhs/vXaI1GoZtbQM8HQKn/INMH5FZ0zgF5bZDzNfAlG?=
 =?us-ascii?Q?3r0Fi9WKpt+JlEQcZsyDnVwQnyoUUFNXhUp9zPAWo83mtKYz8s4fzi7whjRi?=
 =?us-ascii?Q?mIa+DEgFP6Y4XDAJI0KDB9ebPFxr7/YBs9wQURLsnjfAjvvLP3RcFqcbzHK9?=
 =?us-ascii?Q?0dUmzQymO2akm/9iSs89FZ+SZy0lCOHG7dDSgmtFV6HOnWxPlnEs3EYVkOKT?=
 =?us-ascii?Q?Ag06f4YE9/g2RkKdiKK4hnDxE6ImeEvD4eBDAFlXJYRjeZOX1cy8rRRak+k1?=
 =?us-ascii?Q?TAhsOoHGV24V53r1lkkagIDXw2GfouEdOIBrY+h6zoMZ2IQzgzhg4jMB3IXz?=
 =?us-ascii?Q?vsKYh6INnuUaxagRiCr7h25b9tNEswUTrb6bEyuEUxPCBTWmoVTFykhAjydO?=
 =?us-ascii?Q?sfpq9VJH5joR1pWk4zcdwh4CbdNUKqoDi4DHEsmUVlW6Ekvr2cS798A3UcTc?=
 =?us-ascii?Q?hlSDtwSJt3rKXYZFfrOkYg3az+uWERQZVTVbr55+NhMAE8kZquL78+nJtX5D?=
 =?us-ascii?Q?IW1RySikwKR1n1b2g9nF7ehideFrDxNmEwg+AuyQudXoHSjXaBgZmPOGPXOT?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ff9d2b-8cb0-4bb9-f512-08dcfca347c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 07:35:39.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xgk7MPgBmrzSILPtUCU/FnXVJOhkKJ56WBSpO5LP7s0vIXT3yw0HrPU9N8NFMc8s099DRruMYOvBOZltZ2fOI0unh8YKV354OWrJe3/UKJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=67287951 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=jKjxfLc-AAAA:8
 a=GHR8O2WEAAAA:20 a=xNf9USuDAAAA:8 a=phTsP5NMGLrc1fqbUHEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: R7BuRNmBFz0KPfpLOAXX0KPyxNVzI9Sy
X-Proofpoint-GUID: R7BuRNmBFz0KPfpLOAXX0KPyxNVzI9Sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_05,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411040067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 07:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206674

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport 3 patches [1][2][3] for gdatetime test to fix the ptest failure.

[1] https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf
[2] https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a191171a
[3] https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../files/gdatetime-test-fail-0001.patch      | 72 +++++++++++++++++++
 .../files/gdatetime-test-fail-0002.patch      | 65 +++++++++++++++++
 .../files/gdatetime-test-fail-0003.patch      | 63 ++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  3 +
 4 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch

diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
new file mode 100644
index 0000000000..e78d96c3ce
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
@@ -0,0 +1,72 @@
+From 729d1cbcd599e848bee07c72a276ccc02a06ddc0 Mon Sep 17 00:00:00 2001
+From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
+Date: Fri, 11 Oct 2024 09:38:52 +0100
+Subject: [PATCH 1/3] gdatetime test: Do not assume PST8PDT was always exactly
+ -8/-7
+
+In newer tzdata, it is an alias for America/Los_Angeles, which has a
+slightly different meaning: DST did not exist there before 1883. As a
+result, we can no longer hard-code the knowledge that interval 0 is
+standard time and interval 1 is summer time, and instead we need to look
+up the correct intervals from known timestamps.
+
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/3502
+Bug-Debian: https://bugs.debian.org/1084190
+[smcv: expand commit message, fix whitespace]
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index d46f653ac..2eefc4106 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2930,6 +2930,7 @@ test_posix_parse (void)
+ {
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
++  gint i1, i2;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2953,16 +2954,25 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
++ *
++ * Intervals i1 and i2 (rather than 0 and 1) are needed because in
++ * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
++ * and hence be aware that DST has not always existed.
++ * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), ==, "PST");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 0), ==, - 8 * 3600);
+-  g_assert (!g_time_zone_is_dst (tz, 0));
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), ==, "PDT");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 1), ==,- 7 * 3600);
+-  g_assert (g_time_zone_is_dst (tz, 1));
++  /* a date in winter = non-DST */
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
++  /* approximately 6 months in seconds, i.e. a date in summer = DST */
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
++  g_assert (!g_time_zone_is_dst (tz, i1));
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i2), ==, "PDT");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
++  g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
new file mode 100644
index 0000000000..d97bec12d6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
@@ -0,0 +1,65 @@
+From 2702d7ff73649c05297105bab8977e2a9d28fa0b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:03:19 +0100
+Subject: [PATCH 2/3] gdatetime test: Try to make PST8PDT test more obviously
+ correct
+
+Instead of using timestamp 0 as a magic number (in this case interpreted
+as 1970-01-01T00:00:00-08:00), calculate a timestamp from a recent
+year/month/day in winter, in this case 2024-01-01T00:00:00-08:00.
+
+Similarly, instead of using a timestamp 15 million seconds later
+(1970-06-23T15:40:00-07:00), calculate a timestamp from a recent
+year/month/day in summer, in this case 2024-07-01T00:00:00-07:00.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a191171a]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 2eefc4106..728b87343 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2954,19 +2954,16 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
+- *
+- * Intervals i1 and i2 (rather than 0 and 1) are needed because in
+- * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
+- * and hence be aware that DST has not always existed.
+- * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+   /* a date in winter = non-DST */
+-  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
+-  /* approximately 6 months in seconds, i.e. a date in summer = DST */
+-  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
++  /* a date in summer = DST */
++  gdt2 = g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_time_to_unix (gdt2));
+   g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
+   g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
+   g_assert (!g_time_zone_is_dst (tz, i1));
+@@ -2974,6 +2971,8 @@ test_posix_parse (void)
+   g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
+   g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
++  g_date_time_unref (gdt1);
++  g_date_time_unref (gdt2);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+ #ifdef G_OS_WIN32
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
new file mode 100644
index 0000000000..dfeec97810
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
@@ -0,0 +1,63 @@
+From df251923fb2c80cc7acfe99aaf8c98d7d7cbd29f Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:23:42 +0100
+Subject: [PATCH 3/3] gdatetime test: Fall back if legacy System V PST8PDT is
+ not available
+
+On recent versions of Debian, PST8PDT is part of the tzdata-legacy
+package, which is not always installed and might disappear in future.
+Successfully tested with and without tzdata-legacy on Debian unstable.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 728b87343..9e1acd097 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2931,6 +2931,7 @@ test_posix_parse (void)
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
+   gint i1, i2;
++  const char *expect_id;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2953,11 +2954,25 @@ test_posix_parse (void)
+   g_time_zone_unref (tz);
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+- * but passes anyway because PST8PDT is a zone name.
++ * but can pass anyway because PST8PDT is a legacy System V zone name.
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
++  expect_id = "PST8PDT";
++
++#ifndef G_OS_WIN32
++  /* PST8PDT is in tzdata's "backward" set, packaged as tzdata-legacy and
++   * not always present in some OSs; fall back to the equivalent geographical
++   * name if the "backward" time zones are absent. */
++  if (tz == NULL)
++    {
++      g_test_message ("Legacy PST8PDT time zone not available, falling back");
++      tz = g_time_zone_new_identifier ("America/Los_Angeles");
++      expect_id = "America/Los_Angeles";
++    }
++#endif
++
+   g_assert_nonnull (tz);
+-  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
++  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, expect_id);
+   /* a date in winter = non-DST */
+   gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
+   i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0855e6eb00..5ee5375d0e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -226,6 +226,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://gdatetime-test-fail-0001.patch \
+           file://gdatetime-test-fail-0002.patch \
+           file://gdatetime-test-fail-0003.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.34.1


