Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1054ECA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:57:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10071.1790942263180485650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=psmu1W8n;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF68oUuJb1/0U2/kgtqGpS8YXc191W3rsSoPzelOqI8CiSPRg6zIDZldFV9ZIre/+sS5Tj+FdHlSWUqVy+N0zO3xH7R7yWS6hjTsM6rdw3eqaAdHjO1FZHVy33d9kmBjcTuzACiPhTt7eI7Pj2pn2yOQSZw7Nyd4hjXolBRw+/wC4sNZj5KfTgpIKu6c3yZCSqneklOxii86WzfwKAFphCx42WJ1gYCYSV/xuHMCcbDZXfxorzAZ0u8uCUIiDmlSit7MwLwG/OBb9a088zafa7XWPjLKgpAtfhyh4EVcZ2okhD0403/wVg5HxvsqRmRDOIAiz0JI4Vc4cU/lAb6XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM6TIfVxCaiXuVuDpNKqEPAjQB6tMC9//e1RXtjjxPg=;
 b=EN8x8XRk3fnLmc6oOV/2G7By76N/UNs06lvfuIxjyLQjEeiApTkXYqp2gLMhXpYdrPDbBuD9RWxqUhoOeb+X2yDbSokI5gXE6PMtie2r3CSCLaNOFpo05ioCoZ9fwToFgN2KCD7a/Zpxn9JhB4yKUv8wZiXEIZT6CDReLHGgIpi0xenZWQaOiz4b0/bxZUI2hSoCQ/KHRGqnQhTBiVkXsWl5O0bAB6l+oXR+weerGOYVkbyLrosucrp/cXehSfvBbzAK2bAmt2j631f5a9r+v39SJVznOMcXZExFVA8vD43FqNQjDkVkWpaeSx90qDFocz2PqMK5aG8u1rX/W909SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM6TIfVxCaiXuVuDpNKqEPAjQB6tMC9//e1RXtjjxPg=;
 b=psmu1W8njqBrZiskxoic1oglhneNT/owl8sQ0ONp/NOg0yGrdml8GPu4qzBsc7hEw5BfsADC/iZnYj3FDeNPfTkNOo83mNTPoSKmP2KZkIazzDGmgJAYFyaigBnz9K2IXs8AGnLG9e1k+E2zWOIWDfSPwISQJTQ7/cF6ewDxFR2m0kYnmSb5FFbFtd+zfb9+eNlZ7pBFN2qdLladWXoPRvnFM61xHTLAssG1y38vgUtOtqEr1bOU5YQDY4Bl75BiWQydhNGmMR4D9p779GEouuOBa7oh7o7MT3MGVhZfJjSSXoKtQ1JieXoc+JT+HO6LNMQrQtctiqmYfDmb0ZlyqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3676.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 11:57:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 11:57:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] shadow: upgrade 4.20.2 -> 4.20.3
Date: Fri,  2 Oct 2026 13:57:36 +0200
Message-ID: <20261002115736.97429-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261002071557.74249-4-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-4-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3676:EE_
X-MS-Office365-Filtering-Correlation-Id: 41553647-dbbe-47a0-a5b0-08df207c5b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|13003099007|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/oQ0wZLD5z6GKumL3iMZmDvxxdAzS5B4KEWlv59HsjEp4hork85TG5M7VRsOtU4TFsztPl15qP5JLNapb21WnfqB9pE0Z4beJfp6iETSS8H4MQpnd92cdZF1kPt9kBUl4ViOx7GgmbLjw44Cr10iKETiljTISWcHKVwcI5dyC9DVk0L8lHiFup6pfQ/j8pv+e4973lua4/ygqlMY4I4Xt9I7jbZN4RbVOGeAksUaR/rJcUiLDvto3Lka3HMgCJ1zzl0755ZaQrl2NiTA6ib+NZ1oAUsQzD431Flgs9gCETaQy4UwYdLXuBZuIsAg3XvbIfpYPZyEEVn4Ghb8VUy2jIzg1/vxGZ8qr/XlHTy3ku0QuWp909rTsI2cHb0rTqyZJr0dXr6IXP8KcYq99zUH0QWrqIrI8FMSmNqfEXKGosSMTRzl4lza5adSbAqqduBSO01ekFMPWc5LNDxVIEEYnbSqcmGh6YHwi3UHy8AmfKTUIDg63j5Qgf34NhZMKWpClL9VTcrGogvLI3rMNWt0Wgkw/kameZ/15jIr2MJQueV0EeUfGLlo9fPb/uv3Lcj7ZjB5FsVEyKYVYvv3HOlBBZ/ki7wH8JUIcWL5iv2LHpTFyL8k4TWaey0BVvAYBPLu4XWosyS6p4TTnx7u7nx0Ya7Se07K8geivtptSa8+ao8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zJXA9xQwarFZnCfcuTm2zzdNEWAKtXR7auPZfrzdMyl3Kw6heUQXqORw6RmS?=
 =?us-ascii?Q?GIiV3a262yim2LvMEQUrB1rWd+zJ72HMqu2e2HWHh/lI9gMwp/cYJ/E+t/T5?=
 =?us-ascii?Q?ShG+mKV0w6ps582tbt0ArUy9cPVb8u6Y1mr4uDlzLn7+LcxHUaLJ/4poaVpx?=
 =?us-ascii?Q?zu9oSGm1LIkQSSbtvzcuKeLImb+HNFdBVD6xlC5y0tIKhK/OoIaOGtI4vSnW?=
 =?us-ascii?Q?L8Gw84wMJEfRskjCMX0JZZbQTaINIx5n5NHQdlPaiSir3Ub/CIfivgfnfpfC?=
 =?us-ascii?Q?W3cg6Y/UZBxeFfLm3HquFHMnTEaXWSxPgaOe+ufFAQvy6Io24qZOdmVn4C1h?=
 =?us-ascii?Q?r96aKHbbKDIumfYuDu4tf4od0jC5gLrZPvj/2mabs76t2Dl+01mHnQ/cqRSU?=
 =?us-ascii?Q?YzBJsjr4mWMkx9zrhK5N1719Cg3DNarSSiKoDmi56SftT7d+riFt6UG69ifr?=
 =?us-ascii?Q?f+I8d1Gx/hme6BfwuxO0L0CqQx5PnixwmVZkmJtf2i3hq1TLPklnAhluq3nQ?=
 =?us-ascii?Q?3pkgtwE8QYA+h3mG0EeEcFP9D3AOIv+JsDA+DZL/RzgIPg3iV2iutqxNcCSH?=
 =?us-ascii?Q?y7RaoaQKBMaivkUxEpRQhv4b4mYnDF/twKDcN1vSAPTFXL4apw/Fll6lzXHk?=
 =?us-ascii?Q?oSWdHjyDMsB4eOOqh53JkuAuP38ad9QkRC6ME6EbAX3Q++nsu/K/9Db4jU5h?=
 =?us-ascii?Q?DetwMzcZPXMT+2lTFQx90NsbD8oaNWEc1DeVoNKGjVIA8JhT9TJCnBJGB5GY?=
 =?us-ascii?Q?196IwJdMkLhI0kpkAMN36U9/SggnBjW5OiRvvhPXM4Kx9peBKAm+DU6rn5kE?=
 =?us-ascii?Q?3bF5zhE/Otk1kvF583oQ5W9IlMtX7mCybbKRYoDjifgmazKxgxFre7Alh78a?=
 =?us-ascii?Q?qrDjMB2QbFRq/ISa9+4MqRlVY7Ye+K4A47/ROeV6M6IWEsclVvANeyxf1nB/?=
 =?us-ascii?Q?THmUGsdRJy+Fn1YkomvhHhNBpQUJmVxTbBtcaLfIcW9csLs2a2R8eH7RD20x?=
 =?us-ascii?Q?cx8pTzz9DolCuLpManV5G301bAsNLlligMzJEbSpGjCi5kqCYf8TjcQjzFBZ?=
 =?us-ascii?Q?TOZtBnmNOtV/0mLKkBGRIjPVA3vp9HYNIIP9+KuJ7MW2gn9q17noHdvM7H2A?=
 =?us-ascii?Q?+whQvPZKeEFZ7P1ci/DcveG/FtVHuDWwk2Aj6TqL3ZBTQYpuUZC8LAPAZTRV?=
 =?us-ascii?Q?OYF9a5bw8sERYwP0EewrF+ZU8FE1w0ywPPckn3yQXNri+cZmnRii30fgjqFw?=
 =?us-ascii?Q?Rf+IgB/tsTVH7uvpy8eLonfORmoH5jT3UNBQhqZbUmbT6x4bSnrPu4UGl1fQ?=
 =?us-ascii?Q?7Q1jQ/CFDZbxA0tWfakQnUYArK25BTpWf66R1bRqPCYhdutfZoJi9D82JOPU?=
 =?us-ascii?Q?PqClMPLmUqABhVBH7qqKsDFPNYqsWFnrpV/OdHB6BpiOTryZLMNfYUqhax3H?=
 =?us-ascii?Q?16j1QrvZim4e2N4Ju3dqfjUSr+Lc8svGCiUxcoyLE08rGM4/DxpoF3XM1ak8?=
 =?us-ascii?Q?/q9vLpk0AjVY+AKSB1ylDx25P3bYE7bNufVUHL2ZDS1jxrKauGzRHiXztsoH?=
 =?us-ascii?Q?JtYZCGW6CMKzbvXwoisMDRBTIONfLaaC97X9j7bmZ3aBEWd0dXrFpBKLrph+?=
 =?us-ascii?Q?fo2Q66+vitxR0FVdoLSD5jDGTkVokC+a/xwaVJtFg/hIgJAJHUHpmsF8L9c7?=
 =?us-ascii?Q?Gg3Ig0cBJvQaw8N4ftaRBWTt5MpTAHIKHBvsSMhPfiGMj3c3kenM/qNQS5pu?=
 =?us-ascii?Q?pREeEHO0lw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 41553647-dbbe-47a0-a5b0-08df207c5b2b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:57:38.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7Oc8/AB5oACRKQokX+OtUg4Au5eP8So1y6vjohjvebl4DY9UFh1ZMdLxaXr5Y/QFbIf8V5NCFrD50Cyy7/9pwAtmwQtjMdWhWFWlPdZgRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247114

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.3

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.2...4.20.3

- Backport patch for lib/nscd.h: nscd_flush_cache(): Fix type of parameter

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---

Changes Since V1:
  - Add backport patch for issue seen in AUH

 ...cd_flush_cache-Fix-type-of-parameter.patch | 30 +++++++++++++++++++
 .../shadow/files/notallylog.patch             |  2 +-
 .../{shadow_4.20.2.bb =3D> shadow_4.20.3.bb}    |  3 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd=
_flush_cache-Fix-type-of-parameter.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.2.bb =3D> shadow_4.20.3.b=
b} (97%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_=
cache-Fix-type-of-parameter.patch b/meta/recipes-extended/shadow/files/0001=
-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
new file mode 100644
index 0000000000..e873cdaffd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-F=
ix-type-of-parameter.patch
@@ -0,0 +1,30 @@
+From b8d3549a49acfe967f45aebaf06d474c82c46d22 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Wed, 30 Sep 2026 19:12:01 +0200
+Subject: [PATCH] lib/nscd.h: nscd_flush_cache(): Fix type of parameter
+
+Fixes: deef7d84c3e4 (2026-09-09; "lib/nscd.h: nscd_flush_cache(): Define a=
s static inline function")
+Closes: <https://github.com/shadow-maint/shadow/issues/1763>
+Reported-by: <https://github.com/Bonnietwin>
+Tested-by: <https://github.com/Bonnietwin>
+Signed-off-by: Alejandro Colomar <alx@kernel.org>
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b=
8d3549a49acfe967f45aebaf06d474c82c46d22]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/nscd.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/nscd.h b/lib/nscd.h
+index fda3b1cb..30b56720 100644
+--- a/lib/nscd.h
++++ b/lib/nscd.h
+@@ -8,7 +8,7 @@
+ extern int nscd_flush_cache (const char *service);
+ #else
+ static inline int
+-nscd_flush_cache(MAYBE_UNUSED int _1)
++nscd_flush_cache(MAYBE_UNUSED const char *_1)
+ {
+ 	return 0;
+ }
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/rec=
ipes-extended/shadow/files/notallylog.patch
index 6d6957bbf8..b3b30026ce 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,4 +1,4 @@
-From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001
+From a7d45933186754a1190509b46c51c56d48089004 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 21 Apr 2026 11:30:52 +0100
 Subject: [PATCH] shadow: Disable tallylog execution
diff --git a/meta/recipes-extended/shadow/shadow_4.20.2.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.3.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.20.2.bb
rename to meta/recipes-extended/shadow/shadow_4.20.3.bb
index cf7d253a7f..683a284aad 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.3.bb
@@ -14,6 +14,7 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shad=
ow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', =
'', d)} \
            file://useradd \
+           file://0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.p=
atch \
            "
=20
 SRC_URI:append:class-target =3D " \
@@ -23,7 +24,7 @@ SRC_URI:append:class-target =3D " \
 SRC_URI:append:class-native =3D " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] =3D "e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3482e4=
874f87c1d0c7c5"
+SRC_URI[sha256sum] =3D "39006c9daf9228ddda9156605201fc9f59c43f9fdecc83c78b=
be0e72d9ffd58c"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
=20
 # Additional Policy files for PAM

