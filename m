Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8661EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:09:55 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web11.4495.1689188994632543688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.6.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIU86QFJe4/ouECnXggrQYcIA7UVmiawANH8l+Fj9tLn1i6g/mZcUFYdpSjV5nS/2EHbrJ1UAJM/c034MXG1HQeBsUU6qH8OCNGtFUcOs8RfES/zlGPUQhraWiGvcbSCrxmfk8NK1dmntpr96HzX3uiXlcF+WIDrvwEu5axPJ6nK9PuhMWEaBZSBPdmYbKftpt4CtWn1eJUfrdCm4j6mcZEJOVmLPcBM7ZUJpdGCb+X6hv5+v0z+lEYWfva6oyTGLogpc0OzotBcJ7siaHMDSCbrDX99LYvELH4xZ+xtuF2zTRBW1VANK5QjnGG5TU0fuptVDYqKF8709znQQ9O62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSaDVhd0+A3iA2sa0wmWS36SMqy7H73cQu+sk9WR0lk=;
 b=iffXwwB/4WMAmUPu3suRwSNkKAKD5KuMJJNet3Gs04R4qWFtyJXoG/0tA7JaHtC4T9/zOd6aaoNvjmH4+rd6bhWH9C65G9FG51MXdRZE/pdL71TcrmD6wsH3cFCUgA8vjbbiSjrL+Er1Mr2NKkqVfjuV3yg9tgpJ88kKCZXCoJq5QHUq/rLmdr2rEmLy7KrUap6bpN1Lf/d5m3lv2Vpa3bD4ht0KRSTxU/QWjmbbVE9vxrnETPtJl98yx+zwuFvu7uE6W/msEiYmgLhuaHHK5FJUJjJ525/xrGRV0aGBZ+dssajxGQ9/n2R1UObSPHA8UEGCl+fpjq0FEJJMSjGvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSaDVhd0+A3iA2sa0wmWS36SMqy7H73cQu+sk9WR0lk=;
 b=wVYJYmh4j9veqebm8mOwZJQUcHLaqvCj58DbE/rSQw65+ZZv9Sex0D5/B3/RG+Mbedp15Bkufk5ZJ8axvfH7ssjvKFzWXlQywqhQl7XObAHDJUSKq95H9w4KiC3xIJLX7oFn0BfeLKPscvFakDatNP9VwfkpkdTu4gEGzQnB364=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 19:09:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:09:51 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support for
 ACLs and xattr
Thread-Topic: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support for
 ACLs and xattr
Thread-Index: AQHZtLwIi6IgOc7c+keMy3kvd+UzJq+2WXaAgAAlqk0=
Date: Wed, 12 Jul 2023 19:09:51 +0000
Message-ID: 
 <VI1PR04MB53737B94A7DA676F7C080EB69136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
 <20230712122558.711029-2-p.lobacz@welotec.com>
 <202307121654058c48624b@mail.local>
In-Reply-To: <202307121654058c48624b@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB8PR04MB6972:EE_
x-ms-office365-filtering-correlation-id: 244aaebe-23f1-4430-88af-08db830b91d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9mNvkoeXHYPaz7YffUXcKl7AqOTSzOtfqyDUKU77mFi0cIk5FNvOUZDfLNuWEU+hCdVQTzdLvgUqCab5dMgPysxOvkE2LJjR/3durb0UEZylrskMaQPrspP9YAsZQZMkcPFzxI6wvKuoGPg8NeVfj7tiZJ54rYN4Twklm6g6ss0cfBzbdSgspuWs9w14RoVM1CmEljgAsbYlZkb+jD0k0ty+NiV0FT65vWWd3uowQjL5dvPgaeMXymq44dj59s0uZkIu2uLHtTzCLQ6q4Pf7dw8mldr1LwcRXSVkAsej1218HBXIodVkRAa0Ag/UGpK9V9D3NVg9XahouuJRtF4bJh5hpqUO0N7X6PFqiBApEkgrquEqtgQUjz02EHf9NjKXSA0iOCaJtDr05fB7MgXCUyZcG4RR7g+mBCfNHXqQRHDUW1E981QCHTi2oSDsHRznKTAH5pANjWXUdDjjzoeuz3Xtbszz4C6X5rqEUNJ9sgfxYXi6nFigo+ClDT6V7vEUw1qMH85pWQeoWG24S4uthsXfHYplkRMfqNOXUGk8Xmh0Q5oSZKqazaDIxcsgTYIo3p84gLTH6pKYZ1Li0dsO4cNImAjqiUMdSJh4dbYO8pg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39840400004)(346002)(451199021)(83380400001)(41300700001)(66574015)(6916009)(4326008)(64756008)(8936002)(66446008)(8676002)(55016003)(66476007)(66556008)(6506007)(316002)(52536014)(38100700002)(33656002)(122000001)(5660300002)(26005)(45080400002)(966005)(478600001)(38070700005)(86362001)(71200400001)(7696005)(9686003)(66946007)(76116006)(91956017)(186003)(166002)(2906002)(19627405001)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?tYiH6QcT1Y/r+wVNJXmwxkGfCiy6CSxTwSE3UplqQLBK59HTbc7uwebWnb?=
 =?iso-8859-2?Q?TTWOo9Ogn77VkNmacJnKqpUr97lcyzcUUqperBBKCadC2QXuiDm5RAHUoe?=
 =?iso-8859-2?Q?1DskFZIrDBRYvzczGBPy2cNPaDdU9YLE96Jage4/fx35IUDjHnxiNM3/2c?=
 =?iso-8859-2?Q?DXFg+UWGW9OLnDbSaG2EJOueDknXDOrxIllJ6VRsxSMXF5jGTNeeILrOb4?=
 =?iso-8859-2?Q?hv55Txl6KB6fdPrTx2KKER5Mgs+kT7SmjYsnfhT+nfTjHPuE5IJ35U/88c?=
 =?iso-8859-2?Q?DnDycmWzk5xZnPhxTRU+U5WhDEtrgakhXFQyT6/B0gB5KODPyflUEF4/I7?=
 =?iso-8859-2?Q?1UOaUxrfRReBPn64IlN2UHZcmvwtbAqzLFkSMjcDQDpQvPUpmEl5UN7Com?=
 =?iso-8859-2?Q?iVFFcEZgM23xHDyIafpt9ViyaIqd3Z22EQA6aZMEqIQu3ULMDWRP5Pch+T?=
 =?iso-8859-2?Q?oTH8zhLERN2XI1lrdbWS8vY5GzXXKLXhbq1EkPnm1qy8CtuF6+sGIlFzvD?=
 =?iso-8859-2?Q?YImJ+3kfXpHtTkEhWpDL2/4efVG3+vGhw8hVB8pn4T/5WhoGmP4dawJjdb?=
 =?iso-8859-2?Q?6kDQ1zcYe25Megmoh6EgK34Tz9St0o7TMj4DhqvJYeQ7VYkw843Ue1ijkV?=
 =?iso-8859-2?Q?Ewoh8RZMsEfEgA/OZ0n+P0SwuTTbl/rAiPF/e7xK8JKl1bzkWF2l/ZZ4ci?=
 =?iso-8859-2?Q?i2Btgs49Ml6mXT4OPG66kEcT77e1ZTUZ9i5AsDKVtr3wJrxcOQKFaoXlRH?=
 =?iso-8859-2?Q?m/qoiWHnKUnCr5dTpMyQ4vaMxu0EUUvOcwy0JTBUOTgVs7z2eKLLcv1JCl?=
 =?iso-8859-2?Q?Nz7wGoxUFmL+cMhlZppwVN65THuu8NkCBLjVXjkq6udwjC9WeiqWJp33Xq?=
 =?iso-8859-2?Q?T/4J9xqCqq6wfBBdM3hgEFHoj7uJGApkr6PaPT0aXZxXyOO0rXVnQzxOSG?=
 =?iso-8859-2?Q?yePIVi3oj8+t18+P3Kt8riFXtkhoQ+N94oUZ+EE4tz7ESSvIt6fVuFUuAS?=
 =?iso-8859-2?Q?gJeWR+R47aIIUz6J6EqP0QA/6FJFOggzXl0iQM0rKuyREVFRV0KU1QImc6?=
 =?iso-8859-2?Q?BUqvLuZezHmAHL8QDHKUz0f0KXBPfRWKAAWWFzoJWGPBU96B5hUljbcUgg?=
 =?iso-8859-2?Q?OSwY5xuISs2X6ETzwwngsuNEzW6Fkq5Es0Wmwo6fZy5GzIgBrZ13nQI+GC?=
 =?iso-8859-2?Q?xnJKtmwGL/vOlNkaR0SIcrKnskKFThFE4lr2SV11mQkLlvoqUB8dwp/Gds?=
 =?iso-8859-2?Q?nHUw2TatRA0QqsY1o2LAaAp6XxUafrf24FOXRiFPfaDSbcE3v96DD1uiAI?=
 =?iso-8859-2?Q?pJb+ShSAoJWJXp9xxswlDwc9v25KbC/bW0p9m8g3nupaazrVOLG+YgKzP7?=
 =?iso-8859-2?Q?4+rAppTJuVPL7b49gwKuo4QAlIbS00hJFKlDqc1uSjsh980/22eVjH5cZb?=
 =?iso-8859-2?Q?wgjcW1i7fUyxETv9gn/c/R/rQ2gbcwwv4pE7z5DgGLAo5BFqMPIxChtb+w?=
 =?iso-8859-2?Q?GbZWay1Go+3hXb/oicWbTRqG51a56hXHw798itE5ecXmSbuIyoLne6VHFY?=
 =?iso-8859-2?Q?MXigu+7jTvyFrVe0Wwrq10OCOILPB6oMu3MYQFhJYvrZ8Uk8nwkd37nOwP?=
 =?iso-8859-2?Q?HDtZZyOvEfPofVKEGSUkmSapbcI3pRbURA?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53737B94A7DA676F7C080EB69136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244aaebe-23f1-4430-88af-08db830b91d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 19:09:51.7829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OscX3ueKnGE3TgqBu+jw1AFzqsnGLUl44b4Fr8PGL8YkzhQhxZLGNFhSRMVQZFVPgwRd3NM7FKZCIiRx0W9Dmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184220

--_000_VI1PR04MB53737B94A7DA676F7C080EB69136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

HI Alex,
this is odd because that is not happening for me... I need to do some check=
s.

BR
Piotr
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: =B6roda, 12 lipca 2023 18:54
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support for ACL=
s and xattr

I tested a previous version and got:

ERROR: run-postinsts-1.0-r10 do_package_write_ipk: Fatal errors occurred in=
 subprocesses:
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work=
/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zero ex=
it status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts-dev /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zer=
o exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts-dbg /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zer=
o exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]


any chance this is solved in v4?

On 12/07/2023 14:25:55+0200, Piotr =A3obacz wrote:
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DA3X2JtnQjiM0AsezU9PYnPmYa2e0TpjdRyIRPw0INZI%3D&reserved=3D0<https://grou=
ps.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..5e151be3cd 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.co=
ntains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DIST=
RO_FEATURES', 'xattr', '-X', '', d)}"'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184190): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184190&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C0efc7fdd53c24f55f7=
2108db82f89ab6%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247776502053=
494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DFpPC3vbDQvde6a%2Bfk344UcPIBMDY5=
YUgja%2BsTfgksbA%3D&reserved=3D0<https://lists.openembedded.org/g/openembed=
ded-core/message/184190>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100098284%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DmM9Lg8I2QMHhaDHdsFUjiQNBTUNaB4%2BEj2PAPp27hp4%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100098284/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3D%2B5zFOTfuLmQUz66hqJm6HfmZEtD6eFgSQ%2FykKjvH9zY%3D&reserve=
d=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.=
belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C0efc7fdd53c24f55f72108db8=
2f89ab6%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247776502053494%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5YnjSEIXmgyT%2BrFQSzlacMVqkKUAiM5y2hvZ=
Ho%2FxzI0%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB53737B94A7DA676F7C080EB69136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
HI Alex,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
this is odd because that is not happening for me... I need to do some check=
s.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> =B6roda, 12 lipca 2023 18:54<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support =
for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I tested a previous version and got:<br>
<br>
ERROR: run-postinsts-1.0-r10 do_package_write_ipk: Fatal errors occurred in=
 subprocesses:<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/poky-tiny/build/build/tm=
p/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky=
-tiny/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/all=
arch-poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work=
/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/=
home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-w=
orker/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/r=
ecipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/b=
uild/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sb=
in:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-lin=
ux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-wo=
rker/poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/bui=
ld/build/tmp/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; run-postinsts /home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned=
 non-zero exit status 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/poky-tiny/build/build/tm=
p/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky=
-tiny/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/all=
arch-poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work=
/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/=
home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-w=
orker/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/r=
ecipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/b=
uild/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sb=
in:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-lin=
ux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-wo=
rker/poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/bui=
ld/build/tmp/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; run-postinsts-dev /home/pokybuild/yocto-worker/poky-tiny/buil=
d/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' retu=
rned non-zero exit status 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/poky-tiny/build/build/tm=
p/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky=
-tiny/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/all=
arch-poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work=
/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/=
home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-w=
orker/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/r=
ecipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/b=
uild/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sb=
in:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-lin=
ux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-wo=
rker/poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/bui=
ld/build/tmp/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; run-postinsts-dbg /home/pokybuild/yocto-worker/poky-tiny/buil=
d/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' retu=
rned non-zero exit status 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
<br>
<br>
any chance this is solved in v4?<br>
<br>
On 12/07/2023 14:25:55+0200, Piotr =A3obacz wrote:<br>
&gt; Extend OPKGBUILDCMD variable, with additional parameters, depending<br=
>
&gt; on target distro features, in order to support ACLs and xattr.<br>
&gt; <br>
&gt; With fix pushed to the opkg-devel:<br>
&gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">https=
://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.googl=
e.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DA3X2JtnQjiM0AsezU9PYnPmYa2e0TpjdRyIRPw0INZI%3D&amp;reserved=3D0</a><br>
&gt; opkg-build is able to create tar archives with ACLs and xattr.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-gl=
obal/package_ipk.bbclass<br>
&gt; index b4b7bc9ac2..5e151be3cd 100644<br>
&gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-ta=
rget.conf&quot;<br>
&gt;&nbsp; PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Program to be used to build opkg packages<br>
&gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<b=
r>
&gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; &q=
uot;${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot; &quo=
t;${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;'<br>
&gt;&nbsp; <br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-versio=
n&quot;<br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar=
(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184190): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184190">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184190&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DFpPC3vbDQvde6a%2Bfk344UcPIBMDY5YUgja%2BsTfgksbA%3D&amp=
;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10009828=
4/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100098284%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DmM9Lg8I2QMHhaDHdsFUjiQNBTUNaB4%2BEj2PAPp27hp4%3D&amp;reserved=3D0</a><=
br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3D%2B5zFOTfuLmQUz66hqJm6HfmZEtD6eFgSQ%2FykKjvH9zY%3D&amp;reserved=
=3D0</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C0efc7fdd53c24f55f72108db82f89ab6%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638247776502053494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D5YnjSEIXmgyT%2BrFQSzlacMVqkKUAiM5y2hvZHo%2FxzI0%3D&amp;reserved=3D0</a><=
br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53737B94A7DA676F7C080EB69136AVI1PR04MB5373eurp_--

