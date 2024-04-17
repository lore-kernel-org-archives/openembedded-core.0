Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52C8C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:45:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.10695.1713354339323368601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 04:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=FoeXI9WX;
 spf=pass (domain: prevas.dk, ip: 40.107.6.74, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGc45uBk09a691ZIft+CXQ6JBpXw5r79wGLsdOqq8TnEkeSvDijKC6S13lkQLjZEESGGv5h3wads4MSplJ0y9T7celsHlrUj/sSik17J1PLmczjbTTIM+2qwpX8yM8qbeyecJqiYpvZBsU9D2GZY9NjJQxykT4s5F9bAblm9ek/xOs2CI2iI5F6iZDX/+CSAh0qDs7DSZTMBLGjqdxpNKIsVHfkkK3HtmdlAZKrLngJkGuPQ9Y5VXpgY1lkhjB+qpsCB4uWvXfWKJZX0F+30InvnAghH95ZH+xZvSNRZ1z8vapDZLcBlUZFs7DAAk5NyuopQGskdZhktGOSm4KM3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve5H3oxjjz0DWnx8YADw1DxDYLkQz7ESIp3Wkaz0DGo=;
 b=cRHxsHl0lbGdRUl60qzTJdMSJaXyFU/qd5Si2QWgS7yrcFKdo9XR8ICAKVKQ84JWLsROsnLZZnli78fBvlOPMHYJBqLsaXN4/LmEIr+6jRx/Etr+6m0fYGe0QFULiNWqQX+rN8PwDUPcpBu19SMkrWwJWaCuk9QDhiLFW5mx2ZXqOOqL/P9uEfSGQv8lW1hJpmDzyhCt+NZdGRqQRnW4UZssft7MYm+9PqmRICdxEXx5sIEMdHjVxRTePKWSIkU42Jd4kCzBVsbrUOUfsetMNiLZ7ctZwe4tFlbZLo81UpR5z2vtFKvYvhNahfd1sungrrQFq6AkdT1WFALBLsnRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve5H3oxjjz0DWnx8YADw1DxDYLkQz7ESIp3Wkaz0DGo=;
 b=FoeXI9WXaSSevxm+OyV+jM2uzw92lSLVmpViqOO7EA0tgKe43A6yg7wE/zXCZVcO8WjXpEzdDHMLdycE5aukCbERaQTG52GPYC73dXTg2RgJBDzqz0uOv7VJs3naJwg9/cF9HePyu+uqJcqJKIJZJekO4jY+NcaytanBfEC2aWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DB4PR10MB6117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 11:45:29 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809%6]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 11:45:29 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] openssh: add After dependencies on nss-user-lookup.target
Date: Wed, 17 Apr 2024 13:45:20 +0200
Message-ID: <20240417114520.78483-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0089.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::32) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DB4PR10MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 94249d2c-d50c-4ebc-9cdb-08dc5ed3e11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	89kzg4Che0vRMMYLeSHOKITVnPudAZj1o1SOc18ta3EeoS9y5g+Vn8+4qG/oLzxY3qNSLZf6s+A3ISEeO4wf+Q2BTADpvr9bfPCPrmeaMFWnWyESkbda6+64cidoVMckg3rB9A0m6RRaoXxpsRkCm/BuSUU2jWxxuHuE8LSbsSQngYh1bO/SxVzIFkj9wSicPLLawnj+V/ydXcKu+WMu+Qg1IzwamnhS9/Q3yBH4fl8Sjd5GBWnDpp7Nuwxn/hzFh5QEpEuY8Gljm+KT8aINVYWwRn8SVZn+hEQO+UTwxb2yDUzNMSs2qJLuusw6Mj+6Z9UE5LsNEfcxwc3G8afYni7GARCisFnKdqAZ5QHnuLbZYZD2gL9z/RWodAKOum/YangntlvW7iAIt+zFcZLI0oHvPI+ex6wQiQ+XPupojU6J5wQCpDRUd6PZxe10ssgVGMD8BGmj3rkGtauHPjJEncvC6AMPjxh8DsU02IIrtmbzDveFahs6XjvinQZQl836km9YndvfNVpBLAcDtwiA3FoyvgETjIklHnJlWiwIUp5LB/+aZX2Cu7Y3NXJGqaNqTceOYDdQB73oDW+/c7qL5QlnxZhBSwc31/BX+GSIQVO4Tyo5sFam8xWqFDiRaIbzBBDtayECHu04kgQIKWo1kXy5Zkntuk/LxJBi/WMQGuqVDoyzGbZrHAcIN76gdHrQUtHkOykY7gA9/d8FWwY/6Q+AVrJqOTjFyBhzJT/5Dcw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U2EfCREMFcEg0TG25oukIVVrg7bWt3HKPIaEk6zrWODbyQp8D2nq8Mae3y0R?=
 =?us-ascii?Q?r2LroHFfZJ6LsJhwE8qHBI/4E3b35rsRgj28EkvJy3btlISV4esa0Gme/sdX?=
 =?us-ascii?Q?w3tRWBOSCguOG2LBEj6KIh0b6LfCEEOJ2Ka4vlfy/um1IXGkVN4ldnfFNbCV?=
 =?us-ascii?Q?r85NErf10R3SJTpJy11QZ9cPFuRcZIIaUiQma/9HvQViYw3hGx+744LHTj+2?=
 =?us-ascii?Q?LrcuOU9Iy2rE4QwFnWBYefimRdv40WHun/XsWBDGe7s8WAPK/R2G1r1g9fmr?=
 =?us-ascii?Q?r5m/3s/Bir0OvXgoCUcEww4a7N2FJpQRoOe66eTBe83G/lMNI1bJ3M8QvFpU?=
 =?us-ascii?Q?lrOYBSMtTNQu/U4u8x9W6FPS+Mjfys2hDLGp/dDa8lY6KGBMttzBsN2uVrk3?=
 =?us-ascii?Q?TRDjkQjLjMaHH73Mi4HIHLBO5SoMF0jCtQsSPKMfwMOyIQMMeYWRVMXVjTl5?=
 =?us-ascii?Q?gf9nUvZYFSaOTbeNq7mbCHxAbZMugRuc68KlTP15ZDIA1usvqk7Tz0+8A+0h?=
 =?us-ascii?Q?Bu0FjJ1RG+x5NNg7IFLy1u17GkPVmhzVHX+2S4xrSvFdLfrDA3H6nxeshgjm?=
 =?us-ascii?Q?HOhtSQBIsxSDC2cyCFEElJFx6hNfRsy6cNQke7tiNofU2H4ctoBZroiBHXB5?=
 =?us-ascii?Q?lRoGYXByeOEOKclJL2nSS3rRX1ye7WsM65ucfwz1zmtzxMaQN0W4u8YQjtQm?=
 =?us-ascii?Q?ByX/xr7ZKS6qjnIdfrs3BjhDiHNRMVIegSqixe0JOC04x/xslzQMDr5qnT4A?=
 =?us-ascii?Q?QU6YksZY+D05pyot5SYMMn31SWEwWcdqbUSO+qOPhRzASLuZri+V0tM/1l9O?=
 =?us-ascii?Q?Xmx4YkKy/GZnEZrrXcZfdnIwo7pzCQK3NgnqVYOz/j5hyBGVghlQZKKQmv0x?=
 =?us-ascii?Q?jXgRkU0YVA8/Kf0JTO2gtKLn7iSA/L2+/DeevdWtCzuA3bqpK2vSXwQuWTyq?=
 =?us-ascii?Q?Rk+xVVqKX9rWj1iQz2XBMFXZRlNom3c5iohAKc85YBbhUfSZvnj2Zb56AohD?=
 =?us-ascii?Q?b6Zi6EVP4vIR0ov8hN0eRZa9Bg5TOVhhVZQ/bSvcuWR0DXvhvF0onxn7fLNc?=
 =?us-ascii?Q?gBmXvgriFhUyMgMwcMWmqaA6F+5gY3lUKfnVcCV5tXrsVhWsYY08XkmZd/FH?=
 =?us-ascii?Q?qPHLuqdWwvtDpIundfM93ngkCDSpVff+KMQIg2QPD8adTIzssvISf/T4Wf5N?=
 =?us-ascii?Q?czTLGHpY9claWK57houCkgr4fRvwtXrNZ7zedTWinv+gWsKOEQwclUh2PVLM?=
 =?us-ascii?Q?Dvw1nE7R6Yko0p9Ba/Syyji8uSlKP7U7/YVVEpxe5Jb2ZUpB7eklEymHr3LA?=
 =?us-ascii?Q?SNcgdMiIqaLC7bH2k5HviruoTbNX/zJCK2gtDBkG5oii8g1rCMES/kZaZxhk?=
 =?us-ascii?Q?lbND2AOvSf+A/YxY2y9nVOXZherIzYGMCepPwZOkOK1Qrg0PIx7arYAAzZvq?=
 =?us-ascii?Q?DdDoV1YFRjnsmrNOgmyMJ1cx/TEJE1KUUqw8r7B0UQ+D3SdKLaZ7DjYf0Qtd?=
 =?us-ascii?Q?SZiSoBgvYj8Gu+ff2huoW3mzOTkqnqomtED+29plVQBaAXuEABvFXqqkJPnd?=
 =?us-ascii?Q?w9tfsK45PHTrtQY08SYGt0U5c8uUs3sf3fDTIZ4QIjv94+hASkFgJ0SDkITS?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 94249d2c-d50c-4ebc-9cdb-08dc5ed3e11a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 11:45:28.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t1gs9OcDcihak9MQqajoQ2Dl3g5WHiZpbd/u7/sNG8mV2ChM1IAZQlP8QWs+fTofigYLFshke2r6wVV+S++Y2NErJ5UYrBxvUc6fQWpMS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 11:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198463

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Quoting 'man systemd.special':

  nss-user-lookup.target

    A target that should be used as synchronization point for all
    regular UNIX user/group name service lookups. [...] All services
    for which the availability of the full user/group database is
    essential should be ordered after this target, but not pull it
    in. All services which provide parts of the user/group database
    should be ordered before this target, and pull it in.

When no service providing parts of the user/group database exists and
thus pulls in the nss-user-lookup.target, this added dependency is a
no-op.

However, when such a service does exist, and e.g. modifies /etc/shadow
to change password or enable/disable certain accounts, it is essential
that no ssh connections are accepted until those changes are made.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-connectivity/openssh/openssh/sshd.service | 1 +
 meta/recipes-connectivity/openssh/openssh/sshd.socket  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/=
recipes-connectivity/openssh/openssh/sshd.service
index 2a997b656a..3e570ab1e5 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -2,6 +2,7 @@
 Description=3DOpenSSH server daemon
 Wants=3Dsshdgenkeys.service
 After=3Dsshdgenkeys.service
+After=3Dnss-user-lookup.target
=20
 [Service]
 Environment=3D"SSHD_OPTS=3D"
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/r=
ecipes-connectivity/openssh/openssh/sshd.socket
index 8d76d62309..7dd2ed0626 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
@@ -1,6 +1,7 @@
 [Unit]
 Conflicts=3Dsshd.service
 Wants=3Dsshdgenkeys.service
+After=3Dnss-user-lookup.target
=20
 [Socket]
 ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd
--=20
2.40.1.1.g1c60b9335d


