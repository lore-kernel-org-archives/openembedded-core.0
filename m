Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EB3C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 14:37:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.105])
 by mx.groups.io with SMTP id smtpd.web11.72234.1680532648934453557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 07:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.com header.s=selector2 header.b=HhhhMAzf;
 spf=pass (domain: nokia.com, ip: 40.107.22.105, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiCwlJglBl17tLL/gtNmYivlBHpgberFc5lKd6tNFDgPv+ldhfMcs2SBbBlgDi6TLjZDI/yH1hXo5m2tEAaXBS6gWpsusePOiTJpFZ2UhyqQr3O155uEwWk5/kbqCoAZNJmvobTnb6CxQntx22FPkM6LmnDUSzJjQ5ugCPvX6Mf16Qnja4rElQr3b6AFlzOf6DWVau7NJAyYZO5vIVkguMm4aPzs6x713f80SF/VFMHapqxoPd1SRsbyyAEgr5+L3SKyGQ2s1ThDsTpzY56eCXRXrTDJpLqMgZde0kiXHVrdxntsWQxDxuZD5ZA/T+P7dqbeRzr55ICCt8+CwQCaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obNDnQYDS3wtOge20KEetY2NGKlu9nGd8PkyBwY2GDw=;
 b=k2h3rhVxFLAYSDq/NihbxBYsdh/bOhM7pEo3/wDeZtGYqpVt0DHHtPme5/L0gD3BVUyx44XX/qJ7PlwrpQWYmT5D2GtPEZCX6HIKMYiDynpbiskS/aZ0gI8u62aMYyDN8bmOJJefKKGeAkq7OUFrsNDLdbviNhR/c0hH30uWx3nwGXGOGxTmEEKYr/BohdGi4z5yLyI7miH618PbYq5Dk4GFCle4VwPXASvcBIsTI4TD9JbtG22FsRwcn9HtPO5zs0I+Gu4wvw1bAiHAOASlnmk4THeQRhc1owgF7gN1oatWmUY7hVNLKcIFKdeyyCDKV47vU0TdcsSd4aaLsKq1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obNDnQYDS3wtOge20KEetY2NGKlu9nGd8PkyBwY2GDw=;
 b=HhhhMAzfSkqWhqsllFk8LlfxWScFpGNdIsUju2VBltw0FGb/+YtviSdGeR3H2gs/g8qCXqtdSSF16xBpn267hS7WluNcAloTpJgZsclAxvmHNrNHE6gJu0jyWLf6mrqCGL+L6Q46pJeeD3+5tCELB1qVSQctiKuZ8TVyCoSogMIpAob40Tn/VRgKNTX5kzf0WT209QUUn2AnGzPIhz88r+/LZdmEK5XwRoJfVmwr3D9iakk2HhVI2yiCxnGtYF6k1t2doroHDQYKLYhR+0XonBy86VE557Xv4iJ+UQ7bA+iCrMFdAfSfLCpyz4yHY+l4ZF1ARwT6sPDPuGsSD6MJQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from VI1PR0702MB3711.eurprd07.prod.outlook.com (2603:10a6:803:5::28)
 by AM7PR07MB6562.eurprd07.prod.outlook.com (2603:10a6:20b:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:37:26 +0000
Received: from VI1PR0702MB3711.eurprd07.prod.outlook.com
 ([fe80::1489:951:b252:d571]) by VI1PR0702MB3711.eurprd07.prod.outlook.com
 ([fe80::1489:951:b252:d571%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:37:26 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH 2/2] qemu: rename deprecated --enable-trace-backend configure option
Date: Mon,  3 Apr 2023 16:37:30 +0200
Message-ID: <20230403143730.26123-2-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
References: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::17) To VI1PR0702MB3711.eurprd07.prod.outlook.com
 (2603:10a6:803:5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0702MB3711:EE_|AM7PR07MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd3d59e-269b-4e31-14b2-08db3450f1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n56XNwxYyH0lS29jqShCf0AaSRwiyUiKF8CshW+/HuIFMFbjEuAD5I7fJ9CIqVcUiHpBBsJOGlB4r29/ONMAVZMwHmp9vRTL5MzRDs7DYsYWl8aVaeWO52ZycVzk2qihe/8clQUovf4Bve7BpozlL+8DzeYEa9dTNj6VXzHaVP8zzjFPuVQxPiMZZjZHagxYJxiZktNTs5+0l5ra20RnQY5nYiP6CQ3i9heG9a+0fS85EBJHo2ZzhAjODZ1qgi48h/4liVwd4pN8gxhRDUKQUX6iq47blm11jzHfSZwFoer8ph9z+nN+1FAASL1JDQ1U5AmZi+oRDjX0H8g5zxOnPlE6LExk1cqaYZtyPPMx4g/rBSfWv50gaGr3I/ztjqEoia1Ky99Ovpu5UrALKOzIg0iKOfIblB3RbC44BkYVOWn/b0mIAsJD8x4vlhL1ZAo/MveJ7aygWVv93BI9vfXqjAmaP05H1CSimRPfFh3Kt0MzgvUKckw3grhzIOzWFgmEvaB8VnHkCiG7fEnxYRPLBBSQrgwegOZFWdtYcWLzrK0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0702MB3711.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199021)(2906002)(38100700002)(5660300002)(82960400001)(8936002)(66476007)(66556008)(66946007)(41300700001)(4326008)(6916009)(8676002)(36756003)(1076003)(316002)(83380400001)(2616005)(86362001)(966005)(478600001)(186003)(6666004)(6512007)(107886003)(6506007)(26005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RugYdVF8XJf3IfO6orSblUkWLrXWe0RJHjdL9K01f1NeI7RdG7B2Mj5aZzGj?=
 =?us-ascii?Q?401Ef15yG0io6M9/TpwCIEm0ve24oDRgj4biHH+CbJRH7q8AMJPyaN4THwVJ?=
 =?us-ascii?Q?hL75tcXZA44FA6uP8ZQpyTcLR/ISzRICs5+b+h+laXone21WYaqQ+FtNeKiE?=
 =?us-ascii?Q?eU1SCNlfUUtXbUAVYpTaCNSUqHtQyimmWHatD+O7GqMMWdMkYRKNadMCesL6?=
 =?us-ascii?Q?O06/0vDcbI6HGUODi8GnSDMxZL+V87ZF0DM+6WhM2ygxfShvLukjmsqacqz4?=
 =?us-ascii?Q?nHdB788u8Y0jXiBBfoB4gw5NNBL+Q4JR+xo6x4TWb63A+yQ9M3v0TxkTaKXw?=
 =?us-ascii?Q?eNYGv9D9PIyeAKUquTv9gsUnqZ5yj1noVnpP0syeIaP9EWYSaxuhvCh6feI7?=
 =?us-ascii?Q?dr0FX/5XHjRgoP6XZQGsksCjxUIQREISE//ibGpw6d4zk2AnvZgagBuvLkgO?=
 =?us-ascii?Q?/ha49KoenaGaSuvVS9jesXIuMRSHTtGyZ1bi4njv1XiumB2dvo1AJsNpplA2?=
 =?us-ascii?Q?ZSVakRZOh+BCCh/9xk8BZ5KM5SOS+p32/j12ESV5AMYLyHuT6EmtedQriW37?=
 =?us-ascii?Q?9J3R3B+ThylWAZTmrCrJnwilATaD9RvSn7qg1wpg6Wg8o2sN3vCsfFsgOdlr?=
 =?us-ascii?Q?+tV7jCGL29pF+bxl9BxspElm8Y/f/NccTf7JXFcKcMpMzjT1Any4r3AOKvQd?=
 =?us-ascii?Q?nDQor6zNzfuIkLReeym/oLfLbxX7JfDadFlN4Je6x7aTEsSMQLMWz7q5fyRu?=
 =?us-ascii?Q?+zpTP0HUSBPzLDb1Ul8M1Tg7nRgxpbW1MXGlj2MGnKA5H22Id5kyd68GiVU6?=
 =?us-ascii?Q?mDimfDFJfW7Z7glMneEvCtbhuUT4DxkdoEHS7oAYNLoZCMoyWuaWEq/32cDy?=
 =?us-ascii?Q?2MupOnpRzpgeDFYH5oOQmjPlf/SrCfxOJrMtV5Q/Dv514GsZuimu9vEOU1cu?=
 =?us-ascii?Q?Xw9ziuG9HzH5SVx8Jo+H3en6RB5YCyyYuap+sW5sDn7lR3H5CR0/Jk+TSeKI?=
 =?us-ascii?Q?RNczfzoa602QQo76DlJesMKvxm/boKUnNTUZS8f2FThEcSUrDQwrC7H4YkuI?=
 =?us-ascii?Q?Wd2yJ838IywzWxzqLZ2uxoo63TBT3sBbU6tKYLVo1KfPsSEb4zrv2OMMaofZ?=
 =?us-ascii?Q?DlNgA/qIbGHgpOnMswds0hZ0kPmG7NN5DWOPfBIfKCSIWc3vR/ko7jhOqXD8?=
 =?us-ascii?Q?88Rz9Sp6Uc6NISnv2lMGULE2o0gET9fw+Yqb+dgtdjcJQ4uqTiszxqxZMgDO?=
 =?us-ascii?Q?RpzZswPmWVDSWzNf0q6tqrM08yMe/13vihvkhKX8HqkPDbkYKr6ZOLoQESE5?=
 =?us-ascii?Q?f+UMXM8UZfKRQQjvSdCv9Ay/5DwJ8DFtuTVioyJiZH9qLZ4Fr9nL0AdHg9FQ?=
 =?us-ascii?Q?OLZtswKO10Ci3qgftdcaBvgqsGkOVT+ClukzuR8M5gQp6Yfta97KQJbVw7Gq?=
 =?us-ascii?Q?6CV7nkLEbVMjdvkODp3WwfsgEv0gVfPviBZuVkwbc7Yj3kxursbAUbb/adwR?=
 =?us-ascii?Q?DCPrins4Z0562P38OkrI0flOzCp+N7NeRUvsoOLDfspZ33LgBy7KdclNhIgm?=
 =?us-ascii?Q?4XbOM20Yf3ARKS25EZrG5X6Y5BBWdy8J33ZMzDZkmSAXyCG44JiGHM/or0kP?=
 =?us-ascii?Q?3gvn/cSi3D72sjqlbCwvNnM=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd3d59e-269b-4e31-14b2-08db3450f1d8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0702MB3711.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:37:26.5182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0VJYtEZyjHb8sWE+/QwOCBkGf7/iy/tccqPrFcckOWcwbSKdx/RomXJmRdaZ3fc+OV732rmdOXK8J8E/QU5aGHpZ/VJ1fx4Dd9g+goGtnVPsnyD7cWbVoGsigWSayGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6562
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 14:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179636

qemu 6.2 deprecated the configure option '--enable-trace-backend' in favor
of '--enable-trace-backends' [1]

Rename accordingly.

[1] https://wiki.qemu.org/ChangeLog/6.2#Build_Information

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index ae99a9e87b..f4426fc1f2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -207,7 +207,7 @@ PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-=
libudev,eudev"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
+PACKAGECONFIG[ust] =3D "--enable-trace-backends=3Dust,,lttng-ust,"
 PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
--=20
2.39.2


