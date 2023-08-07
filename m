Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B54C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 20:21:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.45615.1691439703099172290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 13:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NSkZOdCc;
 dkim=pass header.i=@axis365.onmicrosoft.com header.s=selector2-axis365-onmicrosoft-com header.b=xxd9T5fr;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1691439704;
  x=1722975704;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IGk2sPQg+ZXJ/Yp8J7KVbtZkX02HcDwXGmhfs3eVPTA=;
  b=NSkZOdCcMNKLcHbW1QsSqTi2kXmY6gJFMtFh6IfDSYjzKAH+J0kK/YTL
   UntmScvSXeRQ50o2cN6H4SIQhSmZy8aU1DAJ2Nf9zDnS0nerPkYQl4pXM
   lmcod3LYlsgSW4N8bjLPzWsaZIdRwmELAllKske/8V8UyIyFwO2w/9zTJ
   IoN7NhS6cBjpZY+74n5O5qzwGJFc2C4nUpJ0KgPek22q/q0RUOmwh8zbU
   yybtPwIO0XK779Wv2P3wgTXERxlSogyDJCwZD3n2nTgZrC96KOdpILSeK
   KABH+x5NeElq13GVhXSMWESIu2sG0i0rNoEg96WNK4/1l5k+goT7/0+Oh
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws4zGuGuZ5NIG/jnUlqkwjAZC3B5m1HUzb0V10F6KKUUfL94h8DSb+MrD72hadLaRK54pFydL1UAGYvtquo0XGIpFpfPlxIvzd7CGgQWWrr2Pvo6HEu3Vf/XgqWG4c8Nx2+znnOmVU/Ae0gW0m6o9lVvUGhB7EiubGoZJE8f8kTb/LUEuVnIP5JxM8DL+1XJ+u2TghtsNhFH22gAsQ84ZTEAq0GkNWFYwnYflwNxvXsvAAtq7cIWVU4L3580t92JIdwabgZi/bAQ0j+YEJr9waFF8zHNJuar/A/C2FOK2mdUaI1sBFI4knpEyuXrehWqWFNM9Cn6j8k3Npg0Kuw0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGk2sPQg+ZXJ/Yp8J7KVbtZkX02HcDwXGmhfs3eVPTA=;
 b=RaorSEbzgeXf/Fi+XmMbkM4lriKs7ZApwCs60v51tYst5zBwX1PyaOhIssFV1wMzEoeBvE7GDv0uBut2gF48RuabvsD5RkWzGcnYNSJJoEzzrv5QSppzMZuWiPuaxsb2JCQ44kX1qXa3UEDO9DyOz3BqfpVbv5RepCB+LbKcom6hV63wopwK4/pcxWdHZN5UNj1KKwmVjcXgTwshAqvxIw/oT6BIUHkiTmsCS+HNy1cy1nFUJlt74gLGRyJCh9HS8ir6rhcOXy4t8FlQSWMt1ZxlApWfrmwSWCHQKMZxE34hxfYxGD7FavWVus5fyfEkyESmet/tQoMVaCPXDg0TZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGk2sPQg+ZXJ/Yp8J7KVbtZkX02HcDwXGmhfs3eVPTA=;
 b=xxd9T5fresprFqWNgYxHzyw9PKMvjEN6PU62k5btOxBbqzAKZykjI3gvm78ofyxXfvCbGUKX3yuBYvGFsZpgw6jBYTxnr6B0m01e67T4Fe0r768DpdJNpjtOO1TyTcJErOcF8QFZp8dUxIsYi3EZ28DXmlc/l08bqVmWrDV6j3Q=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file copy
 and cleanup
Thread-Topic: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file copy
 and cleanup
Thread-Index: AQHZuvPU9+55sLrChUC1vuTr7ZXBmq/fX+nw
Date: Mon, 7 Aug 2023 20:21:37 +0000
Message-ID: <DB5PR02MB10213CFC8D205771414A08CE4EF0CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230720102014.11236-1-alex.kiernan@gmail.com>
In-Reply-To: <20230720102014.11236-1-alex.kiernan@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9913:EE_
x-ms-office365-filtering-correlation-id: 43204e3d-cbf9-4403-80c6-08db9783e73c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3t4W7nDM9vEaBXEtaHI5HdmEpwRBtcDJLGaI/7xgov1zDcqVZQwOZvYkTUSbWSod45/PUnreDGx/vnhoqHzEKCcbbzeRdyb8mE0TxCJFD05le2r+6rXZbF25B3+/Ha1WO52GzQYGTdARcy5iWBdbfl3VLnXpBoOGrqD7enpG2xcNXVdq6nIvpH3CTEZnzVVo+yQKzlqgiTJGAsjtSKeFmHjQaMDVp4DM6G19SSGhoh/7MGxsqATt8jOVrms+xPLjFrSmJ8rDTYKzBnQYWti4ShBAdq3D4Mbcu8/sGbQERzwGnhXy7TkEmRYlEEfvM+Loq62hI2Td7hkWd3uVupStllArowNgQXkTJ+wriTWBRZVxHIL35xxLp1RhPfnc4XcPJPEzret0YOxny/b7VmvKeX5Ak/yQs8Tp4mdslZWd1JtI0kvqrBeQ5P/0gL0bUx3aZnnbRKe9C/QsysRF9SNttg4aSwgKVpyY9lhBoaO1cxgu8Ij6KmZGY2aVSK+ylLbtMngtZ7ryGxmHC9eUjGIbOPVhGhx7dzZJbWwMSO72mvAdly97pHKrgn5Y+Fb3//DRPRGOoP9q5HUHjCRHxw+UqA2ZwLpvSGL6TbmB5dr0y8dL+dPBrBnmJOtX8ji/DzoL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(44832011)(41300700001)(52536014)(53546011)(478600001)(6506007)(8936002)(8676002)(26005)(7696005)(5660300002)(83380400001)(2906002)(110136005)(71200400001)(38070700005)(55016003)(38100700002)(316002)(66446008)(122000001)(66476007)(64756008)(66556008)(66946007)(76116006)(9686003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JkE5nsObOBZJbMrOCIcEnRQTi31Q7cdP/Nanhod7ZkTWXtkfmi4m6YUtV2Xf?=
 =?us-ascii?Q?tDaXC4RaqPTvx15O1XpqRP/bYi2JR3xe6lsNYspkMhq9edtWvcnR9O79IA+w?=
 =?us-ascii?Q?1XU87KKlfyQR9BBbxWOrRB6Kvfx3MUEzegv6WC5pjzxyl38ar4l5UiFY1GJV?=
 =?us-ascii?Q?4FD7yuyMqLVr8iA5xNW0ipxhdi+7It0dhmXLACn4i1pR/FwNcZcxZmYJZBHW?=
 =?us-ascii?Q?7RpwiN04pKWbBw/PRYamTdRNvuJpnuuELBv/PDVSPlp5a34zS6lZX+xrniBR?=
 =?us-ascii?Q?0M/k2FCy3GSmpdD41521XJUo+CTKK6aJSFt93LQBkVrLWJ5pvKnkTddsxAZr?=
 =?us-ascii?Q?U4txceYpGlkrPH1+YSQPLzONbti6IwLujdveG3Ds8V0eoely+ulUxhTF4fkk?=
 =?us-ascii?Q?EzAD+5rn/bNddDN52Z2y1e57AilFxdO4/sEyHjMxhg8RodczpFevQdzo2vuF?=
 =?us-ascii?Q?zzalI1XUu4KNEXOkqommvTAPVHELcy44U+WHbgrixB4z8vcFSMest+bRYCI4?=
 =?us-ascii?Q?lxx6ZlG7ciqQNjNSd3fAKPf/7HUtDQm1zExQqBlvUht50u+GzZC+D4soSAVu?=
 =?us-ascii?Q?T+bIXUrfkfGZG88FzubuEk28Zelv0QzKmm3+nYcWV3xuK0l2iZh6PD8s8PUG?=
 =?us-ascii?Q?cP4DBIIkzrS2oKwifLsnvHIu/Xj3HkxZSV36EbuvHKN/HJgcSETvJHCxtTPP?=
 =?us-ascii?Q?bLAOjJC9l80OALtJO9nXoZiHFG4iyzCn5FCQ8XPwtN3PigX/5mPrqCFDOrmK?=
 =?us-ascii?Q?tfJT8t6o/63wbVVe3MnHGRl8Ak/GYYy44bKR2AFtDWy0kdwhibz72KMO3bZk?=
 =?us-ascii?Q?VF+OZZkcw17fqCNEi1N+9umPiUGpGb1+U8X2bJxSu6mPRWbXryK0DgkpudoP?=
 =?us-ascii?Q?dIAfNzW30lUz4BXSEyTgTzLnT5hhEtTu+EoESjPT+3AaXp8vjqnQN0BNGQxx?=
 =?us-ascii?Q?0H5HpNTDr82sWy8gnQz+4fvKGJ1inhDNHXKS9kcIeTm/Fd3HWg1ynA4bdLXl?=
 =?us-ascii?Q?pzx8GLokMuTuUiJGqyyY0vLIs9kGhPBn9iaXjDDW1eNUUAnYXBS/gIpWScz/?=
 =?us-ascii?Q?poxMMNPxpMHW1F0OYGCG2WZYSlC85dyw8EwkZmDl/WAfqkpd00bLFgU1rxUx?=
 =?us-ascii?Q?HdeuntQ1dSDChogrIm40jJxDO/mdCnEUUlyFN3IJ5i+ze/u3bSozyqX48Rj9?=
 =?us-ascii?Q?ogdPbXVrKd8Lxdx+sntlctlp1MsBqQ/RslBa4B//2RY32LFmTxmyE/RWyAkw?=
 =?us-ascii?Q?ekODNHnQtAn39RyS7VZP2xCxNKTANxIYe7G5MME+KdW/C2mQJLf5J3fUVXtZ?=
 =?us-ascii?Q?4Y6bv73LefBlUPCCTMYeuToDL6KwUt968glzG+eWm/Cvyb9CCxrIebh82feN?=
 =?us-ascii?Q?Xaf0H8UTmNXq/PgNutz6AH67nGzamdGz2AlIpD1nvIuHzlu+LIrhyZ5zIoMm?=
 =?us-ascii?Q?sDtVnzucSMmGN56tAdYJZYLlQVBlXY75EXtKxqLoVMIZBItqLIg+9IJi/7dD?=
 =?us-ascii?Q?e2m8Xz6vB1mW1E0/hmil6rEqQ8pI/Wz62QbI2kG3IsaOwHZNdr/VpwbtMsHt?=
 =?us-ascii?Q?4sI1HiWlkAy71MMIxNk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43204e3d-cbf9-4403-80c6-08db9783e73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 20:21:37.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mO1GW/hIantxoQUrDvSoyZaLptCyJZmiQr/lvBLGbl1Z1oy2ot+TaTab5VVP5QU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185623

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alex Kiernan
> Sent: den 20 juli 2023 12:20
> To: openembedded-core@lists.openembedded.org
> Cc: Alex Kiernan <alex.kiernan@gmail.com>
> Subject: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file copy=
 and cleanup
>=20
> When copying the package database files for the debugfs, add individual
> file copy as well as tree copying. After the debug rootfs has been
> created, cleanup the package files.
>=20
> This then allows us to avoid a problem where (for rpm at least)
> extraneous files in the debug rootfs would cause failures during
> oe-selftest because some files existed in both regular and debugfs
> images.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
> Changes in v2:
> - New in v2
>=20
>  meta/lib/oe/rootfs.py | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 890ba5f03984..1a48ed10b3f6 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -106,7 +106,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>      def _cleanup(self):
>          pass
>=20
> -    def _setup_dbg_rootfs(self, dirs):
> +    def _setup_dbg_rootfs(self, package_paths):
>          gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
>          if gen_debugfs !=3D '1':
>             return
> @@ -122,11 +122,12 @@ class Rootfs(object, metaclass=3DABCMeta):
>          bb.utils.mkdirhier(self.image_rootfs)
>=20
>          bb.note("  Copying back package database...")
> -        for dir in dirs:
> -            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
> -                continue
> -            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
> -            shutil.copytree(self.image_rootfs + '-orig' + dir, self.imag=
e_rootfs + dir, symlinks=3DTrue)
> +        for path in package_paths:
> +            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path)=
)
> +            if os.path.isdir(self.image_rootfs + '-orig' + path):
> +                shutil.copytree(self.image_rootfs + '-orig' + path, self=
.image_rootfs + path, symlinks=3DTrue)
> +            elif os.path.isfile(self.image_rootfs + '-orig' + path):
> +                shutil.copyfile(self.image_rootfs + '-orig' + path, self=
.image_rootfs + path)
>=20
>          # Copy files located in /usr/lib/debug or /usr/src/debug
>          for dir in ["/usr/lib/debug", "/usr/src/debug"]:
> @@ -162,6 +163,13 @@ class Rootfs(object, metaclass=3DABCMeta):
>              bb.note("  Install extra debug packages...")
>              self.pm.install(extra_debug_pkgs.split(), True)
>=20
> +        bb.note("  Removing package database...")
> +        for path in package_paths:
> +            if os.path.isdir(self.image_rootfs + path):
> +                shutil.rmtree(self.image_rootfs + path)
> +            elif os.path.isfile(self.image_rootfs + path):
> +                os.remove(self.image_rootfs + path)

What's the reason to do it like this rather than calling
self.pm.remove_packaging_data()?

I also just noticed that we apparently have a local change that does the=20
above, but where we also do:

     # Remove /etc as it may clash with rootfs.  Also saves some space.
     bb.utils.remove(oe.path.join(self.image_rootfs, 'etc'), True)

I do not know if that would be appropriate to do here as well?

> +
>          bb.note("  Rename debug rootfs...")
>          try:
>              shutil.rmtree(self.image_rootfs + '-dbg')
> --
> 2.39.0

//Peter


