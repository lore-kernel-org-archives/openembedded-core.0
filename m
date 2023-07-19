Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BFFEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 13:36:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.50])
 by mx.groups.io with SMTP id smtpd.web10.13879.1689773806713885985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 06:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.247.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR5hJqbdIvZ1RUas8snHuPe8o+oNPApBu5VKF7X5V9oLIqaPhqpIuBX7bDA8yrjoPm93a3FvHInNrDa9Hq3nlvvXceuPduIAe2IBSc0iB0O+dM+KHJMfNur18PQqxTSrBnvX/BCs8aDpAidhYn2pzSrbRB4kfQ6O03fiqglccJkBJikjaB8bfjyWwcH0oXufRCpUJLZubuFWTPXjDp8HKE88ytEaVD5WEQEOyDhw0oLw/kxUmC0K+knRhhl2g/DX10RTEOZ1EQg9S39fdu1wjM7ro3GKL8qcgY9XwdxQ2MnngnshA6Y8hlllED2fgqHQzAeofRMPNz+5ZlO0j3dl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLMlNTwSfa22LRUxrPBWclf9ov32hjQU9FBF4+1fRuw=;
 b=kiUrTU0PSaL8i27Q5j5i762sh9iC3jrvl8/zBIhL78HQ1XLG74+xzztlRVOhQX0hCQDv5M/9MMy2e2jiz1qDKqhaZjn0HG25v/U3Q8Hnw2ekYbZWMGT7YHg5XyAW7Xv2JWpgPwDJmDCk914Tr6MGYsBxkzz1YmjETxyx12hY2mkRrf1hCRU+8J/Xze8gF+hIq/xBzS/fE1aELnqSBQDtzTK1N6k1OUlITVPA5vskAyRqszEpcAWAo8oYkahCQXgLpzNTl/00aP30KBGcQlVmRxlBlHgYjWYwOFuLj4lb2J3CzZVvpmQ9FUoYHcGHo2hmPWOj3HuHFU9pN976geHD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLMlNTwSfa22LRUxrPBWclf9ov32hjQU9FBF4+1fRuw=;
 b=JnOf3g1P8mrK3IcLm/6ORtZ6EWZuZ4DhIUSFI2OCIMPYuXeYRZV2g0ggfhQE/ZD5dKS7YHR+BU2HdO6akDzhRHyMwv+qpNtR0WDUBGhDLo8h2ZVhlh7+RtDKKJCICLueQZ0G1WjivRT2ZYb+AQHf53USGKZl8alGYv0OC5gH1rs=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8498.eurprd04.prod.outlook.com (2603:10a6:20b:341::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 13:36:42 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:36:42 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuhYbulVWq1EszUGWkGRpKDQme6/AxGYAgAAAV4o=
Date: Wed, 19 Jul 2023 13:36:42 +0000
Message-ID: 
 <VI1PR04MB5373486B35FBA4D25C4818939139A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
	 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
	 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230716213857fea03b3e@mail.local>
	 <17728F63D7D8F798.22245@lists.openembedded.org>
	 <177297AC200D092D.22245@lists.openembedded.org>
	 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <202307182105150310803d@mail.local>
	 <VI1PR04MB53735A682AA5C026FC6EFC3B9138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <354d702419dd053b96cee5cc64c2f923833fa749.camel@linuxfoundation.org>
In-Reply-To: 
 <354d702419dd053b96cee5cc64c2f923833fa749.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB8498:EE_
x-ms-office365-filtering-correlation-id: e982c535-821e-415a-043e-08db885d2fef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JAruD8DdxE99nWr+mr+NlsigkWjwa+UWMqv8NL5c2ObT+f1cGzmgJYDUWtkbyah6tE2yNP/IudR2ohHGesPJ5qUK6e08NeQO4k6CyCA34aoBgPyOX1NV0HWEmE/ByNz4ZWIPcsbfIOnUyOqxv5CSiMSQYQrNjhkKfmFB2XYmP7rC4wUahSTDOhZ5QSOP3WzBRWbNtVvrGDRZ18bnUMBcUMGfdFU9iSyOQUZdrwVV4GnzCZTXwl57xFyGTgvVymODlTf2ZOQH40JkZwHIhw/7kdlfXm0PxgpAtES8SnLDxvSHX8qiKnyblXhsCHKT2Uv6D8FGUbblN6/ISRiHPTxOjm4fSfwbkZSx8LL7wOQl+nQOZNWs+S6qh0/n3uanZk4uGOPhKAYlTaIsY5wbqJ5JOolV+IKR+twlUnfPO1KnhoQfSlAGKMGtxUAIwzTM6uBMp/kciB50UeUycZcJ6IU4vdUdejsX0/1CBujQgn7ob2qCrlQRay95zFY8zxZEpcUX+U/42c65ITLOOBMJ4/mMdhxWO6LgTu+AfZofeyrTDQLyYeOcDzGxcezkPGAKPq94Wt6DX//E3aL0Nf9HSXnGtBKV+AXr0vZVPUj0eJ8w2Ms=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(396003)(366004)(376002)(136003)(451199021)(55016003)(966005)(38100700002)(66556008)(9686003)(7696005)(83380400001)(2906002)(8676002)(8936002)(478600001)(45080400002)(26005)(110136005)(66574015)(71200400001)(186003)(33656002)(54906003)(5660300002)(41300700001)(66476007)(52536014)(64756008)(6506007)(66446008)(66946007)(316002)(86362001)(122000001)(91956017)(76116006)(4326008)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?Ep2Vl63gUh/Q6Afiz+MZL+hC/iGmBdHPiN2hR4ZL7B7/8IzmGl9SGRdos1?=
 =?iso-8859-2?Q?UZcIEZ40gOFuxXKZcAYBtZNITOhTswbKvYFVLAch/7OKpkAiBdqAfHclpn?=
 =?iso-8859-2?Q?FcuqfKjckP76vGNMvIkgs62SF3b+i4OF/duLsaDmw0g+AWhOplxQl0qXSZ?=
 =?iso-8859-2?Q?TEpf634s9QubFTbKBuocKuKq/YN2MgoIBrwMriRbKHkcfyZkIjLIqcW8EV?=
 =?iso-8859-2?Q?frr5lD9tuF2U3nwGbBw7tFMh4Zf9/SscUBn8smq5aX9ByO51/qVAqWDD5F?=
 =?iso-8859-2?Q?aeooHvfcjga0iSXdJE5VTdFjltcKrA2+cxm5yfPkbQLacRtG8zIHA1KlTN?=
 =?iso-8859-2?Q?BcXLmzA+HaF4PSgGynqWoMVKIurXB4ieGl4pgo10KtSZprh8cfrDgoL4s+?=
 =?iso-8859-2?Q?RXtvMs1kcxw5JjLyIYyxCYyPwvjs7pDE7shLJveM4dBYuZU8XLXUc2CJbL?=
 =?iso-8859-2?Q?cNuM2nbSJlfLb6TB+Tg+OhWpn6JG/mEHQrUNL8K8S30jUExDFNyVmeZv8N?=
 =?iso-8859-2?Q?Zv5QnRKZN0sK4uRMgeB8yIJcjjydfcwGwP07Uky0XFDZuHUPuMgBTV72Fi?=
 =?iso-8859-2?Q?7qohVGAcvza6qplQ27n77qRyV8hhocP4hXENmnEYgSNM2dU8WBLU83FfZf?=
 =?iso-8859-2?Q?ZTFWlogFH6aPHDULvI8tSvc+d8T/KO7Pkv4WH8y0ez0y/LlcpVWC3rvS2G?=
 =?iso-8859-2?Q?t8Xo/DlWIdLHTgEwZM5ettMau4qMaVr23IJxTeXqVwCm38AoyF0zwwep4T?=
 =?iso-8859-2?Q?lZniTBtabx1RDmYV1GqcKKRKdxKChlOvg+bi9n7ZOeV0vkSX/93jqIaViQ?=
 =?iso-8859-2?Q?kNUX3fJbGnTgA6mnyNXp8GDBApuX0ibfCcgSdkgZKqUHtGYWBIQKw2giFD?=
 =?iso-8859-2?Q?WrtBxObCG/QDU/6vQHcCGGt+jIFAfJo1k3sz4nrXQsTouob0IUJbkCszt3?=
 =?iso-8859-2?Q?o8oevVxNT4K270Y551y2YA/GdXI9uRsuiLHScWbXWSGT3YiCutNHGcx5oG?=
 =?iso-8859-2?Q?giGRmhcBezqIZdUKu9zHVfC34mhxBOhWFIW1xrNTR7GBb0v81S795CZQC8?=
 =?iso-8859-2?Q?X2qVz8YW9PdkYfiRF90jfgT1eE1cPe5cbVZ2T/nAYtVyaUt4D1q+yDfpPW?=
 =?iso-8859-2?Q?zHUJ5Ft7svDGS/84bksp3b6iWuE7m3BJaWdrEmDPkU9tW9849ezeNRwyuY?=
 =?iso-8859-2?Q?om72t3f/xUp2/vTHOaOJkVKvIXinoMl+6U6g9SPE7C/QbmFH2PLQBFtz/Q?=
 =?iso-8859-2?Q?EcV/Z/IXRR7lDmx3eij5BHwR7C00sAEyIe4fIqjBjongcbPqI0XjfHhxY5?=
 =?iso-8859-2?Q?Y3UMeKTglihWKcJlGmPlnM69ielfC/yxAdXtPo9V5IX4ZhjEQ68OQh+s2u?=
 =?iso-8859-2?Q?Ybol5x3887w/m0TrSbOe08Ovux1AcFyld/GW10+++ZPGw/ZzjnMyTYE6EU?=
 =?iso-8859-2?Q?sCbTSdF+EcYXiefua8G0kLR7JTl1OHlKBjuR3v3ArDm6JE8FxbEJTpFgYT?=
 =?iso-8859-2?Q?GAOzZC7H81XVzEEo/ikmxsZNM6xnGDhVYY0MlRQ5ZrwuBL0TI7EbPl8LaX?=
 =?iso-8859-2?Q?OSkVt/HIYgGXDFx1AEaSdEiXpo3nSLTZd9u4itgBwhybFCvnFle83T6HcH?=
 =?iso-8859-2?Q?C7cH/2TH2vjMo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e982c535-821e-415a-043e-08db885d2fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 13:36:42.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6EhJ0r0kInguftW/Fi0/Xr8cJ0W3OO8TmzIjimLW5Q5qRSAWjSkmkWudmaJnebu7z4zfDs8H4J3+0joaNSaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184583

HI all, Hi Richard thx for quick response.
Generally this patch for tar has been already applied to the upstream http:=
//git.savannah.gnu.org/cgit/tar.git/commit/?id=3D5461025569c2d946fb31b79f16=
f60e923bbd79f9
Additionally a new version 1.35 has been released which has this fix applie=
d as well.

> Are you saying we need to patch tar in order for these patches to work?

Unfortunately yes, but still this error, which occurs on autobuilder should=
 not happen, because the patch for ACLs and xattrs only
changes the writing algorithm to the tar file - meaning, when --numeric-own=
er parameter is being used all uid(s)/gid(s) are written
with numbers instead of names.

> WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: f=
ound 4 warning messages in the logfile:
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)

This one is also occurring on our side, but I thought that it is irrelevant=
 as it's just a warning and everything is working fine. Generally
I have investigated it and it occurs that this error occurs from opkg sourc=
e code https://git.yoctoproject.org/opkg/tree/libopkg/opkg_archive.c#n272
I added a debug code in here like that:

        opkg_msg(NOTICE, "Warning when reading ar archive header: %s (errno=
=3D%d) LC_CTYPE=3D%s LC_ALL=3D%s\n",
                 archive_error_string(ar), archive_errno(ar), setlocale(LC_=
CTYPE, NULL), setlocale(LC_ALL, NULL));

to actually see what are the LC values and it occurred that it is equal C. =
Afterwards my investigations were focused on whom is calling
the opkg command, maybe it is changing somehow locales and this is being ex=
ecuted in here http://git.openembedded.org/openembedded-core/tree/meta/lib/=
oe/package_manager/ipk/__init__.py#n368
but to my surprise LC_ALL which is being passed through os.environ is prope=
r and equals
LC_ALL: 'en_US.UTF-8'

My guess is that opkg runs fork process to actually install all depends, be=
cause in log.do_rootfs file from this http://git.openembedded.org/openembed=
ded-core/tree/meta/lib/oe/package_manager/ipk/__init__.py#n366
line I don't see the whole list of all packages that are being installed.

A stupid fix for that was to set LC_ALL in opkg with:

setlocale(LC_ALL, "en_US.UTF-8");

to check if it fixes the issue and yes it fixes but this is no go.

Question is probably now to Alex does opkg can run fork instances for depen=
ds? Because I have found that it uses this vfork,
however I dunno if it uses parent's process env variables or it's own. I th=
ink that this needs further investigations...

BR
Piotr

Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: =B6roda, 19 lipca 2023 10:37
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Alexandre Belloni <alexandre.bel=
loni@bootlin.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

On Wed, 2023-07-19 at 07:53 +0000, Piotr =A3obacz wrote:
> I'm running this on docker with ubuntu 22.04 LTS and I have patched
> tar 1.34 with the patch I have given to you. I know that it contains
> these parameters, but they are faulty - meaning the ACLs do not
> preserve uid/gid in tar archive.

Are you saying we need to patch tar in order for these patches to work?

> Nevertheless this concerns me that opkg-build command should not
> fail. Additionally I have tested yesterday running my build without
> acl and xattr in DISTRO_FEATURES and it also worked for me - without
> applaying acls and xattrs to tar archive.
> Generally I need to reproduce your error and it seems to me that
> there is no other option as to re-create exactly the same environment
> on my machine locally, so I could investigate it.
>
> My question is how can we achive it in the simplest way? Does
> autobuilder use a docker for building?Because if so, I could take
> these docker scripts, run them and check what's happening.

The autobuilders are standard installs of various distros. We keep them
matching upstream and the list of installed software minimal.

There are more issues in this patch series. For example there is this
reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3219/ste=
ps/13/logs/stdio

which is saying there were two sets of different ipk packages produced.
These are available here:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230718-bn_npkd=
c/packages/

sadly the automatic diffoscope output wasn't generated.

Worryingly this report suggests the opkg-build change is not
deterministic.

FWIW this is just with the opkg-build change and the bitbake.conf
change, not the other patches.

These two changes alone also cause these warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7436/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7436/step=
s/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7509/step=
s/21/logs/stdio

e.g. things like:

WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: fou=
nd 4 warning messages in the logfile:
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)

so there is a further issue to investigate there.

All in all, there are a lot of issues with this patch series :(.

Cheers,

Richard

