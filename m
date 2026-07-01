Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD62C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:49:09 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41952.1782902940449681509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=okY0Gtuu;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yHjOZiLb6QIwBGeZCGV2ls8jbuAmnEHbkIbSF9mnln0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902938;
 b=GNOoavXDMenhpFPkvNI1rkmq2a9wnh3SjT9T+oXaJgO5ozxsAPJYQZqEX5lXnfqPfP+xX9Yx
 vpLYuICr1z/KzrMOJnNuLefPx8tIOf+Yx7y4nYh2wJG2ftD41y0XOTzREexsa+WQ9rPL7e/u2Ie
 9Qur0tnCljQT9szPDFhvErmLrH1ECV764t5k/bS/H2xVauZrWz5g5U+vLtr2ojfcuQFvbK672CJ
 uR2h/YhepjN4otv0D2km+QL+GcIBkJI/5syd/DH4j1WojYmikdnkERIOMYCoAFG6hQEdqyuVMrM
 sYIGmFZa328ntCWxhzvi7zpXKXsJd+PvpN64m2hiy1VHw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902938;
 b=eTbPsTyxKOjY3mors9OMAhB+DevcJL3i8XFkBy+A0vkRKaH1n9BhjnRAJc21pmJHnits65y9
 o7EKRoxDDilTK2DIcnYbyu1/IZJt81iGCZfiPxVonQ2kKx3AXpLq9SGk0QholgAMw3m7GLFq/Ha
 mDfvk46yyqjpWkCpAeCucJzVuXN9hfweBtUgPqNKt+qwZIgCsjvb3mDOxekUCXjyh9exqFpE0I7
 8ReCsTW896it9rC0q2VZMZBBHx9S3ZAHS6pHBvOZKFTofNPbjqAcQadWq3DCIgXg3kTkTSOR9+K
 oXBWGNt35+ieIuMUXYSOcqxwbG3HDAKwNOdjnRnRqQxyQ==
Received: from mail-norwayeastazon11023137.outbound.protection.outlook.com ([40.107.159.137]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:48:58 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3G963CrP+D1u3Oc7EuFjpqpYOT4d6xpehJpEiX0u49YR4LrWeGe2QfjDuQUhdiYwHoEtIOSAZLMadPITvlbBfMZs4yFMYy1j4whBFwkKcjDRPCiGYuhlelFIXDkjt3uOP9Bt14pouptlZa3pKohNz/F6S2FkL/2TjfY/ts84ofVcl4wQa/FczgeWcUYDaplUrZxeXgSP1OwoNCkxynExKQXOfOJBlh6riC2K8Fjubz/1JuPrl+CC2m9Ppgi1CQaA6C5eSgky6ogS1wjdIDwbDcyBWxBHBSmEbkHHcsW993BrQPrFB5un+u4DV0tnX48b3rdjRjoQOy5OTZDXu/vNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHjOZiLb6QIwBGeZCGV2ls8jbuAmnEHbkIbSF9mnln0=;
 b=jg+eKYQ3AyCE6SRkCbVxGtpIWltLU65TrTUJbsBspgqLbB2vTSlqKtSw7JiazAcQ33TG/Jjarsyw3gKjuYnWnnk5aPn801/+wfr4+TeHFXlAJjPasIeVUISpL3fDms/Yzuz2ysS1mcUWHP1zRpsJyHeV6KXQTlQz4BIpcMKVkBhIdUL9YGjX1rRRY91OmCjz84y5kSPpm/OBSuLmgTAAamEoOCM3E5LJKLa037NAQpzUOFXeIwQurwaMFEFHc7Uw5Ued2ftUdPXnI0TirEKwwJce4pz+A0ZCUzl4nFO12lhHGm5YWiYrhOvUIAzNKI98C6KcYKdA8cmnYLg7k5FsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHjOZiLb6QIwBGeZCGV2ls8jbuAmnEHbkIbSF9mnln0=;
 b=okY0GtuuvXLyzQ9r0xcuDoscKAW61qNPrvTKvT3/sQas2IP1C1A8MudpcN9jpoOGxLBOLTNrNs0p3lQUr/v8wsTYsI2CO/4HAEToDMWrEE/B9CSMsB7qSZ4wP6tz7rweFs8jihyXfoy+2NZHA80lyR+snH8Kx8XYE8DTeRVWBn3NOna41LL0ZxzrWvMYb5lSw5NxLoU78XAPFcOM3QuvTKGdNB79xC/fpQBn1pflf6+9cntmO32eZskwBdH9ODKjHvWaDY5Ui5K5T7ftPDF3uKsb5cN4DJ7cioVtJ5LxLMlXCC2DlJKrjgIL+S8UUuybv0l+3y2lXsdiAEamRMbNeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:49 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:49 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH 3/4] dhcpcd: patch CVE-2026-56116
Date: Wed,  1 Jul 2026 12:48:36 +0200
Message-ID: <20260701104837.3577369-3-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
References: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 61157a65-6342-4df4-fce5-08ded75e5520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	vQfVc+IjUlY6xNVM67tGLJaZVuTOoWzIzWbUTr4o+ZT/gMAAoxCOOO5qhvQUx2MbLH+7BXgE8vbqwKOF1PSLpl3UQ3xYKGu2sA9uFxtf6H6SFN9s7cXFTJY3Kp/HWTKVqP25/9Js3vK3wxyKVvte7WWxTalIVRp4fjqrqaRSTNIU4oc5HINtGamfMjoDlQCzO+kpL6zywU0MfvZX7iA+R2hJD7MJcWRKkuwIaPP3EcLDMdpH3XtE3Ks6SMA6Y3iBioTRbkzJ3RRKCg3Tti8NvHBuivSGasUNX441ut/oCJSywhndHr25Y9SVTFmHEQTkmV3pnEXFe8NF9gUjjH/+/IrcZSDfQHhIg/DmyBzcjU/bW14O/UweyczMkWHAG9qSeaaQ0GNmmWrVX9D4rb/ohwb/USzlPiyyzOW/iPSSLklF5byNkelNRwOH+fP+nTayooVLPh/I1tKje8w1ymSoaGCJqfppSwjmQnLCDqKz73CPJ1fnqwY/6CLPJB1Np/Yi+yqgguSeA7HUsE0iV2W2zGRntvLRMXLIwGe7s7lJdxQFW73ZWrZUmdhVGsB2Ea2KTP9uYcFvB1nCuQyiAtbdLelV91g5GHBlwgO40RPBLHvme9o6/v9c+RWvccs3/ShjOZNyfxMkndr0pAQ72NhfdrTDrrqFxRvG9zpDYI9h3U8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m606JKgM0xZ4YEwbntBgRAXdb33CNtdxHpgJIAIAodY3TCYNQG3c9Ufevcl3?=
 =?us-ascii?Q?TsPuW+hyXd+CXH6Y0EitOG8cCuTSxP4S0ZtPg0djbKdNFxH1WBiuk5S7lc/k?=
 =?us-ascii?Q?W+9uAYM0m4bKtkUUKtRrju6+SU8lVXfcHvRC9SpGkLW9IkeJRttmxs9mGK9H?=
 =?us-ascii?Q?UEVooabuPyxNNPi2DuIkapB05DE7OtCpDjYcG5KAx/cqLQB8UX8F7HSXjwd5?=
 =?us-ascii?Q?5QnptGuxDergmRumN0rH5SjNeZe2sLbm+UqvXOC5sMoq5ag5B9H5RxiQ9zcy?=
 =?us-ascii?Q?B8HcZai8O+kUA97JkZGnQpa3Vu0BhWottGshcAUHmmRc2uVhVPToK7FeEoBY?=
 =?us-ascii?Q?hfS7WVF4qAmDf4Jo7FiNTv7fJFkJyshwaUhD0RppQ5lVeealouxxTInXKpES?=
 =?us-ascii?Q?FR1nqeUSj6kJgIPhFSOJpdnE3Xw5kUr+bajLNDOGumQTqlnohUMNUiPeFs5S?=
 =?us-ascii?Q?dU1zBCe1+IqIx3NeogOgx3SJ0RvqR64phHS32QX3sCmGWHXcr+U7e2I89D6E?=
 =?us-ascii?Q?NVBUIhfe8yrp44yijbVXk6iYbRpDw0bDifqHztJgY6WOiJTT9G+eT0+cn2J5?=
 =?us-ascii?Q?5c8O9QB6sqCjPSCNwIG8UT1LES5UQ3F8ebW2QiWhTDfNFQjFxcbTSN7Yqe83?=
 =?us-ascii?Q?tutQ20dFesnunNyyRW6/9u+eOQUdpkAE48m+REFgPZo88LyEHMFUJWCh9oQ7?=
 =?us-ascii?Q?ioTNL/cG0OFOAO+LZdTBjjr1huDnd42lum5i2rCgkAHRU5s/kJafEOreIWge?=
 =?us-ascii?Q?EkdH2PFPk+tifoyH8BVsQxVEy7OHENPvh/1epZMFQ69jtXLso1DKsjXNry4L?=
 =?us-ascii?Q?/LuAUZFq8XHnR1DijLCkG+ByGavvC+Oxq0KyfJod+z/C0VvgNMsn6AZOhZQr?=
 =?us-ascii?Q?vgbv0D3N22Gl+4yxTP46VIqMuHKryQuJ/j5Mp+lHd6mbOrDJcwUAVERSbcuR?=
 =?us-ascii?Q?R1rcsOB66ix+I6OCzHRvghri/nKyuz/GpBhAEKtFbEgFtwMYz2Xlg0StQf5U?=
 =?us-ascii?Q?vpkOxT8WZSAP7H3P+UJ6kgQKVt0T7FUnBlKnRPwte4arOncdNE+0ze02QNqS?=
 =?us-ascii?Q?Xfr9LDi6LDDxhJdFlNsKMeA+dNQ9ZQ4PoutgRf6pLf/Jvt5SoLzwTRt6t7t/?=
 =?us-ascii?Q?CxqbVE8uJSQYd0Lk/a9Gdi/+1DLlctnB/rUxQMjkvMCh21NWQx/zEt679+e2?=
 =?us-ascii?Q?MkrNteeTBkQF13LiXQaNODOlvm3jttXucxg6kCpT0ZIQukTS9ccrCh2HdIVW?=
 =?us-ascii?Q?OshblA6UjYqGsuwa9tfK7m+PHdD5OvsNsGNtiBFwh9Kc0h5e1PLJtSsIaHos?=
 =?us-ascii?Q?FbIHmVrEnL/cTv0hMrcRUg1PHmy0Dhre6becYM5tq7DR4McVqvlHDMkJOsVO?=
 =?us-ascii?Q?nkpHZiPCHAA5qmlPzzOjCXG3JOkdrL5p/EsYOCHfW4h65NgYm5ukhNIcqCSD?=
 =?us-ascii?Q?qmFQ94dO2sHOt3VXxuWUEx1yQZde3RtdrFjQxAhY4gAogUD6Tw4Ct9c8HSsS?=
 =?us-ascii?Q?FgAjhGjDvcv44ZlGQfS6dmbgKFEBp+2fOKdg5deyrVv1ni1s03DYdv4YmLof?=
 =?us-ascii?Q?KL9oAToBwL/bIo3QRozkQEbO49xZfLYqoxzcikkGQW3mtJlG8Rz/xFNd6duU?=
 =?us-ascii?Q?JWwXq4dZxJ3n2dG1PSZw69rqv5uKY3h1ZFQ5ceLDD7ZLAOYFw9yq0SM65RPu?=
 =?us-ascii?Q?GDt/7Rg157uOVCBHrSGu3kmEVzza7UnjdDAxXgvSP3M9FIc4wBdStODBN1O3?=
 =?us-ascii?Q?xyI24fAUW6Vjr0xM449plihiACtsDj24DzgnbPZnSRVd0dHKjugjBiPES1Rs?=
X-MS-Exchange-AntiSpam-MessageData-1: U7LMflKpv81e+Q==
X-Exchange-RoutingPolicyChecked: 
	J+7rHipVtM2E8OZg/KoHryZZ3gIPDli6ekkJGoV7gHrrU9Zp6SV+yiGoh67aCLyNl/GywcM2kvdXoLChZP4VXn1ZIK4vKUnLn2s8oBgZGt2HUlwqHVk3i53iMDROEe4Oa+mgGJbdQBCIkTQPoDdXdPSZ6pO9GpTI2eoPKSxJc4H4R1ThqQj5T9YwNloGMY4Hlzcvv7elaOfpDE01qleI7tnOLnQrKkRYFxmK9o5TkPTXQ+GjlCUOsQ+4KuEh4XH+7xHZ3ctuQMRqtG8zV8yDi6puMqyVcqsODH6DsHEM7hJ5CzAAurFa5I0t9xVmrLLlvTObSjvqMON9VSIKBvv9qQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NcLGkpkrfS5Kdy59AZJC16a4wPYt06+Ogm9YWyYsj8tQw9SWpmhl8yPiizUxEVmQmS7Y8vLqfaa0ymc1+PbOBCcykJ/RQ0es4mAa0hpIS3cS3054OrKN6hkvTcVWQmUre/U5T8JoNrfrP6ge5Qlvh8FeCq+WmQzI7o8h5oRrBKOksTc0zC6ipcPFkKxdhk8XnGysipfT5xqj4P1efNQsWKE8wzYbj/0cnZ5Bn+T4DkKU/l2N+dYWzxFlHYN0kyyBpMS06nwScl7qaT6iRqud3ujeCy0AP27kfw+GbHpZG4+02zs6fAlKPyha91aJyhMvxL1Atn1XrAn0NK50oHkjY07ma06q8IZgO3MXos2zM7PEIwq8K0437SuvMXImR/QUihyiwO6adJh8LaLsA62tsf3kC+ak2rv4ZBccDaYyIT2i638l3FbR00vn1j+Qq0mR9GUlUrBdbiMpCfcC+ejveHjMYf93/MCv4iEFLgzYJGWjTzKi1nUOzzDU6fgHbbBryMsQS5QnL50fhycFcg9Ysns2z9GAhR0aiWaj2avaenFqoD8JIK3ugLZrG28Gj1b30Y9bx32suRXpqdMSrHrCL5269aNIwyg7HnV1dG+5hdjTbzG8u9B/UGhuBPKuceQE
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61157a65-6342-4df4-fce5-08ded75e5520
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:48.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCC3MHh85JiWLZu1MR/Jx/uTw0qEHOZ96C5dWf3DgHZiXiF/C97eqZM5+HdRdLWTSCTbzrb2q2nbL0gsECMOYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gqxZv0scFz1PKSK
X-cloud-security-connect: mail-norwayeastazon11023137.outbound.protection.outlook.com[40.107.159.137], TLS=1, IP=40.107.159.137
X-cloud-security-Digest: c4e1dc3ddcd4b2440ef92e408001eff8
X-cloud-security: scantime:1.067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239973

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2] and commit [3] which is dependency
of [1]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0

[2] https://security-tracker.debian.org/tracker/CVE-2026-56116

[3] https://github.com/NetworkConfiguration/dhcpcd/commit/f1cf924ad691bc1e6bf33013407fbf838fa40fbe

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |   2 +
 .../dhcpcd/files/CVE-2026-56116-pre.patch     | 482 ++++++++++++++++++
 .../dhcpcd/files/CVE-2026-56116.patch         |  31 ++
 3 files changed, 515 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116-pre.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index bc87b91503..4a031cefea 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56116-pre.patch \
+           file://CVE-2026-56116.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116-pre.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116-pre.patch
new file mode 100644
index 0000000000..f9309de80a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116-pre.patch
@@ -0,0 +1,482 @@
+From b13d64e33c4b02c4806857c49e4ccaa64b6015de Mon Sep 17 00:00:00 2001
+From: Daniel Goertzen <daniel.goertzen@gmail.com>
+Date: Fri, 8 Mar 2024 19:27:57 -0600
+Subject: [PATCH 1/2] add RFC4191 support (#297)
+
+* add RFC4191 support
+
+- handles route information options from RAs.
+- refactor `sa_fromprefix()` to expose lower level functionality
+- refactor `ipv6nd_rtprefix()` to be usable outside of `struct ra` context
+
+* changes as requested by RM
+
+- mostly minor/cosmetic changes
+- functional change: "no longer a default router" warning moved to capture changes from routeinfo options
+
+* simplify routeinfo_find/new
+
+(cherry picked from commit f1cf924ad691bc1e6bf33013407fbf838fa40fbe)
+
+This commit is a dependency of commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0.
+
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/f1cf924ad691bc1e6bf33013407fbf838fa40fbe]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/ipv6.c   |  29 ++++++++++-
+ src/ipv6nd.c | 135 +++++++++++++++++++++++++++++++++++++++++++++++----
+ src/ipv6nd.h |  19 +++++++-
+ src/sa.c     |  46 ++++++++++++------
+ src/sa.h     |   1 +
+ 5 files changed, 201 insertions(+), 29 deletions(-)
+
+diff --git a/src/ipv6.c b/src/ipv6.c
+index eb8c617a..ce985d4e 100644
+--- a/src/ipv6.c
++++ b/src/ipv6.c
+@@ -2318,7 +2318,9 @@ inet6_raroutes(rb_tree_t *routes, struct dhcpcd_ctx *ctx)
+ {
+ 	struct rt *rt;
+ 	struct ra *rap;
++	const struct routeinfo *rinfo;
+ 	const struct ipv6_addr *addr;
++	struct in6_addr netmask;
+ 
+ 	if (ctx->ra_routers == NULL)
+ 		return 0;
+@@ -2326,6 +2328,27 @@ inet6_raroutes(rb_tree_t *routes, struct dhcpcd_ctx *ctx)
+ 	TAILQ_FOREACH(rap, ctx->ra_routers, next) {
+ 		if (rap->expired)
+ 			continue;
++
++		/* add rfc4191 route information routes */
++		TAILQ_FOREACH (rinfo, &rap->rinfos, next) {
++			if(rinfo->lifetime == 0)
++				continue;
++			if ((rt = inet6_makeroute(rap->iface, rap)) == NULL)
++				continue;
++
++			in6_addr_fromprefix(&netmask, rinfo->prefix_len);
++
++			sa_in6_init(&rt->rt_dest, &rinfo->prefix);
++			sa_in6_init(&rt->rt_netmask, &netmask);
++			sa_in6_init(&rt->rt_gateway, &rap->from);
++#ifdef HAVE_ROUTE_PREF
++			rt->rt_pref = ipv6nd_rtpref(rinfo->flags);
++#endif
++
++			rt_proto_add(routes, rt);
++		}
++
++		/* add subnet routes */
+ 		TAILQ_FOREACH(addr, &rap->addrs, next) {
+ 			if (addr->prefix_vltime == 0)
+ 				continue;
+@@ -2333,11 +2356,13 @@ inet6_raroutes(rb_tree_t *routes, struct dhcpcd_ctx *ctx)
+ 			if (rt) {
+ 				rt->rt_dflags |= RTDF_RA;
+ #ifdef HAVE_ROUTE_PREF
+-				rt->rt_pref = ipv6nd_rtpref(rap);
++				rt->rt_pref = ipv6nd_rtpref(rap->flags);
+ #endif
+ 				rt_proto_add(routes, rt);
+ 			}
+ 		}
++
++		/* add default route */
+ 		if (rap->lifetime == 0)
+ 			continue;
+ 		if (ipv6_anyglobal(rap->iface) == NULL)
+@@ -2347,7 +2372,7 @@ inet6_raroutes(rb_tree_t *routes, struct dhcpcd_ctx *ctx)
+ 			continue;
+ 		rt->rt_dflags |= RTDF_RA;
+ #ifdef HAVE_ROUTE_PREF
+-		rt->rt_pref = ipv6nd_rtpref(rap);
++		rt->rt_pref = ipv6nd_rtpref(rap->flags);
+ #endif
+ 		rt_proto_add(routes, rt);
+ 	}
+diff --git a/src/ipv6nd.c b/src/ipv6nd.c
+index 9bf7c5df..9264dce7 100644
+--- a/src/ipv6nd.c
++++ b/src/ipv6nd.c
+@@ -71,6 +71,20 @@
+ #define	ND_OPT_PI_FLAG_ROUTER	0x20	/* Router flag in PI */
+ #endif
+ 
++#ifndef ND_OPT_RI
++#define ND_OPT_RI	24
++struct nd_opt_ri {		/* Route Information option RFC4191 */
++	uint8_t	 nd_opt_ri_type;
++	uint8_t	 nd_opt_ri_len;
++	uint8_t	 nd_opt_ri_prefixlen;
++	uint8_t	 nd_opt_ri_flags_reserved;
++	uint32_t nd_opt_ri_lifetime;
++	struct in6_addr nd_opt_ri_prefix;
++};
++__CTASSERT(sizeof(struct nd_opt_ri) == 24);
++#define OPT_RI_FLAG_PREFERENCE(flags) ((flags & 0x18) >> 3)
++#endif
++
+ #ifndef ND_OPT_RDNSS
+ #define ND_OPT_RDNSS			25
+ struct nd_opt_rdnss {           /* RDNSS option RFC 6106 */
+@@ -132,6 +146,8 @@ __CTASSERT(sizeof(struct nd_opt_dnssl) == 8);
+ //
+ 
+ static void ipv6nd_handledata(void *, unsigned short);
++static struct routeinfo *routeinfo_findalloc(struct ra *, const struct in6_addr *, uint8_t);
++static void routeinfohead_free(struct routeinfohead *);
+ 
+ /*
+  * Android ships buggy ICMP6 filter headers.
+@@ -612,10 +628,10 @@ ipv6nd_startexpire(struct interface *ifp)
+ }
+ 
+ int
+-ipv6nd_rtpref(struct ra *rap)
++ipv6nd_rtpref(uint8_t flags)
+ {
+ 
+-	switch (rap->flags & ND_RA_FLAG_RTPREF_MASK) {
++	switch (flags & ND_RA_FLAG_RTPREF_MASK) {
+ 	case ND_RA_FLAG_RTPREF_HIGH:
+ 		return RTPREF_HIGH;
+ 	case ND_RA_FLAG_RTPREF_MEDIUM:
+@@ -624,7 +640,7 @@ ipv6nd_rtpref(struct ra *rap)
+ 	case ND_RA_FLAG_RTPREF_LOW:
+ 		return RTPREF_LOW;
+ 	default:
+-		logerrx("%s: impossible RA flag %x", __func__, rap->flags);
++		logerrx("%s: impossible RA flag %x", __func__, flags);
+ 		return RTPREF_INVALID;
+ 	}
+ 	/* NOTREACHED */
+@@ -649,7 +665,7 @@ ipv6nd_sortrouters(struct dhcpcd_ctx *ctx)
+ 				continue;
+ 			if (!ra1->isreachable && ra2->reachable)
+ 				continue;
+-			if (ipv6nd_rtpref(ra1) <= ipv6nd_rtpref(ra2))
++			if (ipv6nd_rtpref(ra1->flags) <= ipv6nd_rtpref(ra2->flags))
+ 				continue;
+ 			/* All things being equal, prefer older routers. */
+ 			/* We don't need to check time, becase newer
+@@ -827,6 +843,7 @@ ipv6nd_removefreedrop_ra(struct ra *rap, int remove_ra, int drop_ra)
+ 	if (remove_ra)
+ 		TAILQ_REMOVE(rap->iface->ctx->ra_routers, rap, next);
+ 	ipv6_freedrop_addrs(&rap->addrs, drop_ra, NULL);
++	routeinfohead_free(&rap->rinfos);
+ 	free(rap->data);
+ 	free(rap);
+ }
+@@ -1105,6 +1122,8 @@ ipv6nd_handlera(struct dhcpcd_ctx *ctx,
+ 	struct nd_opt_prefix_info pi;
+ 	struct nd_opt_mtu mtu;
+ 	struct nd_opt_rdnss rdnss;
++	struct nd_opt_ri ri;
++	struct routeinfo *rinfo;
+ 	uint8_t *p;
+ 	struct ra *rap;
+ 	struct in6_addr pi_prefix;
+@@ -1206,6 +1225,7 @@ ipv6nd_handlera(struct dhcpcd_ctx *ctx,
+ 		rap->from = from->sin6_addr;
+ 		strlcpy(rap->sfrom, sfrom, sizeof(rap->sfrom));
+ 		TAILQ_INIT(&rap->addrs);
++		TAILQ_INIT(&rap->rinfos);
+ 		new_rap = true;
+ 		rap->isreachable = true;
+ 	} else
+@@ -1237,9 +1257,6 @@ ipv6nd_handlera(struct dhcpcd_ctx *ctx,
+ 	rap->flags = nd_ra->nd_ra_flags_reserved;
+ 	old_lifetime = rap->lifetime;
+ 	rap->lifetime = ntohs(nd_ra->nd_ra_router_lifetime);
+-	if (!new_rap && rap->lifetime == 0 && old_lifetime != 0)
+-		logwarnx("%s: %s: no longer a default router (lifetime = 0)",
+-		    ifp->name, rap->sfrom);
+ 	if (nd_ra->nd_ra_curhoplimit != 0)
+ 		rap->hoplimit = nd_ra->nd_ra_curhoplimit;
+ 	else
+@@ -1502,6 +1519,46 @@ ipv6nd_handlera(struct dhcpcd_ctx *ctx,
+ 			    rdnss.nd_opt_rdnss_len > 1)
+ 				rap->hasdns = 1;
+ 			break;
++		case ND_OPT_RI:
++			if (ndo.nd_opt_len > 3) {
++				logmessage(loglevel, "%s: invalid route info option",
++				    ifp->name);
++				break;
++			}
++			memset(&ri, 0, sizeof(ri));
++			memcpy(&ri, p, olen); /* may be smaller than sizeof(ri), pad with zero */
++			if(ri.nd_opt_ri_prefixlen > 128) {
++				logmessage(loglevel, "%s: invalid route info prefix length",
++				    ifp->name);
++				break;
++			}
++
++			/* rfc4191 3.1 - RI for ::/0 applies to default route */
++			if(ri.nd_opt_ri_prefixlen == 0) {
++				rap->lifetime = ntohl(ri.nd_opt_ri_lifetime);
++
++				/* Update preference leaving other flags intact */
++				rap->flags = ((rap->flags & (~ (unsigned int)ND_RA_FLAG_RTPREF_MASK))
++					| ri.nd_opt_ri_flags_reserved) & 0xff;
++
++				break;
++			}
++
++			/* Update existing route info instead of rebuilding all routes so that
++			previously announced but now absent routes can stay alive.  To kill a
++			route early, an RI with lifetime=0 needs to be received (rfc4191 3.1)*/
++			rinfo = routeinfo_findalloc(rap, &ri.nd_opt_ri_prefix, ri.nd_opt_ri_prefixlen);
++			if(rinfo == NULL) {
++				logerr(__func__);
++				break;
++			}
++
++			/* Update/initialize other route info params */
++			rinfo->flags = ri.nd_opt_ri_flags_reserved;
++			rinfo->lifetime = ntohl(ri.nd_opt_ri_lifetime);
++			rinfo->acquired = rap->acquired;
++
++			break;
+ 		default:
+ 			continue;
+ 		}
+@@ -1537,6 +1594,10 @@ ipv6nd_handlera(struct dhcpcd_ctx *ctx,
+ 		ia->prefix_pltime = 0;
+ 	}
+ 
++	if (!new_rap && rap->lifetime == 0 && old_lifetime != 0)
++		logwarnx("%s: %s: no longer a default router (lifetime = 0)",
++		    ifp->name, rap->sfrom);
++
+ 	if (new_data && !has_address && rap->lifetime && !ipv6_anyglobal(ifp))
+ 		logwarnx("%s: no global addresses for default route",
+ 		    ifp->name);
+@@ -1699,7 +1760,7 @@ ipv6nd_env(FILE *fp, const struct interface *ifp)
+ 			return -1;
+ 		if (efprintf(fp, "%s_hoplimit=%u", ndprefix, rap->hoplimit) == -1)
+ 			return -1;
+-		pref = ipv6nd_rtpref(rap);
++		pref = ipv6nd_rtpref(rap->flags);
+ 		if (efprintf(fp, "%s_flags=%s%s%s%s%s", ndprefix,
+ 		    rap->flags & ND_RA_FLAG_MANAGED    ? "M" : "",
+ 		    rap->flags & ND_RA_FLAG_OTHER      ? "O" : "",
+@@ -1804,6 +1865,7 @@ ipv6nd_expirera(void *arg)
+ 	uint32_t elapsed;
+ 	bool expired, valid;
+ 	struct ipv6_addr *ia;
++	struct routeinfo *rinfo, *rinfob;
+ 	size_t len, olen;
+ 	uint8_t *p;
+ 	struct nd_opt_hdr ndo;
+@@ -1823,7 +1885,8 @@ ipv6nd_expirera(void *arg)
+ 		if (rap->iface != ifp || rap->expired)
+ 			continue;
+ 		valid = false;
+-		if (rap->lifetime) {
++		/* lifetime may be set to infinite by rfc4191 route information */
++		if (rap->lifetime && rap->lifetime != ND6_INFINITE_LIFETIME) {
+ 			elapsed = (uint32_t)eloop_timespec_diff(&now,
+ 			    &rap->acquired, NULL);
+ 			if (elapsed >= rap->lifetime || rap->doexpire) {
+@@ -1879,6 +1942,20 @@ ipv6nd_expirera(void *arg)
+ 			}
+ 		}
+ 
++		/* Expire route information */
++		TAILQ_FOREACH_SAFE(rinfo, &rap->rinfos, next, rinfob) {
++			if (rinfo->lifetime == ND6_INFINITE_LIFETIME &&
++			    !rap->doexpire)
++				continue;
++			elapsed = (uint32_t)eloop_timespec_diff(&now,
++			    &rinfo->acquired, NULL);
++			if (elapsed >= rinfo->lifetime || rap->doexpire) {
++				logwarnx("%s: expired route %s",
++				    rap->iface->name, rinfo->sprefix);
++				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
++			}
++		}
++
+ 		/* Work out expiry for ND options */
+ 		elapsed = (uint32_t)eloop_timespec_diff(&now,
+ 		    &rap->acquired, NULL);
+@@ -2135,3 +2212,43 @@ ipv6nd_startrs(struct interface *ifp)
+ 	eloop_timeout_add_msec(ifp->ctx->eloop, delay, ipv6nd_startrs1, ifp);
+ 	return;
+ }
++
++static struct routeinfo *routeinfo_findalloc(struct ra *rap, const struct in6_addr *prefix, uint8_t prefix_len)
++{
++	struct routeinfo *ri;
++	char buf[INET6_ADDRSTRLEN];
++	const char *p;
++
++	TAILQ_FOREACH(ri, &rap->rinfos, next) {
++		if (ri->prefix_len == prefix_len &&
++		    IN6_ARE_ADDR_EQUAL(&ri->prefix, prefix))
++			return ri;
++	}
++
++	ri = malloc(sizeof(struct routeinfo));
++	if (ri == NULL)
++		return NULL;
++
++	memcpy(&ri->prefix, prefix, sizeof(ri->prefix));
++	ri->prefix_len = prefix_len;
++	p = inet_ntop(AF_INET6, prefix, buf, sizeof(buf));
++	if (p)
++		snprintf(ri->sprefix,
++			sizeof(ri->sprefix),
++			"%s/%d",
++			p, prefix_len);
++	else
++		ri->sprefix[0] = '\0';
++	TAILQ_INSERT_TAIL(&rap->rinfos, ri, next);
++	return ri;
++}
++
++static void routeinfohead_free(struct routeinfohead *head)
++{
++	struct routeinfo *ri;
++
++	while ((ri = TAILQ_FIRST(head))) {
++		TAILQ_REMOVE(head, ri, next);
++		free(ri);
++	}
++}
+diff --git a/src/ipv6nd.h b/src/ipv6nd.h
+index b702c3bd..837b7d0f 100644
+--- a/src/ipv6nd.h
++++ b/src/ipv6nd.h
+@@ -37,6 +37,20 @@
+ #include "dhcpcd.h"
+ #include "ipv6.h"
+ 
++/* rfc4191 */
++struct routeinfo {
++	TAILQ_ENTRY(routeinfo) next;
++	struct in6_addr prefix;
++	uint8_t prefix_len;
++	uint32_t lifetime;
++	uint8_t flags;
++	struct timespec acquired;
++	char sprefix[INET6_ADDRSTRLEN];
++};
++
++TAILQ_HEAD(routeinfohead, routeinfo);
++
++
+ struct ra {
+ 	TAILQ_ENTRY(ra) next;
+ 	struct interface *iface;
+@@ -45,13 +59,14 @@ struct ra {
+ 	uint8_t *data;
+ 	size_t data_len;
+ 	struct timespec acquired;
+-	unsigned char flags;
++	uint8_t flags;
+ 	uint32_t lifetime;
+ 	uint32_t reachable;
+ 	uint32_t retrans;
+ 	uint32_t mtu;
+ 	uint8_t hoplimit;
+ 	struct ipv6_addrhead addrs;
++	struct routeinfohead rinfos;
+ 	bool hasdns;
+ 	bool expired;
+ 	bool willexpire;
+@@ -105,7 +120,7 @@ int ipv6nd_open(bool);
+ int ipv6nd_openif(struct interface *);
+ #endif
+ void ipv6nd_recvmsg(struct dhcpcd_ctx *, struct msghdr *);
+-int ipv6nd_rtpref(struct ra *);
++int ipv6nd_rtpref(uint8_t);
+ void ipv6nd_printoptions(const struct dhcpcd_ctx *,
+     const struct dhcp_opt *, size_t);
+ void ipv6nd_startrs(struct interface *);
+diff --git a/src/sa.c b/src/sa.c
+index f1e2e16e..05009d3b 100644
+--- a/src/sa.c
++++ b/src/sa.c
+@@ -300,11 +300,39 @@ sa_toprefix(const struct sockaddr *sa)
+ 	return prefix;
+ }
+ 
++static void
++ipbytes_fromprefix(uint8_t *ap, int prefix, int max_prefix)
++{
++	int bytes, bits, i;
++
++	bytes = prefix / NBBY;
++	bits = prefix % NBBY;
++
++	for (i = 0; i < bytes; i++)
++		*ap++ = 0xff;
++	if (bits) {
++		uint8_t a;
++
++		a = 0xff;
++		a  = (uint8_t)(a << (8 - bits));
++		*ap++ = a;
++	}
++	bytes = (max_prefix - prefix) / NBBY;
++	for (i = 0; i < bytes; i++)
++		*ap++ = 0x00;
++}
++
++void
++in6_addr_fromprefix(struct in6_addr *addr, int prefix)
++{
++	ipbytes_fromprefix((uint8_t *)addr, prefix, 128);
++}
++
+ int
+ sa_fromprefix(struct sockaddr *sa, int prefix)
+ {
+ 	uint8_t *ap;
+-	int max_prefix, bytes, bits, i;
++	int max_prefix;
+ 
+ 	switch (sa->sa_family) {
+ #ifdef INET
+@@ -328,22 +356,8 @@ sa_fromprefix(struct sockaddr *sa, int prefix)
+ 		return -1;
+ 	}
+ 
+-	bytes = prefix / NBBY;
+-	bits = prefix % NBBY;
+-
+ 	ap = (uint8_t *)sa + sa_addroffset(sa);
+-	for (i = 0; i < bytes; i++)
+-		*ap++ = 0xff;
+-	if (bits) {
+-		uint8_t a;
+-
+-		a = 0xff;
+-		a  = (uint8_t)(a << (8 - bits));
+-		*ap++ = a;
+-	}
+-	bytes = (max_prefix - prefix) / NBBY;
+-	for (i = 0; i < bytes; i++)
+-		*ap++ = 0x00;
++	ipbytes_fromprefix(ap, prefix, max_prefix);
+ 
+ #ifndef NDEBUG
+ 	/* Ensure the calculation is correct */
+diff --git a/src/sa.h b/src/sa.h
+index a848defd..902229af 100644
+--- a/src/sa.h
++++ b/src/sa.h
+@@ -67,6 +67,7 @@ bool sa_is_loopback(const struct sockaddr *);
+ void *sa_toaddr(struct sockaddr *);
+ int sa_toprefix(const struct sockaddr *);
+ int sa_fromprefix(struct sockaddr *, int);
++void in6_addr_fromprefix(struct in6_addr *, int);
+ const char *sa_addrtop(const struct sockaddr *, char *, socklen_t);
+ int sa_cmp(const struct sockaddr *, const struct sockaddr *);
+ void sa_in_init(struct sockaddr *, const struct in_addr *);
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
new file mode 100644
index 0000000000..52d4eb5aa7
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
@@ -0,0 +1,31 @@
+From 6d1a9c5118dc7910667888ef69c3f79379f427ee Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 00:34:58 +0100
+Subject: [PATCH 2/2] IPv6ND: Free routeinfo when it expires (#670)
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
+
+CVE: CVE-2026-56116
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/ipv6nd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipv6nd.c b/src/ipv6nd.c
+index 9264dce7..75655ab1 100644
+--- a/src/ipv6nd.c
++++ b/src/ipv6nd.c
+@@ -1953,6 +1953,7 @@ ipv6nd_expirera(void *arg)
+ 				logwarnx("%s: expired route %s",
+ 				    rap->iface->name, rinfo->sprefix);
+ 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
++				free(rinfo);
+ 			}
+ 		}
+ 
+-- 
+2.43.0
+
-- 
2.43.0


