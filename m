Return-Path: <jst@mbs-solutions.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E08C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:13:01 +0000 (UTC)
Received: from FR4P281CU032.outbound.protection.outlook.com (FR4P281CU032.outbound.protection.outlook.com [40.107.149.127])
 by mx.groups.io with SMTP id smtpd.web11.11482.1737447180504907106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mbs-solutions.de header.s=selector1 header.b=nrL6NESU;
 spf=pass (domain: mbs-solutions.de, ip: 40.107.149.127, mailfrom: jst@mbs-solutions.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWyX6w1jGvlxQFnuCk0wAYGTJeLWFRrkSCyLryVF8dVyLkAMGzJzuJtKt0L/mV6ud4xDavW4yGreDJiVHnVMiBPj61XGNJ8u2lDgVX9pdVZhJQNTsgyiPt4oXoh8VRfxyMo1TwKXuM1Id/ePEH+w2a8RskPEGT3zlfpGG/7BmgZ6r3YYcHzN0RErJfFtIsj7htCM4nCaIE0G5ikoK8l62SH7WMNg/j9fxEEu7u09N7OuN22kElvPD94troZ4F/NRUUaFIz/xg8m1+lW6FF7DdoGqHnkYm6VJTaZrq8t3irQShOyuvwvPZoydwtYVYBpt5rqtWVJWobWhNsTRi95xnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui54789n29SbIPN7Pz+v7JarX0vliD9+EcPfzhNk3HY=;
 b=ZpKFw/pN5obyX8Sy6MTKaU446s7xw+SqAg39P4iEi4yXhOKCeNrt7ecrqK2wdXw9ulog1CWRMrFwV/e608C2tqi4wqznzt2ks99s7zA+nEYhrx7TiMq2wLhq+iD1BWasvNI0F9V6RJuTqOySpj62ylYP6MZj+Gv2MjwdjWXcU3sB4lVCvny40ff7G7g2GQo6dxaPTUSiqgUby72Cb4h9ucQ3CaN1iUTjR8vCaZyMBtid9+PQRD8hXMvta9HylDxExYxHf7/vdDa/d6Ln4ixKF4gs1Vv8638odF7voBJaydZP1YDIl7bXWiWJljXOlBtM/NyF10EYzX1b4Zfw4P43jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbs-solutions.de; dmarc=pass action=none
 header.from=mbs-solutions.de; dkim=pass header.d=mbs-solutions.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mbs-solutions.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui54789n29SbIPN7Pz+v7JarX0vliD9+EcPfzhNk3HY=;
 b=nrL6NESUhnP/S8MMvnDkKlTeHMlNuuQyIh6EZBlhsIF/Bi8jJAopj2e4s1v87lrPn/zg6Xwg3RSzPZENaQjbTbGR3CmGI8LCUAHprN4b/FXw4blcVdchd7js3H1X+UcZRVbr3RkLLsxA1FY3ny9pYoM6yUjLDe6fb+XSy6rh/rU4ZyMIlrOFW9xAA4a9sc/s2O06AXbHFTeg4TXyt2mBb9Jemj9ZH1FSy4VJUgOXloHQGyqJRvpCatbF6VdbpKnSU1EGdbaez3MJLvkRNgl4dhEDJR3/L8TpL2uvgptJ3LDAi1rUJEJYOXma7+MvJn+y/wB6bJwnUO/J70HCAWdYiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbs-solutions.de;
Received: from FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:71::11)
 by BEYP281MB4519.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.23; Tue, 21 Jan
 2025 08:12:56 +0000
Received: from FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8a76:8812:5cd2:3e5c]) by FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8a76:8812:5cd2:3e5c%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:12:56 +0000
From: =?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>
Subject: [PATCH] cargo: remove LD_LIBRARY_PATH wrapper
Date: Tue, 21 Jan 2025 09:12:20 +0100
Message-ID: <20250121081220.35589-1-jst@mbs-solutions.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::16) To FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRYP281MB2522:EE_|BEYP281MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: c004be65-1033-4042-43e1-08dd39f36979
X-ETR: Bypass spam filtering for authenticated sender 'mbs-solutions.de'
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cjAPb0H/uaZXsaZt4DjWVfbneV5Z5nDyTnjt+ihQjZdhljcj/1WMLTVsN8md?=
 =?us-ascii?Q?aRrxoQtPnKyzJmIoTDsbA1GMJXjmwt42zoiVqiWEaOi9O6nxW/6/ufpPf7sU?=
 =?us-ascii?Q?yOOLOp80Cmzo/nX/f0X0BlkosBtzrYAj1FWj4kMiuWdYlzUpGm7W3GRxVqLk?=
 =?us-ascii?Q?mcjto5nVvLaaspMt0agM13Jhi8ITbH5ZSPygsQm3R3OiI2VrFU1m28MORhBx?=
 =?us-ascii?Q?/t38puaffObNgmm5LGW5mLHFVXWcfnBBJcW2qkjoqIp3jEQevOXaZ6QtQTRz?=
 =?us-ascii?Q?fDmulC2i2Gy3j7b0toFYygG5wWfe1KXe+Ya32a4gXZsVHvWJ4l86kWYIimbX?=
 =?us-ascii?Q?3YAcdbwBiZxcMP99yooCFhH8U+98xoaPrQtj68vyZGHWYeRsh6BktIAtYWM8?=
 =?us-ascii?Q?7cPMY9uOO3sO/GjBUYU6sAOtBhrLGva5I1yhHAgnzMGkSNLkxGt6QFGLuSJz?=
 =?us-ascii?Q?GXSbhl+8U46a25OZL8Ed8+AOeN8Tpq/jw5fKFDK61GhJnP8+aFvv+6OqEPBR?=
 =?us-ascii?Q?UsFC8ek/cnYPj5VCNiD3uLsmf7/WOpcVsWDmqJ+KIvI8mIRXVSNhogwnzEBG?=
 =?us-ascii?Q?Jovs/f/lUQKYJ50gJU3Zv9Rm6+uIHB8SmOWaGU6UMbcpr9+J9aWs/N1Lpgjz?=
 =?us-ascii?Q?UcDDKgDcxJ8aRh+icd+RIcrLVk4oacezQI6D0zdGaUV19bnJ4q2pW1UpPKvZ?=
 =?us-ascii?Q?u3pdmhS16HT+zzSoYch5OF4Zdn1xRrDrfbEf6qZw8UWtKzTFgd40nyZwIW5w?=
 =?us-ascii?Q?CnQB2eqBhccnFzOyfkWgvx+mzt0qQZfb/Dgevr83g+IWMEXM58aA70G4c4lW?=
 =?us-ascii?Q?i03GSyzqdyVMT8isv7+v/KjaoipPeFHG9FbW3TWXKwsm6VF5lTGvEFbI8CP9?=
 =?us-ascii?Q?mnAmBmbpyantXqq+ezgmiUgThcdlDUJW8ehU+hwczErP9FOKBsq+HiLFmqpR?=
 =?us-ascii?Q?G8pnVOaqOzESDDk+AJAbkQB3yx9BkThUh4bE7O0Bgfb8j5wJMl7OumqYGrz6?=
 =?us-ascii?Q?kOB9q7Hf7Ly6jXqcSRYdFXk/yWO+qYE23LFekEP9ygHj599ucmQC1oVl80M/?=
 =?us-ascii?Q?URzlve8mL7M9amu1qp6CCX6Aou/xVYy5jiNY1h0DDXqgU7ymTD1mXWvx7Q+X?=
 =?us-ascii?Q?qsfkD7o2wySNa2ZqIxu6T7WX8M5K0lrzoR3I97y46THgEQpiPfgfksDbMzSB?=
 =?us-ascii?Q?P3CDpmIgpjM0kD5IOR9h3pno57mcBMw/iWU3Ve4UkKCQrZl26II4icKGP7Cm?=
 =?us-ascii?Q?uquNwbNut6B81E+MZaExf6KbiU8UtmwkJ2TrP9cfVJmxNgnplj1pSCEH9/Vy?=
 =?us-ascii?Q?hXUGoJJGbJVedh3I0XecYluXARrsY6D5ouj/w6J0VwAK1y+kjWliwanvyz7t?=
 =?us-ascii?Q?Jy90L2vS4nLWotd04eHp7jOAERbZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iWTbTgB2AAs4EkVSAPKXESc1n4lit47VNR/H9wPtkx55pNTRdFf3eLXE7d2y?=
 =?us-ascii?Q?o7eMjxeA4jBVkI6HSY1tsuN8eDhFzeJPvqqBYFmIqUsREmtw9smS6DUZ6RyY?=
 =?us-ascii?Q?GZiTQ36sTDjG0EghipfEAFhUcEOOUp3jed8gHJiLUIlEfhnBInSw9KnNDnen?=
 =?us-ascii?Q?XLb+IY+rsQq+lNJgLwSC34dgekwTFcBfH8RlyIDjVtcUyP563j7i2tYBXGZT?=
 =?us-ascii?Q?jn94VwOrwX1cuhe5zWskeEwecodufJuffS+fECMmDYsYCx90sdCKj3th1cgI?=
 =?us-ascii?Q?B92j2DhdV2TAXMUyGxOqlql9rz8Rr21p5IVeJ5AQtwY/EMvTy4lc3qicjI5p?=
 =?us-ascii?Q?kyANiDs+hASn/I5QlUYqMIFuN9wfs9pHTs80rJinnWnUgsTJ3kV/1YU1zq4j?=
 =?us-ascii?Q?02sCR8q7XLSq4rPSZS16cRKi+FV1ehJzmU8QdFZn8/qvoNFa305gmZ9ufFY/?=
 =?us-ascii?Q?MrBxPA62o4rwES7G4Gazr+6+bTPC+tSfzEBG1ET55a1ycy+XD2c0U4KhmJdb?=
 =?us-ascii?Q?/iu0lyS/ITJ5lHuKtFSTp9EscNnsZZomEhHHJa4LeA5sw4qAGowQkxbR7azw?=
 =?us-ascii?Q?q1ylkIbDwRbZo/aFHkij9sO9ikPc9jpiaqVpeLyQ1Rei3Yn2PDuTgfhCsRFm?=
 =?us-ascii?Q?MFsU/0Ip8JoZPFwNgL/oNDCvOIHyp8iYn4uKj/gTHqvmzXDk/gg+w8rtvE2l?=
 =?us-ascii?Q?lNE+Q6zXTromdzhw3FVEMoeaibPq8I0csZQget/TLTEs3lo5ZelMRGAMgbdG?=
 =?us-ascii?Q?7lkRYZcddz24wkT9F70/zjnEkGxDWWI655EH3tMRoRQQJvYcLL2JsVf31DgT?=
 =?us-ascii?Q?Ewh75awI8XE4lUF3fuG5g/EVSaOJWq2rhqdKcOWg3Y03VVORQhqd/Po9eBn1?=
 =?us-ascii?Q?hWsdRa2uD3IQ7uPl+tnnv0CQvVNQZfFdyKKqJr8owcHb83fkg5TZOubEJ87J?=
 =?us-ascii?Q?enZ3sdOM60h/LJzWCdcSWAreQsX054tsRpFf3tviqlNjf5bZQRoHOQou6SQH?=
 =?us-ascii?Q?Y8oF96a0gxyFZFCO5JRKtBReeZY3hLprGh19Rv6VW3fK1UQGQAo25x/53M9d?=
 =?us-ascii?Q?RJtH25sVAAtnhJK0fS2/YcgzaWnRUGXaCc8NthyNHdcpXUaPP/92nerRBr2t?=
 =?us-ascii?Q?YahBPnx3VXLDHGsXtVvNlbm4S0grdvH/o91yMBT/5rY2q8M0mwVenpS2Pvbd?=
 =?us-ascii?Q?c+JwAt9A1Wl8KNL2KNXQ6Go4wC0rg1wR+Czp8QzC4iQNDDCmAPL2G0+T2QCr?=
 =?us-ascii?Q?njaiUvDF6sGz1O+CItN8MaILOOpOqzYgazJTPUGYHKO2X7/n2xkA8GP8SqSV?=
 =?us-ascii?Q?QStvSCf17+mvPolaA4HulhqPGH06HIJTvkSrSZ0NQnfOb5nbJ+Vp9SK3TQhL?=
 =?us-ascii?Q?slOO7P7NZJ0YqfOG6+7dPg4WkG/CrGE7/t9PRCOlfIr3hIIzh4BLy6bJwVz+?=
 =?us-ascii?Q?NxkOtaMWswd60D7Vd60kImr1DmzylIR5qyzFIw0ZeSsMNR3tMtLd4tfCNv7m?=
 =?us-ascii?Q?7UO3WAa0v9719Gk/25pOX+bcjSUn6klt94/v7G2TRaESTpjvlri4ggIlBV6M?=
 =?us-ascii?Q?0oWN2sJ/41QTUZ+yd3FndEylAQri/FcElhGcMz5O?=
X-OriginatorOrg: mbs-solutions.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c004be65-1033-4042-43e1-08dd39f36979
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB2522.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 08:12:56.7729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 778c8b78-467e-4379-adca-743b91174c8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8eqIWNXffvAyUJa11QCBm8EDXvV+HqxmVAKIJ1gZGcb3eXaWmYB/cqpqD2uFIW1QreJWbm8HNm8zaKFqJaqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB4519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210071

Fixes [YOCTO #15579]

This commit removes the LD_LIBRARY_PATH wrapper around `cargo`.
Setting the LD_LIBRARY_PATH causes many problems.
Some build scripts will not run because the build scripts execute
binaries from the host system that are not compatible with the target
libraries.
Even a simple `cargo help build` can fail because it uses `less`
internally, which should not be linked against the target libraries.

There might be cases where the LD_LIBRARY_PATH is needed for some hosts,
like the case described in 388e7cac9f90e79ce8c3c1683d8ee0f4df1bc907
but one can always set LD_LIBRARY_PATH manually if needed.

A current working workaround without this commit would be always using
`cargo.real` instead of `cargo`, which can lead to confusion.

Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
---
 meta/recipes-devtools/rust/cargo_1.81.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.81.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.81.0.bb
index 123032cdf7..091ac3ae97 100644
--- a/meta/recipes-devtools/rust/cargo_1.81.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.81.0.bb
@@ -44,14 +44,6 @@ do_install () {
 	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
 }
=20
-do_install:append:class-nativesdk() {
-	# To quote the cargo docs, "Cargo also sets the dynamic library path when=
 compiling
-	# and running binaries with commands like `cargo run` and `cargo test`". =
Sadly it
-	# sets to libdir but not base_libdir leading to symbol mismatches dependi=
ng on the
-	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
-	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=3D${libdir}:${base_li=
bdir}
-}
-
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/=
rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecommen=
t-522567539, there are no compatibility guarantees between
--=20
2.45.2


