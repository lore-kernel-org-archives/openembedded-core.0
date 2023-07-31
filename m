Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E124C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 19:10:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web11.930.1690830596947518670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 12:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Zz1HmsOn;
 spf=pass (domain: welotec.com, ip: 40.107.8.79, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP6Zouw/jZBcbCCC/p+8Lez0qFmPz9ittEuzsFt9vhL+wp9RGkhYZpDzVgNRAc/0tg0GH205bqvkkAngbsSHKlJfTxyv77/PxFoSUGYy/9SN4CrIr9WiabCmdRq4jomZW4tg/ifppz0mMht/qtfUUCclikrXmco3wKZhkcbInVzanRrDa3UMAH1MUW8MSE4iKQO06/T4y8+fekpt+zDxnjStG+z8tlbRnYwzTqpFH/sGj2vDvaFvC1mtknUT3T6T59H7d58ioTkC5mwJbUoBR3MC47Vqyep70yWgOgkbBS6JhvVhl/0B8XkE0inqNkg61nS3bbwru/utnWmPo2e8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu5YWw3tswnoZqy8R9XiauS1Lws5MZOPrfg8agEH7cM=;
 b=K5yzgl3+CnIy7McLD/KOcDdjHAlFLRLjnEWCqh/63nGP8/snjoTIwtpIqyCLjDwNDvhun0rTMD6CD83UT5iETtLnwHMoXAM01yUOvVE1C/cEWYXAx8xObtJNmHePgDaU9PodaxpoJ90DSN7m0fpjmTv0UVU+TlEey2mZKi+5YA5pYsi88lMHJU3GJZUiA09PpYpGCUJ2+UGSPLq1At3uUJQBV22t/KeBCiXsZiAYGdIDCb6SQamlERwTDvBI/T1rf3VgPmUtBAyg+FQNQGS4NHXREWu6ZZwhBUnGnRz5bMIoml9SgXbEUC6RGyzC3u1dY0W5JVPca0eGBy+ugOJfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu5YWw3tswnoZqy8R9XiauS1Lws5MZOPrfg8agEH7cM=;
 b=Zz1HmsOnK+hmxKApPIn04XEg5js8JbURYkaU2ASD31u/ZLeD3X9dM5H2Cxbc89TWhuLYX16PvBgBzrDWDJza2Aac1erRGZ3jqN1UcTt5g2B9T4bDXZ5zbrTcngwvVvay1z/sRarpFC7KpMaKkn6lbv8sJ0LOseL6m/ppoEs0aKg=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8168.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 19:09:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 19:09:51 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZw+GoIkE0W6fK8k+8nz7vZaP5pK/UO6gA
Date: Mon, 31 Jul 2023 19:09:51 +0000
Message-ID: 
 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local>
 <17762A3A069807A3.31298@lists.openembedded.org>
 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: 
 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB8168:EE_
x-ms-office365-filtering-correlation-id: ce64ee57-747d-4925-00f3-08db91f9b7c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u2nt7FO3ill94JtImCVV9HpwXdWBk7NTRLkrCgngJzkNeYfCOXZHSpk2cd2JRujo3EVaC13vlewBHP6r8sqAn2LUbi3HGlQa5B24xKZ5mWDR5kH8rfyyP9u6E/JXjMxzSoVaOI3QSGx/Pg4drY0DoLnR1borG37FmTw5sHNX0RgTQbqdGAbdhPzuCgcdXnAcCuVYLktUi6DMQ7OhSI1DtaENcWvZ2QPDLvdObv/6MRmHt6hCbM/KyrUcxqxhCuIc+vsFguB+G49BleF9qLjsQOQI3Xjr8Jt5Vm+3T7hhkgGXUB1ZJFnjdDC68MW12PDiTPWuSROrhAJ4lZuicCki7NUWq+floRcTn37jYemnWiVYB8vXisoSG1rveVA2CIAqcs1BrT2GDwckTcdgA2nnDpBLnPZXlZocOGuiDKOwr8HOI8BuENaRLxQplzByhrmZpTIY1XHJsZtdxTEmrzABau4HGCGkGDf/5gxGPvYcyD2USTYNySVsDucNirbuvYiJMB4aJyvHS3z0Bkfx2HMRiXuBZ1r13Jx4PuL17yB7XmGkbDLm4YYs31afmOWmMtBjOobaaXQp5h/VFSMp7di4z1E3q/2E/A9QfGTspBjoh2M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(451199021)(38100700002)(66476007)(86362001)(8676002)(64756008)(8936002)(316002)(5660300002)(4326008)(66446008)(6916009)(54906003)(122000001)(41300700001)(33656002)(52536014)(66556008)(66946007)(76116006)(38070700005)(478600001)(166002)(45080400002)(2906002)(71200400001)(2940100002)(966005)(9686003)(7696005)(6506007)(26005)(83380400001)(66574015)(186003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?WZGve7MpUZY57slh9uivZFvcuJb/wwHs+A/OMhay/5YVJFQz/ej8WshZ?=
 =?windows-1250?Q?2Bs4lcARTheU5ot77aqEZM5b1a3/g168xNhYJxd/VYveQsQC0u2/pPbm?=
 =?windows-1250?Q?YRY1EiBUOHvaUTYXTXLY6nKvI7u35g9MPk2wmUibhlxzhlJ3lGepKHA6?=
 =?windows-1250?Q?G/F4YCPwlPrPij9iqRoyiBQLr3hu676ILOQOcyWiitgb7Tje0eamW2cL?=
 =?windows-1250?Q?Gay1yHxmE7oOJqRzzICldhykoZLpSxnPpn6JJm1bUjo2AkBz7Rl00aBl?=
 =?windows-1250?Q?IcThSmEZdJU964k2RMp6Smkv7mqERduvEYy+DLqK8KRRrTWnu7mEobWw?=
 =?windows-1250?Q?v2hVtToyQI51b23WwlUgW479/QjEiLgdb8rc/ndNj7/uGBL2ZadyaplW?=
 =?windows-1250?Q?c2ANdWqrCQl+zBS9f0uf+dtPTCrr2B2dofFOtEol1JVR+H9+J1VV3QDF?=
 =?windows-1250?Q?ZEBhk01g7Xatw3F9zbcYsA63IaufEiR1DP5ItDgBnx7VZh07veCfscnq?=
 =?windows-1250?Q?0k0GYCvYf3BQrlNFUYEFpQ/s3cJEyha/5blYaifv4xVn0BwltI+WHd9J?=
 =?windows-1250?Q?7r8tqh31uSjB95GZqC6BqF1649ZZinHPfInQw8gmj0+q5XT0Bqs8An3t?=
 =?windows-1250?Q?6kYT/tHOeOzTSqEBw0BvCk0ZznLonIcGFTlAwMbZMNVGxYq9OnQQaW5V?=
 =?windows-1250?Q?BH5oJJibgH7uw/gJIPdhbP7uUPMIKn1/j0EN7KQ25qf8xg1hUXQX168a?=
 =?windows-1250?Q?my5ub8fdaiOH3xR5qBi4ZK8UmwL26uDlQfPo+vWqXyq+OW33K4S5jngu?=
 =?windows-1250?Q?5VEh8CXR/Kn8xIe0dvtNue1ZcD5nhKl7BRR1+ZusTtIJxatQ/5q038DZ?=
 =?windows-1250?Q?jeEsgQdWhrEhv6I8Ttr3QZntKQfckimxFjP0OfhholkOjOHeFnd9bTsM?=
 =?windows-1250?Q?Y1XveToeQ9asqDE2MWpfIrfccd9nFEa6QlFCI9hsNOb0Bpvym7YkIPFy?=
 =?windows-1250?Q?msCFO/ObP/qfHp/hOPyUTx+lezWfoyZ/Z4VVldn+BvGC9gqmptSyAU/u?=
 =?windows-1250?Q?jHRLGbjMQC+lV9UjzenG98THfffVca5CT1CgVDw2xKbkI+kp7619t2DQ?=
 =?windows-1250?Q?KhjMwLmbTyIde4dGWLM3HMrRuwgTf+1e88aSqxEVVD/YKCvu1DY8NAzV?=
 =?windows-1250?Q?B1oEvypXrI6nhLfP039zN/yOBRbmvVz6vUk05p8romnNFoDQ+XNe9ftf?=
 =?windows-1250?Q?LliI1IXGMZjTT/SDn3NUdD68QFikC8S67m/UjZFQt5mYrVWmiixs4P1Y?=
 =?windows-1250?Q?gSY4XvY12fQ86RdiPm0xZdX9uqWl0Dmm1bbdSPBRZWBV9LZbruQwfkXr?=
 =?windows-1250?Q?o/3Gljx9L9jC4w5fwiKOFYRNIJXeZeEvL0N76nPHNBGs80krrDB70s0u?=
 =?windows-1250?Q?PQDNUeAhLjKd32iRSeqnfXNE14gDb6+8dmCoEOG46x1A+kYflxr1QMkg?=
 =?windows-1250?Q?rL4W23kEaK4Fi5bXB5CiIjsz5RF91CjUoWU4JzAfyUcH8fEmjzYcQKPW?=
 =?windows-1250?Q?so/JXdSx1nMRnruNygZ4Y6Tgk0IPQ/C4U5tVv/BKSQzlr7Oxmx6WOJjd?=
 =?windows-1250?Q?9BShvi/J2bo5zULqAtYKl46wKAGWGCIlCDyc6tC/viW9bPqCHWqJHGYU?=
 =?windows-1250?Q?Fa8moMoMcpUV+IJ3TBb3hEIWrYQGgXUFOSDwmmwabpT5QX5/NnOqcg?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373AB9F0C887CF659E739439105AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce64ee57-747d-4925-00f3-08db91f9b7c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 19:09:51.8492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4z+PX11llVab+7q3ROd+BBhSNQjdtwGreFM5fsajRuOYzsy3LWYy1kxVcfPKAmF2W8y0In/YtEro5OMFhdGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185163

--_000_VI1PR04MB5373AB9F0C887CF659E739439105AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

I=92m sorry for splitting this message but it has happend by accident=85

Returning to the topic my assumption is that for some reason in reproducibl=
eA, these miliseconds are cutted and in case of reproducibleB they are not.

This was obviously working for opkg-build in case of gnu format which is cu=
tting it also but for posix format it stores and thus error occurs.

My question is where can I find the code responsible for moving/coping data=
 into these packages-split directories?

BR
Piotr
________________________________
Od: Piotr =A3obacz <p.lobacz@welotec.com>
Wys=B3ano: poniedzia=B3ek, lipca 31, 2023 9:03 PM
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add s=
upport for ACLs and xattr

OK, I have finally discovered the root cause. First of all there is another=
 bug in yocto, for all these 19 packages.

I have compared the full timestamps with 'ls =97full-time=92 command in bot=
h directories (meaning reproducibleA and reproducibleB) of packages-split/a=
cpid-src and they differ even just before packages creation=85

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: Saturday, July 29, 2023 12:58:51 AM
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:=
 add support for ACLs and xattr

Hello again,
Funny thing, I have run the same revision as you in here https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/117/builds/3263
and I have different failures, but I have them:


File "/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/meta=
/lib/oeqa/selftest/cases/reproducible.py", line 327, in test_reproducible_b=
uilds
    self.fail('\n'.join(fails))
AssertionError: The following ipk packages are different and not in exclusi=
on list:
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core2-=
64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core2-=
64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64.i=
pk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-64=
.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-64=
.ipk

2023-07-29 00:18:31,843 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-07-29 00:18:31,843 - oe-selftest - INFO - Ran 2 tests in 51978.070s
2023-07-29 00:18:31,843 - oe-selftest - INFO - FAILED
2023-07-29 00:18:31,843 - oe-selftest - INFO -  (failures=3D1)
2023-07-29 00:18:35,545 - oe-selftest - INFO - RESULTS:
2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Diffo=
scopeTests.test_diffoscope: PASSED (35.32s)
2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Repro=
ducibleTests.test_reproducible_builds: FAILED (51940.60s)
2023-07-29 00:18:35,948 - oe-selftest - INFO - SUMMARY:
2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest () - Ran 2 tests=
 in 51978.070s
2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest - FAIL - Require=
d tests failed (successes=3D1, skipped=3D0, failures=3D1, errors=3D0)

due to this tests result difference, my suspicion at the moment is only the=
 possibility of changing the format between gnu and posix depending on DIST=
RO_FEATURES having acl and/or xattr.

I will force now tar format to have only posix format and run another test.=
 We will be in touch.

BR
Piotr

________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: czwartek, 27 lipca 2023 16:18
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

Hello,

I sent this to the autobuilders and I got the same reproducibility
failure as earlier:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3263%2Fst=
eps%2F13%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e=
1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260=
643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DC6mYlLwOmYosyl1ZIS8vKQ=
f2ailFqMqBXeamF%2FnSE7E%3D&reserved=3D0<https://autobuilder.yoctoproject.or=
g/typhoon/#/builders/117/builds/3263/steps/13/logs/stdio>

I'm not sure why you wouldn't see those.

On 26/07/2023 09:27:53+0000, Piotr =A3obacz wrote:
>
> Hi Alexandre, Alex,
> Thx for supporting me, I have finally discovered the issue regarding this=
 packages differences.
> It occurred that I was badly comparing two strings for tarformat comparis=
on. Now it is fixed and should finally work.
>
> This has been additionally tested with oe-selftest -r reproducible.
>
> BR
> Piotr
>
> Od: Piotr =A3obacz <p.lobacz@welotec.com>
> Wys=B3ane: =9Croda, 26 lipca 2023 11:22
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add sup=
port for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DaZziODWaDuhvajNYsPmX47BT2z2CLK8NpgFeF80X1Jg%3D&reserved=3D0<https://grou=
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
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1

>
>
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8=
eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DQdR%2FSw2mI6zSaDoLdARAe4Q9CTcPPR5Jazo1=
mllODi4%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373AB9F0C887CF659E739439105AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div dir=3D"ltr">
<div>I=92m sorry for splitting this message but it has happend by accident=
=85</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Returning to the topic my assumption is that for some reas=
on in reproducibleA, these miliseconds are cutted and in case of reproducib=
leB they are not.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">This was obviously working for opkg-build in case of gnu f=
ormat which is cutting it also but for posix format it stores and thus erro=
r occurs.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">My question is where can I find the code responsible for m=
oving/coping data into these packages-split directories?</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
<div></div>
<div>
<div dir=3D"ltr"></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>Od:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>Wys=B3ano:</b> poniedzia=B3ek, lipca 31, 2023 9:03 PM<br>
<b>Do:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass=
: add support for ACLs and xattr
<div>&nbsp;</div>
</font></div>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">OK, I have finally discovered the root cause. First of all=
 there is another bug in yocto, for all these 19 packages.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">I have compared the full timestamps with 'ls =97full-time=
=92 command in both directories (meaning reproducibleA and reproducibleB) o=
f packages-split/acpid-src and they differ even just before packages creati=
on=85</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> Saturday, July 29, 2023 12:58:51 AM<br>
<b>Do:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
<b>Temat:</b> ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.b=
bclass: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hello again,<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Funny thing, I have run the same revision as you in here <a href=3D"https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263" originals=
rc=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/32=
63" shash=3D"rmTDGyfeMomvwJq1drv08fu2SELfWYyWRZP8qXjTzlOFWYmbmt9fm7jT6ejJ7D=
OCpm6H4gYTWornrSeH+kr74seQL3bqd4oUV7BHmFFBnkSkIDnMn55N/7ye3RgYBT7vESBu+Gsc9=
OYaoyCFuLCCRt13S+WY8RZ/eUlRR9dlszg=3D" id=3D"LPlnk747516">
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263</a>=
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
and I have different failures, but I have them:</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0 x_ContentPasted1" style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0=
,0,0)">
File &quot;/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib=
/meta/lib/oeqa/selftest/cases/reproducible.py&quot;, line 327, in test_repr=
oducible_builds
<div class=3D"x_ContentPasted1">&nbsp; &nbsp; self.fail('\n'.join(fails))</=
div>
<div class=3D"x_ContentPasted1">AssertionError: The following ipk packages =
are different and not in exclusion list:</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/acpi=
d-src_2.0.34-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/avah=
i-src_0.8-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/bind=
-src_9.18.16-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/debu=
gedit-src_5.0-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/flac=
-src_1.4.3-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libj=
son-glib-1.0-dev_1.6.6-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libj=
son-glib-1.0-ptest_1.6.6-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libj=
son-glib-1.0-src_1.6.6-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libm=
nl-src_1.0.5-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libu=
uid-src_2.38.1-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/log4=
cplus-src_2.1.0-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/lttn=
g-tools-src_2.13.9-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/pyth=
on3-numpy-src_1.25.1-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/pyth=
on3-pygobject-dev_3.44.1-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/pyth=
on3-pygobject-src_3.44.1-r0_core2-64.ipk</div>
<div class=3D"x_ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/pyth=
on3-pygobject_3.44.1-r0_core2-64.ipk</div>
<div><br class=3D"x_ContentPasted1">
</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INF=
O - ----------------------------------------------------------------------<=
/div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INF=
O - Ran 2 tests in 51978.070s</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INF=
O - FAILED</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INF=
O - &nbsp;(failures=3D1)</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,545 - oe-selftest - INF=
O - RESULTS:</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,546 - oe-selftest - INF=
O - RESULTS - reproducible.DiffoscopeTests.test_diffoscope: PASSED (35.32s)=
</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,546 - oe-selftest - INF=
O - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAIL=
ED (51940.60s)</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,948 - oe-selftest - INF=
O - SUMMARY:</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,949 - oe-selftest - INF=
O - oe-selftest () - Ran 2 tests in 51978.070s</div>
<div class=3D"x_ContentPasted1">2023-07-29 00:18:35,949 - oe-selftest - INF=
O - oe-selftest - FAIL - Required tests failed (successes=3D1, skipped=3D0,=
 failures=3D1, errors=3D0)</div>
<div class=3D"x_ContentPasted1"><br>
</div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2">due to =
this tests result difference, my suspicion at the moment is only the possib=
ility of changing the format between gnu and
 posix depending on DISTRO_FEATURES having acl and/or xattr.</span></span><=
/span></div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2"><br>
</span></span></span></div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2">I will =
force now tar format to have only posix format and run another test. We wil=
l be in touch.</span></span></span></div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2"><br>
</span></span></span></div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2">BR</spa=
n></span></span></div>
<div class=3D"x_ContentPasted1"><span class=3D"x_HwtZe" lang=3D"en"><span c=
lass=3D"x_jCAhz x_ChMk0b"><span class=3D"x_ryNqvb x_ContentPasted2">Piotr<b=
r>
</span></span></span></div>
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> czwartek, 27 lipca 2023 16:18<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bb=
class: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hello,<br>
<br>
I sent this to the autobuilders and I got the same reproducibility<br>
failure as earlier:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3263/steps/13/logs/stdio" originalsrc=3D"https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/117/builds/3263/steps/13/logs/stdio" shash=3D"INml=
+wkQuAXvUgaJO5I1uxuXmBIaLaJW6wEJDHx4jINYz2tChiylCX8T9o1XKF3jJw7G7jXok9RuJLY=
LdkdG35ydWMcFfbRYhDpMoZcqOh5Xz50OO6XlCcBd/1L0JJ7jffSUerQPuatyhaLgb8fbfVYTfu=
E66d2Jlbq6SwINvK0=3D">https://eur04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F=
117%2Fbuilds%2F3263%2Fsteps%2F13%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DC6mYlLwOmYosyl1ZIS8vKQf2ailFqMqBXeamF%2FnSE7E%3D&amp;reserved=3D0=
</a><br>
<br>
I'm not sure why you wouldn't see those.<br>
<br>
On 26/07/2023 09:27:53+0000, Piotr =A3obacz wrote:<br>
&gt; <br>
&gt; Hi Alexandre, Alex,<br>
&gt; Thx for supporting me, I have finally discovered the issue regarding t=
his packages differences.<br>
&gt; It occurred that I was badly comparing two strings for tarformat compa=
rison. Now it is fixed and should finally work.<br>
&gt; <br>
&gt; This has been additionally tested with oe-selftest -r reproducible.<br=
>
&gt; <br>
&gt; BR<br>
&gt; Piotr<br>
&gt; <br>
&gt; Od: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Wys=B3ane: =9Croda, 26 lipca 2023 11:22<br>
&gt; Do: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; DW: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add =
support for ACLs and xattr
<br>
&gt; &nbsp;<br>
&gt; Extend OPKGBUILDCMD variable, with additional parameters, depending<br=
>
&gt; on target distro features, in order to support ACLs and xattr.<br>
&gt; <br>
&gt; With fix pushed to the opkg-devel:<br>
&gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8" origi=
nalsrc=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8" shash=3D"BM=
zBtScobKQPWPTWdIxoJrbZdLyOKa2zTNxa8C4C0WzEq+eQOc6+CP4yJ5srDi8KKvRr9TFtcvRC8=
sNyTUN8CgxMryAQpqrrLVyx+Kb5f3OAuuwK1Wy8hCu7vxFm5EfquklNPewU6cWInA1RT3n9u3iX=
SsfQMsxXPFAUBJTACak=3D">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.=
google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DaZziODWaDuhvajNYsPmX47BT2z2CLK8NpgFeF80X1Jg%3D&amp;reserved=3D0</a>=
<br>
&gt; opkg-build is able to create tar archives with ACLs and xattr.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt; &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-gl=
obal/package_ipk.bbclass<br>
&gt; index b4b7bc9ac2..a0f106e4ad 100644<br>
&gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-ta=
rget.conf&quot;<br>
&gt; &nbsp;PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt; &nbsp;<br>
&gt; &nbsp;# Program to be used to build opkg packages<br>
&gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<b=
r>
&gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; ${=
@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.cont=
ains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'<br>
&gt; &nbsp;<br>
&gt; &nbsp;OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-versio=
n&quot;<br>
&gt; &nbsp;OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar=
(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/" originalsrc=3D"https://bootlin.com/" shash=
=3D"OqCdwecaiHh4YuPWKpMK8kpBGzNMio5Xspzurq+deRLBLfomnbBw42aF7aAed1l3GBKfsSf=
QmawtmWrKiN/DTgUCaPG3L5wZC+bl7ghrf5x0gNNubo1tMBDP/ucvBZrU7/+7wdJT3m0fpCiQGG=
92xIJ8hUSzA04yvqFBR0ErwFc=3D">https://eur04.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welot=
ec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b3=
9%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
QdR%2FSw2mI6zSaDoLdARAe4Q9CTcPPR5Jazo1mllODi4%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_VI1PR04MB5373AB9F0C887CF659E739439105AVI1PR04MB5373eurp_--

