Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B30AC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:03:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10469.1786705427982081674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DQaLq+CU;
 spf=pass (domain: est.tech, ip: 40.107.162.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyjwcguNT3dLLbSYCWfSZJJUvkeI9NWDvlrj4n2wkKYYWICVnzm4qd4zH+MwWmHD4K/IwPpymezm3eyhus+lOn52KjZUyU+Nc7+YBW9KFb2h9BGhmdkeD3dGOQ1dD9DOtcZGaeMDvavcC2lB9ogRa8vP89MIexHTXY8ReHnvgXLKvo3JZxD2g+qcy4cCgyN55BGFKyQRfC7zLxV9jJOgpmvvK96LvSW3MKryo4JwiQOLgGpL1X0fNkzdex+PTQk2gP3bgTBYx7nAvDeRbHEWG1+7AtAgLPAloSEjsNivES2cQUDOReo9HKx+TfmxSdWyDEDX344kuJeLhZQ7h/eraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYkAmYzBiY14+Z4SXpPY2nM8VLvEfLJI6DYzhaPC4zA=;
 b=tcqgCgTI/Nyt39y6IYOiwKE2GDDIDznCATAKZuE0OHYgVTMmMWg25+gv6cYCuTNUbpdll3rnUx3/5YCamMeoZY6pmYp6lL2BzQ34uJFPrWvslwLSw/slL6ARDfyBYRAgn+3P+NdzNckIxAmnUEx8S3YVZhZv15oQoj2KojQZmeuf0xGGbGAxLYPr8plBiLzPlWyo9kXj+lh6wE6WbKULCIf0RvKBH3xkZ6FGKcNpwCAYuRNNpparpRs4agF3JDRVGlgbRqpKakyW8Kxj3Qi5CmXo7HwbeJooYrYSeGCCdXHfVMT1tmZsMl7IvgasmBNjI4d4fIdhsQlAAeI5B3+NwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYkAmYzBiY14+Z4SXpPY2nM8VLvEfLJI6DYzhaPC4zA=;
 b=DQaLq+CUmT/urNW7RNiM0C4LJb/yUxtLQL07o/+UJcZzqmamK8QdKM7IIBL3iAYehTDQXym/bTYjQ+hIYz0MvngfmbYIMNbqZ3CHvTY2Gf6UtYbRUu73JH4AMBmMiBDKdX0s89TzOJYBoRsuLqqpUG9C1m7Q2PvPMx9j8ooT2eMHBh9+gkXy3RhhPdJMalveZdnqvHGAEPyoLrou835Kjdbx2flwgz0/kkBlsx8qDUn0Wyl4Pri8LzbraKiOAvv3cCCZvcsJLrfH4ridD/gkLb1qm/jKb5LbMwGtFnkfpSBH8erNTiun9DwYqVL8A6z3QkrM7wno88kYOKZQDbq3Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA3P189MB3263.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 11:03:47 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 11:03:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 3/3] python3-hypothesis: upgrade 6.165.2 -> 6.165.6
Date: Fri, 14 Aug 2026 13:03:32 +0200
Message-ID: <20260814110332.38407-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814110332.38407-1-jaipaul.cheernam@est.tech>
References: <20260814110332.38407-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA3P189MB3263:EE_
X-MS-Office365-Filtering-Correlation-Id: cfff83c8-004f-4a66-500a-08def9f3b6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	C6p9RV2krPOQjwGUzPL5DR0jd2XwNrKbtCCh6AVLJP27wQrOor8OkdH+IuHw4xvwlNTfNfhMwaeryF5doGIyCrMYDzOWyhuzNQEzomL7o2xsRFI8f6mOSNadQKiwIZXS8UgfFMkowlYZku/LlV6cMeNcPXoQK8dmdgrHsw3LJNGlTEa0ogg4srZEa+rKwOzfAxApYwLb/v/StDbzWEGj0M2Xt7yxktouURAFIn9MnTStxrqLNm0HEgdmkRhauV/HhQZkxY5vc1yeIxPY4xCtyPh38JiejkLT6RXZmIfuBZIXqKpAH4kHYRLwT4uz9/TKhjV/S7lxrK3CNqgyCM+6mUPduo+nofPlAd7NEqde9L3mSO+kDcuY0Gbk0hcE2Ta4Mtn55YVlo98D0VB6w0a+oXPLC5Tl/aKL7SzEq62J7F6geAFL+qCTm4ih1GXCSX9CUf2lFvfd0EMH//tPg4uZdeXYfdmx4/89vXJLXisBJblBORA/y+LhWSLipFHeoGXfMzGo7s8t+VZf9hObugO51z8/kiHPwmNxTQw6RJPdp69am0Qnv7g4DJQVRea8tJvOEAX5j2iHWIe/76LA04wZg2PJoO7JET+onAWXR38EC+Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dk1+nDfr8aOFeyIP+vgJ/GbaP0p8DN1LX0H5rNz10wbm16bTNeq+NQBxOd1G?=
 =?us-ascii?Q?avi/5hYtCsCcBB3LnsMl1udjLonnKaZkT3SoCZROUUizmalzA5ot976sg+w/?=
 =?us-ascii?Q?0Wi95V/M/n8YGecoq6KKQ2Z6jUW57qkNg73gS3LHlu2lVGz3sghXnbwzfr3J?=
 =?us-ascii?Q?l/hF0jQqROrVBFkj+l9itHQepXYzJJYQd3ER9c+pCooT9vJDL9oXdW6yhxcU?=
 =?us-ascii?Q?cvMtppmopao7RVoyeRZUJG3j1WNPs9/kTDlnmFcDOgMW3EnvwyZA7KSZtoGF?=
 =?us-ascii?Q?nHqulJxcqR6uKgKzI+bX3+Qltl4cH1rqJApsPNXJxmKFvG7IHpOtUsS9lYm1?=
 =?us-ascii?Q?YpS/hxHe6M06zOqevvdHpzrrrb5nlZLY/3KM0cmsUzAI1M1EadQyPQ0lhgyo?=
 =?us-ascii?Q?45fYUBGDNUS2a+20oWBbepjqkJawfrCQz/6hqDQ6tKOf/yC8oYIBxX6uBAqZ?=
 =?us-ascii?Q?oaJYCHJKvNx/j3jWLGIh1pUkQaEsGFfAj+xs3LHrTGXGa2ZUpUCvmy6DOJO1?=
 =?us-ascii?Q?UNN6QX/u0eLh1++DDXnh/ynYBDAbeOFhS1WLyl/k92i6SxrIsqJ/cfJ0Zn27?=
 =?us-ascii?Q?ps0JzWlQ6f4SlERIfG6PvMGcn8ykHuNgEtQJ4vaECBwzL6YEW0Z3smQVC+qa?=
 =?us-ascii?Q?SBfoeMaA47oR8MFoZlpmCqcgL8WyBie+GK6lxz+oaN45r+vcaZF7ErcmpPOm?=
 =?us-ascii?Q?KfwN6ddCa2krPhfKqLWBGUwLeJRXO7Rgbo3Ik5PvbT+B1r1bmzk+rP44EKXC?=
 =?us-ascii?Q?/sPdgTDv385476tO07/g+SnGLh5byYQEnTbejJYNXM8B7gOAi7su2L5k2Gjx?=
 =?us-ascii?Q?uLFxPCWVOhTcKnodJIIaDkPDZgPsPgGacBEPXnfYg7Qhb+LJAlWvdappiaNe?=
 =?us-ascii?Q?YSi8tUY3B/Ff/LUFntzz4q5vrFILG9Syslxto9jwxgkiNk137HtMYFmgwzJd?=
 =?us-ascii?Q?fVVy+cCp8sItVkTkT/e7B2MeZlCJm+0cMFGc3KlLRfVq78KIA9TLxVI2WJth?=
 =?us-ascii?Q?4mp5wtQnLOqQvcOSzcALqDwu4NbWLF++lPhJg9cnqnf/CPML8y36aCgHxQB+?=
 =?us-ascii?Q?ogQvFifQbeFd7kRNZ0igKzL1fT2q6gm5s2c+7tZgbfiHIMx3+YB8TrP2tdEk?=
 =?us-ascii?Q?3cLfyaB68h1aeWrVXuKv5Nx59NEyMmr6o4TXR7+K6SAZvwW4h/SR+fQbCjwo?=
 =?us-ascii?Q?rA2urmVmV2+bxzm/tZd0JhcOhrDbU39VgPp2FbehlJKBKAmg9wFGGGwWs9/i?=
 =?us-ascii?Q?gJ+VO0aKAT32OMO4HEgPByME9G/6tcb0iRwFfu3m29BHFKEwx1+TlIBBQ/fj?=
 =?us-ascii?Q?H9oTsCGmGs9PLkaGahcRxHoa3bIjP6hX5zNtBsLKcFavRELx8PhgjLnbA5dP?=
 =?us-ascii?Q?CtciHbVgmhn+DK5Dm9obNF5KysxFLVHYHmRRLCjBBVPgOV1pgHdxcp8yXRbY?=
 =?us-ascii?Q?hR8e7Dci+wSNhYui3i1/1z9gZfTLcJv5OHN63Vm8tCu223IjEtvfGx6ISdGY?=
 =?us-ascii?Q?eAKaAyeMICqRn2gKcwwq7hesHl5qm6cTfaRrHTONeWcZ/wQOnSnTn/HBV274?=
 =?us-ascii?Q?PLYykLa57eVkclushhssBwK9VllsLIn5fGNSjT7IzolzMNXg5mMdkEd4aRKP?=
 =?us-ascii?Q?cTn3NbpHC7HRxbGa3h0VQ6obpQ/rVifgQlNueeivVMDGLhwcdl8qszN/aUt2?=
 =?us-ascii?Q?/+gbsGG5gY2L8zFVobcSRMZFaWRopABxlXVQ4O8hdORDGCiQ25xRBo2jrvap?=
 =?us-ascii?Q?P+jLpffXmM5FrIy4z1jPrwnBlpky52A=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cfff83c8-004f-4a66-500a-08def9f3b6ce
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:03:47.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+bTR0+vXnwsqoFgydi4PeuzbUMioQ42AADdq6of7trhR/nncGtvyB5DbXZ8+lIJUJLtAnn+XM3oxuqjNyPGGNUWjDwVTZTgtcRQ0t3z9Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243442

ChangeLog: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-16=
5-6

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...165.2.bb =3D> python3-hypothesis_6.165.6.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb =3D> py=
thon3-hypothesis_6.165.6.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/m=
eta/recipes-devtools/python/python3-hypothesis-crates.inc
index efce454843..080e6ed7f4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI +=3D " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f8=
5d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.0.sha256sum] =3D "cd274650b21d4bfc26a0a47587962c1edb425f=
69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] =3D "c5e2a7d2f0d013342f295c048=
ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] =3D "ca85c467da1bbc8d866eea5deff9cf29ea=
5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] =3D "9ac53762fd065daa3194dd09337a38b=
d793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] =3D "4ca3a1557399783172dc5bf=
39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.2.sha256sum] =3D "4688ddedf473e32662b9b067670129a8afb8c1=
8e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] =3D "f41027e41b4bd03f6e60f9f41=
7fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] =3D "e591a95526fead067432c3b3a33fc74770=
b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] =3D "73225868fc1cd84eef2c3c230ddb912=
73bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] =3D "571575aa3749fa6216757dd=
47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.46.sha256sum] =3D "dfbc457d0c7a0759a614551b11a6409e5951f=
6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
index 0776519a10..2de6a9c069 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.6.bb
@@ -17,7 +17,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e=
029de6aa11df95"
+SRC_URI[sha256sum] =3D "35d6e462a7827fbce9e833efc48921d7879391dd1f742431da=
48ba71bafe2a59"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \

