Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20C2C00528
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 19:03:30 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web10.737.1690830201347681464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 12:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=DYbqhlXY;
 spf=pass (domain: welotec.com, ip: 40.107.13.52, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g55Q7f8N3Jwcy5ZkDsY4QDQX4YxGChWuphiRSDq6vua54Q+gZ8EOE45gXI+/ZVFoFocUKL+U89TMyh31PFtrK3mYyh8UYAXVlNsOPMQ7tefywT43P6XmT3sRabSvSBA98G8AOn7atyTHgIkez2O6Bp0cjfDLnmoUMjpSNtkbZZr4G88yq0yqN5lrvi7LanbyhyTXk89l8jbEcEASQVaQjld3dqxTUItB3mcwXumHAu2fG5mBv+wV9kyEmpKdYdHifQpS2LKPSVj5BcZQP/8/1FFST3mrcN53FMUu+jGaEPkmleVCWdhCObeSjshtBiwoOFrLCxKKBwhAVDuD0wCIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcMTq/6xE8p5GECjow8T20cGEC0l9YmNpNso4KrghWw=;
 b=KSuqFnb2dz6IX0m0VRYNPU/cqzNET+ZI+50w/zQTybhZIb/jdAgzxx7HC3qRtR/yMEttiHjyYUDjQNVXufrODInD05Eun8BA8npgiT1WCvwmshUled4cjRJ1CUOgpoLkw8wMshTTXVArU2XhvMY5LgHl+V787jZE8XIZLKqIyQixj3oSABqu1Gd8JT8hBnNXCLM9z1RmxKCpxcKmr5FltlBn7I4jFzlKFtg+0Sz/RUOOhxpDx91zoYssEIfQr9401kRKBdUO+9rj8qFlqtQ//pmYlKzmYzUCwLxYF5LudSIzbsATscrCGi/1gOL7DBcae+U/VaAB49l3jDXFykZSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcMTq/6xE8p5GECjow8T20cGEC0l9YmNpNso4KrghWw=;
 b=DYbqhlXYI9dZ8Exy7fh4ddxl6cdug89Ehsos5unAQw9QV1QMqoRQB/dR/64/zzq/94UtHohv4MIxG/x6UI+vZ+MNt0J0v1N6qsPKEEG+WgumMn5eQD49h+n20x2HnzY3aT0nTaiBcd3f2AzWEoOm2P1EKCi+aKqWuGDQhbDbn2c=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 19:03:15 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 19:03:14 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZw+GoIkE0W6fK8k+8nz7vZaP5pA==
Date: Mon, 31 Jul 2023 19:03:14 +0000
Message-ID: 
 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local>
 <17762A3A069807A3.31298@lists.openembedded.org>
In-Reply-To: <17762A3A069807A3.31298@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|GV1PR04MB9101:EE_
x-ms-office365-filtering-correlation-id: 4d346c20-6521-4641-8a70-08db91f8cb05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5HLlBsb2VzrDQuwkup2F4DFdjCihK7xNV6RtEJfDRnYDFd6oXgDVEr7n66qoJeDSZ+Fegdvk+oULbxXI8Se4waTuVl+SBEnaasoR0LuEkJkWXGmQC6c+XJgah92O4yiwbuYyOtaioYkZzZtm64SNtKKWgxh1YTMZxO6+ZbHM/bqdpwbChnyiHMY/8niZhbVLc3qk0go7ppjewxPdlFLi3CNUPOWRNdMRRIibEkNDJ8TR8KaBTkiLLIaQKhML7QiowW0D0JC4H+a2iMwV1aN9/s2t8+dHZz5QMtMuCKBd1r+nzUFT3ekNgLRBA3VLWOjyKZF/0xw71El6zYLNPbEq6SHOFByneOmkFX0XImXdvamCELPzInHMKUaYlKmIjcqeCpO6PLPuvxBfypVNYLJw5xrhxh6arniqzVm4Lxg19YzJ6wb2M++JRqEvPuKTl75555v09VmJCQV7azec9wgtZUYPcPp4sCzEetBq3mHoIto+aWULOmMSIF7FSMkfj3TI7K9uVj0umPBv8y0dyyzxbEstedLcJhKNF1Hfi5vyu/4NEa/sLseE6h0yeWzwA9KX9PmBVyyYjMRW98oM8ZJGvWRF/BSu+hs0vzE3N0MtN+I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(451199021)(38100700002)(66476007)(86362001)(8676002)(64756008)(8936002)(316002)(5660300002)(4326008)(19627405001)(66446008)(6916009)(54906003)(122000001)(41300700001)(33656002)(52536014)(66556008)(66946007)(76116006)(38070700005)(478600001)(166002)(45080400002)(2906002)(71200400001)(966005)(9686003)(7696005)(6506007)(26005)(83380400001)(66574015)(186003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?evZbzWlq3TRBj9fYFxWL5Wg15xQ8BaxRGXWuIBJpJRFeMbHsjKmn7Bsh?=
 =?windows-1250?Q?cicHZay/DLgsydsqyg5yLCigzUd3B5aAkiKHiPWnBBKOMO0gDrx8Cib9?=
 =?windows-1250?Q?ojf5XmvQSIh4u6sT+GPd9+9l1sVyqkZadl2Ws0ffkrdPjCYwlST5g4tg?=
 =?windows-1250?Q?lazT/rplhm0WsWGpe6vfJ4DEKDqgd1fItW5wMDpn417bvRszZUhwG3VU?=
 =?windows-1250?Q?mqH/IXd+WjvYsjGgO6Z0yFmfjwJpDUzFYFKlzqUzjO2BJiE80YQOLN4S?=
 =?windows-1250?Q?xrN8eWa39Vnbzx4JN+BeG+bXClRvUVTV8Coyaa8Rz0dXgFBel03jcu0s?=
 =?windows-1250?Q?SudfEDB1D9vhlHNt1YAiFN1aQ3KC8l7vV4ghFKmba3k3n6X4HKOLzD/o?=
 =?windows-1250?Q?Zv5lhzlTIZzbdYk2NXml6nzST3+x8kH3ZELgV1TxebNRou2ZbZO3OSSf?=
 =?windows-1250?Q?Vw/ujjyK+wBJMVlXkLRHFZRTM2u54OhzEEaUsW20HyJbjcKo4hrIBbkR?=
 =?windows-1250?Q?843Zz5aJOyD/i0YRtjZ7AglLdFTS8hbRUaUtAUkjVFGQwd5xXT5GveQA?=
 =?windows-1250?Q?GrUsXiHDgaZkpfT2eefZRkCRMjd9RRrK7s/CwYBHWAb6NkElxHK07fQF?=
 =?windows-1250?Q?QTGZuAad4g15vPwy1FuTDOpMoIH5kD8a0H7MqblXEOsQNid/ep5ErEuQ?=
 =?windows-1250?Q?sg46dkj1qqzg9y0z8LHcPXhohSSw5XpcHtIBdx/Lv1TlFeb3057wBcjd?=
 =?windows-1250?Q?0nzXXtfr8PNC9kXsvzNcUcgpEP1USUBO+KgfCJqt/59PCzDAmjTTcX39?=
 =?windows-1250?Q?+ckPMU+7cZ+vVdGSrmuORf4vsC9fJdHsZWlEdKNQu4hxgFnUYG/bucfa?=
 =?windows-1250?Q?uICsBgB9PU7UzfKYzNsOeLeHtQSOF/Ng34b4SC5OjM9Y8C/I6KzTQabK?=
 =?windows-1250?Q?Ox3KhSXiSqy3+Pi+TtsHQrOcpVfGloq2Qy8LpTvE0WUN4vEWJ65IuILJ?=
 =?windows-1250?Q?At2GD83EYhKvqn46uvb7OkEhGwJ5+sMUCJMvEFFfDZ6oDz40Yez1xG+F?=
 =?windows-1250?Q?ulKhlaISjQLU2eFhBFifbBW6VUGAR7DkjHPaIptTlMmF7PDJZslr2ykT?=
 =?windows-1250?Q?DwLOWg8dHC4cc0g2Dh+wspE+a+uYmDWx6F8Jmwok6afRERM8scfy1Dr1?=
 =?windows-1250?Q?sIJx9y5tr+dL2MWVPX/HK4mR32HpV3QjMWnjajr/UqYmwAc0Bk7+sLza?=
 =?windows-1250?Q?32ngN76x/I0Bb0ICCKcHx98eyq5Q9N70KI9yXFRIQ9r07drFcshNCrVn?=
 =?windows-1250?Q?2VLyYlWXCHP7Fqq+VbsgkGDIroqXEdCZP4WobdvKJ0YeyuS7GgF9onnY?=
 =?windows-1250?Q?zdQvsAks+GdTWdiQdRlQ9tjGNxzb/LJNqAvDSE1W98wXNSDfgTT05TyG?=
 =?windows-1250?Q?wjUyCXQ/EbrkW2m8q75vPM8MGP6UKUWfQ1VAiOolgusbYs7JhuTauYQn?=
 =?windows-1250?Q?jvQa5xS0SvkjICSQtKwi4CDY5E606xygW6Sth9RXu5nsvTT8S56etoVZ?=
 =?windows-1250?Q?Ae8qxaP6ae2uL71DxRN/Isu2isEzo9fFPSQKATg02vdbqM9GgZDG4k18?=
 =?windows-1250?Q?11do2Vfmfo2+nNhmAPN4ZIVEJYU61THYXJBbr6F5LANeiqY6dFtTOHmL?=
 =?windows-1250?Q?dnEhBMdaW8hd09TThlcZ5idQUE7j4RVVvnenxc/QabiQWKmNAg3Qyw?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB537349F74CD4C3E13B272B879105AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d346c20-6521-4641-8a70-08db91f8cb05
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 19:03:14.6782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qa9HCEjU4f44MFxdRj/9AEj3hPbrEDyHsE259a3OY2zq6pxSdN3tCXDnbBPl64xldi29C69kdR4EXxzuaGOH0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185162

--_000_VI1PR04MB537349F74CD4C3E13B272B879105AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

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

--_000_VI1PR04MB537349F74CD4C3E13B272B879105AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
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
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
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
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
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
</body>
</html>

--_000_VI1PR04MB537349F74CD4C3E13B272B879105AVI1PR04MB5373eurp_--

