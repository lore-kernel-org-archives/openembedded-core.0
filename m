Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D262CC982CA
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4960.1789499791346222233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZMj1OO0m;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJBmFNGFUubCZVUozz0MlX2N5N5i8PS1ZLwzgb3bKd/pk5Cl14x4D5nBdeIWxb5FuK8pQY22ioECmoVP/1xViLNgHRYeC7bxJyku8c8o+s/w4z7LpwNM6MKGPlO45BNQKLVB2Hy8XGnWyE2eJc5Ej0ZGX6btrR9mk91seactXzv2uimw4k7ti08xPzinfPHAD2vcVuN6wmLrpeqccI12O0r3AtWjRUMPwOlnHYVSpbrf6ko6p3J390IeD/Kymi4PvFEsE26nJqzembaJiqhHHC3fAqlmKnbTerMGZHZU9HQwjEb8rxVjZNfIf3yFjXf2HRPamNQ+crwc4ifQ0gpqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8X+TaI1dwNFvM6UOU0gNUhwnitloxOMZ6wkYKKqvl8=;
 b=CnZsF+rEymE5/4P+YK6R1Chp5QB0/gBPnY41wyR/ARRH/+4HDZCe6mIxQV8FS1kvCMn+46WLNQ33Kenttf1oaOgyZTepfMBw7LKF6BKXwzqtcdYGOvPmwSGoJ7gq2qsazIL+TcxS58+N3WH++BC5FluoAW4nHTATmP8ObndzVwmG9e+kDA3/sIR2asjb+jNwlTzII+CPEqr8DzzByk82zAtp6Z3tnB2Af4DSF/ICJK9KfeajGMGkaRIX1nNRzuUuvffj+T+nkPmlSwdAFpxHjAyYUHhA3k0fhlYffEmAV1kDxQ6BEx4cuL9zXdpgR9CsVRuDWru37RtzEy0UWCcqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8X+TaI1dwNFvM6UOU0gNUhwnitloxOMZ6wkYKKqvl8=;
 b=ZMj1OO0mjm3htOAx0BYKlZT5qs1drQaDBBLbICWw8UNxL0Sk+X4/6aUMFJ/lah5HUBOnDMd00oV+o/iqqRHIaWSj7mIoIAqVGHuhmdvWtVqfY5a3wP5rilqrw1jCZ9+eVVDQZZS9MyIn/siWeCTEWXLsf168I/4OaMpaWHKq8rMdW7dAQ+1frUHuMOGL2Z3CZAh6dFNuPVv6R/6SzgPzs/wRIqPj9eZACtDS1SVt9SQBYY3lwGUMn+LrGhAevY/gF4Lz4Q7fCIkDtvhTWUzeZWpPhN99i5EUmKNh7snTZJRcmMbFEBAWVEef5uCwQhgNUn2Whc+UVhskO0UGzGUuZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:32 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:32 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 4/7] libpcap: Fix CVE-2026-6244
Date: Tue, 15 Sep 2026 21:16:20 +0200
Message-ID: <20260915191623.42107-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0264.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::29) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa412b6-ae99-4e06-8733-08df135dda07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	0pM1ZwTUC1TQBCS2hfOyre1fVKXpjhXOzdT+0+gnaNfYtlkcJRpUgCZoDXbsL06qx9S2ZiGi0UKhoNOpceJamGIqHAkl22ei4B/5YQqofq8NE1vcTVLVRdFFd8SkrPQlmUN7fS6DCFw1AP8mM83wUjEDUpMgRp7+EQSwTcGUQl/fbye7py8S7/eBYywqZ0/mcnAofxxyih75Cl8pIkR54Yrnxvdh3JrIQMpVLpBAO3qLVmEuh1xnBsqz9mfwNqz1RzqPmekwYvgmO0NNQm5li2Ypfvnzv2nuHRMtlCwuEj+io12Ztm3wN3KsnjEmkam9rzaiT4ZAPMILAh5I3npcogIPkJ7eRZqIImA7SFJ8i/QkWTevsl5xex8kodRgYVhEJb7h6vHZPdWsKvMDP7o6bSjoBzTwXBoBCfszsypky/B6p6fReXoW7AF3oyb/+XvyvNibtIxPDLA9nmkc/OJkYYqvJmLtvWosodYCtX6AJ6qhdF1HzpETi3UbWo/+FS6yy0Qp5EXGQqWdqpcCdnPw8u8h/Z3VSa1dLHUlLebULscsKt3akip3D6JCQw8EU5nC7ciwlQPTRXXk8ueJ627iyp1frOccsJL7vijA1mPxaDDa/x0MOEwy7T/xr3ZQPt4X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cCSJxmt4aN6HnagNNe0ISCQauQvPVe2+54uA6NS0hH+AeVoUMP5U+wr2V2zb?=
 =?us-ascii?Q?r/33dVN9GtgeT0ipzAqAGBXfXg1Zm5mtEE2Flm2cKANwdPmL1ghPMbCujjwK?=
 =?us-ascii?Q?KYgmeVZNxopnhrJCLUAkTL1J5Pr6Rnhj3YuImD8jaZztHg6SvgvypQaGlLzH?=
 =?us-ascii?Q?KAOK04bshViqEPRfz5Hv9+7byqB0ihXZzbBavFabSwi1QUA6ICI8AcIW8EwO?=
 =?us-ascii?Q?IcZOBxlQHKPyXQin2M0jLoeszoMCJeh6qbsPMWWCxtUcdnsXp8jx0T3j0j15?=
 =?us-ascii?Q?3GhW3r1d0JPYgeS9E9WuVaWUe8VW2kLPl7/Knr1FYqC2ZkKKCDzTVUxxDO3c?=
 =?us-ascii?Q?Q0uy4fZREp8jgExcZ6L8pIAsohC70ea6R/fgb0zYX+6ej4zuu4DRv9Fxlglm?=
 =?us-ascii?Q?mjS09lM2yuucZ9kEMpUOYix4xIAiI6MGwTZXBEMI9DE2KaWN3D+eqM+Uk9hL?=
 =?us-ascii?Q?D5m4yFpZok/ByqR3j4NXQt63t6ZJXLsHW2S7xq6cMwWXJTPTfFY3eOLdHad0?=
 =?us-ascii?Q?ZAgRfEj7HthzrLjzMyr76Tt5Ua2AxGgfaeP9197m9eDsyNDOonQrtYmwTHHH?=
 =?us-ascii?Q?va6afpq9MU2J95bJ10lqatnP+29/0FqMbtZe2RpyVhE/5CbGzbriOzDLCJr8?=
 =?us-ascii?Q?5h7vVJlQLsRqyLdjJY/QLPOfnQ7MHkEKa20mJSi41rXdntLp4CRJ3ousgTeO?=
 =?us-ascii?Q?ne53f9RoQ8ubzedpDBr5OlLsA5RBJRue1EKmQmoNh/pS6TU70xUeiy6igudZ?=
 =?us-ascii?Q?aBYTQwdQQUmS1vhKkaNFFD5LAgmZzjZpHtcZiFFbqNOGJ1wQzIb1zX/RKOMm?=
 =?us-ascii?Q?F52HaCShCz5Ia2wneD5hg4TUfLufJDXQd06LXNhJ8dnPPnAf4yl738/Ah+N4?=
 =?us-ascii?Q?cJa2Pg5BZ4BpuY2JvDX+LG0SZgymffG4DLbqwDrf3zzBGT9dc3WgkS0skJlo?=
 =?us-ascii?Q?yNTvC4jA6z5gQ+nANDEYq/suulq/apni8rijcB+Yz2fCkJk+JS7I7ADk4vGb?=
 =?us-ascii?Q?/obRt/AxSevDCl4Dj7kTN+xlMXdro5rXYkE4Nh9Jj0e1ZSDZ9Ldbzx6YYKcb?=
 =?us-ascii?Q?6Ldnbw7f4rg8YIyvMdeaEL7cXypaq5vTYBq4bPt9BcfG0GitTpPcwG7zuEyp?=
 =?us-ascii?Q?OiRL6gCAHjVU0dPCW2kgHQVO+HpxweADkJpNb0DIxbqC/bYMVyi80sKT7JZY?=
 =?us-ascii?Q?At/YP1f0GsfN/9IAOXxOmWo+hgjeMun7a2oLq8kaHusC+E76cc/HIu/jy62U?=
 =?us-ascii?Q?SudEAxksf5/0HW25fND7hZfZufH9veC+S0YwxN3pjBHVqf6eMZa8F9vOPj8a?=
 =?us-ascii?Q?nJfDMBIiTXU9L5UYZD1rEfAtR0fnknhyoVZyDaxnKVOpjH2Y2Bxq0SJ4Dd16?=
 =?us-ascii?Q?iAI+nShFq9hIHyte0HXXBKuPbsnZjxwCUAvnDa9LzTRpvPD8EmWMeCj3TakR?=
 =?us-ascii?Q?xt+WDciLdm06w8NfHntonoWskTxWfkkAIC7CGEW7mkqy4hNG6Oe0Kx+a6Oxh?=
 =?us-ascii?Q?Yb84YZEIb7CroR3WEzuiZrv6+z/rtqnN138BH5B0PEcLfOd69I/PPsujBDsc?=
 =?us-ascii?Q?ca1vzNoncDqgwpjHdEoPOQyoKqosa0r9SKJUnuQKiXwTOivvX+HzMo1awfx7?=
 =?us-ascii?Q?qu6jfRP893OR1Kiz9g4/EnVNTic48d80DFG++rlWmbtbz5zuPyHJmaXkcC2b?=
 =?us-ascii?Q?cGQZXE0+wW6U3pRh3b1cfb6HSynuLEb8ynCzy39AXQ2VjXj8xeSd4WvOuLCi?=
 =?us-ascii?Q?IQE2Xi2I7w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa412b6-ae99-4e06-8733-08df135dda07
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:32.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw1FA3PxjCorZ52ECXcI/Cz3uYkt1lsTYP3/U1+obZQTKXchGPHh25k2laHFSfMlAHeNbYZ1RJOvhsTb2qfpmMip36J2kh4laPVYltAfZHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245871

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb92=
1b141aa642faedbf2ac510541c76499a19
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 50 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 0000000000..b7fec6b554
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,50 @@
+From e2f4d78f71237c44f730fee11fa0497b756e9d81 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:21 +0100
+Subject: [PATCH] CVE-2026-6244: Avoid division by zero via
+ pcap_offline_filter().
+
+The current revision of pcapint_filter_with_aux_data() for "div x" and
+"mod x" correctly rejects the packet if X is zero, but for "div #k" and
+"mod #k" it assumes that k is never zero.  This holds for programs that
+have been generated or validated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter()
+and have not been explicitly validated.  If the interpreter executes
+such a program, it can attempt a division by zero, which will typically
+terminate the process via SIGFPE.
+
+To fix this problem, in pcapint_filter_with_aux_data() treat "div #k"
+and "mod #k" the same way as "div x" and "mod x".
+
+(backported from commit 0b2b1ad4a1796513613ff68e9dc09049cc8e0af4)
+
+(cherry picked from commit 98bb921b141aa642faedbf2ac510541c76499a19)
+
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/98bb921b141aa642faedbf2ac510541c76499a19]
+CVE: CVE-2026-6244
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index f8b842d6..0178aae5 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -420,10 +420,14 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_ALU|BPF_DIV|BPF_K:
++			if (pc->k =3D=3D 0)
++				return 0;
+ 			A /=3D pc->k;
+ 			continue;
+=20
+ 		case BPF_ALU|BPF_MOD|BPF_K:
++			if (pc->k =3D=3D 0)
++				return 0;
+ 			A %=3D pc->k;
+ 			continue;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index da218bd87b..258a15f5ba 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://01-CVE-2026-0799.patch \
 	   file://02-CVE-2026-31912.patch \
 	   file://03-CVE-2026-31911.patch \
+	   file://04-CVE-2026-6244.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

