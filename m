Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBE5C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 17:24:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web12.10403.1668101045356461360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 09:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=eOyDFntk;
 spf=pass (domain: siemens.com, ip: 40.107.22.86, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSCppnUZV1CnlpeTBbxvIIJjBfMA++Lav+tymAshzfjNycuHGyHrfi0lnql0yv1AZ1+pEbwoTOV+mB8QJaAJR7QasspFbJm69hR2SqrYXXU0vSJNi7suaPPVxWH7RrotHtn+KgmgsXlEOPE7Wnu7FUueh4p/TjH8bl1XyYUtHmDcx2hQdvmNjSLbin1robM+8zzGVNX+uvDQY9sr4io4V2OZtQv42govdeEb5NKFzlTI2GNN5dYNI7xygDJv4nDCOh4ba69DWjFQxo3/uvYg4i33CbQr0DCc6bHtUVWBI/+K94RNflNL5jURmJFIGYm/OOfMLMKFCU1En0ASyjkzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO9Vz28FZobDNnlJxxmY4guFUbHROmdfdg8lvTGZanQ=;
 b=UXEEw7IDehpwOaeqpPiuD8HzeDhtsqobrhLtgrWsaQrASMvhhp/rBVSUDczty8UT2rNECo940nv32gMPfnjfTx4j3XkGtOTfLVhSZsMvD5xTknTizoSMAny6v5j+21uOZUavZkFs1rUt//9X9KRbz1lhND4F0ArdgkYyIePO8OBtDTb7MuO7JsVUCreK/vc94OCm5KfXlLJX76WMBKMv4uAnN7768ylCrK7eI5mEQKKttuT9GQaxxMjpHbSl8JGT5VzBRqgSx8RlZjpw3vXHznSMQSaQsmMcxWIfnSE2FUGk1ohZcC6APMH7FoJSHRNWG8ZtbCtsDdTlVDqYct3Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO9Vz28FZobDNnlJxxmY4guFUbHROmdfdg8lvTGZanQ=;
 b=eOyDFntkPF/m0NIFr24LPR3NFhmIu8+8zuZnrkX2Q0LglPYlIOD2c/TvmyV6CNTNKFQ1AMef2Te/3PGpW59oEoS7qBaOXzZP5FB46XNdoHpbQ/H6Nf4Fkj0Vhm8jpTraKfvX4t2ETw3jdwL8dQKUMgjVy7nE/mq2cy/mzWsgrrOC58yLVTjIxERvvl1/sO219DXPqk2gKvksxSN3m/50Fex/yddtRoHOH+B1263/6p820LYYugrpyxjqVK/miTr9zVFxVI4izwNrhNWUwj3R2GQyuL8yzBxbjJERa5GyzL+1JZcSafswj6aciWy6qksw2tdYRDzYVS4ogt7o3aH0hA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6344.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:410::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 17:24:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a%6]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 17:24:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: RE: [OE-core][PATCH] systemd: add group render to udev package
Thread-Topic: [OE-core][PATCH] systemd: add group render to udev package
Thread-Index: AQHY85rx/dZDyBBDxUKqAFa7P4V8Na44WJ8AgAAQ59A=
Date: Thu, 10 Nov 2022 17:24:02 +0000
Message-ID: 
 <AS1PR10MB5697E2F98267B310A07B3E88FD019@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221108175154.280624-1-peter.marko@siemens.com>
 <Y20kFKDvCiET6XBE@mail.local>
In-Reply-To: <Y20kFKDvCiET6XBE@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-11-10T17:24:01Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ceea2950-1f5b-4c77-b0f7-e84b079750b8;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6344:EE_
x-ms-office365-filtering-correlation-id: 735ad7b6-478a-4244-3bdb-08dac3405c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 feP9bZkSGacNkXHdj56pSwJw3T7r2qZkcpKn4+HA9IdtP/YzztUMXH3dJllb/s8s6vHog+cBwJNvB4yyHAm2qSMINW7vug6mGzmQxEAPem9e6yosDSFixBilrO3nzNjo40Zeyu0AgIwZ7WCCV/iMxKxGMm7Es1rflPLsd6gHvd/tsTbFUsv0XQfy96Qp2MnCniMCEFQluC3WBY0q0GHQ8iRXO7QAhPiUuk90U2lWZ797B+W43Zrpz3h2TkncRsmcBUkPbzh/MKvWKprKGevzzbpDMTKJfc0kDmc8H4BFEukLy4SjpMyE/3E/cuqVTwOzOh8Yw1rB1AhRTb5zkebmi7sj3vaok3epheWw4nrlsX4F8HqknbzSvEmAXUlyK5NwYJhwYSvsRkKqxfxfjoPjCNEx1+OIs+FuveeWTw6+xDVh3dwNCjpwwsEpzUq1jR40gK9FrUepIRB0sa5kmN2wEsi2j+YL8qJ/X1p251+57c2W77ckIyl35yiFDFS0nCbyS7Xw60DM3Qfk4MAZhEPnIM6V2sL/BH6OOLFXEafvNtD69G7LmrgEYEgtuLZHD2opE5TW1OdewYyzLJr4fLYz3H4QUzufqsvFYN/maveIBjYoD2CSzlBly/fIpJKqlMRoFoUpeL9Wg/YnjvTEG4aCeAYxkzJ31tEVBHjVimFQIdpge5nBDplNygSCKRYHq6+mSjR3rGKV1DltKV2S03tt+qs5Apulg4iQQTsoIGtbUMbqvNWdyOQ0GMZ9XDj3Fgw7dA0CrHjO+ZwfGhuneTxM8kAhOzc9K9DiKD1wFH5TL0w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(478600001)(26005)(55236004)(6506007)(38100700002)(9686003)(966005)(71200400001)(7696005)(64756008)(66556008)(66946007)(66476007)(66446008)(8676002)(8936002)(6916009)(316002)(76116006)(4326008)(38070700005)(41300700001)(186003)(5660300002)(82960400001)(122000001)(33656002)(52536014)(83380400001)(2906002)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lTws7fIWTeDSmn/k1vqmvLSPWPhKxsd0Bjr75RItjHXJi2YB+AIQvYhsPkbM?=
 =?us-ascii?Q?xmgwcdx9m2XqdZyE15JvKXapqiLoZOb9dbfhgSN7EE4Kqu/QARJ8oGMN+ofE?=
 =?us-ascii?Q?aLYF3n/XhrlOxjvB8IqT89UPV65dXpzsC3WC1csKzkCiZi1vzTdAy3QQcjMc?=
 =?us-ascii?Q?vN8KgBhJiZXVgTlEOl45BoLs8YpZpQzpMf5ErYWIeiKExE0z0WuS9UOt44+n?=
 =?us-ascii?Q?lyivGe6cdupSmoyhdxhx+yjoTOu4iq2tLrNoEnQAVGjkCiYMX0mfOUNmf5VO?=
 =?us-ascii?Q?7uYTQtOhC/qL0i4jtqtWbwhPm0+2BK6n+rSIm3PH5pglG5bSchmFZUSYSmwa?=
 =?us-ascii?Q?BWFWWeVeGoGuaAXzLDNdZLRbU7hg4DxCrndxwFsC7Xy/lNsc6q2heRIm1rwC?=
 =?us-ascii?Q?Mm0Xkk/lDTaqFKH7gmKGmRA+TVF/YJxyL3e/4qkHr7adFKIpTY58YLWvfK3Y?=
 =?us-ascii?Q?eF4wajBwzfdj2A6FOQkl50L4jfGv1DfZOeuj/g8GIPv8TCrD4ZH00DLwVTC8?=
 =?us-ascii?Q?QSSS6B2kMfVhXro71dNki/TKFWdJSSXDt7vtvTvkpOteEvE0yG5t2MXM+Amj?=
 =?us-ascii?Q?bgRPKRrjI2c/sut1xSnpKCCboDad8h/97Cy6c59B1/RYto739oLMuXOUVkJB?=
 =?us-ascii?Q?06FYFItBweRY3bufEok1W16Jfwlgr92j2WLMww+aZspR6V7G0uDNPmWfc2i/?=
 =?us-ascii?Q?wTFl17lZ8M2gls1aW/oUkwSksI0b3I73CrHozLZzetUXQL0q59ChvEzQA3pP?=
 =?us-ascii?Q?4E6LVM9eEgiBqhBKON1ebEgDYTS+gdglwgbVRaHli7wf7bce5K9gOCQjGelH?=
 =?us-ascii?Q?I4a0d19ceLWnFN024BzsiAzQqS7M8yLJxCUftACRLuDoR1bn1M/6OjrxaA7t?=
 =?us-ascii?Q?N8EKC1tKzLs2gQLnhYu6SaZk8/wLYWFYDNa6YGuIZzK0+0caqpyQVJXSyg0a?=
 =?us-ascii?Q?TtAOFkw60TuxyLMDgV19pOkDQpYYkCU7uqu+X//E+ibAdnJTOp+upmaUQjyK?=
 =?us-ascii?Q?ssLfPwzgUB4YklNORqwyz++0hd1Ro9ufRueI8C3/Bl7U65OtUAEXxE08WO6D?=
 =?us-ascii?Q?ZQsbwGg6/EIPTton0iS4lDl+sEHbpgardquL0r//rfxQPoj6S0Z75HWdc+xU?=
 =?us-ascii?Q?mOoQt5eTivX/6ZtwFDs3OZtvPC32+K+UoCtmJ8rl0Qc8RQ+PIaLSVx5fFFCp?=
 =?us-ascii?Q?yqLNaCdbNsgJA5fUmvyfABstd9Xc9v1IBv3Hw+2ydPHIQ231XGx1mcZC6mMK?=
 =?us-ascii?Q?PAmjDzaFQn3LADVMQ96YzUEgq8dwAFV73Tp5HW2p1h0y3yI0T7i8lPRcsswg?=
 =?us-ascii?Q?gNTx0h5119ZRioI5tjXLb/F5F4sLrWWpb1WMZlUYDfDdFf9mrVpE53LvyJ4v?=
 =?us-ascii?Q?3bVamrhH6X4xFOeB5jU9eOeREqdzrL9niMvkImG46Z6HcarWyHCZj+nCPJ2T?=
 =?us-ascii?Q?9BHXPKZjNIVH2Jn/FTYCsBZrabKdTGCVFJCDgNnNeyjufho0drKNjoLZ0vKp?=
 =?us-ascii?Q?hAP4CXQprVqeLlYTJGnno5UkDnWseO62XanRUFJxEYALK5FIv6+60Geh+iWX?=
 =?us-ascii?Q?QuFqFzsF51+if/4leTS9Uhd07OPClnzIs1t3MUe0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 735ad7b6-478a-4244-3bdb-08dac3405c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 17:24:02.1520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJjEo/S5z7oURqpmF5OQNAz+skppY5uG6b9/rq8alAPJeQm0A87mY7GyMG1P3tfSiFAEr/yVx6+LXUswW1ZwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 17:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173083

Hello,

How do I define static group ids for this particular build and other autobu=
ilder builds?
Is that just meta-selftest/files/static-group or also some other files?

Is there also something I need to write additionally as this seems to be a =
breaking change..

Thanks for support,
  Peter

-----Original Message-----

Hello,

This causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1839/ste=
ps/12/logs/stdio

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/reproducib=
le/build/meta/recipes-bsp/usbutils/usbutils_014.bb, /home/pokybuild/yocto-w=
orker/reproducible/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaa=
pi_1.20.4.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-=
graphics/wayland/libinput_1.21.0.bb, /home/pokybuild/yocto-worker/reproduci=
ble/build/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb, /home/=
pokybuild/yocto-worker/reproducible/build/meta/recipes-extended/mdadm/mdadm=
_4.2.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-suppo=
rt/libusb/libusb1_1.0.26.bb, /home/pokybuild/yocto-worker/reproducible/buil=
d/meta/recipes-gnome/libgudev/libgudev_237.bb, /home/pokybuild/yocto-worker=
/reproducible/build/meta/recipes-connectivity/ofono/ofono_2.0.bb, /home/pok=
ybuild/yocto-worker/reproducible/build/meta/recipes-graphics/igt-gpu-tools/=
igt-gpu-tools_git.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/=
recipes-multimedia/alsa/alsa-utils_1.2.8.bb, /home/pokybuild/yocto-worker/r=
eproducible/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb, /h=
ome/pokybuild/yocto-worker/reproducible/build/meta/recipes-graphics/waffle/=
waffle_1.7.0.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recip=
es-bsp/pciutils/pciutils_3.8.0.bb, /home/pokybuild/yocto-worker/reproducibl=
e/build/meta/recipes-graphics/wayland/weston_11.0.0.bb, /home/pokybuild/yoc=
to-worker/reproducible/build/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.=
bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-connectivi=
ty/bluez5/bluez5_5.65.bb, /home/pokybuild/yocto-worker/reproducible/build/m=
eta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb DEPENDS on or othe=
rwise requires it) systemd PROVIDES udev but was skipped: systemd - udev: s=
ystem groupname render does not have a static ID defined. Add render to one=
 of these files: /home/pokybuild/yocto-worker/reproducible/build/build-st/m=
eta-selftest/files/static-group
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (=
in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'usbuti=
ls', 'udev']

