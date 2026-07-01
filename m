Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8789C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:38 +0000 (UTC)
Received: from mx-relay48-hz1-if1.hornetsecurity.com (mx-relay48-hz1-if1.hornetsecurity.com [94.100.128.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41943.1782902910636740344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=dBfcRCja;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.58, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate48-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.159.129, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=RcnhjLd/1JBcmuJwRiGP7ABE/azG3PDDmEVLTiTLrJ4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902908;
 b=PbfL6gX5bb+gMWiDbBESC4SCBpGLdF5agGPNU24laE8og3M2Gs9JprCwlxXeUxgdAMkgbhjw
 GJTFTqnh9rGXCVnjbiBqvG6MHn64zXeueJW1pGdIZS2684BXfPvW+wwNTHRlis/on1q5seyLZt4
 0cilfLAOSWYQXHkGYuQP2/QfGeAVf69uXvPuK6bbDpmGHtjMoJIxPlzp/8hyx1aY9dEyG9NM+0q
 wBnI1yIVT20PZxumtGyj3OK3FFq6ZmzOO9FyZvkYnCJHsLrkMSII0gp83qfJDFGyKAxIPsAzAPP
 SMVnxTh3qteEThLSUiOb0/KKiBaTVkSokH0/8s/GR2XMw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902908;
 b=OHF8VXJ5aXrUH4EPo8sq8UWZPbrq+FxvxuH04O9SOrUY71c+DsqGdDngXskD2rDSgdWsrq/A
 vPozwQwrDcNSdEu7JONLYWVUiDhvP2rC/PXiXU8vZQ3TmD8E0QUqbC7TCrQwyHEciKi41fhohqi
 RuDhq5rYQj4B2THqynC8ORhi8zvka08vINflzLwPbw8A40jTXJIwFuQOlhbHwLO+NaegNYL13lv
 7rllknN99PLjUJ3+Bkv+F9vcc3HsyPrqWVcMi864Xc60juHOF6PhZnR4l/qzRLi0WiGNrssIc/p
 rNjmYT8ZxJWW4+2q/WIzl8HoWP7aDp+DXFR6UCTzb3i3Q==
Received: from mail-norwayeastazon11023129.outbound.protection.outlook.com ([40.107.159.129]) by mx-gate48-hz1;
 Wed, 01 Jul 2026 12:48:28 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBqvZ+s6hEo3AmQmdxebY3Uui9XnUQgtEyJ6CReS1Dfao3EQ/XGa1gAG6pflTpxWdiqm/GRa1Z9szoLhuuSUYh3VURQ4hTg5wvmZGPKam1VF0cJdRfc7E7DaSzVPDVId2B8Nf4vkMNc+v/NlqjptRfyIT1e+MbYPu/AzDcgeBT4X2BIRdXwrCCG3jliMDnJrgrlf2IYPKLGmcgr6t7nOs9tW+OKyS8DQxQAnI7mkeCeYcluVxSJjLCY/hVIghXMI6w7nCKbnQO12mFvCpTxItN/WycVLY8CIN/kt7x51KOROYv2oyxmVzURFYaicXoMIhc9tAA6Q+ORruGLYEE/Z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcnhjLd/1JBcmuJwRiGP7ABE/azG3PDDmEVLTiTLrJ4=;
 b=WVyvA7nJe9GDjiSijFCGr6pX8NDEuXRSTTf9R9WcCDfbYynP6pqDTe+6Tt8K5QuDBK53ZSKNP0m471e5n1o7cC3Au7Yh0G/6EYssdoBWErR6E4XqHkI/kAiO3hUC6PY6SDvLl4h/+Rx+4cuCN3XQ04nOY7Uut2bjoMkVZRLKvP+OdTKyAqMG8tH1QG6mVj9pEE7H5bvj6YylAnrC0RWgNa9r5bGcm5v917Ch0drYCsypGENRYvfyj8yvQ3L4j0APeJIBdo2u076rK3srlwfr5+M1X6gWmKHzXlbbVR9bB0mKDvDkDPJ8oSQr3hut7A7f97FvAFAaDT6iLr2YAxW9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcnhjLd/1JBcmuJwRiGP7ABE/azG3PDDmEVLTiTLrJ4=;
 b=dBfcRCjaomiRQROAVu159BfeOnbvGRmlC4GcTZw3wOZ/UCq23WPgonam9aZletpPMrgt1R6+u1f9360vgchB8XuGyO5YSKNBseHXmElKRJXuzHqOIhXkHOeTF3DLq7/Zyyl1o/J+IjRiNwKlksWQATo9rAtnOTDLxBRt/XTLZLdbpL8Q+pzfyCP5KsEBF7xUxKjuHcOYeKj8+0mBiM9OyMS6TbZWG1cvMOlIhNUl9d+P0+lvJapUEktBY4hyXpoId11Da7/nxYSPiByXgokdZiF7R4AGalRqaqmBYsKpc++Mun2Zed8U3Z/xvUinUaRod9qOol9ngcArejH31IukLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:19 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:19 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH 2/4] dhcpcd: patch CVE-2026-56114
Date: Wed,  1 Jul 2026 12:48:06 +0200
Message-ID: <20260701104808.3577244-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
References: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 46df89fa-b5d9-482b-e64e-08ded75e4351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	E2h3nK3fDLQnOqtWRFgmAVRBzeylvdLaWCFioDY4EFg1taOnSaoj03rRaUmQuqnoxLyLYN51zJEvj1M7VPmlF6lfR38OCjNNac8nfs1CXYbEJenX5O6ajg80hQvn1xrQyus7i+Qec/lF4dUVtwBuFCM81AtEeWYJOYe8zf9rl5xq/rUWAJrS/uNP9Gc1ShR9vo+h6wVyHCpkBf2mbnpmWfutIi/EngIQoAsrkD7zYv8/W+ko2kfyWBNz/zcO9rvWmthCpkCyeFzwGoX4tieusLOpQoj/j1b+b9QJj95aeq65kn+YVDNKcYIf+fh7iRFMtosjQj7M2davnazPQylRaf4W3Q3aarr4HmqGOAa9A9Twr+Aw5tbgYwM/oywvgQsjyU4ykx1A6RMHFyny5v+vkkzO0SuXh/sYkdBu4Vgz21Ac6rRDrXciUwX4OSbZKoWPVCzwtQb9OgYjpsicIlnKAYrE/JoYlyvw5TiTYTooOp2jU/od6GOltWfvQOuxiYEsmBdI74ZZAFIUmc4gq00Czolt3P2O5UjFGoGvCcG1AOVFbkZqqbyMu2zl5tTBlS42Xd6KC2YOzD/A4ePW6k5+pYkuhZGEi4KUgbgkQa/IkHRLq5sPKzkF0oe6tFTv96zXNphzilAEZMNbFo06kIVDILdzeX8qu2ssp70eXkequ00=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SgU1vpY1ft53qa6KxwFYij8vrXuYeOnoR4sy3kjvN/22m9QYBIV09lI+II8B?=
 =?us-ascii?Q?gq1XsO0YiSAipml0dfQsamh5+jT6yy/+0LE8E4aXZmCtGCFkEcmrb00jSPIY?=
 =?us-ascii?Q?8bTbOFc5+NnNjrHOstcrYbWUiuLoLlH7Fko4rXLdE9YHZennKCSEFPCGUx8L?=
 =?us-ascii?Q?sBoH/aWHhzSYg6sIEecqR9gwNP722dDtX/qoD/20FKJ9sO1AtqiqHzYdFbgJ?=
 =?us-ascii?Q?dBYwUu9B7PkmVMn6JZpi4hfwZYwHGtPg2j1rmcvca7DfZflIvZ1P2R9Xt7qC?=
 =?us-ascii?Q?yiofgcJOh6Ys75WZdTItJ8puVRVdTqpWLOHULvNity25iNiyQzorCPffnKVZ?=
 =?us-ascii?Q?YG5Pz3umAkt7XeyAUdUuiPAIOJ1IgzNn7W1W1PIv3njYSfXxVn12gLDzEpRV?=
 =?us-ascii?Q?F+/6PFXhnauqhGFahd78y9Ti2pni2zh6K+yoIN8i4Y/FxFzFkYJKdgrGmIO+?=
 =?us-ascii?Q?imj4Gq17xvEKQjx1+P9LXKCB60JJX6bvDeS+MOzJD+/jXMLzKXaHoV/ovKJu?=
 =?us-ascii?Q?CYQhuEdiM/6a1K4mFmsD4juA10dmOysDen5yMCgV1YdRpNa8zs2G5hr3vb0h?=
 =?us-ascii?Q?u0vyu6rGik2sNieUFt25RCL3q74nPez8ajH9cOiFFTG831M5qmx6lGtd83Uq?=
 =?us-ascii?Q?NTWrF4crYX3aeUrHI6MhU8V/8wOO6RiYc9Vn3FKhYeocNLDQXMpxwbzacmLn?=
 =?us-ascii?Q?jyVyuHdCgWCld0D+qMyXWFL/176Z2QQyN5g85Ej2UgbNc28BHGOiRIJE5/jX?=
 =?us-ascii?Q?MVkwlZE8bj2e65fUhOhsasBoi6dtkyQ021GfgmWqH9w3VsvPHxddTwJ+oPPT?=
 =?us-ascii?Q?0UAY4nefdJh0klRxuXDqovpVrZu9WfqgsYnCzD/Cup7Kv/9YdLkFzReQCB9a?=
 =?us-ascii?Q?Lyohk5k2r+XzGPAa3+/aaR4mMvPLYdZdnkKyw38fRKcrPZAhXKtlOKKvHEqn?=
 =?us-ascii?Q?iD7PPQNpNJPDgfZFRSNJuvX3QHGXv50BmoWZMoASJVb6993FIcoLzZMh3eF+?=
 =?us-ascii?Q?yxR5IoNzgB64lSY6+Vfx61m/Xttl2KVlIP2CVokvs6yPRdGAnNUnyIcfSURy?=
 =?us-ascii?Q?4pqiHIBB/he+CIiQauuvot3N2/ge9QzSOrDSVTrd/FcXpo0jIpG7IT7g03vz?=
 =?us-ascii?Q?6Dxer8r3TN2yMq6x8l7WUeUFAco2GFGpLlhqfksCqYkP509GWQyVp22/1MkT?=
 =?us-ascii?Q?l4Muato8toB/B5soENqy3KkoasZKBeccYb9TC8tjfXGnTTkXbCceK9MDdENh?=
 =?us-ascii?Q?oj9mNeKS+q3DOk8XcJcqHG4jPwLpmuJdZzb+r70vVgKK/n3NyTt2mnRG4sPl?=
 =?us-ascii?Q?jfxGu7M5JNYv68v+PLqiNKPZSVTSOWFL3nItmZT5eLYHoHmNROCtZ+FBpsyS?=
 =?us-ascii?Q?yexOEl/ABGZucNS0aXKekOjcpLRwEkdgdM5/Suiwrnw5nV5AF92xVyyyqCoz?=
 =?us-ascii?Q?LmHECkSCtsmZVKIizHaBXCPpfLfMFAicCcKTFnwfXRAOVhd4MHrhpYXL93Iy?=
 =?us-ascii?Q?rdOncsYq73yeuH72nE8hIR8YeHqRSHqp1Ie0Og2bjCRcQmbED8qo5xg0V8aI?=
 =?us-ascii?Q?FdcINVWkGH/aKwJwUaCOtBrze5+i+WON17yM5QJjBeoJ5FcIJUdChg8gmRii?=
 =?us-ascii?Q?asbypSvHLz/Qh1yZ59y4X+2i/BPyDYd0za2UVxytEwYiWDpqooNJzFgic/tI?=
 =?us-ascii?Q?nxvW2Q/4xNM00ogGrgufvVaWn3Z5g7uJS3waEo0KkuuQKpJxm4IzknVgwTFV?=
 =?us-ascii?Q?CIhSLTP7Oz8JMFG8XC/HgLQWQ7PCNhjFD5ZRvrADVota4aaxtLwY2Si+okHm?=
X-MS-Exchange-AntiSpam-MessageData-1: 5OuKTQVwOmQ7zA==
X-Exchange-RoutingPolicyChecked: 
	naz5Xihcf57oyiS0B42Mq7Z3qwoEt8RRljEnlRzgzYI/NZyPve3KnTr9JfwWvi6KHolTyWlVfYuZbXV119UphmdjCjxQTZ2euSDM3Z00zXKTazYdK3LgsR+Z6/dV6thamdHkcw3khbm/2b8a6+d8o9M988nDweC/Ivsm3W9sL4/lymEah3NouOceMOv/2HE1sJPx53IsQcoc2/qQGjlJxajE7ko4GjQWgWxYQXG4ZZK42JPwvb+pvIXNXLr77pEhZ6cH7u5lTdU/cO0D3Sal5UHyZNRPj5RnqvC5amnS1TXXaIYXkckOXxNX4DVF3lCAo7GMcPJi+IaEFZlpVqCKXA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wLZ52pIvqMmqIlQCSCydgfsJsIDyla8VcoDIwbEsu2hvxsvHLZ0nKNKlriGYu6fugj5y3N0sDaLr3GJFeDBeng5uv4OCOoAeWkH81YRcrgjoYs9+Zsq500DYg0/iGXEp2MrdwI3IMDTYzA0mhMVsaAfWL0ijQUm6OEa86hO7ED5cphb+7misAU8AXctxlp3FojiiaPbr+ZJwS52wQirbopt7Ph/XIUg/xD7b40HP6ubK1oZGPvSbMiV1akUPTkYuIlZyoptPEqS+KT46xd4gVXjPGe7qftPdV+q/aj7VTJJr2JtuFRfG5cBdoqe0+RbGGwyQP0CReLETD1loCs9PLzLj2tzx9e1RTCKyBwpEOpwm/KDExBrF91nkTvMi5I9vawZVnPJ+PKhq6Svi+3RU0rmjOWtkZExtH1+/7ch0eIl0NYTn1m59lOuAkos7BNjmMC0ZcXfIseW6b+WbI0s+P0Nz6Qu6JT42VpVPVRs/ZlRWBncgcDcGSJ68Wer8hYmiBcNsmh/jiewg2vrDoj7yiFWJ6lkh/AnMOSY1Hwq/4CAVX8U3wRvOvQ5RNY7pYQlUwCf88X+A+ORaMmlHq1W/4DdwRtcti3BVstlM44wr4uPFo5VrFg01uryOgpxVKgfq
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46df89fa-b5d9-482b-e64e-08ded75e4351
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:19.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhPMiJGtDbUBNs4hypa34lvwS4qdt7qDyddPud+pLcgbe0kU2unMpkgcM34fZim6dAMdKmnHyW7OKn5V95Qmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz1 with 4gqxZK0dRcz1wsnV
X-cloud-security-connect: mail-norwayeastazon11023129.outbound.protection.outlook.com[40.107.159.129], TLS=1, IP=40.107.159.129
X-cloud-security-Digest: 867109f42f86a8faf4df0e83121ab9e0
X-cloud-security: scantime:1.345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239968

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index b348c895e8..8195cea029 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 0000000000..0c2be7edfc
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From 94766be134a053d88670377c70d3bdfc68b5db4a Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 8a8a20a0..5e497cfd 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1093,7 +1093,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+
-- 
2.43.0


