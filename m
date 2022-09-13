Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517EFC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 11:28:49 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.80])
 by mx.groups.io with SMTP id smtpd.web09.3667.1663068521948052524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=mwp3IqVs;
 spf=pass (domain: vaisala.com, ip: 40.107.0.80,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akA53MUNInC5Qz8tMyKIsuB5wO3Vxw4Oj/Cqeg+iaTUUAMlJ1JJvYiieO9wueFA3V4FkZEcttq2orgXbBzy+sn6WJdoB+ygVdNG57CKhL38zdrHNMVShDVrtz40OUqy+a3U11J2yUtoAqB5TcbQMtifKKhROCAkIVdk6BqnSsogUacb2BmFhILmnOwZXjrVXhTmKIW87PlPK0e7yhraOfaaYNzom7GjpgrkZTMafOeBHQ2iQ+GyWN7AJRwxxZwuh/6ivszbgHn4+hFPjoXjmWGG9OnXt69jGdmeKUDxBEKHYAtADJyC2wTSkPHUAnvxRr/XJdm8jv1Oz21IunfxS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJNX++68u/JReuLLyKa4oxy869+Lx29N2JRl1AGhR9M=;
 b=iskvX9Yfe2UKguWd8JDpn6x58jgGXaF/I6F0lTGEQoCDMr4cQPe65SbVdlztKptW7VsW1sPrngDd4YraPUMNngZUgpKClRy3qH6MNO3VY7jEWJ+ga0UEGy526AK9ESQPi2U1SzmSdLdYa1uo79PjOLinenw5uFx2+Lx0/2gmCIT1VwRONLOvnr7ZYrqvfkB4ym/QxkEJIta35JoqImL+aCTJU2Prlpgq5MUee//7ybFOBexSgpzRzQBwKLkv4vjGosxMtUrG2ZkZ4i55fZT+Dhz3H4bFTlzp9A26dyk+CZHDhdkH2DKnNAlHOJdTp2CS9ezfReMs1awTHH7wwdIaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJNX++68u/JReuLLyKa4oxy869+Lx29N2JRl1AGhR9M=;
 b=mwp3IqVsIqpKol7Y/wW/KKlX1UGNfekE5YQ5f4c5FPf2vohZ4M3mtniu5AOUj5BLS3Xrd2ISFacEDu4YzKkSl2BvdJXFk6iqy6y4XEGDXAcdxHuZxuLSOT/Gb0yo+g1+hXTgErYji8+sw59rV33DCf2ENoifePsPeD5WjJo9Gmi2rkR7xSrYnCYAjmmc1alegA7cqkj/YP6lBNT7+tqL5gAp1C34UHcU2MGnZGCaA2vLvfNXJ4gErm6J1FkrRyiN+4BSaxZBdz2rCvmFB3f5XbilKbpVId534uAc6d5uX37WqCYdo9YGHNShLR2lbzT7OHNn1uRCxGwu0HDuJ9LYVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PA4PR06MB7279.eurprd06.prod.outlook.com (2603:10a6:102:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 11:28:39 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:28:39 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] systemd: Fix unwritable /var/lock when no
 sysvinit handling
Date: Tue, 13 Sep 2022 11:28:27 +0000
Message-ID: <20220913112828.1458038-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::18) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PA4PR06MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: ddeca2ec-cd76-4365-bbb3-08da957b1afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HiwahDAwq2Eghve7djpW71QOUar7RFSuXXs28TtBFuNU8iYMUWDFp/+Wq44NmOs8qW7esJ+BnUeo7ZULsteynzijiCn0fuMntakxR9ZmQ8T79N0bgKi9ct2DE6DNrq51DOWmfJ7jUh7LTI3xRCZHGALUrXh02A/u4MlYmJLUp0J6B7LcwohyFV/1ltj+kiKkcuKOzo6LpIkM9vLr0uw9OhYcy+cYaCLz/qpt53dRalfVPUYneyoMnoln7pGJ5ei8UGO9OU72ofE7fNLjyiN7kEbBBrkF8iN1Xv8XBD2H+AkgGWLrA5FMXRElFcyLJAO7cTb7VKIEjX0fxr5MnfCcvsUEBrMvwG8YCIYJARLUyrn5NBntKs7zFsmw8p3ZSyBfunHZ8G5pu2kY51zBGeS9Ji7Gqw980wK7F2NKRjaVlFhUl9jeQua8wlm184b38TvpQpJtBXwtjYqFwUuLlLaOQrgIJFoTxZTnOtGqMubzoddNzBWQ7xnI26+N0e+0nAWG/wWygiwGE5CHweahj/crDgxkIaHximZp3LTt+LXgQHYTqxpMfOg++5fLBGwYPtUH+3b9ec+bQ5Jgp8yYi6QUPcVshMQbtDYo8mXoodeRQDBbY7+8oonTe/FREhjv7c4r25DfzNGJBhaSiVSAWODAqypJhb+URD+Dt0w8fDu18wetapeXWeyX1wiV5DMqSrzNQclTADWjySvO0UOEdB7GUiFzajgNiUVPcSzkrTUxAK0jc6buJB3HFdF2/jLpTIEzd8ZI4IYr/u475GIrSG52oWZvpp9r8fo1oG7zBOPF4kg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39850400004)(396003)(136003)(366004)(451199015)(478600001)(66946007)(41300700001)(4326008)(26005)(966005)(36756003)(86362001)(2906002)(186003)(6512007)(6666004)(66476007)(2616005)(6506007)(8676002)(6486002)(6916009)(316002)(54906003)(44832011)(66556008)(8936002)(1076003)(83380400001)(52116002)(38100700002)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HcpM3Yj6Eymyi20iivhic9SwY6pQ4oMasaIPO9CfWuzIp1+13vkV8U4VVPys?=
 =?us-ascii?Q?Hn9u2gKxri+qeESQVJs6mJiVGttVey8pbnTbXv/lAkNheIAeaBWutcAksboe?=
 =?us-ascii?Q?Uxi2RRWwOcp+Y64/HzGgSz2NHRLizVClIWTraHwErpnQgWRPbXeBInhJTucK?=
 =?us-ascii?Q?0cfySetzGeAh9okg3T1cLmFBgYMdhEk8zX50ClBGlL7yNfcqCIEQ2jaMC+fl?=
 =?us-ascii?Q?QgrEr8bTlSbNqZLwS8iNat4vKXbrZlY4NAsOjDTxsnIGnEYZItpofyUwXqh9?=
 =?us-ascii?Q?M8sAfTvsNEWTju3U6svJeLGFO0uCaB21tWO7GrWvEIW0Z3+6UB2TXlegJWtk?=
 =?us-ascii?Q?FkuzaPpWg9+IuFDVMNlrvIVVrZ7jHd4dyxyM/Fsx64Afuf3C6WFNQdNy/D8v?=
 =?us-ascii?Q?zc+iuKIBPUX8vSse05KPz2WujThdLel63TEVVxs70Gc23VmRtQPak55Ga2jl?=
 =?us-ascii?Q?cAxQKN9LMMDqvDEODwnBKigyFCOKdbQ870lhCG0JgghvUWUL8MEGe5bd2fEW?=
 =?us-ascii?Q?d2t8XSfhbcnotO+PdPuWztExq8WW53llmE4/vxogrePfNasiTZW7FjZBmd2k?=
 =?us-ascii?Q?8nRXjYcLCLrgSzCCkZC9IFN4bbS6F80tf03VUr26Cmz6grdVXBAqLNlO0EzP?=
 =?us-ascii?Q?Q8EtnG3qnxV6c45Cpjx04DAf/Si+M4PIYZt8MxawbK74zU1tSdIeLefrtBFG?=
 =?us-ascii?Q?mQLkMn4DfNPN+v29A+TW+1v1L1U4WrFbNsve6zom9ZUeMfOH51kaSmTMLUdu?=
 =?us-ascii?Q?CReHYdeeUf+skDUw9Mk1DTo+v50zzL1rEVtwEOCR5opapZy59TSvLzhfCjNG?=
 =?us-ascii?Q?5VhJVoccQ2mJauCJMU3AIIY+imwE5lNkF+9O2I9fmwDyCe69sIBq4caaWRHK?=
 =?us-ascii?Q?CS4KsSoZTxrlmvqzDfzBKz9QmqeZLe1x+D9JwvYIMsApJ9WBmP4KCx5YbDpE?=
 =?us-ascii?Q?AM2fOicGfBgpFwPFf+mbovryUBMb9YHF0NDnryyhFgAt4JaepU9fL/KiF8IW?=
 =?us-ascii?Q?D4MAyjiyh4eKgMAZsxblR2wfbM5JgW+CEFzOD0xWcdgVn9AFVkRxdGhIvpUn?=
 =?us-ascii?Q?8FScZKr1q+GG3Lpl/xwhdtZdxc+x8KpDHEATgthQeQL4TQjgtSaY3+Zz+mAV?=
 =?us-ascii?Q?KMa+2/4BoWiSF5PcBKeXnAouVcMzTAgvojnbAW9n9XDZGfVnpMxB0u/qwtqW?=
 =?us-ascii?Q?S6MQa1fa/mW/J0sJK9QVpsNEMpz8CPKbihpd2+ZkiSwvt4krcSleCFxjR6aU?=
 =?us-ascii?Q?tirLX91+tE9h2fj2OtO1NiGztQ5/qhCGSNGKZfiynuLdhe+sBYQE3vYbtipT?=
 =?us-ascii?Q?yxQJsQ3fkGAqgRseIIV86Uf5Lrk4h1qhwTj/63hWPZN/1sTU/29KzPo4rxXH?=
 =?us-ascii?Q?dJr429XVQwNnD0t5z52D1f2iWbdv1ep8pEQmavM/7VWcBgX9YqR1Ie+d2JcO?=
 =?us-ascii?Q?GmLv6lqfzHn6o7ZBZ1l35PaJBxexaX1NOXt1jvAGo7geGMZy9Cjzo149aZSO?=
 =?us-ascii?Q?gEzWKM+ynOpmGFACfyNNWBD3UlCGYxCvKRieXKj+t99B7bHl+kwsVyknaKVz?=
 =?us-ascii?Q?av3PTwMVt22ffDd4wOQVqFtQqq6m+4k32YHPWM4Bjx1vADFz4ar8EoFntEji?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddeca2ec-cd76-4365-bbb3-08da957b1afc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:28:39.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ejbsmRlPeVDQtcjhMq3APsEZa45ncnksDgBYodDNdIcRdLM5Nw42CwmKvJDttIN57mPL5goFDRPMxSMteqRgeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 11:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170572

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Commit 8089cefed8e83c0348037768c292058f1bcbbbe5 ("systemd: Add
PACKAGECONFIG for sysvinit") decoupled enabling of systemd's sysvinit
handling behavior behind a distinct PACKAGECONFIG feature.

This new option affects among other things the installing of
tmpfiles.d/legacy.conf, which is responsible for creating /run/lock
directory, which is pointed to by /var/lock symlink provided by
base-files package.

In case the option is not enabled, then base-files provided /var/lock
is a dangling symlink on resulting rootfs, causing problems with
certain Linux userspace components that rely on existence of writable
/var/lock directory. As an example:

  # fw_printenv
  Error opening lock file /var/lock/fw_printenv.lock

Since Filesystem Hierarchy Standard Version 3.0 states in
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s09.html that

  Lock files should be stored within the /var/lock directory structure.

Ensure the /run/lock directory is always created, so that lock files
can be stored under /var/lock also when 'sysvinit' handling is
disabled.

(From OE-Core rev: 85e5ee2c35cf5778c3aefda45f526e8f6a511131)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf
index 87cbe1e7d3..c4277221a2 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -3,5 +3,6 @@
 # inside /var/log.
=20
=20
+d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
--=20
2.35.1


