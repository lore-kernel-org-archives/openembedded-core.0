Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B52C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 13:02:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.39])
 by mx.groups.io with SMTP id smtpd.web08.18929.1636203737057803541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 06:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=HxFq0DDI;
 spf=pass (domain: outlook.com, ip: 40.92.91.39,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffOEZCII5XK3fzAR9Y+MnQqwjx/W2vPYrt0MveIi8BSwazErvW9mrY5xWqCzT9/OGYkosJh2d2mANYiywRV+Pmkj1TYve6NbVSd4GFpuPMoScEGvgBvr66xzV8Wft7ln8OjEJyqaOmrS0BXrId3nRbOr5aDeUGgpfZy1b0jJ0+d13ijc34M1uog5SWgQ1jS4V6y3HskGMwD6Qp4hM6clDM+vZDNLd8VXE7Krq+EhGz3S4GecLftR7cQcKURKkwoYC/7PXOYEawh6m9cjx5zGGg84hBnQnrbnG2P0sB+H4+JivXdY9/9Heiem2AH9eDd/ZoOxOzCCWeQuh8Mcnk7aCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lG/QvyOCKUqzsbZ6EFDAH0Lf2JOFLrBFESf0chCsOw=;
 b=J6epUYL8vOiuXIqAkD/3+mj80oNxsTGsCM7VsLNcThRx5Hf5QucfWly+IXg4/cF4NDqgeA7aV7uQgVzTiaQey5gWqQqWHjsp90F78cXQCV2vk1hSqpEoHj2Dp5ZA4mI+rPUZrU7Mdm5rd+h37IaKfvo016YIU89zCooHj7LxV6rBLgeKT0HmVjyLx1xEUVktEifOi8PlZJCv8Wp2fwbryAIlzzpR+rLqPr3MPZsWPo59MCqIdhqby0TLYq67L25mU1C/KgncboM/pMZekZ9W4N1ku62/kDu2L/ZjiN3vxQJ7rUeALwEzxmFwoZ0AQDCWFtXm/2ochA9/eW2SM5WTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lG/QvyOCKUqzsbZ6EFDAH0Lf2JOFLrBFESf0chCsOw=;
 b=HxFq0DDIAL+c6+oGtHJuknv0wJXqUFtvjpSH8PIt4LrgcA7vxoG1466Ux/a0x5RDBQ4NBMOUOdH+hYWTAENIZyOuBxQLk4EaB22AZXo1S2w6VLh5T2NT+YmN/AZmEDOs4aUwtsLlsP8Vn4uMyPoaUu03WO0jTbjqBi7rfKWpHMemV+uki80wWVGO7RjCkixLlToQ4l6JW4ahSInWJVtgqlsvVv0m1+ZvUncL53g4BJ6+roSVf1hTMurXCZQDVwN2pGDFNF0VHD/G0al0rzQmwcJDfBVFVCeYtZFMcGoXzW9mYu65JG5bYyQtVlkYrEijVzqS6nMVHiCWKQY9MoNhTA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2625.eurprd09.prod.outlook.com (2603:10a6:208:e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sat, 6 Nov
 2021 13:02:15 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4669.015; Sat, 6 Nov 2021
 13:02:15 +0000
Subject: Re: [OE-core] cargo-native do_fetch error
To: zboszor@pr.hu, openembedded-core@lists.openembedded.org
References: <f0e5dc36-2447-1501-84da-862f43ed5f83@pr.hu>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642477F746163FF39C94CAAA88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 6 Nov 2021 14:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f0e5dc36-2447-1501-84da-862f43ed5f83@pr.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [UL/ep0+jK7oTP7arrvUfILeRfEJ+8fS6NGmaD26Ei9Z/G9HPUE6Q4r+2Ji6joM1G]
X-ClientProxiedBy: AM6P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f1397b0d-7fce-00ce-1428-c8f766ee461f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM6P195CA0039.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::16) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Sat, 6 Nov 2021 13:02:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2ba0fa-95b6-4f98-e25c-08d9a125a78a
X-MS-TrafficTypeDiagnostic: AM0PR09MB2625:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	COdQrTbT0sIu+jPWWEz86pyk8vB6zH87LFvrGGkHF6YtVaDbK189Npnsm2ngCc89gzy2h9dVLI0HB7ejANB23kkiETYChePhHQ8Oq02c37TGxM6RHonqthV7EDnH5S3ZnUg+knGoyRhbBdGu27faIJ6ttfSvkROjaO1OzHNKR4JkwPwfLtCOe/2v/kc3Pnk8mnnJhFTiWllJN4Aw249vDBjOUxxXAHOLk+9XSYsOBCvMRvD8eZZH15XgdnF6ZGgaEo7Xy3OYIQm/ekCi5Nhge3VGhSCx+PlNUYWkeNL/PCgxd6oqbJ+T/CwUeM5k//pj/6v7rqDzDanFx0+XaUtsT37vD/afDV4lY5rqoj9dtk3X5vbA9S9msrVmLYZV6Gu6/dGzAjZGkq5k7YijQLenT3LbYYXf+nCbAh0VqS1J8rBYqBHG42iTME7bnrIdkpTVz2f5/uw4qhj0Bg6UalDlCZJFpkv32CikT7umZ+DS5NxQojlwQxNOOAuoN39tAnbAO/N7axVDti8Gjsk5tUv3JM8VRwyiyI9qOcyKiNZnKZQeBR7dT++dMR5Edp7OqJuWTi0lcNHbb4CMB+7SkDDODBOcnqbtT9mpeyiKL2NQmHHv/mNC9kCiqJTdJ/jdNuZc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QOwgts34oRoO1f9r0IknxFb4gInCVWcyRZCfVs8XBotEOGTdl9d7JEUgQPh3BFS2XRd3cRPS2tOyHb69tCJFfKhgXmyB395YrF+dsYHDBteTL86V8YYwvmmTUGMedjal+r86uw8mBW9QSZG4tjzI29MT9AHU6BoA8Af1XxCHV9mQBeA9GRuQ1uTJnlDHMOG3qhMQk9/NOVTxLBFB/Qn/KA7LhfDqCMmoiGhYXHjR8aqYEuwjAectdilMq7eHKUH1l/0Obw1HuhqpevmldLEwWz9duASLVwDO/6TddjZlHlfJI7TcVuzETC2y2nZLp4p9y0Z75169QWmnrV5Ni6V+t9l6ZKCLevoX7w8/Hi0Nc+E5wjybvihc5RJpwholSGd0dm1xcfVdYEXauQLmATlDFFUf4XibWBn/fam31niR2U3wKU3w+35RzhzN38LT4rc+4dsr/RcMh6JznE3LpaTgtFMoYXCXRXt8Rj8VYF59S5rv8dGiAQv+gUv8W2FKWor/pv2IUsVlXE+wGDV+xzB5dDm3s+78ft6PG+688mDbBGS2SM+GLPv88AIBGIhMfsu7D8/bTZictcR0oUVZTOoOK+ZFbi9NvPVLnB3zNm5h+B+wbD38Uqk1iDdNjSjlCGzosBR/AJLfNvfe8VUWo/c7Dj5hdZZ4jzlr/QbdLInzlOq3ImQ5dySUBDehY8rXRaqnesMCBLLq1DeYMi3GirDPzUdcyQVmDuK8QU/e+T6tB6FeKEBX8bFwHtBrA/5Wdi6X5aBEVRLpDNR3FoRRVGN49Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b2ba0fa-95b6-4f98-e25c-08d9a125a78a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2021 13:02:14.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 13:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157939



On 06.11.21 13:49, Zoltan Boszormenyi via lists.openembedded.org wrote:
> I tried building my custom OS rebased on current master.
>=20
> I got this error:
>=20
> ERROR: cargo-native-1.56.0-r0 do_fetch: No checksum specified for=20
> '/data/genericx86-64-yocto-3.5/downloads/rustc-1.56.0-src.tar.xz',=20
> please add at least one to the recipe:
> SRC_URI[rust.sha256sum] =3D=20
> "f13468889833c88e744ad579c5d8fbb7ecb53216159b54481a90e5dcdaa9e320"
> ERROR: cargo-native-1.56.0-r0 do_fetch: Bitbake Fetcher Error:=20
> NoChecksumError('Missing SRC_URI checksum',=20
> 'https://static.rust-lang.org/dist/rustc-1.56.0-src.tar.xz;name=3Drust')
> ERROR: Logfile of failure stored in:=20
> /data/genericx86-64-yocto-3.5/tmp-sicom-glibc/work/x86_64-linux/cargo-nat=
ive/1.56.0-r0/temp/log.do_fetch.3495409=20

Could you kindly double check your setup, because at=20
meta/recipes-devtools/rust/rust-source.inc one will find

SRC_URI +=3D=20
"https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=3Drust"
SRC_URI[rust.sha256sum] =3D=20
"f13468889833c88e744ad579c5d8fbb7ecb53216159b54481a90e5dcdaa9e320"

which looks okayish to me.
And this include is direct injected in=20
meta/recipes-devtools/cargo/cargo_1.56.0.bb right at the first line

Maybe this file went missing or was otherwise masked in your setup


>=20
> ERROR: Task=20
> (virtual:native:/data/genericx86-64-yocto-3.5/conf/../layers/openembedded=
-core/meta/recipes-devtools/cargo/cargo_1.56.0.bb:do_fetch)=20
> failed with exit code '1'
>=20
> I found no bbappend for cargo or rust in any layers I currently use
> so it must be a genuine bug in Yocto 3.5 at the moment.
>=20
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157937): https://lists.openembedded.org/g/openembedde=
d-core/message/157937
> Mute This Topic: https://lists.openembedded.org/mt/86862283/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

