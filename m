Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE2C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 13:43:48 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.93])
 by mx.groups.io with SMTP id smtpd.web11.23501.1677591828136930396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 05:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com header.s=selector1-melink-onmicrosoft-com header.b=hDs8VvL2;
 spf=pass (domain: melinkcorp.com, ip: 40.107.223.93, mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjoTbuf87UVDq2/v6FCOMNw44dwyCUZ/+SR2SRufIZKfQsOpBXT1oV+eHhvw6ZvEYC64kd3XNAniNcm/FS3JeWu/G/yFk49eNpxfj8dJrA31STM0vxtxIP54BzuuPEAtFjA7EHIGaGNpIP+JRBkb7NT0VMm7Ry9xant+9mCwGB2JDYwxH2nXnY1UbulpVvQL9U4QJdgvu1Ib1CsKo/dKhThM/RHUNJok54EofDA/DfZr/K9Z4dOmnhT4TYnBlSfkejoiGkcL0qRel6jJEo6oE24EAhEiytUKUaoI5OgwLqLOA+xWIT2puG+rZz9Gb2lNEIeZk9vctT9ovbwWa+fXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/wUdw8uwHN90qwzA+aH32ciW0SJxoqhmu+cP/wYbt0=;
 b=bCzfU47Xc/X5lO5vrAfsJ2spMRdHfLtzD5YKRg6wFL2GajfMrxytWv9l51UQEceuISAPT1dDlDpIpdfjPMAJiEoUkqW2vbzpAiRj3RFVrxLshRlgkAquefxV0HYo1aZcJXE6LhPp1M1QXckvsIFOk5BZulUt872Yvl7OX11a+mM4sLqhcjiui67PkjLajM9nZfcwrNjbZcGuV5l69ayEIrhwX46KUrj57ajQ55f2F+8GkEK/RsIssP0oE9zW+n4WWygslDIT4+iW6k/oDk1WIPna2Kkzo8YiUKyBSBVhHMWQMkAcj/M6Lf1Ti2KovpIFarg4l7bKsDSl8vQjKQzelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/wUdw8uwHN90qwzA+aH32ciW0SJxoqhmu+cP/wYbt0=;
 b=hDs8VvL2G8CFmG+TeiekvRqkBJO392WJPY3U5731RPBet1T1+vC8un9vfNkBrELLu67kMuhXpD5rrHZ94EPXGy1M8kj9SwE7GBBcHNYSPwvRYt1jQTz0cwAJwPHREQ73kLzSPYMWm60Qa58csrz8TqKpNi31QYXK8gh820dSCgs14dd7H+R0HTMaYAN+GUwV91axBykrK+e/q4hWlnewPegH+qnmp3WGf8RnR0bpsEnk7oSo6RDka9njVhNGBntPYaBIEaqQR0hC+m4G7FLVoExzekUnqNkmm8NYKuS95iel1k+JNl+nB+zzTZzzsbSqqctkE9KGk5vRCERyEBha7g==
Received: from CH0PR20MB4122.namprd20.prod.outlook.com (2603:10b6:610:de::6)
 by SJ1PR20MB4833.namprd20.prod.outlook.com (2603:10b6:a03:45a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 13:43:45 +0000
Received: from CH0PR20MB4122.namprd20.prod.outlook.com
 ([fe80::bad5:7d66:b7c:b59f]) by CH0PR20MB4122.namprd20.prod.outlook.com
 ([fe80::bad5:7d66:b7c:b59f%3]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 13:43:45 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Joshua Watt <JPEWhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] multiconfig: Build breaks parsing recipes for other
 config layer
Thread-Topic: [OE-core] multiconfig: Build breaks parsing recipes for other
 config layer
Thread-Index: AdlK3nSy3ZYIML5WT1W0A3McG3PccQAEIecAABUKxQAADYIogA==
Date: Tue, 28 Feb 2023 13:43:45 +0000
Message-ID: 
 <CH0PR20MB41220FCEC5B2E4E8290ADBE7BBAC9@CH0PR20MB4122.namprd20.prod.outlook.com>
References: 
 <CH0PR20MB4122DCF26110929D2A178451BBAF9@CH0PR20MB4122.namprd20.prod.outlook.com>
 <fb887f22-01c3-e202-18f4-f0c499c4d3d1@gmail.com> <Y/2n6pDarv1huAUT@nuoska>
In-Reply-To: <Y/2n6pDarv1huAUT@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 59b7b7dc-e358-4372-b2c9-4e1f2ae81373
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR20MB4122:EE_|SJ1PR20MB4833:EE_
x-ms-office365-filtering-correlation-id: d18ac444-2d49-4a5a-367e-08db1991d000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p3dm8gnDSBdHB8Rv/mZ5tRrGZcFntYytmk02CUGl0I1KtST1Xal/Gu7rJ+cb0vCkmuXqmYhO1pSNVio0FA1B4bc1vNZRvUx7+1clL7U6dOEVi6aqKbe2zwbAxWLpBgqOajmtM47O4PSkxAG16miIQglUTtsL86CJcg4jQM3N2ic8vjlJZvwm6ZY6PFJ/ovbQWp37DxWM71PewVZl/qRRDQpCfosT/bHx7pfEo8VWZpbxleclbUF5TcYaDbO0carabtXPhLEJc/YvkgCuXY1lR6yAxAo3wXuY1r8i6nlBKKy4oZpVgXHm/i4ucEL5jFgC3/r2UD+lJMcZ4QlEwV4bVLcAlNgqi3camNByJRaOnPswJx2Qew1vpxyHiWqJ+l1sikakZUOgZgF+VLN5jDWARxmc2IB8xqd3FzW25fzmwrFnpJo4yUdhWJi2l2g0obagyJ+sczv54TuureamjkHu6P2kf7QQSNrB2/9OAFu+ge87/cxxgFmnZos7i4kEJI2l+i8ZipqzI55Oatg0beSCLNfSv6yPe9paGiX4Srd5MwO2ABtecCDtPH6GTYur+PAp1XSwwoil4O2DKssIXMj2km3NKs0aXV9amFMzouV6RP1QNdQsVmRYQyUZCHVN/uFPyjSKYFH0drKAkrDrgZ+sZO5GdLJ77zZhPQLi6xdOBrzNn6vxdgYAWgA+R9nEMx5u
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB4122.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39850400004)(451199018)(33656002)(38070700005)(86362001)(52536014)(4326008)(41300700001)(55016003)(66446008)(66946007)(66556008)(66476007)(64756008)(5660300002)(8936002)(8676002)(2906002)(122000001)(38100700002)(7696005)(71200400001)(478600001)(316002)(83380400001)(76116006)(110136005)(26005)(53546011)(9686003)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?B7s5IBl1S3IZT8sfwDNs2j7XCCtBdtvbeo0MRJJjnriWFA+VPYHgUk/t4rpw?=
 =?us-ascii?Q?Adzn6pxU2RWfej7sgHQ/5rD5coeWExRKHNu2obttn5gzTBmhG53JmA3UirS8?=
 =?us-ascii?Q?i25ix3B1e8ue4caVj3IQXBhXxuceyGNKDHxLc+QOYvmqTpNcBqOsN1z7LTct?=
 =?us-ascii?Q?rYgzj9bg7gaINL+ZV9Et7jnV4wnnY5cW93gueZ6OiegkS/JyVN06JXVkvv70?=
 =?us-ascii?Q?oCUII8k9JM2N8kPPhu60owVW/ASqknh2IgO1JRHDpwAMwW3JgXaMfHzLsAIP?=
 =?us-ascii?Q?T2peWaplaVQQiG9D6IVQduERCyEOmBv3sQPDYwgXbgr0LlKBxmjcH/EB7KDR?=
 =?us-ascii?Q?R/Hs7rrjm8gFafTYx8gfP/jw71LVBDVXw0m1H/hbwCRz4coPNZjbYQG+gRhJ?=
 =?us-ascii?Q?EEGSrm4dop2n5BKEHbE1MnXb9R3jWNRkNR88T3VmLiCF5/sv2Du9MaHbyBdo?=
 =?us-ascii?Q?1dhXv0oKBoRwZF3/MbwhFZL9nl2Vt86hbcyOW39ZvH4dZxx0RS+FkdjdYPuk?=
 =?us-ascii?Q?+VXjuedAMzttTZ6QcvwgiyFvlOJkVQiCOkcJoPPYXl9nW+KOJiOc1AAFqna8?=
 =?us-ascii?Q?pv4MG4yw9eJy0Irvm8eptwEQKlY0jtjcgX0SlkmjeDLAKSEOWFJroja40sLV?=
 =?us-ascii?Q?NiaUKg36w1EdCBRlrpHm7/nKekj9PvToRnCL7sN3yQDtdv79EZ096+fe8A2g?=
 =?us-ascii?Q?tkFFDIDmZF/zSHerXlSBJiqhd982tsYgJj3l01lw6my2oYI70gA4+7PUKh4L?=
 =?us-ascii?Q?rJJ3A+isGSBUkMPduxMzOicE7jHoZlLM8Ie8KafMx3886C/nPNHUML77brRm?=
 =?us-ascii?Q?6fVEdhca/R7TI71gdsWbfzxeFdYZspOr0V4Ygo26xfYlXGMO3xd+vTcfUZcl?=
 =?us-ascii?Q?VoBaUJq53CtkxCcrc/tyrN2ckNgMDZTHiTX0yvPR388PwkAlyCDwCdMFIoK2?=
 =?us-ascii?Q?WlQ2rBpypW+JV2hliLSf2uDnEc5j+Fs0NtsK3VNWad2uJXWT/+oYD1+OKpUF?=
 =?us-ascii?Q?Msj5Y05dZqVM+lXpcrmUOHoMP3FxPH2Czw+NmXkaNGxd4Ic50mR/bLZYpJKn?=
 =?us-ascii?Q?0MKmKpArcpUI2k1cNr+sAu0GbS96fpcUEu9r90we7MfKKklpq/PynlM54tdw?=
 =?us-ascii?Q?GM7KaGLUtCBqsaXZmuXttZq0sZ3/uhI3T+qfttDDGAp+UZlI9EhLzJI2b6k3?=
 =?us-ascii?Q?tD70r1hFHJOrNu8qWBJPh6rOUKAjS9Pi+g1fIkLJyRb9zsQ/6PXu4TFrtHv3?=
 =?us-ascii?Q?FJDfWmwwtMSiMwIw1B0fLvitEhTGibOrK1+yZ8g43PaUhQMG+EPgPLVUpqB2?=
 =?us-ascii?Q?g6sfFLlcaUNZydd+HeiGSvlejdrzA+p8KqlkCb280RbVqHbEz22nQmQyiTvu?=
 =?us-ascii?Q?pFGkSV3R01g2kCuLmP92dGoy1HulD6ZBY/s/ICpxFQj4Rn/ZjDuphzszjNbK?=
 =?us-ascii?Q?/QBdsE1XAalhVoS6dYcH5GRNQnnpnC0+wypxLD74UKEwFUjFPk5yscKxcARN?=
 =?us-ascii?Q?pax2nj54mRxaesmjtLbo81oE9FucYb5m4HaG3Lb36hoxpBhUhhkrdHcN6hra?=
 =?us-ascii?Q?fFPdWp0zVJ4WyO9i8S/iRkV9mkOl8EQ06yOot++L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB4122.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18ac444-2d49-4a5a-367e-08db1991d000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 13:43:45.3371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO0Xvrcw6xUyqYOy1GD03iPPs1v73rwiQ+OFSoFLOJ3iYaqdJ1e5GY//oJlKZpYP562fKvf4XCuAgrijaJlgtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR20MB4833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 13:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177834

Mikko and Joshua,

Thanks for the guidance.  I tried using BBMASK and that wasn't working for =
me.  After a little digging I figured out that the BSP for this new board i=
s based on an old enough version of gatesgarth that it doesn't have the pat=
ch for BBMASK multiconfig support.

I've been looking at the meta-ti layer for an example of how to use distro =
overrides to set variables in recipes selectively based on the distro.  The=
 build has been getting further as I update the recipes one at a time.

I may give the BBFILES filtering by different distro variables a try.  I th=
ink I can see a way I can set DISTRO_CODENAME in each multiconfig conf file=
 that will set it up to ignore the layers I want it to ignore for each conf=
ig.  Either way, I think I'll be with the company that created the BSP on p=
ossible ways to make their BSP portable for multiconfig setups.

Thanks,
Bryan

> -----Original Message-----
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> Sent: Tuesday, February 28, 2023 2:06 AM
> To: Joshua Watt <JPEWhacker@gmail.com>
> Cc: Bryan Evenson <bevenson@melinkcorp.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] multiconfig: Build breaks parsing recipes for othe=
r
> config layer
>=20
> Hi,
>=20
> On Mon, Feb 27, 2023 at 03:03:48PM -0600, Joshua Watt wrote:
> >
> > On 2/27/23 14:35, Bryan Evenson wrote:
> > > I'm testing a new board with a BSP that is setup on the gatesgarth br=
anch.
> I've been able to build and load the demo images for this board.  I'm now
> trying to use multiconfig to build images for my old board and my new boa=
rd.
> So far the build hasn't got past parsing recipes and I'm wondering what I=
'm
> doing wrong.
> > >
> > > For my setup, I have two separate layers for the two different boards=
.
> Each layer has its own MACHINE and DISTRO definitions.  I setup the
> multiconfig files as follows:
> > >
> > > conf/local.conf:
> > > Added the following line:
> > > BBMULTICONFIG =3D "configA configB"
> > >
> > > conf/multiconfig/configA.conf: (config for old board) MACHINE =3D
> > > "machineA"
> > > TMPDIR =3D "${TOPDIR}/tmpConfigA"
> > > DISTRO =3D "distroA"
> > >
> > > conf/multiconfig/configB.conf: (config for new board) MACHINE =3D
> > > "machineB"
> > > TMPDIR =3D "${TOPDIR}/tmpConfigB"
> > > DISTRO =3D "distroB"
> > >
> > > If I try building the old image by doing:
> > > bitbake mc:configA:image-nameA
> > >
> > > I get errors while parsing the files.  It complains about a Network
> Manager bbappend in layer B that uses variables that depends on MACHINE
> being set to "machineB".  The image for configA does not use Network
> Manager.  I also tried removing the MACHINE and DISTRO settings from
> local.conf to make sure the multiconfig settings are used, but then I get=
 an
> error that MACHINE has not been set.
> > >
> > > Does layerB need something added to it so parsing ignores recipes in =
this
> layer when they aren't needed?  Or do the recipes need to change so they
> build for other machines?
> >
> > When you use multiconfig, all of you layers need to parse for all
> > configurations (although this is generally good layer practice in
> > general, not just when using multiconfig). Usually this involves
> > writing the recipes to use overrides where appropriate
> >
> >
> > Although, if you _really_ don't want to do that, the BBMASK variable
> > (https://docs.yoctoproject.org/ref-manual/variables.html#term-BBMASK)
> > can now be set per-multiconfig so you can have layerA mask out layerB
> > recipes and vice-versa.
>=20
> Another way to have distro, machine, version etc specific bbappends and
> recipes in layers is to use DISTRO, MACHINE, DISTRO_CODENAME etc
> variables in BBFILES path. Example layer.conf:
>=20
> BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
>             ${LAYERDIR}/recipes-*/*/*.bbappend \
>             ${LAYERDIR}/${DISTRO_CODENAME}-recipes-*/*/*.bb \
>             ${LAYERDIR}/${DISTRO_CODENAME}-recipes-*/*/*.bbappend \ "
>=20
> Then the layer can have kirkstone-recipes* and mickledore-recipes*
> directories for bbappends specific to those branches. This enables suppor=
ting
> multiple poky/yocto major versions from a single meta layer branch withou=
t
> having recipe version specific bbappends which cause problems when there
> are no recipes matching those versions. Same approach will work with
> DISTRO, MACHINE and other variables.
>=20
> Cheers,
>=20
> -Mikko

