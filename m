Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C950CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:16:43 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9237.1780668995994916817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 07:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GnShmkOA;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e0aa486af8so22581387b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780668995; cv=none;
        d=google.com; s=arc-20240605;
        b=YMS+gtYZqxq/ULlhE6Y06QABgeWiCE33i7lHQhahZYy6CYJOTHF+4YLRsLhdJS3jCD
         XtVz1Gj6ep1cPhdM9Pqm1F2tTp+3q8WoIMCpieTgQciGekLfS2LnJjfoRLGrXnQSXcHC
         aME7CWxEc+fCd31JWpL8HjXDq77cnyyT9e7Vr1A6zfl0x2DrRJ7DG9UyvgjtvBKa5ET7
         9FDCTukCTJAnjPEUNC1/Qk6mfDCcYJHUPLt7MNYUngRxwsmTLB4jHBbAyZX3OzC7z1Ez
         VWWpK1ub+epQLTlVgJnvNmr+z0X0mbeNSVSaegL6KrMDxGOYq/RXXMzGzHCpeXrP67xD
         cLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XNIfRotmsD3fZZ7RssQLDKqR5Zz3PctGI8kwSXGTtxg=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=kxyfYq49Q1nQukww4mYcl0z9SbEoqTEmZ5wnSgomAGOqJ9sVa8QAgerdBZz71X+cMp
         ddL39gxBNfkXhWOgdPZBgc9rnND2h5cfc5kfae1ZuklFqP4qFE8FjoJ///4wUmtMRYGq
         tWjJW+PbbzH7umUhuApCobf9iH8kAKA+t2ktTqgJLbygm4Qrg/5f5JASCgoNr3LXphFm
         CEMPleTyQnLSAWNkUS3yhc1rvKLjnDSuG+Eq1VmV1N0b4HIz3xPUjUb8rVUT9lyDoAau
         84yPtNE+96yevrjyMlKQdQwP9AcVTiYT7nczmqgER6xYf39uhk5qZ3FQux4qaFBOV9IZ
         /KqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780668995; x=1781273795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNIfRotmsD3fZZ7RssQLDKqR5Zz3PctGI8kwSXGTtxg=;
        b=GnShmkOAu+o6JvvXQfIAytTV+tTN98/p2V1eiOx+JFDVP1/CSOirF/89XxvUyj6imn
         W+Pd/H7oYBKTbbkzXc9PozMFML/JDrcN6j2TesT7aYLBdDK1q+0Tj/81R3CA8TYUAhum
         xy3TvuQbuBUem59N5J7Cu4AelmW1ymBzn387JI6HQIorxo3tPWIXMi57zORnZbO+gMGk
         nTX/fAX2Sw3cMGLHeB/oJ1Cw1Pa/NuxSroe0yQSfhSuRuZXWz3Q+gDXcULBMM2SEd09V
         A5hmocgtdyYKGsUe+c2Vw+sgtiSzlwQAcTQxFHre/eOKSoTXb3rHFIpPhEi9J66mCBTh
         pdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668995; x=1781273795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNIfRotmsD3fZZ7RssQLDKqR5Zz3PctGI8kwSXGTtxg=;
        b=XAEd+GCUdHBCeDjQymAxYImiKG9eDMP2EzcrGhvt3Rc+RSvvW4FPaq1yR+F24uDySD
         UKVjPCkFQd+2g9GEivCKieIUZLVUjQGHSVLhV25KKrN1RG5tcwe8F7sdvn5f8plyYaXn
         9UYofHfG+d7EEv4tXTeOOPqiYBeDMvZWFUQUsJKTr0R6lLFofeRJ+7GJsGGQes55YI/Y
         Y2Ce79lzCh7xv41hJZ5t8AHqIfEA3pDSWJjhzmCjZ0kIBwq97MZCrRV5/wGQDlhofbB+
         hJVjVZumch0+ynEuiccaZEwKpVtT9/dzN87edzo61YbBHdogXKG9F7fXRhTlE4VNl72v
         7bHQ==
X-Gm-Message-State: AOJu0YyD/l7ADy/UchFKyjgTi6pBUVst/BUlFqCiFMGYkcE2ChYDDJWH
	5V+MfzcjEDOSYISXfrrKnQetvb6MXulo+JNIpMhanVT5N94IKgciS8Y69uUxtxq+YrT5CzBccIh
	QXP1AnH91FU/IDvdBR7wHh32aZ2omrWA=
X-Gm-Gg: Acq92OESEiJCZnc1oj+rGTZlutwB9iD+9TlSpjIaQaWRn1dYVqOrDK7dVlzHE2L6Gdf
	MW1iSQaCjYn4loFHTJQr6N2/vWFOhMsEn55UhbwauI5aXzEWstVFOT1F9q/EyNgsAX+SyGhPd1V
	JSBb86jsIGtCeWv+PLoZ9ao2OjOpXX4bz9qsm3My/0/wIZvF2hJLHLjaBRGjnU3LbQWEq7fupyB
	6XIh56qybJZEwKr1pv/561KZ5rBoMUVUPpY3ZLYKvN/kfDHizTzeSCZ5FBZyzZqhtgwpc2GCRWk
	WmgpfTe/yG8NupaDteasaPcFBjCVL6pw0eUNf4ipK+M=
X-Received: by 2002:a05:690c:c4e5:b0:7bf:ff7:ea71 with SMTP id
 00721157ae682-7ed52ec565amr20407067b3.17.1780668994852; Fri, 05 Jun 2026
 07:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260605120456.130264-1-peter.marko@siemens.com> <20260605120456.130264-2-peter.marko@siemens.com>
In-Reply-To: <20260605120456.130264-2-peter.marko@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 5 Jun 2026 08:16:23 -0600
X-Gm-Features: AVVi8Cepg5yPz8yeXws2H7-0w7_ReG7evIOs-bkUmwApXlijrIz0eWELfOUP3SM
Message-ID: <CAJdd5Gb_oFCfDcn_wQHk6XnJtG3+zMmKruOyqPrpVgYUi0T9AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 14:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238169

On Fri, Jun 5, 2026 at 6:05=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> SPDX should not list packages which were removed from rootfs as installed=
.
>
> The list of installed packages does not contain them directly, but as
> dependencies of other installed packages.
>
> Siwtch them to "other" to keep them in SPDX as part of the build and
> installation process.

I agree the packages should be removed from the rootfs, but using the
method described.

Instead, the list of removed packages should be passed to
collect_build_package_inputs(), and anything removed should skip
having it's files added to files_by_hash (but, should still be added
to build_deps, since it is a build dependency).

This will prevent that rootfs package from "containing" the files for
removed packages, and break the linkage between the rootfs and the
removed packages.

I'm not exactly sure the reasoning behind changing the type the
"other", but we should not be doing that.

>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
>  meta/lib/oe/rootfs.py                             |  6 ++++++
>  meta/lib/oe/sbom30.py                             |  8 +++++++-
>  meta/lib/oe/spdx30_tasks.py                       | 14 +++++++++++++-
>  4 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..dfbd2961b3 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -6,6 +6,7 @@
>  # SPDX image tasks
>
>  SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> +SPDX_ROOTFS_REMOVED_PACKAGES =3D "${SPDXDIR}/rootfs-removed-packages.jso=
n"
>  SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
>  SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
>
> @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
>      from oe.rootfs import image_list_installed_packages
>
>      root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> +    root_removed_packages_file =3D Path(d.getVar("SPDX_ROOTFS_REMOVED_PA=
CKAGES"))
>
>      packages =3D image_list_installed_packages(d)
>      if not packages:
>          packages =3D {}
>
> +    removed_packages =3D (d.getVar("ROOTFS_REMOVED_PACKAGES") or "").spl=
it()
> +
>      root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
>      with root_packages_file.open("w") as f:
>          json.dump(packages, f)
> +
> +    with root_removed_packages_file.open("w") as f:
> +        json.dump(removed_packages, f)
>  }
>  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5eee48f587..b8830596ed 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3DABCMeta):
>
>
>      def _uninstall_unneeded(self):
> +        removed_pkgs =3D set()
> +
>          # Remove the run-postinsts package if no delayed postinsts are f=
ound
>          delayed_postinsts =3D self._get_delayed_postinsts()
>          if delayed_postinsts is None:
>              if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir=
}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}$=
{systemd_system_unitdir}/run-postinsts.service")):
> +                removed_pkgs.add("run-postinsts")
>                  self.pm.remove(["run-postinsts"])
>
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-r=
ootfs",
> @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DABCMeta):
>              # to be uninstalled or to be managed correctly otherwise.
>              provider =3D self.d.getVar("VIRTUAL-RUNTIME_update-alternati=
ves")
>              pkgs_to_remove =3D sorted([pkg for pkg in pkgs_installed if =
pkg in unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)
> +            removed_pkgs.update(pkgs_to_remove)
>
>              # update-alternatives provider is removed in its own remove(=
)
>              # call because all package managers do not guarantee the pac=
kages
> @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DABCMeta):
>              if len(pkgs_to_remove) > 0:
>                  self.pm.remove([pkgs_to_remove[-1]], False)
>
> +        self.d.setVar("ROOTFS_REMOVED_PACKAGES", " ".join(sorted(removed=
_pkgs)))
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
>
>
> -def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> +def create_sbom(d, name, root_elements, add_objectsets=3D[], removed_pac=
kages=3D[]):
>      objset =3D ObjectSet.new_objset(d, name)
>
>      sbom =3D objset.add(
> @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements, add_object=
sets=3D[]):
>              + "\n  ".join(sorted(list(missing_spdxids)))
>          )
>
> +    if removed_packages:
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name in removed_packages and pkg.software_primaryPurp=
ose =3D=3D oe.spdx30.software_SoftwarePurpose.install:
> +                pkg.software_primaryPurpose =3D oe.spdx30.software_Softw=
arePurpose.other
> +                bb.note("Reclassified removed package %s SPDX entry from=
 install to other" % pkg.name)
> +
>      # Filter out internal extensions from final SBoMs
>      objset.remove_internal_extensions()
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 7cc46d579b..18c68f47de 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
>      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
>      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
>      machine =3D d.getVar("MACHINE")
> +    root_removed_packages_file =3D Path(d.getVar("SPDX_ROOTFS_REMOVED_PA=
CKAGES"))
>
>      spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
>
> @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
>      for o in image_objset.foreach_root(oe.spdx30.software_File):
>          root_elements.append(oe.sbom30.get_element_link_id(o))
>
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
>
>      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
>      supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238166): https://lists.openembedded.org/g/openembedde=
d-core/message/238166
> Mute This Topic: https://lists.openembedded.org/mt/119660891/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

