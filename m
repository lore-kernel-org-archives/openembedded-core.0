Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FB8CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:17:53 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9110.1780669071579731395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 07:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U0cwX9Ln;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7e266714bd3so22549057b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780669071; cv=none;
        d=google.com; s=arc-20240605;
        b=CmhHDwRcjrME+lFwl8tI03l7EYY8kY5V8LV8wT1rBrdtxG8xm1oojuveehUKKigT3w
         p4iTGRiZ1/FnskOqkJZZp53dlA/EJuPvA83J6YEP1z0/FJ+qFCvBIyLPQ8moHbR+U4ae
         gcgXlo5xJ28bKQM6D/ygxadgn9r3oNlc0i+ldIan7iXanYnaGAsTtHyeBxDBxMbbGUt4
         hfhL8fGs3C3oaZJ/P+9ln9QV1t9rVbT07QpuOBy+rUsNUqywbNqUF7OtBPg3G44fq7lW
         Vdyih3nGwEQTYi4kd4LymNifWsMp9MKFpQ7JWrkXqMYFHki57fML6M+YcUL+993JYoK2
         j4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DaDwovGlua44BMSVpKNNiP7DLFIv7w/DZFrdwi3ydrI=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=CZSF1DAiOGKNmoZYyaR0voaeuu/mcUjp/zSegjg420pqZoOlOLDd3M/a0mZE3kGXgD
         Z7ARcQ+UoffTL16afhCAPL7KYfQZmKdUQF2BO1CooZNEkGteHAF6Dtbs4tPYPWczJUBw
         yRDL6GHHVLeQWGFf5nRun7fHNVC970tSFyWSzX+GO15n7UkAcmo1Pcdq7aoVjsnI3TMf
         w/xZiTcN2bvUgVIWYV2BxmYgXGsncFL/STewrZoxj6/OY2zPE2phfEEYQPChY9TEouzW
         99bbQb+lnN2fJHR4Lr76VjS40PsoIVf8nuNOdtcyLBe6p9SHbCWKMecu7CMgeS7g5v1i
         CWJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780669071; x=1781273871; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaDwovGlua44BMSVpKNNiP7DLFIv7w/DZFrdwi3ydrI=;
        b=U0cwX9LnO35OOYX10a9q6XrBxzdxS/fWs1shyVovsBrvtc19L71/R1YlSwFPo6EGKg
         bYRndyn9d6Dqk2z3wyoVqd8O2xgQy7AocaIR+BnTeM+IfeOkr1hPtUCMA2e6UDONXx9y
         Eziq1MHVRLMszjaN0ZHyiMES/UTa6nTqgkmMl20IFREbfYpg6uhd4tKyiPivzTXDqqaG
         UWdmc0UYZkiHpCiMZNiwa3amVXWUY7ssJM4B5QOJrLONbA22jyEVJilTNQsrV2W7wvX4
         6+3PRWpIV/6Drs6JlpqeM6YVmgx+CxRNJ/AgDh59ZifSGs3CdeEBQVzv1NbEknAbZfnB
         vA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780669071; x=1781273871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DaDwovGlua44BMSVpKNNiP7DLFIv7w/DZFrdwi3ydrI=;
        b=qsa4PUlye2fLCErxiMIV0m1KFVjHE3KfMqaSFKWo0xB4w7a9a1skOANJ194zef3vrr
         DZQOsmE2xbVtAD/MpDX+s32dv5JnUXw82DgvqbTUrzYZ1R+T7TMywXetBx2YU/Z++oa1
         U4WjG5kiuywz32b8A4iCQe1mCa02QEgWE+H8OWDJgNPeTCUgGSe76vmvTfl0oCsJfZov
         J1SeyYNfh+J1r52q6KJXK8fkmQvVaUDCzhsYbOGH8EwA/d4p/h2cMJ6vV3hJkun5jBFu
         +ydxWPVJSDKn4Krw+tPIXiIVVHvX7B6x7Xk0J2bXXFHVQo6TgSpUjlWs/J6EEA2FDrNI
         F9KA==
X-Gm-Message-State: AOJu0YzmF8GclZGS66myqLyCMRY2E8lJFAUmX6JwTq8iiG8eFS8ux03X
	d5CvUTsMVzo9lfFNca3J0MZ18ZK91UCawBcCqcFTm4j7NEIzmMs1e/GUYmiqBR3oYDvGaeniyg6
	4tGjfmfoZQK32NmjGwWhBKVp5OBo06pZJcA==
X-Gm-Gg: Acq92OEFlidoIGIxzhSL9CqonSitlkYEA9HxeYsGNUNJwqgwWgbgWRP/NYQc+EwSeqU
	oicnhdR5KzbA6wrgYc2HPrEw4d49hfR150Z05JLROHwBcmTOQmF3Q3Y990Vv6f92Dw5HGH8wkR+
	gTbTorHyhjHTQp1+itRSUP5DEDmanCgU9IV9OMGmPIuOS17l7TT1e/2GPAQWhFP7vLrw4M8jPLB
	jNXnvJ0zwpZrY295MJh37vY8F9yvzjd5zLxLSH0XBD+8EEq0c+RSM0qPMMX7gAHmeCHrM1EuuYf
	NRwOBwklaA5d3NJoQcrDFuss22YPzb2B
X-Received: by 2002:a05:690c:c1d:b0:7db:f1b4:15d0 with SMTP id
 00721157ae682-7ed0f23d553mr40471557b3.33.1780669070596; Fri, 05 Jun 2026
 07:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260605120456.130264-1-peter.marko@siemens.com>
 <20260605120456.130264-2-peter.marko@siemens.com> <CAJdd5Gb_oFCfDcn_wQHk6XnJtG3+zMmKruOyqPrpVgYUi0T9AQ@mail.gmail.com>
In-Reply-To: <CAJdd5Gb_oFCfDcn_wQHk6XnJtG3+zMmKruOyqPrpVgYUi0T9AQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 5 Jun 2026 08:17:39 -0600
X-Gm-Features: AVHnY4LGEmRtUwNa7RCmLKQooRM_HCaRNBoK2nwERhC7stSvupCT37lPko-BWc8
Message-ID: <CAJdd5GYCcoJ8-JhKuqXMrUP1J+yMvricL4kBz-kp5L1iWupK8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238170

On Fri, Jun 5, 2026 at 8:16=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> w=
rote:
>
> On Fri, Jun 5, 2026 at 6:05=E2=80=AFAM Peter Marko via lists.openembedded=
.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > SPDX should not list packages which were removed from rootfs as install=
ed.
> >
> > The list of installed packages does not contain them directly, but as
> > dependencies of other installed packages.
> >
> > Siwtch them to "other" to keep them in SPDX as part of the build and
> > installation process.
>
> I agree the packages should be removed from the rootfs, but using the
> method described.

"but *not* using the method described in this patch, please try the
method listed below"

Need more coffee :)

>
> Instead, the list of removed packages should be passed to
> collect_build_package_inputs(), and anything removed should skip
> having it's files added to files_by_hash (but, should still be added
> to build_deps, since it is a build dependency).
>
> This will prevent that rootfs package from "containing" the files for
> removed packages, and break the linkage between the rootfs and the
> removed packages.
>
> I'm not exactly sure the reasoning behind changing the type the
> "other", but we should not be doing that.
>
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
> >  meta/lib/oe/rootfs.py                             |  6 ++++++
> >  meta/lib/oe/sbom30.py                             |  8 +++++++-
> >  meta/lib/oe/spdx30_tasks.py                       | 14 +++++++++++++-
> >  4 files changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/c=
lasses-recipe/create-spdx-image-3.0.bbclass
> > index 15a91e90e2..dfbd2961b3 100644
> > --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > @@ -6,6 +6,7 @@
> >  # SPDX image tasks
> >
> >  SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> > +SPDX_ROOTFS_REMOVED_PACKAGES =3D "${SPDXDIR}/rootfs-removed-packages.j=
son"
> >  SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
> >  SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
> >
> > @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
> >      from oe.rootfs import image_list_installed_packages
> >
> >      root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> > +    root_removed_packages_file =3D Path(d.getVar("SPDX_ROOTFS_REMOVED_=
PACKAGES"))
> >
> >      packages =3D image_list_installed_packages(d)
> >      if not packages:
> >          packages =3D {}
> >
> > +    removed_packages =3D (d.getVar("ROOTFS_REMOVED_PACKAGES") or "").s=
plit()
> > +
> >      root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
> >      with root_packages_file.open("w") as f:
> >          json.dump(packages, f)
> > +
> > +    with root_removed_packages_file.open("w") as f:
> > +        json.dump(removed_packages, f)
> >  }
> >  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
> >
> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > index 5eee48f587..b8830596ed 100644
> > --- a/meta/lib/oe/rootfs.py
> > +++ b/meta/lib/oe/rootfs.py
> > @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3DABCMeta):
> >
> >
> >      def _uninstall_unneeded(self):
> > +        removed_pkgs =3D set()
> > +
> >          # Remove the run-postinsts package if no delayed postinsts are=
 found
> >          delayed_postinsts =3D self._get_delayed_postinsts()
> >          if delayed_postinsts is None:
> >              if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfd=
ir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS=
}${systemd_system_unitdir}/run-postinsts.service")):
> > +                removed_pkgs.add("run-postinsts")
> >                  self.pm.remove(["run-postinsts"])
> >
> >          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only=
-rootfs",
> > @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> >              # to be uninstalled or to be managed correctly otherwise.
> >              provider =3D self.d.getVar("VIRTUAL-RUNTIME_update-alterna=
tives")
> >              pkgs_to_remove =3D sorted([pkg for pkg in pkgs_installed i=
f pkg in unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)
> > +            removed_pkgs.update(pkgs_to_remove)
> >
> >              # update-alternatives provider is removed in its own remov=
e()
> >              # call because all package managers do not guarantee the p=
ackages
> > @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DABCMeta):
> >              if len(pkgs_to_remove) > 0:
> >                  self.pm.remove([pkgs_to_remove[-1]], False)
> >
> > +        self.d.setVar("ROOTFS_REMOVED_PACKAGES", " ".join(sorted(remov=
ed_pkgs)))
> > +
> >          if delayed_postinsts:
> >              self._save_postinsts()
> >              if image_rorfs:
> > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > index b379ff947c..4fa32266fa 100644
> > --- a/meta/lib/oe/sbom30.py
> > +++ b/meta/lib/oe/sbom30.py
> > @@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *, required=3DFalse=
):
> >      return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), required=
=3Drequired)
> >
> >
> > -def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> > +def create_sbom(d, name, root_elements, add_objectsets=3D[], removed_p=
ackages=3D[]):
> >      objset =3D ObjectSet.new_objset(d, name)
> >
> >      sbom =3D objset.add(
> > @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements, add_obje=
ctsets=3D[]):
> >              + "\n  ".join(sorted(list(missing_spdxids)))
> >          )
> >
> > +    if removed_packages:
> > +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> > +            if pkg.name in removed_packages and pkg.software_primaryPu=
rpose =3D=3D oe.spdx30.software_SoftwarePurpose.install:
> > +                pkg.software_primaryPurpose =3D oe.spdx30.software_Sof=
twarePurpose.other
> > +                bb.note("Reclassified removed package %s SPDX entry fr=
om install to other" % pkg.name)
> > +
> >      # Filter out internal extensions from final SBoMs
> >      objset.remove_internal_extensions()
> >
> > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > index 7cc46d579b..18c68f47de 100644
> > --- a/meta/lib/oe/spdx30_tasks.py
> > +++ b/meta/lib/oe/spdx30_tasks.py
> > @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
> >      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> >      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
> >      machine =3D d.getVar("MACHINE")
> > +    root_removed_packages_file =3D Path(d.getVar("SPDX_ROOTFS_REMOVED_=
PACKAGES"))
> >
> >      spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> >
> > @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
> >      for o in image_objset.foreach_root(oe.spdx30.software_File):
> >          root_elements.append(oe.sbom30.get_element_link_id(o))
> >
> > -    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_element=
s)
> > +    try:
> > +        with root_removed_packages_file.open("r") as f:
> > +            removed_packages =3D json.load(f)
> > +    except FileNotFoundError:
> > +        removed_packages =3D []
> > +
> > +    objset, sbom =3D oe.sbom30.create_sbom(
> > +        d,
> > +        image_name,
> > +        root_elements,
> > +        removed_packages=3Dremoved_packages,
> > +    )
> >
> >      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
> >      supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#238166): https://lists.openembedded.org/g/openembed=
ded-core/message/238166
> > Mute This Topic: https://lists.openembedded.org/mt/119660891/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

