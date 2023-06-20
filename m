Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330DFEB64D9
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 01:13:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.710.1687223619614164912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 18:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gmdElJqC;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1687223620;
  x=1718759620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iJmvRz34oHs0FNdsZLvu5hZ9msaPIGh1iOEEtvQOWC4=;
  b=gmdElJqCPJi+oUk3BSuWOV/MmI1Fc3yPRGv9+YGaFgp4kYLKTP5vo33+
   VK1npDUL4oZ+DPcmwZClXi2fzNOM1Dldpnwtinu1lZExMye9DhY10p2C5
   Rj46tvfBTuyPMELusfpCfQBIuzXBldi966xE2ucUSWWvoiknce+6wcpd2
   elUILFTLf6hlrSvoh9aOXGqN/PMqENq+Tk9aSF4uEUrri0DdZSGAfZFZj
   s68EBqTf7Yy3zlNK/vUkhbmvLNH6Xaq6nxsW9xCgjeGYvEhFUTZ+T1/Gb
   8OVwg0YG+Zc2p7jyrF627EJ107FNqwEL6/wwXNSRTyxWdzyJgQcwc8Qw6
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM0ITIa0mAC6f8G3c4D/p2emsMqwntzhEr3bgZfg2JDzqFAiP0MbQk7iZEZ+Re2UCRUWIMTZAOoLC9QT8MKqjAL4awNgwx/opOoUvhj21MLegVsWLQHHCcpovWuTKFwuainrAX04DVBEpgf3PN6118Ast4qjYuAoIZs/I9MX9G97ylef3hx/n8FVbuwXb9+AzzXDN5hS3D+cxq7Yw5HCB26GBPgZD2ueYw001LDKtYudpBRAYY9WpD9Bg/DTvxky1KosIhEHAjfPe4+TG1OYO14E+y/WhEVa+PzCuEILk/nFAPtVZ/Jq4um9EDX1t/u3kh0JAUVFUepcbO4d0xXT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJmvRz34oHs0FNdsZLvu5hZ9msaPIGh1iOEEtvQOWC4=;
 b=bIiWYy3tXmgac2VhOODRpwTAmgDi1k0AL0MJY8+9X/CfwSpQP9SLOcQajEHUCARU2j9PtoXGDU+Vq99t3vSwKPWXPWcWHQxaMV/oPLXLnyClaUB+mx9l00LBksHvxX3Epn+rz94RTniBuNAcXfT29WbYM/nCITVc1t1qSUciAfjVWHoul1MHVyAvsBtBX0mWpVUnjiarX/vqtGnmqbr34CV6o8BgynvR8Ph21+PYAu9OBTWqxWOBukyplw67Pv3viFjH5ausTT+ApGkcAj3gkBaB0/6oS+WLQ7nrbECpLwqaWwFNlEFT8IlLyxWx2Zu0v+c/Ivm0W9yC3giX4TY2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJmvRz34oHs0FNdsZLvu5hZ9msaPIGh1iOEEtvQOWC4=;
 b=KRBS+iQ6LpShv4jmFVjIFKi4HPDwb41qhwAKfcBL2cUr9XwJ+LJvy7XArJukGV5OyPCuMD8gAnUQj1f9F4ciXx0Us0Rt6N/cf3I7betb3vO4LgWtgQYcsqE2k43WEHKUrIC4z+KrImrUEAn8MITX5iNFlbUf+/tFuHW3pYO8BFs=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson
	<Ola.x.Nilsson@axis.com>
Subject: RE: [PATCH V2 1/2] kernel-module-split: make autoload and probeconf
 distribution specific
Thread-Topic: [PATCH V2 1/2] kernel-module-split: make autoload and probeconf
 distribution specific
Thread-Index: AQHZowRWrvhGy3pnWku4b6YL9n9GQK+S4KpA
Date: Tue, 20 Jun 2023 01:13:36 +0000
Message-ID: <DB5PR02MB102130E7D2E6989CCDB663FCAEF5CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230619231343.1683736-1-jose.quaresma@foundries.io>
In-Reply-To: <20230619231343.1683736-1-jose.quaresma@foundries.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB5PR02MB10189:EE_
x-ms-office365-filtering-correlation-id: 9c891fca-5cb9-41d3-29db-08db712b92db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zGagA424hGSRGe50nS7v3labeGnxT71eRUnjwOQxB4G8JOKipobjaBy5LYNdhXxeQAcLOGQrdVKmRR6Qy+1ErxRpDODJ6OqURALVm2WEw1ouXpvSjXjShMHZQuXEB4rPfu6hb5Eh2ffJKkmJxzBT9TRz1KElgwJ9afaiF1FPDTxqrCn6x6aoOQVtHa1EiRIDPtRDYJl8BnDvgYoQImuLg6/NCx18vgw9jAjfP4nbYGkwe6jp78HaSidbfovkvpAR8m87hQaQZmmYuEl9Jq7zWbzI4mOWBX5/xr8UNFAH7S5kJvMumUVI1fbGiO8doyCBFcDfCa9kb6/fP/qV/qcVD6E05zbC+KTIjSAzDVQKsbx+MGeheDbLw1xh8Us+NSFUxxA3pY3nMJh/gzYM4uaciX+8AdE7DcIwTUh3jEznl+YNYgrlM/0AifiY/6KsMi3vXksTI+w1RMLHUAQIcJVI6c3GqksyIjQ6Aj6i5MGsQFBFHho6Tuoq3oVAHi68NAkYq+ifHTE3soR71gWNLpk1jnKW0GO6u4fQpAr3vLnQO4TpYi1S/FrejXV2Itklgw7i5KMIkUxQA8E/yow/TMjrmdryoZkHdfUrUyKy2SEvY4Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(451199021)(53546011)(66946007)(8936002)(8676002)(76116006)(66446008)(66476007)(66556008)(64756008)(107886003)(38070700005)(52536014)(26005)(186003)(6506007)(9686003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(44832011)(316002)(54906003)(966005)(7696005)(55016003)(478600001)(2906002)(33656002)(122000001)(71200400001)(86362001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ADayJ5O7PbrkqBOUdEwRcd7gf9MLKNoa8stY5D0bzH8/AX2s5/f84nYXb69l?=
 =?us-ascii?Q?85z4yEXP1MVdL0dpM9fPY9BcSP6DIdjVGcIcTz7aTWFKfa2MQs5Qci2dsxwL?=
 =?us-ascii?Q?tYqYZhLgTqBA21GRVT3yWFXUITjcPtwl5/ETLpCt2cANCva85CpjJNOAFQyB?=
 =?us-ascii?Q?qrLQzXK1FeEL5Sp79CfcjQHqvFF94QGyjf+XXV7nrnte3P5jgP7OY8t9OFPp?=
 =?us-ascii?Q?l7iOahRFRpeSoSGg3OfVEzfSuTvQx6KEnZZml9RgDQf99D5L/r5bMPyg0EvN?=
 =?us-ascii?Q?h5gbEP6E7wcPj2pHXvKL7I53PDmt7B77Lh727bUdW7khcYLn1IDGj5VehnXy?=
 =?us-ascii?Q?D8kpIEVb1Zj4N5hZ2OmEa+HEQaKXYj5o5LC3lCOuAF/7uFRBdppcWFf5dVc1?=
 =?us-ascii?Q?QWXDSsv8k8nDsiOOmPYIVAsK+esddDmWu3iYX7ojETmO/WtHd/YNh+enn1kU?=
 =?us-ascii?Q?HNDmdcASTwNNLvZhjAFKxgNWEANGUy4b1TYJsQwKZF4JCYWJbQwoXLxCC4AT?=
 =?us-ascii?Q?JlBXFLVPH2ufK2jKU/djqMJJHu6+VmtOJVeM17KVKcg/xeqmU5E6Nei6Z9Pl?=
 =?us-ascii?Q?M3zrBbtFOUlf5lNj9JV1dWMrZ8F7OdAohwV4fdwfoBp6+kv7lek0/LV1C09A?=
 =?us-ascii?Q?tglgM01prfMK4eBPd+uyw7cSFngn+3A61wzcfuKHCGoBfhdAgHpj0/W61wpF?=
 =?us-ascii?Q?ExmF4/QHY/ix9rb+270vSJRsPhVWB2zHZRb1JvseBkEp8xeO27WGYo66zs8+?=
 =?us-ascii?Q?/SxPXKTYL/hQYb/QjHe5iz+Dqze6Txc7tQZhcVbrEOgErDk53S108I6qISju?=
 =?us-ascii?Q?W0r95nmQ23ERYoPknFXrdKUvobcLjpzTeQ8Upp/GXQYzqoMtHX8+BtP9H0z7?=
 =?us-ascii?Q?hNLgB/dnsJyo9r04vIkqtoZt+ItDVED5DxjDID7gc/E14A0z2OF5AxQofLLA?=
 =?us-ascii?Q?0oqJUurDtXtZTqKcpoUi12FTPOw1FbRisEmxilITkH3bc9Ec1KIFk5pDo8xG?=
 =?us-ascii?Q?Xc0NLhfCbIfuvOtbJDsCld8S31Vr87NPnh429GbEfLZJg9J6TGXXczG4Qxc3?=
 =?us-ascii?Q?R9tY5crZQRC49mQVjJfMjJoup+ICJvxSVpzgI3Mlb292ylC68GfSQY+ENeJo?=
 =?us-ascii?Q?FuUhSatcfFnQW9abGJWWd2FNQFLINL5kvBiF2O28Yp10zL+Y2yXB/ryYVvkH?=
 =?us-ascii?Q?hIx8+rK+0hj/q/hKgNuJM+E3s0kq1VZ3VSP72G4tbUZCvMiD4Et3Dj2B3a/p?=
 =?us-ascii?Q?T9mUSHkKDBqrdfPVlBv+0tGNhfOqHLYe3kpcntO6oChWLc4JS1mBWUN2MQgg?=
 =?us-ascii?Q?U5nn/4UxvIJW/ZboEZrvAmDjfJVR/iUHWYJOIrPuebrC/tB2kBorSwt6fdM7?=
 =?us-ascii?Q?/+x4daEEkoR12HcpVsTdT6lvyCt7PP/pe4H5tWN31z87I7QpD8WnDBKixVVw?=
 =?us-ascii?Q?XHxAm1fseMPiElnx3NeBmUssLk/XbIfF1i7wydhuk3kledT7Hm6Osjb3QEYq?=
 =?us-ascii?Q?1F0ZNHUZG77CDnAbdWPiZHfuZZlxRnDhWk21lB3P+njCAjoWiz6O+DUd/ay5?=
 =?us-ascii?Q?2N/mfKaapVE4c1aWrmc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c891fca-5cb9-41d3-29db-08db712b92db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 01:13:36.4349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94F6cR7TJHShFCoGHr5Pv21RH2jKNQzA/ReBGh9mFvlCwiiJ5iYeWFmVb1JeNr4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 01:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183127

> -----Original Message-----
> From: Jose Quaresma <quaresma.jose@gmail.com>
> Sent: den 20 juni 2023 01:14
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <jose.quaresma@foundries.io>; Ola x Nilsson <Ola.x.Nils=
son@axis.com>; Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Subject: [PATCH V2 1/2] kernel-module-split: make autoload and probeconf =
distribution specific
>=20
> The modules-load.d [1] - Configure kernel modules to load at boot
> should install their configuration files in /usr/lib/modules-load.d.
>=20
> The modprobe.d [2] - Configuration directory for modprobe
> should install their configuration files in /lib/modprobe.d
>=20
> [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
>=20
> [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212
>=20
> CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>=20
> V2: use the same location as before on the class and define the new
> location just for systemd.
>=20
>  .../kernel-module-split.bbclass               | 30 +++++++++----------
>  .../distro/include/init-manager-systemd.inc   |  4 +++
>  2 files changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index 50882c31a7..ee14bb6910 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass

[cut]

> @@ -169,8 +168,7 @@ python split_kernel_module_packages () {
>      postrm =3D d.getVar('pkg_postrm:modules')
>=20
>      if splitmods !=3D '1':
> -        etcdir =3D d.getVar('sysconfdir')
> -        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.=
d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> +        d.appendVar('FILES:' + metapkg, '%s/ %s/ %s/modules/' % (modules=
loaddir, modprobedir, d.getVar("nonarch_base_libdir")))

There is no need for the trailing slashes in FILES:${PN}, so the above=20
can be simplified to:=20

        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' % (modulesloaddi=
r, modprobedir, d.getVar("nonarch_base_libdir")))

Not sure that warrants a new patch though.

>          d.appendVar('pkg_postinst:%s' % metapkg, postinst)
>          d.prependVar('pkg_postrm:%s' % metapkg, postrm);
>          return

Reviewed-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

//Peter


