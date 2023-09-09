Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C753EEB57A
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 01:32:13 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9511.1694223129358746916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 18:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AYhWALsY;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=X+PFNj2g;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1694223129;
  x=1725759129;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DtrE0OoR4PcD0OzNJptSBKydP5m+/llH6WSFqddOsyk=;
  b=AYhWALsYmHg/YZBo7av81ZY/ReNv1m/sK5vx/lEurVAod2x1v62QRtxU
   Tlrh1q78YxNvgGcbWQJoardYHvpMY9XYk4DVmGr+RAqtoV0Zn4+A7EDEy
   FkKXNierEtVVyzoUoBbAH2ZaE0SZQ6teJp41X3RjOqMi+p0DlvLOlos5h
   H5ED3ecdb9/IKinfJRBe3tGQYflqKQ+aDGEmbmc/rcfh/rr/LI7mNBSq7
   JIg871uR662d/eT9ApsOQ0cOiHef9pzMcgOt7kafWdrC6bYEh+oQrhD0V
   xOwSvF4c9e4fih5VJAMflT7ZpEWlQEtt66flce7kiQl4hOYq+EvmxqfYG
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHk8vBufRYJwYKtmYwvJ2Da0hmphJKJ4tzTYWtKUFo+g12/3tbFer+NwE9GWoFr00GUPXnF+fKTygowvdgWYqSaqAD8FJMrQd6cERQ9PcKV2jGtca/6UYZAGOrdZEpWbL4udRRVwnFohPEHBdhYUjPT2DAB/SUHm6EjRj0heThQgBSSpG5dJrxRgh/bEnavIemGIlN8+fvMOl8NLoFN0rpcKwEtjNOW2abNbNif6sWi+LDroOeEn9ikb7+VSm90tUwI7pmvOZklk3FV3mfQDVT3doimm5F+iKD526vQfIshVm0jPo0KwOq3BhE6p7JIP+cN7JrR+chtlByb9VUjwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtrE0OoR4PcD0OzNJptSBKydP5m+/llH6WSFqddOsyk=;
 b=NnUMfKqf6y9sP4GywNm10GivBdPHxByK7mjLgQnS5eYJs5l8GHcxlQabwr2uT2+MhikZHAvvqDafo6m/ZsG/OZgffqLowXyNzy3NUkoWrSjP8dJrPoO/YAgarxGT6qwbp5Zw2edgpUkfi01WfWLY3u+DKuGDpCLxyicmFt7gppbJiXoymQdW2EWin55rncOaf1SDYMEEbGG3f81+wK4FHkXA1Huoo7OzY/JtanlpNeqVpJlbSbHHN8dg8igS3eEnHKnUp48eJ/vBI0VvY26c1OFeY3K001iJ1Nh1Pv54qGa8DISKkWlr1KpOQ2a1yehtuFjp14CdU6PCykytTOj9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtrE0OoR4PcD0OzNJptSBKydP5m+/llH6WSFqddOsyk=;
 b=X+PFNj2ghgQIgqTJnXkB6YsJ3F0Dtb340QDM/sVjHpFyNRDHrFO2OvccauL94gpoSJqecrqio4E2xC8FDOWCSMJufEaJSKMNiQieMjOBeIvx01plwdXIo4YzzZPASAnB3Kl8K4MGDWDLCOG+IyVZq3XPglKXP8HxGE7GW+/VOr4=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] classes: Drop ';' delimiter from
 ROOTFS/IMAGE*COMMAND variables
Thread-Topic: [OE-core] [PATCH] classes: Drop ';' delimiter from
 ROOTFS/IMAGE*COMMAND variables
Thread-Index: AQHZ4dhF3aozKibd30SvbZSRCT0nBLARte0w
Date: Sat, 9 Sep 2023 01:32:03 +0000
Message-ID: <DB5PR02MB10213B9A33FF911CE0A3E298CEFECA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9239:EE_
x-ms-office365-filtering-correlation-id: 1bd428bd-d639-4136-05be-08dbb0d4926b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 18Nrp7xJsKG7TPVf2n+kw+ccqeGnSx5LvPSI39oo2jvIe3M4m4TeEg918c7LKY14KySOTvrHPNWhxNxkMucuy9aDcjWPWsbyixnwAkvA5Ixxn6pwffVjWzo1goMJnVQh/KpZPUVOuY4Jj2swatP0V1bm70zQPKTG4QfuTEL31kXTRYi9F6pDTqqs1ZroWPYscnvODJd1tj1RM5myOEm/GVXpxC8ulhh7bbPK5mh1jmf+SFrfh1aBPgl8CmZ3lOpR52a+oLcwlyiL1dJeQdIcx7i5eoSco/pH1z80BdRtuXqUVrbu8ZDhSw8MwUI59q9FTGNRkyIiN0B1YiECK+3Zt70BQVFSKjOjq0BBDdtx1UCR5gD2uaWmHY+yXMEZliqcnt4QRQAQ+LghjzPo2NAsc1KsiqDCjbVRuqSYnjWFdBOqiPrghQXwxJGrjiUFwY+XjU9l9/BZC3toubFiFg5sf1NCs1grYkQR97KopsziImNx7hj1qm1796hGOWIlqpdNIcmrqz5Q5A0MCdOROvlTE5mMH+JN84AA1IqLF0tk8I0jxsWcxlV7GQ4V692haI2E8ozBnNdsV8VtK6D0wtES5/RtWGak/bBphXHBoVR/bK8lC54g0knYQ2zE6hbJy+3g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(186009)(1800799009)(451199024)(55016003)(316002)(110136005)(66476007)(64756008)(41300700001)(66446008)(76116006)(66556008)(66946007)(52536014)(5660300002)(44832011)(9686003)(83380400001)(8676002)(53546011)(8936002)(26005)(478600001)(122000001)(38100700002)(38070700005)(7696005)(6506007)(71200400001)(33656002)(2906002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KZwY4m4CH/vraJeZ68bM8BapJ98ge6proh5NtUhTWr+/6PF4JGvauxzbFi7O?=
 =?us-ascii?Q?ld6t4D+AwtCR7viHwk4qPYa/xrY166jKpS6CxwiygLn7Ds/9keonTCrzfnfG?=
 =?us-ascii?Q?NEPf64MfPANNIBX2SI1TKWrw8Z5iJSW5dxzyqSEZ7OcufF9TFumWBwbmF6sT?=
 =?us-ascii?Q?Ksxyf9YexfIZzuq/lhEzf3Nunm3HHm/PVExjBlBPv4FdteOliD6QcnmkVMFK?=
 =?us-ascii?Q?qVn5jaxlnL3RO0ovA0EaY7hRy5Unz6EgeI8tPo9FQx6UieVVauUskrlKdnpy?=
 =?us-ascii?Q?9Rhtzo98cgMb1v5EePYxj5tCdvgWlyVcYIuwaugx8ZtYjBbx2tzFL2PnvEPy?=
 =?us-ascii?Q?sqN5Y2So+h0hW081Dq0nXn5iE3O4CaPUFcHbAt/9wgtwA0tgNDvhd9nrGMcE?=
 =?us-ascii?Q?6W70MaUq88S9cfwprF/jtxZnmctV8Lxl4GrBaoA22d6ymcMWIdpU1sNMjNIj?=
 =?us-ascii?Q?cXMNjgURsm/LkAOqK3IDF1ZW/Tv6QxjqGcF8iTrFWMvc9zcN+lBM3O4Kjt4j?=
 =?us-ascii?Q?f724vZui154HEb122UlL9Nm9141dSgFH2NYrdPJbBNRjKcoVJh3z+TB7ek1z?=
 =?us-ascii?Q?E0XCCky6TLcdIoXEVSWRfEE0oCfZYkJeDmgzIk/i6mZ2PL9kKxQPWsqlOFRK?=
 =?us-ascii?Q?fyQV9L97m+xx4olXshVHPV3vPRFXmtV9E2PjqjrAm8KNypv6bz+Dyve+D1r3?=
 =?us-ascii?Q?8v9Lo+WbSZDJTRnfNpdbaSYTmMsT3ogx6hcbHoh2XKYkOXtk9e7cd7mGp92l?=
 =?us-ascii?Q?zRN9Dta9w9Nol1h8S8NJQVHgiVVaKQmy8UwSyLEcpTJ17qn5QrqMVdR9WyKH?=
 =?us-ascii?Q?bbp4lpbDhX6NcpZCRp2l3Nb1youmoEZCFeysBXYxo3hda538cTVJQLphvZtz?=
 =?us-ascii?Q?Ul60c4VquOdUzWDPd7ypi+7e9Pef5lGRur8XRghZ1Wdr6GbKQ/b/v4QcLWAR?=
 =?us-ascii?Q?JHCYKsXijBn/g8rsC8hVet5+THx0qK8DhWZV+BjdCJ8h2wS26iBfqZ5mO1rQ?=
 =?us-ascii?Q?a75BjHTSOVbt6nHuW+Xuab1Io1xcm3vLeSa0QW8V5QM9lIt9ApG8vYMIbgjR?=
 =?us-ascii?Q?hKIIAoUrMj+0cfXYDt2zSO3WBHw1rqoYF3Q5NbXzFdzb4SxPYSuYxeL5YQyL?=
 =?us-ascii?Q?lTB+Ebytzjn53+aEbHfIngg+h9JPvg7EchCz6hkj9p0bHRF5TcSHLDpV80LG?=
 =?us-ascii?Q?vh6Y33S1j93nORj5mlVrCOad5tKxKAgQrA+d8EbriAr0XITq0y6RoJe8zzKa?=
 =?us-ascii?Q?jTA+2Pq4lqLBFAVJe8ynzjaD0KHwP8II+yoXbqksZp1aPPhWKRAmxq5WCoWG?=
 =?us-ascii?Q?CUSHcfincFsgl80xiVFJxPZYvqQaaYnQE1Gfvusl+D5qHCEIdqziga6fDgf3?=
 =?us-ascii?Q?RQ+iAZ1N5RQqF5R5c9nlRYJXzOZx34yKwMgP/sDFrVlXxNivbb1/FmbqBgkW?=
 =?us-ascii?Q?o8VUy0pSyAgVG/+7Cwu3mk+j2v2vNooao9k55OKCI8+f36tKdhoYmNc9jc5j?=
 =?us-ascii?Q?LSj7LtUQ/U2zIz3UoQlgql2aH7b5MEi75X/1nxRsJoP8PXQ6eva36SnILZw3?=
 =?us-ascii?Q?1MA9MUdh2KlvyGWeoBE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd428bd-d639-4136-05be-08dbb0d4926b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2023 01:32:03.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sucooJfOwk5Q2IawYCngjHelPKgAtXCEo175uLWvD4s3AqFSqnqHOiwlDElXY6XM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 01:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187443

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 8 september 2023 00:11
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] classes: Drop ';' delimiter from ROOTFS/IMAGE*=
COMMAND variables
>=20
> Originally these were shell functions but they have long since been proce=
ssed by
> bb.build.exec_func(). Since we no longer need shell syntax, we can drop t=
he ';'
> delimiters and just use a space separated string.
>=20
> This cleans up the variable and quietly removes any stray ';' that do hap=
pen to
> still make it in.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../classes-recipe/image-combined-dbg.bbclass |  2 +-
>  meta/classes-recipe/image.bbclass             |  8 ++---
>  meta/classes-recipe/license_image.bbclass     |  2 +-
>  meta/classes-recipe/overlayfs-etc.bbclass     |  2 +-
>  meta/classes-recipe/populate_sdk_base.bbclass | 13 ++++----
>  meta/classes-recipe/populate_sdk_ext.bbclass  |  4 +--
>  .../rootfs-postcommands.bbclass               | 30 +++++++++----------
>  meta/classes-recipe/rootfsdebugfiles.bbclass  |  2 +-
>  meta/classes/buildhistory.bbclass             | 26 ++++++++--------
>  meta/classes/create-spdx-2.2.bbclass          |  6 ++--
>  meta/classes/cve-check.bbclass                |  2 +-
>  meta/classes/extrausers.bbclass               |  2 +-
>  meta/classes/image-buildinfo.bbclass          |  4 +--
>  meta/lib/oe/utils.py                          | 10 +++----
>  .../images/build-appliance-image_15.0.0.bb    |  2 +-
>  .../images/core-image-tiny-initramfs.bb       |  2 +-
>  16 files changed, 58 insertions(+), 59 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image-combined-dbg.bbclass b/meta/classe=
s-recipe/image-combined-dbg.bbclass
> index dcf19685389..729313739c1 100644
> --- a/meta/classes-recipe/image-combined-dbg.bbclass
> +++ b/meta/classes-recipe/image-combined-dbg.bbclass
> @@ -4,7 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>=20
> -IMAGE_PREPROCESS_COMMAND:append =3D " combine_dbg_image; "
> +IMAGE_PREPROCESS_COMMAND:append =3D " combine_dbg_image"
>=20
>  combine_dbg_image () {
>          if [ "${IMAGE_GEN_DEBUGFS}" =3D "1" -a -e ${IMAGE_ROOTFS}-dbg ];=
 then
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
> index 21b220a28db..003fa63eb70 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -25,7 +25,7 @@ inherit ${IMGCLASSES}
>=20
>  TOOLCHAIN_TARGET_TASK +=3D "${PACKAGE_INSTALL}"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY +=3D "${PACKAGE_INSTALL_ATTEMPTONLY}"
> -POPULATE_SDK_POST_TARGET_COMMAND +=3D "rootfs_sysroot_relativelinks; "
> +POPULATE_SDK_POST_TARGET_COMMAND +=3D "rootfs_sysroot_relativelinks"
>=20
>  LICENSE ?=3D "MIT"
>  PACKAGES =3D ""
> @@ -657,8 +657,8 @@ create_merged_usr_symlinks_sdk() {
>      create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
>  }
>=20
> -ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks_rootfs; ', '',d)}"
> -POPULATE_SDK_PRE_TARGET_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
> +ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
> +POPULATE_SDK_PRE_TARGET_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
>=20
>  reproducible_final_image_task () {
>      if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" =3D "" ]; then
> @@ -678,6 +678,6 @@ systemd_preset_all () {
>      fi
>  }
>=20
> -IMAGE_PREPROCESS_COMMAND:append =3D " ${@ 'systemd_preset_all;' if bb.ut=
ils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils=
.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} re=
producible_final_image_task; "
> +IMAGE_PREPROCESS_COMMAND:append =3D " ${@ 'systemd_preset_all' if bb.uti=
ls.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.=
contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} rep=
roducible_final_image_task "
>=20
>  CVE_PRODUCT =3D ""
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
> index 8560c27e934..fc859c7c659 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -272,7 +272,7 @@ def get_deployed_files(man_file):
>              dep_files.append(os.path.basename(f))
>      return dep_files
>=20
> -ROOTFS_POSTPROCESS_COMMAND:prepend =3D "write_package_manifest; license_=
create_manifest; "
> +ROOTFS_POSTPROCESS_COMMAND:prepend =3D "write_package_manifest license_c=
reate_manifest "
>  do_rootfs[recrdeptask] +=3D "do_populate_lic"
>=20
>  python do_populate_lic_deploy() {
> diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-rec=
ipe/overlayfs-etc.bbclass
> index f8343106f3d..0c7834d01f4 100644
> --- a/meta/classes-recipe/overlayfs-etc.bbclass
> +++ b/meta/classes-recipe/overlayfs-etc.bbclass
> @@ -31,7 +31,7 @@
>  # Regardless which mode you choose, update and migration strategy of con=
figuration files under /etc
>  # overlay is out of scope of this class
>=20
> -ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"overlayfs-etc", "create_overlayfs_etc_preinit", "", d)}'
>  IMAGE_FEATURES_CONFLICTS_overlayfs-etc =3D "${@ 'package-management' if =
bb.utils.to_boolean(d.getVar('OVERLAYFS_ETC_USE_ORIG_INIT_NAME'), True) els=
e ''}"
>=20
>  OVERLAYFS_ETC_MOUNT_POINT ??=3D ""
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b23ea26d409..dfd4bb1d4d9 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -152,12 +152,12 @@ python write_host_sdk_manifest () {
>          output.write(format_pkg_list(pkgs, 'ver'))
>  }
>=20
> -POPULATE_SDK_POST_TARGET_COMMAND:append =3D " write_sdk_test_data ; "
> -POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  =3D " write_t=
arget_sdk_manifest; sdk_prune_dirs; "
> -POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " write_host=
_sdk_manifest; "
> +POPULATE_SDK_POST_TARGET_COMMAND:append =3D " write_sdk_test_data"
> +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  =3D " write_t=
arget_sdk_manifest sdk_prune_dirs"
> +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " write_host=
_sdk_manifest"
>=20
> -SDK_PACKAGING_COMMAND =3D "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGI=
NG_FUNC}' else ''}"
> -SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; check_sdk_sysroots; arch=
ive_sdk; ${SDK_PACKAGING_COMMAND} "
> +SDK_PACKAGING_COMMAND =3D "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGIN=
G_FUNC}' else ''}"
> +SDK_POSTPROCESS_COMMAND =3D "create_sdk_files check_sdk_sysroots archive=
_sdk ${SDK_PACKAGING_COMMAND}"
>=20
>  def populate_sdk_common(d):
>      from oe.sdk import populate_sdk
> @@ -372,8 +372,7 @@ do_populate_sdk[vardeps] +=3D "${@sdk_variables(d)}"
>  python () {
>      variables =3D sdk_command_variables(d)
>      for var in variables:
> -        if d.getVar(var, False):
> -            d.setVarFlag(var, 'func', '1')
> +        d.setVarFlag(var, 'vardeps', d.getVar(var))

Was this really supposed to be part of this patch? It looks unrelated.

>  }
>=20
>  do_populate_sdk[file-checksums] +=3D "${TOOLCHAIN_SHAR_REL_TMPL}:True \

//Peter

