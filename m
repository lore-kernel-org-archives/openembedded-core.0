Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821F6C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:11:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36022.1782483069476409841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DYVtLf+0;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80b9993928dso10027547b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782483068; cv=none;
        d=google.com; s=arc-20260327;
        b=HXxxk0Gt8FzTeCs8W/bD0WpJs2p9AAMOxMJG5gD6T3J9Jnz5t5QjlWiHydGFsXTDFL
         wlEhLSpqh5tDGL4eqYBIzhNgypMumURxV5pU37k8KmDE6gHEOXKxxWW33zSR79HSqvHD
         dedsJNvv7eNei7YlGHnxaV2+ICy3rmBd1by9pVc9zAdUpRY0qdSuzoGakDBvx69i/c8s
         rAs+WjHRRkj0jlATLHz/C4FH53RgkRa9i065mwczsqVfgRYjU+Qh9P57WvRtUZ7aSqra
         kxkvBKojc7Cxs+6wvoVgh+RJcaZ/PNS+I0ix+ZWXjFvLThScapjgxjpg6YUAoaw1jH57
         JVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJAndXN+U4tdqADMIgFYtASPqa+Vuwook79xyW2BQNg=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=bqbe8UtglhPGIJlrfZLXEXNHNHQ3UoCbISq6vXspG5xp3tWZ6K1qS3JYr1M7wkmZ0m
         nBNNoF5Hvsd3hlmOMuIq4YUtZCXuKg4BW4H5G0mvLwBdBDLC6lIyAVPZU8r9FI25MxDU
         VAv/VIe9wGnbp1aGVIeqwFt7r/9KAntYJ9qd/n9Y/wh48OoHbSNgha3ADk3XkAdg+oIf
         ylhiIfMtQdpamHHlTrf9BXZP9mablIPas5MEasNfLWgdgqo2UN3xxhX9YeHbJIvs5jlh
         yUNp+Cdo9aStrL4/Dxvsf0q1yUZc7XJ1rX5dM42qfHxvoBEffd0NXpFtcwlI9OyQuQGi
         S8Jg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782483068; x=1783087868; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJAndXN+U4tdqADMIgFYtASPqa+Vuwook79xyW2BQNg=;
        b=DYVtLf+0WhPs+xQnu8h5pwJAs02nOJZN5lEGQKFVH7ohPGDVOe74VA6My2+vXdixxo
         hfwj3M/qlxjz9F5SYlGoEoCdR/qZ/ltWLExsoFAuaDOslu2cL/BCHy4irK/HwZeNcWCv
         BZP6Wj5vP0gHEI/qry6RzWnQUXXII4Vygbj3Uvhm1lbXgsYBT1xOWEuBW3sio0EaUv3A
         h2WP8L/9EfSkpH0KHyQ3ibMupv9N6Apd//RYT/l2MJprA9zEhAbcB2DKKRnuECpbPtbH
         eecnHwpkoiLZSa654LITJRfg2ld5qcNFRTDnzhMfLz/GD9HwgU2hKUUVGw11GaNqLo4w
         aoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782483068; x=1783087868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJAndXN+U4tdqADMIgFYtASPqa+Vuwook79xyW2BQNg=;
        b=GH0tmaFyFy70K8tfZT+qwYwKuPo5kXvA3p8RhbUBq1O8p4w2F5vuqBFMe78DSD4MRY
         lpQP+wfc7L1lJxb9KHLRl4BRaePif71GokSAHPaiXTr63CK4ihFe13oZyRuI7QKVn4nx
         Xgz4lwdzcZYDF3OG0qYKHlXW73iIAb9gxNUtOIuFCvRxnbzK5EAqv1VqHD1Y56EwolP+
         jT+ie1hPIITfYE4HmEPO3CPjGpPP1vmACkvZMJN48mz6iezlxvHnriMi0O8CEIC9B+kH
         SCnGGkmePWv/XhaToJhOU0jBmI03c5bD063UIwuKCTJyYJYMchjUl1hCTaCgW+o+uksd
         nCtQ==
X-Gm-Message-State: AOJu0YyZLGhmV+YIIkcuQptPGMt0F/M9BP0h/9ILYbO1BgGvCkQwXTxc
	LoDWQdwL3C3FxKZSO6lNN1JBdr7pcDKVUI/4KQAfaTG/8u+ZZ4iHpjUe3EBiaAE52eXhqmEpjPX
	0YkJnw1IOmGB5Lzs4bVG0e8DpOGgD7GM=
X-Gm-Gg: AfdE7clxlp3EQ05PcPw+h9Ni8bP3FjRDOMSz5eRjDKQiK9s72y5gyADPJO/OINZPTu6
	SH35A6wMmxhKEZyHoqFRqPx86yQnHRONLFPJmajzA1dNedWmzOCbIT6yOV/+1n5rGaR7sImk7J8
	/qliujDzs34yB8T55ER30fv/1UHi5ZuYejsGfOLCb+m9NgU9MJydL75GWaeRDn9O2RIZQqy9w8i
	0nmfLS0M16mheP+t+5gC8fK7yvS2+1ORgc7viCR7qyKGBydlnl6KnFlESDejpY7ve0Mkw8fBIh5
	Lyk109cCCubQbP97Ig7Qm1ZBxEBQsp1TY/lP2PNJ
X-Received: by 2002:a05:690c:c4e4:b0:7fe:bd7:9c93 with SMTP id
 00721157ae682-80a6a9991bemr66080987b3.44.1782483068423; Fri, 26 Jun 2026
 07:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260605120456.130264-1-peter.marko@siemens.com>
 <20260605120456.130264-2-peter.marko@siemens.com> <CAJdd5Gb_oFCfDcn_wQHk6XnJtG3+zMmKruOyqPrpVgYUi0T9AQ@mail.gmail.com>
 <AS8PR10MB50734EC9D7C1456FE1A143B9FD1C2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50734EC9D7C1456FE1A143B9FD1C2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 26 Jun 2026 08:10:54 -0600
X-Gm-Features: AVVi8CeoE5VEF6rAT5V33n4C3IIsM-opSmZkkEDlvkzwsVwU0wh8wdG9DluFEd8
Message-ID: <CAJdd5GbCMsqA_BWmyWSpovu9Cj-ZYvxWrVmj2_p3+c04c5FUsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239635

On Mon, Jun 8, 2026 at 7:56=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:
>
>
>
> > -----Original Message-----
> > From: Joshua Watt <jpewhacker@gmail.com>
> > Sent: Friday, June 5, 2026 4:16 PM
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
> >
> > On Fri, Jun 5, 2026 at 6:05=E2=80=AFAM Peter Marko via lists.openembedd=
ed.org
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > SPDX should not list packages which were removed from rootfs as insta=
lled.
> > >
> > > The list of installed packages does not contain them directly, but as
> > > dependencies of other installed packages.
> > >
> > > Siwtch them to "other" to keep them in SPDX as part of the build and
> > > installation process.
> >
> > I agree the packages should be removed from the rootfs, but using the
> > method described.
> >
> > Instead, the list of removed packages should be passed to
> > collect_build_package_inputs(), and anything removed should skip
> > having it's files added to files_by_hash (but, should still be added
> > to build_deps, since it is a build dependency).
>
> I have tried several approaches here but all without success until now..
> The problem is that these removed packages are "rdepends" and not "depend=
s".
> Thus in collect_build_package_inputs they are not present yet.
> And even if they would be, the rdepends would anyway add it back later.
>
> SPDX entries for rdepend clauses are added in expand_collection function.
> I obviously cannot remove the rdepends clause when the recipe sbom is cre=
ated.
>
> The best approach probably is to remove the rdepends when iterating over =
sbomx in expand_collection.
> Would you agree when I try to send a patch in that direction?
> Or do you have any other suggestion?

That's going to be tricky because you can't just remove the packages;
you also need to remove any reference to the package (e.g. if they are
in a relationship or somewhere else); otherwise the resulting document
will not be fully linked and you'll get errors when creating the SBoM.
For an example of what that would sort of look like, you can look at
the "duplicate" function which is used to replace references to
licenses and CreationInfo with equivalent ones to reduce the document
size.

But, this is going to complicate an otherwise pretty simple merging
algorithm; I'm just not sure we can currently accurately express what
is going on here (packages being uninstalled at install time), and
until we have a good idea how to express it, I don't want to make it
more confusing by doing something weird (because, then people rely on
the weird behavior and get upset when it changes because we found a
better solution).

>
> >
> > This will prevent that rootfs package from "containing" the files for
> > removed packages, and break the linkage between the rootfs and the
> > removed packages.
> >
> > I'm not exactly sure the reasoning behind changing the type the
> > "other", but we should not be doing that.
>
> Well, "other" because there was no good value for that available in enum =
(installation helper).
>
> >
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
> > >  meta/lib/oe/rootfs.py                             |  6 ++++++
> > >  meta/lib/oe/sbom30.py                             |  8 +++++++-
> > >  meta/lib/oe/spdx30_tasks.py                       | 14 +++++++++++++=
-
> > >  4 files changed, 33 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta=
/classes-
> > recipe/create-spdx-image-3.0.bbclass
> > > index 15a91e90e2..dfbd2961b3 100644
> > > --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > > +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > > @@ -6,6 +6,7 @@
> > >  # SPDX image tasks
> > >
> > >  SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> > > +SPDX_ROOTFS_REMOVED_PACKAGES =3D "${SPDXDIR}/rootfs-removed-
> > packages.json"
> > >  SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
> > >  SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
> > >
> > > @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
> > >      from oe.rootfs import image_list_installed_packages
> > >
> > >      root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> > > +    root_removed_packages_file =3D
> > Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
> > >
> > >      packages =3D image_list_installed_packages(d)
> > >      if not packages:
> > >          packages =3D {}
> > >
> > > +    removed_packages =3D (d.getVar("ROOTFS_REMOVED_PACKAGES") or
> > "").split()
> > > +
> > >      root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
> > >      with root_packages_file.open("w") as f:
> > >          json.dump(packages, f)
> > > +
> > > +    with root_removed_packages_file.open("w") as f:
> > > +        json.dump(removed_packages, f)
> > >  }
> > >  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
> > >
> > > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > > index 5eee48f587..b8830596ed 100644
> > > --- a/meta/lib/oe/rootfs.py
> > > +++ b/meta/lib/oe/rootfs.py
> > > @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3DABCMeta):
> > >
> > >
> > >      def _uninstall_unneeded(self):
> > > +        removed_pkgs =3D set()
> > > +
> > >          # Remove the run-postinsts package if no delayed postinsts a=
re found
> > >          delayed_postinsts =3D self._get_delayed_postinsts()
> > >          if delayed_postinsts is None:
> > >              if
> > os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-p=
ostinsts"))
> > or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdi=
r}/run-
> > postinsts.service")):
> > > +                removed_pkgs.add("run-postinsts")
> > >                  self.pm.remove(["run-postinsts"])
> > >
> > >          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-on=
ly-rootfs",
> > > @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> > >              # to be uninstalled or to be managed correctly otherwise=
.
> > >              provider =3D self.d.getVar("VIRTUAL-RUNTIME_update-alter=
natives")
> > >              pkgs_to_remove =3D sorted([pkg for pkg in pkgs_installed=
 if pkg in
> > unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)
> > > +            removed_pkgs.update(pkgs_to_remove)
> > >
> > >              # update-alternatives provider is removed in its own rem=
ove()
> > >              # call because all package managers do not guarantee the=
 packages
> > > @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DABCMeta):
> > >              if len(pkgs_to_remove) > 0:
> > >                  self.pm.remove([pkgs_to_remove[-1]], False)
> > >
> > > +        self.d.setVar("ROOTFS_REMOVED_PACKAGES", "
> > ".join(sorted(removed_pkgs)))
> > > +
> > >          if delayed_postinsts:
> > >              self._save_postinsts()
> > >              if image_rorfs:
> > > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > > index b379ff947c..4fa32266fa 100644
> > > --- a/meta/lib/oe/sbom30.py
> > > +++ b/meta/lib/oe/sbom30.py
> > > @@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *, required=3DFal=
se):
> > >      return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), requir=
ed=3Drequired)
> > >
> > >
> > > -def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> > > +def create_sbom(d, name, root_elements, add_objectsets=3D[],
> > removed_packages=3D[]):
> > >      objset =3D ObjectSet.new_objset(d, name)
> > >
> > >      sbom =3D objset.add(
> > > @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements,
> > add_objectsets=3D[]):
> > >              + "\n  ".join(sorted(list(missing_spdxids)))
> > >          )
> > >
> > > +    if removed_packages:
> > > +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> > > +            if pkg.name in removed_packages and pkg.software_primary=
Purpose =3D=3D
> > oe.spdx30.software_SoftwarePurpose.install:
> > > +                pkg.software_primaryPurpose =3D
> > oe.spdx30.software_SoftwarePurpose.other
> > > +                bb.note("Reclassified removed package %s SPDX entry =
from install to
> > other" % pkg.name)
> > > +
> > >      # Filter out internal extensions from final SBoMs
> > >      objset.remove_internal_extensions()
> > >
> > > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.p=
y
> > > index 7cc46d579b..18c68f47de 100644
> > > --- a/meta/lib/oe/spdx30_tasks.py
> > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
> > >      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> > >      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
> > >      machine =3D d.getVar("MACHINE")
> > > +    root_removed_packages_file =3D
> > Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
> > >
> > >      spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> > >
> > > @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
> > >      for o in image_objset.foreach_root(oe.spdx30.software_File):
> > >          root_elements.append(oe.sbom30.get_element_link_id(o))
> > >
> > > -    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_eleme=
nts)
> > > +    try:
> > > +        with root_removed_packages_file.open("r") as f:
> > > +            removed_packages =3D json.load(f)
> > > +    except FileNotFoundError:
> > > +        removed_packages =3D []
> > > +
> > > +    objset, sbom =3D oe.sbom30.create_sbom(
> > > +        d,
> > > +        image_name,
> > > +        root_elements,
> > > +        removed_packages=3Dremoved_packages,
> > > +    )
> > >
> > >      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is define=
d
> > >      supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse=
)
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#238166): https://lists.openembedded.org/g/openemb=
edded-
> > core/message/238166
> > > Mute This Topic: https://lists.openembedded.org/mt/119660891/3616693
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [JPEWhacker@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

