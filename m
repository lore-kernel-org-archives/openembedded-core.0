Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF62C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:21:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6576.1786537238229484930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=R2tDjzO2;
 spf=pass (domain: est.tech, ip: 52.101.72.11, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8VU4UutQajeUhTb8yxOoe1h6nRjwTsqSfgdMLNQg6bNmYf4AHLKITJMH6EF4/luOQ0e99SQQiJn1SEHMTXlxqT8oTdt4ADVUE3tig6y2J3ghyccHQw/gxXyIt2mdIiSlg5PaQKYGTTJ7hjWXWgcWALbkCUhDhkuj4uGfclnVMiso7oJla0SKacgms/IgsrHb2yASvihdh5OwkZZyqtyNVGxcZG5Fwaf4yvDdqbLuYT+X/tZ5LQUPVt1amd0DSGueW4XRA4SfDyEEWCj4wBApeS7ZHljJ/aXzowdmh9qoSrSSgS1/6Za99PFxz3k+OtSEJ9nmTI6wEGlPwmN531bFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGATvAW9gILaCIMk+bgkZuHgHe7x/PMDjpb8HUKZP64=;
 b=LvMNgkMiTAWSzKYPjrb4hmVI0mqUh79UdHFaMu8o5ESOETRk1VHAMk5YgJIxY+bktOIR/WkH9HbMP0thrUHqFPYyvqQyiQE87J0ZdqrYjnImyGlexqBFu8NoIvYK8DNQDcoVm7c6utVluAr+K3ADXEFtu0HOZoGYyr6IenMc4yAPJu0uD8mpAGzCuZFahW5suvGhjz9ElUDnC4VPxA4gPJQl8TBw/jAGwe5nQcu0kDDpUx+uz3N9OgbT6hGrSjXYYRzoJcVVYpGDTTiTxEWWiDEk/D/weJXPx2g5JB0cD5wtxcekuS8g9EXhWFytHpd18WzKgkW4uuY/kKp9cGy41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGATvAW9gILaCIMk+bgkZuHgHe7x/PMDjpb8HUKZP64=;
 b=R2tDjzO2VHUX/gmtW9KcrFjn/LEQu3bwqzLiDwn5NCAj4d1BmtkerQP9cOLVwuGjraqyyMoyYh8l0TCAvvlftEpkm4FNCZyG2phmWhWUNbL4Cm26pOBJDYbKaaSc0rJp/w/qPHYZjOjunzkp7L9VQ8KKg32iHQhV4eS3g7DId7fhQ+vZTZ49uKKtd7ZI82WYT/eJJmhN3XzOzZVovTGK3MZ59dF5LhBGjS4WWwRIXztdQ4oqUfhKXUoYZ7eFBL7qmtmWuNHRDaAmrTEaaK6wo07n7EmyeAGy1cdEx9rxvsb4Ki/Ask1OmEPbytmR4p3Z7LoqbMx4zFEVxI4xfkCHWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS2P189MB2556.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:642::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 12:20:33 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0339.002; Wed, 12 Aug 2026
 12:20:33 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2] libssh2: fix CVE-2026-58050
Date: Wed, 12 Aug 2026 14:20:27 +0200
Message-ID: <20260812122030.335536-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU7P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::31) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS2P189MB2556:EE_
X-MS-Office365-Filtering-Correlation-Id: 660c8bb6-388e-4a5c-47bf-08def86c1b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|13003099007|12006099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	6aRvNMu4NzbseGK/wOr8DUw3nIBkSZb9ZGUmzTBuW23CfSctyzAVecbPLfD32+B2P+niZ7Q6CXM0eyKsUoW0VjA53vfOe1z0GnE3TV3yFcRgHqKiGMN4P9CuE7wL8FaiJljsnzB8QwuyV8cmPuRjW9v5JA60tNxlxFoJZAcchqAV2jhL06ttUsAkvjDYjlu785hNPgHq/jqLmaqnhDnjgJcf2k/+kLvPZEHR2FXaLElb70MF6luL/bpH42CHViaNDdPsUKAZIcFX8nZxe5sFXxxgLMxq9AjBJUtf/twuEV+bDYjT8aAe+elJOmUAGXdIRAI7igE2pv7QXsl5LTwXrJoLa2JSFgGKZNZAsNLH1fQ0tM9VxhfMZDS++QLqbtIahqIKk7RSmk2dpSKVOss94wl9DxHz/DNNzK32CvU82qqOreWaAUVqchHIUmkNccoDqX2P2xIBwmM1r1k23/Suq+Tc90EFfMSDhHW2Vdn1Zli10maHjXhnMLlmg+QJbkPvEBzOpds8PCdZsuDxVuzUwOuUo2XNCOwshTlVAVG+yIUy7uWc4urIz5GhB2ghuRSWhxONo4A5juYZUvyr7MdQe5QrHU0E2FRv1wwv0qSVO6X1bzOe1Wiub5WA3y3uvmQfhSwdge+FSlJeMCwRWJBeYwGsBW4S8M6OxLNYrJBa9LI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(13003099007)(12006099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oCwo5XO+isgBAK0J0upoAWMKYF5a/Mu7AWsHi7irQ0K++5bzVPwzkxOE7lZV?=
 =?us-ascii?Q?T1C9fkUAT59SxZibt8E9362p1nF9uS8iqGdXuP8khThP90owKwuBhwrs4mGF?=
 =?us-ascii?Q?UWCpl7mPBsJi3r42uAY+WY57Z6/wXKVPr7UfaoAFNRwAr0gc8puDJCJyxAK2?=
 =?us-ascii?Q?WSTX3o7QrpinC84vCAWFMtD26nXlM5LvQMRFxWzROeZSxDiK0mU4Rikh4Yv0?=
 =?us-ascii?Q?WfDQzuCnrcAN9n6oW6aM4sxfzhaeKMNjxt1lUXDPp8rkUjy5N6I6muQMCrwJ?=
 =?us-ascii?Q?fj7AzhGghJMaMg/6kejOoLP6jy17uYElmPlfPo+Jyy6ZUoAoXa0WnicsWWVo?=
 =?us-ascii?Q?auRxA2i7Z0hnld8DM84eoltpJ8RAO+l/ZZ6FTP26huYmspp8zVQ/1wb1rrvw?=
 =?us-ascii?Q?mUOvx19CKGgOsSvsBsookJbLeuYfOY5FDJY2KaZwcvX9a/78UwJIpyFw+krW?=
 =?us-ascii?Q?vSCNVfK6+rSaSjmf2EdT3HLqpxmqk3O3faG6oLuuGXdakNkghP7IRExlMs1l?=
 =?us-ascii?Q?5tZcRWG5LiDCSYQQJ9F10M/woksO7YLYYy18e2oUVyCe/bfuDKf2m8dSUSJl?=
 =?us-ascii?Q?Mlk+ActdfJ6YFs3lyjtj04C4zznlyzCN9rDQ1Q8p5QdfOe7oOJuF5Eu1gPAU?=
 =?us-ascii?Q?Li/na9wg9BxuDekc1e9DCoqUWuUUeUBlb4k2YwUjJZi88AiUx2TYU15+Pu38?=
 =?us-ascii?Q?0itEF9ZM9TvykgWkp12t8QEKsxCoQHwM5hZVhTO1WGWSe5uNi+rYunO/ng1r?=
 =?us-ascii?Q?tEz9T9kVoxplH3NxmRWAa/5L4/wMETUhHcIGinj51RA/svRcZOEsjgYFrM87?=
 =?us-ascii?Q?TX+tMRWLVjPh6IcaV678mYox9cUyi6Oq49dnB0BPO8SBq0v+kVqNW27gON7R?=
 =?us-ascii?Q?IIA1aFQfWljfQ6+B4ed5F7rb1MlE4iMPsiHVCjaAs2MYcd/u57dChQWMkQnF?=
 =?us-ascii?Q?cZrd4m/6+32MMCqCe3n35tJMiSF8Q9+G8o53LCGCs5Y+dkpfPL2HgHHOom0h?=
 =?us-ascii?Q?n7Kg9tV/p+Mmhd3804UhGK8n09NKyw8tmVBznZqbHXm+uQqrTUTWgF08ORQu?=
 =?us-ascii?Q?WuAcSsy299v1nlOt1sDfCY8//39YrFbHT5PPZ0aFsdL/WA1YoFnmtoYu10Me?=
 =?us-ascii?Q?03gPVtGPy8iNLrIKKfZAGcNtZ7BBQkJSaQ/QNwCVn6UKbfGSeRqAcrA5bhU0?=
 =?us-ascii?Q?rgTB+GgGwk8CocxXpm0Q5/jmOPKqCxV4/qRFbGO2QrcfNKIJbVyCwxhi9qsk?=
 =?us-ascii?Q?kx4+15A8JJ9zI0wghtEfFUgVQyczJOuvlmuqT+SPdddeEa4BonYmkgmf2Dus?=
 =?us-ascii?Q?PWgabMYq0pmAPdzb4MCNiWQnJ2vrlcoxUUno0D+ZjLwOyNGAN0h0v9+bTNb5?=
 =?us-ascii?Q?28IXekYXJlVNqdMLibPsG3fPRm81AsP0CvZIZdiEppNICXgLqzKytbpam9ET?=
 =?us-ascii?Q?cG9ZcrXSZcLW/v7fnqyvKLVD2vXkh9RVTEjmfQdUXvPtiQ9lSh1cw9hs5KWl?=
 =?us-ascii?Q?LG+Y+r7Ba895upBsnBSFJ/jXN0SvOl061+yIXKvuvj+wRW29ygDN6lOVUI4W?=
 =?us-ascii?Q?s0pkkHng93sV0OCgl+yee2pSuuVW3m73HJdcsGlwiCuTmHK5BcQMQ4SQoYbV?=
 =?us-ascii?Q?wkRvJJxNFD2sV8YhfqdcV3/RMIzSssqKDnXX4VIvu+4RdY+7P5/Jl5myigYS?=
 =?us-ascii?Q?rwRfT+4MeBECkYRVKh0rG3sBSS6f5g6LP1l6SJbVWf7qlRVpXLt/mHgtkWlI?=
 =?us-ascii?Q?7ragVcdTtj26zNgE1fCOeocNrFqvVKI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 660c8bb6-388e-4a5c-47bf-08def86c1b63
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:20:33.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04GUHmuMzUZXYdcVJv5MoOyhfHh9rILngKtrrTMn/WQzFouuQ3whtKSos6L0iVVpgKdq41+MIyPl/4E0N/ZLaY/PrXesth0j0G/oGmzlcG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2556
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243285

Backport patch to fix CVE-2026-58050.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
  https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac89=
6202b7e12

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 0000000000..0163b379f3
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,45 @@
+From 05b2fb4ec89d75235dbd97c5965dc0e46b405a7c Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sun, 28 Jun 2026 02:12:52 +0200
+Subject: [PATCH] publickey: fix potential multiplication overflow in 32-bi=
t
+ `libssh2_publickey_list_fetch()`
+
+Cap list size at 1024 elements.
+
+Reported-and-initial-patch-by: Mateusz Gierblinski
+Reported-and-initial-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+Closes #2128
+
+src/publickey.c: replaced ssh2_err() with _libssh2_error() to match
+the stable branch's error-reporting convention.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/34497=
525929b9a47f03dfb81887ac896202b7e12]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..196d2f9f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -1114,6 +1114,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                 }
+=20
+                 if(list[keys].num_attrs) {
++                    if(list[keys].num_attrs > 1024) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUN=
DARY,
++                                       "Too many publickey attributes");
++                        goto err_exit;
++                    }
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
+                                       list[keys].num_attrs *
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 32e1ad6c16..f4140d6625 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-58050.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

