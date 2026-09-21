Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF93C982FD
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5809.1790021847111180949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=g3vJ6FtZ;
 spf=pass (domain: est.tech, ip: 52.101.65.65, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IS50u/rUz51W4UJXhVamFoiUO/MnutYwjF+nBMOMoA8br0WRxw/2PB5mBSNJ/AGcbiRc+V8eILrZOeGUyKneNWUMKtdh/SrapBq32SV3N9svFHpNf/2DCroRc3fxPVlwUN//AjwsI1sYX1CH0Ku9gP4GBgBDSnXbcGmt3FfL0xuuySMcMI3KDyRSf+O5YTltmfZ3GlBs6YAVJiJ3G2DRUVcnsWh6vP5W+EIZ7oSgCx1w4u+Z7QjOzAZlKa/j16vC4cmpT95yE40saH27sxUGwDs94IRfoE5Zywv0WqY2t5aXReHX3+chKBCX5/qEjipIJoWeiZ2gJz9wuDGxXjgnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHNbe5LjwcsnxZGYzHa431uJiWb33kDZFR80EXu8kbs=;
 b=fMCoBz/WwDHgf3dqrE5+z/hHy2lVEbF8Ht4+HFE7sHn2B+99crec2MJHoJl3p0zyqC+aRD7ED+LU9yvjBd41hij89tKsjdGy6t5+Lyug0/rnvzFs9tkX9jiQ+xa73FxabWI+wX2f67vrDTHPP7UElaXuhRbdh1wjGSse6eu5lskADt67VE2Ru/0UhGFZELpLXCKMwOyC2Plu7Hs6yAscWH/89iwsIjRs4QBkVJw9HaV6k0lED+S3klk65eDHWg8cwa4jcEHw6DCrD9jwenHh6qinnkXfXx0sFk7lU8Pts+MjP2Ngfq6PDfp14XP0cp2E0LG3IlbHwjaR6M0uGrUqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHNbe5LjwcsnxZGYzHa431uJiWb33kDZFR80EXu8kbs=;
 b=g3vJ6FtZpEadjQNm6onEpkcbhI4gKNVejiXu6IDU2YOKDj383y7u93rWB0ed7WG6eYJqvtW73/nD19xjXl2spxMju272kQL5IqzvIxAUwbJMRZc5xXT8EHbBKBzE4CUiZS74szZJUCkEES3gk++gy5yITslTAz8icJb2moBze9o0yBHpq+B2n97wIV4FBI1jVyDX/3+L6faNhzqyzz7OI3urAr1E0Sqva8fYl6GdU7aDxLp2sWRh0d2hSZjEAWlZAMOZ0FppWysJ+Tvdy3r+SI59ncC5lUF/sLWj16DugtSJC1+619quu898wYZ3+YrkzzYaHQVEON3QayjJgWryVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 5/7] libpcap: Fix CVE-2026-6554
Date: Mon, 21 Sep 2026 22:17:13 +0200
Message-ID: <20260921201715.79085-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0070.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 593e9226-83f6-4f05-6100-08df181d59a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|3023799007|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	yaoPwX/YMRqmOpo9gWMHhgphDQNxHYRikWMVjv9PyezA8ue34Ep+xS7SoD1r5Ye4Qctm0cVJvw8zDXPUHDFp0U1i5giiox/9fACjUzCAlA4FiwVymK9xofK48zeDWOWkVL/az/jUlJEHvJ0aq/j5lbi9d1OAH7eGXbUZuPzqBSMQHW6CN0oaOdRRpV00IwD+owTJukj6OUR+XQY+pA5pR69Z8VNBye9hMSpzfiZXlbY7K/UBW+VqxXW+g43EOhQQ7YPqX0E5lZOXzUTxK90A1Vujk/pTE3fvg6k2Lq/dns381qklBTNDf7VcQxrrigriqctYyH2ub1j78XQjtSi+wMxKbfTlBqFahw7myJawP6gve7oyy2qAEReWSRitIXEd/IM53PFusUhvIV9nAbNA5HnNgBu22qV9PzKA5JZSDDd7wQ1CDCfJ1KEYimV6w+LLp4I8rWiV4VZPlXobKdNqQygajVAR5JRAyZVD4SexAQOF0gGMMEUwL0ZtONHY8MOND8mTtIhPpKUhImFXQPojqCzY5ZZb3EiICV1fkj7HxgSHb2VGH42LA4bNxjMPSQW7FllpKpEl0sJLjCOs/gEabV6pF0xfpx9P5Kf+aD+4X7pqfn7wxI0KM6JZ1s/qRUOr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(3023799007)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WWbsXaDhBjWlCOF65k5gv8Ibui+U2pLLi1wYxTTpT3kWE9GB39DBsNukUlK3?=
 =?us-ascii?Q?687vb/yn4uOK7ep6dC1zjQm4URIixhplKZBfLjFO/xXJYlA3AqhUi3qRWNT9?=
 =?us-ascii?Q?PIfttKv8b3rxYwzQVkjEpMheANBY8mN+uIuQTt0fHLOW3MiSm+fRJwfvUOe/?=
 =?us-ascii?Q?He7rsBY3l9zqRTzTcy3UaX4E2zeauAV60YHwc0K8ahKyaiBF4Y0OEnKdz6VG?=
 =?us-ascii?Q?+K7PzQsXb0Q+d4VYB9NudwNjdIJxWgc5fmPQeMiwi/B2TXCWu07y8tLlUxaI?=
 =?us-ascii?Q?7nNazKWIji7BAGTV4tgPATi1WIBhtTZ5aUgypQKT0AxYqFmcehWXuC8MEp5f?=
 =?us-ascii?Q?r9uT29uLjS5qqADcZrBCFd1odjSYMmjQsXrux1OR0v+lL8uqQ2NSSlqgIFM8?=
 =?us-ascii?Q?ORM/J/M9dVw24hiXTjgPIHorbMnri/Jp3tFzWfSF7+J+Qqk+sJRi6x3B87NG?=
 =?us-ascii?Q?ZjDGKCP0zGXQJVmaIRc8uqlLxTF5Pv1iH9PZn2xZN7XfOyNjsu2XSBUrkCLK?=
 =?us-ascii?Q?73WmXmQT0I+pjeyb0ASBNnEUH/eDxzHLgAf4DV7R832BjklUv/ZkqHGYrU6G?=
 =?us-ascii?Q?dp0f0AZZDnrdeaj9LO2adzoo7WtpXWjK5JPZELGfAyacOWGKN1EGcnJQBJhZ?=
 =?us-ascii?Q?iqkLJSgEIaUm56MOOxHHXnlfvsGv7taKn4v4bR3GYZ5V3eJ0Nwh7TstMm4H6?=
 =?us-ascii?Q?8JVXDm71c5owXXmfMi0Kl6IMxrpdRu+nLhoHnAlNxBI4yjosfYZ5ThTavbw3?=
 =?us-ascii?Q?6CsyY1k8NVsh5LH8/YNgugEMXSk4RUYDG+bp7uigUV8F+z9Y7O1OseI47aSU?=
 =?us-ascii?Q?Q6jZ45x4BocDsyZLOHclEJAyObSRUE6GOL9F7b/tzBc4rRM3eqxh5l2mRS6c?=
 =?us-ascii?Q?JpP+cKNQFUojC0Jb4mZSdvYBp0EohpZQlkswQnfvcymBFUuKXo+9jBFH/hQ6?=
 =?us-ascii?Q?iOaXhnDeIhuhr6cGKa05PjWPONNza6t0hLa2iSHJRmj88fHXx/rwr2yWiR/q?=
 =?us-ascii?Q?AademqSZe8HqYqyAIz2FKyrzyP0OxbqjeykLLVkvSRfdD6nCiyqW2CBQHTs9?=
 =?us-ascii?Q?krOnLCfOYtGPB3dAEFXWtopoI38iara1aoCkYOkcp64vM5wr/oSN9UZhjA/h?=
 =?us-ascii?Q?SKEO4bd22xQEgOn6XbGbO4/JaW+i/jCWQaT1boDVEywW3MXRhFu2qGQ69T0P?=
 =?us-ascii?Q?WW/FOoIp1mfNryzL6Rgta1FtKHs7okegNREOyq2Uj/mQKyTRgtJMZlhGQFws?=
 =?us-ascii?Q?kmXL/ok19LjZlthKjbOVSpPk/2vBBCXc7rQfcf/BqN8ohDiLYMpCVcyy7Wbe?=
 =?us-ascii?Q?WGVw6HFGnhnacFGGQsO3sv7m9UkSWylp4xR08wdO1hYmJ6fYhty7gUJHA0MW?=
 =?us-ascii?Q?CZ6ncX9f4yTWd1t6efe/CcStG7TIY2HCMSuYHApgmvNXcyD5FdKx3prMrq3J?=
 =?us-ascii?Q?GtvX9E88VAIc5vd0gVGAw+BZYwzaOSLum0id9HIbtcAWy50QYDm7y5V7u5pK?=
 =?us-ascii?Q?XmK0TbJElwGG7J5hlL5H4RggGb5mCJA34cb134Gp6m2cQXIn+odIVyU47G5v?=
 =?us-ascii?Q?a46U2laXopDYln4b7Aaz8xP6MkYNGCYet4qy7SaaOYWHryK8tHZEayweB9mY?=
 =?us-ascii?Q?WpZatJdzqqqX6P1VHG0LywbV/EF//eYPI3vlXdAfSghelL7qUb7jCaZoz3DL?=
 =?us-ascii?Q?0n88Bqr0Y2Oj7jZkD8+AHOXC1gc8ZaHs6WlCcns73GI4D9yTbY0voJ2Sp//v?=
 =?us-ascii?Q?209VZYxdBg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 593e9226-83f6-4f05-6100-08df181d59a6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:24.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRZgnBCPI8HgVXjBsX21YeOmk/HTDZAG2oaWeWTjiyEr0iL9rNnS6Su5404wtU+B+jkW02WmBN72iNRZpFLP+uiBMsqy2QLmdhX3QBMsGp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246353

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83=
475ac303c6b681c52ad0b6e14795a8e0ce

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 92 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 0000000000..9c44294d1f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,92 @@
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
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
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

