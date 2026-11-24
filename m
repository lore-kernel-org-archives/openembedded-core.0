Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19055.1795531220705467117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 06:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ddsaouRd;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUv0htqAOCL/44Bz4AYgXuK5Mc4LTh54KiT+GrfzJaQJPds2lzH1919l6jwiZc+z6ziqsCD1zE4B68NU6enBwAR6695nLHfuOzp1DkH3SDVNkXkhDLjiLMqtSW+rzL4BtBu4OxWcWcVVsRfDOaR1SBkvoWrAMGTIDH/A9s1vAOmZoZLsbNjJ7GBkE3Ppi9ax0W8XyVVuza3DmXPs5RSf/xf4QkPa9qcwRFI5G3Xgbir/hWEyc0iDG8neQfC07d2aRaJSnF3ZWjmhoq7UeBaDcy7nE/NiWNGwhIJfpyoJAD9toQ+lEl90cj8XGZlGtKlMHBUnbWX6vL78GkjR33Tfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOv83LrhIxvnzD4v/D0ssqxlMiK7Ci3q+VfDa5ih+ZM=;
 b=jofw3KML4q0yJdaE7JCesGFsE4936R8Dd4ObKBOXZZnUtAemZgQPAbC+0b7MyXdA8+iUHVvWhhkXoQVG20zR4gtC3tvI3ouh1+oPECUh6csg637b5NYVO5+XDea4XB5ex8Bt84bCL+ZhDr6W6yqS/dJD4ymg5ymjhWodRAcZgsPLV7ZnkudnNGDwAKnHjIRm2RSrtgOmSCOHUOVU7P+ghnPC4rcXtwFFZk1X2cmcMvwwI0bLNNwshy/t6yeVc3TGhXSpHTgUItNpyFp1/dcd0oc3ck/UYHDhCdX7+Q3TEwxBuH6DJ/slCaCsZkuzJ83oVts4shkIhywmHVE3FR70yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOv83LrhIxvnzD4v/D0ssqxlMiK7Ci3q+VfDa5ih+ZM=;
 b=ddsaouRdEihoU7KOpwG+BHdJLslzCUwg0H8KL8XIK2cAxXh2xkYAgLOr7yR+Zbso3w/+9NH8v4+E6kQQS3+yW4M3XhqJaNNq3KeDYS3NCMiHMTCsf88bQRruEC+5f8FlW3F2Yj3GEavIpLSe2OGWAFOacMmQierCJoeml0kroOLWN4kh3V41ooMV9TrrBWi7HhA79QBxEdRcF4EF2i5yg6rMcYaagtpiPEuwxrTIyFI2VWCJScO+QhedWUZvL0POoKUBxWhmnpTeu+xE4WaDRpZncS4dsmx08fr6FrM44py5GbG04KcqbFfSa5fiTDOtr0K/3jj9Nye546fmLtJzQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3545.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:40:16 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:40:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [blacksail][PATCH 2/3] binutils: Patch for CVE-2026-90828
Date: Tue, 24 Nov 2026 15:40:09 +0100
Message-ID: <20261124144010.72865-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
References: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3545:EE_
X-MS-Office365-Filtering-Correlation-Id: 95aca37e-3d68-475f-bef8-08df4a38dac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|260925022911599003|11063799006|260925021911599003|261102123227099003|56012099006|261022075727099003|261022105027099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|260925021311599003|261028144727099003|261026140227099003|6133799003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: jk4vHoda6oer65Tqcg6ga4K0SadCCShAOb0TiK4grwqojxyCsAyhP/+hsibJLQUuArfEu3T2xXcrC30TEbqp6YchnOwIEOOeiKQGABkplYnHYd3vXc2LiI/HEIbE3ltTsj/vSTE+4PzCYdvUJ+/B66BcWn15uQsyzv/I+xzD90hrW96wWrVQ5GE+AfPaoKbdV4C/GN/Hw/IPmoPQRtjW0NChhhzhG8ZvPs0mzGiJ+dWjhj36x5eNDG2wSa6wQ11kECwG3CriQ8wLMLySdFYts0weM4UvCtPZbzn4AKupWJvpfDEC2Hxfds4PkKJIW3+1o8el32UYBDdp9oMCWN7UZoWQ0lgZuyjfo7EUVzB7JxUbcipZr8a5N3ZiwBTyjOjEdC9t1l5o5Tt9WgvggObAV1AntGs5da3bAJuvlsNFwlklRemVyl35DDCUNZ8bKPSmYc6kmD+BSX0AZUhLGMS6aL4EOszJTwrApS+AZdJsBiM0A7bb8veUXqXTANCoUXCHfFjXhnHufNc4Tql93U1eyjsZIBSOuF39d8zrtFaZzxNZoUXg0dRECOAu9b5OmFA+zCwyJ06UBdeJJoWYWKUiG2D56pUKrjhPJfryUsKuyDur+/bU8gF5X46ueRgk3n2W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(260925022911599003)(11063799006)(260925021911599003)(261102123227099003)(56012099006)(261022075727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(260925021311599003)(261028144727099003)(261026140227099003)(6133799003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ut4PM24QRiZVqG9TlhzlqhexiYnEbt13FH6w1X8SpFqzePYDBTVZusbT7YcZ?=
 =?us-ascii?Q?fmNsyGlGr+MXmPydLzbsH9q1tIfHRdjCTzKohdO7zCIdqOumkDkoHgMcqv0R?=
 =?us-ascii?Q?N3q9vetOUHE3EZqmyCwQuF9+SwM8LwsyNEwMaQEWlPDUVUhMNrpq5JVzekHG?=
 =?us-ascii?Q?7tqW8Z8KCJ7DRCKQMBOktPu2WKkisKcBMqsm8tYLEBEInyph2CmzCQOfj/2O?=
 =?us-ascii?Q?VAUFSBKM1MY0Dg71+WTafHnBf36T1EEreO0N7VooqnzLWfiDs3iNeIgNyiSg?=
 =?us-ascii?Q?1MnCl+0v2KJyzg1yBSY2mMFX0UeshHCip6bsZKh43IY2ARGrktgcABRC9ZHM?=
 =?us-ascii?Q?AhQXoXbbiaAYcL14XfE8H7wJgxtwkNfOSYnSV3O/Au3OsoQpPq38tqq9h3fH?=
 =?us-ascii?Q?wQmbpbFysPXqqGiqdHbH6KyvIKvgW4k7GT4tjIeMc0XzP6ogsWOjdBM3cN1l?=
 =?us-ascii?Q?EwcyBs9OMQza2YRhlSI9wXun0I2q7G/+lIxAQBv5CPRHvf7ctzdXf1AspGIX?=
 =?us-ascii?Q?nO+n7Q9zbDmFztRyoz4jMjqlJTntWuCb0El9OBSSyqSZpwM8k+3XxhMZpbIy?=
 =?us-ascii?Q?5eiL86Q46Xx8M0Lw/8ivHICrg4/u2nLHQ43xXGd0I0dj3IJq4UuLXnEYp9r0?=
 =?us-ascii?Q?Ty9XXjtjP9h8jQv02ZNduld4/TfJ6nfN6Oug4qcVxt13DUVEjfV+cy3AaZSG?=
 =?us-ascii?Q?4Od3ktEAlKYHp0WE0Hx9dlv26gaaoGqYXnGCfSAwUMhtKIr77rApD6Ag/4kG?=
 =?us-ascii?Q?IF1L2WavErLbNWb7eiQIYA5Hhj4VCOMyqSr0WMULkewx7c3ZcdBB6BcfUmC4?=
 =?us-ascii?Q?+RZ6EhXoWhjbPFWD4sgesLWDlZtG69yqa08IglVoZgERUcar2NnRV0P5grli?=
 =?us-ascii?Q?1nQNp2PZnnGmpuQHmUSA4tP9VAUUmXbgCquDcwEkEcLSmmd1X8eHH7hgCmB+?=
 =?us-ascii?Q?/IkLipLFRAL0vGPYaHbYX29wei58CpNAU7yBs6q3am2DmMQ6PKiaekM7f65i?=
 =?us-ascii?Q?gUmH06SvKMa9VqN9hss7G3VRM6q/I3+EtL3nsIgUXkGxji4PsNSQhEoIlk0V?=
 =?us-ascii?Q?RH5i2iMEuvpwE9lwjgX+eLANFYqhk86UnbAgFI2GW6gDY/45StwLhdKlw3vH?=
 =?us-ascii?Q?f2+CTq1DuxqtD/D0HJ59IHNQiMlr774+uS2P6SG77gADXDR65ITQeYvqQnAR?=
 =?us-ascii?Q?RnkvyoRRBFG+6fOwHb93pVBDSoqTeM/J4JDJ+Bz8/KJoHp+7u8EQPy+F95s2?=
 =?us-ascii?Q?GbPgs5JRdQSrjDpqDW1O5Cn8f8qII+g6bqw9Rz97yY3tjPFfKonlj8I5TIx4?=
 =?us-ascii?Q?jyhL/wkyqPHzzVRYk/kCpSMx+zJXBQEYPRz52SPH3EDVvCTM+qNmhRrLjXAx?=
 =?us-ascii?Q?PvR8PppkRNg540OE7nL4T01AhrQKgU2iGxTLR3qtxoR7R3Nn4973UBo2nfu9?=
 =?us-ascii?Q?ENetPes0eXp5C61YjBJZfm9tyeOdGoG6nDeM+XBFnRlBRDfwMDWVsVtFaJuu?=
 =?us-ascii?Q?xAq28+zBx6/U4FzNJxAUrsi9LMrR83O7DuXeFH3ctI2P2uX4/1mMqgKSLIoM?=
 =?us-ascii?Q?ksJN/xz05QJJN/5DAO65Xt4Fx/guzigUuhOuc/dtL5xg5XFtBCGX3sLZxj7d?=
 =?us-ascii?Q?1d+AcsfUrqSZDtqeg2LCOLlXY9xO+tPg6ts/z0+pq/AMc4tLgVxYDUAnRVoS?=
 =?us-ascii?Q?QspE9jpBrzLtJboj8CYfSF0kHYdhRRzUhqJwTfLeHQt1oNg934Tc9Jz1XUyw?=
 =?us-ascii?Q?6+YfOnM5bw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 95aca37e-3d68-475f-bef8-08df4a38dac0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:40:16.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5ujCmJ7CUoFgOxFN+AZyQNgTOZbcur1IeJE8pDgE9hEtTCwWwZKHKNu98R5g7em0AeW7xY5N68YYiGUuPxXRUsJJS9owhzSnzZ8yf+iKc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251039
Content-Type: text/plain; charset="utf-8"

backport [3] fix mentioned in [2] for CVE [1]

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-90828
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34450
[3] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D123e4a5e=
ab2db300b44288dcc1a29c903f9622f9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 057105d757e2079c7bc602c113f15d0b396f764b)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.47.inc                |  1 +
 .../binutils/binutils/CVE-2026-90828.patch    | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipe=
s-devtools/binutils/binutils-2.47.inc
index 5b57380a48..2807ab84e8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -39,4 +39,5 @@ SRC_URI =3D "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://CVE-2026-91781.patch \
+     file://CVE-2026-90828.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
new file mode 100644
index 0000000000..a84e1fb847
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
@@ -0,0 +1,29 @@
+From a8d25ed8b1ac9d8e47fcce90cb901bacf863074c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 22 Sep 2026 21:27:03 +0930
+Subject: [PATCH] PR 34450 SEGV in elf_orphan_compatible
+
+Don't trust that SHF_LINK_ORDER set means linked_to is non-NULL.
+
+	* ldelf.c (elf_orphan_compatible): Sanity check linked_to before
+	dereferencing.
+
+CVE: CVE-2026-90828
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D123e4a5eab2db300b44288dcc1a29c903f9622f9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldelf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index 3d36e033b0c..50eb8d18799 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -2087,6 +2087,7 @@ elf_orphan_compatible (asection *in, asection *out)
+ 	  || ((elf_section_flags (in) & SHF_LINK_ORDER) !=3D 0
+ 	      && (elf_section_flags (out) & SHF_LINK_ORDER) !=3D 0
+ 	      && elf_linked_to_section (in) !=3D NULL
++	      && elf_linked_to_section (out) !=3D NULL
+ 	      && (elf_linked_to_section (in)->output_section
+ 		  !=3D elf_linked_to_section (out)->output_section))
+ 	  || ((elf_section_flags (out) ^ elf_section_flags (in))
