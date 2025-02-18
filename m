Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F04C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:58:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.16842.1739876327261915617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNw0qbXC;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc3a14f6fbso4635748a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 02:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739876327; x=1740481127; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNwNhY+ipyUqYdY5NBwvSOfLehBWWjEb8Y9i9AaZbPM=;
        b=NNw0qbXCOJTj6A/UE4VhiKggOGu2wT1Jfb5yFPZR+l2/7xJ97HWVl0a9uRE69P90DT
         RgOGnmjPmXEkYAsLzoD5HWdTASWv5r1kxKMd7zIQgHzek69u7uP+9rt+nNScdJMu2bUY
         PTgFbWyZJ1QpXsHiGBeRVNpKbjMXkc/Ark19nminvRBQe5NbYF5Kiz0Id97bo4mkyA1e
         OGyOprMFHQrB9WQDAqbgtS3AETdgdz5JOLv2IXO3gH4fxUNXEC982wus86hf2HAeik+X
         MMgQkXdYPLImkCt865u/LMpPsXE8XfxEN68UNWovel8rjc3LuKHGikUvHNsov3Y0jMtd
         DvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739876327; x=1740481127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNwNhY+ipyUqYdY5NBwvSOfLehBWWjEb8Y9i9AaZbPM=;
        b=I3K0E0QVu4RujoGTiZ7dns1+JSixdrr5GtxQLfZ9R4+mkMibpevAS6NFWNxEHkehdY
         /36OpfDw3gAWsOjUVfRoaLvnKVRHIIWpyeWAM5dpVBxWXeIfINoFe1K1qsi8WOlBrvGA
         CxXgKImYFcZ6iQ9LdAv0HUVF0/eXoP0E9CA0jP2autBU7x6MBjvxclWq0hEAAWm01znj
         0Sj9sIZVFp++8jcHaHSK4u0g3R7Olido/TpLZkbEqxebNmE5sg7eC74tPUawVIdH7qmn
         XoWJ6REHGhXgfOgPbvX8ZIEWJFV1Hb/L+9KfRiZN53k26Kp/6FsVyQnNJKf9b7wLowJ6
         qPuA==
X-Gm-Message-State: AOJu0YwDE/16aW28sM/R4mLDbrOsSwTWvyxGT1CnBUKo2ja2a1FxF8vb
	w/Gg23QDIZ0J6tjVfkjROKW7cMRHOasa/SW6wgCTCiqZQ5ea5rM4gJZeki/pr34NjcDaNHi+Jiy
	VPMy5N9T9D0spMqmgGfytDEEpUCs=
X-Gm-Gg: ASbGnctkTfZtOPGoloiMc6JHi1j2h4MSWDyNXWxPKzPENKGxN9rW1awpZs0zuzvooBK
	EigVX5UA7twhg6Pgx2PcTW+6+BSbcXGe6XQGA74RrgxjgOqEni5CUZZNGwnGszYnkMvMByikcsQ
	==
X-Google-Smtp-Source: AGHT+IED8IowMIw6k3Vkaib0vaOf3u9MA+0Xnruzznn5dWpXyg0z5/gObxHKNYZP+MaTdcjpenSDZEhnAY70WyBVABU=
X-Received: by 2002:a17:90b:1b46:b0:2f8:34df:5652 with SMTP id
 98e67ed59e1d1-2fc40f2348fmr18227438a91.21.1739876326639; Tue, 18 Feb 2025
 02:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20250214142756.3320169-1-niko.mauno@vaisala.com>
In-Reply-To: <20250214142756.3320169-1-niko.mauno@vaisala.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Feb 2025 11:58:35 +0100
X-Gm-Features: AWEUYZnRwoHHS5by9o1VhXZbjkTlN9RD-51uA1qMcGR-xQ3oBp5m_RPJa4l2IuI
Message-ID: <CAApg2=TE2dUZ2tW+PQp1iFjrY9pQdi0DsspGYgvvpv_hf5V22A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check.bbclass: Mitigate symlink related error
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000671283062e68863c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211605

--000000000000671283062e68863c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 3:28=E2=80=AFPM Niko Mauno via lists.openembedded.o=
rg
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:

> From: Niko Mauno <niko.mauno@vaisala.com>
>
> According to Yocto reference manual, in description of the
> IMAGE_LINK_NAME variable, it is said that
>
>   It is possible to set this to "" to disable symlink creation,
>   however, you also need to set :term:`IMAGE_NAME` to still have
>   a reasonable value e.g.::
>
>     IMAGE_LINK_NAME =3D ""
>     IMAGE_NAME =3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
>
> However, when using following additions in local.conf file:
>
>   INHERIT +=3D "cve-check"
>   IMAGE_LINK_NAME =3D ""
>   IMAGE_NAME =3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
>
> the implicit symlink creation in cve_check_write_rootfs_manifest leads
> to following build failure
>
>   $ bitbake core-image-minimal core-image-base
>   ...
>   ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-base
> is trying to install files into a shared area when those files already
> exist. The files and the manifests listing them are:
>     /home/poky/build/tmp/deploy/images/qemux86-64/.json
>       (matched in manifest-qemux86_64-core-image-minimal.image_complete)
>   Please adjust the recipes so only one recipe provides a given file.
>
> Mitigate the issue by creating the symlink only in case IMAGE_LINK_NAME
> has not been set to empty string.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/cve-check.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 6e10dd915a..190c5b9a80 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -244,13 +244,15 @@ python cve_check_write_rootfs_manifest () {
>
>      if enable_json:
>          manifest_name_suffix =3D d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFI=
X")
> -        link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name,
> manifest_name_suffix))
>          manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
>
>          with open(manifest_name, "w") as f:
>              json.dump(json_data, f, indent=3D2)
>
> -        update_symlinks(manifest_name, link_path)
> +        if link_name:
> +            link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name,
> manifest_name_suffix))
> +            update_symlinks(manifest_name, link_path)
> +
>          bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
>  }
>
> I'm wondering in how many places you have similar changes?

Wouldn't it be better to centralize the conditional processing in a
separate function that could be reused?
Either inside update_symlinks or in some other wrapper function.

Kind regards,
Marta

--000000000000671283062e68863c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 14,=
 2025 at 3:28=E2=80=AFPM Niko Mauno via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;niko.mauno=3D<a href=3D"mailto:vaisal=
a.com@lists.openembedded.org">vaisala.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Niko =
Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.=
mauno@vaisala.com</a>&gt;<br>
<br>
According to Yocto reference manual, in description of the<br>
IMAGE_LINK_NAME variable, it is said that<br>
<br>
=C2=A0 It is possible to set this to &quot;&quot; to disable symlink creati=
on,<br>
=C2=A0 however, you also need to set :term:`IMAGE_NAME` to still have<br>
=C2=A0 a reasonable value e.g.::<br>
<br>
=C2=A0 =C2=A0 IMAGE_LINK_NAME =3D &quot;&quot;<br>
=C2=A0 =C2=A0 IMAGE_NAME =3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}=
${IMAGE_VERSION_SUFFIX}&quot;<br>
<br>
However, when using following additions in local.conf file:<br>
<br>
=C2=A0 INHERIT +=3D &quot;cve-check&quot;<br>
=C2=A0 IMAGE_LINK_NAME =3D &quot;&quot;<br>
=C2=A0 IMAGE_NAME =3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE=
_VERSION_SUFFIX}&quot;<br>
<br>
the implicit symlink creation in cve_check_write_rootfs_manifest leads<br>
to following build failure<br>
<br>
=C2=A0 $ bitbake core-image-minimal core-image-base<br>
=C2=A0 ...<br>
=C2=A0 ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-b=
ase is trying to install files into a shared area when those files already =
exist. The files and the manifests listing them are:<br>
=C2=A0 =C2=A0 /home/poky/build/tmp/deploy/images/qemux86-64/.json<br>
=C2=A0 =C2=A0 =C2=A0 (matched in manifest-qemux86_64-core-image-minimal.ima=
ge_complete)<br>
=C2=A0 Please adjust the recipes so only one recipe provides a given file.<=
br>
<br>
Mitigate the issue by creating the symlink only in case IMAGE_LINK_NAME<br>
has not been set to empty string.<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 6e10dd915a..190c5b9a80 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -244,13 +244,15 @@ python cve_check_write_rootfs_manifest () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0if enable_json:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_name_suffix =3D d.getVar(&quot;C=
VE_CHECK_MANIFEST_JSON_SUFFIX&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_path =3D os.path.join(deploy_dir, &quot;%=
s.%s&quot; % (link_name, manifest_name_suffix))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar(&quot;CVE_CHEC=
K_MANIFEST_JSON&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(manifest_name, &quot;w&quot;) a=
s f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json.dump(json_data, f, ind=
ent=3D2)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_symlinks(manifest_name, link_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if link_name:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_path =3D os.path.join(deplo=
y_dir, &quot;%s.%s&quot; % (link_name, manifest_name_suffix))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_symlinks(manifest_name, l=
ink_path)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;Image CVE JSON report stor=
ed in: %s&quot; % manifest_name)<br>
=C2=A0}<br>
<br></blockquote><div>I&#39;m wondering in how many places you have similar=
 changes?</div><div><br></div><div>Wouldn&#39;t it be better to centralize =
the conditional processing in a separate function that could be reused?</di=
v><div>Either inside update_symlinks or in some other wrapper function.</di=
v><div><br></div><div>Kind regards,</div><div>Marta <br></div></div></div>

--000000000000671283062e68863c--

