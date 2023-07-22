Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6EDEB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 11:20:17 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.89])
 by mx.groups.io with SMTP id smtpd.web11.3452.1690024814290921127
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 04:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=swTtBNtH;
 spf=pass (domain: welotec.com, ip: 40.107.15.89, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9Q2gEd9rPtjuk+GR7+3E2guHnxNYaNuQ5XH8jv/MPoFGEfsnawWe8utOyg3QX2WmckHQxr2p/2ypVCNKQI4gzf7Xp8J0qAxh0O5d7YFpG3h0z4Ey/Ox2DK51ptQwqpXzXLL3hdAKyILr6BwyPyMG+v/gor6xKA3xJ2XdM7QojA7h+wzEwT7QiL2NenXoGeRdC43CQ/P9exPReZXgSkIwBBHu81qMA5ioe7IiOaxJkpR1vpV50JNDWVMiE0bfss6xJt6Q+TF0rOX+aSfEDyO0IfYv3QOApHEWrX0sZFlbmWuJDNp6UPzaKHNBSBiTbpijU4YxvGn1Q03ZFWwQ9rqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gASPyD1hg7zPKZbdcMbA3KwK9wEmo7ZtukPl79/FcYg=;
 b=VEBGFWy0zIYgu9rSFP4Bm+Ii/lLOmkrUeurwkBa0oXeSeR6lurd0r45eXMQ+namhfNTo/OwPVacRA9q3fbyrkJ5ne7fkIhZNQJr1co+hisLuorD2zz0dlkbPMcl9Giqnsw+zoHMjeMn5TnzSWFUj94X2soGCX2tFsiToiODQepDFynaXgsNIpB3sDmmjEnx00qHXTh2Dxo/Zyv1QPWOE7ucv7bpWuRUgmE5Dw2IcUZygpNNTgnbESxF/YkM+W25l79bfJ8ukfUX9uEG+Xncus+qnndm7UKp1ATdhnTfzuo7wQfkAprS+4r+YO5Lg7RbzS18cQukgNt4iteoS8JgFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gASPyD1hg7zPKZbdcMbA3KwK9wEmo7ZtukPl79/FcYg=;
 b=swTtBNtHTYKVMdxB3fCHf+ZvV/GbnRq9deNo+zblObMzELfTxNbw6T4GeyaHVJdrZZ08akTHpUf+0Dai53Tc3dzcBLmSS9lAmXdEVQqMMPuxQk0tC9B+FAQKWyyh4+lRsX9xd8pwZSlLnSDF0A/FHyKAr+0WEbHxVT00JOr/KfA=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DBBPR04MB8011.eurprd04.prod.outlook.com (2603:10a6:10:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 11:20:10 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 11:20:10 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZu8vv0VriTzoelE6+8icI0B6pl6/ExjEAgAAYcouAALXogIAAD2l/
Date: Sat, 22 Jul 2023 11:20:09 +0000
Message-ID: 
 <VI1PR04MB537328F5AAEF0341CBCFDB58913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
 <20230721220126165c5136@mail.local>
 <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230722101959f26ff2ab@mail.local>
In-Reply-To: <20230722101959f26ff2ab@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DBBPR04MB8011:EE_
x-ms-office365-filtering-correlation-id: 58266038-c425-455c-1890-08db8aa59c47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o4oLTevH8aRaEDViLx2JWGzaiYcS3MpAK9wFH9ZrAAux1dtSw5+pXZ26SoY19K1CP0MxFVBiqFYI/vcW6QmERAlxZqmK0WuBDU9nCGXMlzKktFmiJjflVFOD7B9kpuApbNCy3ZqiExmMlwXZaB+G8ya7lIZr5dY/4D2EkDjNTKV1xZYxKiFk8+DMkITC9e+h6RSHPK4TE3K8jAp7SAg884+qOkISGM7AztRe7EH7505hzjkjACHfWfzJdxA3GrWICfEbvJhtkB+PvGzxZN2AH7VIek3GHP1icasugZ6pJRnBy0Hc9zhnXzvK4M/4DJZXrQADGtlalzfcWWqqsdKbPkYn8ZrNsWtTohpvloD955IJ+ms5KDlQUees0e3wJz+x0YBW0lC3L74KkKlF6NrKHjGat9AsenmQV8+mrxGn/a+OMZV37FIU/OhrHJA2T8Cdx6pBkg16ZmoX4OjvW3nRT36jyiLz8YKt15RS05V5UcwmVusDu4xqgRP9kq57l55URfanBlSdFGPHmbl7wADQ01lwpEs2eSMVfmtA5wND+SmZU8hF7MzgO19ZD4SKkNZ7JPNzikvTc/LgjDOhMNGT6IZiJUxnQ0n4LH/ErPMUSpM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(71200400001)(45080400002)(966005)(7696005)(9686003)(91956017)(478600001)(186003)(6506007)(26005)(2906002)(316002)(41300700001)(76116006)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(52536014)(5660300002)(8676002)(8936002)(66946007)(38100700002)(122000001)(33656002)(38070700005)(86362001)(66574015)(83380400001)(55016003)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?/hObogaSeUN975qnQQOKu5ABsMk/N8vyae0sf2FqWoYCfPvq67vjC6Jk4s?=
 =?iso-8859-2?Q?sfVQYRf+3nWGkx7czmzF9lxhJAASTNzSs4gHZzdogu157obFNcYz6428VE?=
 =?iso-8859-2?Q?VJwTX25eXKL+zRqQ+xrYy1nj584eLPO9NKI8VmQ/dwOq9X+JLi4s41BM4T?=
 =?iso-8859-2?Q?bArlssbPDS0UXyM4pZ92qbQWpECWkzsjpkujP/H5f1DblzZWjlIyQyIbop?=
 =?iso-8859-2?Q?FZWjLy85HkQQrf7mMKCGx06bG6Vwy3CTyMxg0jgUgbB1mGZmsR4mV6yGN9?=
 =?iso-8859-2?Q?XjnVE/K/Mz4PhXa+OdOdEFK58vErPsVXdQ6fp4eZkW9gAQnLANlSZF9tOU?=
 =?iso-8859-2?Q?g6GtO0IwxXo6v2a9Yceo0fOsfr4VlxCyxkd9pvZRj7V+gX0N5xRlRtEKSu?=
 =?iso-8859-2?Q?oWNAY2zOrBiv31uacrlmh2enuTF2di8VevWKdjzY07asdTElDrJbmio8k5?=
 =?iso-8859-2?Q?faRUwVpKS6BWG2/rRzKnC3ZY6pIa2QR6dK5t/+YwdAadaPcOtijOe4lB4n?=
 =?iso-8859-2?Q?AtVGjnk32vHXEOAeLhnaASNJBKiTWJX8r+BzKlqxh6hj9T7bfxDkK9SK1V?=
 =?iso-8859-2?Q?g9kTyhJzyDl8ik3h0FQ5tKruJ+TjNoC5OEl5vEJpX0laHIGo1FBtlPBDq/?=
 =?iso-8859-2?Q?kla6N8vsJzpWmDU6HoPg3bDPM1MEbX/BqlRhXM/p6z4OEYsL23zo8dnerJ?=
 =?iso-8859-2?Q?HMuRUDZ//ZP9fdOHr/ffZ/mEUfhq8BsoiTCUs1X5WO4aW2UuwGP3VNkn/i?=
 =?iso-8859-2?Q?rPPKJToXTDlbaaDb6HU3MIWP7LnBJptRVV50HRm0MIlMy9+AkPWfeVs/FG?=
 =?iso-8859-2?Q?oJyY/W0n18aq+dLLiDDi/YNWnYm4Rqztodw7rkPRwg3+jYqE88uVyOsnxg?=
 =?iso-8859-2?Q?0q1OrrlqrSxf8rBMdGEbMnYU8b0nNV4JlI6ke0yKzZ2rsMjSj6d4OkKI7K?=
 =?iso-8859-2?Q?QIu4SAmbQKKBWnJ4vYBxXsNuKuw9dzPLG/6oFWP+pV3JKl7HYOVOZPLeYb?=
 =?iso-8859-2?Q?UgXGKwKEQEmIJ/QHtjbCcr4JMKt3Erorj8IvFxDVccHFMblw5kaJyFCIoN?=
 =?iso-8859-2?Q?XguoaM9n5t8kBiQ8ASeYm9Vw0HJx29C/FadXcBpoqI9B55yBTbPzPs6pV+?=
 =?iso-8859-2?Q?Bn2snu0YCYoONckH2ZB1jAqDzqP4UMwDxnvxifk4DkPo0TsyIkrHTERyDm?=
 =?iso-8859-2?Q?2mtOgXzEhDN8veJdLHq3RBJQqqd+FSGgyOYM+rI5F7VJ/I7T9+UJ2RHiV9?=
 =?iso-8859-2?Q?370XDQSAPk8i85azIQ5xAX2m2iW1gjrj27ovWEXZNhb0U+gl5MwYN0ZrSo?=
 =?iso-8859-2?Q?7OZ1GlmHzZFeRG6moN2e3K1zyA8h1+emL0HWu/LU7k5WveJr5fKMhzPksI?=
 =?iso-8859-2?Q?jmVhs6VJtG2A3s2vc7yDeq6ULDELEe8AaHeCJ8IF9dIVz+9wrY9Ml/iYti?=
 =?iso-8859-2?Q?NHZX0ks3QSbS5oK8nbSg9DEP6b5DEq/+bcAxyEN4RoeAIpayWCm8UnqWtQ?=
 =?iso-8859-2?Q?EvEbs5H8MkeUop2qhvfFkE6xZ0G/K0oYPx4HBwpJ4e7rrzlUzrdD+uvFk2?=
 =?iso-8859-2?Q?6ueT0PYlF3vyodulYW1B4uUmFh9ckHxUceM6YR0HgCmfu5yzkvJ3sWgyUd?=
 =?iso-8859-2?Q?SV+VIH7Jd91eo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58266038-c425-455c-1890-08db8aa59c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 11:20:09.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KLQFLopTsOysIzra/Vlmx1DT3VK3WGJQU95exFZwLTwnlX+iuIq3IwdqTFepJZ6Ez5YaZ/oA5yJHsFey7UWXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184718

> How did you try to reproduce?
>
> The log says that you are trying to execute this:
>
> opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-glibc=
-binary-localedata-zu-za /home/pokybuild/yocto-worker/qemuarm-oecore/build/=
build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37=
-r1/deploy-ipks/i686-nativesdk'

Yes, you are absolutely right I haven't noticed these "" "" before...

> Did you test without acl and xattr in DISTRO_FEATURES?

Nevertheless, this was my first suspicion, which I have tested and it didn'=
t occured. I'll try once again maybe for the first time something went wron=
g...

> Now, I've spent part of my week-end looking at that, this is time I will
> never get back while you just had to read the errors I reported to you
> on v4 and v5.

You don't have to be rude you know? I'm also investing my own time in order=
 to improve it....

> You are demanding this is urgently processed but your patch series is
> not ready.

I'm not demanding anything, I'm only asking for support, that's all :)

> Cheers,
> Piotr
>
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wys=B3ane: sobota, 22 lipca 2023 00:01
> Do: Piotr =A3obacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add =
support for ACLs and xattr
>
> I confirm this still fails on the autobuilders:
>
> This is a-full:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5631<ht=
tps://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5631>
>
> On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8<https://groups.goo=
gle.com/g/opkg-devel/c/dYNHrLjDwg8>
> > opkg-build is able to create tar archives with ACLs and xattr.
> >
> > Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> > ---
> >  meta/classes-global/package_ipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-glo=
bal/package_ipk.bbclass
> > index b4b7bc9ac2..5e151be3cd 100644
> > --- a/meta/classes-global/package_ipk.bbclass
> > +++ b/meta/classes-global/package_ipk.bbclass
> > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.c=
onf"
> >  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> >
> >  # Program to be used to build opkg packages
> > -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.=
contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DI=
STRO_FEATURES', 'xattr', '-X', '', d)}"'
> >
> >  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> >  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMM=
ENDATIONS") =3D=3D "1"]}"
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184688): https://lists.openembedded.org/g/openembed=
ded-core/message/184688<https://lists.openembedded.org/g/openembedded-core/=
message/184688>
> > Mute This Topic: https://lists.openembedded.org/mt/100275318/3617179<ht=
tps://lists.openembedded.org/mt/100275318/3617179>
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<h=
ttps://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.belloni=
@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/<https://bootlin.com/>

--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

