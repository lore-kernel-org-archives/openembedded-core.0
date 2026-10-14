Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630C3CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 12:05:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11849.1791979533635905106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 05:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Vr5mYVxM;
 spf=pass (domain: est.tech, ip: 40.107.130.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcvIGHlZmR58eO0iFfXU9pr1bV5aYB1bfQZv7k8fqrQ3s2OA8QJRhovlgIbWTNKzLzj2EHdNETvH1rkeZjIhZMs1Yg4rYWbCnqYy4Wgh+Wov5ZZRpTw+yvLRarMkl1h1nQTDaNar8Up2DhMCgHwvcayy6OhYohNWkh9zGFIWVQlYG2z3Qh8CYF4ibgyt1HmekTx+H4f3ciDB1QODCq0In7vy99hkyKuzZoJNwJVzWit21zKXaa5h2m7O7DwTZI8nV9WW3iuKE1nTpkSPQcf/wBmgCShGAnUt3xXb8oxD4B6j4xzSl6WvPh3zFpnjz54cv2ML2AGNclewixy0Zk+QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJK+E6sOR/pN0m3Mc+TINQy47ulf+bQ7kU4F9CUJTdY=;
 b=MPbhzVU9s8oFyktJHTFsEWcKLP10WVAYzdhozhG0QWOVZsj1GbxcX3J4BUIGqcK+wEtZYE5WnWQNtKR84fZ2r/meSwf0Lhp0yz1YDk4Fyg6iRsTJfUIijvXzqHB40i62DJz4rtZAzQD5k9DqgpXB7wENuznks3yPXlPx8LgwcCNXW09LXpkce0uUlEAKL4VurM2m5TMXKfIhVU0mIudBkDsxzw5CUVYFkZRMLo7lXQvUyJGjPL6rOnGDCsfwJOiYdLPVQIvLMoM7c3uk6vq9+PY78RToAn7+OjkaOVr49ouWdKMz/FcZyTjdH6yMq26vEP8VlCms4n/qR0XHVFid7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJK+E6sOR/pN0m3Mc+TINQy47ulf+bQ7kU4F9CUJTdY=;
 b=Vr5mYVxMhgno+vzzsut6b1KDWV0PlhKncP+F+pQL3/R/yekhgP6hyyrW/kh3IJqoSEBph5fMMvUriHMctraH45BXEidX85wviVs4lveL0bYzM6DhXxyOYxLQXpHg2CxC+G/S0cqVY2roGNJNbHyyMrTJGY2IH628remGDoPUjtZKT1xB5TMy5jNQwNcjfI4g51/0KQHq9TXa/H7AY/2hEhKukW4lRJrvJxYd6/yV/+3GlKf2KyyFIvSO67h2r3qamhwFca2bSJwMT+4YESu1r5wBsztIu8rt1C9I2wqdTTquYJP8DvSJwgKlkmodd05qZjKem51DNjPF3BhKzj4W6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1140.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 12:05:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 12:05:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-jsonpointer: upgrade 3.1.1 -> 3.2.1
Date: Wed, 14 Oct 2026 14:05:27 +0200
Message-ID: <20261014120527.54405-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-13-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-13-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1140:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdeff70-ece9-4d52-27bc-08df29eb7052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	WV8lZYOy7G/bNMY0TUaLiST+9SVbgFrdh3YRsehMVSn+6uuIdDWydSr+EFLXyIZIjinjmvBPDkK8YYr8RfHHHtzMUTGlpp1NwjrC69akpgUz4bYoe9+8jiAuv9mZdemggR32rYVrEiNzAgAFSbQS5AKeU4u8bwGaDVHOygnQE8q1BN4u/HygV0Sjltt2YcmFc6+Q1i2vk9IEsHNK1JAYu65I6gYGWzQQ8elU0JLZWd4v9A2Q+Nvt+eTJZOu7gjz3gTIwdcpXJwNg3jTn14ieHb92gwN3//wJLNzgIIV/6sfWHVwysnvO5hQ6KeBd50JYqMuJoHbqFzZaZa0KLau0YKoy83llCiqHZu7UN9Q9GYepRuk0m5cEV9p3Z22C4+h62d5YfrpHz8cJXlir54h1hDa4P1Y575/uA75nfq1zTdsK/UliQhdz1LSIcRZ3a0WC8Nc6eV7hQLqcuUr8ae+BsK/FGtNypxmXOIV1ltjrAKNVrr6/7TJsXdYBN8YHIhvMw17m/8Qv33yOiAQcTkVcCSYMfAOmtu1nQnhQ0qHfDm8bkRIc6769U4q155HYnTCmIyAfHgjQoqujt5yP2XVUpdFHShDrbZCiW1m28QjnGNngouQQ6m2QE820lrKab2u9boo+i84LJu6RS/qAutd7aDFPAPHNswlAY7AB4vUqrXc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dy943uvmTCvwSnAQsChptWFvhtU/XX2Et4SBWPELd2K3a9UuuDwDmX0deYGi?=
 =?us-ascii?Q?DxXXGFA2X5Uwf/PkVSo3MxKNvSc9C9NLjSj6On/lzRh3+Vvk38NySU5BZtHt?=
 =?us-ascii?Q?c7j4lRNFcux/uuUZv6tS2IfUyVFyREdGiYgjqBuJgQYtMJKIz2BYHWuFcLqj?=
 =?us-ascii?Q?WfYK23RfS2YziGoaFs0TfViTi9iiExMisJTOrGYlot6hbvWXWKO1k+rmxoez?=
 =?us-ascii?Q?Kxn4TuW24wGU0Hzslm5a5gFIGMXDV5dWLWca0mgh0prQHm1zTD/zmL1l+M+B?=
 =?us-ascii?Q?0q2zKzDRG/NzoqcI9UU+75eo46GRU7kwPq2qLFHLH8MmdWzjjY6w5Q2XUssx?=
 =?us-ascii?Q?x71j2a5yb7B3liYKEa6o0hOBMTwOHjIlljdx+8yzKYrSFOdIACVOQOT9OfFR?=
 =?us-ascii?Q?13cevPcZPUWAXejAteWOJdl+HoxHZzlDdxdRQMcQbChxArrYLglwENWZaOrD?=
 =?us-ascii?Q?QBk3kZqXmrpAEF1BomdV47acSTwU8Lix7txozozRNx/7G4KvnuZyrjxXxVuj?=
 =?us-ascii?Q?Z5gSjqYjXDGfds93aVUcrJEg25Ss5IElWvOb8t3zeS7Ug3vVVEuLnfbKyWBc?=
 =?us-ascii?Q?A4xNR2bmQctFuaAy15YykOCI+CVqN4uvws9/GCeHRpYDiGvarfY9K6TeB3Io?=
 =?us-ascii?Q?A/Xt9fI9RaIcBNEma4rD2+MjfCWYet4ELMHF9tcsRL8eQnkNIJCeg6AJu0Qz?=
 =?us-ascii?Q?dxQXBkcy42/prlKykJGHE8x1HiXA2VJtxTwT1adeUqYrqP6o/6hXUFL1s/iD?=
 =?us-ascii?Q?eC8C+Yam4//HPo7jqjxSDCfjx5LKdJnhXAUHTZMP1201s88/Z9v2RYdWfFNE?=
 =?us-ascii?Q?ADvnEYy4Sv1nUfzrfTB28HNzvnVMXyHkxYs67QbpEBBuKjF49Ymz2vhDMcx7?=
 =?us-ascii?Q?D41yPvSP5MGjYX2VjcmIsd8S818hdYqSDmjA+tjBVK0YZ3sHC+8L1+cNHWDV?=
 =?us-ascii?Q?GL2Ofz8sy55OJtlkGUfc3G5N9RUYjJwFUBy4If27ff9NCfCartH9o9S/gZOZ?=
 =?us-ascii?Q?/2SM+PYtqHfRgLqdjxQJVYdWRM6sfGvDHcGegoPTj8gGfYyGs75UQxPwqVUD?=
 =?us-ascii?Q?r1nav3Wv88mCOxUL4e1ze2U3a1pJnn9s+r1K0XtkXVNGzha+8yYRsXfoANvV?=
 =?us-ascii?Q?QtQUYhLqt+ZyTY+WASBp2PuPSVCNGvCC1Xgwa+OSDPDdQr4GL7WdSd89Cya1?=
 =?us-ascii?Q?O00v/FnjBnIEliZLRSS6Ix1oTF8gR5J1nJ8tBl/q044BD4ELfHV4DZiCAz2/?=
 =?us-ascii?Q?Co5xZGUA1rHO7HSohF3UOCbaio9P/7mG8tceshbUfv6SuWT9zhFCBZkX52sJ?=
 =?us-ascii?Q?S2TIHK/MBgejWhKv/ChNHOTklbJgbfNYsf3JKl9sGaHKAuduiX5ceWmJWk3Y?=
 =?us-ascii?Q?TvoPdL18XEtrfaAmYnARHGUXQRuQft0+c+MR6PInBWQZHTeQqoIg09qqns0G?=
 =?us-ascii?Q?VHUOELDPuHNZ/lahj8YrMYl0t8Ld/ey4vaJVqckMpENl66b0Ik7+eMicUTGf?=
 =?us-ascii?Q?sLzoGQnhy3oFhMf1UedIbuRbfi4VXuSBrC9re61NA7ebQtZi9hadrH9gAUz8?=
 =?us-ascii?Q?pcISwghwqxnoxWegZ6TCFLv99HmNoxC2Oe4wavouehXEobEOs5O2fRbGURWt?=
 =?us-ascii?Q?ZW/sL2lutOo+3UC32zPcGSfQmzvUfd3z+Xaapa/SzNBgLunIfMuQixEKW8Vd?=
 =?us-ascii?Q?vE5lKz67R6FDLwLJ0MvAomXV0gpc2ec0QStlnWtmglKxcds59FMKXx/vh1GY?=
 =?us-ascii?Q?/BqtpOaAow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdeff70-ece9-4d52-27bc-08df29eb7052
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 12:05:29.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5M3pijmYzvsWHj1y8R3+XWKh/cqhsIfio9heuOMdQLKuZhGOkvcpct35HN2bQ1sDjLhXUKM+2iP9qCnxwjjWywz7aw+bYUm8Wz6AdXe8uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 12:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247757

ReleaseNotes: https://github.com/stefankoegl/python-json-pointer/releases/t=
ag/v3.2.1

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.1=
.1...v3.2.1

- switch tests.py from cp to install.
- install bin/jsonpointer needed for CommandLineTests
Ptest logs:
PASSED: tests.CommandLineTests.test_empty_pointer
PASSED: tests.CommandLineTests.test_invalid_pointer_file
PASSED: tests.CommandLineTests.test_missing_pointer_multiple_files
PASSED: tests.CommandLineTests.test_no_pointer
PASSED: tests.CommandLineTests.test_pointer_and_pointer_file_exclusive
PASSED: tests.CommandLineTests.test_pointer_file
PASSED: tests.CommandLineTests.test_pointer_file_preserves_member_whitespac=
e
PASSED: tests.CommandLineTests.test_pointer_file_requires_value
PASSED: tests.CommandLineTests.test_pointer_file_single_file
PASSED: tests.CommandLineTests.test_pointer_option
PASSED: tests.CommandLineTests.test_positional_pointer
PASSED: tests.CommandLineTests.test_positional_pointer_single_file
PASSED: tests.CommandLineTests.test_unresolvable_pointer
PASSED: tests.CommandLineTests.test_unresolvable_pointer_in_one_file

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
- Install bin/jsonpointer needed for CommandLineTests
- switch tests.py from cp to install
 ...n3-jsonpointer_3.1.1.bb =3D> python3-jsonpointer_3.2.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb =3D> pyt=
hon3-jsonpointer_3.2.1.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
index ddc8e256a4..16a393ad28 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
@@ -5,14 +5,16 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b=
7a329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10=
beadf60adf1900"
+SRC_URI[sha256sum] =3D "47c846513b3a4ec46eecef1105207fba075e2a3659048e362b=
d7daff0fc33342"
=20
 SRC_URI +=3D " \
 	file://run-ptest \
 "
=20
 do_install_ptest() {
-	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/tests.py ${D}${PTEST_PATH}/
+	install -d ${D}${PTEST_PATH}/bin
+	install -m 0755 ${S}/bin/jsonpointer ${D}${PTEST_PATH}/bin/
 }
=20
 RDEPENDS:${PN} +=3D " \

