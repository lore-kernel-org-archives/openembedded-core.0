Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93384CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:33:55 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15206.1791988427582314280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dddMYrK4;
 spf=pass (domain: est.tech, ip: 40.107.130.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StvIncCmExsY8Hu4MH2QC3qeYT9xExZQ+IXWQI7Zsvkmchs+V4XIYR71xydPohLcR8ax3cw2pW7FrjuSXZZzvu4rUhi7HR1nDLCHADam6oxMCsCHeOBYxYq+5npsTu9dxx/GhgyhqEAjGcjIUYd+1IfU9LUTeM0+PwUhmIcduum6Fvv1ll2lJVPd8nb0CIOJapgGEc8jVA0MZ5uLso6hv/bw3WbfGLQkyMh+ze0VxIhQXbXvzL9KZ0/UV7evx4dMkAL+WBhK0u87ggn0yVc1oGsDGdRaJKOUfJ5T2g97KXJeA+wO0sm4bwwFYMAEr0iKLOSFXELBk2CcKRepmUloXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgt16AUjbcgDnzDRzB8XHQ62KaxkiO2TMQRLb1suBos=;
 b=lPNTBI5Fno9MnTUWQ/A8hPFoTZpv1umsCzo4CJ3rquKVZcgmZ1/Sg7V1f3c8DRCG1KYNLRBzwIlYnmOw5p28ON2eQO6YobkBTH+Tt8mcQ0ky7gkHw0eaxZk++6VuONHHp+609IiJghRjWAUYpbxNd5G805Ec2HqUT2Ge9XhjWWiBUKwGYRO/rTY2q0H/UBTwe0M/7658CSo6/peGGHyVY/BlrFblH9OzZX2B6X7p6I99BCwKPSSmYrhNUccOueDvRvlNu/qklebyoWODAaxeja/ctKTk03TPnsgQgI86S6xDruGJe1plUiVKOl4N49UActUE8obf5I50vdxFxk+hBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgt16AUjbcgDnzDRzB8XHQ62KaxkiO2TMQRLb1suBos=;
 b=dddMYrK4m2DgNO/TdQiWRYkBtw0QsAzeyAnrV7hV+0qmKb84+iuD5jijo1mlTH6DC/9SP4Ey7ylQbvUw2RTgi3GkVoqNA6lsA4YUt6mezdenqxCA7/Kz7txy8VSSE5y6yWsRMj38x2tYmlJ7BmnAXfuN8pKUXD1cHdrfGaLLfShVHNIP2h/wr8z6hS9jMwpWiVZ61tDdB2hJ8dL6+Ph0g7k9la82NmsgtGlVH0UNnvQ7681B+0xwZSw/AIIhRzrB5uG2WtahCE7Io0lx9GY7+DqhkVOntajHtlcqh+b5YMqJuaxGLpX93sVPA7gHuhJlEDA5o+97aydBmYRL2ma1xQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFE8B517AAA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ae8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:33:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:33:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/7] libpcap: Fix CVE-2026-31911
Date: Wed, 14 Oct 2026 16:33:35 +0200
Message-ID: <20261014143339.73692-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143339.73692-1-jaipaul.cheernam@est.tech>
References: <20261014143339.73692-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFE8B517AAA:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c9e911-5eb2-4d03-8c24-08df2a0026c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|18002099003|22082099003|260925022911599003|260925021911599003|260925021311599003|10067099003|3023799007|13003099007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gajkVCdJAZ4INJJEOpPvJSUpsSxqB/CQV2PELIHgcwyh3L/laLpn6pTBx+8gE+DyP8cbVHfmfPj1/wLW89G4EpQA4Uy6+H86Moi4Fq/zSe8ku8TqOphOBWrIhvCKzN1WiEqFdxj2ff3rGGqOG+oBDzSSOm6qNbrKeLe2fiog086wE/5eqdOX1bdznMUTSsiQOYCAOkny3HBtbG8XOzhcvwXq6GNUj99cXpfgby/25/1/HsA2sXb3xNaKm/43obkQZHuleNJ/Xw+lUXXf1d99X9LwEGODo/ZQsZ1AQrneQTlpar/2RWEv6UTh93Gb2NdS6g0e3wf+zkwWt539rwSYQW3Pb9tIWqULANboVd7SquVxN4vWLU9THm2jP8cYe9YP1QQRGLOSTuFWLIef+gS9VD06qcDw0bWXXtPB//8ZsPUUEB5uHy5G5oDPMK1tf7lNBhPmmQlPzeBLm3mGCOLuZCIfVOfapDEq3KvpIUTsoPKZW758r+wKL1S1+mGmd9sq8kuFYfMZwAgNKEJpWWzPlkfSlRbzBzByn1GIkY6pGiosA8jXcFPjCo+xkbkHFdZfUU+pMYUcNRzy99KotRMBlK7qXR0T7LSKuZqBbY8Ztfs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(3023799007)(13003099007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g06BAwfUVPekSM0CeM3K6kcBAOWcHy9MR0hYJFtmZ88KWL1qW4EUYDJBoyiB?=
 =?us-ascii?Q?KksK0tAU9nhrt6T6demECzEMJ+967Sig8E+2rNlZu49m6B7HI9vZ9f3BQg9X?=
 =?us-ascii?Q?hWuwBtcd48YrGy/j3aJNMyo3BlArVHBmfc4H0klOqezttC6IHqzH7U7ci5os?=
 =?us-ascii?Q?SVANY52G3eRgwy7YkOsUoHOV5S5B8HmRwzfnKxC6Tuu6R+5xaYAsSwlFPMBJ?=
 =?us-ascii?Q?6RkQp9y6iyVpipTYvJi7N2fpN9pfapjgh84tRNWUXEpOWjRrUH4O+qt7eFeQ?=
 =?us-ascii?Q?RR7KXubFlSxhHv+2ypT1bMUWDHmMZVZ4CQU4l912NUH74Gen6f1yokPxvrlT?=
 =?us-ascii?Q?14XDREJpwWI05nslwWBU6qkTZ09gKk5xE93HRFi7sCDFZDHkrQVW1XppIh1I?=
 =?us-ascii?Q?rD3gGIelCoSS4St3j8whACEWjML5U7YHrHotAOOrHLLnj+K41vUZ/Ddiff3Q?=
 =?us-ascii?Q?TCLnTAX24yq5Q/vMBPES9gmJ4Pjtfo8+4R6o+nbhqa9ysqzig4ROzxhvW2VX?=
 =?us-ascii?Q?MC6bLq5j+OO/Xet2NBFS4f/XRyx3U0gEb0huHpaah/PyiVQp3b73HBWAubD0?=
 =?us-ascii?Q?mOZZRdv4cwC6pn/t5FOkWAuk92B+MfvgbmLa6RGf6uB6kfl5Ffae/nkhhELC?=
 =?us-ascii?Q?WPcYE/YkEBus/JcA/82spFBPrfINAMOTq2L+H/d2WT3JaCwh1c+QFzHFbE80?=
 =?us-ascii?Q?tQNn5WFsOygvM4my/moicd2hH/+tAUZuQEW7vlxQqRXWzmb+xvWMxADGmjrR?=
 =?us-ascii?Q?RTrsnGeGcpHHV0lhfEihOVxSNLUkGaGoHXHLAOvmuck4Utu0yRdeJDMzRnHq?=
 =?us-ascii?Q?GyNJjngFnBjrc8Es7sxRxhelqkzGlCwR1PzeWK/xRv6AGZlV991qof/LTzNF?=
 =?us-ascii?Q?ONZEVBB8ug7szmer227Opud/vwvt2kkV5E/OVM4YmEV9xrd5cRETEr1JIAmT?=
 =?us-ascii?Q?binhfmCe0QDOTxhICe7MfABPTnVqenTi08GtJ/ytiywEwFu3vhwZmCDKcGUt?=
 =?us-ascii?Q?MwmcDOXS38KrlLYW44lAmg7mm0YJrm4mpqCbVTQA6H5q6DUFzhPqatZpFS+c?=
 =?us-ascii?Q?5FQGeqX19wpLV+2pmmYsW9Rd0r9aJou8uFfmukCt9ZdOxbTTfvU7Q8UM9Acr?=
 =?us-ascii?Q?OBWnfVRtew2Fw0ZxCpZ5RbKkkZaj6l2/tswP9zZh+nRgQvCchu1wYX2zuEVw?=
 =?us-ascii?Q?7LGLnpw3sE8e+m4T/WNqRP1Qg25onCPTY4cw95hXXzn6M9z8gj+sI13vFqfz?=
 =?us-ascii?Q?uxfnMY+vI75FungmLG7Hsj5hxuJkCsMmz40VEFD7X8AhByiQ7g5AZEee045i?=
 =?us-ascii?Q?gf2QyY3v2Lk/sVF6vbgbxVAgj4LBOQgjqbkvhY1tfoBTFcHvk6TYWbrEwGfy?=
 =?us-ascii?Q?XODqrTKaMGXJtOSI9mSTxHkfhlz2oU24CbbJtvkdvoNA3iwqGiSC7XGW/7if?=
 =?us-ascii?Q?UfX4DZBvR8aqfPoasGbxXG8Y5Cnt98sDmZRAjRrmBtJ9B52GMD7QIqop/ohq?=
 =?us-ascii?Q?Z4TBXv5XLr79VTO4zAnBtSPJl1ks3NM7sg2FnzKgKLGXO2ATiAf2QD9sJAW4?=
 =?us-ascii?Q?vDPaxxDqb9Hq2vQZdCT3uHZ2Hls8xFOBx/YiDyecL/M3V4z27RdF2sd9Uw7Y?=
 =?us-ascii?Q?GphVlEQYojY8vi/zSfsr6qQPE0kZTVIA/uebFEt7+XhC06Dd3II8ybPUbMUC?=
 =?us-ascii?Q?TDvYXwSU0u18dg8UzcPHI5eazDotAiCVCbHVL2YoDNKDiU4+9q7SkgN9Iidn?=
 =?us-ascii?Q?F5moayPuqg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c9e911-5eb2-4d03-8c24-08df2a0026c6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:33:45.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqNyYcUg/rD0iw//9JcjkXDi1JkDYWLFWL14SPevIzVe1GLMIBvfdjSDMAMadtduCxR0hLQYUZbUP6BJYJYLTPg/bujund6ypPIgpBO1tRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFE8B517AAA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247765

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31911
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/a715bc=
dde830299cba4171514385cb17ec19b6e9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/03-CVE-2026-31911.patch   | 47 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
new file mode 100644
index 0000000000..fc35ada86a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
@@ -0,0 +1,47 @@
+From a715bcdde830299cba4171514385cb17ec19b6e9 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:08 +0100
+Subject: [PATCH] CVE-2026-31911: Fail opcodes safely in the BPF interprete=
r.
+
+This vulnerability has been discovered by FuzzAnything Organization.
+
+The current revision of pcapint_filter_with_aux_data() calls abort() if
+the current instruction opcode is invalid, and assumes this never to be
+the case.  This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+Furthermore, this does not necessarily hold for programs that have been
+validated by libpcap because the current revision of the validator has
+gaps in the checks and accepts a number of invalid opcodes (another
+commit addresses that).
+
+Thus in pcapint_filter_with_aux_data(), when the instruction opcode is
+invalid, just reject the packet.
+
+(backported from commit 4ccb54bf4946d31a248ec93bdbeaabd97fb9d8f7)
+
+(cherry picked from commit a715bcdde830299cba4171514385cb17ec19b6e9)
+
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/a715bcdde830299cba4171514385cb17ec19b6e9]
+CVE: CVE-2026-31911
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 2ea11d46..d6e4b019 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -146,7 +146,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, c=
onst u_int proglen,
+ 		switch (pc->code) {
+=20
+ 		default:
+-			abort();
++			return 0;
+ 		case BPF_RET|BPF_K:
+ 			return (u_int)pc->k;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 323cca3d98..5b97c14e85 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://CVE-2025-11964.patch \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
+           file://03-CVE-2026-31911.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

