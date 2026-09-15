Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6702AC88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4962.1789499796613908729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G0zADepB;
 spf=pass (domain: est.tech, ip: 52.101.65.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF9z/4JnA/fR8g8W7udZybB/xQD3YU9/4LMfna7DYjC6AQ2fk6DrEr+RYKzdlQdBd2wXGXoc160pT0vCPn74ycRJKWZieZmkSZcqLQM8Fu2P1FsdA2faInR1deaw3Qou41gbnjoIDjB0X8/zZiOiBFa06ajBEjfdrt16dmV8hpQHzeJEwcnOXWrnqa2OKAgMug0RRbI8nsJVe0Jmmu8n7L5dAXvnot2oD9DaQt0YBYB2xzzSJd5JgVtSwdkllJaEs2fWBRw7oK6iEM95znNGRFMH+f1f0J6oJCT+3zv7bbSXdd4RLOlIF58v/61yUaiAsBX8Dquq5qgy14O1m1gwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg2CuQAi9qHPuP2grHuVKAMwCpPAGWyDbiE/4QqaHHo=;
 b=x4T4HUZYcTPyqy6xh5NEnXt28QiDHqe62UYDqpOLFJgfN1AM/kY068+U3Imbz3Y4Y4vmaDsxdIIjr5SLo1tzowj/M+ZKh2c5S+FgmJcY38jtqXws4jdK+bUtbeJIVwxofDpSTKGTwPhkWjG+b+yTGZ9S0XxudQFAhdo7Xyfl6RR+NEteHeUDzsaC0KcDrT4kbpKAte5Xq8FEBvewzBBnlN1ZQkDZ/EplBwANSxJXIXTLn3AL0Q7HgEPk6DM9/LtmzYUkjc7IsLs2bPFuREq6THAGP+8XZteUkXfrqW7ogEc27LGzQ08Q+UMIj2wkaX4c4Y8O6kSzOK3G45Y9bzQ3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg2CuQAi9qHPuP2grHuVKAMwCpPAGWyDbiE/4QqaHHo=;
 b=G0zADepBp4ysNLM+khsomY9L8zXSKnueyPsO6daWJQUg6+eK44Ewo0Amfr8b5mf+i7JUWPkYRAXL4hpAtW/OeU6ASMGgZOAZ6C3S0ChJPD+LsOUUdFMuwgU1nYYufqqTfdRmJHgXMxXKKCDoGKY6ygiublPSzEauvO5su+kfG4kW1KFIuvFlYEvh4zV7QPd22OxrJBIHzRl2cDyngLCS51SigDQ6a4TboRV/SgdZjPwkSLt3G/hWOvmwqgZqCydEDXr86nBxwjjp1hIZ8MgdzaIG/G3V0i+SClbXYMJH90AvASe3x29m2nxwOvbxpw9sUxYXnHzvEw+kjkoUGUBMfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 5/7] libpcap: Fix CVE-2026-6554
Date: Tue, 15 Sep 2026 21:16:21 +0200
Message-ID: <20260915191623.42107-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5b92dd-cb48-4454-c45b-08df135ddb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	FJW3uMBi4bbzR2PFAFIYDOVUvtE2l+xTFtpnXCOn5LrrHt59XoD8PBsvPfV4CFdenzZGOvEYIKCNPOO3wrGDfaZpiEICLPm6+XcjzbZ1OXsEWrNmILNTX+JsR/uxmd9bHZ6Zl2NDWJRP5RjdsvksTjXhMXoQC0PwJwDqwQkNqzGFVgXp6eV5DrEWgK6cKDToBOx+voVR9JmLacUxBQ+nYk/gZM8SIA8QL+x4V05R9Uu3NOySlmgp/bjRuUZ4OZBeAC5qbjDlzLqW39hsnsIfLFTHpH7qmKt9JPpoGzOPsZXgc0EzxRJtGazWcNRbFFyLmu6iiVH70dtOp50XGWbCXvpQIlzHJlr5c8/e26z9+zRRl6P+padDWMHFb1KGxF3lx8Y7HwhMdvFdIunAQwSHmXnWw1tYdY5OMYVcX7qwouOgXgR03INWZ0f9NVXcjJpmb1kSXP7e1dTzoW00IIMbDpgD3935dFzobOqIwGo+niXJxqsBEXOkNxk28TKVFGG81X3QS8X0xn+R/cw1tV5nM8z/PSX/74ecFie2HGFBfGUCbJku1JyUr4VWh9iz+SHhD3YdxoiEGTT2sz2EPUwMZMcW2hvN5MGCjLBBamTR6i0pVDzVlQ2RQVfB+1Ta8Coj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mL3McEBPcMqiJWo+V4uUj8BK1Ck/n/f5ox6iHEd8FwbRuF2DG3lRY1KK69+t?=
 =?us-ascii?Q?oPwTr2ciyRXQaeP5HU+stxNtiMsNUYxGNEJfbdMqFklCZkcfWqjhsvAFCWD8?=
 =?us-ascii?Q?exQvYmpyqNJipeLLEFvOLTWC8AbZEqIiG3k/vIZNVRWmTUB3z0EhkQDxipBw?=
 =?us-ascii?Q?LCXMQi/2cKhfjqgsUsKlne4B3LGfNLMsJWKDT1wbJFP4MZc6FTwwZQ516OUj?=
 =?us-ascii?Q?ygsdyA3DJGKtiB1KkGo71h4YObgTWtrVVh1gtc3GZSaYOAaKlkdi/UUwNf5+?=
 =?us-ascii?Q?A2nKBC6xsktRCdBOdZ2EXpEu2xbOeX7AlIFg4kOk7V/ncLOOV0wY0lYXp6Lu?=
 =?us-ascii?Q?uvF22CH/0brTiBBvRhnBTgrMFZDgnxLAdoTJwLTDV/l6XZPEbEo9Y8HLCO7O?=
 =?us-ascii?Q?0bRtPEFZZ3L7HBSM1DQIYV0tcpMPlCFlT/yodiLeLZGFIih/s2GLlOo8eveZ?=
 =?us-ascii?Q?RfyeJ60q3L/FaiUVxWQQ/1DZHeNA9A349KKNvtNwcIYGGFfkmzMK9jRg8D8i?=
 =?us-ascii?Q?Q1NQ7QSi3gGM3OL0YsT7Ln25ThQIMhnUHGaAdn0BtWzfycx4ScBvlBrro4EV?=
 =?us-ascii?Q?KNm1R7av3Zi9oiDitses/EvTu4AClscIE3uxZYNTRGeRWqy1p7PlNtoFIarl?=
 =?us-ascii?Q?2650rdKqPG+Snk/4thYMkgQyKQkN6yFg0p0gBM+JeclJdNetIYB5zOauzPi4?=
 =?us-ascii?Q?wfQstmrpRVQh0C25UyfuyY+wWK4pHgbe19Xr3cj1H+au7ltNjyOjrTqtf03E?=
 =?us-ascii?Q?AJ1gLdLyWyE/MOmdgocOUjPGcGlkv6zKPRW7vmNziCvLlIdlErIEvqyPvu3r?=
 =?us-ascii?Q?8v7Rmet9r/6EPhwjCD9NODRffDNo5uMp/eu+yYRdacFyggGZiybvhUo2XllP?=
 =?us-ascii?Q?aLgEKs/1enXO+rLaH8vo0R3cbe8yGWSDk7qS/ukLLxhIasmv/TbqDKlaE1uA?=
 =?us-ascii?Q?Wp85/MeJHUz8VY7vZZAngIFJsuMVEW0zmx05E3EgusjhjcCxPgzdrDgx54w9?=
 =?us-ascii?Q?ppt6jc7x1BaV/F17smuDHqwiW8n15/7neTiqdKPkHNSrSIF5VWMgA6QnL9mq?=
 =?us-ascii?Q?kZ+6D36F9eAkzeC/TyB1KJHD468QGiJr4mZv8j1fbyCNZocaGwaJB+hnpKtp?=
 =?us-ascii?Q?2GshXvVFPDzryIVxDmkuwsl6IVqtBDBM5cQvYzI19w3/+eG4PR4E6BFDK27D?=
 =?us-ascii?Q?U4bC6Gcm1i4auh82cL3X53djFZCWDQRFdvMIl8I+RCGpyiD+j4ArhNKVLSp0?=
 =?us-ascii?Q?c6gl5E/dbJo1/tyN2QUt2d2whEGSYCntBVJLm5iMpiIVsZs1s292cdR0lojC?=
 =?us-ascii?Q?qV8UHSEn+SE28IUcF+H9Amb4WWZIiV9nkgYOT2To42lW7iTButYnvdiLDM/l?=
 =?us-ascii?Q?FZKfDayjl4EYaFbCC/qt4Ww2fcsGfS/rdnGGs/P59j70v/swbXf0x7wWttEx?=
 =?us-ascii?Q?AKwipZ51UsC2FaQBRsh8jtVM/HZ5s6xoBGoWMW3sHHHafsr35LmcYa9MVZX0?=
 =?us-ascii?Q?q37GLk84EGB4m4PvOaHJLlaucMDEFgs32CykeUbIiYeyrmSBarGReQJ6/GZh?=
 =?us-ascii?Q?EZwPM8TiD2cZRklnFtxu3HUed2s3p1byMP42uVbGDepZ0OfDFzhbezf7R7Ic?=
 =?us-ascii?Q?22HRUCO0JYIWNXLWeRunyq08EEFjRo00E95IDw0Gc4M9LXPf6Cd2SMVahHaG?=
 =?us-ascii?Q?qI2hdYcTpSi4FVttZKi4BMoMo4nTzVrR+1IQitl/pCbcqoCE9KQ2Gi4jkLuV?=
 =?us-ascii?Q?FAhcJ4CgsQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5b92dd-cb48-4454-c45b-08df135ddb0d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:33.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cYNffqK85k9WpSP/qEv0+25nGoO0gbAuMDrvaaZZnI+MJsZEqUVHuf90HAgvbctHfsv5cl74W2pdIBcJ+lTpafkhEMp79NhZMYfo1AN4fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245872

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83=
475ac303c6b681c52ad0b6e14795a8e0ce
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 94 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 0000000000..208225105d
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,94 @@
+From ee37e79521d28a04b09f5c37b835ae7955c15e75 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:33 +0100
+Subject: [PATCH] CVE-2026-6554: Limit "ja L" looping in pcap_offline_filte=
r().
+
+This vulnerability has been discovered by Kaixuan LI.
+
+The current revision of pcapint_filter_with_aux_data() assumes that any
+"ja L" instruction in a filter program does not jump to itself or to a
+prior instruction that is guaranteed to reach the same "ja L" again.
+This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+If the interpreter executes such a program, upon reaching such an
+instruction it will begin looping infinitely.
+
+To mitigate this problem, in pcapint_filter_with_aux_data() enforce a
+hard-coded limit on the number of backward jumps per packet.  Ibid., and
+in pcapint_validate_filter() as well, reject the only immediately
+detectable case of an infinite loop.
+
+(backported from commit 63c005c25aeabf1404968add49fc885da3e127e0)
+
+(cherry picked from commit ff3c83475ac303c6b681c52ad0b6e14795a8e0ce)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce]
+CVE: CVE-2026-6554
+
+Notes on backporting to 1.10.6:
+ - The stray BPF_S_ANC_* enum removed upstream in 1.10.7 (commit ff47ba55)=
 is
+   still present in 1.10.6, so the new MAX_BACKWARD_JUMPS define is added
+   alongside it instead of replacing it.
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 0178aae5..bc6d149f 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -70,6 +70,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+=20
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096,=
 the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -144,6 +146,7 @@ pcapint_filter_with_aux_data(const struct bpf_insn *pc=
, const u_int proglen,
+ 	A =3D 0;
+ 	X =3D 0;
+ 	const struct bpf_insn *pc0 =3D pc;
++	unsigned backward_jumps =3D 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -318,6 +321,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			 */
+ 			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >=3D proglen)
+ 				return 0;
++			/*
++			 * Terminate the program if this is a non-forward jump
++			 * and is:
++			 * - a guaranteed infinite loop because it jumps to
++			 *   itself (exactly the same as in the validator), or
++			 * - a backward jump after many enough backward jumps
++			 *   already made for this packet.
++			 */
++			if ((bpf_int32)pc->k < 0 && ((bpf_int32)pc->k =3D=3D -1 ||
++			    backward_jumps++ >=3D MAX_BACKWARD_JUMPS))
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -605,6 +619,17 @@ pcapint_validate_filter(const struct bpf_insn *f, int=
 len)
+ 				 */
+ 				if (from + p->k >=3D (u_int)len)
+ 					return 0;
++				/*
++				 * The only type of infinite loop that can be
++				 * detected in this function is a "ja L" that
++				 * jumps to itself.  For this only k =3D=3D -1
++				 * needs to be tested because the check above
++				 * has already rejected all other values that
++				 * would wrap the pointer equivalently on
++				 * 32-bit architectures.
++				 */
++				if ((bpf_int32)p->k =3D=3D -1)
++					return 0;
+ 				break;
+ 			case BPF_JEQ:
+ 			case BPF_JGT:
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 258a15f5ba..6ca75117e1 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://02-CVE-2026-31912.patch \
 	   file://03-CVE-2026-31911.patch \
 	   file://04-CVE-2026-6244.patch \
+	   file://05-CVE-2026-6554.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

