Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85984CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7271.1780663092084687176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 05:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PKBPFbza;
 spf=pass (domain: siemens.com, ip: 40.107.162.17, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEpoWTD7Lq4MUV2EsWeiECNUMXknYen3U4E/MWHsBChLQ2IrNXvNcRMt+pOQit0YRT9JXhv15Oah/i1lZRzGHVMqrtLzcCTwjEFEmOspw4lJmU1NKN+RQL0wjSY4L6lPuLIyn1/ht8rhRoDZHU9+loBWVDY/VueKdcbxrRBz+h5j8rKUjIDDQWa24BuWcrelN5/f+u7JE01rqSBMga5H/T2p2BcF4iRIQla0h/MiTOzzDMwyZDDEP7P+NzKbXxlp2uEiUTZy7sYIyy8Zru+2mEzQSGzqu+yYanfLZIPXOuqabbf5HzlGBMMnEvzOmn1BI6OeHUug4bDSFIp/KBx2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wulbYM0TNmFAPywXmaMXS80KoyQvS2ow61sDd+/rpQ=;
 b=e+ZsNOdOHxWLvwgr/nn3HnUTF6Gdczt1F9YvseJee19h7at/GpoyJBV2acTGOAxAlWecobDTmQ8tnLrKbJbc9Sx1/35g6jTlmpWhBj4v1WFvEvyxeD9L+hLdMesx5fINefpAoxy6Zo5gDrr4aGE4BTNkcxNGoha/TX7DNg+y0QjdKuq8IapmlJB2uXkMxtApXtSUIxsHXiE1e+DdXKZz6dehxZTSVAZSun5Ruw1yh4pPL8e9yansIw9pAaaWY+g4G5/MdsIytwYohQXLeWXWFzQukKetyUqG/Q0tLwtG3h0hIClmpHKFEVu5/nAQ/KnN1qXzTm3lmIiBD1ZcTqK8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wulbYM0TNmFAPywXmaMXS80KoyQvS2ow61sDd+/rpQ=;
 b=PKBPFbzanBpVQnVMGiAiVy86UNzMFd436s1ejr7TS5Rx8W6YEldxFFj7ZYuMuqq34RLvnWf1Rs/NTscbnlK+/Cs2dIpOk9bEDR6mGL19Cuf1i7AICPn0W9IODHdnhOkm71GHl8Cnk7xjhopHp2NB2WrFr3pTBU7uVk0D3vWfN8LwltPw9AIsex1suDR2fu/R8gYf4FWlmHG4fBiVaz5rTC4cUT+o1E99cS1+t0edjfixMIlMEN+l2/20mowDadQo0tFkYWhx3u+iD5Oj282Hwj1FYNHwbcsySYX7kp5SOz2g9v72VmTGRoTij7qgb8TXcOZt7QxbWQcFcxXPvB3IFw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by GVXPR10MB9481.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:323::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 12:38:07 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%5]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 12:38:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Joshua Watt
	<jpewhacker@gmail.com>
Subject: RE: [PATCH 2/2] rootfs,spdx: handle removed packages
Thread-Topic: [PATCH 2/2] rootfs,spdx: handle removed packages
Thread-Index: AQHc9OOYXROQ1FUQf0qI3FKxvBWQ/LYv5kqg
Date: Fri, 5 Jun 2026 12:38:07 +0000
Message-ID: 
 <AS8PR10MB50737F2C85389E9530519553FD112@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260605120456.130264-1-peter.marko@siemens.com>
 <20260605120456.130264-2-peter.marko@siemens.com>
In-Reply-To: <20260605120456.130264-2-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d8febe55-9771-4173-85de-99a4eff336b3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-05T12:37:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|GVXPR10MB9481:EE_
x-ms-office365-filtering-correlation-id: d0c1f67b-2287-4b35-276c-08dec2ff4bbf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|55112099003|6133799003|56012099006|11063799006|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info: 
 iHZyhd0UqbjK5djw406ixXKl4TmIcWiHGk9L+YYEgldryA1HHq/I7w4r7I9eFEqmGdxL8Com5vHJZGApEQFt2eFdW8hb4qvjIDnkTFZgxBPHqbJ0FtgXcxv7Ou9wt5kelb1D+vtdUSwvMMRqR7ivDe16pjpL36VvJc6bg3do/tZ5MOsl4jXSY3r3mHnkLHsOIsYFXMnK62oi6T/5ddX0jBwBItsEyxJ/B96/EorXrenq3KXPY2IR83IOdTo8Txsaz+O6sSZ5pGW/nYEvxt15GefT/W9uiovFdlRyNaC/j8s+6oC7phuvpHeY3OcaEGkMECxDOKV+9iXeQKVbVb76Ek9BZT2sf7OL4MJeoyMlLBiZj3/ELmAfGtPzr5+s2KBhUayBMSU80Ch43VkwXoyzbBRI66CSH1dU3oaHEJBMGyuX2CSjSyX3HZ9j0+ApOY7rsjU0lKj69bK6D+i7cdyzLqkNqkNS1HBT/UiBAZ4tb/UFKEpAC2WP9rQgSXDD1Y5HDl5Pr325h/tt9f9rsoDpGHINdpXNg58nW1pX3YLODVbV1+HGrJDlM5vCEAUKGtyNOf3RNC2AGFvkz6IjWgkQA0BXyXetmYsI9AeSVdw+kpCaq0QYsufVcwOeJb4lHz81X0YW/SE9ZxLHQ/Hmf31QrOns51yluFSRq3dbmDC+6BoFFof8jzr9IG8ka9RcjeTz7j9oKM9spZFAqxcyLPGqVrWP3G5mBy002WRGMIJvqx2IVvxKNKbhSW1g2nQh7fmG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(55112099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tzAJvJsN58Fwh/EZaNTRTrETwcYc5HtFaDORNpCXu2PMXr+CsooyzSIVBIP5?=
 =?us-ascii?Q?O1yoOws13FvHsVzHDBg2D21Nf1n4FiY+X0g6Ax5P+SzAfHeBolpnAb8mhkvg?=
 =?us-ascii?Q?fWiEbadv6ZVQoCFpM4dcOqSOMKGx30bskVv9kXnjPt2efYlgKusS7zXgt5VO?=
 =?us-ascii?Q?tsbOIgJdHep5bsU60UfLtS+mQzLlJ2ps646q2WD2eJbjzoifvwCUUE3sUHGH?=
 =?us-ascii?Q?hoXrN5fOJN6UkiC8jWdJ7vRfnDOZ9G0Np+Okp4y2A/1CJRXaHnmevCCnaQCY?=
 =?us-ascii?Q?72hqZcmeKu/p1iJLCKmTefaz5MJWW7Agh0e+GPvUSgCdtXaZ/eP6zMfKwQ8n?=
 =?us-ascii?Q?0zkYcLevsh82+3wt7UVQbdRurkZl6c3HxDZjEK7QaFeDGMYBXMaVEI/kfZA3?=
 =?us-ascii?Q?xH88BffgRjgnjygp0UfzXCGCtRJk7QYMi+WVwhChhHx1ni8sXXhnKUTT0n0O?=
 =?us-ascii?Q?B9e8kH81O05m4HeslDbAxh89HExCdHF5o6CyZl+BEa8F3sxzDV5Dr0u7PuPc?=
 =?us-ascii?Q?TLulBC+LbLxqBgTYQdquCTuIqofNE5c+nty9jlfUJsVAILS0DaoNdLKaRawG?=
 =?us-ascii?Q?PeVwez2szc8W7QJqegp6WyHSzyp9bwdlxDR68zNPasktpOkFiMRecbV7axd0?=
 =?us-ascii?Q?Mkrnd8XbYwvNzZwhbqbzUrAc9Yzd1KpVOHYOIoePqKjpnx1ug9tOOZoqDPlE?=
 =?us-ascii?Q?FuiuBxeqlopBwLdx/2sMFW1hrcGzpDfBTnm76rQrbePTmWd7U/nZn+yte1ry?=
 =?us-ascii?Q?ybeok44wz8BjkXi2E4PBJm8xx10axvk6xJHLW0rBNFwabNdwDoVnIYr+mNbR?=
 =?us-ascii?Q?JJ3sS1OUbWsAZS70vEcOBoWAL8mhwgTEF1e7Lq0pnkfgnjkVQ2PTCnAunydA?=
 =?us-ascii?Q?99vaJKmtYAesW3WlysuIoEakpEJvEDOu8Yqcf7jyv2Ncg98n9YL+FHTB6W6q?=
 =?us-ascii?Q?Khj2vmnQB3TNyiJpZ6J6iliBVJ6ho/34v1krSagfwT794M8gdtGaV/fwZA36?=
 =?us-ascii?Q?Bc/ixmlySAjYTgoW4tWS+sDDwKvF8eF+D7whL9hM2DUZG1mlHumpZ6agfe3I?=
 =?us-ascii?Q?/HKJmOgC2v3mc8QtOZEM/D7LTYnLlrgIxmene9vSrl8VAis1YtaOGDvrtcM0?=
 =?us-ascii?Q?Y9/bUN4jqcwkJ09VGBCzwoi3T1UID5RlpmYpLDyxrHEfrxZsaKedqVLVZw7l?=
 =?us-ascii?Q?V6G+Nuebbv2Ebj6mqGFBp+w6OcVk5h2Nu6w5K74cAa8QW0Y28Ff/AwtpArof?=
 =?us-ascii?Q?irTRDnbdjz1esMfSnL0Cg0Z+xy1bHWbY/bzs4QPN7wtA11KWE0b5Ewa8gtno?=
 =?us-ascii?Q?V6xKBFbn+kowSDQs2SAY0N7ncWEkVbhyyKVKoIhrc8OcKPJhbZUAEzOF8HJF?=
 =?us-ascii?Q?3G6qt5dtcr7kE1XGEy8GzoCSLx80TPL9MBdcGdlbjAOFx3Pdl6uiiQoA9pIT?=
 =?us-ascii?Q?zIyxZA3YzQIS8iPS9ofsnlYXIdk2KxSPzpyRBkG36mz9FgawImbgRSiTpsbI?=
 =?us-ascii?Q?rI9+l9Rj+C/HJB3fvOMVe2Nx6uDBsR0j+/rIzxVn44nAHTV95Ci42J93Ld4u?=
 =?us-ascii?Q?vWwdifrVeH2s3xmOdpq13MKwWZLbVz5LNf87DUv04gsK8Jf7S0byf5KftM+K?=
 =?us-ascii?Q?XDu5Xa7F52i/rd/IkKAtA6lThIvyreEYzygxHPTdNRJ2X/xea48+FiBXQA7K?=
 =?us-ascii?Q?o5Tk7FSoNfk8t6+HmMOAxLh/O0I78jAkp/dQNRAFvHpl0TergfU/dLQuKbOV?=
 =?us-ascii?Q?GU1ll5r+cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c1f67b-2287-4b35-276c-08dec2ff4bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 12:38:07.6163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDl8j2uH9SECcSrddPax/N0xL1dlj8qU088xleEIbEOHCcwbyU9lIsT5ao7QaeV5ak/hognpuU+HiNf7Nz8xrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9481
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238167

Sorry, I forgot to copy Joshua...
Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Friday, June 5, 2026 2:05 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [PATCH 2/2] rootfs,spdx: handle removed packages
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> SPDX should not list packages which were removed from rootfs as installed=
.
>=20
> The list of installed packages does not contain them directly, but as
> dependencies of other installed packages.
>=20
> Siwtch them to "other" to keep them in SPDX as part of the build and
> installation process.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
>  meta/lib/oe/rootfs.py                             |  6 ++++++
>  meta/lib/oe/sbom30.py                             |  8 +++++++-
>  meta/lib/oe/spdx30_tasks.py                       | 14 +++++++++++++-
>  4 files changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-
> recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..dfbd2961b3 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -6,6 +6,7 @@
>  # SPDX image tasks
>=20
>  SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> +SPDX_ROOTFS_REMOVED_PACKAGES =3D "${SPDXDIR}/rootfs-removed-
> packages.json"
>  SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
>  SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
>=20
> @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
>      from oe.rootfs import image_list_installed_packages
>=20
>      root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> +    root_removed_packages_file =3D
> Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
>=20
>      packages =3D image_list_installed_packages(d)
>      if not packages:
>          packages =3D {}
>=20
> +    removed_packages =3D (d.getVar("ROOTFS_REMOVED_PACKAGES") or
> "").split()
> +
>      root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
>      with root_packages_file.open("w") as f:
>          json.dump(packages, f)
> +
> +    with root_removed_packages_file.open("w") as f:
> +        json.dump(removed_packages, f)
>  }
>  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5eee48f587..b8830596ed 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3DABCMeta):
>=20
>=20
>      def _uninstall_unneeded(self):
> +        removed_pkgs =3D set()
> +
>          # Remove the run-postinsts package if no delayed postinsts are f=
ound
>          delayed_postinsts =3D self._get_delayed_postinsts()
>          if delayed_postinsts is None:
>              if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir=
}/init.d/run-
> postinsts")) or
> os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/ru=
n-
> postinsts.service")):
> +                removed_pkgs.add("run-postinsts")
>                  self.pm.remove(["run-postinsts"])
>=20
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-r=
ootfs",
> @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>              # to be uninstalled or to be managed correctly otherwise.
>              provider =3D self.d.getVar("VIRTUAL-RUNTIME_update-alternati=
ves")
>              pkgs_to_remove =3D sorted([pkg for pkg in pkgs_installed if =
pkg in
> unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)
> +            removed_pkgs.update(pkgs_to_remove)
>=20
>              # update-alternatives provider is removed in its own remove(=
)
>              # call because all package managers do not guarantee the pac=
kages
> @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DABCMeta):
>              if len(pkgs_to_remove) > 0:
>                  self.pm.remove([pkgs_to_remove[-1]], False)
>=20
> +        self.d.setVar("ROOTFS_REMOVED_PACKAGES", "
> ".join(sorted(removed_pkgs)))
> +
>          if delayed_postinsts:
>              self._save_postinsts()
>              if image_rorfs:
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index b379ff947c..4fa32266fa 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *, required=3DFalse):
>      return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), required=
=3Drequired)
>=20
>=20
> -def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> +def create_sbom(d, name, root_elements, add_objectsets=3D[],
> removed_packages=3D[]):
>      objset =3D ObjectSet.new_objset(d, name)
>=20
>      sbom =3D objset.add(
> @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements,
> add_objectsets=3D[]):
>              + "\n  ".join(sorted(list(missing_spdxids)))
>          )
>=20
> +    if removed_packages:
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name in removed_packages and pkg.software_primaryPurp=
ose =3D=3D
> oe.spdx30.software_SoftwarePurpose.install:
> +                pkg.software_primaryPurpose =3D
> oe.spdx30.software_SoftwarePurpose.other
> +                bb.note("Reclassified removed package %s SPDX entry from=
 install to
> other" % pkg.name)
> +
>      # Filter out internal extensions from final SBoMs
>      objset.remove_internal_extensions()
>=20
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 7cc46d579b..18c68f47de 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
>      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
>      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
>      machine =3D d.getVar("MACHINE")
> +    root_removed_packages_file =3D
> Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
>=20
>      spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
>=20
> @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
>      for o in image_objset.foreach_root(oe.spdx30.software_File):
>          root_elements.append(oe.sbom30.get_element_link_id(o))
>=20
> -    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
> +    try:
> +        with root_removed_packages_file.open("r") as f:
> +            removed_packages =3D json.load(f)
> +    except FileNotFoundError:
> +        removed_packages =3D []
> +
> +    objset, sbom =3D oe.sbom30.create_sbom(
> +        d,
> +        image_name,
> +        root_elements,
> +        removed_packages=3Dremoved_packages,
> +    )
>=20
>      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
>      supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)

