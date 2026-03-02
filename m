Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37AFD58E73
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:06:52 +0000 (UTC)
Received: from mx-relay06-hz12-if1.hornetsecurity.com (mx-relay06-hz12-if1.hornetsecurity.com [94.100.139.206])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155101.1772435212003726907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=i9UFBHpJ;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.206, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate06-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.134, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1ppkweDUbgX/sUl/9Qkzt9xtvhL1I2/2ti2mbGPMDAo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1772435209;
 b=FxAmfD8OvrIvWRH2NHDrr+KWzhRpp/1pj+KVkWXDNJtVAeMrn6bCAkcwN4bYkNSxPifa+olo
 cESC2FuKFHaYYs8/hf+s6fASU1C0bF4QKi+rBXHgJNa12/lp32aAT9hadC2knNbHUSjxH9M1ePW
 j/GMHwAFReU0dqrwhtVE0iwRnoUH9w1ZRliVO/aDLgKTGY897biygGbn5alUJOAxIE8IDGoTGnj
 ZvIswZweoK94Ue/QhVSJwClTuy1MnZW4shfxkhh7Wy4kR9U3kxGZGF63Ikm6fk51Wxv+liuKO8d
 fzqJdqb93p0ctTeYVFGU8Wuz4FVYfw+IHid57X59PW3LQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1772435209;
 b=fVBdwabH7tTDy2McumiRWGE2sbWgQH7aWOsb4y+baa2QffqbM6OUAe58aUqhjP551+U3gnkb
 u0VQqQyPbOUivb/HrTcCUNZBiFHivV+q2W50ibRxNxT6dPoENsTuEqaloPn9bD22cNkg4l3Mqa7
 uGQy1sw1PgcLmGTQ7GbluSssGFOKXzFBCAqjyioNu5uH0DUdlhqog/+qNmjefwfFJBFw41iDHoL
 Fcpme86dGxcVz/XKnxebj7ZEsMys4CVLUL96ovb76iXuzcAInNmjhRs0ChMHIOpqaiupA/xL4VU
 CrCe5s+NnhalS30Yyk78oQQ9zIB2K7MNFKUCzTzbqSsuw==
Received: from mail-northeuropeazon11022134.outbound.protection.outlook.com ([52.101.66.134]) by mx-relay06-hz12.hornetsecurity.com;
 Mon, 02 Mar 2026 08:06:49 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMwFC8IM6joTgH+DlRCiXdh60+0ZPGLLPvhwiWNA02jQQWEs4tS3pcwDSOpJjQB9N6w/0eyZCKV6nERWZ+/V/m1wtmZIdrDR74vxhHtVU89GR6AGJtM3hTpUMj9wOIZySuQLKfBKnojyWqZR2t5lWX1aF05AIs0VVTRX+I1J7CNAxeeaupuNYs+wOLglSQcz7qHh558HeA+JJZnp9kLIzR2OEKG+fEoj+aem4IsKGvwtMkqUsGWRRH5dgCUA/YjcG8rZGT53rtE1iFC5+0F841WytM9xHOElro/PjzU9jRT+IresU2jrkvbs1Axfe3Kl5K7w6FIpn5ghGL+pZQx3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ppkweDUbgX/sUl/9Qkzt9xtvhL1I2/2ti2mbGPMDAo=;
 b=fpEgJRYZ4xM6Bj/b7+OiEeKcLelbP14Q7u758ZywobeE2mcLPu9sd+K2qG5lixkkCUEoF5nzLwOQxbBtpchDFxZDubLLdenbRxj4XM10r44G9JNdDu6/y1Z/Ug3kO0rsKi/OIvDXn8x1Hj19MvkCW+sg2a4H41KDKLX7SHHDK871g/hPbUjtICQDIG1d32oA9z8nBkkj5i2nE+nfbadDEm6cp6VTO7fYzAjKJP17D95i4piHO0zubF0rmSNwLA8IDoiM8AY7+aNzXHHt4UiFLjRkYvlYXwleiRP0AfQe5XQ8fC658ygsTyVvfZgxOMEOXa6mncsh0q89kq7lzZtLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ppkweDUbgX/sUl/9Qkzt9xtvhL1I2/2ti2mbGPMDAo=;
 b=i9UFBHpJrPTxhvaDYAxDjuJwH52hJwVBx6izKRmN8PJihV+dcme1+0H8QnFoeshBIVY4gSCyc59FolRxravmOCTe5C8rEPHmXRAoECrQk09EEd0qNif1j7CdKxZnL/wQgisS5cd6r9FKkKRN5rQgdhsd3beo7t9k0kEyi/AM0JHmGlokkzeQToLWwBV1BGp4rKFI5Bbeoy8RN4ZPhmOjwsoYZaV2C/ODekXXOY+eJltygi81AmWnSg+SLMTJJeI2OHQb4Bb0yyJOBlLoTsodpB0DriBR4irTU/VhreTSzptuFU9P6WUqdnsNcltNUixE7FaerJqZBWaeHDb+5uR+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VI6PPF8E720A8C1.EURP192.PROD.OUTLOOK.COM (2603:10a6:808:1::219) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 07:06:43 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 07:06:43 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH v2] harfbuzz: Fix CVE-2026-22693
Date: Mon,  2 Mar 2026 08:06:32 +0100
Message-ID: <20260302070632.33276-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VI6PPF8E720A8C1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0469653e-84fe-4ffe-a60d-08de782a42c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|52116014|376014;
X-Microsoft-Antispam-Message-Info: 
	OjZNA6lMyz/uDJyzyrOyZupIFBnNwHbD8HZLKtWUoeR3oSW78fxyeDlMyN29CzaxPtgJf5Ea+Ak/fQ8oLRXFcnAI6ihGXmJ2ST139tPjzH8zXIeTxWfgF1H5zw3faIVo1A19365bVtF7CU0Zzl9gnfLtVZOnX/y+ThfmNrU70NTqKeN6vugZDRy9RY8I7cz/ZhO/ciRchAeobKid4h4OsmSbvQ93qMpKugaRq/Z3exNa+F7NNUCP27WpHN+i17WWG3H1EaLkZ8oAa3pbgS5Op6+gaFKHmnVU1VaY1dL2PPmjxCrpD6UcfH0QuPrztkoqu9EeAHibcF+tDe6+9wQqg5XFdiOcWQSFsOBNx2fjPY8NGcDrD8tzIuX1oghWsloD904wUBe6wixoUPL+z1kklbH0U9rSEvbmqck7+YurlFVEzd+IBMGL5kM71yYoyOxeO/eh+jK+xkgGCWiAdOIzTZ248GIkPKv5d4HoigE5OrW9FWr2FIO6W3eCIaUEQj2ZGfff+QbrxRfUMRlBH4AZjKI5V+vdIP5JLW2fMQRBSnavnjTc27ym4q7kfnTmK8u+IRQdqyifv+ksjrspa51/fYT+XuTdIwqEi2oELAo6JzAmXt8DhESmVXnUWIVMR7dpHAYYiSBCLzSKypbIIshjcYctAxb9xDlwl+KkThkYK/zrBwK40RjWNleGSCD1E99DySjdAAbQbmbqQL+RA9b6ahLdyr3h6RpJUvKLWakZDZY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bf5SzeRCr9Lj1/n+/6B2E1uezJ4wjrGqbvC+fmLUaTxUegYRvRTOwWR0GL7z?=
 =?us-ascii?Q?rsUom1kz1Hg036KW4oddan58vaPsZTuvNR5+uDFLmFs0gQk629hZ6mUbGjse?=
 =?us-ascii?Q?/0AI6VMaSXEpyGdsbMTu20y6D61lWVl0BEmwq/UXPtjE62kh0EFMGD0hKyiR?=
 =?us-ascii?Q?3WIwdcG8403NTAKRTL13iXk67XQ7NLBs5KuSoJzr7of7TH0jJ51bj1QJCYb4?=
 =?us-ascii?Q?BOsP96rLpnmb+ejHxW6Sc7S1KS4nCnp20MXdefA1LWYwCTCPVyGcQKFoWQQe?=
 =?us-ascii?Q?tQNAlR7+UgHCgherGCnB9TFiAmDvwgYRfUAhvFOHkncjerpxj0VCywkw2q9r?=
 =?us-ascii?Q?kLhtq82zpRgcMMDE2/9SFqf5rOj4FzPHeoDhDdsQF8+crTk3DGThxnPpumQN?=
 =?us-ascii?Q?oVFqdlr4AnaG4/nEZoYRfDj1CtvJnkppv0aYLrXMv6OD7yjsa0Wf29ZWdvbI?=
 =?us-ascii?Q?FCA6scvsUpkFgCJdA4l9IUKTlA++pwB5118bc+JZvgQreJXf73X6IdhV6cCn?=
 =?us-ascii?Q?XNv47qhpkBRBKDYUYTwwrnej+lbDXTC7ZLgqDjO7vsypzVXCkEveRCx2/v9/?=
 =?us-ascii?Q?bWEcoCR2O0yNqj/UwpPAanYOOYXuG546CkOecQcGYmEAIyF7G6GqysOrwYBw?=
 =?us-ascii?Q?8vqaZ3Z3p2hPrFgLkzk9wkhp4yIlA8p0sf+yCXPzCERmvZ92tQFhRCzuQvnJ?=
 =?us-ascii?Q?m7aEEWGOMXq5iKWSMVOAcRiVBYJM9/OjiJaIwiBimKBgkwp9vvPSNSvUIdn7?=
 =?us-ascii?Q?kuEWr1HMNIaTwNRGHXTf6TBsAXN5i26jo4e6WRZ45XCoHhT0j+lm2gngRbLI?=
 =?us-ascii?Q?nhKtHMTPZtubSJ1nRNxoDw9UiKHuf35pnwYiX6VzLRhCHIG1nwOvMeBThbN8?=
 =?us-ascii?Q?o4RjiBW9c4sLvE4G7HnE/J521DcTsdsc3nNmQ791jQYtxVXLurt6E16Tm+mI?=
 =?us-ascii?Q?8O/A6HyXshal5nVS7EugvbTEwBQfJIUQcM/wUxEWgfVv9Ui9sLdxf3LllldY?=
 =?us-ascii?Q?ypSf9deRSs9FgJptR7nFe32VTHsM5Hq4s6Xlx3LHjxnpbEEnIcWbTuQxdeKC?=
 =?us-ascii?Q?wO2eBMwlF/dj4lrslCm/RAWOei26HIGlblomVJgb8twv+7SpMepCitp7dFsh?=
 =?us-ascii?Q?Hi6vyd61AGY2EgOcalcJdxP7xzE0zQ5TR/Uc6HRTez9fwK6KR9uQXc6sv7+n?=
 =?us-ascii?Q?E4MHRQAw2HymHI6v0mmq9O5MbN0K2jH5QhJ1gG2JB+AXq1do5Owinr9KNvKX?=
 =?us-ascii?Q?MYWjzot7kuVIxtZS1OIw2TO4d6EIceue92EmeUWBGA3XyzCa0sSxVyZoFDnT?=
 =?us-ascii?Q?C+H7zg0qcKxlHx0gRxLkZ6B/2kDU8xATXd278gG0Zj+znmwKcjEExgLYNyX0?=
 =?us-ascii?Q?9s7rOD4ld68RXYPckUhWXUED2RM2J6Go5LO3w6pqMOtCX9JD3aFqp6FuzkFG?=
 =?us-ascii?Q?TfsMvxA18xNTFxlnQexhF64FFfGvrX5VxU4YFQdaZ0+GeciB/ZEbu54ZD0ed?=
 =?us-ascii?Q?IJVGkW5+mXgimgqN8Cz662HEHoC2zN1F2yr5stxYpu26CS8E0Z5ejUVwuUxL?=
 =?us-ascii?Q?SCY52PSQVRTNMciyOvCdYp6DepKVQMS8UaKO3fVMIwfFK6CWUETt1WIsflY+?=
 =?us-ascii?Q?vr/ti80BRY/rfSg+xXSAvjATo0YDT3j7C/BuWNdcC1axMU4HIfxTCIaHSLdT?=
 =?us-ascii?Q?NzpP2yGKDZtom1un8Fz73dE8n87k72tg2yaLZ1nM/6wlFBBDGJOZNlrslZwb?=
 =?us-ascii?Q?kAkNU10EDGLQBw4B9XWS0EQXc3zeTzSVS/XbJHY0Xm9CxiTGISqnxDsGJn74?=
X-MS-Exchange-AntiSpam-MessageData-1: GlvX3ArCUelFeJ53275Jce68DTKQeuEuKfs=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2WUx8G+IxQrqBgLFotKbXgEE6YUnENJsi5s3JjA6r5jA6L4jKK/4/v29jTJ0v0o/fw/J3KTuvGuQQ8BTmepm+M238SJaW3mO7VHq/sKMk1zxjF24BKUb5lxTsXrgyd3xsClf0aYJlC9KxOmQFwchZsmKb6PmO9N89dlIPGWtZAzAgh4rU9ZUrPlSPUiq2XLSK9nXSxwU3ONQGN2I58vE6b7jbxoYXogYslsS4PcvRg4ps/xBTB6HEn0xNU4tmssv2ortyHdQRaha1hArpgaMw98QU+/l/DRyA6WjBmKxbSsYoQNDR0dRg9dVgvKgDuOpTb51LLI2//nHeZXgrwpTDNN+z9oXdjkKFxm4O9OsCMuNXv8AjHTWbvl/6W19xAjUdQh81Aa3071YMji2S/RDwkmXYEgBRNP6FL31MxGeshKYy5uQRIc6H/QytUYlnpM+gWrhsWZSVsdqn1Uf4aks43cogClCAq9+/MqrVtsm2Yj4g8Ctqi4nPYkLPdnXeLdpM6NR3qjsmMDp8X7n2nF/46ZywhCvMBFvKeqRXwcSVAzvsDw2QxsfvoLqpqNAbr+ggGiPBQmMvC2eJRs6n7w382Q1CsH7ndAnm1nYFpbP+zXw2vNjuAqhK+P62tI6q8fR
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0469653e-84fe-4ffe-a60d-08de782a42c6
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:06:43.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWK3j4FGZVo7L/omBcz+DkfQgfIiGAx8kALA4/tewf5IybtH453/wwc26JnzmHO/1rN78olEPnFvhHyLpYnfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8E720A8C1
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay06-hz12.hornetsecurity.com with 4fPVNQ0712z2LlWw
X-cloud-security-connect: mail-northeuropeazon11022134.outbound.protection.outlook.com[52.101.66.134], TLS=1, IP=52.101.66.134
X-cloud-security-Digest: 41e8bb63af0a271a30902268a7a0d830
X-cloud-security: scantime:1.207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 07:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232183

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch mentioned in NVD report [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-22693

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_8.3.0.bb                |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 0000000000..c57859a7b3
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 95d38abd1293cae1f2aa700a3949288fd2c9a4c4 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index e2e258185..2f7d72700 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1534,6 +1534,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
index d733342682..440ca1043d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
 
 DEPENDS += "glib-2.0-native"
-- 
2.43.0


