Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2626C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 07:56:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6954.1720684619348940162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 00:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7922740ab3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B5DVwe020873
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x4pvv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THbyk5naW5pYdVts21W5rnP6vDyIRojmybIoRHh7E5HbqsqaNHn+dsOCNFtOzLUX+njt8W/rZUnKyHzu6hheI2C4hpiuRxxffd6MX30N9tfFtH/FYybZjw6uZNaMC1dM5WTsWjm/EPJeOdOfnv2Jenaw8ovqgLQ4g8syh5lPff48lmjKPcm4yJbMwMV76z4/2aFCCiATZ+ExtDk92GwOZ0vuwiJLm4qZ8ANU5+B3AjqYCxFREOGs/Sf+6taTZ3zg3U1HsRnX2pr42O9wGwuVJnLVpIdJ8jcOM3PgeTWSdJycv6gO7hbzq/7Fc1K7zAls/H6xI2eCAt8BfPiR3ClSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GomCLokgEnjlbq/v4/iEekpQSIIAo520PvkiKJMdtHs=;
 b=KtmlNpwqkEusqrsLzZD9PAhC0hzK+HF/GnOFE+D72EfhJktE2pXWzaugrXLz6pz6cMwPU4RbjyT6JEu63bs8T68QBMEYJ2iQb0FQkbdR25MAtcrDU3pkcdjBjPrxzQOUbkrzL/ENWiAJcdk6gJDrbH5SudP6e4O9px30SMDzHsb2rqh+IwCc+xGet+lF4dcchNfLKdbs4IQrGtVuGWfXuSOKuq0u15IgaZGHmqeieSmim8lBL4xmB+uBBmQlfQs+5CKMZSUyz1eK5Y1VfuNUbBvFVE2klnLn7OwSy9smbh592dEg6QJwFOdBSB5+a88+Gje+04b6NfEdyomv5BxcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:56:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 07:56:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 2/5] systemd-boot: upgrade from 255.6 to 256
Date: Thu, 11 Jul 2024 00:56:34 -0700
Message-Id: <20240711075637.3023203-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711075637.3023203-1-Qi.Chen@windriver.com>
References: <20240711075637.3023203-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: c41ed368-966a-4067-b7ec-08dca17f0586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9+arokeGefdwQN7HJpq8r2NKmrcPiPuZ+uC9vzgxQd86O6gBdvqvIlgaDGRq?=
 =?us-ascii?Q?XBCen7bImsbeGSolO1PmqywAecxaq8/NLIjmWMGWtoh/7+QQyC8320XRGaR6?=
 =?us-ascii?Q?+IOkF5EiShfso0tk1LcqN3bdt150yrl7MAYhNGNjabM35MgHdFS2jvZZrlMB?=
 =?us-ascii?Q?rkxbUdsk/yy6uJGoGgjomc1qNPBPEQ7k1EFsqw6HZB8X1b9pD79vyqiRYxyp?=
 =?us-ascii?Q?ska8xFT+nCB4T2YxsWMNLNupcsAuiRqjsNqlN1mIGa7HrBTqDqHAem7o3dlu?=
 =?us-ascii?Q?pLFjPdwD3nKNR0OO1o6D+U09ttKLXEwFErxrJCIfMK24E+Ys0YZns7KG3arM?=
 =?us-ascii?Q?GZe8GNW4C3u06zJPw5jkyfOrzVkJ7jLiuvU+GFg+6x8tptE6GWY/7HqrnSto?=
 =?us-ascii?Q?hwFP6xsgH6Ndub26EiA3/2xZqs8JBdpYHkRT8KAhECNnWlOd+FlmlGN627SH?=
 =?us-ascii?Q?FXLuIdDVacRpS/Ti9p4EF6LVeKSRpN2MpKf6KV+kNekHq6ThN93JAT6hablm?=
 =?us-ascii?Q?fD8fZkZpadhQw8xU2pzXlDC4BMAoRN3984WRuppsGt9PaLz74fX0mMwI5A8K?=
 =?us-ascii?Q?xnkEV64CLKx0OjjFRMlGyI16ClsHAM4hLjE2LH3i3Mfg9N/ajfJrMRqm1dtC?=
 =?us-ascii?Q?5KmgggTeY4eUkGYeIUK76sZNGD3hUEtlWyxx+5v6QFj0pAfMnHnU41SbsMsd?=
 =?us-ascii?Q?gPDSe6Ok/Gq17ZyB4FVzhaNhyCc3vFFk4ivfKUYcLRZCV7ESWE6zSzBkz/cj?=
 =?us-ascii?Q?J/ya1KdoOHMAFyiYMHTV2/eh2okPjUuemskHxHsCTEgiePG3hCoof+bJT8wU?=
 =?us-ascii?Q?EhiIDsNPAJIDQZ2jyBJlYUdPy0AaJg9DknSKwpw59ieZSoyjz33aeYxsthQe?=
 =?us-ascii?Q?nJ6zHuAx8Oo6AaKh6oyFQ7KSav5zpUIcu6uM9PpkdWZYOb9WNEdJceWsM+kj?=
 =?us-ascii?Q?p0enC4fl0o2lIHQJtsG4Qip7v3O0k5k4mNl2INi2voWQ4ponsInaTmfEZAmY?=
 =?us-ascii?Q?bPPwqxvBCDdMBzW4xk3egnmMm+iGxtZ1RUXzjeMThGVsXahKCeeG+P3+VXar?=
 =?us-ascii?Q?BL/T1iICKOMB0vR869prR6ufTH17batqh/8G+I1WM77r3Uic8ZtOHg6LRbhf?=
 =?us-ascii?Q?ipuX4hxzuqrmTIXAu2/nITHjsLS7bh8/dTwvTqD4eOWW/yxi5wFFxwTIqm5s?=
 =?us-ascii?Q?bg6gVSEdYjJthriEuOe5a0PMskbEf3XO1FyTHbx+0XJ1RxJ1YFH0Rlgb/v43?=
 =?us-ascii?Q?8Ly9QtgFWiOB8VWdNPYb52FnfvH+wc3Ob+SlbxE9pjjKSU0WlEzoDJgbgnRQ?=
 =?us-ascii?Q?Hn6LaMpS9b5rkmaAHG4t7/WluU3ZC5pZsJJiQbOrhPXtQNVAeHn28YjY/xTZ?=
 =?us-ascii?Q?ACwbdd0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8+baT295LhsXEh6DtHJuRMIMLL2/UID57h5oRu11I9eyY/I0DEzCBZe6o/dS?=
 =?us-ascii?Q?nMUhz+gnJmk0rKovWBxMhmgVTa7FLwqHNu7OjRv5aK0yp2+XWA9z5DrAL2Op?=
 =?us-ascii?Q?v29QaQKYy6+7Lf/0X2T6ixGtTpGuOKaEHl/icKY/vJQRvpAFaOKclG1eWiHM?=
 =?us-ascii?Q?ZQygAjAigRKvr4U4sCdLMNCCDJsmJH1lV/OTtbiCDBDosmSscvVbudpIsbjM?=
 =?us-ascii?Q?6Qu12cSKAQtIcSelNNaPbSvvTEMBoyZH9rsQkvfSY9aa6F0LHQFLKQxcbetQ?=
 =?us-ascii?Q?h+VpCPhSDksDo7IMvgvX5bz/yXbrhm7eqLgmFqnFOTO2c8Ngnx4L8ApwFBCu?=
 =?us-ascii?Q?AQzJYvWm+8JtLSlo9Dl0usL8RkollzlQ6JEws5HWDKK2YUKeOxerb7DvoWj1?=
 =?us-ascii?Q?6SYFVUl+9xdFSEUPAil+HcIKCFw4EV+GqXbEDGALFiR2Va3EdjzApATOoPWx?=
 =?us-ascii?Q?epMGwvq7VSTsWAAbVkBrbJvWXn62piT94+JuWbof/fQlWRjWa0FJ7+cmhR1Y?=
 =?us-ascii?Q?NvTSDS4ROIPPv+OCfEtNhz09e7qbQvzGyKEY2wiJV3B2UDL/P6qJs9IWbugi?=
 =?us-ascii?Q?sbWGTZhB7R7S6Z0/1wTTFfayDsp95/84L0IdyEpxvRD2a9zc2omMy1b3LJeR?=
 =?us-ascii?Q?7wEP4ku8aeB8IbFrPRudRrIWzxZvzz//lEf8xzZdP3ByL9kloFmBR0WT+FC3?=
 =?us-ascii?Q?3qmQoeEzvcD3D2Wa3bCNqj4jeHSlx2Foh4cuHPxZi0D7xWY9z23mOQfoKCDO?=
 =?us-ascii?Q?uSxsNbjqEf0xeJ/2w88EIgYUC/lynWiBSVlJNU0zJ5uHQzqHsTBRr0KIKKvw?=
 =?us-ascii?Q?rvyUhhWW6FIELaE48q1rgTXr6eOAbja/+BRhnp97X7r/H/NGUlek9/qFVPp1?=
 =?us-ascii?Q?GeoV5334A52zTaOBUfyeA1jhJmQDGqqSw7ePyE2yMQCk/J5GiiYUqjPc8zGg?=
 =?us-ascii?Q?OorelvhiappXntLj0HE7DndYjMMTzAqGt35mCWBYQ04gp3Z3ZHFS+ZUhbBii?=
 =?us-ascii?Q?QVdZ1F2zOGOM752VbFt+lBL5GcOROLYmkYhvx2mZy/9g6vfK59EtLR5Uh8NN?=
 =?us-ascii?Q?ozUYNpJ+tEd3MtGDPkufqjVu+DT0hFu0CcSqGDNXta57DpmToWViVwpzqnwo?=
 =?us-ascii?Q?PWhI6Mf/sUeuwGgWy8Yb2IDjCcQiveOhCuMdsHBhKVVdm7OJr6pdhq3hk1i2?=
 =?us-ascii?Q?cj0WaEnjeHtj9zDyjoOvgRENxkVj7gUAasjdu+1gZ1RJHoUrb5YS9seKeemE?=
 =?us-ascii?Q?pb5F+2+JTLSRscpOvJ/aBfrhyGtnnWikC6xZSF/WG1ygVRvvfGxNCLWtL/HX?=
 =?us-ascii?Q?/NJbNZTIpnKRR1DabMtAzC+epVPkQUQ5Gku26TxrW5hLeQa1zZaT5KE74scZ?=
 =?us-ascii?Q?qRJ+s7IfK/wd09ngbpVw9XK3p4dx3E1/fD9jRJaNz8wkWdFZShKBCfZV05nP?=
 =?us-ascii?Q?M7O/v4+wexkAvP69PhKQejnfyzsm5euQBN+NcW2Ew/u5P9nr0d66w6RV0agc?=
 =?us-ascii?Q?Zw9Dl8YHw7PCZ93+gceZr2QOqn4sIrRJYSDkOVwPiV7Vby9AKgH2MZfSSfK1?=
 =?us-ascii?Q?EZ39xQhIJbd+EzMt5RN/PiK9k/qlikBs+u0hCOnkvTj8jiije/9gLqZbh5YD?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41ed368-966a-4067-b7ec-08dca17f0586
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:56:50.6486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvUhpTi7hzfTD0rWTiGe7tyeOs+23oCAktYpoc86sl2lqAzVpOMHYJF8/wRPHqp5CXAAnBxLJ+3K91nrYppecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-Proofpoint-ORIG-GUID: sEWj2on8_UhhVSVe3bL30bkqLL9Z-QIC
X-Proofpoint-GUID: sEWj2on8_UhhVSVe3bL30bkqLL9Z-QIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201765

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
2.25.1


