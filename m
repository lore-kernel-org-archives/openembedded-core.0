Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010C5C982C5
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5345.1789501531153569957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AgWccbsi;
 spf=pass (domain: est.tech, ip: 52.101.66.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie97FtQ51Po6pXTnW4eJoLToNK21X0KvHwra0UqL8/O629dOm1oNL+TcvkUtILr2upA8tJggaErK9G/7peI31K3AB/tSPBMJT29ra1bix6j6lPBJst3nRjElhWMIEjcpxJdFw+q12PFjgArDbxP930tFX/wM+HO6ysNysYO5KngpV+Kohr8ypVkG0/zwQz3xtcPkfHjLiplBqR6BByuU2GBQ05ZWGNnD0BgF//LSJ85T18LPgGRfl+anrwBJUTBCOmErOScDmIhEdmh7kkUEKn90q3ATmyMvcxokBBAuqjNJ1lQqnfLz4y7PUQ+82mhBzBl8pifAl0URPOpenMmsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHoU3uoddlQD0ajw6sjHDOyHgyX2NbZA2txpIuR5ZXc=;
 b=QISO58QLvL/A+xsrgoVcPXqK3dtkJ0KA/ea8zU2J7rTRVZHR7nc5gH0F3Zg+tvG3IcvDIgUF5XjHZfwqkpniokZESXyz4JpqhECZ2CJ/h3q6uoy+y/fVsihe8L47gXzTQy/fCR6oKSsUfC60xhO+ajBEJso6RO7cVPo+zW4tN/eIh0Kjn8zulEIYzxUWqiPEzjlTj7ts8E8fYObAp2Xpk97osjQdjboZZWrsw+Xdxk6u9a/Y8FmW3218REwO0s+F7cNsoTsIR+jVtB8zQq6ey8NP/ts0H86W4+yU2zfuQ2JzWhjgYVJFdPSNQMSxatizMrtNdIZZMo5wNKR/mqjULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHoU3uoddlQD0ajw6sjHDOyHgyX2NbZA2txpIuR5ZXc=;
 b=AgWccbsi1w/ixaIYrgkiY0cwjisBPS+EBaQvD/3aGMYaeuiFN9g/TTe9kMKsfoHlNP00tkiFM7mw9v21UtUDL2z4TzO0pwbhLTYf4eubee9Q8yQP4tBY+ed/SXAMOPWD76Ykhv0S8Mdnmk+JIJo0leCsdfJXpTDGUawpTt0NQe/X2iDewxohceIUTRuM40mXvRRMpDbxTzdrY6KDHKNDZWAnAY3X7TjDs3080WRySpsesYKYwdaRjjeWZVzfkrUPY7rNO/4iWLoV9t0tJY5IWFA6F1e0ULY9Pwh5s+q5NAjb5odyncGiQ2CEoQ16FZAxPFLCQx6Oq1ZIxreeTcW/hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 5/7] libpcap: Fix CVE-2026-6554
Date: Tue, 15 Sep 2026 21:45:18 +0200
Message-ID: <20260915194520.45847-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: a18dd1b3-e563-4493-8063-08df1361e537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	XZ3/DgPg1UNsWEwUrQNVQ/HRr6epnnKBlAj8QaQ68f+PdISBEfBBhtfBOn3PGSJ1fEGeEGNIU7DYVYWAf6wo5E5/NJmzYtXOwrkceh+BKO9jbRoP1Qkfode0c1SxdrOTtbRLnOW0rW8DD6ES42zIQi0DO79uXShWKOSJ/9R80GiF3CweEtcV7y23+AfWCM9KaV3Z2q7WIevMDdPZPVo7uNke8I2E7iZt1YykCt71W2Jom4jbpRugZrtEUC7kLCLJjakfoT738zdHtvHpdRD+Gdm+1vhej8lfnCXOVzCvbIe5Qpx/x/0Mr2W3Zjln68MFdr0e5b974vQpA7c2p0P/bFEbMEXCAEIuMfGp2/gu9e2bU+H/l+VNoD6uRfKdmN/BGyrcoKV2aqibaRLOgyPOr5kItKN1c8htO/LhQNbrYiVPYAYpNAhiHxuSuBKpv9DRinW/raZZyX2raKRtlDxBse3vJcFnfwdP8fTWu3Z1YGjrNBvlb3+CH/Krc88qeRsjPs/pfpwJsjq6xjNEHgl4HZuhPRQHVvN7IN0hx1RY5qgBI5xSPkgXXtJgWquaDQpWdxX4DR7VHKLOzHUwCHH6Z5aj4fi8ClXS+81EyuGW1Xa0e8gyhp8h0Kqy5Un0gjaL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NSizXCqrqmHz/19XrfHfo6i4qw0OSX3+J9j6TEr6Ri5Y6JmdLXbA3hwO13LG?=
 =?us-ascii?Q?IRJprxWtxTU194+BGowqJODpyMWyx9u4o1Amfva0kodCRJzYHt22NhFS5Urr?=
 =?us-ascii?Q?BZgylcIiaoQysJxvjl099FjfLTtLrC5nyywvFuKdRDAQPh6JuMEeI82A4YBc?=
 =?us-ascii?Q?M0IvQxwDsxeGUjJcFacVfI57cWTg0e6sYKmVHhjyqHwNIP9FTcHKjsighqLL?=
 =?us-ascii?Q?ZOGpULEyHX7HTwNA+VhS5hS5T1nyhTmCUPGxy/5uLpExxKLyIOfppE22ycDT?=
 =?us-ascii?Q?6X2QQZPd/hA7oxgCBiU4ch+CNJzq5WchuQ9TWPzaBCTqaBb1ObeEPFhG0EVV?=
 =?us-ascii?Q?MxBbd8RSeS8DmiABuw6wjXk3/Ni3gjZug13+DVDbgkDslm1Mo+z+FjDrYDe0?=
 =?us-ascii?Q?28HJWpGPXNBSjSwYxeKSTM3OUnEmnnwByyhTqUAhL/0dydsi42+HIQY2gWg1?=
 =?us-ascii?Q?booBDMxTl92iFpKUm9tsfKYBtwMMGTYCPhDQ6lXoo5VIICNGvjbfa6T9awLC?=
 =?us-ascii?Q?gxJxAy2mxhK+rarB3oKnwsq7Hr0mh/b2T2ZNOQyCRbO0/f47sxnYdzmWUhku?=
 =?us-ascii?Q?bxZPex9+0JpsaKGjmbTBNeIyc5FJwUTIOBlDwbcsjTwXjvL8BAWefmcsXD8t?=
 =?us-ascii?Q?rAeny0WhRKP2760BPxyZtGucpGcpOnJKpitGTHperOgI/b+nPmsue0PPCuU9?=
 =?us-ascii?Q?Kljc9UKk7v8ZxAwwHXHrM/xKS/iVfYvbI+EgI0EowsAteeEoyk0awiF4zqm2?=
 =?us-ascii?Q?JsJUFObGGuPDI12s/4PnyOZVZtiuqee7w+NAIIZZ9Y5oGTniDBnoYL1CWt+6?=
 =?us-ascii?Q?SGF5i0qMj8ymoRn32bvKQ4yZpYpWxraRgPrKcFT75J5K5JuCTT4wqapVlNAa?=
 =?us-ascii?Q?iRi2pR4SAuxflDbfCu5MPQpsQ4dnVri2aNo3RDz0fLGbLgk2SAyGOr19kKvE?=
 =?us-ascii?Q?A5NbVyN4wU0mE3tegcapctdOLHsNzpyqu6v+A2ZofU8C33SCOZew5npPJ3bC?=
 =?us-ascii?Q?qmOqRhSxDwAzPnWt74wRUF9cJf+QVovEyjfwdgyh5dwz7c4KSGTtMJv5OzpL?=
 =?us-ascii?Q?wi4NOZM5TknVWb2Qdy3D1kC4zQokTsxJa9h0bHDhgX5oqvxd6AQ6gAXJ5Qlk?=
 =?us-ascii?Q?ehnH0lYElw7q/afEpKe8hOE/ZAz/bjrJ7S92FPZ6VmnyWy5jbnYREqZvBGEL?=
 =?us-ascii?Q?qhSLAiFSD59WmYuBIcKz5A+r77/nJ2RQDw+sTmTFy7a55iwYtWCWBQtvM7j1?=
 =?us-ascii?Q?KjwwNImhY19umdPkQIrM4BVlJgXk7+FPzuiSQ2hSxFQFgc6dxFxVf36jSCms?=
 =?us-ascii?Q?ZD/8R9Q271zFO4v9Or9JV8Z1S1zEuZ6Uy1Co7mFkyBqdIVZPOTS9NujA8cGe?=
 =?us-ascii?Q?Nswpzjq05hoppPmARrSW/0B/ib0jbdEQLB5WEcI4u0CSNxwnwv/3FBbG3i5P?=
 =?us-ascii?Q?E808weDct8BvoooIaIpi5BaEpw52d7/n3Hde8TiToieqA8Ho8bHeLUkpmWkK?=
 =?us-ascii?Q?xgfOOqdExM0w3YNr19ZWYIsd6IfEpWHrwDpeHKnNU6+5biJ/eQyXxrtJ9OsP?=
 =?us-ascii?Q?Y4qaluW7h5nQqQnh8EWDeGo6z5JCR2kZNJBPKu9dm6BqjFjndf7jwKWOfmXO?=
 =?us-ascii?Q?YQzflb/BwTfrDEZxm/5gQ1QKEXyVGRaDthMBkjOonff1MZca0VrwLhQHAqPL?=
 =?us-ascii?Q?pnwQYlckOWX1CLHh7R7/vLw7LzQaYef+7rOkgBqNUTusBniKWmprSE/jZaHy?=
 =?us-ascii?Q?oVoVVIZgbA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a18dd1b3-e563-4493-8063-08df1361e537
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:28.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/M9ZRor9pvCD9zEyy44VL5+TpVFMTN8mKYJaBwE9i+pf70OBoUAufuKOCsEvVQX8HKP/yXPzS37z/LosTanE8D2t1tkXusXI/j5fWPbwyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245896

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83=
475ac303c6b681c52ad0b6e14795a8e0ce
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 87 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 0000000000..539aa7c446
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,87 @@
+From ff3c83475ac303c6b681c52ad0b6e14795a8e0ce Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index df92c433..ae8a3a36 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -72,6 +72,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+=20
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096,=
 the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -146,6 +148,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, c=
onst u_int proglen,
+ 	A =3D 0;
+ 	X =3D 0;
+ 	const struct bpf_insn *pc0 =3D pc;
++	unsigned backward_jumps =3D 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -320,6 +323,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
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
+@@ -607,6 +621,17 @@ pcap_validate_filter(const struct bpf_insn *f, int le=
n)
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index d23a018a95..f7ba1bf3ea 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
+           file://05-CVE-2026-6554.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

