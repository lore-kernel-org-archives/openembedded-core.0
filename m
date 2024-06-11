Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A669C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 08:50:35 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.4886.1718095833895449504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 01:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=Y1Brou9Q;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9w2fbi5W8k0OQafAqruSvPUCyylcmcWb0RW83xJMNB0=; b=Y1Brou9Qf6231gRfTbnFnbZAe7
	w2BwmU56cFOkWo05PdD1psAbOW5id7tgyE3hi3eb9UIGtIr20Ixw156l6s4OV1VTs11emcuyPwjGT
	Nhb8uNrSfINbg/mZnEF5WL7YkXHDVtYnfyfbx54EvnrvxOYwZMnbG5OnmzNLR3EIoqy8taNOll5CJ
	snSxHgvzvHBqV/d+nOdCRP4Zogp/WmBKVi5egyp8PGZPkNIFALaMDyJ14iukSIuu40h0V4vIh7fGQ
	0/SDPmiJkbQq1hGXcyWVZN4gGCYaU2+sGAUJAdz5g2yoYt243fYupxOVoz5gpKuqcHE+DDX4xddqs
	5sS865wA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sGxD9-0000XF-Lb; Tue, 11 Jun 2024 10:50:32 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sGxD6-000Gvc-1Z;
	Tue, 11 Jun 2024 10:50:31 +0200
Message-ID: <18ca7d1f2c2873d147477dfe75ac1e5c21e33648.camel@geanix.com>
Subject: Re: [OE-core][PATCH 1/6] classes-recipe/image: Add image file
 manifest
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2024 10:50:31 +0200
In-Reply-To: <20240610214456.2757397-2-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
	 <20240610214456.2757397-2-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27302/Mon Jun 10 10:25:43 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200495

Hi Joshua,

Two minor nits below.

On Mon, 2024-06-10 at 15:41 -0600, Joshua Watt wrote:
> Downstream tasks may want to know what image files were written by
> the
> do_image family of tasks (e.g. SPDX) so have each task write out a
> manifest file that describes the files it produced, then aggregate
> them
> in do_image_complete
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/classes-recipe/image.bbclass | 61
> +++++++++++++++++++++++++++++++
> =C2=A01 file changed, 61 insertions(+)
>=20
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-
> recipe/image.bbclass
> index 28be6c63623..122af2b0328 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -88,6 +88,11 @@ PACKAGE_INSTALL_ATTEMPTONLY ?=3D
> "${FEATURE_INSTALL_OPTIONAL}"
> =C2=A0
> =C2=A0IMGDEPLOYDIR =3D "${WORKDIR}/deploy-${PN}-image-complete"
> =C2=A0
> +IMGMANIFESTDIR =3D "${WORKDIR}/image-task-manifest"
> +
> +IMAGE_FILE_MANIFEST_DIR =3D "${WORKDIR}/deploy-image-file-manifest"
> +IMAGE_FILE_MANIFEST =3D "${IMAGE_FILE_MANIFEST_DIR}/manifest.json"
> +
> =C2=A0# Images are generally built explicitly, do not need to be part of
> world.
> =C2=A0EXCLUDE_FROM_WORLD =3D "1"
> =C2=A0
> @@ -277,14 +282,31 @@ fakeroot python do_image () {
> =C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process(d, pre_process_cmds)
> =C2=A0}
> =C2=A0do_image[dirs] =3D "${TOPDIR}"
> +do_image[cleandirs] =3D "${IMGMANIFESTDIR}"

Should this be an append (i.e. +=3D) to avoid conflicting with recipes ?

> =C2=A0addtask do_image after do_rootfs
> =C2=A0
> =C2=A0fakeroot python do_image_complete () {
> =C2=A0=C2=A0=C2=A0=C2=A0 from oe.utils import execute_pre_post_process
> +=C2=A0=C2=A0=C2=A0 from pathlib import Path
> +=C2=A0=C2=A0=C2=A0 import json
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 post_process_cmds =3D d.getVar("IMAGE_POSTPROCES=
S_COMMAND")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process(d, post_process_cmds)
> +
> +=C2=A0=C2=A0=C2=A0 image_manifest_dir =3D Path(d.getVar('IMGMANIFESTDIR'=
))
> +
> +=C2=A0=C2=A0=C2=A0 data =3D []
> +
> +=C2=A0=C2=A0=C2=A0 for taskname in bb.build.preceedtask("do_image_comple=
te", False,
> d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manifest_path =3D image_manif=
est_dir / (taskname + ".json")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not manifest_path.exists()=
:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with manifest_path.open("r") =
as f:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.=
extend(json.load(f))
> +
> +=C2=A0=C2=A0=C2=A0 with open(d.getVar("IMAGE_FILE_MANIFEST"), "w") as f:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json.dump(data, f)
> =C2=A0}
> =C2=A0do_image_complete[dirs] =3D "${TOPDIR}"
> =C2=A0SSTATETASKS +=3D "do_image_complete"
> @@ -292,6 +314,8 @@ SSTATE_SKIP_CREATION:task-image-complete =3D '1'
> =C2=A0do_image_complete[sstate-inputdirs] =3D "${IMGDEPLOYDIR}"
> =C2=A0do_image_complete[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
> =C2=A0do_image_complete[stamp-extra-info] =3D "${MACHINE_ARCH}"
> +do_image_complete[sstate-plaindirs] =3D=C2=A0 "${IMAGE_FILE_MANIFEST_DIR=
}"
> +do_image_complete[dirs] =3D "${IMAGE_FILE_MANIFEST_DIR}"

Same here...

Thanks,
Martin

> =C2=A0addtask do_image_complete after do_image before do_build
> =C2=A0python do_image_complete_setscene () {
> =C2=A0=C2=A0=C2=A0=C2=A0 sstate_setscene(d)
> @@ -513,6 +537,8 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(task, 's=
ubimages', ' ' + '
> '.join(subimages))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(task, 'v=
ardeps', ' ' + ' '.join(vardeps))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(task, 'v=
ardepsexclude', ' DATETIME DATE ' +
> ' '.join(vardepsexclude))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(task, 'postfu=
ncs', '
> write_image_file_manifest')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(task, 'dirs',=
 ' ' +
> d.getVar('IMGMANIFESTDIR'))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.debug(2, "Adding task=
 %s before %s, after %s" % (task,
> 'do_image_complete', after))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask(task, '=
do_image_complete', after, d)
> @@ -610,6 +636,41 @@ python create_symlinks() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.note("Skipping symlink, source does not exist: %s ->
> %s" % (dst, src))
> =C2=A0}
> =C2=A0
> +python write_image_file_manifest() {
> +=C2=A0=C2=A0=C2=A0 import json
> +=C2=A0=C2=A0=C2=A0 from pathlib import Path
> +
> +=C2=A0=C2=A0=C2=A0 taskname =3D d.getVar("BB_CURRENTTASK")
> +=C2=A0=C2=A0=C2=A0 image_deploy_dir =3D Path(d.getVar('IMGDEPLOYDIR'))
> +=C2=A0=C2=A0=C2=A0 image_manifest_dir =3D Path(d.getVar('IMGMANIFESTDIR'=
))
> +=C2=A0=C2=A0=C2=A0 manifest_path =3D image_manifest_dir / ("do_" +
> d.getVar("BB_CURRENTTASK") + ".json")
> +
> +=C2=A0=C2=A0=C2=A0 image_name =3D d.getVar("IMAGE_NAME")
> +=C2=A0=C2=A0=C2=A0 image_basename =3D d.getVar("IMAGE_BASENAME")
> +=C2=A0=C2=A0=C2=A0 machine =3D d.getVar("MACHINE")
> +
> +=C2=A0=C2=A0=C2=A0 subimages =3D (d.getVarFlag("do_" + taskname, 'subima=
ges', False)
> or "").split()
> +=C2=A0=C2=A0=C2=A0 imagetype =3D d.getVarFlag("do_" + taskname, 'imagety=
pe', False)
> +
> +=C2=A0=C2=A0=C2=A0 data =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "taskname": taskname,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "imagetype": imagetype,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "images": []
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 for type in subimages:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_filename =3D image_name=
 + "." + type
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_path =3D image_deploy_d=
ir / image_filename
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not image_path.exists():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data["images"].append({
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "file=
name": image_filename,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })
> +
> +=C2=A0=C2=A0=C2=A0 with manifest_path.open("w") as f:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json.dump([data], f)
> +}
> +
> =C2=A0MULTILIBRE_ALLOW_REP +=3D "${base_bindir} ${base_sbindir} ${bindir}
> ${sbindir} ${libexecdir} ${sysconfdir} ${nonarch_base_libdir}/udev
> /lib/modules/[^/]*/modules.*"
> =C2=A0MULTILIB_CHECK_FILE =3D "${WORKDIR}/multilib_check.py"
> =C2=A0MULTILIB_TEMP_ROOTFS =3D "${WORKDIR}/multilib"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200485):
> https://lists.openembedded.org/g/openembedded-core/message/200485
> Mute This Topic: https://lists.openembedded.org/mt/106602515/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


