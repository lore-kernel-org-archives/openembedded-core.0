Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280A7C433FE
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:09:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web08.8412.1639148995233017305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Eyk02U+t;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQWMtj7yjoIAQxI70q424vQdRGz06lXm/0GQHksme3RBWBMhJA/6npZLcEB8PsbhbWaD2bRu1kRQ2DMgiGuJ0NBBuIfI7wkRp2ZB5h0FXA0LiVT1JZ9hquxLvm0JlpS88ZxiaKUmJYLoZ55hjvmYsNPKFXYWLVhZgRsFKrRp2ip/JhfU5SzYpr2oasKWp3sFFwqzxDSeZwnwm+kg+asZloUFKgEnQ6b86RWwoKMe8NHkG0n6F53NlfORLjshUuVWMxnui/cbLXivCqKMjT2mcRB3rDpBhkRWY3gxMUQmklZd/8Xo8GJtRitDh9Lei/4dddDHN+K7dYsmEvL9LC7MFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JPRj0cTiDwXM2v368mCfXxdTUxYtSdogEWNvPOzEO0=;
 b=hTTHHkN7dEQ55dm8TO1A4EZl0wXd35nSwr7BpHmGJJOPOXA7oJlpue7AQhWwxO836zYRiJlQxPfnri83O+AV6HJSXxxSFC4kurIlrj3tj6ONfg5tFTjyCzSafZjBKPPy9njWZunZ/ytKyYgPJrElfJ3UZYh93wEdSvmEV8hpHXHZMNF0Nq0zb5AJ5SBi8d3GdPU4Ycv3Ex2k+LlQrEz2EJeXhEf8KOjCIbRko9egHReuyKz3e0Ai2T86NLxYl7M3J1GI1l3TiPmg2+5JzzEXAz9q3vuuvTcSJTUlT4rxr7EQSSe9kii2bhRhPTnBo9IVAvoBSKMnKtS9+ncZEa3iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JPRj0cTiDwXM2v368mCfXxdTUxYtSdogEWNvPOzEO0=;
 b=Eyk02U+tvwKHpI2hdbxiT1VjTOXfQdkBbvWoKSPyC3Ntfm3iV1Ff88OMt9rHsu0N+n9zceoFa4ORgJG1+9xSFQu8IeujkzHEzutBeKuCOUie9GxmS2YPSr24gE+72O3jlnSKsal8UFgEH4Xd9ABEZLTD5tIGdp7L0ZxMBwxdw38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 15:09:52 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 15:09:52 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 3/3] kmscube: add build dependency on virtual/libgles3
Date: Fri, 10 Dec 2021 16:09:30 +0100
Message-ID: <20211210150930.326134-3-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
References: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0239.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::35) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0239.eurprd06.prod.outlook.com (2603:10a6:20b:45e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25 via Frontend
 Transport; Fri, 10 Dec 2021 15:09:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae63f47-898f-4c6b-bc2a-08d9bbef1dd4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB64521F8941858B56DE274EABC2719@AM0PR04MB6452.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6yFfseLwuRZvhtP7JoB46J1tn7C5x9unGsF1M1UPyjy9Wo2oJovIgtFwxohRdD/8L34Qxvww3XZmA/AXYpMsiuaaoDz+/qc7v+E1wy6hu6f/sXPA1DSnvN9wF5U4M0j9WLpl3FS6HLLPZivcrTDkMR2t1snBjELFnxaYggG7Tcc7FNLfp7fV0kme7lj3PMgf1U9a30+IfEZobQEtSQZcenE8MBt6J4xxLCK+CLukA9z8e9hCBg6Qekqc6okG1cb1QGzJi3tZ3XkyQDrN1P0q35lkcrGz19RPSchS7jTP+w0fgHp7BYfpiy5WM+LTRyo+ENOdd8kso6Ufkaka600WU09VL2N8UOTqp8iWABiOyqiVvvhbW74MUFUJC9mv3Q91RWfGe+2EG+qQ/wcgFEUCy3CijhPN4VG7UnbBWG1sYpAaN0qWFDTVF1V2doXhBcjr++80TC3gCQZr2AolxhMBZOhllJQ4rOfaPbgwcR+eI4M4BvVVwL6VfLbwmVmtpvO6icDEGBh7VdcS+1OJ7wtOZ8bbuKhtY7C854HF4PlKTy+k62CfuwiS5Opcc9FuaDeOE5nI9qGFdEGjYa319RMUfLVbb7MMagl9KGHx6MXee5IOWDUyn5JSbaZny4rWj8OEwb2iRw38Oz4lUulKDHGCelt+Np6wV7N2MWwR6zjXUNThzjSa+a2TOhYCWu51hk/jjj9wH3+Ibtu2+XZkbjQqnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(52116002)(54906003)(316002)(6916009)(186003)(4326008)(8676002)(26005)(38350700002)(508600001)(6506007)(8936002)(36756003)(956004)(6512007)(44832011)(2616005)(83380400001)(86362001)(6486002)(66476007)(66556008)(1076003)(5660300002)(66946007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zH0M1dC/17vcW5nl4V2bRiYfMJeW8Out8XV0LeWo8TVq2aHLm5bv9bz61o0n?=
 =?us-ascii?Q?eJBBVBM8gfHEgY7aoped4XVCIvGltP5DfVQN+GnOGlLYfzAz8fzB4IMoTI4w?=
 =?us-ascii?Q?mAISAbsewAyD5YjF6TQ0WAHAWBOdDP82bG8m6l6AsuPIbIo8wBmRZYPSBoli?=
 =?us-ascii?Q?WjAP6ma0F6SldDd7k+JQI/92pVWWITMJY+6KIgYvW9wDLxIZQeyYXDDXkl45?=
 =?us-ascii?Q?t7rWbx8E3a7MEBJdlPRetB/otFR5bTQKINUC2PKli3CLg2urVerdze1lVsnR?=
 =?us-ascii?Q?UnbqnafWmlHLrOsl7WXBx75sAdPlsHezNttelh7OelcEEpLkMqoIxyFcX5OX?=
 =?us-ascii?Q?GHqneFcwndwkyg03DK5hTrcQJjCUfdjRrNl0LJprsCroiQmqep7TuEMm0lHE?=
 =?us-ascii?Q?2aE/pemQBn5oj2vV1ChQn0HIszaOpJmC5rc6T7++euONF2yQyCUOUo/aSttq?=
 =?us-ascii?Q?VLW50gExvcaVLAUoYTpWEWFhhzrosFfjActXYlPcgLq1DM2QP10/DtAtK5Ao?=
 =?us-ascii?Q?L2cp7BSadV+vLqDfcY6NU73zxAIDUnAnNkdQon2Uewa9fi/Jjl5U7KHgndJc?=
 =?us-ascii?Q?qV/trVAjfvQ8QGTJE34sch7FDJop3oyAR+8m1Re6l7NNgZdD/JeoFsibZ0P7?=
 =?us-ascii?Q?01TscQzN9OmlHM7Ej0NqCnX61lH0bXVPoHyCob/TYzx7JyVjBj5rQ8DpKmZY?=
 =?us-ascii?Q?B/0wTbWJckJo+JaibWmXs6Rr6Lk/+NhLLJkQoDJoHEDOETiHpZrB5MSZ7KVV?=
 =?us-ascii?Q?C1BVuk0zWit3o/gY1MO/kbYn+32OYK7vpA51YhJqCwY6Q/Q+nW2oCj0OLjhX?=
 =?us-ascii?Q?1nNwDNfE/aoitQVebb44Oliv8b8gcrZ6IzwjtZZxuZAry3CS2dVI+be3melb?=
 =?us-ascii?Q?tfK96/y/bmW+T8gELJH7WY9fH9gp/ahOKKHR25SwC9Il1jf4JzrXqDAH7UGm?=
 =?us-ascii?Q?Y/E+odkSGUNt3j26ImvSY/lpk5Vg+OTND2mSdpv5Z9jvRP3YkZtSwCtgm7h0?=
 =?us-ascii?Q?ZoEbr2x2aC++UyRZ2jDiKRGXDbF1+uqi9RWcvMA1WAukYkpsh/H3SQA2mMiQ?=
 =?us-ascii?Q?eG40IoYnYIg1kyAQeJwsIyqvGNXckjZ75L6jFn//UZ41tXkTodp34Loxwegz?=
 =?us-ascii?Q?cSAsZD1iqBPFsHjG1vcJ1E5z6L+7emfnNlXRBPS15/XZyWQM2++O6mU0fz1h?=
 =?us-ascii?Q?LUVomntIkFzFyDWQ/VIeC4kcDoEP7fWAQyLvbaoHL2bOzRkb3icFcCoc/oxw?=
 =?us-ascii?Q?NVMy0oH4jq1jdl3PgSnP9mXf9IHVwB4Q/tzoPuy0wcFDeaHdgM3y83crXlZL?=
 =?us-ascii?Q?wS4EBuNSKY6XrPPYOZxbpTzfeQetc2F4trUpTIHUIlH8xvByqNX9HFisqpqz?=
 =?us-ascii?Q?tKAVAJ2PcbDttjWvrYG6D3aYi8vkxxiz/BiDZHjF9gx8Vv4RNuA1POGbGJWr?=
 =?us-ascii?Q?yjwSW7xG/Vf4x6emjOpNN9KGynQAhLezPVxGaIh6iGvd6iqJHqJt8+tQVHZ5?=
 =?us-ascii?Q?pTOU3fXr0ctv3JtQKdMq+Wg3UZ5mNXPA3nWy81w0e+WZ2TBeuRckwawlbUmM?=
 =?us-ascii?Q?hZPrgWYTaxeh/DFvjm5aMM0j9Fuujrh0M3Qq+v01yb43yRIHb8dTF/4uSNIp?=
 =?us-ascii?Q?f6m0rZMpuA9ED/TiYDSzmD+5kkq3MfISsdFPgh6YgxWtEV0K5WVQSHiro4It?=
 =?us-ascii?Q?w+aQMo3+Q+EM3alZe5g7dh0TqLagquxhN71nVWqa0jPS+2U7/k4YQfmcMFLl?=
 =?us-ascii?Q?4c/1T50lRQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ae63f47-898f-4c6b-bc2a-08d9bbef1dd4
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:09:52.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iB+TEcAloQ9CYHV1vZX/bxT+ZhkE36PO5WfpaVulHLmilB1OV65yWScNw8My9r+4n0Z7c+/IM0BevIf+dzd5jw2hz7VhIvzNjNp3Edqj1cdmeMP8860GxEeAHooOrQux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159543

texturator requires GLES 3 headers and libs so let's explicit this
dependency. This was not detected until now because mesa, the default
provider, actually provides both Open GLES 2 and 3 compliant
implementations.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-gr=
aphics/kmscube/kmscube_git.bb
index efaa962704..54993be89e 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE =3D "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE =3D "MIT"
 SECTION =3D "graphics"
-DEPENDS =3D "virtual/libgles2 virtual/egl libdrm"
+DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
=20
 LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b=
309d4ee67b7315ff7381270dd631fb"
=20
--=20
2.33.1


