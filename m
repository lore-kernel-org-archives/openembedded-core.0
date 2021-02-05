Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.6934.1612527284800275941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 04:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QxlK1CAP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w1so11546866ejf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 04:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3T0TXQox1NKHe0eYFoYBC+UEiUVvYiaW1Ae/XXKU4k=;
        b=QxlK1CAPagRlbWiVJVhUy5pZcmApnlIZh+LNqOSyj0eCnwDxONIZpBYlNAEAJr4tnw
         GExyrozQ6DqcrpzYMaQ7D0mIyWxwZPe/iCKd8DXDsYImOAX0Ci0gHU8hh+s3zmfe3Iyr
         XDgC+SsX7Mug0CihtlIG8X8/BmCDA6G7KJvxcT9n7aiRfQSK3bAPmwWv0qUCx5egNTst
         GlJHxI7wznpple4HqhdC/+zveI3VrzyS5ZyjxrXmd8ieZ+weofeg1D41CD1Fobx75s9A
         spyjSbML76JTKlFm0buQqRUu++sYUzlO327ZWv6JUk2Qx6ew+OCnfL09Hodpad8M0h7l
         JL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3T0TXQox1NKHe0eYFoYBC+UEiUVvYiaW1Ae/XXKU4k=;
        b=Mmf76RZcebslDE4GBX0Fu/B4zOhBlxh25z0N24XSDN0zchdAApZxWhH8fFoEJN+CVT
         SyWEw8MALJX2XwWRfPoiQ+GSCa2LJRAbEBqEt3H8y0GVbJlDq4DQsKn04h0gWvzwM7jm
         XSlc1bL50OgeI2xtOxAlquXaWsrRFx/dfMgMg3v0vTXFkHY49qTGb/PRJugCVaFBFfX/
         IdXEkGR5Zdn4+DvburL/YvuLhjN81XCYMnJbXVfXa9ezLFd4U0e/vLBND2z9k5j3tkFK
         LNbUIIKD6JLwcOINevkcG9nBkWV+hvAqmjlCR8cn5iyKxZb4O8BSg7C4C5asgGJk5UwN
         EoYA==
X-Gm-Message-State: AOAM531/JhSOSK81kGSctne6PxC+QOyUdSLFElNO/EDVTrblQ1fPWtaN
	CILPN99XMJ0mfhlzkbK8Tx6X42fMtlUpRskT1r8=
X-Google-Smtp-Source: ABdhPJxZHSvyhNHA8R9PmKgn8q2LofWgCdhJBymwDS5TP+3RkNUz9jbPlrjAQJQSS2alEj9KagTFHIVc26LJ6QZauTg=
X-Received: by 2002:a17:906:154d:: with SMTP id c13mr3851496ejd.471.1612527283281;
 Fri, 05 Feb 2021 04:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 5 Feb 2021 13:14:32 +0100
Message-ID: <CA+chaQcpgeCdunqKrPJkkqjRw-dY68pHM_zdj5u3zMOjh5cG7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] image_types: Ensure tar archives are reproducible
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e921b005ba95c362"

--000000000000e921b005ba95c362
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 30, 2021 at 7:02 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The tar output seems to vary depending on the version of tar used and
> distro
> configuration. Be explict about the output format to avoid this and be
> determinstic.
>

Is it the tar format selection which isn't deterministic or something else
when the format isn't set to gnu?

I'm asking because gnu format isn't compatible with --xattrs used e.g. here:
https://github.com/advancedtelematic/meta-updater/blob/d3a832f66e8802cb45536ff278d5c77f946d341d/classes/image_types_ostree.bbclass#L16
causing do_image_tar failing with:

| tar: --xattrs can be used only on POSIX archives
| Try 'tar --help' or 'tar --usage' for more information.

I've already tested that --format=posix here would fix meta-updater, but
not sure if it's still as deterministic as --format=gnu. Do you remember
which distros were producing different output?

Thanks


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index c937ae45384..76949d1051d 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAM
>
>  IMAGE_CMD_TAR ?= "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g.
> do_image_wic) may be hardlinking rootfs
> -IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} .
> || [ $? -eq 1 ]"
> +IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar
> -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>
>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>  IMAGE_CMD_cpio () {
> --
> 2.27.0
>
>
> 
>
>

--000000000000e921b005ba95c362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jan 30, 2021 at 7:02 PM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">The tar output seems to v=
ary depending on the version of tar used and distro<br>
configuration. Be explict about the output format to avoid this and be<br>
determinstic.<br></blockquote><div><br></div><div>Is it the tar format sel=
ection which isn&#39;t deterministic or something else when the format isn&=
#39;t set to gnu?</div><div><br></div><div>I&#39;m asking because gnu forma=
t isn&#39;t compatible with --xattrs used e.g. here:</div><div><a href=3D"h=
ttps://github.com/advancedtelematic/meta-updater/blob/d3a832f66e8802cb45536=
ff278d5c77f946d341d/classes/image_types_ostree.bbclass#L16">https://github.=
com/advancedtelematic/meta-updater/blob/d3a832f66e8802cb45536ff278d5c77f946=
d341d/classes/image_types_ostree.bbclass#L16</a><br></div><div>causing do_i=
mage_tar failing with:</div><div><br></div><div>| tar: --xattrs can be used=
 only on POSIX archives<br>| Try &#39;tar --help&#39; or &#39;tar --usage&#=
39; for more information.<br></div><div><br></div><div>I&#39;ve already tes=
ted that --format=3Dposix here would fix meta-updater, but not sure if it&#=
39;s still as deterministic as --format=3Dgnu. Do you remember which distro=
s were producing different output?</div><div><br></div><div>Thanks</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.b=
bclass<br>
index c937ae45384..76949d1051d 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 =3D &quot;mksquashfs ${IMAGE_RO=
OTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM<br>
<br>
=C2=A0IMAGE_CMD_TAR ?=3D &quot;tar&quot;<br>
=C2=A0# ignore return code 1 &quot;file changed as we read it&quot; as oth=
er tasks(e.g. do_image_wic) may be hardlinking rootfs<br>
-IMAGE_CMD_tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --numeric-owner -c=
f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} =
. || [ $? -eq 1 ]&quot;<br>
+IMAGE_CMD_tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dgnu --n=
umeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C $=
{IMAGE_ROOTFS} . || [ $? -eq 1 ]&quot;<br>
<br>
=C2=A0do_image_cpio[cleandirs] +=3D &quot;${WORKDIR}/cpio_append&quot;<br>
=C2=A0IMAGE_CMD_cpio () {<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000e921b005ba95c362--
