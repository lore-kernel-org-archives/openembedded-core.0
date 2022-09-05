Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019A5C54EE9
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 12:26:43 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.51])
 by mx.groups.io with SMTP id smtpd.web09.23942.1662380797452048291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 05:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=YsJqffPH;
 spf=pass (domain: vaisala.com, ip: 40.107.15.51,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtHHwdlfdjhHpytoRaw3sxvjFQMS5ljJq2DlD5DfxchdRoGNUle3fKoPfGC1gUiftBUpIdZWISpMg5Y2NWwxZQaDCWuRrgitDR52ZsIQl9JX8yw5YpisExrkDbBQ308ag6n05rKhMOG2gt2i+5txWpy7WQL5xzfq+YaEPbBw/hXI4+93lKyzxkn/mJrURJ6NFTJUyia2wNkQlGNDtfS9K2/AErfy/PHNYz1I9Ujnl+7AM2iZdhXLSbZ7OCrx5sD0CMdZ6ULFlRkFljAJpedehcpb9CmbqEy42cBUspDZjoYiOTv62TrySrAl2wAgLmfXec99/wKcCHXypfw1OTyfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4EZa0jULNs4bP/RLpDjmq50aYv1p+IRGDXPW6MQDFY=;
 b=OacmDAAGevKlSe8hMwQq6sLkn38UwsrrnbGsFTpBy6TfPvtLjWGWpR70gGa+HCflOjD7HR/rC4iuOMblN2oi6jvz5iZ9M8FSOxB4yD4S1ufb/QVw2K+Li0T+lQYoBr6z/zQLgokzD9Q1aKPv4TX0JdBA+6mkC27LL+uGK84HNcOJnLZ0a5l9SL5HTAxUI3GxuOEzQ6RWq2V94XlnhRZpEac4LM18W7SnPCC53fCaaK8a+MCHsFGqYFH8OGTszatxNpxgNm+aVZOSh59DsTpUAmdKMx8PYQYXYjIJAuRo2xI+bteTpoQ1s6etBYLhqBS6YErN+P+RM0wm+LMI5QBh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4EZa0jULNs4bP/RLpDjmq50aYv1p+IRGDXPW6MQDFY=;
 b=YsJqffPHfNJfdmZSl1NVdAvrvVmwHjN4pBGqritOQOMJQxXwT5VAl9cHToJRrmj+vKB+/1LIghBsKoY95sfOXqyZaULKz1eL7EubPl+o0u9iwMpjIFTC0PzAZdQr6KPR2WcmeZ97BoRk63AnQT7S9GCFtrE0Tr7KkUSF8xMKRk81zCdIhWXZRiKw/ABXWtGD0MhsQ+aDxoGtYUXCA1bLsSartrUyd+Ub0iYXR4/e+IZBrWJoxZjYqEUNbHP7tnpMYBvOMmVc2vxEJYlKjQz9ZVwxcXhrbyQukaP4qsCFkde/hrVs2JOQd2Ym8Zfk5DbsKkem9kmOsqmuZwkr+0LNPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by VI1PR0602MB2816.eurprd06.prod.outlook.com (2603:10a6:800:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Mon, 5 Sep
 2022 12:26:33 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030%3]) with mapi id 15.20.5588.010; Mon, 5 Sep 2022
 12:26:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] systemd: Fix unwritable /var/lock when no sysvinit handling
Date: Mon,  5 Sep 2022 12:26:11 +0000
Message-ID: <20220905122611.3957244-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0109.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::12) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be3f84f-491e-4d1f-a86a-08da8f39de6f
X-MS-TrafficTypeDiagnostic: VI1PR0602MB2816:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oKscPBv4CHJLz0kyTNWj1W8ifh1OCZc+8dPfEQCkZVeIyOQ4VMzhjLOsGpy36e7AMhZgtFmG2WIRR861LbaLYupWVd1SWkWbd1dfF4V86CHcte4euulR2oWCR6ldWzJ/gjash01qgRj4TuVVZ1dunj+nry4E0ywgBh3W+vVoFAgkz8m9o4yIMJHZRlwCHybdMP19ztPBcajL99FOYoHbUxfPG3fP61wwz1arpap3w6N2G9rm8y6Pw0Vm+YJRRuxI3oUYR8oMUemW+4G0EgUSuw/+RqRM6SW1VljiLrfRyDmx1a6VfkJ7LsgUPNRf/ARvp12dvbDs6FBDFYQcG9PV7N7qwtE1aEICwgXrNFnQ4POvFFW4GhA7Y2jAYCaThzx1HQPgVV/RqaubRv+79QUolZJ678Cw9GxVW+ViEbyIVjKAwb3jGKA4DVtbDsbBJ4rDymg2urgDrzqZuCVPHabaQ2L3Zs5gGUm4cXOSDtUWl9HbJma5d/INgOzw0zLE7v4YhK3oGAsju56YGCTzld52jb7cJkoJqK1mV2cyCgPJLSSqeBjOsgLcut+DnnK1D/CAw+P4GGE8QN28agbzBe/j7Og35ZAxGE8raEcsVKaEbXzr5ZXPgjNPxzQnX/QaTGQrZAstHvIuPB33+NwJ18xYmiOV34/t+vzWPcW9rOcsbVybo+rCvydcM3pKEzx7FI0Pf1CAe4v1kp7X+SdLVZQ6x29cMWgaslePqxwCJwXQj8gHC3v9fcqYxOCdW4aKQdWX+E5XqQY5xfBRSyeoRxUIh6loJxpVjg7+oWppGzQEbk0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(6666004)(26005)(2616005)(5660300002)(6512007)(1076003)(186003)(44832011)(52116002)(8936002)(86362001)(36756003)(966005)(41300700001)(6486002)(478600001)(6506007)(107886003)(83380400001)(4326008)(38100700002)(6916009)(2906002)(66556008)(316002)(8676002)(66476007)(38350700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nx5AaDQraQ7ZtFlLGHNt//qNbUh4dl8tJTTl7KS4ao4X6x7TQnpeYndrMzp0?=
 =?us-ascii?Q?YZUEq58SWlhJoZx0E2UngKjE0+zTKA5WCtVmzKmEAGuJ0IN3jsuqlKJaso5P?=
 =?us-ascii?Q?ezYygEVgYoEF23v3MfH8IjPkoLsHCr7ox1jTU0iTP8NZAGyBjwudgf2cLdjw?=
 =?us-ascii?Q?iHBe3B9ZLKhtLqAc17yjrogESdrLsutx7tGBC2lol+pDhk9/A7Zj86Rxqo9V?=
 =?us-ascii?Q?Nixs9k73CrPwlJevwUyeNbCv3uUibBR8p8B6srg2hoE1kwA7oBJGu2Qs6Ign?=
 =?us-ascii?Q?Nc0lqG24709AK03UIhuh5k33pBdkQjUP5pft/FgmoXcJyvNemvDZzk233qGP?=
 =?us-ascii?Q?A6Zscf2JOiIS8+vkHLr/crED6mUZlBaM8iY9qGQU8S5mmHO9x9mvL3gA4jaE?=
 =?us-ascii?Q?oFO+D/eBojLXXcUQqpuXzr8OA92oH2DY1mD/jLZsD4jXtykU+0sFVmqzSJev?=
 =?us-ascii?Q?M4zateMHj5pYy4wrFawsjlN3RT2QOs3IrOM5LY6Fu2+7rZqsYs5kfTjV1dK+?=
 =?us-ascii?Q?4CMSiKjxTd45xZKmcmuFeHQ8d//Xp6I6sGJWSN93oVLEAWpIPN3NinMCq+Ia?=
 =?us-ascii?Q?g5q7OcEyjbqGXqcL1uHmqkpnZXQZ6qDaB/pAScYLvDwb/AbWO0WUryp625ef?=
 =?us-ascii?Q?5BHh/24WkhKiuGoplUV5sOS20fsANZHBsgtjYHajXIzjBbyFSyoHm1GoWfmS?=
 =?us-ascii?Q?ruAotaFrahD+hQDsXFv1o4SxI3z+7g5adYbx2LpQN/9RXgAbny7XvCgFdisV?=
 =?us-ascii?Q?ozdyjD8cxM04NmsB0Fvdp7g2UqGrw6p8Umy2Bv+8QFrZQ5sFiFxT5VlFFltK?=
 =?us-ascii?Q?65byvIAKldc9i3P2lQT5FKsd9X0wqU0fYAr2MqyJ8UDli7D/nFeHQnyZZPud?=
 =?us-ascii?Q?nbhBwUGPggI1SYdqs0DLpPw62DGQL+XO3KQVW9CSWjEchjdQrnqlnPME2g6U?=
 =?us-ascii?Q?n49iivn00zrVenVwE78nKoz/BcCn/HHp5u3Ddni4cTYQgZt00TdvzMNn/zoX?=
 =?us-ascii?Q?PzeQLKg1aAL9+MeDYo5ps9zVk/rwX737xJRfJRaGqTlyJafa4GdyEa4h5RSw?=
 =?us-ascii?Q?Xv21/i4qUHf9riiDnhB26DtuYPZCjaHKw31MgWzbAEzrdCuNBUXhaGohm71h?=
 =?us-ascii?Q?3q+KBQt3l52QpY0GhDlfaAXqHdyLhkwcAJEWzmXFIZ7RkC7li6Npm+y/I5nm?=
 =?us-ascii?Q?Unxi2aexOMdGORYBC0ETq6E4R8urlz84rVX9DgK/IwL8KuedoceMLseDXQq3?=
 =?us-ascii?Q?5CfQ/LyXrGeKUmQKiq9kvm5Fs1p3fqBpLczSIXVIS7NXt+WgIP4+7Mmdt1Qg?=
 =?us-ascii?Q?Km6DCaoWGLHSYeRc8LJCC9k+t11LjJ+ScLAIt0PkBcG22F+905SilXwN+NMl?=
 =?us-ascii?Q?j7Mgyli4F2z683GsQ17kEq4SzzkIaRsDRMsk8Xs7lSTQucaMgcHQgzR2aPBt?=
 =?us-ascii?Q?AhZmX9To4rt8FEO15e7pd+irXbHDAS36uCqTeN/QFCLPfrp8NQdkgqaj3R00?=
 =?us-ascii?Q?9EjzYliw+Gi8okPLvdNF6eHuo7y8bQ/zqgL7sDTdT954lAbRDD9FVq2Maxwy?=
 =?us-ascii?Q?wV7MW21WUAj+1UMebr76mQ971Slc6DuI65PWjNlNcTWTDFoTH328GjdpmYab?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7be3f84f-491e-4d1f-a86a-08da8f39de6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 12:26:33.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XSsi/TUFSvpSXXJYS/kq0xC4JS4K/nO6wxXWOifzt9PA+p3dRvNhCd5nzUf7+3Z3QT8Q1y1MGCptLqCeO13+7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB2816
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 12:26:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170313

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

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
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


