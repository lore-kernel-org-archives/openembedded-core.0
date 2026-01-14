Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D612D31A3A
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:32:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.97])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6627.1768383139319950319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=prN+Za3N;
 spf=pass (domain: phytec.de, ip: 52.101.66.97, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcQiqmPKHhjxlp7F/62qkLFvffwDDOaox51b8cyp4PDy2fQrwU4s514azxK7hBJ8GZ5z2uWLzh7DER14ybZnoYtju9auJvAygmQTmP3KM6TwHJwMdFPkRsOw3E1NYZahDm83rIynQ7hh3G44m0mqvBFiCq2F9E+xm8tFtybNPITl+1sem/M0euj0FKTZkC3SM+E/bObSn9adK6IBpxXQzQSrDdAhWWqVqru51rVXvtH28CbtnEHdgUNaPvFaTB/g41ohNoiJl1fYA1WdJji3sUn5bUENbO5lnfTAXL0GYcWs3ajnGvLphHaBWgD9wyeXNlibFEF9LGoVcbG442C3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjdlutggvcKrH+zl8JzOxlKM1/GdoqdkM2JgiH8iJ+g=;
 b=CEy+ePeZdXOKYOXIq1UyvBiWi2i0XyJp6fQn2kvs3Uns3GqNwzz6zpgaTDeYnM84RB9xjddjdfBbw6/SGZDlM0Y2a+V4L9B72bsOy5NiEj0YMa+lRGMxAHvJevDAm8YFr/N7YBguk505pL05FOL0CloTsAkI4+SCGcooWH1Ka/4dhQZH64U9YrNdKU920oPZNjtnFu/tsV3m0HCGSoMlgX6CpexADHV47dkvuJS0y7ZggTrXMZLHV8Q8tKH863sT0c/Ukyv4+MsvbL7J+VAHEuMNLLPDxH/eJnbzilTOOQFaXFfBtsiLKPeUwZ0PJfHJzm4YwL0yXgznRf4SuMPsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjdlutggvcKrH+zl8JzOxlKM1/GdoqdkM2JgiH8iJ+g=;
 b=prN+Za3N/vi5if2W3+WjjniV4pNTi1pDL/Fx2kEYH7oPWTPw+TBBrNKcMhGoK0IkRCFmihsFp62gG24q8UhwPa8Iy+Z3SEjmkCKs9JRkuBcrW8A7wqHTKJsR7rMjZUIxFcbIUDuGwtGejeYBjjD3Abicl/ZRy4ruDYv2ix+9QxPcXr8B97GlTVPj79F9we2953vLs4ZnkQ7Mj6YaxmOSXW3F8lg66ipScU9YN4FC/SIWuDpjK/4bcGV+56EUTcYgCPPCTKQ0mObLvpm0TvHESdFlRWtwe9myg1mKAzIyOs0SEw+HUbFNZlyYOz8ZRZogynmnceovlKLtGvlwhkMInw==
Received: from DU2PR04CA0288.eurprd04.prod.outlook.com (2603:10a6:10:28c::23)
 by AM8P195MB1108.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 09:32:14 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::be) by DU2PR04CA0288.outlook.office365.com
 (2603:10a6:10:28c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 09:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 09:32:14 +0000
Received: from [192.168.2.199] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 14 Jan
 2026 10:32:13 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 14 Jan 2026 10:32:05 +0100
Subject: [PATCH v2] icu: split at '.' instead of '-' for major version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-icu-major-version-fix-v2-1-bc4a5c9295ee@phytec.de>
X-B4-Tracking: v=1; b=H4sIAJRiZ2kC/4WNTQ6CMBBGr0Jm7ZhOpUBccQ/DAsogYyKQFhsJ6
 d0tXMDle/l+dvDshD3csx0cB/EyTwn0JQM7ttOTUfrEoJUuFNENxX7w3b5mh4HdkcZBvmi6qlJ
 FW+YDK0jdxXHS5+6jSTyKX2e3nTeBDvtvMRASGsXEpelybfJ6GbeV7bVnaGKMP0njDRu6AAAA
X-Change-ID: 20260113-icu-major-version-fix-5b8806a74fe0
To: <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>, <upstream@lists.phytec.de>,
	"Yannic Moog" <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768383133; l=1733;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=WKMdjt4ImL72xQTEmxp1vHSEHFK0qXKo2JQxB+h1oW8=;
 b=Cnv+1aA1H4WdgYJNwgE7QrwXgzzvAzZJ/PezG9eExYdCbSeUNjl3m0FkH8xR5VLV+WGOzH+nH
 /J1W+VjPxQ7DwAQFZb88hYUteeOVF+hrEJ/IjQFJwkCr9B32iwWoHOD
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|AM8P195MB1108:EE_
X-MS-Office365-Filtering-Correlation-Id: 802ba485-5562-41e4-5e90-08de534fcd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MVdNK0JOampyalhnZVNkZXNsOUxYb1FXV0djcWNFeXlWdGZUZGVDMyt0aHdi?=
 =?utf-8?B?ZklMcjNRM2dSZUpTa1RpOTN1ekxnQkJlWW5YNmEwTGpZeFFtU2hiZk5kZ1Q4?=
 =?utf-8?B?Sm9mL3ZnRmxBdFo5STN5VUR2NG14UTBOR0FsVXRjb0Zob2Q4NmFiWHZSNXJu?=
 =?utf-8?B?WFRKQjNXWktIOTJCV0dYNWswV3JtRldFQlpGdTZKVktnRDgyUWZ5ZC8vanNP?=
 =?utf-8?B?SXhPaURvOStoWDYvSXF6aUlKdytVVDhVamc0YjM3VnV0WVRNMTMxam9YcmZS?=
 =?utf-8?B?d0pwWG9GbEpJTENVdk93a0hMN1A0aUl6T1VUUXdzYzZpR2lDVnpZR29tbFBj?=
 =?utf-8?B?NE16b1ZGV1RrTGk3UFA5VHVYWnBPbFZYRGZSSmNVRDRYaGpyRFR0bjNlVmFB?=
 =?utf-8?B?bHBJR0FGbVFZVDlPbWdnV1NVQjRyRXljaVJyd2NmbVpkdVhQYmRqdkVYbE1H?=
 =?utf-8?B?eGI0aDJuUGxnVXhjdjFNcWhkYWVXVWcyUzVDREM1M00yOXdqMTdPK2xjM0pR?=
 =?utf-8?B?c0FVbW9wc2hGL1VuOFVwVWpFTlFLd3k5YTc2SGhEd2RNbEphTEN2UU05S1ps?=
 =?utf-8?B?ZUQrYVFMdXdGUHB6OXlLZFc1QnhpdU0vdmNuVkFHY0RTZE91bXYrNHkyejNK?=
 =?utf-8?B?cUhncERNRWNYYTVRS1dTM096ZXAwZ0FmYXo3cXIrMW5HZFFJbm1iaWd2Ulpu?=
 =?utf-8?B?VkRwNWpWeFZxaGtIa3A3dmhuR0pVVlVySWtQQUVCT0lhc1Q1ZTJqTy9OM1k0?=
 =?utf-8?B?Q1NpalhYSnZndkM3cUYwa1g1OXJRcFYvU1pOSWgxOE4xc2ZqRUErYzlsbmMz?=
 =?utf-8?B?czVOOUNOWVZ0MlZYRWFrVmlaRThSb1hVWFRUakR5K29KMkpwaWZqbGlxTlky?=
 =?utf-8?B?ek9JYzhiVlZaamhPQUNQbjM1d1laWU4xODBOeHFteGZUS24rclNGalBwa0wx?=
 =?utf-8?B?UE9BUjVPOGFmb0V5ek9yeUdYM1FXZVRkMHBSMEpTRFdsdVFLaGhkd2k5Rlps?=
 =?utf-8?B?cnA4clBOV0M0UVozemRYYm80WkcrL0dpQS84cDBSdnZCYmFsY1dLNVNsajlZ?=
 =?utf-8?B?aWhhRXowR1k1SEQ0MVhEbXJ2akFTRWVma3lLcU0zU1dJOFpaUS93bEV5T1Fr?=
 =?utf-8?B?WDgxV3dvSjlka1JzVU45SVNtb3RCUzM2WTNGckZQVTNyeWxObE9KZTVaSlha?=
 =?utf-8?B?dUx6U3puU3VqUGZkd1oxU0JwQlVqQTVHNXp5SmdRS0JYeGNuV0J3Tk1OeXRK?=
 =?utf-8?B?aU9Ta0ZHU1BWbmlpZkFUSzZ3NTUvUkh6bldBNklKODVFUmpUbHdLbzJBVXE0?=
 =?utf-8?B?UzJvQm9RVVJ4RUtPVXg2TjJGaFhoaXlQbGtKT1dHQUlySlRtVjRTUmVSMERq?=
 =?utf-8?B?R0RGVnJWTlZDMmlKd0xhU1JjNmV6WG9DUkVncmtNN3ZYSWZsVWowQVd4WEUw?=
 =?utf-8?B?UkJwUmJKcmlyNWkwYzJjVHp3cmNsZCtuWjIrVTBFS0ZCbEswYzdtSitqVkow?=
 =?utf-8?B?bVh4SEgreklNV25KSEdHeEk2d1kyMnR2UVNxMTZRYm55ZFVYOGp3cEJ1aUJp?=
 =?utf-8?B?U1V0NjA1SkJLSVhicFJGSndpdEltQURQbFJrUmRKeUlpdkoxRHVrdVEyQVpN?=
 =?utf-8?B?R3NScXh1MjBGVGwrYUtEN21iNjlTUnJkTkZCcDl3N2k1S2FTYjBmai9sT1Uw?=
 =?utf-8?B?RlZjRGtNSlVaMU9aTSs1dW5DYW9PajlCK0p0WUNtQ3FZc3piK00xS3Jsd2JB?=
 =?utf-8?B?UFJpTGxMek0vNFdIR1EyWU45MVJjZGczQndrS2owc2pFa0dWTmJaVExmUzRF?=
 =?utf-8?B?WHJtSkwzNHp1OFVsQWZBNEVtZ0ZjallJSUZBTXk1eGdScXF5VU5RTkQyVmVX?=
 =?utf-8?B?aWJpUC8vYTZkekorSmRrR3ozbVFOOElPeWNCM2tsYWdONCtBNmllWGk1NnJX?=
 =?utf-8?B?RTkzeWdwc0Z0N3RrK1BDdjl3b1BtL2VBRmVrY3NoMWRxRzlZRGgzWnVuWEJz?=
 =?utf-8?B?TGVHejVmS2YzdmRNdWNIZ0tCa1FwVUFoTUVoYW5WMXJIRHZjenpMV0hYZE9U?=
 =?utf-8?B?Qk9HenEvelpEVEM3QmZ4akJJRnBMRjZOQkdCN2hSaEJRblJUdm9mSnZEWGdG?=
 =?utf-8?Q?HVN4=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:32:14.1482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 802ba485-5562-41e4-5e90-08de534fcd21
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB1108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229311

With version 78.1, icu adopted '.' as separator between major and minor
version. With the upgrade commit, ICU_MAJOR_VER wasn't updated and still
tried to split versions with '-' instead of '.'. Fix by using '.' as
separator.

The error was missed with poky, because PACKAGECONFIG does not contain
make-icudata. See

do_make_icudata:class-target () {
    ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
    [...]
    install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
}

for which the install -Dm644 [...] command above would fail when
PACKAGECONFIG contains make-icudata.

Fixes: 479d48503dd2 ("upgrade 77-1 -> 78.1")
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
Changes in v2:
- improve commit message by explaining why icu error is not seen with
  poky
---
 meta/recipes-support/icu/icu_78.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_78.1.bb b/meta/recipes-support/icu/icu_78.1.bb
index 8827f05f5190ddd364fd9f0a139ca6588809e04e..ee7245c27bf101da3623658d044239c45859d6f0 100644
--- a/meta/recipes-support/icu/icu_78.1.bb
+++ b/meta/recipes-support/icu/icu_78.1.bb
@@ -13,7 +13,7 @@ CVE_PRODUCT = "international_components_for_unicode"
 S = "${UNPACKDIR}/icu/source"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
+ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
 inherit autotools pkgconfig github-releases
 

---
base-commit: dbb0defb5e345b17211ca54d2b9d6237dede60f8
change-id: 20260113-icu-major-version-fix-5b8806a74fe0

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


