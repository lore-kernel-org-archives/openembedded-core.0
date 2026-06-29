Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549DEC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 23:01:54 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9393.1782774108005488611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 16:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZHTXNCtP;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7fe4808741eso40439247b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 16:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782774107; cv=none;
        d=google.com; s=arc-20260327;
        b=fThc7QrOpIvra65JFKJ5QgUPNd1aOLlpXOoc/UxEZv+Lj2Iqv5OTEKGf1CFeE//riB
         Gxt04pjf5q6ldfMeBT8/DXv3SRAEGXRsz7mmGL+MPL5o3SbNuNOEVZGhMGYrtagqw3Eg
         l8qPMAGCiZuDLyJ+sHy2WLFTL/TZPb/0DprfI1dMtOpf0VPfn/ratioJ8tjlYgPWgGKt
         piLvZD3XReTBI9196Qy9Fa7j81mcFWwYfzIsQdKuJcS581gZ4AnvKLPJK3s2Gzaq+LP2
         ZuKmarum+/rp/A2diS1SDPqa/7waURezEzZPCh+Ee+d1FjQx5KghYZmkMLYrilKrESUT
         jIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gx2Si0pYUSXNZERcMw0D1W2R8OsazX/t43mcqIr2AG0=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=rikZ8E5eUTyK50FblxiWDn97dch+QhOWXm/RoxDphGYNyReGFyDUrN3iLW5GzgQYW4
         76XZaanhQecULl9G9w732QormlTRptP2OSl3gDwZetnVHud+rZvOrguwMx/Tvpnp15HJ
         Szy/tsC/GlkCYezt++psHHoXkanaq2NdZ3Rzojo5t5sWZtWMeY1dtFM8Vmr9Ffkv9O2M
         i2Zoa0DDB5FsljBthiOraZ0lS3LBFZx7sKlaFRiVnjYRTCwnbhx1TzUl1FLyXZVzpor0
         yXQVpz2aHrMV6mTXo9m7++tDsIOInb5XWpDknNnjCHOWAlAzx7grPq8y/G2Ii2MsfJeS
         qA6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782774107; x=1783378907; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gx2Si0pYUSXNZERcMw0D1W2R8OsazX/t43mcqIr2AG0=;
        b=ZHTXNCtPE8+O5gtQsSULbwJ9w2d7hsEdpKvVJZ85+xQQjGg9QiGVgOAOJc2fzOPirl
         et6jb/KlC52HN2yT6ZwfVdjPKDmXYAHDm0aWVFZy5w4UlthIV6lpFBGraN1mxhonlazM
         zqQ8qa+rVL0bs8J/UGmd04THFKpgfA9xKTuKwW//yPfFB6JmftIIY3FaHNIA5W5ToUVz
         9WRKGZWE9XFUIffquBnYExC9VbfATztdAhg/Jw+hIcax16z4JZXI/Raysu1nW7BMTXzD
         TF9pZIGRKWJZzgKiL3cJuU/BWEK6XoGXm66RxsOMuHr0rvwrv1ElH5X1MAZbTWgjnslP
         GprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782774107; x=1783378907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gx2Si0pYUSXNZERcMw0D1W2R8OsazX/t43mcqIr2AG0=;
        b=Cz16w4R8JwiD/nuuXoCsPRh2gTcDseZUKkWcfv2N6WYNAwUA29bTNW2nvCTPPI4rPC
         6aGBN97uHKW05EnZ1C/yyJ3z2KyI4EQ4IPBnnmEjoy+kwXDrff366O6ZslU9iOIo7VWj
         Hhxe7qDT48hhdO60hookj4UXFOU7vZORSc54s2YXsDBRD2dx/ev6x7fvSqtxTWOG2oBh
         dXx0Bt18eib69ZsIGnZAebCMB6FBX0FFFclVZRu1Ib6BtrU6qROdcAkkOgJQK6Xbjdx4
         kB0lMpaHBMyDrgVcGu/9QLqCoF1CYm3iz0n8Qs43+Vl+eo7aIuhCLFWHsOzJFh9LGmIe
         1hzQ==
X-Gm-Message-State: AOJu0YzqDv0gEEBpajnGmvm0o6V+QSLaLt+SimJcixINZ4BXsAom5z6Z
	7T0YZeezIs3CQZH3EvoqCkg1+z9ub7ngQib/y4MSupG2nboHr/LBvs2GBjUkFJIDWHCz7kOf0a2
	Rc/qKCMJA72f0BtiTCZRfW3NyGPJsdo+3EQ==
X-Gm-Gg: AfdE7cnL/bFiGdQp9RU8egaCP15Me0BzVRkqvcavw2r1LR5bV9SKIEHjcS+im/9EWg1
	yriiAQou1wPPw5XKsueifTKjxgFXISuuje+rLB8d5yenmafaluOfcne/CWjWchvUhlv/hHfjzHn
	x2t5WE6mxcIrzh5+3JWSwaiJCj7HNFcCyOsH9dq3ht0MlIUIc2rZmoyKJVGTUtLRuZRTgE5Kzr9
	rXQLaIv//doSvbr356fYxVKXo/O105R1VTiO8aNHmp95e9iBbhtXTQLwWoqXqmjiZmRN9hJ2Ja6
	xkeHAnamKDU=
X-Received: by 2002:a05:690c:dc1:b0:80c:85b6:7644 with SMTP id
 00721157ae682-810dab0b72cmr15518357b3.57.1782774106579; Mon, 29 Jun 2026
 16:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260605120456.130264-1-peter.marko@siemens.com>
 <20260605120456.130264-2-peter.marko@siemens.com> <CAJdd5Gb_oFCfDcn_wQHk6XnJtG3+zMmKruOyqPrpVgYUi0T9AQ@mail.gmail.com>
 <AS8PR10MB50734EC9D7C1456FE1A143B9FD1C2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <CAJdd5GbCMsqA_BWmyWSpovu9Cj-ZYvxWrVmj2_p3+c04c5FUsw@mail.gmail.com>
 <AS8PR10MB50731323D15B57740A5A6714FDE82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <CAJdd5GYBAZ5LaUs+nrKrp3o4EweejFgPubnqJzw=ym=hwj9Tpg@mail.gmail.com> <AS8PR10MB507362F79560545D2411C3D7FDE82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507362F79560545D2411C3D7FDE82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 29 Jun 2026 17:01:35 -0600
X-Gm-Features: AVVi8Cdl5t3ZSdrL5s-4BpVykb9amfP2oWwadkqweJrp4D3d616DQPdqteCsHxY
Message-ID: <CAJdd5GaMa-p_xx5oAfQtQEaUiU=ACvvDW5u0_B4C9GUnheBE+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000056671c06556c7101"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 23:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239830

--00000000000056671c06556c7101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:55=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

>
>
>
>
> *From:* Joshua Watt <jpewhacker@gmail.com>
> *Sent:* Monday, June 29, 2026 10:03 PM
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
>
>
>
>
>
>
>
> On Mon, Jun 29, 2026 at 6:22=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
>
>
> > -----Original Message-----
> > From: Joshua Watt <jpewhacker@gmail.com>
> > Sent: Friday, June 26, 2026 4:11 PM
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packages
> >
> > On Mon, Jun 8, 2026 at 7:56=E2=80=AFAM Marko, Peter <Peter.Marko@siemen=
s.com>
> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Joshua Watt <jpewhacker@gmail.com>
> > > > Sent: Friday, June 5, 2026 4:16 PM
> > > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed
> packages
> > > >
> > > > On Fri, Jun 5, 2026 at 6:05=E2=80=AFAM Peter Marko via
> lists.openembedded.org
> > > > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > > > >
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >
> > > > > SPDX should not list packages which were removed from rootfs as
> installed.
> > > > >
> > > > > The list of installed packages does not contain them directly, bu=
t
> as
> > > > > dependencies of other installed packages.
> > > > >
> > > > > Siwtch them to "other" to keep them in SPDX as part of the build
> and
> > > > > installation process.
> > > >
> > > > I agree the packages should be removed from the rootfs, but using t=
he
> > > > method described.
> > > >
> > > > Instead, the list of removed packages should be passed to
> > > > collect_build_package_inputs(), and anything removed should skip
> > > > having it's files added to files_by_hash (but, should still be adde=
d
> > > > to build_deps, since it is a build dependency).
> > >
> > > I have tried several approaches here but all without success until
> now..
> > > The problem is that these removed packages are "rdepends" and not
> "depends".
> > > Thus in collect_build_package_inputs they are not present yet.
> > > And even if they would be, the rdepends would anyway add it back late=
r.
> > >
> > > SPDX entries for rdepend clauses are added in expand_collection
> function.
> > > I obviously cannot remove the rdepends clause when the recipe sbom is
> created.
> > >
> > > The best approach probably is to remove the rdepends when iterating
> over sbomx
> > in expand_collection.
> > > Would you agree when I try to send a patch in that direction?
> > > Or do you have any other suggestion?
> >
> > That's going to be tricky because you can't just remove the packages;
> > you also need to remove any reference to the package (e.g. if they are
> > in a relationship or somewhere else); otherwise the resulting document
> > will not be fully linked and you'll get errors when creating the SBoM.
> > For an example of what that would sort of look like, you can look at
> > the "duplicate" function which is used to replace references to
> > licenses and CreationInfo with equivalent ones to reduce the document
> > size.
> >
> > But, this is going to complicate an otherwise pretty simple merging
> > algorithm; I'm just not sure we can currently accurately express what
> > is going on here (packages being uninstalled at install time), and
> > until we have a good idea how to express it, I don't want to make it
> > more confusing by doing something weird (because, then people rely on
> > the weird behavior and get upset when it changes because we found a
> > better solution).
> >
>
> Little sad that there is currently no clear vision how to handle this
> scenario in our classes.
> In case you get a new idea, let me know and I can spend the effort to
> convert that to a patch.
>
> I have created https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16336
> for this so it's not forgotten.
>
>
>
> I think we will need something like this:
> https://github.com/spdx/spdx-3-model/pull/1297 but I will see if the SPDX
> community has a better idea in the next few weeks. Basically the idea wou=
ld
> be to add a relationship that indicates that the package was uninstalled
> from the rootfs, while preserving the runtime dependencies.
>
>
>
> That however does not help scarthgap/wrynose as it will be in spdx 3.1.0,
> correct?
>

Correct, but if we can figure out it _will_ be done in 3.1, we can
implement a similar mechanism in 3.0.1 for the older versions using
extensions etc. I just don't want to make up something that isn't
expressiable any other way than by custom extensions.


>
>
>
> Peter
>
> > >
> > > >
> > > > This will prevent that rootfs package from "containing" the files f=
or
> > > > removed packages, and break the linkage between the rootfs and the
> > > > removed packages.
> > > >
> > > > I'm not exactly sure the reasoning behind changing the type the
> > > > "other", but we should not be doing that.
> > >
> > > Well, "other" because there was no good value for that available in
> enum
> > (installation helper).
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > ---
> > > > >  meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
> > > > >  meta/lib/oe/rootfs.py                             |  6 ++++++
> > > > >  meta/lib/oe/sbom30.py                             |  8 +++++++-
> > > > >  meta/lib/oe/spdx30_tasks.py                       | 14
> +++++++++++++-
> > > > >  4 files changed, 33 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> b/meta/classes-
> > > > recipe/create-spdx-image-3.0.bbclass
> > > > > index 15a91e90e2..dfbd2961b3 100644
> > > > > --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > > > > +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > > > > @@ -6,6 +6,7 @@
> > > > >  # SPDX image tasks
> > > > >
> > > > >  SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> > > > > +SPDX_ROOTFS_REMOVED_PACKAGES =3D "${SPDXDIR}/rootfs-removed-
> > > > packages.json"
> > > > >  SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
> > > > >  SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
> > > > >
> > > > > @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
> > > > >      from oe.rootfs import image_list_installed_packages
> > > > >
> > > > >      root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES")=
)
> > > > > +    root_removed_packages_file =3D
> > > > Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
> > > > >
> > > > >      packages =3D image_list_installed_packages(d)
> > > > >      if not packages:
> > > > >          packages =3D {}
> > > > >
> > > > > +    removed_packages =3D (d.getVar("ROOTFS_REMOVED_PACKAGES") or
> > > > "").split()
> > > > > +
> > > > >      root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DT=
rue)
> > > > >      with root_packages_file.open("w") as f:
> > > > >          json.dump(packages, f)
> > > > > +
> > > > > +    with root_removed_packages_file.open("w") as f:
> > > > > +        json.dump(removed_packages, f)
> > > > >  }
> > > > >  ROOTFS_POSTUNINSTALL_COMMAND =3D+
> > "spdx_collect_rootfs_packages"
> > > > >
> > > > > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > > > > index 5eee48f587..b8830596ed 100644
> > > > > --- a/meta/lib/oe/rootfs.py
> > > > > +++ b/meta/lib/oe/rootfs.py
> > > > > @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3DABCMeta):
> > > > >
> > > > >
> > > > >      def _uninstall_unneeded(self):
> > > > > +        removed_pkgs =3D set()
> > > > > +
> > > > >          # Remove the run-postinsts package if no delayed
> postinsts are found
> > > > >          delayed_postinsts =3D self._get_delayed_postinsts()
> > > > >          if delayed_postinsts is None:
> > > > >              if
> > > >
> os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-
> > postinsts"))
> > > > or
> >
> os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/ru=
n-
> > > > postinsts.service")):
> > > > > +                removed_pkgs.add("run-postinsts")
> > > > >                  self.pm.remove(["run-postinsts"])
> > > > >
> > > > >          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES",
> "read-only-rootfs",
> > > > > @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> > > > >              # to be uninstalled or to be managed correctly
> otherwise.
> > > > >              provider =3D
> self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
> > > > >              pkgs_to_remove =3D sorted([pkg for pkg in
> pkgs_installed if pkg in
> > > > unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)
> > > > > +            removed_pkgs.update(pkgs_to_remove)
> > > > >
> > > > >              # update-alternatives provider is removed in its own
> remove()
> > > > >              # call because all package managers do not guarantee
> the packages
> > > > > @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DABCMeta):
> > > > >              if len(pkgs_to_remove) > 0:
> > > > >                  self.pm.remove([pkgs_to_remove[-1]], False)
> > > > >
> > > > > +        self.d.setVar("ROOTFS_REMOVED_PACKAGES", "
> > > > ".join(sorted(removed_pkgs)))
> > > > > +
> > > > >          if delayed_postinsts:
> > > > >              self._save_postinsts()
> > > > >              if image_rorfs:
> > > > > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > > > > index b379ff947c..4fa32266fa 100644
> > > > > --- a/meta/lib/oe/sbom30.py
> > > > > +++ b/meta/lib/oe/sbom30.py
> > > > > @@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *,
> required=3DFalse):
> > > > >      return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)),
> required=3Drequired)
> > > > >
> > > > >
> > > > > -def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> > > > > +def create_sbom(d, name, root_elements, add_objectsets=3D[],
> > > > removed_packages=3D[]):
> > > > >      objset =3D ObjectSet.new_objset(d, name)
> > > > >
> > > > >      sbom =3D objset.add(
> > > > > @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements,
> > > > add_objectsets=3D[]):
> > > > >              + "\n  ".join(sorted(list(missing_spdxids)))
> > > > >          )
> > > > >
> > > > > +    if removed_packages:
> > > > > +        for pkg in
> objset.foreach_type(oe.spdx30.software_Package):
> > > > > +            if pkg.name in removed_packages and
> pkg.software_primaryPurpose
> > =3D=3D
> > > > oe.spdx30.software_SoftwarePurpose.install:
> > > > > +                pkg.software_primaryPurpose =3D
> > > > oe.spdx30.software_SoftwarePurpose.other
> > > > > +                bb.note("Reclassified removed package %s SPDX
> entry from install
> > to
> > > > other" % pkg.name)
> > > > > +
> > > > >      # Filter out internal extensions from final SBoMs
> > > > >      objset.remove_internal_extensions()
> > > > >
> > > > > diff --git a/meta/lib/oe/spdx30_tasks.py
> b/meta/lib/oe/spdx30_tasks.py
> > > > > index 7cc46d579b..18c68f47de 100644
> > > > > --- a/meta/lib/oe/spdx30_tasks.py
> > > > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > > > @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
> > > > >      image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> > > > >      imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
> > > > >      machine =3D d.getVar("MACHINE")
> > > > > +    root_removed_packages_file =3D
> > > > Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
> > > > >
> > > > >      spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> > > > >
> > > > > @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
> > > > >      for o in image_objset.foreach_root(oe.spdx30.software_File):
> > > > >          root_elements.append(oe.sbom30.get_element_link_id(o))
> > > > >
> > > > > -    objset, sbom =3D oe.sbom30.create_sbom(d, image_name,
> root_elements)
> > > > > +    try:
> > > > > +        with root_removed_packages_file.open("r") as f:
> > > > > +            removed_packages =3D json.load(f)
> > > > > +    except FileNotFoundError:
> > > > > +        removed_packages =3D []
> > > > > +
> > > > > +    objset, sbom =3D oe.sbom30.create_sbom(
> > > > > +        d,
> > > > > +        image_name,
> > > > > +        root_elements,
> > > > > +        removed_packages=3Dremoved_packages,
> > > > > +    )
> > > > >
> > > > >      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is
> defined
> > > > >      supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DF=
alse)
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#238166):
> > https://lists.openembedded.org/g/openembedded-
> > > > core/message/238166
> > > > > Mute This Topic:
> https://lists.openembedded.org/mt/119660891/3616693
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> > > > [JPEWhacker@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
>
>

--00000000000056671c06556c7101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 29,=
 2026 at 4:55=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@sie=
mens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div class=3D"msg4950663986882234481">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_4950663986882234481WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Joshua Watt &lt;<a href=3D"mailto:=
jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;
<br>
<b>Sent:</b> Monday, June 29, 2026 10:03 PM<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed packa=
ges<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Jun 29, 2026 at 6:22<span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>AM Marko, Peter &lt;<a hre=
f=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=
=3D"_blank">jpewhacker@gmail.com</a>&gt;<br>
&gt; Sent: Friday, June 26, 2026 4:11 PM<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle removed package=
s<br>
&gt; <br>
&gt; On Mon, Jun 8, 2026 at 7:56<span style=3D"font-family:&quot;Arial&quot=
;,sans-serif">=E2=80=AF</span>AM Marko, Peter &lt;<a href=3D"mailto:Peter.M=
arko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com=
" target=3D"_blank">jpewhacker@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Sent: Friday, June 5, 2026 4:16 PM<br>
&gt; &gt; &gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Pet=
er.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">
openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; Subject: Re: [OE-core] [PATCH 2/2] rootfs,spdx: handle remov=
ed packages<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, Jun 5, 2026 at 6:05<span style=3D"font-family:&quot;=
Arial&quot;,sans-serif">=E2=80=AF</span>AM Peter Marko via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt; &gt; &gt; &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openem=
bedded.org" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@sie=
mens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; SPDX should not list packages which were removed from r=
ootfs as installed.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The list of installed packages does not contain them di=
rectly, but as<br>
&gt; &gt; &gt; &gt; dependencies of other installed packages.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Siwtch them to &quot;other&quot; to keep them in SPDX a=
s part of the build and<br>
&gt; &gt; &gt; &gt; installation process.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I agree the packages should be removed from the rootfs, but =
using the<br>
&gt; &gt; &gt; method described.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Instead, the list of removed packages should be passed to<br=
>
&gt; &gt; &gt; collect_build_package_inputs(), and anything removed should =
skip<br>
&gt; &gt; &gt; having it&#39;s files added to files_by_hash (but, should st=
ill be added<br>
&gt; &gt; &gt; to build_deps, since it is a build dependency).<br>
&gt; &gt;<br>
&gt; &gt; I have tried several approaches here but all without success unti=
l now..<br>
&gt; &gt; The problem is that these removed packages are &quot;rdepends&quo=
t; and not &quot;depends&quot;.<br>
&gt; &gt; Thus in collect_build_package_inputs they are not present yet.<br=
>
&gt; &gt; And even if they would be, the rdepends would anyway add it back =
later.<br>
&gt; &gt;<br>
&gt; &gt; SPDX entries for rdepend clauses are added in expand_collection f=
unction.<br>
&gt; &gt; I obviously cannot remove the rdepends clause when the recipe sbo=
m is created.<br>
&gt; &gt;<br>
&gt; &gt; The best approach probably is to remove the rdepends when iterati=
ng over sbomx<br>
&gt; in expand_collection.<br>
&gt; &gt; Would you agree when I try to send a patch in that direction?<br>
&gt; &gt; Or do you have any other suggestion?<br>
&gt; <br>
&gt; That&#39;s going to be tricky because you can&#39;t just remove the pa=
ckages;<br>
&gt; you also need to remove any reference to the package (e.g. if they are=
<br>
&gt; in a relationship or somewhere else); otherwise the resulting document=
<br>
&gt; will not be fully linked and you&#39;ll get errors when creating the S=
BoM.<br>
&gt; For an example of what that would sort of look like, you can look at<b=
r>
&gt; the &quot;duplicate&quot; function which is used to replace references=
 to<br>
&gt; licenses and CreationInfo with equivalent ones to reduce the document<=
br>
&gt; size.<br>
&gt; <br>
&gt; But, this is going to complicate an otherwise pretty simple merging<br=
>
&gt; algorithm; I&#39;m just not sure we can currently accurately express w=
hat<br>
&gt; is going on here (packages being uninstalled at install time), and<br>
&gt; until we have a good idea how to express it, I don&#39;t want to make =
it<br>
&gt; more confusing by doing something weird (because, then people rely on<=
br>
&gt; the weird behavior and get upset when it changes because we found a<br=
>
&gt; better solution).<br>
&gt; <br>
<br>
Little sad that there is currently no clear vision how to handle this scena=
rio in our classes.<br>
In case you get a new idea, let me know and I can spend the effort to conve=
rt that to a patch.<br>
<br>
I have created <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D16336" target=3D"_blank">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16336</a> for this so i=
t&#39;s not forgotten.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I think we will need something like this:=C2=A0<a hr=
ef=3D"https://github.com/spdx/spdx-3-model/pull/1297" target=3D"_blank">htt=
ps://github.com/spdx/spdx-3-model/pull/1297</a> but I will see if the SPDX =
community has a better idea in the next few weeks. Basically
 the idea would be to add a relationship that indicates that the package wa=
s uninstalled from the rootfs, while preserving the runtime dependencies.<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">That however does not help scarthgap/wrynose as it will=
 be in spdx 3.1.0, correct?</span></p></div></div></div></div></div></div><=
/div></blockquote><div><br></div><div>Correct, but if we can figure out it =
_will_ be done in 3.1, we can implement a similar mechanism in 3.0.1 for th=
e older versions using extensions etc. I just don&#39;t want to make up som=
ething that isn&#39;t expressiable any other way than by custom extensions.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"msg4950663986882234481"><div lang=3D"EN-US" style=3D"overflow-w=
rap: break-word;"><div class=3D"m_4950663986882234481WordSection1"><div sty=
le=3D"border-width:medium medium medium 1.5pt;border-style:none none none s=
olid;border-color:currentcolor currentcolor currentcolor blue;padding:0cm 0=
cm 0cm 4pt"><div><div><div><p class=3D"MsoNormal"><span style=3D"font-size:=
10pt;font-family:&quot;Arial&quot;,sans-serif"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><br>
Peter<br>
<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This will prevent that rootfs package from &quot;containing&=
quot; the files for<br>
&gt; &gt; &gt; removed packages, and break the linkage between the rootfs a=
nd the<br>
&gt; &gt; &gt; removed packages.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m not exactly sure the reasoning behind changing the t=
ype the<br>
&gt; &gt; &gt; &quot;other&quot;, but we should not be doing that.<br>
&gt; &gt;<br>
&gt; &gt; Well, &quot;other&quot; because there was no good value for that =
available in enum<br>
&gt; (installation helper).<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.=
marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/create-spdx-image-3.0.bbclass=
 |=C2=A0 7 +++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 ++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/lib/oe/sbom30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++++++-<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++=
+++++-<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 33 insertions(+), 2 deletions(-)=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/create-spdx-image-3.0.=
bbclass b/meta/classes-<br>
&gt; &gt; &gt; recipe/create-spdx-image-3.0.bbclass<br>
&gt; &gt; &gt; &gt; index 15a91e90e2..dfbd2961b3 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass=
<br>
&gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass=
<br>
&gt; &gt; &gt; &gt; @@ -6,6 +6,7 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 # SPDX image tasks<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 SPDX_ROOTFS_PACKAGES =3D &quot;${SPDXDIR}/rootfs-=
packages.json&quot;<br>
&gt; &gt; &gt; &gt; +SPDX_ROOTFS_REMOVED_PACKAGES =3D &quot;${SPDXDIR}/root=
fs-removed-<br>
&gt; &gt; &gt; packages.json&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 SPDXIMAGEDEPLOYDIR =3D &quot;${SPDXDIR}/image-dep=
loy&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 SPDXROOTFSDEPLOY =3D &quot;${SPDXDIR}/rootfs-depl=
oy&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages=
() {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 from oe.rootfs import image_list_in=
stalled_packages<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 root_packages_file =3D Path(d.getVa=
r(&quot;SPDX_ROOTFS_PACKAGES&quot;))<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 root_removed_packages_file =3D<br>
&gt; &gt; &gt; Path(d.getVar(&quot;SPDX_ROOTFS_REMOVED_PACKAGES&quot;))<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 packages =3D image_list_installed_p=
ackages(d)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if not packages:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D {}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 removed_packages =3D (d.getVar(&quot;ROO=
TFS_REMOVED_PACKAGES&quot;) or<br>
&gt; &gt; &gt; &quot;&quot;).split()<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 root_packages_file.parent.mkdir(par=
ents=3DTrue, exist_ok=3DTrue)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 with root_packages_file.open(&quot;=
w&quot;) as f:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(packages, f=
)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 with root_removed_packages_file.open(&qu=
ot;w&quot;) as f:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(removed_packages=
, f)<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 ROOTFS_POSTUNINSTALL_COMMAND =3D+<br>
&gt; &quot;spdx_collect_rootfs_packages&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs=
.py<br>
&gt; &gt; &gt; &gt; index 5eee48f587..b8830596ed 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/lib/oe/rootfs.py<br>
&gt; &gt; &gt; &gt; +++ b/meta/lib/oe/rootfs.py<br>
&gt; &gt; &gt; &gt; @@ -261,10 +261,13 @@ class Rootfs(object, metaclass=3D=
ABCMeta):<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def _uninstall_unneeded(self):<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 removed_pkgs =3D set()<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove the run-post=
insts package if no delayed postinsts are found<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delayed_postinsts =3D=
 self._get_delayed_postinsts()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if delayed_postinsts =
is None:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if<br>
&gt; &gt; &gt; os.path.exists(self.d.expand(&quot;${IMAGE_ROOTFS}${sysconfd=
ir}/init.d/run-<br>
&gt; postinsts&quot;))<br>
&gt; &gt; &gt; or<br>
&gt; os.path.exists(self.d.expand(&quot;${IMAGE_ROOTFS}${systemd_system_uni=
tdir}/run-<br>
&gt; &gt; &gt; postinsts.service&quot;)):<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 removed_pkgs.add(&quot;run-postinsts&quot;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.pm.remove([&quot;run-postinsts&quot;])<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_rorfs =3D bb.ut=
ils.contains(&quot;IMAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,<br>
&gt; &gt; &gt; &gt; @@ -285,6 +288,7 @@ class Rootfs(object, metaclass=3DAB=
CMeta):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to be=
 uninstalled or to be managed correctly otherwise.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 provide=
r =3D self.d.getVar(&quot;VIRTUAL-RUNTIME_update-alternatives&quot;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs_to=
_remove =3D sorted([pkg for pkg in pkgs_installed if pkg in<br>
&gt; &gt; &gt; unneeded_pkgs], key=3Dlambda x: x =3D=3D provider)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 removed_pkgs=
.update(pkgs_to_remove)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # updat=
e-alternatives provider is removed in its own remove()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # call =
because all package managers do not guarantee the packages<br>
&gt; &gt; &gt; &gt; @@ -296,6 +300,8 @@ class Rootfs(object, metaclass=3DAB=
CMeta):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(=
pkgs_to_remove) &gt; 0:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.pm.remove([pkgs_to_remove[-1]], False)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d.setVar(&quot;ROOTFS=
_REMOVED_PACKAGES&quot;, &quot;<br>
&gt; &gt; &gt; &quot;.join(sorted(removed_pkgs)))<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if delayed_postinsts:=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._s=
ave_postinsts()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if imag=
e_rorfs:<br>
&gt; &gt; &gt; &gt; diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30=
.py<br>
&gt; &gt; &gt; &gt; index b379ff947c..4fa32266fa 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/lib/oe/sbom30.py<br>
&gt; &gt; &gt; &gt; +++ b/meta/lib/oe/sbom30.py<br>
&gt; &gt; &gt; &gt; @@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *, =
required=3DFalse):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return find_jsonld(d, *jsonld_hash_=
path(hash_id(spdxid)), required=3Drequired)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -def create_sbom(d, name, root_elements, add_objectsets=
=3D[]):<br>
&gt; &gt; &gt; &gt; +def create_sbom(d, name, root_elements, add_objectsets=
=3D[],<br>
&gt; &gt; &gt; removed_packages=3D[]):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 objset =3D ObjectSet.new_objset(d, =
name)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 sbom =3D objset.add(<br>
&gt; &gt; &gt; &gt; @@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_el=
ements,<br>
&gt; &gt; &gt; add_objectsets=3D[]):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + &quot=
;\n=C2=A0 &quot;.join(sorted(list(missing_spdxids)))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if removed_packages:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in objset.foreach_=
type(oe.spdx30.software_Package):<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=
=3D"http://pkg.name" target=3D"_blank">pkg.name</a> in removed_packages and=
 pkg.software_primaryPurpose<br>
&gt; =3D=3D<br>
&gt; &gt; &gt; oe.spdx30.software_SoftwarePurpose.install:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pkg.software_primaryPurpose =3D<br>
&gt; &gt; &gt; oe.spdx30.software_SoftwarePurpose.other<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bb.note(&quot;Reclassified removed package %s SPDX entry from install<b=
r>
&gt; to<br>
&gt; &gt; &gt; other&quot; % <a href=3D"http://pkg.name" target=3D"_blank">=
pkg.name</a>)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Filter out internal extensions fr=
om final SBoMs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 objset.remove_internal_extensions()=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/=
spdx30_tasks.py<br>
&gt; &gt; &gt; &gt; index 7cc46d579b..18c68f47de 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/lib/oe/spdx30_tasks.py<br>
&gt; &gt; &gt; &gt; +++ b/meta/lib/oe/spdx30_tasks.py<br>
&gt; &gt; &gt; &gt; @@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):<br=
>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 image_link_name =3D d.getVar(&quot;=
IMAGE_LINK_NAME&quot;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 imgdeploydir =3D Path(d.getVar(&quo=
t;SPDXIMAGEDEPLOYDIR&quot;))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 machine =3D d.getVar(&quot;MACHINE&=
quot;)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 root_removed_packages_file =3D<br>
&gt; &gt; &gt; Path(d.getVar(&quot;SPDX_ROOTFS_REMOVED_PACKAGES&quot;))<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 spdx_path =3D imgdeploydir / (image=
_name + &quot;.spdx.json&quot;)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 for o in image_objset.foreach_root(=
oe.spdx30.software_File):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_elements.append(=
oe.sbom30.get_element_link_id(o))<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 objset, sbom =3D oe.sbom30.create_sbom(d=
, image_name, root_elements)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with root_removed_packages=
_file.open(&quot;r&quot;) as f:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 removed_pack=
ages =3D json.load(f)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 except FileNotFoundError:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 removed_packages =3D []<br=
>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 objset, sbom =3D oe.sbom30.create_sbom(<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_name,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_elements,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 removed_packages=3Dremoved=
_packages,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Set supplier on root elements if =
SPDX_IMAGE_SUPPLIER is defined<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 supplier =3D objset.new_agent(&quot=
;SPDX_IMAGE_SUPPLIER&quot;, add=3DFalse)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; &gt; View/Reply Online (#238166):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-" target=3D"_=
blank">https://lists.openembedded.org/g/openembedded-</a><br>
&gt; &gt; &gt; core/message/238166<br>
&gt; &gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.=
org/mt/119660891/3616693" target=3D"_blank">
https://lists.openembedded.org/mt/119660891/3616693</a><br>
&gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowne=
r@lists.openembedded.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a><br>
&gt; &gt; &gt; [<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">J=
PEWhacker@gmail.com</a>]<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt;<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>

--00000000000056671c06556c7101--

