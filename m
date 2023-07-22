Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC713EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 11:42:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web11.3706.1690026163617564895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 04:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=tVRMw70d;
 spf=pass (domain: welotec.com, ip: 40.107.22.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMz/uQ6eiq3P8N7wssQHZsLi7ClUN2kFNsGgMwJwuMMuTHX/o/PxGnsYudfxaMDjBYo8xRtTDgDYx7xfnQORzBecKbTKrnDk3RA6aKPxrMvuM4gr6pDMmwWWMwwJm6PGXhJqBIZ9NEZhI6JLHz7nxBV5qhalTf3Gf+NVXer0GS/lKds0AzosBdaTQdB+SK/Veuo4lsykLnrky+0n7wEw2qhCDaG3SThra/IFe3lz/3WJfIqdp3lNiniwGNF9E2sA6hVM6NIUsi44SpgLW1Rny+0wovcSPHGiT0gwJtTxwtiqOWdSR/1hd5rvO1TVL3rLUeZ2HweAdoA4jqyb1mN10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WnBF01TyGqYjM7R93+uhmsBB4QmbeCp+BX7fp5efKQ=;
 b=K2/Gm/c6OyeXYEAxAO+yBVVBCx605NeZoH4H3bTRYsh0CnQxexcVP7iJnq0v88isEcqH+ojXURjaE6QT+sVzNC0DWNaMF6oIHMpP+15kDj8F6sWrTP2mqP3fqq4S5hjs3EI/v7qw60zl3JUJz4oK03qpv3XX3rhDJ3dVNX3/oX8qOCLaC4BIDVr9oUJHZ2z6IT9NHg4kaBqAQKwvP2QZGY7X/C2ygya8xevV6eaHRxavvGTRwnynRMXr08IT5fqusAZPGZJiBxwqNRs7VukfnkiiCuEcJgtDuEyXxGokaPRc4qB+XfgcV4yQFLDe6eWN/1q7RoAVd7GYC47iOOzQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WnBF01TyGqYjM7R93+uhmsBB4QmbeCp+BX7fp5efKQ=;
 b=tVRMw70d2hw5W5if4bQBsI2aQ3J5c/kHPi5tcpa7lwS7ccm0WKBQs6hdAuNznsDgtGD6j6JvvUZjYf2xnArZn7EZM076imnUlU2oKhCV1uuLteQHF8CxpL6j3FqT3jVunuFXMQN+TrI0rRi+9F8zABZaxwHRaJnFKA8ibnRSWI0=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.29; Sat, 22 Jul
 2023 11:42:39 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 11:42:39 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZu8vv0VriTzoelE6+8icI0B6pl6/ExjEAgAAYcouAALXogIAAFaUS
Date: Sat, 22 Jul 2023 11:42:39 +0000
Message-ID: 
 <VI1PR04MB5373082EF3B9EB1759C9D154913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
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
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM0PR04MB6961:EE_
x-ms-office365-filtering-correlation-id: 79d14944-f5aa-4798-eac8-08db8aa8c095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OdsBzGDrMfl3hR++L1WJX8wUfYHXNyty9Fr4Py3x5Khs2PwmlibvcGOhr1FZDZX7Gp8v9oZs2KYE027KnWQpP8f0tdqkDgv4muRuMj3CMs94mUMn5lUykteuIPqPBiTOiJab/GaxDu3XanfR937tjZgUfqy6sZ6cgTggpglHoq8zui+lB3PwbbIko+3RQeSbyMrG+FCYB/mbZh0LVGLAf2TK7o6EeUL1pLx8gtmM2D0+LYNnaOHKjR8yefSJfLjmVMRUTG3Y/4+nwHC7ymZ74jZqNVvbD+6mQvlt9iiQWCgB00qZ+ntjO8g1WMtSv8Ftfc9Cakh7ea9/+qDiHeVdg5Ddj3t++DfY/IFjfF8GDRWwWgW5p35gaq3bOrF/hEpdUAhEFprAJ2z+n6NySDGkELaoU4Po43u4YVY6oeZqI8PGpXD/Gz0Kbufg/Pexrf6qvokv/iMjx0awP2bKlbSk/LPVQU5nuQlOiX+IEIqqj1Ai/pSFAPdub8PPYKs9365iLxipSmI4lT61Nf4aApQyt7kdYpymXARffcGMUcRnyRS7YspAZ31xvw5kFxGkMoaNbCVusD4Z2Ug7jajwyyuXBITux3/P3pCNM8m3niSmSYY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(136003)(346002)(366004)(376002)(396003)(451199021)(91956017)(2906002)(66946007)(66446008)(76116006)(66476007)(66556008)(64756008)(6916009)(71200400001)(4326008)(7696005)(86362001)(45080400002)(33656002)(66574015)(966005)(83380400001)(9686003)(478600001)(186003)(38070700005)(6506007)(122000001)(38100700002)(26005)(55016003)(166002)(41300700001)(30864003)(19627405001)(8676002)(8936002)(52536014)(5660300002)(66899021)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?tH8+LDqaOZcnU+2WDXUAGPGd3szbNns6eyWGyel5dYOoMT4sEd0GIzQmy7?=
 =?iso-8859-2?Q?eJQDeZx3k/Qu9RhW5f0bMFqaeDLA+wyKXmEI9M68r4DeB9xG0ilgwdKzUs?=
 =?iso-8859-2?Q?GEt+jjQ21OyrGDmV2hDuJ9Y5BA+oqg/KUwX2JFN9YLIcTuNihPEP40s8NH?=
 =?iso-8859-2?Q?Q/70xSkCb3jJKq42msXI8kRLOfnrb/lAP81J9zvt26ynmBCOOMNQyifpZ7?=
 =?iso-8859-2?Q?J6wxmDQd9txUBGMLghXP2PgYgxPya2HLNzcC3b3u+w4huQjItRXV264ewq?=
 =?iso-8859-2?Q?wF8+/mVitvP5pyaPnPaq1EW7qs4MXuXMcrs8xJZdKzJVmmMw9BOAX3L/dF?=
 =?iso-8859-2?Q?7Oyg/h/+RG2HcPVW6OBnejtBdKIQo/JABPxh/U0eZ57BOI7abG5Tmmm+na?=
 =?iso-8859-2?Q?TS0MRWfs91Qyxp80huDQMmqX+34dSctL+b+KHl5WD2zkK0y11PXsi68luf?=
 =?iso-8859-2?Q?Ww+/5zP0CLoXVvBy2v6SFR4HdxT693zdPFdrvIU6OXFFlfQY4zJafeb7fw?=
 =?iso-8859-2?Q?aUG6uc2UVGmn5kGzHtNUxVzYxP8zwkbzMuB3QkxhoLXk2LHM/Miy8HdIWg?=
 =?iso-8859-2?Q?EMaP7dOqlKl7d/rZb9bVxqEhURTflzeb+P/WogfEvvK3uX4rhWQpwwGGdZ?=
 =?iso-8859-2?Q?Q42O0F5RTURpkDZ/nOFSy+dlAILnxKchRl0u/fKbLB0SLzyKrYfOa4s7fD?=
 =?iso-8859-2?Q?xfRX7k32YF7q7o/gCJcewdfCVbIAQO5PiZ7+bAbBw6DxYZkGseDUg/lvGQ?=
 =?iso-8859-2?Q?yeti1uHXtoMzwIXwU403JfHYRX1D+zgV4zEGTDVG/wIFiVWlEWlCHgwk5W?=
 =?iso-8859-2?Q?FgSenWcPV4x1UXAmFptDIDCsSUxgvxSqesvboPVHIckwPyBei+2Sjkva26?=
 =?iso-8859-2?Q?QNXUUdcvCVbqCp3rYUfwIuBbr1YMP09FtIEQBWIn2/yHW9sscsikQidv54?=
 =?iso-8859-2?Q?Pxq/JDc5BYc/9jn9WFp/q6MMgi6hs5ije5PqdfB0YW11IOvtU/+SJbRut3?=
 =?iso-8859-2?Q?0dxsaDH/UJomRE9iOw+3riZ+BANqZNDqVQzE78Fd5dQODKoTx0Byhjj/3Y?=
 =?iso-8859-2?Q?cHJFCN3/XOCr7E/xRfN9YSePO9LVxZRyTIiwLAXjVeA7ZSaEjk6+GQPDPj?=
 =?iso-8859-2?Q?VHiOIKMOL1Y5d7ul/s/TU/cp5H0nKJ5rrLupOMxtmgPIhqsWAMMjwFgFGv?=
 =?iso-8859-2?Q?KSVf88H22mfCEJidPVFdYiCXWSlvWLFETZfJAsGPU7VJeOmFPQ9lOp6qO2?=
 =?iso-8859-2?Q?5jecc58hESwvjKf87P6EbP06hOvqRJ2H2p1PXknauTWceNMWB0IRj2rXIi?=
 =?iso-8859-2?Q?sWc2GRxfg1oE4H8v/TQ8mDebfxv2D6w3EouLpk/I4241RIlMRbgfbx+iIE?=
 =?iso-8859-2?Q?UvLoG1QAkovsU5Ru9YNP3D3KaDEgXHp5epLOA6b9zpgn8PWJd37PMpVB/v?=
 =?iso-8859-2?Q?+u2YS8lYZ3WJG6bh2i2VI2PQbeSEdErtp3lRZDU9wpt27OEFTf+oOxRiqL?=
 =?iso-8859-2?Q?KtmbTA9xfAZh8bSwFvUmfphIm4Q5hzV3Iu9DlKoyNrEUpN73Js37/UjmYE?=
 =?iso-8859-2?Q?QY972lQuoFoz8nHHOxG+DC8k/o0sQV7nH0zisCLRNZxjHu7eyj/PQH+MXb?=
 =?iso-8859-2?Q?YnDPeVImvnhWcF0/jlhJk7ak6ZrQDDBBz9?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373082EF3B9EB1759C9D154913CAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d14944-f5aa-4798-eac8-08db8aa8c095
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 11:42:39.2976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sODiFisqZ8pYUh7uKGdkSk/4yNHQ7APxml/4yFTc2310CEXg+mc1b/k39n930xvcKFA0r3mmDRWcxUm35gsbgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184719

--_000_VI1PR04MB5373082EF3B9EB1759C9D154913CAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

OK, finally discovered why in my case removing of acl from DISTRO_FEATURES =
didn't work for me. We have our own DISTRO_FEATURES:append in which acl is =
being appended and I just removed it from there.

Unfortunately, there is this file:
yocto/openembedded-core/meta/conf/distro/include/default-distrovars.inc:19:=
DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2 ipv4 =
ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc =
x11 vfat seccomp"
which I was not aware of....

I will fix that today finally...

BR
Piotr
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: sobota, 22 lipca 2023 12:19
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: a=
dd support for ACLs and xattr

On 21/07/2023 23:33:02+0000, Piotr =A3obacz wrote:
> Alexandre, Is it possible for you to create a docker file or some image e=
tc. with all commands from autobuilder which will re-create the failure and=
 pass it to me?
>

I don't have that but really, those are just bare installation of the
distro with just what is necessary to start an OE build.

How did you try to reproduce?

The log says that you are trying to execute this:

opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-glibc-b=
inary-localedata-zu-za /home/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r=
1/deploy-ipks/i686-nativesdk'

The error is there, in the logs since I tested v4:

Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/wo=
rk/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sysroot=
-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compress=
or_args] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory=
>]

It is because you changed OPKGBUILDCMD to be:

OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}"'

Can you see the extra double quotes that create two extra string
arguments?

Did you test without acl and xattr in DISTRO_FEATURES?

> Because can grope, find nothing and waste our time...
>

Now, I've spent part of my week-end looking at that, this is time I will
never get back while you just had to read the errors I reported to you
on v4 and v5.
You are demanding this is urgently processed but your patch series is
not ready.

Also, you HAVE to fix the reproducibility issues, else this will not go
in.

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
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautob=
uilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&dat=
a=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C2=
5111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3DxRBC3fnrtzeYVHWF3NXuYNEUcItaUgthfNbsESw0Uf8%3D&re=
served=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2=
F5631&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9=
d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DxRBC3fnrtzeYVHWF3NXuYNEUcItaUgthfNbsESw0=
Uf8%3D&reserved=3D0><https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/83/builds/5631>
>
> On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
ups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3DtHNWv1KiC%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&reserved=3D0<https://e=
ur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.co=
m%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%40welotec.co=
m%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0=
%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DtHNWv1KiC=
%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&reserved=3D0><https://groups.google=
.com/g/opkg-devel/c/dYNHrLjDwg8>
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
> > View/Reply Online (#184688): https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2F=
message%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc=
852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382561800250=
31560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVZTQIYFoSzjRHY42jZwFRCNC6EDE3=
0tqMshNiIUcl6M%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc85=
2d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031=
560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVZTQIYFoSzjRHY42jZwFRCNC6EDE30t=
qMshNiIUcl6M%3D&reserved=3D0><https://lists.openembedded.org/g/openembedded=
-core/message/184688>
> > Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=3D05%7=
C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1=
d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&sdata=3Db09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&reserv=
ed=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.openembedded.org%2Fmt%2F100275318%2F3617179&data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3Db09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&reserved=3D0><https:=
//lists.openembedded.org/mt/100275318/3617179>
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%=
7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f=
1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7C%7C%7C&sdata=3DZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&res=
erved=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C01%7C=
p.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c5=
1a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&sdata=3DZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&reserved=
=3D0><https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.=
belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08d=
b8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD=
6vMk9hWlI%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fbootlin.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7=
C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C=
0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXMC3vugVsU3k=
WlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&reserved=3D0><https://bootlin.com/>

--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8=
a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6v=
Mk9hWlI%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373082EF3B9EB1759C9D154913CAVI1PR04MB5373eurp_
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
OK, finally discovered why in my case removing of acl from DISTRO_FEATURES =
didn't work for me. We have our own DISTRO_FEATURES:append in which acl is =
being appended and I just removed it from there.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Unfortunately, there is this file:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
yocto/openembedded-core/meta/conf/distro/include/default-distrovars.inc:19:=
DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth debuginfod ext2 =
ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g=
 nfc x11 vfat seccomp&quot;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
which I was not aware of....</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I will fix that today finally...</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> sobota, 22 lipca 2023 12:19<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbc=
lass: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 21/07/2023 23:33:02+0000, Piotr =A3obacz wrote:=
<br>
&gt; Alexandre, Is it possible for you to create a docker file or some imag=
e etc. with all commands from autobuilder which will re-create the failure =
and pass it to me?<br>
&gt; <br>
<br>
I don't have that but really, those are just bare installation of the<br>
distro with just what is necessary to start an OE build.<br>
<br>
How did you try to reproduce?<br>
<br>
The log says that you are trying to execute this:<br>
<br>
opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot; =
&quot;&quot; nativesdk-glibc-binary-localedata-zu-za /home/pokybuild/yocto-=
worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-linux=
/nativesdk-glibc-locale/2.37-r1/deploy-ipks/i686-nativesdk'<br>
<br>
The error is there, in the logs since I tested v4:<br>
<br>
Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/wo=
rk/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sysroot=
-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compress=
or_args] [-O] [-o owner] [-g group]
 &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
<br>
It is because you changed OPKGBUILDCMD to be:<br>
<br>
OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; &quot;${=
@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot; &quot;${@b=
b.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;'<br>
<br>
Can you see the extra double quotes that create two extra string<br>
arguments?<br>
<br>
Did you test without acl and xattr in DISTRO_FEATURES?<br>
<br>
&gt; Because can grope, find nothing and waste our time...<br>
&gt; <br>
<br>
Now, I've spent part of my week-end looking at that, this is time I will<br=
>
never get back while you just had to read the errors I reported to you<br>
on v4 and v5.<br>
You are demanding this is urgently processed but your patch series is<br>
not ready.<br>
<br>
Also, you HAVE to fix the reproducibility issues, else this will not go<br>
in.<br>
<br>
&gt; Cheers,<br>
&gt; Piotr<br>
&gt; <br>
&gt; ________________________________<br>
&gt; Od: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
&gt; Wys=B3ane: sobota, 22 lipca 2023 00:01<br>
&gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; DW: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: a=
dd support for ACLs and xattr<br>
&gt; <br>
&gt; I confirm this still fails on the autobuilders:<br>
&gt; <br>
&gt; This is a-full:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/5631">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&amp;d=
ata=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7=
C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000%7C%7C%7C&amp;sdata=3DxRBC3fnrtzeYVHWF3NXuYNEUcItaUgthfNbsESw0Uf8=
%3D&amp;reserved=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F=
83%2Fbuilds%2F5631&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c5=
7041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382561=
80025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DxRBC3fnrtzeYVHWF3NX=
uYNEUcItaUgthfNbsESw0Uf8%3D&amp;reserved=3D0&gt;</a><br>
&gt; <br>
&gt; On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:<br>
&gt; &gt; Extend OPKGBUILDCMD variable, with additional parameters, dependi=
ng<br>
&gt; &gt; on target distro features, in order to support ACLs and xattr.<br=
>
&gt; &gt;<br>
&gt; &gt; With fix pushed to the opkg-devel:<br>
&gt; &gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">=
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.=
google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DtHNWv1KiC%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&amp;reserved=3D0&l=
t;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DtHNWv1KiC%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&amp;reserved=3D0=
&gt;</a><br>
&gt; &gt; opkg-build is able to create tar archives with ACLs and xattr.<br=
>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/class=
es-global/package_ipk.bbclass<br>
&gt; &gt; index b4b7bc9ac2..5e151be3cd 100644<br>
&gt; &gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; &gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; &gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-s=
dk-target.conf&quot;<br>
&gt; &gt;&nbsp; PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # Program to be used to build opkg packages<br>
&gt; &gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quo=
t;'<br>
&gt; &gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quo=
t; &quot;${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot;=
 &quot;${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;=
'<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-v=
ersion&quot;<br>
&gt; &gt;&nbsp; OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.g=
etVar(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#184688): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/184688">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DVZTQIYFoSzjRHY42jZwFRCNC6EDE30tqMshNiIUcl6M%3D&amp;res=
erved=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&amp=
;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c=
%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000%7C%7C%7C&amp;sdata=3DVZTQIYFoSzjRHY42jZwFRCNC6EDE30tqMshNiIUcl=
6M%3D&amp;reserved=3D0&gt;</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100=
275318/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3Db09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&amp;reserved=3D0&lt=
;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.=
openembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sd=
ata=3Db09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&amp;reserved=3D0&g=
t;</a><br>
&gt; &gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&amp;reserved=
=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%=
7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4=
c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;sdata=3DZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&amp;=
reserved=3D0&gt;</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DXMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&amp;reserved=3D0&l=
t;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852=
d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382561800250315=
60%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DXMC3vugVsU3kWlvJ7Ru%2FFh2RMc=
8v2NBhSD6vMk9hWlI%3D&amp;reserved=3D0&gt;</a><br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DXMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&amp;reserved=3D0</a><br=
>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373082EF3B9EB1759C9D154913CAVI1PR04MB5373eurp_--

