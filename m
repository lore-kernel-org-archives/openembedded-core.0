Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E0DC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 14:50:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.67])
 by mx.groups.io with SMTP id smtpd.web10.20177.1713796776795601868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 07:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cnhind.onmicrosoft.com header.s=selector2-cnhind-onmicrosoft-com header.b=KWrjuO8e;
 spf=pass (domain: cnh.com, ip: 40.107.241.67, mailfrom: joseph.mills@cnh.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cy9+H1ReUp7axd5+5Qy9hQuK/JGe7nwCwGYzsnxxDDkK9fuyh3RW2UJjsM6yRun+I147fguRquWIfCPyPPgNrjDTu9Gnsdv8Jo8nMTTQYcKtSl8jCMMmZYPIy/WOG+PUW59ikQSFNRmzCD0zF+vskxQJcdD2I1tkF7tGtZqFhCwNKiGXXOi8VeGP4v28nItUNIy+YaGjCHknkZS/kH9dGYz6dGof/wPksohj1WNpgJtOavMBvGtMfebj6owH0SibMSXHXTWtOAGr/C3Tg2aL0QmEv8ha4P0Vu9tCPdB/Xkfln5mxE/oPgCWD16tmhWOHsOxHsQhL42sso9vgmpIyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqRXoPo1nVcIO/H8MIjFZPmP+pGR2GMVek9gKNMtVzM=;
 b=JaYQo214g72mDSW0kmx46ua551Dr5DtFQa7hnGGu9OuNJoFjIWsG1gTMqoZYxGr5gi/H0/ENW4Kk0LudnZunTsIr4bS2fNgwIsodQaCSxLESQO4qXuF+tsbTRUOpXiNyISbIqXzXwKaLd8XQGcEYj6r+FDGTT6tE9rsYKO/MS4j0iL4ern12AWyM+9Ar8lNKieFTTsBxVFZHhNw9TvuLxhjhBmDXscrWxxnNztVnEx0hFLqlvrphyFJPbWYfttOXi+wr7nwxUbcxtjURcThzApdOKdqsbyjd84er54mp+iGA82Fh0Nk9pZDOhZiCbrtMHBo67zaTxs3zAJzqCXvcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cnh.com; dmarc=pass action=none header.from=cnhind.com;
 dkim=pass header.d=cnhind.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cnhind.onmicrosoft.com; s=selector2-cnhind-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqRXoPo1nVcIO/H8MIjFZPmP+pGR2GMVek9gKNMtVzM=;
 b=KWrjuO8ezYrC9aypl6MpF1bGIB2Zl66gW+5EpIR2zT6r1ui2xCYmofXPYdQvjlzxTs3WzLOtBL4R6EgWNaCYE199YvuRqw6FziZzecF0I1tGCulKjz4QD+LDenYiVRPrClF5B2wL/avgbNq+q5gbtBDbqIphh/h56ZSEkmALmzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cnhind.com;
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16)
 by GVXPR08MB10452.eurprd08.prod.outlook.com (2603:10a6:150:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 14:39:33 +0000
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf]) by AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:39:33 +0000
From: "Joseph Mills" <joseph.mills@cnhind.com>
To: openembedded-core@lists.openembedded.org
CC: Joseph Mills <joseph.mills@cnhind.com>
Subject: [PATCH 0/1] Mesa fix for do_install when DISTRO has no x11 but has opengl
Date: Mon, 22 Apr 2024 09:39:20 -0500
Message-ID: <20240422143921.3187890-1-joseph.mills@cnhind.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To AS1PR08MB7451.eurprd08.prod.outlook.com
 (2603:10a6:20b:4dd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR08MB7451:EE_|GVXPR08MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1774ef-d904-4660-d7d7-08dc62da0673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sSmODZQ+cjj/re03aFiu6yAjTOJZ3nKHsIv1FZnRFVc2e1CyZu5/ptTL6Brh?=
 =?us-ascii?Q?ZRuq8frl36wenQnalwsfmIiooCrRBh3l9d3AjZ/KdgucmN9jZ+SwzV0HHXsi?=
 =?us-ascii?Q?5mcK4pE7b4uG7w0rkF04oy1fMXzAEM7Z+osESzay1ooAeKwWtEh014ut3Fvy?=
 =?us-ascii?Q?L/9317OQ1neiRnLOJ69DDCP8UnqiOOQEKORlR7k01Jr5LHe8OwqnG914r20D?=
 =?us-ascii?Q?b1xzr8iQwyyjZ3r2NNBL8vzc72tgv5huyBFC21h3iwpJX9k+p0a17ub8yKSJ?=
 =?us-ascii?Q?Vysn71vOQeepmccc/u68R7PBsiaQtYUOgDFaqk7Jd5YzqasnfE4MCCOHKnkc?=
 =?us-ascii?Q?EikT1QmfLv2Ihlnw/D+KpgAhOVNwUjliFVx/SzskeNRqGge8meKzH3t/mcDP?=
 =?us-ascii?Q?WxR1Uc3Gv2CV3uMTq72Vp0rixMSJrsqEuhNOwAkrFVwPMiF/fANPb0AV1jLD?=
 =?us-ascii?Q?TCCSZZ+4aTLketSzqxwt7y0AvyGpww5CP8cepheKk55aAs22J2CwEc8yKWF+?=
 =?us-ascii?Q?sa7W8i8ePPoNaJw/tjb3t/v3YwHmv8fE+gt79C7Rps2f09A1abzbXb/P5kIL?=
 =?us-ascii?Q?/7IrfFJ8HC5Iz3nyRLMLIm+/IzXSQf1ba3ra9sYETvJCEq/k9FRzGGQXQOQg?=
 =?us-ascii?Q?flBLWtLEk0uw1VpQtnaihM6QA1jGBx1Rsjty8dKUaOpYMmMGb2saQiRF0KrE?=
 =?us-ascii?Q?8hHFQRqs5NQ1n9hgExDqMKVNKPjLjcqc0by2oEa7lMffbXkQwjdWYuRswe8x?=
 =?us-ascii?Q?RymIUh97oP7UEgSROSmUet70uMSrWbQmHBnr1C8y596PF3mCybDATBCQ8Imj?=
 =?us-ascii?Q?k1BgEPpIcUNF/4nznayn812AUUcHblEta/yLr2VzmRAdoKhXCCBrG/hO2Mqb?=
 =?us-ascii?Q?DKJ98grZTYdfEKqKKtUk1+EkZGokOx6csCxTuNGx0F07fvZlVtaStaIu3HBh?=
 =?us-ascii?Q?0Yh2lzMLfMZ/ObEeNEpliCxkz+kgVqT6IiNap5PRPGtxTyrd0TVWJb4o9QKS?=
 =?us-ascii?Q?ckHQ6c3wzQL55Or9kbJ6XnYViJdPrsp3ZvKtWy56ruH20k7VYRSY5+ilRlU0?=
 =?us-ascii?Q?eQU+sabBHe0xHIT2yRtM72QB9zQmazmSjJI01lVPL/WJ7S5lIOC2bajMYzSP?=
 =?us-ascii?Q?1QKp0MYsKo+fkDqjrAOo6dbMpcCZXhf0yPvP9b78iiblHXlQbqguQR4AUx7u?=
 =?us-ascii?Q?diRpE3+S+jbh6gqQR5ShHADJOZZoxLh2dNDLOEnIEgaxdwS7obV9mES51VuT?=
 =?us-ascii?Q?MT9QE1u63zP65nTSO71M365AKLEwxSVmMo3XEM/uRzDire6tHFPTvt3adrUI?=
 =?us-ascii?Q?vMXTN8IN+bodYI/u8wqAYxr7WAtrvcJkdq5cBNdr3LdwrQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/5BzcQSPRrFEygvbytTnEGDFxHZPsvL70nzz7/mYjEItwAg6YTCiQdkifcAd?=
 =?us-ascii?Q?DWbobeU4BV/QaGr7b807lxQgIIlZTUrnd233Fhgrryxc3xf8n0OdiTmxst/L?=
 =?us-ascii?Q?6BQmMlYV5BFgn/nqzamlJYSO6RokJ523HTtkosdX32UoqQGEZboVFdmzbD6/?=
 =?us-ascii?Q?mg9fVNFAqcSCw9yRSyfgMpyzjajq9qd7T/Sm73YZr0HWZEZNIhcuq4f5uOPj?=
 =?us-ascii?Q?3m3LNtIRz/m2kvNdkL5OrG35mpLR2hVKj63FONb5wr4uVGTIrx2v7FJd+sj0?=
 =?us-ascii?Q?/wZtsdfHWxyEcT1rbr1vHDySkE36mwPkRzduslfWtIl99VW0XEKoe5VeYDrl?=
 =?us-ascii?Q?iS+Md+hoTf/1dq40fMc3hDhpNb05Cr7OUNnEvIdBUxMzEqCQ1vIRvJ9gvsSB?=
 =?us-ascii?Q?75MC5O1FSdsYypSaoGh1lcDKjgWGczUa3ugc7fWRQknzwbP3g75zRzTW9eee?=
 =?us-ascii?Q?91YL1q9w+Nw3/uMEYjZUkqaR85hAOR0wxey9aTqF1ZdxFwdZW9bEw9Kxad2d?=
 =?us-ascii?Q?AwIt4YAre346qAiQ1TNRUKX7sssvAYaEex/ZUcswmaEr1yxZj9vg4VHWdjvr?=
 =?us-ascii?Q?BFbrcFlO3W7l6WN9stxfPvdjjTgsri5brINKsDgB1URB1D+1+qxxkYwTXa2n?=
 =?us-ascii?Q?pZs2SD576Ii482uzZGeokXmlmNeBYG1C3m92j9Aqc7VJ9VRC1ib1pcdRPIK/?=
 =?us-ascii?Q?F4GHZClc/o8sKoruE+xEpC8Ww3rr2EMUBBBhATmkx0HTto2FHA3/rfKbgEdX?=
 =?us-ascii?Q?XGzlHwEcesdoNxS2MBYy00xNWTbUJQuNoITSYpY02AQ0nKQ0sAM5aBm3eph4?=
 =?us-ascii?Q?7abpCimuVxNpGDlhr7d7fLig0TWnEx4zQzIN10Hulcd8zYMYWPjz8/BlRL0o?=
 =?us-ascii?Q?P9CiKsG5ccFp77iwB7+nyMXtc3hdCAL7JCfEu9Qs6IOtXR8Qe71UkmlCLJ06?=
 =?us-ascii?Q?EFZLoXOliyvJz3XxsFr+/EdmQfDbYPl7wwaL3lPNvgGatozkh6GM9wVmSIOI?=
 =?us-ascii?Q?OWWNRRJX5DU8/rSUqeSpfMAWaKQNgI3wqSWnR8z2OiPddGoZ6xXs1bwsjPZA?=
 =?us-ascii?Q?4UhldZO7ElFRJ9Mys7qmTxSFhmcQwuqkfJX9o2FXrNWmcaUQ7QhrpOnoigiI?=
 =?us-ascii?Q?2ki/BIRNAZ75+1/7TPB7m25Ga12mqjnd9o2IBpgZrTtALjKYDrNpV1H5mz8j?=
 =?us-ascii?Q?ChS9T6Qk3Mzf57ycRm4Kn7L/OcLQQ8D5aPnoFDPp0u8vWGDEmF8+TwDJh3Pf?=
 =?us-ascii?Q?Uh27wKCb999EjSl+sxjgsFoOKbXF4vHlgTlwQ7GUebLYwXcHLigQRzVQecmJ?=
 =?us-ascii?Q?PtYV29v7V2tXUf68zG1cx2JQKqyEYBjS3RZXoPYahn8GLZ+PUZ+41nS1N/3e?=
 =?us-ascii?Q?ces1jjZC1Y6FTsws5tjf5WyYhZosong0a+G7mr1LpWSm/oyAVmL7WIMLwBgx?=
 =?us-ascii?Q?Jki9C7UrQmmCip8vBNG87wibnU8HckhaUsSacwZ8fbeJUV6pmIN1eUMmfoT+?=
 =?us-ascii?Q?zDoVPie7yMVo1ZrN/6U2dD1q+9a6Kq5bxGZ5fuDfV9yjPcbxojQEeb5s3yX4?=
 =?us-ascii?Q?kCXnQbo34fp/9Y4iNvuIMuy9yzR9xcMmm+xYww/euvDXSDGQ7cnNu8GHOjbb?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: cnhind.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1774ef-d904-4660-d7d7-08dc62da0673
X-MS-Exchange-CrossTenant-AuthSource: AS1PR08MB7451.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 14:39:33.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79310fb0-d39b-486b-b77b-25f3e0c82a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+Y5jO2YFOUsavAButOhOZZupuIwDx3VAFq4YgU4UqeVKj6Ze0HvmkzW4bR6UgEyYdtPUAjXkb7ys/hfv8Xsjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10452
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 14:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198590


Joseph Mills (1):
  [mesa] Update do_install as needed per upstream changes

 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
2.43.0


