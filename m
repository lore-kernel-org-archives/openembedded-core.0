Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE9FC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 17:01:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web12.12947.1645722070557306380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 09:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=MWUfpKSM;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIQZ4YGFNu75utYRUT8cppygsAKTbjxeH8b/TkNy1WSpUuZWMM5xr4RaYAvAIlbs3+qaECBdTyI4/xFmIARJ8Bigcz8qsl9myKp0K/t03HHez5vOrjUXfjgtc1BDQCyPE1PlXq02NjtR9+2Xn0m9suZH8kDti28qA6oFKeqdbEwR9pdbWFa4UCJuEu4NynRx70GV4AKyvHlZPTnsgHr02WdQ8+CTRxR9ntotqdU/j+LxMHHLpGyuJJwYuSM46oI3uazuz3ZSui7ED8xFO+syn3lcFSpGDrIPafyNVdPx4Lk3SzqyHVt0+TYu6sMIkqHL4+UlbQ0IVQic0sGSL7IIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XLdO5lBQ+rQR4kl1C7W7eOTdvtCroRdo/aX25ayX6w=;
 b=O+v351z1Do+rfPxiivx6G4WL36jXm20hqlHcIKtdZ7YoHqM+mavr6SrJGkhnHcMsCiD+3gWSTtvmL5Lfc73mlBuEFKRFFyH1BhYEiuq4HrszzdP5dfuUK9LOQm2B+XWVl3NhZ3J3Q9ylkAyZDC+hs0je2AlLZvT6Nh67bsOxZMewKWnB4YLLbPLZ1hk6p6CzqMKPewfiRioFbl4735+RZQ9dAfMmpms18Vmb6QjIOM6fGSelKtSjaOCFC81Rj976KFA2T6njx1MyPD6kso6IXMNlBK1ybD736hUQaBuz86bluEMyiqs+iJyhweq0xdo9WFuxS/l2Wo2HnVAopWRHPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XLdO5lBQ+rQR4kl1C7W7eOTdvtCroRdo/aX25ayX6w=;
 b=MWUfpKSMQ/2iksqwgWmNwwl6M78yHQAF5aPtcHn6v29k9+M3hbn4i7A20Eu3KKfr/wAxP5a1ZQq7ImH/UB/+GAGBuZ2pB6OpmuwUPdKMVvsLMJo6RqX30QNEa1ZodXIiWNCBtWdqkY8YNDfnqTgJABOqsFz9PR4W/hYtpJ8KbTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM8PR08MB5826.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 17:01:08 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 17:01:07 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] files: overlayfs-create-dirs: split ExecStart into two
 commands
Date: Thu, 24 Feb 2022 18:00:46 +0100
Message-ID: 
 <20220224170046.27544-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::23) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d7c878-50a0-4149-e430-08d9f7b73eb6
X-MS-TrafficTypeDiagnostic: AM8PR08MB5826:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5826BAA1565F1484759A96E4D73D9@AM8PR08MB5826.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sMb4Jr8q1T5YdVj0k4hDsA0JwaPn0IRDlh05AX8UDLCw2msYx3uxtqljqLH0C8mSS5N6ojmacurha019sVXblLMGPuCBjsdt2eLSZojKm1729kr7aY4J+I3S+iRAGqqAP6VZKz6jyVaHqjlIkYOQPgm0+ochhXL/gFpY8JG2uEdpXKxwcLVXdp1nQefuxwVLrgUUPOkP38Mfn5ecjEfvFPSjKJOf5a6NOL++32G6wKwKSX62S9zlu6vlHE9E/BfYdnPt9+NBI3ZCeQeLxuDJQlAsYPVUyOBCo+6pvgb4/tq+iNTrz+CNp6JJnKKtkTS9kCByEOw1yiBrUO4fC20uHOwH/xwUObjGqDDb6K/PEmUs1ZDmeDi54W8Xr/7HVP/9w59kzRK1mDT+KBflwDG8JCrhOVvV9H0GQSss833kn1iIa07CLZyuKEEOHAzrmhZlEBeADgji3ZS2DX5QmVbwuzd244g6W18s9A+US9+YwXhPms9dXEyTXBvWYk+CKkVx/AwSMtwIvM/URij56z7o/xouQkHR2B3v7JsyAhcxT0GhoUJprC7LkhFm9z0rYTTr3NiNXgMsE4UmzkyBDnYRJxr7skg0AU+h/pWeCrX35GHcIwX0YGDeAzWR49a5NY/Ar1qZQDju4uPWcG8UdHpApGQyHGn7orBg7mReMUYtm1DAuCLVwwecxh+2w4LK/upP08TjKRpP78MtZZD+iUd4pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6916009)(316002)(38100700002)(8936002)(83380400001)(6666004)(5660300002)(36756003)(8676002)(66556008)(6512007)(66476007)(186003)(2616005)(26005)(4326008)(38350700002)(508600001)(107886003)(6506007)(2906002)(52116002)(1076003)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iGTfhwdzj55p+ZdelWuQR005kNd9JROkrh45N0fZD4e1LmBnfDCvsJ5ZTK7h?=
 =?us-ascii?Q?rj7+RerFd3TvIqQQn1r0PbxArRyqo9THLoq02fkIJBfvl1JjljqPZpiUwVrX?=
 =?us-ascii?Q?bOAvXUl9EcJoIyQ/19PGZmxTa0HnVsR6cFQjXCvSQ4oU6k5/sMKfb8gdfJBO?=
 =?us-ascii?Q?SlKfrCiOMxEBo+Jo+D+oRauGNxFTtdr5DhrYbNUnmkQVhotFhDeB5uMv5+2V?=
 =?us-ascii?Q?6YelOXXgYtSkOvrcpQLpOm7OW7FxpLyt5YYMfzxqNwGaVfSET/Kq3aAVRfOt?=
 =?us-ascii?Q?D2qmsAkj+ajsIA6AhrTaRei3HewvORQUdoIa2MOryXk9CHPq7aGv8gVIRAsH?=
 =?us-ascii?Q?cu1IVDi8oWvKxeVkXaGu2fAKzpmzbyrvjf4eALrFwkFab5Qewn6svtLSXvVS?=
 =?us-ascii?Q?jLz5THzMyQPW14hY7LVZphoCzhAhor5oJK0IjPDcJLtjrSIq7P/OXjNteFJI?=
 =?us-ascii?Q?8itV/mFDHQFexjsGWQ2SojJ8jQEQ5tXM//frAkDzxnInkXmbV2sR5EyTCwYV?=
 =?us-ascii?Q?yOYhEsRVqGQRIVlgaoc5e0P3B81uBQmFe41pMioKAe074k2LU9aILlnpKcV8?=
 =?us-ascii?Q?kk+LgC6rSDUfk/V69ylgwSIVI3kKWQpdZqVKIkahW9pCwAOMl1EJ76zyE9xI?=
 =?us-ascii?Q?9eY5b+HDIc3rpzWTuyhKbaZ7CVNbOq0pbASdL9E+3l/ysEvwoL/pvI6WXDLq?=
 =?us-ascii?Q?E7XTrFwwwMhln+RmHqY5joQ/kvD7U8oMX4nAShTn0rE5J0WA95/fDElbGmSv?=
 =?us-ascii?Q?pW0YZCAG7Px3WRzSMjA+6pvy31oU2dggtUCezPYZp3NVrJp1IC1BlB7vPqL1?=
 =?us-ascii?Q?cktOR1aBOyv5qu1Z2TTnKcx1P58+MK5RuKRr2zweibFv97dqeUYY4bsIlmUd?=
 =?us-ascii?Q?K2iyuIwdEjANTz+N5P4M3ybeQfZoPkXPwPGWWktb5zXcoEnoaBREr3lPg0JV?=
 =?us-ascii?Q?KuzNJVEUDamWmaknEPAfg8ZiIxNqBHF4mUUnVrpNMCYOF5SheIsWqUyZ8LU5?=
 =?us-ascii?Q?3i1ikeWqesW8/xUYwLKM1Bq+g/DQJu18+YHNObo05ygD+/DaSxQrByagJ2mi?=
 =?us-ascii?Q?BDDRWdlAwzX12wsYZtWlUXreGGTNOU7RcfSf+6Snc7LoD6V0KaUaun0Zcpdn?=
 =?us-ascii?Q?MKAJhGcMrFgrJxotOE46aY2+M8OSx/bpuQLE7egl/8jbiPoY12u2EmtFcGvw?=
 =?us-ascii?Q?QuXB932vvSISS0zALhWcxGQhYoAlL0X9UE5c3SeC1n7y41xBmbEbeEwtdmSf?=
 =?us-ascii?Q?v/qgGqmSD7aW1NVfFKXG3Z2G38aQWQvi81vrujN+YuFgwvAKTzgl7b93M6VZ?=
 =?us-ascii?Q?+4fG9Iknh2Bd/TFPojcqwApTAviAFzsWbqjdYnbxqNznTUGf7T8tQNtiGVLF?=
 =?us-ascii?Q?c1GcWs7IlLpMJAbXVkROQ6PdxiVKpfjc2q3K9sdrQiz7tEoKQqnNToPP245/?=
 =?us-ascii?Q?lHBm7s6KFU5yMGDjTc/1gIX1faChBV0fMc5UrfgcjdT3ERjFXRmv1gG6MQUF?=
 =?us-ascii?Q?qNI2e/TG8/KxX3//7TN3IsuQZe0AtQrjssQXihZ9MXko44tQZPyQDNUiHBJY?=
 =?us-ascii?Q?laCIeN3S2RUyYOFC5AM0BSubGd/nXNsklXF8NgOGTXJ7HknsD9sfM4KezvHy?=
 =?us-ascii?Q?5dD7gZA+Rytz3PwtvAlwE/A=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14d7c878-50a0-4149-e430-08d9f7b73eb6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:01:07.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lPLhqW2MzBPGhzm86UghTIfodlS8n177yszi+HhWiRrbfZEq/jhMwKv14l62OVMtb6o5xfHuuyAjls2acLFIeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 17:01:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162327

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Split ExecStart into two commands because systemd interpret an ExecStart
entry as a single executable with multiple parameters.

systemd[1]: Starting Overlayfs directories setup...
mkdir: cannot create directory '&&': Read-only file system
mkdir: cannot create directory 'mkdir': Read-only file system

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/files/overlayfs-create-dirs.service.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overl=
ayfs-create-dirs.service.in
index 17204145f2..61b2b9321b 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -6,7 +6,8 @@ DefaultDependencies=3Dno
=20
 [Service]
 Type=3Doneshot
-ExecStart=3Dmkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DAT=
A_MOUNT_POINT}/upper{LOWERDIR}
+ExecStart=3Dmkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
+ExecStart=3Dmkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR}
 RemainAfterExit=3Dtrue
 StandardOutput=3Djournal
=20
--=20
2.30.2


