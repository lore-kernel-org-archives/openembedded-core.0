Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6511EC982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:33:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38332.1789648427570810499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Nk1m/Wt6;
 spf=pass (domain: est.tech, ip: 52.101.72.13, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F17wSzLr/u4089cUrx0CxowlodY8mw2ua1GJR8IA5co7h/5arPPVe1GNz0xIGGiAI1JyBBB5Z6RacEPFYWmujSkA2noPDeXi66AZwNmrPADKZ7BTOI5hiItFoHMopRZwlHUu762NJUKjls6NIOUof49bpwbvD8f/lfkw0HPN61BBuv+ukDhKnvtFPqYjcs/118fG1/RbftwJAQZLx4LErPH/5WPbgCG1Nyu4yCoBH450aDj4N0ez96TEj7XGWLR5TOat6SlsmrRkTD1nQrPSxMCGwcyNGwebHyImdvP4klL40jtmWdVnjSr05yB2bDeorEl9ejMPfXIovu5gYDpDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kaaamAH3t46YqXD8B5qGhgYjD+gOiAJ6ET/irrCpBI=;
 b=QdGEH7+uzK7zXk9+7D5XlVb0ehrkWXLNbZlg099j71z/g1iN/2kBqWSn3dxvFXV3rj1ndjSlfmLjCWfKNi0O9qWHPkug52gbnuLTxl2mwuddwooC82Ub6QPe/XbRzW31CzZs/Ui3btgwOM8ugig7SP1LZN0MB79LBk5+3lC/VEPNKXUVThPph0k3vDQdE6zRhyy6bGHx35sSEMY0ffTCuDLJ5oQdMytwRFwlNvR5KM/xRn2r0IPd04qsEOaW0eov5gX7cQU0O5omNTHKviG86dWoYyd/PWV5DyoVq+pG/XNh0FexMtfT+FfQZwVp9uLFz1sE0LtYMw+71aumOv7XxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kaaamAH3t46YqXD8B5qGhgYjD+gOiAJ6ET/irrCpBI=;
 b=Nk1m/Wt6J5XLVJPrrlk9jUD6cZSIvhG6XTPonhRg6AzpqsH6T0BO96lCL+lGhK5WsWVrTqqDnkU2M396Vr9RX3rdSgpBp42a5P1YL1fU4ScO4WsIhjGn/F6cwJMs3ZI/uwm6o2Q1R5IRxtw3xxU0SWZTJ6XXawL/pOKXHhJ35SX/aXNEtuSWBjgIu8w03ShEPueY+Jh9soQZqbBBEie/t3JirIvyJ7sd6O5pAiYaPrOguIP8ao48JzPu59/GcEJFqXRFAt5HPLFIVohvUvLlT5FJeHrIilBARPAEQtWpjMtyHaov9bzJXSYOOh4gIB8IZjTEwJkjhVS06vPkplPcTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0949.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:149::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 12:33:43 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 12:33:43 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] gawk: skip clos1way2/clos1way6 in ptest suite
Date: Thu, 17 Sep 2026 14:33:36 +0200
Message-ID: <20260917123336.35631-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0949:EE_
X-MS-Office365-Filtering-Correlation-Id: 458c5684-8b22-4dca-a2c5-08df14b7e90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|3023799007|18002099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	POGnJ1vtdIz5IF7+Ltg5O/fDXKPCpKbEYVDaEYl/oTA0u3My26/MoUExiawHxx8E0yTBOdQBpt4Y0gCKk2qYXFMs8im7ifcTvC9UmBZMAnSFXKuoIqVVQ6k0rXQ4WvKROg6JrlEKVdg6JWTctm+N6nqkYglSqJ/mABTcVAoUGSXMuMQgEgnZx0wW2jkeJbiODvbK4ZOaWo11frmGAM3EvsV4NU/enDyqD258zssxfC1ZdADLzCNG4tC14MaurJHwE5ApYuAF+KdV2WgmQdFol80ulmCJ5ptxS/wOCuQ+h0kYnFKC1ETcqmt7Q7C/njZwtkdfI4Qwb5E08xjqBDJ1WDperBBHwp0+vt4hpsMWYanJ7Z+6o8JIFYVGcPBoCxqsj8ZEER/vIjcMh4EegQtgLb6+L+llCzNb8kV03EM2ZUCVhkPRDP2AKgjhmT9dMKTErNP35WRWUzJwpFACFrmxUc/NsEetmpH+v9U5Lclx6z/7o3q95TIhFFB6L0i8D5wWoSHDpgtkjPM4GSzKzkmopp9Bb9n8teXmC8pgrdQRabEzmzhJjDnood+r0pFWWsAKm+IpEJRyHslsUFUfoZQXKmG9hcOZXVxnLEuMhaLB2FdHkibMk/9Y82lXDEtIYxce
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YvWjjI9Z3sm/J7ZduAEU0QRBfBiD8dkfn/RK1mIc7P2aeR9ojmlqpSwISwmu?=
 =?us-ascii?Q?/f2ulhbMhMM1lLlECRfbiQGGMAoJliFP0vBw7UDccnM7mrQ4LYSzBKvbG07Q?=
 =?us-ascii?Q?5DzYwuQIAp+q8Ku48+fkaE1K6TFbrh5llBYSCmngG8RLHdQhuvIB0qJiBG1Z?=
 =?us-ascii?Q?iKDOhadFdwCicVasotdkrERV6QapXqwYY4IBYUkwW2/U3pVAc7F2He6xydrz?=
 =?us-ascii?Q?gKrcKtNSWZ0D8SoOSWI4x223mEF0z5oRJt47lCmCFrk+lXx6FE0XYDtZL6oL?=
 =?us-ascii?Q?cVLgpniZcEJTwiM4nQtJ9wNgiAzAau6rWkdxYzi3+gVWzWEZHe/z6ud6YO8q?=
 =?us-ascii?Q?oXqw+e4hulEUEqB4bSJbnGvumidogiYhlr8o7Jm0p2U9zGz3KjA9QkHedVMg?=
 =?us-ascii?Q?lyD2W7T6pYeRjE2YXbzqI9Fv+UBvnOW5MiUh9fES6V1kQeGrHFKiLjybwRER?=
 =?us-ascii?Q?fM/o60QJ77/qAOUbqcwe3xD8zNHcFqfY1Wqf86VjpQxm25UQuLt1xsYhh/vS?=
 =?us-ascii?Q?2iF6R19+KO2RitlB8yrkU3RhjFsW1fx72vpquVdETdNCg4tHJ3bZa0uTzioP?=
 =?us-ascii?Q?crD3rixrkXdIxh7Q5xvLQPHRm+Ts3rDLeb8mNZ9SfjcKqG924UG2S4248SUx?=
 =?us-ascii?Q?3eI8f8hStEtDoU4Ocemz6w09Fb2xt8sbG7JuJfQjvcZVdgAYlbLxsYSawHIF?=
 =?us-ascii?Q?CJISNfxEpi1qaaKFbYN7Ppk5+zly0RSx96GY56+9MksKN/CX5V/PUqmmjf05?=
 =?us-ascii?Q?MF5/XsQZUkgLhvwI37Aw/MFfgHukaEwerot2chsE/Il/Ow0ZWZiYkNTB3uy5?=
 =?us-ascii?Q?U8UXF8lNjw1w9qDHMzIRgUljwe56hiOtyxY/DuZRVH5RSKM7cwUt+IdSgiDg?=
 =?us-ascii?Q?6wBYzjcD1tnWww5DNoq9CNyJ9YsdlFAk0ng45/nf7+qJcbO2sabr81/foyo4?=
 =?us-ascii?Q?xOTna3UlHwBkDSdmlk2LgJ8Zl07I4ajDullzTlyCtOUi1hPpyKn9LVFvG6s4?=
 =?us-ascii?Q?gumlGILcWA7cDi/mmOxvvae8FR7KwSjW2EWCAqD/0ZcojaA5BZ07FtQBv/Ud?=
 =?us-ascii?Q?cfxuPmY/c2vs+2To5RrDicPhiDWPvFSmHmzSLdOBSBXcM5noqZYIm/Pwf8fN?=
 =?us-ascii?Q?5KpL72xBlRxy7WmoWBBQlmK7r2aMW9EgLVbCXOAzjcq3FS8s5Zu7KmVjHK5c?=
 =?us-ascii?Q?yYwVpwdGXaqVtZFwVnxyCCE0SrM9kXq6S6NYGo/EdQDPYihUfCGnBuT+Vk5c?=
 =?us-ascii?Q?ZEKwDQDokgJH8sVCssi8dXG7jVViEyF4SF6BCfCTWIroraaePXaAIQXwRMvp?=
 =?us-ascii?Q?8jdZk8qbJATR2JRPOY1cLiHxiquRKEspkcd9nMN3IGvdOljzpnw7ng0fS96Y?=
 =?us-ascii?Q?w9reOttHSV6Qhlh1wMpE7sQRGjhyd57D0B03dmm7SjGAidkC4tKEtqbN4vp5?=
 =?us-ascii?Q?y9RJTYh/Hzw4iavzskxoWMhua4zlHNKL1KaSZNdtxlilVN2ZX1OrJS+zcDa1?=
 =?us-ascii?Q?8Ad+yQtqYi6vRq8963ZnoE0em3+J23dBGrXe40CcNS+1WbGLvP3NF1CFhC2C?=
 =?us-ascii?Q?pRqafCr5n0fnJhMtNqJ2pc1Tm3erBXSc9lumfP0g4FEdmaNs30yJGectDtQF?=
 =?us-ascii?Q?I53Ydr5xKxVPjcFwWYjJ7VQh0HUscAXW1jcHBIfobZOx9KqlacOAy88xS5Jx?=
 =?us-ascii?Q?IHOtEtxB4ZZgd6D3926+SN0X2RYaexGAP97maO9ENPl0dPyN9l3jHI05HbN3?=
 =?us-ascii?Q?/Lb1rnw7Rw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 458c5684-8b22-4dca-a2c5-08df14b7e90f
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:33:43.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg2zem4sevUJ7EaOPe/KuSlxn27B6xGU5yK4C1FL3nPX1N3Y4gm5vI+KDNmG0k31/j3h0G/PXFRbRNzn3fyphQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246062

clos1way2 and clos1way6 drive a two-way coprocess (|&) and expect a
fixed interleaving of the child process's stderr and gawk's own
warning/error output. That ordering is not guaranteed: the child (cat)
and gawk write to stderr independently, so on loaded CI/autobuilder
hosts the lines race and the output no longer matches the .ok file.

clos1way6 was previously skipped for musl only; the failure also occurs
on glibc and clos1way2 exhibits the same race, so skip both for all
libcs, consistent with how time, timeout and randtest are already
handled.

[YOCTO #15477]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-extended/gawk/gawk_5.4.1.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.1.bb
index 89b73a1641..d3bf532528 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -83,14 +83,20 @@ do_install_ptest() {
 	# randtest is a statistical test that intermittently fails on overloaded =
systems
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254
 	rm -f ${D}${PTEST_PATH}/test/randtest.*
-	for t in time timeout randtest; do
+	# clos1way2/clos1way6 drive a two-way coprocess (|&) and expect a fixed
+	# interleaving of the child's stderr and gawk's own warning/error output.
+	# That ordering is not guaranteed and races on loaded hosts, failing
+	# intermittently across arches and libcs.
+	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15477
+	# Reported upstream: https://lists.gnu.org/archive/html/bug-gawk/2021-02/=
msg00005.html
+	rm -f ${D}${PTEST_PATH}/test/clos1way2.*
+	rm -f ${D}${PTEST_PATH}/test/clos1way6.*
+	for t in time timeout randtest clos1way2 clos1way6; do
 		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
 	done
 }
=20
 do_install_ptest:append:libc-musl() {
-	# Reported  https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.=
html
-	rm -f ${D}${PTEST_PATH}/test/clos1way6.*
 	# Needs en_US.UTF-8 but then does not work with musl
 	rm -f ${D}${PTEST_PATH}/test/backsmalls1.*
 	# Needs en_US.UTF-8 but then does not work with musl
@@ -98,7 +104,7 @@ do_install_ptest:append:libc-musl() {
 	# The below two need LANG=3DC inside the make rule for musl
 	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
 	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
-	for t in clos1way6 backsmalls1 commas rebt8b1 regx8bit; do
+	for t in backsmalls1 commas rebt8b1 regx8bit; do
 		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
 	done
 }
--=20
2.43.0


