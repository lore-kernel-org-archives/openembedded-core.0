Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA598C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:53:25 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.77])
 by mx.groups.io with SMTP id smtpd.web11.66948.1698313995038459217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=aGDzEyLb;
 spf=pass (domain: navimatix.de, ip: 40.107.14.77, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTWB8CcZNMCF3KxOHzN0rbBHl1fsT8szoq9cDEUzTy0HzCGSKmuJNlaFVmeguP7igh6+LXlb/kayuPjAwus3JibWUGR+KLnFRMyAA6TIhCCfSAtjae7tPSdPnaf9IfXG7n6xdx71WODmB/lEhRZcDczaeICzag9DvS/FP1Xt4x/t6QqaHlEu4HisS20rIG3lsf+NK8yTuW7rZ6/x9uPKUwmCFyvT/qOtop0mZV8kkGTeeah5xfrv0ZL+oCd9UWpzSp/HNk2dk6xSGuFHPw+Uz5mLyP/kQ2HxRAZB4OnL2R9Bbn/QdJtGpyb7mapFbQDRWzIzAAeBBQu/dUkY/x5Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPXfGatM8Qk0+G4u9sIwzsZskjn2+q22zEb+0Z/r4ds=;
 b=TTur7x/FS7WUYh1YEyOmfoAFwaL0Q8AKOWr5pcPurGO30aCXD6wTu2m7vaEIIWZ5jIZW/6i8sKW0iOosppS2B503/6p8x0wNny+91l16tGa6xznT5xjJMb5b5a6ZxKLTej27EbHoMB145b01x7tV/g2kT0L+zV1Lam/k9RpbxoiLvyyKfGJfkiW+O8MGLedPb4uBJ1OFb3pCuiDeW/jQ1CNpFWgxY0r9/CXvTze5vvSDn7oyfoq4EQes5hc6O1Ed9Gv7wzbvqsKX/NPihV+YVcCMoH/qhMf3fSQv2hx8bTptKW2h+eich9hYXl2b7caJwNk3NmJM11gWee24h95GQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPXfGatM8Qk0+G4u9sIwzsZskjn2+q22zEb+0Z/r4ds=;
 b=aGDzEyLbxcLsBknnZxm0t/9fuCDsHiK0RFyJwS3/P7OLEtjRZyxcq+axKhZuRVZkE5AIs+4QVi1Uxf7sX0Wg5iHkmfbDCeDlwg5u1hFMeOowDUrSEX23E54BOowZHM7I2UFRhZOaiIE57D0xwRMPQhp+W8W5YYQhk7ekGWgbgHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DBAPR01MB6838.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:190::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 09:53:08 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 09:53:08 +0000
Message-ID: <8e845c93-fc88-40d6-8ccf-3d0789c68446@navimatix.de>
Date: Thu, 26 Oct 2023 11:53:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] openssh: Don't hardcode the dir in sshd.service
Content-Language: en-US, de-DE
To: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20231026070440.737673-1-mingli.yu@windriver.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20231026070440.737673-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::8) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DBAPR01MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eded061-f8cc-40cb-e729-08dbd6095b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vEcsNWRbxJMZ7VJSND/6yWUnbCTUlpamlcPPZurXWWcfbH298N8OAdZGcio0p+CyImyRcc9d2vuPqjQkjCwTvKKtnhBLGev4jLzOU1JiScotI4Q5sZltivUkEZ5LizbQfsmVM9jZc0h3/A6aApcXOngKpcgY6QbAvpWDJQAdng1N0QTv68RUlxxB5KM72Bf0kgdUS19Ynl9ny4xWQp9xqW3Z947ughwDouyaLg0K6FwF7MDQXKAsDkNJgg0dlcSZgHBeEWOAf66zCeRTc32IBvylC/B1v34skh6qb9wPE+vpm0KRg/5cT0FKmQYxGmxFVkA/eR1Pdgt46laL6Wqok+pu7/MMurufQ02EeHMppTtqa7Gqi0/PDgjKkF2zQzkMLc4yyT6lN/vft2hL8Go4yDPOzrqvJteGxpR0nGIrasKLr+daYL8tpeTEnlxQj6pdthmQP38Fr8v2m78PlhGXepVieo2ZeAP2y144Qp4aBcFINqrNiMqBaDRjGBX7FlyKBXGdNg+KeGoU0yegjJ3OYxOvTRn66jbofhh7TYFPA1l7avGQlx9kqTGB5E0VihiI7Q8yQWZbgmKZuwmljpxuhwFlBMArEQ1t8A996SbaWrsb2qFu9wZbBZKzHHjjpPTV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39830400003)(366004)(376002)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(26005)(31686004)(38100700002)(86362001)(41300700001)(2906002)(31696002)(36756003)(5660300002)(8676002)(66946007)(8936002)(2616005)(478600001)(66476007)(316002)(6506007)(66556008)(83380400001)(66574015)(6486002)(53546011)(6512007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0T1jJQcNQPNBq+uNWUuLdI9X0tGXk/ZzzaTYe+kXYZKd/AH2n0KYImEKsDIC?=
 =?us-ascii?Q?ykoeeSvWQqYln+BFT8+//4cGzcdRiaDub1XI8FoXDPuzsFPdeRaVwjbJvYap?=
 =?us-ascii?Q?LVFAZaLUemA4YZPo1VgPnOw9UBQZ7SsZDrpWwRPd8keQE6HeypSrNBNwYFdL?=
 =?us-ascii?Q?Gk3QJuvj2XRzRkAbrlXdO/ajfvCfPyl4yLDMJK7+T1JMH1KHawD4eDb+DXS7?=
 =?us-ascii?Q?8hO2fbkT7SlT/joFCZcdvCaMy6m/APJkMeuBms2BQcb1WlZiWZ0k9AzZG1C5?=
 =?us-ascii?Q?fIByRZqtNK4w4b8nCzog7l6U5/m/Xw9ILdRhG801lbTSZqo5Sr9WCPA9ozrM?=
 =?us-ascii?Q?pjnIQcbrrrFnFg0RcGLGm3eew2qnaea1QH50cACGZXlLlPuYPazURUrLrryK?=
 =?us-ascii?Q?84F9yMo7O88aMH7051J51MvN2V9lk3vt9dBC7z3rqQMWPbiDpAVhuujXqwtI?=
 =?us-ascii?Q?zvV/7thPhXSRkMDHBOA6RZVCkDhut9TA6uI1sA+TM+NfGJknguRYxSARlRqY?=
 =?us-ascii?Q?OxnMbp5uIsG9NVcmDP1dtnYkAJvuYtn5ICIydJhyQ1Wr1HZ//EgP6Ecj4Sk0?=
 =?us-ascii?Q?m954koSyXjWGYz+MelNRHQes3vymPyFcUdEGKir1vB2+SEzer6ou9kOWa86r?=
 =?us-ascii?Q?tIKtF0Jc39iLT/12QukFZg2MuMdDXi492ItaD8X7LTTgyNewQuCBA7/6AhCb?=
 =?us-ascii?Q?sVxdgFZCUaY+lYlKTU2ShLG8WHGyTXsO+FCoRtDmVtz9HnOCRduHegaskskH?=
 =?us-ascii?Q?jJyyprChG1D4EF88+69T+B8nf1Fg9RATx/ksSEWBKFEG8pdInjlXgRAK/Gj/?=
 =?us-ascii?Q?g+VyBLxnCuqpFTODqRR63evzr0OZB1Yk3aRSnRGHe9xzYxgF5/cCa5VJlWyK?=
 =?us-ascii?Q?JND+UWRapnUmiGt6mZ0+U9Es5vxK6eIjH8VPOomFl8w929I0V4BW1x0ennof?=
 =?us-ascii?Q?QRc+QhbhJi6HVUigxPVe87KHvJdEh1BUOX54wFc0MppOrR64u48OSclAcdkt?=
 =?us-ascii?Q?dSTqicc8oj5bZ/x+cvGkp9kxv16mteNvK2D/yHO2z2qQWPZou5PtVWWkUt4A?=
 =?us-ascii?Q?XN79bD4HhzXIBOtS1xdSxzPYhF5sG/2+gE85Px8y8E6WRqxHBHT5VzAc+hVF?=
 =?us-ascii?Q?1myAfa6DGeMtFNLK8fDlIfTInZyUMqtzbE+Puqrf59xYN1OZ/OqGhBRvfp9X?=
 =?us-ascii?Q?UoONPx/hxHeQRDMO7AeMKMd4Dwbh/JUmmaqvU16Q1PVvrzoNK8utSIplky+y?=
 =?us-ascii?Q?ReMoM5XrAkm8AHiCUQqXOPhOi3+fuK4QIq9BymtyCvbhqPbMeKCgXNOXNrkQ?=
 =?us-ascii?Q?sX9AwkxC9jaWJTy9NM1AZzLpnE5LRYRAJcVTLByOt1QtfNK2Cfi6VDtoR9Fd?=
 =?us-ascii?Q?bfM84U8g+aqYEm1IeJvxrcvUturHchhLQdvG9TZWGNbDydXlbp3M3T35tEyr?=
 =?us-ascii?Q?uJxcvWiD2FUoYyzwT6BLtZ1DcRoIDcM2Ihgxt0zEYknunzlotNYFPA5GLDF2?=
 =?us-ascii?Q?K6UGICy/beqmGMbXIaTKY3DOe/EzGbEuG8f4ZyzlodiiT6i1ElAReKv4id1z?=
 =?us-ascii?Q?we3CayRl4KdKZ2/yQ9tbqmk8XK8hgCU+x1/ycGFnd7rx7A0YpWgPz3N2Fv/r?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eded061-f8cc-40cb-e729-08dbd6095b56
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:53:08.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq53swsf5PDhP17cpGGybOvCLvvs5RrM11I0xxdg08Vf57bsMG0RcqfGffs7f9yxH1CSz7HYyeq0sJ/ccVOl322Y8sY1fX0GCah31/tDMWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 09:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189704

On 26.10.23 09:04, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Don't hardcode the directory of the binary in sshd.service.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/sshd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/met=
a/recipes-connectivity/openssh/openssh/sshd.service
> index 6ace67d8ae..2a997b656a 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
> @@ -6,7 +6,7 @@ After=3Dsshdgenkeys.service
>  [Service]
>  Environment=3D"SSHD_OPTS=3D"
>  EnvironmentFile=3D-/etc/default/ssh
> -ExecStartPre=3D/usr/bin/mkdir -p /var/run/sshd
> +ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd

How about using `RuntimeDirectory=3Dsshd` or don't hardcode any path and
call `ExecStartPre=3Dmkdir -p =E2=80=A6`

>  ExecStart=3D-@SBINDIR@/sshd -D $SSHD_OPTS
>  ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID

Same here. This would match the example in the Manual page
systemd.service(5):

```
ExecReload=3D
    Commands to execute to trigger a configuration reload in the
service. This argument takes multiple command lines, following the same
scheme as described
    for ExecStart=3D above. Use of this setting is optional. Specifier and
environment variable substitution is supported here following the same
scheme as for
    ExecStart=3D.

    One additional, special environment variable is set: if known,
$MAINPID is set to the main process of the daemon, and may be used for
command lines like
    the following:

        ExecReload=3Dkill -HUP $MAINPID
```

>  KillMode=3Dprocess


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


