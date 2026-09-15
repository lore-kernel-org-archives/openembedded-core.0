Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B80C982C9
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5557.1789501526272473796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zzzdbk81;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnNYjnKcuUjKHR/dzfyIv7D/vCZQIiVAPInLOUJXur55wks8Szfh579goJK6EvKqREpvjUFAPaCWU6iN1eEuu1TOUOh82/3DxJmsp7b4hwS40KKDSBqCEEUzjktAvlI3gGg9anhdNXe15mAtVJIVBbXP0PQTqRCn+G0qj0UgeDPnWxcQHHB961F3ktfkB2yv0JQdbRc24gowCH5uG1Pip2qSvqbt7vKz58ey7kAkMxeH1oCUlF5/+wrrZfUzB1Ypt8cdyo0AG6H1ViJKgtsxPCVNbBD5TwmrosEVGEUcOn+V71/YofklObImiQ/ry1RxQUL5TvlhjI1L7f7nTBAk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOmfwa1dMyiH0eZaSkczzfyle9EdcWJL1GDJkXmN368=;
 b=ATJ3rhwLyBe0WhBR72GGFPq5nnn1I0MVmldCTpGuEnqge05GZBNYZrDTSll2XWJTrgBnCEp6Wbgm82USm+m/n7A+mhWOORqDvojv6sDSpwZ0HAg2UnmjGN1l7nNAOHEXy4/Xi8Mnzq5j/HbKqfsY00JKHQyrWL8TxrOYm3r2UoiCeqEc268ZIXPaI6lE50etCwiONZ7CMtpxe5p5G1SetYSBDvkLqJoR+IUIvNPFjFPqDOWINrgzDQdUT5uMMr+GlSxXuqnx8CybB9qToVBY0OrEuIppGBqshdTsFzMvIw2ElCK1oU03cxWIbaGqF4vB7m4ymmAnbtJ5B69NM6PYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOmfwa1dMyiH0eZaSkczzfyle9EdcWJL1GDJkXmN368=;
 b=zzzdbk81aJR/o9UiN648ZFlWR2hv/2o382LYtfm3Bzgh10hketGHoVohNdHi8RnxDwqa93ArOgfntF7mTvL73Ino19yplMoI9WOlNnJqaKKIgOc/5K612inCZCax30iC2UwZx12Zsu0i64pb25E6NX47f/t6tvf+9xnF6z0RJs2hMOIHVIEdGseOfzWgPiqtP00IjWkYE8Um+PFMaGtNWwLtvDHoMCmIIyL8WGYsgybCa2K0symdKu0rSz+GRmAmaBdF18el4mZlV6tStzIrWLgogxphAJGAAtQ9IJirvdpynYeVJyIUeoTsNtz8tKdrOOmaCEDPG0hUwfv6geC+hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 4/7] libpcap: Fix CVE-2026-6244
Date: Tue, 15 Sep 2026 21:45:17 +0200
Message-ID: <20260915194520.45847-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 11885ddd-16c0-41d0-ccc0-08df1361e46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lbjwehOtXj0t4wW7rAICvM3v3Chki2kUWg6TpzV3WwTHwDygrWNR8w0zMUIClKRX2MStZCNnTkEdtUAkQF46qKb2Jom0QXqi2kp+3oB4tONrkeF/hz78C7RdUqofjeFGxPj6dPJS/xzzR85PIiFzamjWtXmjddT75RmMD4f9b9IdwiUE3zBxQ0rZ+ozw0EiMqyi4F90QDiFJ/YKZKYTCKthwveAZJkHtaKgPHeg9Jw2XK8Y/AbzgW92K1zUkz109EWwmQpviM2Hv0s3H6c+YkRQ9+iK64+8lx0JuLA0kC/Fpi16+s4QKGHLP/Vf/fhvwNmLOGctlrhJ9QRXwey7Dh6iEvN1723UYhlR3333F+0DmANAAmf9aFHxodxYjgz6kvJ/JtrD6AHrjlcci11ofZpCk5Fi/QrFOzNesyYJRsxjhkRGqAa6MLO7W7KcqhT6qt4GQ1X7nhJziNhkejtQcVDdj5rJ/yUiPQ+mMCe+fB9r+0nWdFYnOxgeuSGNnmaVbOtkuLeEDaNbaJkq3kZqqQUf+FfNV5Kx52voMMLHVe2Y5YCaTQebgyvXdgCl4peOd1m/we1ttoGW3n/ucEdBP1oLTQIAU7ca1DGWt7jlm0V2GL5jl0NVD0s9cKWHDLFio
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NeDiPoooAzaO1B9u7fIEut1BSHrSfFmEP6qpXH6pbV8/1BtWsbh90f4Ev2og?=
 =?us-ascii?Q?dE8VxH3vJ8gNNUykAxPyn41rGM/7vyTR1vt4d5vK+fIQ2LC+eHZ1OAqxuXy1?=
 =?us-ascii?Q?UHzyqgK8vpnGVHk2KH7xilyr1r/BftNoP3CVQAiPUyeTDwRQcSRF9dzRoO8f?=
 =?us-ascii?Q?YSfPxAeN64hNxOHJMqXTIVv8gU9Xx4SBewYvlWlpB8jn276Q/YKjmJe1VQjO?=
 =?us-ascii?Q?jFlx3VPdrKhXe252QMLA7YRH6XLSlWZ57csqOv2V3XT4XnqmD95E57JglquL?=
 =?us-ascii?Q?XDU4mc3Gu+9ey1zVhnLHZ631urd1nU5aLWWwBxURh+p2sl2FyfnJ8C/e2LrR?=
 =?us-ascii?Q?jzhyF8nobtXCRrwySdnAdsmyBy7qslwPniMFEl2wZJLMKiZr3IA07wcrHQZ0?=
 =?us-ascii?Q?cWB4EIQ1scceQUti54zuTZp7OAN5sxnCzTGqmUwY6AKSYVdgEoGtGV5JEUKw?=
 =?us-ascii?Q?5LUwF5/NtMSyGWhs//sGY7SROOb9xUtgW3Ms0xF5hPR0R4cbMPq9jht/nvtT?=
 =?us-ascii?Q?wdjr9D1u1omc9hwJSblVmBwSg+QhWC4dRr7vSBMSByY0X+4VCXFxGfs39JNF?=
 =?us-ascii?Q?duY7hSIgurV9lGTW2H/3tyy7XmKxv0yoq6Mzt50D1ekPMKAfEkdhhLS7QUeJ?=
 =?us-ascii?Q?ZFw8QulMqbYK23eVnFa9ZK2qU/nE0lbimhljPBjYzoECCSNXs7/SsFKWvYeo?=
 =?us-ascii?Q?DPVz9c0uOK28bKP3G+edFbc6wUessaIpt+u1ychJAsR4rdFnKRrY703OsKcF?=
 =?us-ascii?Q?w7sfjUwqGoY5RcxgrAc+ZfYY0sf7vkCGAfP15MaXoWEawzh3PyWELQmoi1p7?=
 =?us-ascii?Q?8vFUcwohrmd+9P/0ReHiHVHMaSaILYfR/4RQ/H8GU8R9zY6YPc6thXt/rG/1?=
 =?us-ascii?Q?JjRmAekHXIvfeExCQiFVE30FLGdZFyCw0Pqn/3ojqyOXaVOabBWSGtulge6P?=
 =?us-ascii?Q?2DaOmIdxn3b9SyhZDv/6CGEqpjocmKxLvE+zWHJjhWuXCkQp9MaPzArW+SDq?=
 =?us-ascii?Q?MCfjk1AABJJ6vAlhGWaW5znWvRBuH4TU1UGX32o2AgtNV7g2LO+ybbPVqMqC?=
 =?us-ascii?Q?KkWY5nOUfZIxdfaNMsPjM1ruU2fTQrNAInj6Js7Mdt2U36GflokCk/tTtAEw?=
 =?us-ascii?Q?PSS89+uIQrJ/A89l9ydVlTJL1QY6TEuYTd7kfPtdImq1WzTKvnZe+0svu54U?=
 =?us-ascii?Q?488kva/Sv+ecngypZuRA4qf9Bb88DvTBwtC8co3iZaUq23d/RGLbG2GtRw0v?=
 =?us-ascii?Q?59U4sAaWwyGdSktxBIz8GMjRU8YmYfjcEk3Vm/CpublbLmXLGp8B9/Jwx7jm?=
 =?us-ascii?Q?vW9ev33az0iahXvuflPSdhHYMT8UhANuV2m7bVgY4i+W073/Czx40QT8csP4?=
 =?us-ascii?Q?ivKFYi8Z+AmWli0kxfnXgug6fj6AfdqbUog1N3l7gR6ZW7h6B2iG2SK2yj9b?=
 =?us-ascii?Q?AgsLRm02LCGQFWYwLIEfUdQcBnhaQUq4Uwwxn6bCakbwYjtzDc0Eg07aCVmF?=
 =?us-ascii?Q?4i/9LGwtfjK910+0NN341NGYpyD79LXFJacz1I4PCdzQRfo4AB8YlA6ku7mW?=
 =?us-ascii?Q?II3q+0jV0zPVWF6M4Bo1dQOZxFo1zjSPFQR/RgNz+Jv53Un6oHLSUbhQpKdr?=
 =?us-ascii?Q?egSAZCieykeQ9i5btNJigJRm55mCkUomrLfmKBK9Kg+RoL/z7Vs6gusmJ01k?=
 =?us-ascii?Q?S1TNHpRgSgV5WUriedRSJyFljZrHejBR/51Zb93FwO/H2OT5Fo1Zdz4a9bfi?=
 =?us-ascii?Q?qJdzXyh/JQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 11885ddd-16c0-41d0-ccc0-08df1361e46b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:27.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59cD1nvvBFMdHAvpkEg9kg8/kcrEUnpK3S1vKSU9ADNyPfXy3QXSBYiJpX0b1wSfarWR6Msu0ccACmFTE2gkGX3Qhsp9Ux6eQPH5AgBHgS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245895

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb92=
1b141aa642faedbf2ac510541c76499a19
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 46 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 0000000000..bb9ab04255
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,46 @@
+From 98bb921b141aa642faedbf2ac510541c76499a19 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:21 +0100
+Subject: [PATCH] CVE-2026-6244: Avoid division by zero via pcap_offline_fi=
lter().
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
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 497b1586..df92c433 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -422,10 +422,14 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 5b97c14e85..d23a018a95 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
+           file://04-CVE-2026-6244.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

