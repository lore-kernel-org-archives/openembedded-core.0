Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16600C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 10:25:08 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.168976.1719311097542107326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 03:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxnU3tKh;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: ernstp@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so5961071a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719311096; x=1719915896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1hQDFutTqtl6Q3jUueoDArMvkFJKyG0dnIC/ZYZx6g=;
        b=QxnU3tKhZ6n6U6nWCaCUUw93GipxZ1QOMq6GbnSIv4efdE3bpHiVoH87lR+tDpHOMP
         bQBX4VI7kG45l+g/CDj5PW1TboiVte1ZBom8gQpk0ZLmgkJmtUowEm89XquLApfx7LAJ
         SNYPdFC4JK9g/VdRwtnPJC/jWcfd+mpPUyI9RIYZt8F2DmxVwgKaq9255jiEwuz1DujC
         YPds34yTWGkLMRcey+OkUuRW8ed24xcee/bZtdl2809Bn3jTuURZ0JcVfPbDsps12DZ4
         bQQSlqABHimKvaAoLSpdbjqotxt2h7hDXXt8mVQvOxB5cRFdpIMfX5V6TAi5xREMGlbm
         eIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719311096; x=1719915896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1hQDFutTqtl6Q3jUueoDArMvkFJKyG0dnIC/ZYZx6g=;
        b=Ept2fhwDqWJyQGsrUlLpdB6+68locW9cAiwVcUfDGSC5l2Hu60uxOGfa9kpiydi5e2
         gRTBdhz8QqndgVvntyXs14uhoPYOIQ2Z3KGGiAwIaVFqxMXq7xhbFOvNWXKZgRZYUzlJ
         J8nmVd5k3h+RtgLR6XQ41hAkd/3BJW3oaiXPHKa5cZpZ4KpOssc+Osul21k8o4oITfVq
         C2t4AglExXCGVOGSta9wj+L2kfDyUwXZ3s3qMsAYY9PNbiaDLWjyrKCYOvEoQ2ftUxOb
         wn6dY4A/CtfBGtYKdnmkP2mHAIs57X90oynOxOM8/TZJfaTnwXJMk/TRia6r7QpbW31x
         O76Q==
X-Gm-Message-State: AOJu0YxKTd0AHM5X7R5buKhP+RBX9eyRyDFyvKkiKat2nRH7Xb9LzubL
	4G+68eBVgMH4oSscPBovxVlKx3X342UBqZ5nwEtYg8ZStQwwIwUnbBeWBIHcSDlhcaMaWmLffK/
	hcuK9vm8LsLruLJAvQ1dhRYsZvbs=
X-Google-Smtp-Source: AGHT+IHaLxkB8B44iAYIAWXpH+w5PUyQyo0nUOxVkN7SDNcveoeslXI/t/DcPvw50Ya8lu+5gwF/8TtQ/EBM1sm/kAQ=
X-Received: by 2002:a50:bac8:0:b0:57a:2a46:701 with SMTP id
 4fb4d7f45d1cf-57d4bd80e1dmr5077574a12.19.1719311095374; Tue, 25 Jun 2024
 03:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com> <20240624193151.1645802-3-JPEWhacker@gmail.com>
In-Reply-To: <20240624193151.1645802-3-JPEWhacker@gmail.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Tue, 25 Jun 2024 12:24:44 +0200
Message-ID: <CAD=4a=XfGNhNSzVfWpMhqDvh2iocM+ib2QkNgbQy4CNmDMOpqA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 02/10] classes-recipe/baremetal-image: Add
 image file manifest
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000192efd061bb44f4d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 10:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201126

--000000000000192efd061bb44f4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's already an IMAGE_MANIFEST file that's quite different from this?
tmp/deploy/core-image-minimal-qemux86-64.rootfs.manifest
base-files qemux86_64 3.0.14
base-passwd core2_64 3.6.3
busybox core2_64 1.36.1

So I find the name very confusing. Perhaps call this something completely
different, like "result" or do-image-task-output or similar...

Regards
//Ernst

Den m=C3=A5n 24 juni 2024 kl 21:32 skrev Joshua Watt via lists.openembedded=
.org
<JPEWhacker=3Dgmail.com@lists.openembedded.org>:

> Downstream tasks may want to know what image files were written so write
> out a manifest in do_image_complete. The format of the manifest is the
> same as the one in image.bbclass
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/baremetal-image.bbclass | 30 +++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> index 4e7d413626e..d7f53803e2a 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -30,6 +30,9 @@ BAREMETAL_BINNAME ?=3D "hello_baremetal_${MACHINE}"
>  IMAGE_LINK_NAME ?=3D "baremetal-helloworld-image-${MACHINE}"
>  IMAGE_NAME_SUFFIX ?=3D ""
>
> +IMAGE_FILE_MANIFEST_DIR =3D "${WORKDIR}/deploy-image-file-manifest"
> +IMAGE_FILE_MANIFEST =3D "${IMAGE_FILE_MANIFEST_DIR}/manifest.json"
> +
>  do_rootfs[dirs] =3D "${IMGDEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
>
>  do_image(){
> @@ -37,8 +40,28 @@ do_image(){
>      install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.elf
>  }
>
> -do_image_complete(){
> -    :
> +python do_image_complete(){
> +    from pathlib import Path
> +    import json
> +
> +    data =3D {
> +        "taskname": "do_image",
> +        "imagetype": "baremetal-image",
> +        "images": []
> +    }
> +
> +    img_deploy_dir =3D Path(d.getVar("IMGDEPLOYDIR"))
> +
> +    for child in img_deploy_dir.iterdir():
> +        if not child.is_file() or child.is_symlink():
> +            continue
> +
> +        data["images"].append({
> +            "filename": child.name,
> +        })
> +
> +    with open(d.getVar("IMAGE_FILE_MANIFEST"), "w") as f:
> +        json.dump([data], f)
>  }
>
>  python do_rootfs(){
> @@ -62,6 +85,7 @@ python do_rootfs(){
>      bb.utils.mkdirhier(sysconfdir)
>
>      execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
> +    execute_pre_post_process(d, d.getVar("ROOTFS_POSTUNINSTALL_COMMAND")=
)
>  }
>
>
> @@ -72,6 +96,8 @@ SSTATE_SKIP_CREATION:task-image-complete =3D '1'
>  do_image_complete[sstate-inputdirs] =3D "${IMGDEPLOYDIR}"
>  do_image_complete[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
>  do_image_complete[stamp-extra-info] =3D "${MACHINE_ARCH}"
> +do_image_complete[sstate-plaindirs] +=3D "${IMAGE_FILE_MANIFEST_DIR}"
> +do_image_complete[dirs] +=3D "${IMAGE_FILE_MANIFEST_DIR}"
>  addtask do_image_complete after do_image before do_build
>
>  python do_image_complete_setscene () {
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201104):
> https://lists.openembedded.org/g/openembedded-core/message/201104
> Mute This Topic: https://lists.openembedded.org/mt/106856870/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000192efd061bb44f4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">There&#39;s already an IMAGE_MANIFEST file that&#39;s q=
uite different from this?</div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,helvetica,sans-serif">tmp/deploy/core-image-minimal-qemux86-64.=
rootfs.manifest<br>base-files qemux86_64 3.0.14<br>base-passwd core2_64 3.6=
.3<br>busybox core2_64 1.36.1</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif">So I find the name very =
confusing. Perhaps call this something completely different, like &quot;res=
ult&quot; or do-image-task-output or similar...</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Regard=
s</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif">//Ernst<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Den m=C3=A5n 24 juni 2024 kl 21:32 skrev Joshua =
Watt via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gma=
il.com@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Downstream tasks may want to know what image files w=
ere written so write<br>
out a manifest in do_image_complete. The format of the manifest is the<br>
same as the one in image.bbclass<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/baremetal-image.bbclass | 30 +++++++++++++++++++-=
-<br>
=C2=A01 file changed, 28 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-rec=
ipe/baremetal-image.bbclass<br>
index 4e7d413626e..d7f53803e2a 100644<br>
--- a/meta/classes-recipe/baremetal-image.bbclass<br>
+++ b/meta/classes-recipe/baremetal-image.bbclass<br>
@@ -30,6 +30,9 @@ BAREMETAL_BINNAME ?=3D &quot;hello_baremetal_${MACHINE}&q=
uot;<br>
=C2=A0IMAGE_LINK_NAME ?=3D &quot;baremetal-helloworld-image-${MACHINE}&quot=
;<br>
=C2=A0IMAGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
<br>
+IMAGE_FILE_MANIFEST_DIR =3D &quot;${WORKDIR}/deploy-image-file-manifest&qu=
ot;<br>
+IMAGE_FILE_MANIFEST =3D &quot;${IMAGE_FILE_MANIFEST_DIR}/manifest.json&quo=
t;<br>
+<br>
=C2=A0do_rootfs[dirs] =3D &quot;${IMGDEPLOYDIR} ${DEPLOY_DIR_IMAGE}&quot;<b=
r>
<br>
=C2=A0do_image(){<br>
@@ -37,8 +40,28 @@ do_image(){<br>
=C2=A0 =C2=A0 =C2=A0install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAM=
E}.elf ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.elf<br>
=C2=A0}<br>
<br>
-do_image_complete(){<br>
-=C2=A0 =C2=A0 :<br>
+python do_image_complete(){<br>
+=C2=A0 =C2=A0 from pathlib import Path<br>
+=C2=A0 =C2=A0 import json<br>
+<br>
+=C2=A0 =C2=A0 data =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;taskname&quot;: &quot;do_image&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;imagetype&quot;: &quot;baremetal-image&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;images&quot;: []<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 img_deploy_dir =3D Path(d.getVar(&quot;IMGDEPLOYDIR&quot;))<=
br>
+<br>
+=C2=A0 =C2=A0 for child in img_deploy_dir.iterdir():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not child.is_file() or child.is_symlink():<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data[&quot;images&quot;].append({<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;filename&quot;: <a href=3D=
"http://child.name" rel=3D"noreferrer" target=3D"_blank">child.name</a>,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
+<br>
+=C2=A0 =C2=A0 with open(d.getVar(&quot;IMAGE_FILE_MANIFEST&quot;), &quot;w=
&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump([data], f)<br>
=C2=A0}<br>
<br>
=C2=A0python do_rootfs(){<br>
@@ -62,6 +85,7 @@ python do_rootfs(){<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(sysconfdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0execute_pre_post_process(d, d.getVar(&#39;ROOTFS_POSTPR=
OCESS_COMMAND&#39;))<br>
+=C2=A0 =C2=A0 execute_pre_post_process(d, d.getVar(&quot;ROOTFS_POSTUNINST=
ALL_COMMAND&quot;))<br>
=C2=A0}<br>
<br>
<br>
@@ -72,6 +96,8 @@ SSTATE_SKIP_CREATION:task-image-complete =3D &#39;1&#39;<=
br>
=C2=A0do_image_complete[sstate-inputdirs] =3D &quot;${IMGDEPLOYDIR}&quot;<b=
r>
=C2=A0do_image_complete[sstate-outputdirs] =3D &quot;${DEPLOY_DIR_IMAGE}&qu=
ot;<br>
=C2=A0do_image_complete[stamp-extra-info] =3D &quot;${MACHINE_ARCH}&quot;<b=
r>
+do_image_complete[sstate-plaindirs] +=3D &quot;${IMAGE_FILE_MANIFEST_DIR}&=
quot;<br>
+do_image_complete[dirs] +=3D &quot;${IMAGE_FILE_MANIFEST_DIR}&quot;<br>
=C2=A0addtask do_image_complete after do_image before do_build<br>
<br>
=C2=A0python do_image_complete_setscene () {<br>
-- <br>
2.43.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201104): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201104" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201104</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106856870/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106856870/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000192efd061bb44f4d--

