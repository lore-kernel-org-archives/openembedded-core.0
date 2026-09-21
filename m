Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C625C982FC
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1790021841236341143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OJHb9mvY;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSYZaih6MN4+BE0dzQxb1gklAWTi0MeyFEsR/PBCJGH0wid13uGaXNXl8PYE+KHpH6n7rXr0Dfkm3YllD7Qq35osy1OSZstN4khp7If3FE5wmWlsCZFwnRcSvb5hpcCl3D4bSv/8pEZwoV4YzbNBCeyaGNkrSiQwd+acfipEWtE66b388CgLVtOU6BAIk53LoqnH1ZJkedupQB2Jx5QZE8kGVmW3CD2e2v1xJZmfFjSUaFFfUWY9gL04ImZOWPfEQwbAjvpIwldaoAqR93ckeVvTz3lFh4zfVLh5Sb0OtcKzo0SQ6rCYyKsIqJuXzuEjIzemsrNeuqf9xWuL6M5K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a6wgmYxO1aBeckioTV1DZCwK+Re+GgRIdMCKWTouEI=;
 b=Cju17387pKszc6axpFlGjVh8YJnM0VgoBi0Wf7cxIvWItGANibrgk6braS3f2wYSnfEv/F/yGmXJhagn0+y+bmHwyS6jWlmgKOz4+n98R9X2uOQ4QQv9Yu5epgxu0ujern55fJP78OLpESB4OSLzNPGnyhtWNWaZwdpsEAebSQDg0a5veiIvWhFPdSBqrurvm8RnrK1Q4vdbvfFwfz/c88dBXLMsIxXKBmjQ4xs5kR5CKR/V+6Co0bwh10ti82Q7irz3PLQhBCtBiEjZiCMnmtJXpx31Aqeb4c4Esk6ZNjCjy1YzxqFQqYBZIZ3WZhyYkjeZKCYRvzFmxva734ujNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a6wgmYxO1aBeckioTV1DZCwK+Re+GgRIdMCKWTouEI=;
 b=OJHb9mvYtZZXIM5uAiM2uBIyIJoZ7KDis8RzFArCmmqz86s5EthfUp54geetvUTXTvudYnIiRCKECjMpxfNuKwil1zrwloRVY0QWBL79FxMztgYBGIMg0kX29V9Xbu8YVmAPJCeFVOpnuv2AOoLCXiu1iFrrEhWtwHBmkNg5+rD6oTXms/QyAy1SszAs7fPFzqIqD1MG1K/A6H8w2Ixv69qmbYy99MttB7o2xzIuxbejKmXkwVdByWG/eb9PzJE8U2BRHYkAoa1M0xkGlSKhIuiZM7cvihTcbc7CCM/lR+azzUBMb5ylQX2W3nlspiQUae2orH79Ih/1IV0L5Gdq3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 4/7] libpcap: Fix CVE-2026-6244
Date: Mon, 21 Sep 2026 22:17:12 +0200
Message-ID: <20260921201715.79085-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0064.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3f::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbe5ccc-9f80-4930-e6bb-08df181d58ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5Wpr6/MwQzJupObuSlhk1FTReeK+XdO9LrYkp+OFPqwBh9TXluLjNt74HWAlHL+BLj5CT95Nr9MPjrL0l3TmwXnwhRhbU0RW9VY5q+wnUIJQUE4O8n9z27HWMbYkcR6T/ui9l2aUUMZP8CsFgwX+2be0p1J5FLFA5CmXxUUNwNqVvdAxpv8s96PhK+JSwIpWyPWLvW/p4LjDUnzNqX8sgGKVe5lsUR1pDifh25as/7KB4p6tM/nuuvjlDbnD1mmtYugF/GHZoyY5loYrh48YJPOUA4qxwqcxx5/My3zDzyqpsb/7dgQ8NPB675Lme+bam+w7St5BIz4YqC4kEE6GmrOJGytzABcHeEEoIn8IfsLsz6/PXFqz1a5M9robNbntc7hWR3i1AFnnethVIh7sMsgSBLp13LlxcvGjzc4+fV9whRbUZpInAHP0aRgwbbpopoWo1swDSuaMeSnaNa/a+jBmJQ8R7Dq5riL7uuqKtJ/3QaSl37N1Aif+QkNzDetNLdLoDP6ZevvJXpC8MXTmIz31mw4iy4DkahajszCxK4+3MFhiV+llR5cSdAknE5R73qpU0cYwIhkoJqS3H7qeI7ACNQr4rd4gQoiy3D+BwWLfZEs9tPKB6RVJTCQ6loKp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I/e2OVTT5wgWJFB2ZPnRGwwX1fXyvlsi67qgITtqemqWmuMCWaC0KbQArOke?=
 =?us-ascii?Q?MPNEY8lCRPRAr8ckOQSQCk94MVyK61r1abjX+ydAfgkDVLnyf9f80mzE+TGc?=
 =?us-ascii?Q?hybTXLssP5MBc8cAQAkxQYfWD/WC6bfIsNpeIiF3Vdj8OIArKpPgbJB8A+JJ?=
 =?us-ascii?Q?2OEF3g52P7PJ1rLlbPAxa/T9b8/9T6RM5KfYkM3JDLArQeY1EW5y+yaYqfdz?=
 =?us-ascii?Q?bsrXRhtjiV/Irw0GUgaVIgh8YpWH0DskOgcy3V6SJWm8xushfnvwOE7HBdk0?=
 =?us-ascii?Q?VIRfXiCFCsAokKfxU2Fd9wv/3YAOa9VL+TmgVja1fPgOleevdPXD37L0GTbk?=
 =?us-ascii?Q?49sGO6057kGQ1qsYpXmlSn530qxgq6TGJZ0h3s0S3iqE6WUvv7pvNrj2s9HF?=
 =?us-ascii?Q?hTa8imGQ2Ncs8dn5QZGZ3GNv0amb6bt68wJpWNw/R2Q8qA6f8SyfC78SzmVe?=
 =?us-ascii?Q?hLBPyUm4OsDvkO7lrnVpHHmUS7cX9CqyK4aEUtg5ILvVwfilNEOq1csqi6zz?=
 =?us-ascii?Q?HUvTaLhCvrDOKroK17Ubpk9caWHfSXIRnCR9g10ifAj5Y31TltNV4Qvb5rmG?=
 =?us-ascii?Q?bDEBKEQTnZw/nBh/2fY20jecDXlUUwC60eBNj7C7m8g/tVad2pOR6H8rpxbA?=
 =?us-ascii?Q?H1Pzv23tDzl6xPJ/cJhXrje6Ahp61rG+GYCqTRg9eKSQthJyKOhIfBumcPJ2?=
 =?us-ascii?Q?4FeCzjgQaPL8Z6T/+GZUdeeVlLvAPIMs0LxHO91JwTuq4hAo2Fa8UziUq2Bd?=
 =?us-ascii?Q?4gcLeNYXyAFrLG5tWP/ZaY0aMoQNEF4h7a11/Reo3WipGzzyTbqS/RF8lf+G?=
 =?us-ascii?Q?Qy+ADbhxVKYS03IOl7VKHe5peaGrh/cDTdnNrPcG4nWqIMlie2jaw8qUPIdd?=
 =?us-ascii?Q?lWClRSoGY79Z497D32N2oYyGsBox1aM90YgsQXthct2WeCDaM+ff2CSAWPqG?=
 =?us-ascii?Q?zYwvCbrEI8eu7MWCqz540HwYkqKHCjKoRydg4BjILzeFuPagKd8I5E6O4xtc?=
 =?us-ascii?Q?RfeTlCdcu0fStTVAx3IJMzhSHOV+tDu2jGiATPnczI64t9nd/AfdQ8LiTqR6?=
 =?us-ascii?Q?V5LO4nVbN9B/GCartqHijRMhKJfMx9ks93MsiLV06+psJD18Cf3EEIC5USxU?=
 =?us-ascii?Q?AGKOAMD2Qrb9rxT52X4r5gW79RgymS+/YDuJr3UdiLsIDkeuKWZRvLmjWqy1?=
 =?us-ascii?Q?OibrPDLdVXqMtUvb+kCQAqNwKdHAScWvqlYka/H8/XR29RrG/ehvQ6U3nEZR?=
 =?us-ascii?Q?LcKw5jT9dDKWooIN0ARenE3KMtv1g+F+PjhOox9HMvcx2KDG4Fbgl0oEHsNK?=
 =?us-ascii?Q?WgPJWxS819gq0PZFvDcgkxqvFvOkhpzwj6SV5/pC6izyHrWpklm5cnauSOjN?=
 =?us-ascii?Q?xTEmdlarRm84miqXupxcNyeYX0M/xrBChYMMFxRw080Xv2wL5dMNPg7zLoJ/?=
 =?us-ascii?Q?9eenJ2iRzDI/0R/Gz9xiEGCmuBxGzeg8WIFWfL+pqmP2LJi/z1r/1GZw1YRK?=
 =?us-ascii?Q?+zQ6l0wjCdWWBRaW77sRpHGsPu/UT0ZCrP2ma65N2KVtl1kXTzyi3CUCtsFE?=
 =?us-ascii?Q?fBD+Phi75dQHkJmhQPk8jIc2uOYT4GjWF94rieWANWlv5z9rNu5FCmtOdHNU?=
 =?us-ascii?Q?5V9lbZbEiA0j2DUwm6qojzDpZ5J/ZoaYJcXm86NBJwxePmNbjuSnJByPA8ra?=
 =?us-ascii?Q?tTZKXkKEz906IJfk4zgIkcSs6KgET7qgmj33ISxAuaaxIKuT46HXGVEPYeA/?=
 =?us-ascii?Q?mQGhr3AY/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbe5ccc-9f80-4930-e6bb-08df181d58ae
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:23.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR1MzXmk0nqQp3C18L/S3H8Y3b/PJdNCG1gUJ8VhIbN/i8+WZTxAnLidxuvmCoWjCW5sgOQ56fFfY+9MCRJ0h1aSDDy1CWIOH+jPoO9S+Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246352

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb92=
1b141aa642faedbf2ac510541c76499a19

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 49 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 0000000000..5215b12ffb
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,49 @@
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
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
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

