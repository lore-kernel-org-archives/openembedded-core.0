Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D8DC001E0
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 09:41:03 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.50])
 by mx.groups.io with SMTP id smtpd.web10.16579.1690278056178526956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 02:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=YUZgvQ4W;
 spf=pass (domain: welotec.com, ip: 40.107.104.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZAnEO3osFpjXqAH/IJcJ1sz7XjOTGs4RUySFZf9hCbaVyzxOpNTKm2qUfB/LCr/lL8JUu+MhTKhZ6NhyZUJYoym9fONF3LFPbdNwXMNpCbrM/gJHe9t6sLhUyAeC9DGxxHH0Hr5tj3jxfzrrVxSTDfupnPPeX/722jsoPYEjJbmMNMkFsFFqXImEWWIijt30TIhQXq5oAoEitC5+A9zm/6TM5VHzFHp7E6TXAuBDMAhFgXs4bKRj5u3X/aJRNVqjBYYR/hHtXdU3UGS3edRMQGLyEull7Ju/9LTcryb8M3FUmCVsd8eJimkt6bAxW8l3XWzdetEAF7ysu5RwadSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iODB13soI0Vpw0tdruWz38jseecldW2n8sBvOEHSvMk=;
 b=OKbrdC1eapAAug7g8qpIX6LRrCyYTb9HmRuyl/+TtI2Q12jyJ1iSjrRlaidBWHOT/PCM4S4RPUso0WOjpPIQINJa5spszOaBhb3wh9+Hb5/1CQlwQHV54v+30i3cI1Sd5eoR8Y+H9bg3QaGqzmhGhFP/0lrYyO6zCCO+ZKVF9t9XD88p/hmhyDgFhM585ch6D4k0ZH8bq12uYEKeZ5pc6DavCz8Oa2Hhgotho4e4HR7oMiy6wQRwBz+mo5pqH9ErWAz5Fkp/toRfVEG/YORTfQ4GxDEH8kTIdOfYB5jr4yABpcWktQEQtqTS3aPZ7P4moPVMrfuT1yMqjALK7y2BFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iODB13soI0Vpw0tdruWz38jseecldW2n8sBvOEHSvMk=;
 b=YUZgvQ4Wollf5gh0CaAi2lv0nZqjwoZd9MMXxQW8Ak3RzTTzWc2DGHr0nJeSxmAgQSQ78fceGHliAkgQI0C9PweUErGvUqpIUXMBreTCd07ywOotH17VKYhDuCgYQFzOcrnO0r1d3v6zgl7oYc6nG7GM0SDBRs/7MTlamrcOz4E=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 09:40:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 09:40:52 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZvm/8VSlpWTizu02GvmSsctoHdK/JY0qhgADUnYCAAACDdQ==
Date: Tue, 25 Jul 2023 09:40:52 +0000
Message-ID: 
 <VI1PR04MB53736EDF676081044957FE019103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
 <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230725092837d3f47a0f@mail.local>
In-Reply-To: <20230725092837d3f47a0f@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM8PR04MB7970:EE_
x-ms-office365-filtering-correlation-id: 461a7ddd-318b-4398-bb2f-08db8cf33c58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +UPQ8WXhKMRSPN9oaI8MNxM7b7S/wFALb+UASyUbjkabm8JqbvN/VCwxOQuVfCM9r7J0/5GI9evtMbdJ/iHy6oh0dgK1K+DhxQOnCV08MYSFaYEUPtOxBCK/kVSuC+uNDxwo3x4BZO5kLpFO8c1y4GknTTjAhp1EhDe4Kmm5RUZGoRqqXh+ZPb5vgxiWVZ6uphr5T/zXTbZKyAlQK7OngRbcC0PjVaqT6LF/uZuvCytfv31NFjJtvZ+MVOhS/2U8deWeXNNqmFClsv7Q3qvZJhvYoANy00R7aWHPoxIYCxpIu5vT5T7aHOo3tN03Xg5tjx11nLSVXdU80jKVNGUFRT2zhIcJ+0NXChRbQXPcDYTmVseKhJxPdLKPlGXtkbzMppBRzl1R3PIK4EiEcDVBmE5XRaivzvUpkA8cN5CdQ6TO1ha825zc/2wLKM3TXwMLmbK8dSOp/4lXp94vqR8twgGu2LcfBOzPctXH64S2ykCZKzPRCwh8lZYe9QEA3oNlDewqiuDKkJgd0BTgvPvJW0cRfEa4DXJJHBMjEE1On1V/KvUKQ5gDBBkHunBykCDpvRQtmrN2mrWZvYIS8FsWpDmTiPv7KCfrxSxegDysKyU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39840400004)(136003)(396003)(346002)(451199021)(66556008)(66476007)(66946007)(76116006)(64756008)(66446008)(91956017)(83380400001)(66574015)(86362001)(55016003)(33656002)(38070700005)(122000001)(45080400002)(38100700002)(478600001)(966005)(7696005)(9686003)(71200400001)(26005)(186003)(6506007)(41300700001)(316002)(5660300002)(2906002)(4326008)(6916009)(66899021)(8936002)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?LF35Lr90FzJ7OlPNKslQ7DTGmOlD7pS9RW0wqXl3ILTHMY46AAmMcodfL1?=
 =?iso-8859-2?Q?jf4Knbb7ur6ajB0z/edaExDl/rHCSndPWrJH6sil2DWb0poWHpKcCKrKFN?=
 =?iso-8859-2?Q?TNSHVh0jjSO3KoEv6bCT+taLU1xWsPJKJ+a5641RKyizKHfm4/zVLQbg88?=
 =?iso-8859-2?Q?YV6EsHDEp5rjxz6+HE3/Ttr7wFbZNEdBVObQdJ3Ep05WDs6jPOIBh2yGPi?=
 =?iso-8859-2?Q?0ZLx9V25hKQP9jNNiwsJXp9E7WjJcCP0JQRJmXd+myd8oI+tAMf4WP94kN?=
 =?iso-8859-2?Q?S/12GGCQgb5bsKsIl/kixu1QjtWoX0KvR4/P2q2U70tCJJloalbuyyjlwl?=
 =?iso-8859-2?Q?ZJV+z29TgO23m8algH+L+KIS45V93j1JQ/oYguvGvr08P/ra2ux2YsM+cJ?=
 =?iso-8859-2?Q?pGeBTTzVKNihcs+9zVgHAJo53NS/xW9IZ1LCXmhsxRVBsLuF12eNP4sXfm?=
 =?iso-8859-2?Q?D0LraiuT4nq9KDpjOUzVvi9E1LH7aGRw7t40hz8T+PW0tFuvNfLo1xbMdy?=
 =?iso-8859-2?Q?Cw7MXthNsWFnugpHDwaoDDDHT+rKQSlIvYNSMmdUSnxn18132Orm3+1841?=
 =?iso-8859-2?Q?F+VajYNHXkrcJTClBdbfKNNujXO5wOwGy6INOlV7wdqgBuB5zlQIC+y52g?=
 =?iso-8859-2?Q?L+ZIpQJb4tAkqxEu3m1EwDHDrSyQtqlBYktOnSMWy0G/EQID5gis3gXMTH?=
 =?iso-8859-2?Q?3Ef05XPyyW8NcUw3r6aOpoV6FgcQbYDIgwxKG3F/gAXZV+m8nbIqOm0UrL?=
 =?iso-8859-2?Q?gxWHehnBpfyi+5s/htHEDQl0xB3vnaaJQxpfcaZg96pp6o5AwHukaxTd+k?=
 =?iso-8859-2?Q?b/4WeQt3rOpF4elnmSZ+4Q5DX0aJONXTFJmWiy3CLG+NM6LfHuH6ysORZ1?=
 =?iso-8859-2?Q?ffpAV08GKvILXIF8HGmLb7r8CNVPp8RT2EtDpZu5q2tZlrvXbd+0H90E8y?=
 =?iso-8859-2?Q?S8ltfdjtzAgvoZUD6gnlVhZwgN5UT9q6Bz/pH6ZW3uUDESa4t0gSItSb3x?=
 =?iso-8859-2?Q?BWMfmyWIvLWaA6P4wy0jnis8FfOZQZl8MwtcD1nOF5m9kIjLwgmorfqiAe?=
 =?iso-8859-2?Q?ppb18kDtS0nz+GRzAD0rjK0zbvuaPYW8vMLJuEHpISVt54AHtDpQPWd51l?=
 =?iso-8859-2?Q?OZ74HQCqu52l/RbBHfFd3HfyJGjdkiAp2nMXovz1xhVZ7J/aNeI/FOBmmk?=
 =?iso-8859-2?Q?t8uj1pssszQhZ0OXHTat1Pf0yg1cF/AY3zky0UsueMn5kguFbWLpSh6ebZ?=
 =?iso-8859-2?Q?LlbFzRpDdKBGowsiKpXO62XA4fpckmQv3BocAaZqvsCyy2A95O04jcWRr6?=
 =?iso-8859-2?Q?aRddr98+Tp1cMpi0UxIFZStsu1nqNcpKt0k82GYrDuvy+hYNjzcqXRz8pN?=
 =?iso-8859-2?Q?OkHPUbmvLuPEkRE8uQQmHaBWgsPtn6jIShiIk4dNJNUxFxG/3s6q4NaVLX?=
 =?iso-8859-2?Q?pAU4nPC9DRr8ms10/pzDTQcOaPA2ccTNRKiSmOWFepgA6UypxdepNoqRy+?=
 =?iso-8859-2?Q?Jj7qVKOeIVykBCjNqn89ipBOnOwF//4n6G3+EYx0hY7xDa0/UtHyktsJJq?=
 =?iso-8859-2?Q?mCCh4FHlHeYfsmWLe2/W16xq1mSen+QXb2KKjGqAdROwsuU6NjoTS/gvUn?=
 =?iso-8859-2?Q?6UvEQWMq8zDQ45NNyBCoC0EsS+swLfx+Ng?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461a7ddd-318b-4398-bb2f-08db8cf33c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 09:40:52.0117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOwyZQ+C9b8POx0Fj6aJhWbhYrIBcaTNcK7SacWq7cz6g7xKGRUcxc4wngCRAkJoUtxpATl4oFPOwMNfupV1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184827

Hmmm, this is odd because yesterday I have checked this and the additional =
parameters added to tar have fixed the issue for me.

But I have added them only for posix tar format, because for gnu format the=
re is no need.

BTW. only these packages are different?

AssertionError: The following ipk packages are different and not in exclusi=
on list:
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-ptest_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-src_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/webkitgtk-src_2.40.2-r0_core2-64.ipk


Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: wtorek, 25 lipca 2023 11:28
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

Hello Piotr,

On 24/07/2023 20:50:50+0000, Piotr =A3obacz wrote:
>
> Hello Alexandre,
> this is a final patchest which works for me, even with reproducible build=
s, but additionally, with posix format of tar archives.
>
> I hope that this time it will work for autobuild as well.

We are almost there, there are still reproducibility failures which I
guess where hidding in all the other other ones:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3251/ste=
ps/12/logs/stdio

This time, diffoscope ran:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230724-5av30j=
l8/packages/diff-html/

>
> BR
> Piotr
>
> Od: Piotr =A3obacz <p.lobacz@welotec.com>
> Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 22:46
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add sup=
port for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184818): https://lists.openembedded.org/g/openembedde=
d-core/message/184818
> Mute This Topic: https://lists.openembedded.org/mt/100337925/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

