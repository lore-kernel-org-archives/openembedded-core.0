Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0C3CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 08:33:02 +0000 (UTC)
Received: from mx-relay128-hz1-if1.hornetsecurity.com (mx-relay128-hz1-if1.hornetsecurity.com [94.100.128.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3845.1780648377838197058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 01:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=VIIAPYga;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.138, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.72.142, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1780648375;
 b=aowzPPF7D7mRcx7qTdBR6iEYrCMAYkNfJOZ7R6y2GPDPEMngmONuvtvxvHPl2+hyEtN3sgx+
 JIVFJiOuNhZapOtt4ehkDakkhbQpIkoi1FT1oMDTz14J/zQAg5o4nTGKPcxEpljOAO9qdGkmPAX
 sHrE6IaOMenPnTaQ50yr4S7A86fVqL+uvaB+Ost4nNvOTquW73Vb1LZwgM+soEwpW1xnDj8aIVY
 407pkq9KuiBETES15Y+Uow7uGs+3F9yNCYSFDsLnkvpOOWG31KjElo7Q0gRaGG+uknor9eqX7WG
 4RinYQfyHJ7FOQv9KRoxtvd7M9Zuro+X6nIVm0474PHcQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1780648375;
 b=QluShEG4UCLiia4lxMxCi9G6PxnTn2658ySnGw0qv+9b14kSKkejfm21gZzmYBqxzFi+3M68
 CEOlZ4fo57NrOliaxw0aoNAOadD3VIMuxHFdqd+UB+dKY9YZzDl38rv29tTsacWOe7Efj85v6HZ
 TyEec3mdc7hdPdavCc5/fVsqYPfxWwDTR7zCttzoEdYY29Bi3+nYFPjfsBXZdi0EyHwdDTC6hrI
 1sguaAaLNQdz3FCrKCDjiwzfqzKkU7Jw9IP+Rezx0FYLsxpfR/Z6nu7iqPzOE+vaGeJ8zNRW9am
 v5cMhLMxUDveItkd7HxgADd29ZApdWCZetgttJhlOggtQ==
Received: from mail-westeuropeazon11023142.outbound.protection.outlook.com ([52.101.72.142]) by mx-gate128-hz1;
 Fri, 05 Jun 2026 10:32:55 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PocEzOZuls6s+4sPPxtTKN3vQYG4UlVjAEc+MuATKFNBwgaYkP1vIVcwMRaCr3XUtKiPhm5iNMuywlZuWsH1acvvE+wNUsfeUdcFVZHoSlD2/4vANWe8o71+LRgCW1ik8P6H9JCkEwxHKt7QU03a6WTA5rlm0aKrWvo5pWuZBAgVg/h2Dza78dUl8O4WZNz0todTJTLQBZiPU525zcze2eaQqbjEmQ+ZB6e8+l2MQeEme8iS+QFAckx/avn2zSGOPgmXUe7Nl2WIC4OlP2BzQen9e6/8Nvkg+jhMdLIfdzeLei6NVVaTVCgH7AU1HpYFMw0EJ0ZdHwX5vrKmCoYtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=;
 b=mUK263+HN2wFjztqmtxhUF3ziPkUuW6MheRLh+6k+bp9FNZHqhOT3iQSogXXq15YehH6RLw0h9IOJiS87jIyk13yqQMaKVdW1LFlN113DBaLAi+Kggbsu7xrThr505dJb2flTgGJDOoXZ8hEIFxKhn9cZ77jpVSklpw1A+PZbAoo2Ax3NKcbGWSUoTVTp/2kvLAlfrCL2eYwEcOcnbjMKAyq1yiOPiKWyPXiVEfYAXWwmh2iTw4YNNvAd//hXtU6qZotYkrRTrYbUs/ee4DZ9yk/+BZQwQhd+ofo4C8x4B00/teVfIspuYTeRZEevtcvb0jnJ4hSgH5rJ70qOAVGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=;
 b=VIIAPYga7XxzoxmQguetqgjfwrzSSMlLW5TMMONQftVfTOsXWANiZsUPQEX6CBL75m1zEOVk6TbTdDrS2apBbx+YO80jECeNYQU4ALIQ04eX4T8K4nAVo/mS1saHvCYI4q10OXyaH6J4Q0rk23bROnPhkXZtMZjovF1bPPPwMACE/KXRP+d1jf3OMd6HIczLyoxNWjL6t+0jldNL3BykIkGcejqm4jEMpecfpfYCls/9RUAp+sJa9VFU7fB3jA1T8QrioB2zc7jncSgsF0H9AzmIv9vINv+3BXnFzIdn5XHZJt2B+LWYKcC2Go0aVQcBXGqBuduCw8tmz2a1fDhEhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3307.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:47 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:47 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH] expat: patch CVE-2026-50219
Date: Fri,  5 Jun 2026 10:32:39 +0200
Message-ID: <20260605083239.1892200-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0262.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::13) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3307:EE_
X-MS-Office365-Filtering-Correlation-Id: c9cd49ff-bf36-4003-34d8-08dec2dd0566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|1800799024|366016|6133799003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	IwzEHJCVUU6wAzbCiVy9V5fd1rOH+EJYmA69vRIW6CMLSNatRe98NaGL4px460ZJpzQFH4swUg4vuZL9wHQVzrSnF+sGWRPvWmPnmP/ZT/OGy3y12koYlmJIuCo4bw4UO6fYxDG5k5OMj50BhcKOf5QiGYR3aV7BSN3gFkwqNnBfsKeovnIqjaexCFyVL/SFZKoxE5g2OMUbDQ0gFYAak0cb+LP6RxbhfH2yNKruyeZy2A0dVVhd/una9cS5bGaUMUTjeENH0v+ZYDVLXSyn237mfYWkZE4y23NNKEBxm9nnRudoLG/74ovX2EwWulEkNQN0M+Nzrp5RQRCw08ZP6odNrD8MMf7/YB6sDjJiWBuYfmiM15Ebf4AXK1Koupv0AdMouqwXLCVnePFskzVLmhIxoX/lu/hJPihfgLAKSvPI/MgNr84FJ5bs1ZFuVf7vv0Md8Ge+uRMkY+hWlrw5qskb9WbbRTU4ldwYwPTBO9XstXCQEeXdrND4vtxa9LY3lXrTJB+hv46ZpUvu8ke2bRogNPgrcz3LX2rN9kklSsHJWiqkSqDRZSZwXM74a8ZpWGd66NpLsSzouTFDg/yklTkg0TpKwjfKAVgVoRNzqG2xTxicmx+bulk1T6ZBo40LjIfCtm2ld9xHxFb46RGFAkQj+HHsavLO4iwFikv884GKEF/arhkRBdLCNz8rEVD6EInepkNEVeUyd0YvicMXIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nMcb1/6Dat7ydAdmsrInikcLGeGgRZ+IR1yOA6hp4rDTxL8KUnTJcJETAdN4?=
 =?us-ascii?Q?Lxs44ywMIGN3QlMiw45VkMg3K2NKyAkZz0E2bN6FPo3d5SpCkD8KuylCf8vs?=
 =?us-ascii?Q?p+AU4mZfbZIbx0saVxPG7TBXnF1ZJogbuN/tVLi4ZyWH+raUMr42fjyH/+te?=
 =?us-ascii?Q?atQcixlOrtdUlCBp0xVUK9KOQXP+ywyJBbe4//O1LESg6eh9sfTysvkFaSTG?=
 =?us-ascii?Q?P5ZVLM3Xdapzv2uDwsSpPB60/ixN6dChQbFooN1l5aTXJxOfwg5Ormh9JU+b?=
 =?us-ascii?Q?xhfdyDG5PlpvD+FyGf9zsqUEsn8j4I13n3k/xqMASTZYNycxGAsFwocYf5/M?=
 =?us-ascii?Q?08kh2tX9AnhriXo06qISOY5L0+dmenvwJgjZozf6owaaVKJcy/Cmj/NfWM7T?=
 =?us-ascii?Q?khcVuwabAyIJa7owp+gTI34r4PMof6bLeM+Wk5VxIZ25vB3z0xI3n7eZcJRz?=
 =?us-ascii?Q?AWT+TSp2oPPgFmeWnLifUvaRzr9/3/pbD90hOwR9o9OaawED6aNXMNNBLTZF?=
 =?us-ascii?Q?jNZNVEfwfbGqfUfxROU7LXRsst5PsTiOQkZ11FrqTbIKpixRFsf/hFVxRO23?=
 =?us-ascii?Q?OWY37Iij2FQwAou0c8b6dS3SzbVfgIot0siA1Y/UWIAiK9aB+atR51A2Lbss?=
 =?us-ascii?Q?4btL6YtK8TNURey6WgpFI1Cvn6kYQQ3L2GkNqfk+6ehDRTLzc0PomY6vE4zZ?=
 =?us-ascii?Q?q2jSxLNVn5ngyXAVTU/6xt8NszMDVWIAZutkHsvZ79aIaa1khrRu16HATawh?=
 =?us-ascii?Q?Qt254cKC/nIeJegWpPkweWLqVI1EkfaldVNTmBBoNPexoc9K3Xe1zRGSnW5N?=
 =?us-ascii?Q?/lZJYPiFBvYB3WOef5fnj60fzTWhlcZbUlAoLMfooL90NXalhy6ta9waGvug?=
 =?us-ascii?Q?K8+cRDUn7UQrTA3IHC4vujYVtQ6Ki2uUVNoI5QUhW/xo6cDotT10ZymvLL+y?=
 =?us-ascii?Q?FB9aCTt2V7TPvg7FXbGb//Ng85Q94swtAF806IJj4mGiGta1WXF7LhC+EyiG?=
 =?us-ascii?Q?+JxPhgFD6EK0yg4Ojkpbiym+ZEaSXfw+Gvh0NenWgCYIbOAcu0j69HwhMISM?=
 =?us-ascii?Q?YOxL/r4cvvWscITdVrJqRGVjR5alN+sdkLNnr77VLhMSQK8ilgYvK9PYTAEc?=
 =?us-ascii?Q?gjiYNqnCB+n3qHz5haZ/p4V6Wd4AhBIerjwLTfRe2Q5VnAVCN/0DiBxCspwB?=
 =?us-ascii?Q?TOgLmmB/CfhklxTccymFqIZ3guX6CLDeMn0srFQoBe0O32nO6chpEA0BeVmp?=
 =?us-ascii?Q?elUcfAjIlG8hx1WbMGKA2XdrqqqOE1FLzNMOk/XlUMIQ8w6lZToQ46rSjOoa?=
 =?us-ascii?Q?dJtpBZqla5X1yqH9pZcT1fCZc61eXAAr2VxK/j+v9XIikFcCCZxNFI5Qp35R?=
 =?us-ascii?Q?B0guMrw9dvaJY+E5m9MFSwY5JVEEFPj2XMe4Nkgb3p+nP/6O8dhEYuy3g2Ol?=
 =?us-ascii?Q?6QzV8PuLAiS6ktmZJ3D2BmuBnUEgsrgf+FNhWJgAX++stKYOzPIdyaCTwFlt?=
 =?us-ascii?Q?R9UTZsVhpizIeDDxGBtFLIZglDIffsZXZBBX2auTAovUFEPteoiEtjfupR6h?=
 =?us-ascii?Q?6RzOPSbDVepXBgR18XdAqnGaaEBM4m3o1WRMwspTghE8Ej445LO1yeAS7N8m?=
 =?us-ascii?Q?raDDYIybsjgGxgdU74EddH6A/PligY1UcK3YRe350KV2Wdv7wXVCG5OcqLmR?=
 =?us-ascii?Q?jmX/GZNWPVcNWIfRBztqarFvioI+/qIamFCMnOm7+WHUFaAG/9MMVmcW9fec?=
 =?us-ascii?Q?rIz2PEmaLD8XdAefi9aWyAYzVLTqvMWV7NP2J6CA3zIJ0MvQLPu0JCzBHKks?=
X-MS-Exchange-AntiSpam-MessageData-1: wU52n9lCu7Y1fA==
X-Exchange-RoutingPolicyChecked: 
	oSuW7VBfRTNaV4RZ/T2Hkl7OQcw/EL6Q8FnpVXFKDXTdV1KjW2GeTYc0DRoSkBIQkM1tv4x5/szBf4Vbdka/7az8nvaHyEyA7i/aOLkXVs2bnq1dBjEDqXrD5RinjfizKsQ3hb6PRu4x9DrizwwKtc9n7Np0HfRPr468YkSzFsZtRlUHDN7KIXrUiP1+jm2uuD4rgL/DKM6QSGjbVAPRkTGMltShpz7kKXBa5b1BCy+RwSjO1M/22vlWyTgL0nvH9n0dsYsk2Qoe+TzbhdUbYiOzTVpXeR8MX3VXEjkiH1wqkfCRFQIzmkXtmJFIZvBALB2/ceDD8SPWUm2orbiYUQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Kp244OFwkw+LS2O3zNtmBHUKFKIgPle/Vw8aHYo/MPyYdEmxiiuP0NJUHrgPh0+VNCZXjb+udHd0wBQZeTrewpeAKUGAeBJsKINZ1MkWnyFmW81ovIrbk3Ct2oNCioq9b0O2mwr68VOThHYcHIpUufS9b2hknlY1Fa/ylHDAT9HAYPA86E9N/gReGgOfzK4BomgdHu4XAjDV63PXDCL+e4RbLLa/8AVxtNIEWALsrEt0wotI1Lq5/VfmeN115O7b4W54OUC33PUz5p6MvQR7l1vfuyj1SgzWvUt0NGSRvZf6XXrwz5LnO+JJaNZUX6qBiMRT2LS8revWxvm5gHh9srMrlSKcSmLJHPg56WE9wonCRRhu0nwnNh9V2Hf8nYZqAcycm5AAsGFnc5BGj+s4bMSGZWBs+PW/SGLkzhURqSWiftciYra9GnSRXRn96fo2gXhHl8x19JW5F2Cf69vA77zaYXWuon6rcwY1DNdqWz5bMly8nqtPhG2C+afDVZyk6+m5h5Rs3yj8ASH5lVt3ei5x4F+qhNoFdptCK0K6EmMkKRa3ZcZ3ryXNojDqRnwO/Qw7J4Xg3ocCuJXimtICjVwxr6IiIlMmwVzAt/FV5fYH6H3vk2Su22K19a0Mvaf6
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cd49ff-bf36-4003-34d8-08dec2dd0566
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:47.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq1tcjyBVP05YQbru7TzRE8MlfuAYVZK5L1EJTwa5meM/x7xgKyR84g/fSkG5OsZG9mMIEQpHrPZHZZ9EMpRLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3307
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate128-hz1 with 4gWvnr4Ss4zvQwR
X-cloud-security-connect: mail-westeuropeazon11023142.outbound.protection.outlook.com[52.101.72.142], TLS=1, IP=52.101.72.142
X-cloud-security-Digest: e6e9f0a8f6e0e92694b9841c7c6a616e
X-cloud-security: scantime:2.262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 08:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238150

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/libexpat/libexpat/pull/1246

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-50219-01.patch       |  59 +++++++
 .../expat/expat/CVE-2026-50219-02.patch       |  82 ++++++++++
 .../expat/expat/CVE-2026-50219-03.patch       |  90 +++++++++++
 .../expat/expat/CVE-2026-50219-04.patch       |  32 ++++
 .../expat/expat/CVE-2026-50219-05.patch       |  46 ++++++
 .../expat/expat/CVE-2026-50219-06.patch       | 152 ++++++++++++++++++
 .../expat/expat/CVE-2026-50219-07.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-08.patch       |  42 +++++
 .../expat/expat/CVE-2026-50219-09.patch       |  42 +++++
 .../expat/expat/CVE-2026-50219-10.patch       |  33 ++++
 .../expat/expat/CVE-2026-50219-11.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-12.patch       |  40 +++++
 .../expat/expat/CVE-2026-50219-13.patch       |  47 ++++++
 .../expat/expat/CVE-2026-50219-14.patch       |  72 +++++++++
 .../expat/expat/CVE-2026-50219-15.patch       |  80 +++++++++
 .../expat/expat/CVE-2026-50219-16.patch       |  44 +++++
 .../expat/expat/CVE-2026-50219-17.patch       |  62 +++++++
 .../expat/expat/CVE-2026-50219-18.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-19.patch       |  85 ++++++++++
 .../expat/expat/CVE-2026-50219-20.patch       |  60 +++++++
 .../expat/expat/CVE-2026-50219-21.patch       |  44 +++++
 .../expat/expat/CVE-2026-50219-22.patch       |  46 ++++++
 .../expat/expat/CVE-2026-50219-23.patch       |  34 ++++
 .../expat/expat/CVE-2026-50219-24.patch       |  31 ++++
 .../expat/expat/CVE-2026-50219-25.patch       |  33 ++++
 .../expat/expat/CVE-2026-50219-26.patch       |  31 ++++
 .../expat/expat/CVE-2026-50219-27.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-28.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-29.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-30.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-31.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-32.patch       |  97 +++++++++++
 .../expat/expat/CVE-2026-50219-33.patch       |  39 +++++
 .../expat/expat/CVE-2026-50219-34.patch       |  39 +++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  34 ++++
 35 files changed, 1731 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-34.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
new file mode 100644
index 0000000000..52c97bf26b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
@@ -0,0 +1,59 @@
+From 2225503f79c10ca8dc27cc338fbf285aa30a3808 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:15:10 +0200
+Subject: [PATCH 01/34] lib: Introduce handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f69d0719bf01596f1d95c9e902f4a279e62c6305]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9bc67f38..e2ed3e2d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -784,6 +784,7 @@ struct XML_ParserStruct {
+   ENTITY_STATS m_entity_stats;
+ #endif
+   XML_Bool m_reenter;
++  unsigned m_handlerCallDepth;
+ };
+ 
+ #if XML_GE == 1
+@@ -1248,6 +1249,23 @@ get_hash_secret_salt(XML_Parser parser) {
+   return parser->m_hash_secret_salt;
+ }
+ 
++static void
++beforeHandler(XML_Parser parser) {
++  assert(parser->m_handlerCallDepth < UINT_MAX);
++  parser->m_handlerCallDepth++;
++}
++
++static void
++afterHandler(XML_Parser parser) {
++  assert(parser->m_handlerCallDepth > 0);
++  parser->m_handlerCallDepth--;
++}
++
++static bool
++isCalledFromInsideHandler(XML_Parser parser) {
++  return parser->m_handlerCallDepth > 0;
++}
++
+ static enum XML_Error
+ callProcessor(XML_Parser parser, const char *start, const char *end,
+               const char **endPtr) {
+@@ -1600,6 +1618,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_parsingStatus.parsing = XML_INITIALIZED;
+   // Reentry can only be triggered inside m_processor calls
+   parser->m_reenter = XML_FALSE;
++  parser->m_handlerCallDepth = 0;
+ #ifdef XML_DTD
+   parser->m_isParamEntity = XML_FALSE;
+   parser->m_useForeignDTD = XML_FALSE;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
new file mode 100644
index 0000000000..80d28e519b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
@@ -0,0 +1,82 @@
+From 63695deacefe467ddf7d4df9ae579f233608a449 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:33:26 +0200
+Subject: [PATCH 02/34] lib: Prepare `m_notStandaloneHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/cdd21e84e150cc2ca961533e157bd52e3cbb4aa4]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 34 ++++++++++++++++++++++------------
+ 1 file changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e2ed3e2d..1d28940f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5450,9 +5450,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+                   entity->systemId, entity->publicId))
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+-            if (! dtd->standalone && parser->m_notStandaloneHandler
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-              return XML_ERROR_NOT_STANDALONE;
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              const int handlerStatus
++                  = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              if (! handlerStatus)
++                return XML_ERROR_NOT_STANDALONE;
++            }
+           }
+           /* if we didn't read the foreign DTD then this means that there
+              is no external subset and we must reset dtd->hasParamEntityRefs
+@@ -5490,9 +5493,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+                   entity->systemId, entity->publicId))
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+-            if (! dtd->standalone && parser->m_notStandaloneHandler
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-              return XML_ERROR_NOT_STANDALONE;
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              const int handlerStatus
++                  = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              if (! handlerStatus)
++                return XML_ERROR_NOT_STANDALONE;
++            }
+           }
+           /* if we didn't read the foreign DTD then this means that there
+              is no external subset and we must reset dtd->hasParamEntityRefs
+@@ -5702,9 +5708,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #ifdef XML_DTD
+           && ! parser->m_paramEntityParsing
+ #endif /* XML_DTD */
+-          && parser->m_notStandaloneHandler
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-        return XML_ERROR_NOT_STANDALONE;
++          && parser->m_notStandaloneHandler) {
++        const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        if (! status)
++          return XML_ERROR_NOT_STANDALONE;
++      }
+ #ifndef XML_DTD
+       break;
+ #else  /* XML_DTD */
+@@ -6093,9 +6101,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         }
+       }
+ #endif /* XML_DTD */
+-      if (! dtd->standalone && parser->m_notStandaloneHandler
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-        return XML_ERROR_NOT_STANDALONE;
++      if (! dtd->standalone && parser->m_notStandaloneHandler) {
++        const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        if (! status)
++          return XML_ERROR_NOT_STANDALONE;
++      }
+       break;
+ 
+       /* Element declaration stuff */
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
new file mode 100644
index 0000000000..687c706167
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
@@ -0,0 +1,90 @@
+From b7e3a0a77f1d62b03f198817668e17a794a56171 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:45:34 +0200
+Subject: [PATCH 03/34] lib: Prepare `m_externalEntityRefHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/1ffe852fe1d8e1d73eb4eb5798456aefc8300299]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1d28940f..07f63928 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3467,9 +3467,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         entity->open = XML_FALSE;
+         if (! context)
+           return XML_ERROR_NO_MEMORY;
+-        if (! parser->m_externalEntityRefHandler(
+-                parser->m_externalEntityRefHandlerArg, context, entity->base,
+-                entity->systemId, entity->publicId))
++        const int status = parser->m_externalEntityRefHandler(
++            parser->m_externalEntityRefHandlerArg, context, entity->base,
++            entity->systemId, entity->publicId);
++        if (! status)
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+         poolDiscard(&parser->m_tempPool);
+       } else if (parser->m_defaultHandler)
+@@ -5445,9 +5446,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           if (parser->m_useForeignDTD)
+             entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId))
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
+@@ -5488,9 +5490,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_NO_MEMORY;
+           entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId))
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
+@@ -6081,9 +6084,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           dtd->paramEntityRead = XML_FALSE;
+           entity->open = XML_TRUE;
+           entityTrackingOnOpen(parser, entity, __LINE__);
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId)) {
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status) {
+             entityTrackingOnClose(parser, entity, __LINE__);
+             entity->open = XML_FALSE;
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+@@ -6873,9 +6877,10 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+             dtd->paramEntityRead = XML_FALSE;
+             entity->open = XML_TRUE;
+             entityTrackingOnOpen(parser, entity, __LINE__);
+-            if (! parser->m_externalEntityRefHandler(
+-                    parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                    entity->systemId, entity->publicId)) {
++            const int status = parser->m_externalEntityRefHandler(
++                parser->m_externalEntityRefHandlerArg, 0, entity->base,
++                entity->systemId, entity->publicId);
++            if (! status) {
+               entityTrackingOnClose(parser, entity, __LINE__);
+               entity->open = XML_FALSE;
+               result = XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
new file mode 100644
index 0000000000..a36f96e16f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
@@ -0,0 +1,32 @@
+From 8d7a4bd5734d401a29f912365e80ee6900f2d877 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:46:36 +0200
+Subject: [PATCH 04/34] lib: Prepare `m_unknownEncodingHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/adcafd4316259ef48b1763e584733a7bff4a8db0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 07f63928..c5aad0dc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4970,8 +4970,9 @@ handleUnknownEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     info.convert = NULL;
+     info.data = NULL;
+     info.release = NULL;
+-    if (parser->m_unknownEncodingHandler(parser->m_unknownEncodingHandlerData,
+-                                         encodingName, &info)) {
++    const int status = parser->m_unknownEncodingHandler(
++        parser->m_unknownEncodingHandlerData, encodingName, &info);
++    if (status) {
+       ENCODING *enc;
+       parser->m_unknownEncodingMem = MALLOC(parser, XmlSizeOfUnknownEncoding());
+       if (! parser->m_unknownEncodingMem) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
new file mode 100644
index 0000000000..78c0b4d68e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
@@ -0,0 +1,46 @@
+From bf93761c4a40fd32d49fcbe96fea58fc8ecf01a9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:05:19 +0200
+Subject: [PATCH 05/34] lib: Register `m_attlistDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/781092f189a8c8e8be6640258829a7f783864282]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c5aad0dc..1551691b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5595,10 +5595,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             poolFinish(&parser->m_tempPool);
+           }
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_attlistDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name,
+               parser->m_declAttributeId->name, parser->m_declAttributeType, 0,
+               role == XML_ROLE_REQUIRED_ATTRIBUTE_VALUE);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+       }
+@@ -5633,10 +5635,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             poolFinish(&parser->m_tempPool);
+           }
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_attlistDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name,
+               parser->m_declAttributeId->name, parser->m_declAttributeType,
+               attVal, role == XML_ROLE_FIXED_ATTRIBUTE_VALUE);
++          afterHandler(parser);
+           poolClear(&parser->m_tempPool);
+           handleDefault = XML_FALSE;
+         }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
new file mode 100644
index 0000000000..6eb1f12ee4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
@@ -0,0 +1,152 @@
+From 2becec67ac41e2fcf8393bb59bf28996ad4fe6d4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:08:02 +0200
+Subject: [PATCH 06/34] lib: Register `m_characterDataHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/5ee607587a997220a48e78b5f6c55a05e50e5b20]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 44 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1551691b..480d9672 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3362,7 +3362,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       *eventEndPP = end;
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, end);
+       /* We are at the end of the final buffer, should we check for
+@@ -3415,9 +3417,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+ #endif /* XML_GE == 1 */
+-        if (parser->m_characterDataHandler)
++        if (parser->m_characterDataHandler) {
++          beforeHandler(parser);
+           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);
+-        else if (parser->m_defaultHandler)
++          afterHandler(parser);
++        } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         break;
+       }
+@@ -3663,8 +3667,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         return XML_ERROR_BAD_CHAR_REF;
+       if (parser->m_characterDataHandler) {
+         XML_Char buf[XML_ENCODE_MAX];
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, buf,
+                                        XmlEncode(n, (ICHAR *)buf));
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+     } break;
+@@ -3673,7 +3679,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+     case XML_TOK_DATA_NEWLINE:
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       break;
+@@ -3694,11 +3702,13 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+          However, now we have a start/endCdataSectionHandler, so it seems
+          easier to let the user deal with this.
+       */
+-      else if ((0) && parser->m_characterDataHandler)
++      else if ((0) && parser->m_characterDataHandler) {
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-      /* END disabled code */
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++        /* END disabled code */
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       result
+           = doCdataSection(parser, enc, &next, end, nextPtr, haveMore, account);
+@@ -3718,13 +3728,18 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         if (MUST_CONVERT(enc, s)) {
+           ICHAR *dataPtr = (ICHAR *)parser->m_dataBuf;
+           XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
++          beforeHandler(parser);
+           parser->m_characterDataHandler(
+               parser->m_handlerArg, parser->m_dataBuf,
+               (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
+-        } else
++          afterHandler(parser);
++        } else {
++          beforeHandler(parser);
+           parser->m_characterDataHandler(
+               parser->m_handlerArg, (const XML_Char *)s,
+               (int)((const XML_Char *)end - (const XML_Char *)s));
++          afterHandler(parser);
++        }
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, end);
+       /* We are at the end of the final buffer, should we check for
+@@ -3749,16 +3764,21 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             const enum XML_Convert_Result convert_res = XmlConvert(
+                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
+             *eventEndPP = s;
++            beforeHandler(parser);
+             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
++            afterHandler(parser);
+             if ((convert_res == XML_CONVERT_COMPLETED)
+                 || (convert_res == XML_CONVERT_INPUT_INCOMPLETE))
+               break;
+             *eventPP = s;
+           }
+-        } else
++        } else {
++          beforeHandler(parser);
+           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,
+                           (int)((const XML_Char *)next - (const XML_Char *)s));
++          afterHandler(parser);
++        }
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+     } break;
+@@ -4643,11 +4663,13 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);
+       /* BEGIN disabled code */
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */
+-      else if ((0) && parser->m_characterDataHandler)
++      else if ((0) && parser->m_characterDataHandler) {
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-      /* END disabled code */
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++        /* END disabled code */
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       *startPtr = next;
+       *nextPtr = next;
+@@ -4658,7 +4680,9 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     case XML_TOK_DATA_NEWLINE:
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
new file mode 100644
index 0000000000..35928cdbfd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
@@ -0,0 +1,30 @@
+From e4c15c4600f0a50fd03b4e23cb79c89a2ce6faa9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:08:40 +0200
+Subject: [PATCH 07/34] lib: Register `m_commentHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/0e7dbfee7912a8e25aace775be47e5ad570b9cc3]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 480d9672..d1258b81 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7178,7 +7178,9 @@ reportComment(XML_Parser parser, const ENCODING *enc, const char *start,
+   if (! data)
+     return 0;
+   normalizeLines(data);
++  beforeHandler(parser);
+   parser->m_commentHandler(parser->m_handlerArg, data);
++  afterHandler(parser);
+   poolClear(&parser->m_tempPool);
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
new file mode 100644
index 0000000000..3691e6728d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
@@ -0,0 +1,42 @@
+From 8e1f2385d561cf1862376759ca85290bd4dba62a Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:14:10 +0200
+Subject: [PATCH 08/34] lib: Register `m_defaultHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/e5b76bd58dd9984cef46c2a66a98b03c95a3c774]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index d1258b81..23cb2c21 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7221,15 +7221,20 @@ reportDefault(XML_Parser parser, const ENCODING *enc, const char *s,
+       convert_res
+           = XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
+       *eventEndPP = s;
++      beforeHandler(parser);
+       parser->m_defaultHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
++      afterHandler(parser);
+       *eventPP = s;
+     } while ((convert_res != XML_CONVERT_COMPLETED)
+              && (convert_res != XML_CONVERT_INPUT_INCOMPLETE));
+-  } else
++  } else {
++    beforeHandler(parser);
+     parser->m_defaultHandler(
+         parser->m_handlerArg, (const XML_Char *)s,
+         (int)((const XML_Char *)end - (const XML_Char *)s));
++    afterHandler(parser);
++  }
+ }
+ 
+ static int
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
new file mode 100644
index 0000000000..781e045900
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
@@ -0,0 +1,42 @@
+From 6852f7b0f8c2ef160aeee1b45d8943e2771cfc68 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:15:01 +0200
+Subject: [PATCH 09/34] lib: Register `m_elementDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b4a711a33591c0d45d6e630ed6448dcbc5534700]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 23cb2c21..3ff60ce4 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6173,8 +6173,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           content->type = ((role == XML_ROLE_CONTENT_ANY) ? XML_CTYPE_ANY
+                                                           : XML_CTYPE_EMPTY);
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_elementDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name, content);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+         dtd->in_eldecl = XML_FALSE;
+@@ -6256,8 +6258,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             if (! model)
+               return XML_ERROR_NO_MEMORY;
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_elementDeclHandler(
+                 parser->m_handlerArg, parser->m_declElementType->name, model);
++            afterHandler(parser);
+           }
+           dtd->in_eldecl = XML_FALSE;
+           dtd->contentStringLen = 0;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
new file mode 100644
index 0000000000..9aac151867
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
@@ -0,0 +1,33 @@
+From 2c3ffbacf4dbe1e71da7ba2bac347ffcca278597 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:15:40 +0200
+Subject: [PATCH 10/34] lib: Register `m_endCdataSectionHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b08e08c0558152a4180597a3e880dc70040c2b2a]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 3ff60ce4..61890253 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4659,8 +4659,11 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     *eventEndPP = next;
+     switch (tok) {
+     case XML_TOK_CDATA_SECT_CLOSE:
+-      if (parser->m_endCdataSectionHandler)
++      if (parser->m_endCdataSectionHandler) {
++        beforeHandler(parser);
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);
++        afterHandler(parser);
++      }
+       /* BEGIN disabled code */
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */
+       else if ((0) && parser->m_characterDataHandler) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
new file mode 100644
index 0000000000..bbb291bf79
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
@@ -0,0 +1,30 @@
+From c5d62ac8641754fc5c176c15afe0314b0ddb8778 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:16:13 +0200
+Subject: [PATCH 11/34] lib: Register `m_endDoctypeDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/bd454febe07b931e638f2186755585b67a738d31]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 61890253..9d8d9de9 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5498,7 +5498,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ #endif /* XML_DTD */
+       if (parser->m_endDoctypeDeclHandler) {
++        beforeHandler(parser);
+         parser->m_endDoctypeDeclHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
new file mode 100644
index 0000000000..0ee5a143d0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
@@ -0,0 +1,40 @@
+From 9510f4cec802ea02c6766e34e823ba4f00d1e4b7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:17:10 +0200
+Subject: [PATCH 12/34] lib: Register `m_endElementHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/e411d9907b8addb334d1ed5db1afd5b5bf625f24]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9d8d9de9..9e95b284 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3579,7 +3579,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       if (parser->m_endElementHandler) {
+         if (parser->m_startElementHandler)
+           *eventPP = *eventEndPP;
++        beforeHandler(parser);
+         parser->m_endElementHandler(parser->m_handlerArg, name.str);
++        afterHandler(parser);
+         noElmHandlers = XML_FALSE;
+       }
+       if (noElmHandlers && parser->m_defaultHandler)
+@@ -3637,7 +3639,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             }
+             *uri = XML_T('\0');
+           }
++          beforeHandler(parser);
+           parser->m_endElementHandler(parser->m_handlerArg, tag->name.str);
++          afterHandler(parser);
+         } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         while (tag->bindings) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
new file mode 100644
index 0000000000..56b6546043
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
@@ -0,0 +1,47 @@
+From faecc1168a844fda20c604365dcf01200dd897ed Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:23:59 +0200
+Subject: [PATCH 13/34] lib: Register `m_endNamespaceDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/274aa82340fe1b2205e8e3ae1cd35e2168cd42e8]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9e95b284..e4c5616e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3646,9 +3646,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+           reportDefault(parser, enc, s, next);
+         while (tag->bindings) {
+           BINDING *b = tag->bindings;
+-          if (parser->m_endNamespaceDeclHandler)
++          if (parser->m_endNamespaceDeclHandler) {
++            beforeHandler(parser);
+             parser->m_endNamespaceDeclHandler(parser->m_handlerArg,
+                                               b->prefix->name);
++            afterHandler(parser);
++          }
+           tag->bindings = tag->bindings->nextTagBinding;
+           b->nextTagBinding = parser->m_freeBindingList;
+           parser->m_freeBindingList = b;
+@@ -3840,8 +3843,11 @@ freeBindings(XML_Parser parser, BINDING *bindings) {
+     /* m_startNamespaceDeclHandler will have been called for this
+      * binding in addBindings(), so call the end handler now.
+      */
+-    if (parser->m_endNamespaceDeclHandler)
++    if (parser->m_endNamespaceDeclHandler) {
++      beforeHandler(parser);
+       parser->m_endNamespaceDeclHandler(parser->m_handlerArg, b->prefix->name);
++      afterHandler(parser);
++    }
+ 
+     bindings = bindings->nextTagBinding;
+     b->nextTagBinding = parser->m_freeBindingList;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
new file mode 100644
index 0000000000..9ff3e03b13
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
@@ -0,0 +1,72 @@
+From 7790f829712eb6ecb60f8a325f81017a6073c1a5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:25:42 +0200
+Subject: [PATCH 14/34] lib: Register `m_entityDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/6e62649e6b25eb789166b9131dfadfe9d806f5ce]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e4c5616e..c2d3ef60 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5700,10 +5700,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           poolFinish(&dtd->entityValuePool);
+           if (parser->m_entityDeclHandler) {
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_entityDeclHandler(
+                 parser->m_handlerArg, parser->m_declEntity->name,
+                 parser->m_declEntity->is_param, parser->m_declEntity->textPtr,
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+         } else
+@@ -5721,10 +5723,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ 
+           if (parser->m_entityDeclHandler) {
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_entityDeclHandler(
+                 parser->m_handlerArg, parser->m_declEntity->name,
+                 parser->m_declEntity->is_param, parser->m_declEntity->textPtr,
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+         }
+@@ -5802,10 +5806,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (dtd->keepProcessing && parser->m_declEntity
+           && parser->m_entityDeclHandler) {
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_entityDeclHandler(
+             parser->m_handlerArg, parser->m_declEntity->name,
+             parser->m_declEntity->is_param, 0, 0, parser->m_declEntity->base,
+             parser->m_declEntity->systemId, parser->m_declEntity->publicId, 0);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       break;
+@@ -5825,10 +5831,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           handleDefault = XML_FALSE;
+         } else if (parser->m_entityDeclHandler) {
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_entityDeclHandler(
+               parser->m_handlerArg, parser->m_declEntity->name, 0, 0, 0,
+               parser->m_declEntity->base, parser->m_declEntity->systemId,
+               parser->m_declEntity->publicId, parser->m_declEntity->notation);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
new file mode 100644
index 0000000000..648ee4ef8d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
@@ -0,0 +1,80 @@
+From eef385983d91a4675cc992ee1352e7093cbffffa Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:45:50 +0200
+Subject: [PATCH 15/34] lib: Register `m_externalEntityRefHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/d4ba1c29165de39605b799223392dfb28bed85d5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c2d3ef60..830d5963 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3471,9 +3471,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         entity->open = XML_FALSE;
+         if (! context)
+           return XML_ERROR_NO_MEMORY;
++        beforeHandler(parser);
+         const int status = parser->m_externalEntityRefHandler(
+             parser->m_externalEntityRefHandlerArg, context, entity->base,
+             entity->systemId, entity->publicId);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+         poolDiscard(&parser->m_tempPool);
+@@ -5484,9 +5486,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           if (parser->m_useForeignDTD)
+             entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+@@ -5530,9 +5534,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_NO_MEMORY;
+           entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+@@ -6136,9 +6142,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           dtd->paramEntityRead = XML_FALSE;
+           entity->open = XML_TRUE;
+           entityTrackingOnOpen(parser, entity, __LINE__);
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status) {
+             entityTrackingOnClose(parser, entity, __LINE__);
+             entity->open = XML_FALSE;
+@@ -6933,9 +6941,11 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+             dtd->paramEntityRead = XML_FALSE;
+             entity->open = XML_TRUE;
+             entityTrackingOnOpen(parser, entity, __LINE__);
++            beforeHandler(parser);
+             const int status = parser->m_externalEntityRefHandler(
+                 parser->m_externalEntityRefHandlerArg, 0, entity->base,
+                 entity->systemId, entity->publicId);
++            afterHandler(parser);
+             if (! status) {
+               entityTrackingOnClose(parser, entity, __LINE__);
+               entity->open = XML_FALSE;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
new file mode 100644
index 0000000000..52541b642e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
@@ -0,0 +1,44 @@
+From bf963b8553bb11fcf4f42da91c7a0311265d3990 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:27:13 +0200
+Subject: [PATCH 16/34] lib: Register `m_notationDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/4739ad3fda250cf458d396d9c17a0e0fef571bdd]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 830d5963..a16cd70b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5949,9 +5949,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         if (! systemId)
+           return XML_ERROR_NO_MEMORY;
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_notationDeclHandler(
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_curBase,
+             systemId, parser->m_declNotationPublicId);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       poolClear(&parser->m_tempPool);
+@@ -5959,9 +5961,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+     case XML_ROLE_NOTATION_NO_SYSTEM_ID:
+       if (parser->m_declNotationPublicId && parser->m_notationDeclHandler) {
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_notationDeclHandler(
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_curBase,
+             0, parser->m_declNotationPublicId);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       poolClear(&parser->m_tempPool);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
new file mode 100644
index 0000000000..97b3a52ff9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
@@ -0,0 +1,62 @@
+From cc21091dc63dbe984ea15872ce80dec2a4021517 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:34:29 +0200
+Subject: [PATCH 17/34] lib: Register `m_notStandaloneHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/d7a9c975ceeaa24c730e50fef2bedff5f99d2172]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a16cd70b..4c4708d5 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5495,8 +5495,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              beforeHandler(parser);
+               const int handlerStatus
+                   = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              afterHandler(parser);
+               if (! handlerStatus)
+                 return XML_ERROR_NOT_STANDALONE;
+             }
+@@ -5543,8 +5545,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              beforeHandler(parser);
+               const int handlerStatus
+                   = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              afterHandler(parser);
+               if (! handlerStatus)
+                 return XML_ERROR_NOT_STANDALONE;
+             }
+@@ -5766,7 +5770,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           && ! parser->m_paramEntityParsing
+ #endif /* XML_DTD */
+           && parser->m_notStandaloneHandler) {
++        beforeHandler(parser);
+         const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_NOT_STANDALONE;
+       }
+@@ -6170,7 +6176,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ #endif /* XML_DTD */
+       if (! dtd->standalone && parser->m_notStandaloneHandler) {
++        beforeHandler(parser);
+         const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_NOT_STANDALONE;
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
new file mode 100644
index 0000000000..6ce48b881a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
@@ -0,0 +1,30 @@
+From 66b312e7ff31f5c824863210ca70710d7b200011 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:35:08 +0200
+Subject: [PATCH 18/34] lib: Register `m_processingInstructionHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/8bb00d345d5f92b17a06e01a926ee1dda797e0af]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4c4708d5..407d7e0d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7207,7 +7207,9 @@ reportProcessingInstruction(XML_Parser parser, const ENCODING *enc,
+   if (! data)
+     return 0;
+   normalizeLines(data);
++  beforeHandler(parser);
+   parser->m_processingInstructionHandler(parser->m_handlerArg, target, data);
++  afterHandler(parser);
+   poolClear(&parser->m_tempPool);
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
new file mode 100644
index 0000000000..b1af834e1b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
@@ -0,0 +1,85 @@
+From 3a187b3b2690763b88a2b77655033b279a511dcd Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:36:39 +0200
+Subject: [PATCH 19/34] lib: Register `m_skippedEntityHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/64e3adf0c9d7e1846cff784de3159f1067eb5e06]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 24 ++++++++++++++++++------
+ 1 file changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 407d7e0d..fbf081d0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3441,9 +3441,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         else if (! entity->is_internal)
+           return XML_ERROR_ENTITY_DECLARED_IN_PE;
+       } else if (! entity) {
+-        if (parser->m_skippedEntityHandler)
++        if (parser->m_skippedEntityHandler) {
++          beforeHandler(parser);
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
+-        else if (parser->m_defaultHandler)
++          afterHandler(parser);
++        } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         break;
+       }
+@@ -3454,10 +3456,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       if (entity->textPtr) {
+         enum XML_Error result;
+         if (! parser->m_defaultExpandInternalEntities) {
+-          if (parser->m_skippedEntityHandler)
++          if (parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, entity->name,
+                                            0);
+-          else if (parser->m_defaultHandler)
++            afterHandler(parser);
++          } else if (parser->m_defaultHandler)
+             reportDefault(parser, enc, s, next);
+           break;
+         }
+@@ -6131,7 +6135,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           /* cannot report skipped entities in declarations */
+           if ((role == XML_ROLE_PARAM_ENTITY_REF)
+               && parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 1);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+           break;
+@@ -6802,8 +6808,11 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+       } else if (! entity) {
+         /* Cannot report skipped entity here - see comments on
+            parser->m_skippedEntityHandler.
+-        if (parser->m_skippedEntityHandler)
++        if (parser->m_skippedEntityHandler) {
++          beforeHandler(parser);
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
++          afterHandler(parser);
++        }
+         */
+         /* Cannot call the default handler because this would be
+            out of sync with the call to the startElementHandler.
+@@ -6936,8 +6945,11 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+           /* not a well-formedness error - see XML 1.0: WFC Entity Declared */
+           /* cannot report skipped entity here - see comments on
+              parser->m_skippedEntityHandler
+-          if (parser->m_skippedEntityHandler)
++          if (parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
++            afterHandler(parser);
++          }
+           */
+           dtd->keepProcessing = dtd->standalone;
+           goto endEntityValue;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
new file mode 100644
index 0000000000..f5a8ba24b1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
@@ -0,0 +1,60 @@
+From 3074268d4d1eb1aa36a7df823f40d631fd98175c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:37:49 +0200
+Subject: [PATCH 20/34] lib: Register `m_startCdataSectionHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/222278ad452d27f8c35ba031be14d6e70aab5ab1]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index fbf081d0..b6370ea1 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3700,22 +3700,24 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       break;
+     case XML_TOK_CDATA_SECT_OPEN: {
+       enum XML_Error result;
+-      if (parser->m_startCdataSectionHandler)
++      if (parser->m_startCdataSectionHandler) {
++        beforeHandler(parser);
+         parser->m_startCdataSectionHandler(parser->m_handlerArg);
+-      /* BEGIN disabled code */
+-      /* Suppose you doing a transformation on a document that involves
+-         changing only the character data.  You set up a defaultHandler
+-         and a characterDataHandler.  The defaultHandler simply copies
+-         characters through.  The characterDataHandler does the
+-         transformation and writes the characters out escaping them as
+-         necessary.  This case will fail to work if we leave out the
+-         following two lines (because & and < inside CDATA sections will
+-         be incorrectly escaped).
+-
+-         However, now we have a start/endCdataSectionHandler, so it seems
+-         easier to let the user deal with this.
+-      */
+-      else if ((0) && parser->m_characterDataHandler) {
++        afterHandler(parser);
++        /* BEGIN disabled code */
++        /* Suppose you doing a transformation on a document that involves
++           changing only the character data.  You set up a defaultHandler
++           and a characterDataHandler.  The defaultHandler simply copies
++           characters through.  The characterDataHandler does the
++           transformation and writes the characters out escaping them as
++           necessary.  This case will fail to work if we leave out the
++           following two lines (because & and < inside CDATA sections will
++           be incorrectly escaped).
++
++           However, now we have a start/endCdataSectionHandler, so it seems
++           easier to let the user deal with this.
++        */
++      } else if ((0) && parser->m_characterDataHandler) {
+         beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
new file mode 100644
index 0000000000..22d03381c4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
@@ -0,0 +1,44 @@
+From ccb6591176850f051aefc05225d0e9ea1c5ee516 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:38:47 +0200
+Subject: [PATCH 21/34] lib: Register `m_startDoctypeDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/82f1d14a033f7c5bd6f658c3cdcd2515efe86745]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b6370ea1..f2ccd00c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5394,9 +5394,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     case XML_ROLE_DOCTYPE_INTERNAL_SUBSET:
+       if (parser->m_startDoctypeDeclHandler) {
++        beforeHandler(parser);
+         parser->m_startDoctypeDeclHandler(
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctypeSysid,
+             parser->m_doctypePubid, 1);
++        afterHandler(parser);
+         parser->m_doctypeName = NULL;
+         poolClear(&parser->m_tempPool);
+         handleDefault = XML_FALSE;
+@@ -5463,9 +5465,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ 
+       if (parser->m_doctypeName) {
++        beforeHandler(parser);
+         parser->m_startDoctypeDeclHandler(
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctypeSysid,
+             parser->m_doctypePubid, 0);
++        afterHandler(parser);
+         poolClear(&parser->m_tempPool);
+         handleDefault = XML_FALSE;
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
new file mode 100644
index 0000000000..065cfba5de
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
@@ -0,0 +1,46 @@
+From 749611ae3b7785d5b4fd679b41ee8b6503556c10 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:39:38 +0200
+Subject: [PATCH 22/34] lib: Register `m_startElementHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/4f9a8f1cc2ed03cd9e23d281a6abac44dc89e8ab]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index f2ccd00c..70f01e95 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3549,10 +3549,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+           = storeAtts(parser, enc, s, &(tag->name), &(tag->bindings), account);
+       if (result)
+         return result;
+-      if (parser->m_startElementHandler)
++      if (parser->m_startElementHandler) {
++        beforeHandler(parser);
+         parser->m_startElementHandler(parser->m_handlerArg, tag->name.str,
+                                       (const XML_Char **)parser->m_atts);
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       poolClear(&parser->m_tempPool);
+       break;
+@@ -3578,8 +3580,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       }
+       poolFinish(&parser->m_tempPool);
+       if (parser->m_startElementHandler) {
++        beforeHandler(parser);
+         parser->m_startElementHandler(parser->m_handlerArg, name.str,
+                                       (const XML_Char **)parser->m_atts);
++        afterHandler(parser);
+         noElmHandlers = XML_FALSE;
+       }
+       if (parser->m_endElementHandler) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
new file mode 100644
index 0000000000..69b5dd6b2a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
@@ -0,0 +1,34 @@
+From bbdf4565ffc47aba55fea3379245d01e626dd229 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:40:13 +0200
+Subject: [PATCH 23/34] lib: Register `m_startNamespaceDeclHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/ddd0238420113c97594083194e517e8bc742700c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 70f01e95..1ae77aae 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4617,9 +4617,12 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   b->nextTagBinding = *bindingsPtr;
+   *bindingsPtr = b;
+   /* if attId == NULL then we are not starting a namespace scope */
+-  if (attId && parser->m_startNamespaceDeclHandler)
++  if (attId && parser->m_startNamespaceDeclHandler) {
++    beforeHandler(parser);
+     parser->m_startNamespaceDeclHandler(parser->m_handlerArg, prefix->name,
+                                         prefix->binding ? uri : 0);
++    afterHandler(parser);
++  }
+   return XML_ERROR_NONE;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
new file mode 100644
index 0000000000..5e83b776c4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
@@ -0,0 +1,31 @@
+From e763c4db3ea639bc435ca7eaf5ae94ae4beed17b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:46:47 +0200
+Subject: [PATCH 24/34] lib: Register `m_unknownEncodingHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f66d83c9aecaa802174f95a1348a89f56e3b9441]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1ae77aae..9c5433cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5022,8 +5022,10 @@ handleUnknownEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     info.convert = NULL;
+     info.data = NULL;
+     info.release = NULL;
++    beforeHandler(parser);
+     const int status = parser->m_unknownEncodingHandler(
+         parser->m_unknownEncodingHandlerData, encodingName, &info);
++    afterHandler(parser);
+     if (status) {
+       ENCODING *enc;
+       parser->m_unknownEncodingMem = MALLOC(parser, XmlSizeOfUnknownEncoding());
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
new file mode 100644
index 0000000000..9c0370a3c9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
@@ -0,0 +1,33 @@
+From be50a6cd7ac802c27f370c0b9c61920738b33f94 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:41:00 +0200
+Subject: [PATCH 25/34] lib: Register `m_unparsedEntityDeclHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/6e7c5af75a743c609fdb35627554cc7e940e6593]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9c5433cc..ea29489e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5855,10 +5855,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         poolFinish(&dtd->pool);
+         if (parser->m_unparsedEntityDeclHandler) {
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_unparsedEntityDeclHandler(
+               parser->m_handlerArg, parser->m_declEntity->name,
+               parser->m_declEntity->base, parser->m_declEntity->systemId,
+               parser->m_declEntity->publicId, parser->m_declEntity->notation);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         } else if (parser->m_entityDeclHandler) {
+           *eventEndPP = s;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
new file mode 100644
index 0000000000..0e87a361f6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
@@ -0,0 +1,31 @@
+From 9e21ad00545e6ea8a02773d4565eb3b2b16eb171 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:41:38 +0200
+Subject: [PATCH 26/34] lib: Register `m_xmlDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/91484ffb98ec138df79265e431a55823bc80c6c4]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ea29489e..f1ba05cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4971,8 +4971,10 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+       if (! storedversion)
+         return XML_ERROR_NO_MEMORY;
+     }
++    beforeHandler(parser);
+     parser->m_xmlDeclHandler(parser->m_handlerArg, storedversion, storedEncName,
+                              standalone);
++    afterHandler(parser);
+   } else if (parser->m_defaultHandler)
+     reportDefault(parser, parser->m_encoding, s, next);
+   if (parser->m_protocolEncodingName == NULL) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
new file mode 100644
index 0000000000..3f4b1ec9ed
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
@@ -0,0 +1,29 @@
+From 98218922a1bc94d6eb8371fb7f18abf0e2a76f08 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:35:27 +0200
+Subject: [PATCH 27/34] lib: Protect `XML_GetBuffer` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/5d90d1aebfe606af2550e92983cbe121d7eda032]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index f1ba05cc..e7642d8f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2533,7 +2533,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+ 
+ void *XMLCALL
+ XML_GetBuffer(XML_Parser parser, int len) {
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return NULL;
+   if (len < 0) {
+     parser->m_errorCode = XML_ERROR_NO_MEMORY;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
new file mode 100644
index 0000000000..f9564ec175
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
@@ -0,0 +1,29 @@
+From df1172fd2bc3e3be5319e788cb99867bebe6d3c5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:32:38 +0200
+Subject: [PATCH 28/34] lib: Protect `XML_Parse` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b59f1865e6c0c0ab2c1623b9dfd53aa6fb85bb96]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e7642d8f..7234cc89 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2356,6 +2356,8 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+       parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
+     return XML_STATUS_ERROR;
+   }
++  if (isCalledFromInsideHandler(parser))
++    return XML_STATUS_ERROR;
+   switch (parser->m_parsingStatus.parsing) {
+   case XML_SUSPENDED:
+     parser->m_errorCode = XML_ERROR_SUSPENDED;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
new file mode 100644
index 0000000000..d67bb1462b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
@@ -0,0 +1,29 @@
+From dccaa02c0193fbc5fdc0cf5991fa6d1400715fc8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:33:44 +0200
+Subject: [PATCH 29/34] lib: Protect `XML_ParseBuffer` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/ef3267d5f8157862e33d87c45c6fe82ac26e557f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7234cc89..769eb10a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2467,7 +2467,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+   const char *start;
+   enum XML_Status result = XML_STATUS_OK;
+ 
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return XML_STATUS_ERROR;
+ 
+   if (len < 0) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
new file mode 100644
index 0000000000..57dca36e6a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
@@ -0,0 +1,29 @@
+From c905fb91906554ed8132c2b11738c2bbdcafaf42 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:21:28 +0200
+Subject: [PATCH 30/34] lib: Protect `XML_ParserFree` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/827fbddcaaa8ba2171ef76a3223d6f403388635c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 769eb10a..4d2cedac 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1939,7 +1939,7 @@ void XMLCALL
+ XML_ParserFree(XML_Parser parser) {
+   TAG *tagList;
+   OPEN_INTERNAL_ENTITY *entityList;
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return;
+   /* free m_tagStack and m_freeTagList */
+   tagList = parser->m_tagStack;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
new file mode 100644
index 0000000000..de693a448c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
@@ -0,0 +1,29 @@
+From 9e9a6f2de2b9bd399011dd1685b235e0c580f312 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:22:41 +0200
+Subject: [PATCH 31/34] lib: Protect `XML_ParserReset` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/34bc7e080a1b432ad9d6879a6c718f2d6f12fa22]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4d2cedac..0294d71f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1655,7 +1655,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   TAG *tStk;
+   OPEN_INTERNAL_ENTITY *openEntityList;
+ 
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return XML_FALSE;
+ 
+   if (parser->m_parentParser)
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
new file mode 100644
index 0000000000..cdd40ad521
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
@@ -0,0 +1,97 @@
+From 2e706f49a9d764e1170706acca686e17af82c095 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 13:37:01 +0200
+Subject: [PATCH 32/34] tests: Cover calls forbidden from handlers
+
+[ make void* to XML_Parser conversion explicit ]
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/2e16f4c98f1f28bb9da36108b60c181d77752acb]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c   | 24 ++++++++++++++++++++++++
+ tests/handlers.h   |  4 ++++
+ tests/misc_tests.c | 15 +++++++++++++++
+ 3 files changed, 43 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e6582231..b5118347 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -1978,3 +1978,27 @@ accumulate_and_suspend_comment_handler(void *userData, const XML_Char *data) {
+   accumulate_comment(parserPlusStorage->storage, data);
+   XML_StopParser(parserPlusStorage->parser, XML_TRUE);
+ }
++
++void XMLCALL
++forbidden_calls_character_handler(void *userData, const XML_Char *s, int len) {
++  UNUSED_P(s);
++  UNUSED_P(len);
++  XML_Parser parser = (XML_Parser)userData;
++
++  assert_true(parser != NULL); // self-test
++
++  assert_true(XML_GetBuffer(parser, 123) == NULL); // i.e. rejected
++
++  assert_true(XML_Parse(parser, "", 0, /*isFinal=*/XML_FALSE)
++              == XML_STATUS_ERROR); // i.e. rejected
++
++  assert_true(XML_ParseBuffer(parser, 0, /*isFinal=*/XML_FALSE)
++              == XML_STATUS_ERROR); // i.e. rejected
++
++  XML_ParserFree(parser); // rejected
++
++  assert_true(XML_ParserReset(parser, /*encodingName=*/NULL)
++              == XML_FALSE); // i.e. rejected
++
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NONE);
++}
+diff --git a/tests/handlers.h b/tests/handlers.h
+index ac4ca940..47623910 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -607,6 +607,10 @@ typedef struct {
+ extern void XMLCALL
+ accumulate_and_suspend_comment_handler(void *userData, const XML_Char *data);
+ 
++extern void XMLCALL forbidden_calls_character_handler(void *userData,
++                                                      const XML_Char *s,
++                                                      int len);
++
+ #endif /* XML_HANDLERS_H */
+ 
+ #ifdef __cplusplus
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index cdcdd507..5e490faf 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -742,6 +742,20 @@ START_TEST(test_misc_no_infinite_loop_issue_1161) {
+ }
+ END_TEST
+ 
++START_TEST(test_misc_calls_forbidden_from_handlers) {
++  const char *const doc = "<doc>Hello world!</doc>";
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_UseParserAsHandlerArg(parser);
++  XML_SetCharacterDataHandler(parser, forbidden_calls_character_handler);
++
++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -773,4 +787,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
+   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
++  tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
new file mode 100644
index 0000000000..dda72a311e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
@@ -0,0 +1,39 @@
+From ea59c2c53276eb44526244def65a7be8f0d617ac Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:41:46 +0200
+Subject: [PATCH 33/34] doc: Document that `XML_ParserFree` and
+ `XML_ParserReset` must not
+
+.. be called from within handlers for the same parser instance
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/cdeb65e1c4570861ce91c529e934a1f1d9629b3f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ doc/reference.html | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 8f14b011..fad5e1ab 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -1095,10 +1095,12 @@ dealing with any memory associated with <a href="#userdata">user data</a>.
+ <p>To state the obvious: the three parsing functions <code><a href=
+ "#XML_Parse" >XML_Parse</a></code>, <code><a href= "#XML_ParseBuffer">
+ XML_ParseBuffer</a></code> and <code><a href= "#XML_GetBuffer">
+-XML_GetBuffer</a></code> must not be called from within a handler
+-unless they operate on a separate parser instance, that is, one that
+-did not call the handler. For example, it is OK to call the parsing
+-functions from within an <code>XML_ExternalEntityRefHandler</code>,
++XML_GetBuffer</a></code> as well as the two cleanup functions <code><a
++href="#XML_ParserFree">XML_ParserFree</a></code> and <code><a href=
++"#XML_ParserReset">XML_ParserReset</a></code> must not be called from
++within a handler unless they operate on a separate parser instance, that
++is, one that did not call the handler. For example, it is OK to call the
++parsing functions from within an <code>XML_ExternalEntityRefHandler</code>,
+ if they apply to the parser created by
+ <code><a href= "#XML_ExternalEntityParserCreate"
+ >XML_ExternalEntityParserCreate</a></code>.</p>
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
new file mode 100644
index 0000000000..54a512d621
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
@@ -0,0 +1,39 @@
+From bcb2de3b2b03bb67c892dc3c6ac51795c5fb50a5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 14:01:51 +0200
+Subject: [PATCH 34/34] Changes: Document CVE-2026-50219
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f17ca46befb59098da339ed6d2438de3bdece8b5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ Changes | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/Changes b/Changes
+index 4265d608..b8755c15 100644
+--- a/Changes
++++ b/Changes
+@@ -30,6 +30,19 @@
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
+ Patches:
++        Security fixes:
++           #1246  CVE-2026-50219 -- Disallow calls to functions
++                    `XML_GetBuffer`, `XML_Parse`, `XML_ParseBuffer`,
++                    `XML_ParserFree`, `XML_ParserReset` to guard e.g.
++                    Expat bindings from memory corruption;
++                    this CPython issue is related:
++                    https://github.com/python/cpython/issues/146169
++
++        Special thanks to:
++            Asher Darden
++            Matthew Fernandez
++            Yousef Shanableh
++
+         Security fixes:
+      #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amounts of
+                     dynamic memory from within an Expat parser (e.g. previously
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 151720a9e3..cda545d624 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,40 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-50219-01.patch \
+           file://CVE-2026-50219-02.patch \
+           file://CVE-2026-50219-03.patch \
+           file://CVE-2026-50219-04.patch \
+           file://CVE-2026-50219-05.patch \
+           file://CVE-2026-50219-06.patch \
+           file://CVE-2026-50219-07.patch \
+           file://CVE-2026-50219-08.patch \
+           file://CVE-2026-50219-09.patch \
+           file://CVE-2026-50219-10.patch \
+           file://CVE-2026-50219-11.patch \
+           file://CVE-2026-50219-12.patch \
+           file://CVE-2026-50219-13.patch \
+           file://CVE-2026-50219-14.patch \
+           file://CVE-2026-50219-15.patch \
+           file://CVE-2026-50219-16.patch \
+           file://CVE-2026-50219-17.patch \
+           file://CVE-2026-50219-18.patch \
+           file://CVE-2026-50219-19.patch \
+           file://CVE-2026-50219-20.patch \
+           file://CVE-2026-50219-21.patch \
+           file://CVE-2026-50219-22.patch \
+           file://CVE-2026-50219-23.patch \
+           file://CVE-2026-50219-24.patch \
+           file://CVE-2026-50219-25.patch \
+           file://CVE-2026-50219-26.patch \
+           file://CVE-2026-50219-27.patch \
+           file://CVE-2026-50219-28.patch \
+           file://CVE-2026-50219-29.patch \
+           file://CVE-2026-50219-30.patch \
+           file://CVE-2026-50219-31.patch \
+           file://CVE-2026-50219-32.patch \
+           file://CVE-2026-50219-33.patch \
+           file://CVE-2026-50219-34.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


