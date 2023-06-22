Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E65EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:49:25 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7579.1687427364747163965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 02:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NN6KiYmE;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1687427365;
  x=1718963365;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=soniiYKJLZSRseelSdO1dn09Nuuk/ZVW7VXogvzYtck=;
  b=NN6KiYmEABgpv6+3hjG+I5p12tK8TVxsZzO88NfoAlA1VmuocmXsYfjK
   z5xjLmVlPDzaJsz8WFsOgCNprPlPzHVtwIvmpbkfidrSDXlrBLSu1oPLb
   cVxqvWsWhPkuQ+jf+CBwU+cyAQFP8E/cxQTXjUeE6caBo5Qeb3U6HTNn/
   FSZrNzWjpMfNMV1qkykfJHeYQZNd5kT/igMrYm0DUEoYD2iRnh47KttI+
   uqU+zJ/LhQbd7XVyNXVOInOs6yQb5f3hFSV6xN2QaFFpB0I+ITxpadTA1
   H/hk6wse+63gOd8auakN23XSQb4x7XQ/t7FAGLb3RidhJ/vHTLCqYoSJM
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0Sg+x3X4sHKxfqD5ak7X0MVBu8AgbD2soZKdN8iUvtrq3vL01h8huxHK+qUReU8i/Fiu0Fry38s5rxt4Iuyg4n3MRFb5fJ1BHECO6Q124lp6/am6zha4dh/cxagAv+VFyQZGQKcGtQj2wW2yd/Jsj1cYc5BUe5T65HM+yHBRx73XxgfBHS8sXEJTxYNsaIQ82EUA664xxxwKivp7EsvXVTOuZ1PVELhweGrsuV1z8Ve2Tmxfq96D3BEAn82M3ON2c5w5pz8MhV3F4ozYKG20ZYm0AmMJwAnbIqw/QZEjjX3cHmNGo3gYBcGrGl78edsuIpONjMmZ9oRZCz/z/gvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soniiYKJLZSRseelSdO1dn09Nuuk/ZVW7VXogvzYtck=;
 b=XRlUx4QzqwMrup+UIsTELRTn5puc3gwmeVgdJYYOMIVe0kI+veZa1GfSFjLpAXWO3/s/x5wa1rCmEqpwU1cCRnlHyf4NV2CyjkcQNE3HlytL8RdiSVo1FsRQPrtiqr5J+KX/oky+lZ2Y7sn8FVvd055Jvz156bOXq/FW6wObU4JAlNNlLaFTsAO+nw+nbUCb6bW9DmHBo8o1nmeVFuFXn0hP+Y9h99RyszgtmbzaYVStwb84B+9y3PI53feMGzcwVa2vDy3kXG/7Mk23H084PuI+KYS0pBYjQbT1E2vwfhW66gK0s8zO8LE/xDPZTwdfMt1e7wqf0/UPHgPsk/KV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soniiYKJLZSRseelSdO1dn09Nuuk/ZVW7VXogvzYtck=;
 b=Msd9IsDsBGVFldIfKuoiF3w5+fOikb3p2aiXud9ezIjGgOX5mhARgNNEZ+zaS7uYCmRN9yGnKXWWV2C69ffi+XSDbjmKtxywbT2SwmjMhW3uWZkmll9wJPkYRsMMbSiONgNLmUCb/3sNzQq7i135LSUqJG5K32hbEQQOYEHkV1Y=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson
	<Ola.x.Nilsson@axis.com>
Subject: RE: [PATCH V4 1/3] kernel-module-split: make autoload and probeconf
 distribution specific
Thread-Topic: [PATCH V4 1/3] kernel-module-split: make autoload and probeconf
 distribution specific
Thread-Index: AQHZpOZPzIZJW+NsBkenxIDpCJ9Gqq+Wjwew
Date: Thu, 22 Jun 2023 09:49:20 +0000
Message-ID: <DB5PR02MB102131AE5F3ADE6C7AEB5B197EF22A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230622084452.2026849-1-jose.quaresma@foundries.io>
In-Reply-To: <20230622084452.2026849-1-jose.quaresma@foundries.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9286:EE_
x-ms-office365-filtering-correlation-id: bcc9d125-949b-49be-c733-08db7305f3e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqPt6q334sIb2ycU+LwWBrYq9GzIP/NtFThZRAduRyNc5TmvN+QfoFvND+6b/eUtB0AhqbwlnSg3AUlH4db2NMGk3vO+EAwBGSBZ+9NPm8ujyvfriF0Rr9/JTznXrZrvxrVV0GtDXRPPdDjD1zryzX4jxBWyPirvZ+acgFbPKplrBhP7wENoqN4QJNhcfhYbg4DZiuBGoItJ5x5oBgZuXJhxSPj9kq2j7GIafi4C4Yiux7UJOtSd30uvEbqCw8zVao6NMxJ42HaiHZh6iz53e2rIt3vnqqVQTqeOxgkZGnu+ovdPah/tvMyaRxvfvAOTbzz5H2MBxCGXwQRGW/x2Kyeu1r8eYLy4xQeQGZhvQ2oXOAexrFc8hTSYH0opgZOrryjKFa53X5SsW/ZP1tL1nUdy5ZOsIaDmMTieVDnJW/ouqhA9EWmfQ8qD7buI/lAU+PkOksa80znrpD/CxgCtzyLYmofba8p9lavMPfPtBAB3BsknR7z1hrAFcEnGaXg+zwVfsvAIMY0GpLxLph3wtZD0be9goiSn3EpI3wR6207GD2t8l1bS0sE++gJdQyxvQap0++ICkxtizwIidd/HVJhT5ZgBEG+C5r0aRrpmjTI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(4326008)(186003)(122000001)(38100700002)(107886003)(86362001)(38070700005)(26005)(6506007)(53546011)(9686003)(83380400001)(33656002)(966005)(7696005)(478600001)(110136005)(55016003)(54906003)(41300700001)(5660300002)(44832011)(8936002)(8676002)(2906002)(71200400001)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n8pVFllNMa4kqfP7oQjT5u1cD+CUWjYs69US1j/KTRU7Ij2N4TtM4fM6YvH5?=
 =?us-ascii?Q?9MvEoEMphvUzJkWQW4GIRd3sO5lENu68JJ5LcOo9tE/UvkQtC3SPJqBBccAz?=
 =?us-ascii?Q?mNVJOWIuQvUPudYGenaGXlPR0jjfev6duLnHBGdsDsrj/QbucurO17T/FrM4?=
 =?us-ascii?Q?KiVIXT+mjz224pNgzxszIaOlyxlkWfDiStydbgqOeKeroWMDwfRNsW1uAmiM?=
 =?us-ascii?Q?Fvj2DQAPDhJZPeXWB3AM08qYcPps0HZwq49axpd0ncIOqcBVrt4xL3kpBomi?=
 =?us-ascii?Q?iWR7+MmChbjA8TRacOVe6QqVYuE6AszkIAxoqWBvTY4SpEMcy0gS8dOtiQZ5?=
 =?us-ascii?Q?IxhpovN2vq6Ujhxk+5PxdsgLBTQhBNC8U7cen9DCv6cG/oy2boUkyOFUBKdh?=
 =?us-ascii?Q?/dg5eKO8iqgvHEQBoDt0CL5yL09+hxaXW+/ZIOUlPT22l8IPYFnCf0N3E1vA?=
 =?us-ascii?Q?CgjyM2tRrZZf2lBznB4+k+tXpaFenE4p1awY5k+1tdG0W60DjroSaPXj1XId?=
 =?us-ascii?Q?Hp9j7JORNsHeAlkEUAtoHUn+gxerLU4H2yhBUWTnTwlCxaey8j9QzxJBywI6?=
 =?us-ascii?Q?ixbdl3EAHYeiymn/y2Ql9U48ICIcNRSOXJQEw9wHa1HBXxLyADjia+mgyUbX?=
 =?us-ascii?Q?EWIEC6bZMKMq8Zrlf7e8QOQiZFm+bkAmaW9Lht3KdXLmq7JcPKaMPSYTe6gp?=
 =?us-ascii?Q?ULOyWNGW+jFGfmWHSeEYBT70gwsDyH1nwh6QRu+j8kO8oJpBKYh/AOaSzV4f?=
 =?us-ascii?Q?cZvJDMdHlgLwawLleiI34cE5U0r96SLfeHstr9ZyRyCFU8anLEpNzkt2geMf?=
 =?us-ascii?Q?xq9icU/ShRV1ZepY4UToPmp2AFFMGSbp10jy2OULYKV1wgyc2n48aDD16xXy?=
 =?us-ascii?Q?gf5pGQFXqzIJKHlgSPBm39nf+1cLPqYbLDMY7oGKWUxG9czqpGAStMq/MF3i?=
 =?us-ascii?Q?DBWIvK0LSAcbkrtkOMJx2jAa4H6+kz0MlLBZTiil8jO3vqoykynzHqiw6YHT?=
 =?us-ascii?Q?y4uzjsDAuljkd7tPxJnS9eNXCh8HB3OyZ0G3H+fSegXHS2PvQXHP6HTZ+79h?=
 =?us-ascii?Q?FwturN54pGmTENzCEOoDKdwMqpxQ761flDpqfzmuTs2odfLu29Gh7Z0tv5DI?=
 =?us-ascii?Q?lATbDyNDDKvJBRxsSG5GYlM1yzlwvnxbgYVOl5X+hZFR4zWwhikeHHyQX7N5?=
 =?us-ascii?Q?cxe2NPbGzjKz9OZtKL82SxuybaAaz6TmBC7XYcngy+1Z0wzt4R74ZIGB05AE?=
 =?us-ascii?Q?fR/j626bjrHqwkScqKT+fjZn2FZUafHkjVBILqILZuMklQGUG9uFZVmQB7wY?=
 =?us-ascii?Q?DRB98zhTCyk8Utrz4wwhnJFTFIHw/4nbCOYZlQix7ESxeY+z85R/xYORztrn?=
 =?us-ascii?Q?J7naaWati4u8sF9B62JoQo2WHe+3CXSynDJJHiLVoBDNo5uymUw4rvEB9yha?=
 =?us-ascii?Q?XUm9aclK0/gHqVjUw04rYmNZXnBVUHxcKN1oJQkIEtIhZHHuMzK3ioCSlDIM?=
 =?us-ascii?Q?xgwj1QXfE2DiEHv2rbNvL1fIFLjekOI79njh9wZgIe2KwhtN2RbPqzzu4ljK?=
 =?us-ascii?Q?kjL5kItQ+t2NA0vGBtA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc9d125-949b-49be-c733-08db7305f3e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 09:49:20.6167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCPEEJs2Z1S83ujIu4IX3wsa23NPymjSWLzk1afsV1d+m/Gxh/lngINmJI5W628R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183234

> -----Original Message-----
> From: Jose Quaresma <quaresma.jose@gmail.com>
> Sent: den 22 juni 2023 10:45
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <jose.quaresma@foundries.io>; Ola x Nilsson <Ola.x.Nils=
son@axis.com>; Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Subject: [PATCH V4 1/3] kernel-module-split: make autoload and probeconf =
distribution specific
>=20
> Also take the oportunity to only add configuration files to FILES
> and CONFFILES when they exist and are used.
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
> v4: also remove the sysconfdir when systemd is not used as it causes
> QA Issue: linux-yocto: Files/directories were installed but not shipped i=
n
> any package
>=20
> v3: fix v2 build issue and only add configuration files to FILES
> and CONFFILES when they exist and are used.
>=20
> v2: use the same location as before on the class and define the new
> location just for systemd.
>=20
>  .../kernel-module-split.bbclass               | 38 ++++++++++---------
>  .../distro/include/init-manager-systemd.inc   |  4 ++
>  2 files changed, 24 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index 50882c31a7..1d5e39b44d 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass

[cut]

> @@ -189,8 +191,8 @@ python split_kernel_module_packages () {
>      # avoid warnings. removedirs only raises an OSError if an empty
>      # directory cannot be removed.
>      dvar =3D d.getVar('PKGD')
> -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % =
(dvar), "%s/etc" % (dvar)]:
> -        if len(os.listdir(dir)) =3D=3D 0:
> +    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar, modulesloa=
ddir), "%s%s" % (dvar, d.getVar('sysconfdir'))]:
> +        if os.path.isdir(dir) and len(os.listdir(dir)) =3D=3D 0:
>              os.rmdir(dir)
>  }
>

But if modprobedir and modulesloaddir are /usr/lib-based, why should this c=
ode=20
try to remove /etc? Don't you really want something corresponding to:

rmdir -p --ignore-fail-on-non-empty ${PKGD}${modprobedir} ${PKGD}${modulesl=
oaddir}

e.g.:

    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar, modulesloaddi=
r)]:
        while dir !=3D "/" and os.path.isdir(dir) and len(os.listdir(dir)) =
=3D=3D 0:
            os.rmdir(dir)
            dir =3D os.path.dirname(dir)

//Peter


