Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2192C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:00:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155941.1783357193339076282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=S8rNeVQt;
 spf=pass (domain: navimatix.de, ip: 52.101.69.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTm2gWAC0fuzI66iVUIFjmatLhZjyWuLIJte0gv6UnL6YaaW1mhgkMf4pzWmf0A7tbvOrI12aAa+RyLwthKsd9X5KL+3vOL7BSl9wgw6/DmAdVXTgGlz+gsk939/MagmXcN7qQ3EgRnJdpJK7P6yIEaDLOCjvFBrtO7hIGVUOq9UJ/8sOS7hzupjhvUrHU9iZ87LFN/AUXEImqC0vtvADvbIMJIzZTXxk+wgUWXYhiFg8tmB3f6TO6gu1wjSpercO2Ny69v28JE6EzFcz+bXQyJaaMcq/jWiTMPSYm3s4GbJ1NV/H+DSycRLkGg5PPWiLW/0bdbjopRBMQsWP8CCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TXe2gFWe05+jhswK+czpiluw6bnuU3cddZ7pcLL898=;
 b=VFZsnDG/3KeGYr89nD47LNjNgPiD6BEqlJUxi3Qcw3P+mJo8IB4091iXhP4rw4I2rakf1IDVpi/gqxXV0SH5bHOzmUxo7Lv/Pns2Y9uu94BSN2Adho/+u7CvmgRJ529ufw2/Dru9Aokw07TCu32hiqFcevyJKUmKJll+cMdSXjgwc/+Rxr5RPjQjm2rvpg0BFw6fNdAEYHhQy0043qMb6FbKC+Wg7gN6YNpfrEWCeqUesj+Wdy4vhIy4aXtC0VFHaPeAnib11fRg0Aaq64nT5mT9UltshrZYFNopSjtn06m8GSZAGppWkNdVQSgiyC67idINr/xE6xxy2mlPv3Md7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TXe2gFWe05+jhswK+czpiluw6bnuU3cddZ7pcLL898=;
 b=S8rNeVQt020EX1qK6ShqbUwF7rMXCLZVGXwt0fsuim+AlitTC4YI/DcYnj6FGctw3c+aGZbwj3eE5OyWWmkXqz4O9bg8cT9bb2RYMALsxU3HFUT0K54las+xlHgQRu3nRjT0IoY/y4eD7oNTNnOeMtWOrhZDoTTTPU0rzQ7J2Tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11651.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:719::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 16:59:52 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Mon, 6 Jul 2026 16:59:52 +0000
Date: Mon, 6 Jul 2026 18:59:50 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 3/4] base-files: Install /etc/mtab in a systemd-friendly way
Message-ID: <4baea9df11ee5e91a5a425a63d91fcb4b22d03a2.1783357184.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ff0c3c-8322-4f21-9ff7-08dedb7fff24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	UjT/yT4gmsLIP6iCZZQziKYwDdHm6HnVYi9ojmiKZDi0LIa1Odt3KyWREdBRuRr/k4IGKsMFTLFaCdzEmPA/IKbMqkaGeYMWi5IB6/+Tq88slXTEbGkGOi/a5LdvSlMU44SB+0535JFXDoyJE2YwqBQQKnZT7aPxWzLLo2hzZUUAYhXY4wzqFZOoKgnjkhGBTsPYWIlSzNOSkPff8yh565Ssbp9hlFFeiLffwWGsav7iAhbydKv8GmsCJQmOs4C99MkxDHvh3tnbDyaw8QK4hYQ0LoXvYElIany5CeRWOt3BuRBs/uz6sXSA9d6MduuWxUoSLiz9b0pkPjwIkY5iCuw8rxKs/avwFEIBlV+PiXqDpZ9XHVqvkUkCvZKe/wsYzm3dlK/DJOuUf00qoB+8s9FetizrWWHGnA0fbI4mMag4fnp8panIapCaGu9lfr272qqUV5p1YRU03uTuuOzM0lFExSAxjt4sdGJZym1B7mWic3nyfw9+LBvLJLZaAr7bBCgT6rwMnxSW5ur3fCyB82V7FTm06Mh64jSoLgJ3oNFoTFOrq6GcdLyBJIToWlSu2lsI+VlSm8zbYfvvgVaG2HGetOooP1pt6mAsjdz+j8l3yXz5K6iVQEAxZ36K/nfZYOHAEKzXV9KHL5Smw233hfrm+RxseCMU8BR9Xjp+af8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z9+8WytGtPJYJddno6oSjxLimkQ75a1JQOukeGPaWqnHiVcaIHNHBH2Z0gfQ?=
 =?us-ascii?Q?84Fy48LcCruyLkmvy6bVwZNtpTZ5piLZqpI/tH1ayyB89hQl+mxMkzUu6uRW?=
 =?us-ascii?Q?zJqQ1S+ZlqerwN+8VxuZ7e7ZGhXk1IsCujoBRc5+DRH2nD0O6HFf4B+Q5oiQ?=
 =?us-ascii?Q?sGDbd0HRIRiEuGO5MJD48qLOG1X9+kMLvTjfU4/mz7xcv6NxtYfJvx0u42uw?=
 =?us-ascii?Q?Jq1Fe0boAFKhqLl+j/ocEZlq2kEz/OoP57/vNqgJMAa/+PMo2FF7wYivEIq2?=
 =?us-ascii?Q?7LiVpquYyCKc0t5vRrDs/X6hNHnImD55/i/5bqlZDPXLZ4s8tg0359H4P3a2?=
 =?us-ascii?Q?sNfV3zN2OQ6GlCBdg/2lTJGpcCeQ2QO8SrCVkv+Wc042v9rNkBlUEj2bjUnK?=
 =?us-ascii?Q?LD4OtSs41A8yCytuoFdveR6ANE/MuNl+qbriPU57zbXrnvkJoHdQn0h/Q+DV?=
 =?us-ascii?Q?CmV03I2CiTXqXghgx1TvmjimXkrh09mzcPWl0XbOT6GxlJcYZr7pxLT6FJU3?=
 =?us-ascii?Q?uHy2MOmDcfOcqyOL+RBdFKElFtmUKe5OebRod0/V4eLqFyTyt6ChZAAI14Xs?=
 =?us-ascii?Q?9feLA/d+VV+Ezd3vmHL+mA8Iq+V1/9RLiE8bUMVTfK0WTxnRiex1vDCmf80B?=
 =?us-ascii?Q?QHyg1CFg20BiwpjrVl8oQU/aP45NpDOKKSuJfL0F6LZD3ZIFQwlLu9j1VQqt?=
 =?us-ascii?Q?vHfERi8Z2AEEJbhC8ZwUH7KnlAa6SgRTRzOv8EK4Tv/Mf7QKGRk//uTmvxad?=
 =?us-ascii?Q?bzh1UFt5Ut9CRzJ68kOwTnIoA7KvxdsANf+l0ti1LIY53OqQYICM+rlTuA5K?=
 =?us-ascii?Q?+sJxmdYg/Zd1unrmoJzops2TSwZxsviwZbAmuiuWds7HF5VTNC57Xr+miChh?=
 =?us-ascii?Q?Lmb46kHIS/Pd7Qwyl0hDyZLf/hZKkQoHvMn+KCz2WhLzdOovopdQfPDz8iT8?=
 =?us-ascii?Q?GDK2HQrfkibqwq3kGYY5c6uK4KffUGXHKB7VAVznYS8aPVVzbXzZRuGiS1xz?=
 =?us-ascii?Q?rnxGYo4MoGcuGmoEyeEkJA4tDkrFC2hlpbWD5SGq13JxSqlAbXNxUrL7ZDku?=
 =?us-ascii?Q?Ad1GzoeoCIBHvJaGg9qkjz2v4YObQe/l/12kK5HGf3sRcsJL8aJITh/dQlI3?=
 =?us-ascii?Q?If4TGoX6/fhIqOQZzHc/7IdIY3powWxzMEzIQASmlOVSjJnjG91kA5EPpI1K?=
 =?us-ascii?Q?yYbL2uTtTK0tnPgWPivSWU6+x+WVB96AgZI0zfi6suGXx1wTqWgGJhyA1GJM?=
 =?us-ascii?Q?BceIUVqpbdrZO/z2VRd2j6Qmop8oaeA+KXcihWpO8TecgNWrbPxElT/+xIui?=
 =?us-ascii?Q?PapZtywZkmonpNrY5W7P7+cxrQbzpcl3CpT3he3zdXSPqkSmt76hHK6R3Gn1?=
 =?us-ascii?Q?k9J1MPYzAH2ZXpRDS0vmltJ7tK0Jj3kFNyBrPLn6kAz7zhr6g+bmt/gnkerq?=
 =?us-ascii?Q?xMUxUZ5Mde8SviI9+5r1swWPHYzgTWBCw8DzusQNThhKnBBGy+fMJcSD5sXk?=
 =?us-ascii?Q?RCsAOWNs7+1cqjAB4mXBzmOPvEkFIcmVlu5lYD+5hdZFfuz1dxrKYylB9ohB?=
 =?us-ascii?Q?3h36z0fACmEgzZu52NA5FY914JnoOYgyvmoKYXutJW23rzBjor4vqvAJ+gmv?=
 =?us-ascii?Q?eTwc0q1Bo2KUSu9mbj3WEDKazyqONp+oHeQX3KOfkQ6RPVu5TSLcfrteVuCr?=
 =?us-ascii?Q?DHKxN00d3rn+gcWQpI4I+5prcrBGF45sH8A9ce9AVFtkA9rXoE29EQT8uba9?=
 =?us-ascii?Q?mlnj+8pNSQcbQu9cjfg5CD6c3KujtoE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ff0c3c-8322-4f21-9ff7-08dedb7fff24
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:59:52.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JhOY2F4lr6nonoF6OIfXEshLtRPswSMdugnWyp4vYcvja/SNlNQPFaBAKGHJoTUpTow/vwhwSj4Y5XbdSxFYll780nCNJxJAwObQ71TgWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240283

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The old mtab pointed to /proc/mounts which itself is a symlink. Systemd
therefore tries to replace it with a symlink to /proc/self/mounts, but fail=
s
on a read-only rootfs:

    systemd-tmpfiles: symlink(../proc/self/mounts, /etc/mtab) failed: Read-=
only file system

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index d4d777b485..aafc0aa923 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -109,7 +109,7 @@ do_install () {
 	install -m 0644 ${S}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${S}/motd ${D}${sysconfdir}/motd
=20
-	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+	ln -sf ../proc/self/mounts ${D}${sysconfdir}/mtab
=20
 	# deal with hostname
 	if [ "${hostname}" ]; then
--=20
2.53.0


