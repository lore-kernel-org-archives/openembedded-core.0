Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web08.7424.1627419921095888928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 14:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=b8MHtjyp;
 spf=pass (domain: taitradio.com, ip: 209.85.166.50, mailfrom: douglas.royds@taitradio.com)
Received: by mail-io1-f50.google.com with SMTP id f11so384511ioj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IzGxNtzLMRoqHq084HWD2nyX2AGKPvQ4iBoU1W6pgMY=;
        b=b8MHtjyp4oiYpjlQn+r88SdCOffs8l/20NZcDQYfmWjVx8GjEIggAG5EFyU3sxfQPB
         LjtsTyl0MeZ118roYoGD6x+2kwfXv0JCrEyUnDFcUUbITFYKZWMd+OlFvPGXs3hMFhQm
         Gr52rIySKW++fjZp0kSsRyOk5pzRzIOoVIhAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IzGxNtzLMRoqHq084HWD2nyX2AGKPvQ4iBoU1W6pgMY=;
        b=l0xu0tDTRaqj2fksWd0NN2lKq82ySpITaXNE6BoDkriL+yej8MUAZ4GYyQ8xmodHfz
         3ETOyD18ZZFG8n3iE2huC1SdjPLjrMMlDOLK4etdtyiDAZe26SA+pQjavSc2pOvIaZ9M
         LsYYVclMiOmr2L7zZHlwtNpXUV6bV1oqGIxD218VyYEc5LQu0NAu4UexW4WXqe0n/sm8
         UY+QcS0cJy/rkB4BVYbS6uFneXujwWSgvKItlt3S4i0q3BKT/uGRaVysCe1kzit7n3j0
         E0b9wUvn280M5qU/JUpcufMS2pfv+PifbWoEPMwoVNoOANvkiWSFFoa8CC+To9PMgo2m
         VKow==
X-Gm-Message-State: AOAM532cPpSShRnKNgaNzj5xfkcM6fDW291KogrX17D2ft5SLD1hkcD9
	GKm1rs1rfm2V3Qlhb83+qyY4SOPpeGPNPFIE2WnEv66en6nJb/Ou0QMQRkEhuMt6+ZYlmeVtlaf
	Hgj7uic6Hkd3mM2goYOWFR+4B+84d52S8/nB2VP12KUWjr39d
X-Google-Smtp-Source: ABdhPJxM8zgHh1r29qAzW/gjd7mBkCP4X3ukTSnjQeRRqoZP3DqZdFNPVA7n6teCEjYtxQgQSOvb8ZtUYq0jVl17nko=
X-Received: by 2002:a05:6638:3a1:: with SMTP id z1mr22566537jap.77.1627419918992;
 Tue, 27 Jul 2021 14:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210701214437.732187-1-douglas.royds@taitradio.com> <YN8IBAtecvRvHaNi@piout.net>
In-Reply-To: <YN8IBAtecvRvHaNi@piout.net>
From: "Douglas" <douglas.royds@taitradio.com>
Date: Wed, 28 Jul 2021 09:05:08 +1200
Message-ID: <CAFimOt4FEtZdEqC9sQOqnrfuy5nQ7OT_kvWNfuaiJ9G1A5F4hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] license_image: Use sstate to populate license directory
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 3 Jul 2021 at 00:35, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 02/07/2021 09:44:37+1200, Douglas via lists.openembedded.org wrote:
> > We were getting an endlessly-growing list of directories in
> > build/tmp/deploy/licenses/ of the form myimage-mymachine-2021062901020=
3.
> > Use the normal sstate behaviour to clean them. Brings license_image in
> > line with the do_populate_lic behaviour in license.bbclass.
> >
> > We must only clean the (new) WORKDIR/license-destdir at do_rootfs time=
,
> > as the write_package_manifest and license_create_manifest rootfs
> > postprocess commands write the package.manifest and license.manifest
> > files at that time. They get stored in the sstate cache at
> > do_populate_lic_deploy time, alongside the image_license.manifest.
> >
> > Looks like this:
> >
> >     license-destdir/
> >     =E2=94=9C=E2=94=80=E2=94=80 myimage-mymachine -> myimage-mymachine=
-20210629025723/
> >     =E2=94=94=E2=94=80=E2=94=80 myimage-mymachine-20210629025723/
> >         =E2=94=9C=E2=94=80=E2=94=80 image_license.manifest
> >         =E2=94=9C=E2=94=80=E2=94=80 license.manifest
> >         =E2=94=94=E2=94=80=E2=94=80 package.manifest
> >
>
> This ran on the autobuilders and I do believe it is the cause of the
> following failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/2269/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/2247/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/2282/st=
eps/14/logs/stdio
>
> Those seem to be pseudo aborts because the link is changing.

Why would pseudo abort when the link changes? Replacing a symlink
seems harmless enough ... any ideas?


> > Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> > ---
> >  meta/classes/license_image.bbclass | 38 +++++++++++++++++------------=
-
> >  1 file changed, 22 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/classes/license_image.bbclass b/meta/classes/license=
_image.bbclass
> > index 73cebb4d55e..30204b47b1c 100644
> > --- a/meta/classes/license_image.bbclass
> > +++ b/meta/classes/license_image.bbclass
> > @@ -1,8 +1,9 @@
> >  ROOTFS_LICENSE_DIR =3D "${IMAGE_ROOTFS}/usr/share/common-licenses"
> > +LICSSTATEDIR =3D "${WORKDIR}/license-destdir/"
> >
> >  python write_package_manifest() {
> >      # Get list of installed packages
> > -    license_image_dir =3D d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME=
}')
> > +    license_image_dir =3D d.expand('${LICSSTATEDIR}/${IMAGE_NAME}')
> >      bb.utils.mkdirhier(license_image_dir)
> >      from oe.rootfs import image_list_installed_packages
> >      from oe.utils import format_pkg_list
> > @@ -32,7 +33,7 @@ python license_create_manifest() {
> >              pkg_lic_name =3D "LICENSE_" + pkg_name
> >              pkg_dic[pkg_name]["LICENSE"] =3D pkg_dic[pkg_name][pkg_li=
c_name]
> >
> > -    rootfs_license_manifest =3D os.path.join(d.getVar('LICENSE_DIRECT=
ORY'),
> > +    rootfs_license_manifest =3D os.path.join(d.getVar('LICSSTATEDIR')=
,
> >                          d.getVar('IMAGE_NAME'), 'license.manifest')
> >      write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=
=3DTrue)
> >  }
> > @@ -196,23 +197,18 @@ def license_deployed_manifest(d):
> >                  key,val =3D line.split(": ", 1)
> >                  man_dic[dep][key] =3D val[:-1]
> >
> > -    lic_manifest_dir =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
> > -                                    d.getVar('IMAGE_NAME'))
> > -    bb.utils.mkdirhier(lic_manifest_dir)
> > -    image_license_manifest =3D os.path.join(lic_manifest_dir, 'image_=
license.manifest')
> > +    licsstatedir =3D d.getVar('LICSSTATEDIR')
> > +    image_name =3D d.getVar('IMAGE_NAME')
> > +    image_license_manifest =3D os.path.join(licsstatedir, image_name,=
 'image_license.manifest')
> >      write_license_files(d, image_license_manifest, man_dic, rootfs=3D=
False)
> >
> >      link_name =3D d.getVar('IMAGE_LINK_NAME')
> >      if link_name:
> > -        lic_manifest_symlink_dir =3D os.path.join(d.getVar('LICENSE_D=
IRECTORY'),
> > -                                    link_name)
> > -        # remove old symlink
> > -        if os.path.islink(lic_manifest_symlink_dir):
> > -            os.unlink(lic_manifest_symlink_dir)
> > -
> > -        # create the image dir symlink
> > -        if lic_manifest_dir !=3D lic_manifest_symlink_dir:
> > -            os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
> > +        if image_name !=3D link_name:
> > +            link_path =3D os.path.join(licsstatedir, link_name)
> > +            if os.path.lexists(link_path):
> > +                os.remove(link_path)
> > +            os.symlink(image_name, link_path)
> >
> >  def get_deployed_dependencies(d):
> >      """
> > @@ -260,14 +256,24 @@ def get_deployed_files(man_file):
> >      return dep_files
> >
> >  ROOTFS_POSTPROCESS_COMMAND_prepend =3D "write_package_manifest; licen=
se_create_manifest; "
> > +do_rootfs[cleandirs] +=3D "${LICSSTATEDIR}"
> >  do_rootfs[recrdeptask] +=3D "do_populate_lic"
> >
> >  python do_populate_lic_deploy() {
> >      license_deployed_manifest(d)
> >  }
> > -
> >  addtask populate_lic_deploy before do_build after do_image_complete
> > +
> > +SSTATETASKS +=3D "do_populate_lic_deploy"
> > +do_populate_lic_deploy[dirs] =3D "${LICSSTATEDIR}/${IMAGE_NAME}"
> >  do_populate_lic_deploy[recrdeptask] +=3D "do_populate_lic do_deploy"
> > +do_populate_lic_deploy[sstate-inputdirs] =3D "${LICSSTATEDIR}"
> > +do_populate_lic_deploy[sstate-outputdirs] =3D "${LICENSE_DIRECTORY}/"
> > +
> > +python do_populate_lic_deploy_setscene () {
> > +    sstate_setscene(d)
> > +}
> > +addtask do_populate_lic_deploy_setscene
> >
> >  python license_qa_dead_symlink() {
> >      import os
> > --
> > 2.25.1
> >
>
> >
> >=20
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer=20
<http://www.taitradio.com/email_disclaimer>
