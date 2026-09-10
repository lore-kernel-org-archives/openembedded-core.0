Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D74C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KKQSNLTa;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1lAGYU54GMWVNZhe5SVC0aB1oKLq5+z5k1l5Jp6bz3N0IHE2NL4MhhIUn9iYDjjPj4al8jJHV5v2+AR5oOy4xnuGtdB3SbIyt4gejIt3HFbe4Pzq4DW2Kug7mY8FHcDrFjP8KqdcEWFfcDUO/bH8xmf+U8FaVj9l2hiKUwf7vA4K92NxMeFALMLoEAfqzjwwsd3kIMMzO5nhQPWkjFmaGfpQd1eAlE1/bxR8efn7DgbUS0mUEO/qtGNph4XrBPwoKFPtZ6kH0wNVlGzU8O6AUUALfkDdQJu8ec2fzUodN4RfKtEEH85YvWhiSjll386XVa3f0b+/baO1dmYMzLkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1G5IYoJYtWmj/7u8jXjX9QBzitgPk2LvahOvauixL0=;
 b=GKa52BSfKF7a0Xt6FZLbyREfJfyQZzs5M0na7LYwfJvMBQrLVsul6h1hMiW06iyki2aPYJTJ8JLztBnIdkQSFNX3Z56CQ3dra2vv4B74ztK9he5IL7uYIGv+G7QYnhCyBQpC9wYEnR4ZTc+tWU1Omz2VA8a4tIvTnAhV1OUyq1TxSV2Jl1NGqCP+USCuLSRU4u470BlgQSSAOE0+HIUOo6yTNjpScUoNJnsJYOsjI9bJJmmmjtmNTVUof3bO4+wuBW6PAroyg+6wD60vYSt7m2pq+HKj9lAFtNQKvo3/h80XUZojay6VJNyfM7nP7VAqZCwdu2O9Ed2CjrbdKxdXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1G5IYoJYtWmj/7u8jXjX9QBzitgPk2LvahOvauixL0=;
 b=KKQSNLTaLXZkt5EI1MKoUApDtINvzatKE9gokIu2xiMI44DxSc8KGNbcosbXOS5uKsOv50NineZAibwUFec0zVI+PLCLz5f5BUxi77h/48HSU6WmgIAkMD5Q1kuW1T9cydVIizJyUubygjigbTrgwiJc7TCWKbGAoJhSU1t5IaUWvZ26EbQ+qDDYdwrtYJ9dJRQLzXifjtFMyMQoE6UEJg/K3Ny3n2CpwjBLYXQQI5/S165I/oR9vvYwyDOP4dlYU/GEf+BDXyw8NcvaQuE9nUzFLFTqidGea5KhIA/jUTvyW7HwVjzdee81a413bFVceySd1+hAAA1sRmVExjJKOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:11:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:11:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 4/7] libpcap: Fix CVE-2026-6244
Date: Thu, 10 Sep 2026 07:11:51 +0200
Message-ID: <20260910051154.30595-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6151bc-5524-4a2f-7051-08df0efa0ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	KuPJULer9EVblmTEs/RENNeL9cLvTR+VtoqIi59C0EIYLoobwkT0vDodZThZgJcc7BZu3UVEBby1Z1mGfn28YpemZPdvjcU40ujaKu8r7h19EmuSN4SBOMWLTV9UmqvgC73ScsyXnUXboG1/8YJJKtcuTkctyoe/5tBOKIKne6tiUxje7DiOjKJgv4Z5QfnyCw99uIQ594jznFy0jAI5a5kM5V8F56cD/0bDawwrn339B/qLxk6LGn76BysZXB2hLhnBPRVXBoH7adRk8YdGbh1NzsYRE6lzw/4t/QoSgpjZgBxaxeExUPr90mTrcB3/9bkeY60u7LuHL7R/UsCxr8PeSaF2C3PTCRq2C5os97+iGIM7Xwekz4FOtJhBYKqENMDNDS2lKdXYpMqwQzOWd9KkJ/PymQZKO+Q3qADSrNYaFDXiJuNw++gYuW7YUc8DY3EsmRPMjDPG0/aNPB/b+LWjq4bcTtqp5oVqDdO7gfFMrQ/xv4dRShZ9gX1+X1u7oQ0S60bUFHp1oJN0i+WqLJJkBqaDIZkRqoDSXdwRu9RDjRF7ioAnmWvcwzgnFuAJAQIAp+emiexIsiOxxG5ECGcodhq7nVptqzaH01YfFc2+9IBZ44T/ItdrQHIaBh6T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XVzD0vQZViRPKeko+aZb8aJ+Zl0t3LiQ1Cf+ha5zrLvN4qLxi8FUwaUGbLcI?=
 =?us-ascii?Q?JAD5Tlq6HX3aW9YooNrLSJlZqKA2wSyg5uzIgbuUsuzJmXa0vlU2E+V8M63/?=
 =?us-ascii?Q?WrQkxy1J9aU7AjSrVF5heY6HZqnh2/T3WLyf0xTWLu0asUtR3aMZIshbnz2r?=
 =?us-ascii?Q?OjBuBYtKunpeoohGZ/aZlM0WI4zM4ICsviAWw7ljH2fhMs0yua7L/5VIFD0g?=
 =?us-ascii?Q?fRdEhnd7C+ACdndrAqGQA3ltEaWQuF/R8BeWDXumT145s7xvxBAozyDTQoDa?=
 =?us-ascii?Q?beEF2UEImLVBvieDqBVDeePlLy1naHuKbV2eshzO6cJXvSDKU443Bk8/sqgn?=
 =?us-ascii?Q?+ZoimGTwzBWOnbErZl1ouAoEmNocgXHsNDj0DPGbbQiJp9wLbV/MlJKwr3EE?=
 =?us-ascii?Q?e6vTcnBNI3C8akIBK514wCXLr6AFFLwqwVurVs17U4wbOEoukTzWtXFKqQKB?=
 =?us-ascii?Q?IhXmI2grUKvISIbQOj60bNlNr5OOAoegVMCS5g2fIZts1ClV2I5f2zfU/4ki?=
 =?us-ascii?Q?HBH1z0x7+XldGRl0nVm4C4O8RPYJVZ+dHwMCplvebocUeExWsUtEYjM85pQx?=
 =?us-ascii?Q?o+ATuJRZtEkEaub3Bie2GpIl4UK3JxdANa7rb92QteR+c0a0quMCnBNUbLwo?=
 =?us-ascii?Q?c32MDiWsfYXObG/bsUIIksdIyExbuTqpsxZxs2VYCckEOMeZ5qZUXnz7gOYI?=
 =?us-ascii?Q?OZXdxRyNt7zftWiM+tezgHbGhYqV+olQpgYfqvGq63H8chanpY28XCwCT3K7?=
 =?us-ascii?Q?SZ7JhqiP2prTgZId2LOMny9qjBRUgpPtJHxoorTakVAodU3U4hsPPuU4BE5n?=
 =?us-ascii?Q?GXmW6zSxTLOsuJni4TMI6jYTGUuFhhrLsKb80WdzO02QVQPRJtzgZoCD65DC?=
 =?us-ascii?Q?336cvEWsnTkACstxQ+4nhD6EUuD4apbhWupcu8PaCcNvBeW0mJ1M+LCrNi6R?=
 =?us-ascii?Q?Wb44qy6h6cNjgC2oOm4wkO+Ix0RjQNItB+wwmZZAzEmTuLmwStka/a+RWFZM?=
 =?us-ascii?Q?+uUk6VxtAaS0rrJsvkQm9Z5+sQk0sUb4+zqoUz1hwDqLbm35tk1AA8ITHPbL?=
 =?us-ascii?Q?B05cqlQ8AQ91A2h7Jv6sq3qrq9THV8lt2VEzv7TfJJmwMoTwn29Wz4wDhoLV?=
 =?us-ascii?Q?9xX4IYcCm6vzYMsJqHaX+oAJB6ysZQMbR3L9e35ItO/xEurR+a7HQk7hdi+E?=
 =?us-ascii?Q?TiHwbIlmr6AEE8Wxj/VD3TDRKPvh/Xd+8Ufmr1XCFr9XlBJY0sKkdBj3+MQy?=
 =?us-ascii?Q?8zqLz1pWaECRPnZK6ecHpzVncWoxQPeWHSjGMXfmQJQv4arNdvXsIQj5p1PY?=
 =?us-ascii?Q?tBRqTom98mB65GxyHkXcSJkmeQme8TRl5Cx+nsgWqOhu1RlNYqFlBVsT+g/s?=
 =?us-ascii?Q?KRNTtRWCLQNeDFbZ90FPs6xt/CB9eQ+UMULQeYIYn+R7hoToYuXlv3H1N6kf?=
 =?us-ascii?Q?RrdFJLsUfwBhEf8Zs+gpibMLhED0vd04BheZZXEC1702vp9IEYz2nZIY64uO?=
 =?us-ascii?Q?f/pgV+G3GigOVDJ0y7ij25n05RmNQxdcYDS3s8Xon37d/qmaes2cwS36wlSR?=
 =?us-ascii?Q?f0g0TjefksFrObhkmDsyznRhkWuj4qQM4GlcbbrCsvrivD/GdTO6ffT9ODkD?=
 =?us-ascii?Q?lHqjsfmc+rJTY6bvThBv6qxiYkZM0XT+rq+7tKjk14pQFpterUc/rN8Y939c?=
 =?us-ascii?Q?QJpmqU5Sdk7I12kgIi6BRLPdAHYouYtkzQV1nSBTht8WQQ1OvOojtKnjDmDC?=
 =?us-ascii?Q?bngOMdUXbnRavT9Ck0DlZecBeA4OhqLZSLebGPQNGttSmCheRIPn3j6dj4vt?=
X-MS-Exchange-AntiSpam-MessageData-1: mrZz2WPVgMzLoGePEds3gE/0f5MbZvdvDSM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6151bc-5524-4a2f-7051-08df0efa0ad5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:11:59.7123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb7kIWpY+u4N2LXvsb3puaNbs5gcljxHC8gobXGBsd7gb4nWV4w9GcIoWZ+HiJ0F13ncV7WGUnBaMuT6i/gKpFgNYV9tsUibbvzBToPwqWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245527

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb92=
1b141aa642faedbf2ac510541c76499a19
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 62 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 0000000000..0ef98e4580
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,62 @@
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/98bb921b141aa642faedbf2ac510541c76499a19]
+CVE: CVE-2026-6244
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES                  | 1 +
+ bpf_filter.c | 4 ++++
+ 2 files changed, 5 insertions(+)
+diff --git a/CHANGES b/CHANGES
+index f0b5974..35121e7 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -3,6 +3,7 @@
+     CVE-2026-0799: Access M[] safely in the BPF interpreter.
+     CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
+     CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
++    CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
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

