Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0ACFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 13:49:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21072.1777556984254150162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 06:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c6zSPWtK;
 spf=pass (domain: mvista.com, ip: 209.85.208.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso1516749a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 06:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777556982; cv=none;
        d=google.com; s=arc-20240605;
        b=LXLMSUklUYZkFcZl2iUqN04456E6mqngbh0pQ6bq+5xl8uVpxGh+gG4dH8naiRJJMr
         5Wc1G1ZXhHvVxuLmRamwqZ33IDH1rGWOBGB7ESHFPl/FensV/rLPt7nYGwwUEoy2fV5w
         /4PfjrFNmK/SpR5ybtsrW8ssUajGmabbyOhaxA40i8ZGYnWemtCZaSKSXy22LEKA7JVM
         u9Nq5xsgMegJrlGh64UEZMpy8l6ZTGp1mx7n07SDSMzUWxpiQsMia+fHvLQjQiYCxgb0
         mhFg+14uTWDAQTttzYtB18j3pwAEIaLDGkqOrYutc34BE30ZY5usGZbQIYq/+qpXB4Ba
         UulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JuRcPOZErIY7QG2tzn2sqC8Trd7e01udhm9N7BKUqrY=;
        fh=pPCZLadEnHSSNqpbdMoTRaQ3O6r9Sm3FEzXJm+M1zj8=;
        b=cildHqCfBcRPSMz/ffGh+q3ldtFRWX6lnEGGqeKxeTT85qHHWB/2ijOwVZVmqjItqc
         OoA6hrQYqO8wx5lIlxYBnEWJ537aZnqPmf7tPp+tV0JVhYZ20HwAV6vAxaCSii1qRfgc
         xXBuJTnK4dOpay/k+TmqPGC1dvhO3fq8hnZPpszFFpsWQVRQiq1XJIhvgPxuYfVQ4htP
         lIaV7cR3YuBcIFEJE5R9v6xHKxCr1mQcVDWzhzsgT5vzODsSlRZGRV4aXBTfRFAHhzOL
         gjGWBJqwGBB1hPXmj3GvsHL+aBX8EqC8nOUIZaHTENlpQmRyqybirbQ5Xs2uDghZhxd+
         edpw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777556982; x=1778161782; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JuRcPOZErIY7QG2tzn2sqC8Trd7e01udhm9N7BKUqrY=;
        b=c6zSPWtKIC+jF8ilqwQt0p6CoyK2I2jgK8Xblx0vA+IACYanl0fU9i3DSHVMxWFW7J
         nNAR8AYKt7GMWGnv8NTGBDyM9CRESPMQf0UFwTzen7S1BMlKrNIQBDmEG0L+FxdpTbBh
         h50V5R22TP7DIl5WRX0R2SWbwaONE5Iukc9QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556982; x=1778161782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuRcPOZErIY7QG2tzn2sqC8Trd7e01udhm9N7BKUqrY=;
        b=lbw/v8Wh2P998yLyx0XTs7FLV08NQ9ckBjSjE6SOZa9Sa4sO9UzGEUnc+XnRlo2Grm
         4toqMi37OInHzcJBmNqwTDEQtzmFMBMwLNJhjfyyh3/LikTIankuXwJK3gJ7vScrV63u
         s4JK5NOVxqqlDa+qAL9DCR6JsnxXDQ5RFhrUuhedHXpKPlfklo5c+2naMGRGm5gUW5Nc
         QJI52iyptiL59SPwpVd7jkdyT+tXfRvTddm6V+Rr2c+THdGfIyx+b9vQSxbPCxBnSzgL
         heritpgCJhybV9ubnffdfnXS0/20SdUL0c/g6cVjw+te4gqbjcvAUCkhdVj6aerhbern
         ggrw==
X-Gm-Message-State: AOJu0YzZXS1knPB5XxXpshBkm531RlaeZ+pcnUrcTchY8jpKGmELslBV
	75JJYmnUhRJ0UnD0ODSFKmNAXrlpQDqJN4dnw1t1bg1KMw7wtiZ/xxbU1CJbfu0dlpYYhovlaS6
	KQnPzcAq63huNRL1xzvj+txJlYxXWPcZaJM6ovGMiIQ==
X-Gm-Gg: AeBDies5usQpnw5FMUmaRMXQMKF1uRCg4P63pl7AdbI/spNCGLqxhvDioxkV2KlJbQM
	Z7M3irUTCGcJ5FJGLLZHt1ca9VWEC1sx+bKbcr4NV2nwTP3jKn51Pz2WtjiFois6Z25vpnmrbBr
	R0/OLx0O63ek5ZwQvf6QZJdhryRWuzqz8v+YMjD1xPO5xo/Pgtuk+sdNzjfFfC0u1bNNkQu5Qwf
	2a71V0lbnarD+3oNcoy/JMRlKQxyrr5HQ1beQYO/TNqyKDcuIPI6WvkBXG5a1ey1AR2zD+/WQhK
	lFTc4lZakhAtoXycos2R/oE6xjEnsjECLssavENVsHX9L9Ykgziz
X-Received: by 2002:a05:6402:324e:b0:677:75e5:a1b3 with SMTP id
 4fb4d7f45d1cf-67b5d858c54mr1096638a12.18.1777556982393; Thu, 30 Apr 2026
 06:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260428070240.2691024-1-vanusuri@mvista.com> <DI6J7XTUQ6CP.EB98FAD9J0WE@smile.fr>
In-Reply-To: <DI6J7XTUQ6CP.EB98FAD9J0WE@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 30 Apr 2026 19:19:27 +0530
X-Gm-Features: AVHnY4IJ2rgxKduJmpDvrcXmjBdyWVAXgOkw6ZHe4LejZOohBoJHnOMVBfSV0Yk
Message-ID: <CANQUz1-UDQb1muUeuU5Dw9h0aj641scOOgvdWoXLroBVg8hWXw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] gdk-pixbuf: Fix CVE-2026-5201
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081003c0650adbc05"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 13:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236169

--00000000000081003c0650adbc05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Already AUH succeeded for gdk-pixbuf upgrade to 2.44.6
https://lists.openembedded.org/g/openembedded-core/message/235274

If you want me to submit the upgrade patch, i will send it .

Thanks & Regards,
Vijay



On Thu, Apr 30, 2026 at 7:13=E2=80=AFPM Fabien Thomas <fabien.thomas@smile.=
fr>
wrote:

> On Tue Apr 28, 2026 at 9:02 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [1]
> >
> > [1] https://security-tracker.debian.org/tracker/CVE-2026-5201
> > [2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch | 44 +++++++++++++++++++
> >  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
> >  2 files changed, 45 insertions(+)
> >  create mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> >
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> > new file mode 100644
> > index 0000000000..97e0dddb62
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> > @@ -0,0 +1,44 @@
> > +From 6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b Mon Sep 17 00:00:00 2001
> > +From: Matthias Clasen <mclasen@redhat.com>
> > +Date: Mon, 30 Mar 2026 12:21:56 -0400
> > +Subject: [PATCH] jpeg: Reject unsupported number of components
> > +
> > +This condition was already checked for incremental loading.
> > +This commit adds the same check in the nonincremental
> > +code path.
> > +
> > +Closes: #304
> > +
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/6cce9311e70b969cbcc6e3=
e1e74ae1756ed02d5b
> ]
> > +CVE: CVE-2026-5201
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + gdk-pixbuf/io-jpeg.c | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
> > +index 9ee1d21..d419812 100644
> > +--- a/gdk-pixbuf/io-jpeg.c
> > ++++ b/gdk-pixbuf/io-jpeg.c
> > +@@ -625,6 +625,18 @@ gdk_pixbuf__real_jpeg_image_load (FILE *f, struct
> jpeg_decompress_struct *cinfo,
> > +     cinfo->do_fancy_upsampling =3D FALSE;
> > +     cinfo->do_block_smoothing =3D FALSE;
> > +
> > ++    /* Reject unsupported component counts */
> > ++    if (cinfo->output_components !=3D 3 && cinfo->output_components !=
=3D 4
> &&
> > ++        !(cinfo->output_components =3D=3D 1 &&
> > ++          cinfo->out_color_space =3D=3D JCS_GRAYSCALE)) {
> > ++            g_set_error (error,
> > ++                         GDK_PIXBUF_ERROR,
> > ++                         GDK_PIXBUF_ERROR_CORRUPT_IMAGE,
> > ++                         _("Unsupported number of color components
> (%d)"),
> > ++                         cinfo->output_components);
> > ++            goto out;
> > ++    }
> > ++
> > +     pixbuf =3D gdk_pixbuf_new (GDK_COLORSPACE_RGB,
> > +                              cinfo->out_color_components =3D=3D 4 ? T=
RUE :
> FALSE,
> > +                              8,
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> > index 7c58fe1e1d..2f0de425b5 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> > @@ -22,6 +22,7 @@ SRC_URI =3D
> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
> >
>  file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
> >             file://CVE-2025-7345.patch \
> >             file://CVE-2025-6199.patch \
> > +           file://CVE-2026-5201.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
>
> Hi Vijay
>
> Thanks for this patch, but unfortunately I have to put it on hold.
>
> The fix is merged in the upstream project gtk-pixbuf from the version
> 2.44.6,
> and the oe-core master branch is currently using gtk-pixbuf 2.44.5.
>
> You'll need to either submit to master a backport of this patch or
> bump to 2.44.6 before I can approve it here.
>
> Thank you.
>
> --
> Fabien Thomas
> Smile ECS
>
>

--00000000000081003c0650adbc05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi=C2=A0Fabien,<br><br></div>Already A=
UH succeeded=C2=A0for gdk-pixbuf upgrade to 2.44.6<br><a href=3D"https://li=
sts.openembedded.org/g/openembedded-core/message/235274">https://lists.open=
embedded.org/g/openembedded-core/message/235274</a><br><br></div>If you wan=
t me to submit the upgrade patch, i will send it .<br><br></div>Thanks &amp=
;=C2=A0Regards,<br></div>Vijay<div><br><br></div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Apr 30, 2026 at 7:13=E2=80=AFPM Fabien Thomas &lt;<a href=3D"mailto:fab=
ien.thomas@smile.fr">fabien.thomas@smile.fr</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Tue Apr 28, 2026 at 9:02 AM C=
EST, Vijay Anusuri via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Pick patch according to [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-52=
01" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.or=
g/tracker/CVE-2026-5201</a><br>
&gt; [2] <a href=3D"https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gdk-pi=
xbuf/-/issues/304</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch | 44 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">gdk-pixbuf_2.42.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 45 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-=
2026-5201.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.pa=
tch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..97e0dddb62<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +From 6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Matthias Clasen &lt;<a href=3D"mailto:mclasen@redhat.com" targe=
t=3D"_blank">mclasen@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 30 Mar 2026 12:21:56 -0400<br>
&gt; +Subject: [PATCH] jpeg: Reject unsupported number of components<br>
&gt; +<br>
&gt; +This condition was already checked for incremental loading.<br>
&gt; +This commit adds the same check in the nonincremental<br>
&gt; +code path.<br>
&gt; +<br>
&gt; +Closes: #304<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
gdk-pixbuf/-/commit/6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/=
6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b</a>]<br>
&gt; +CVE: CVE-2026-5201<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + gdk-pixbuf/io-jpeg.c | 12 ++++++++++++<br>
&gt; + 1 file changed, 12 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c<br>
&gt; +index 9ee1d21..d419812 100644<br>
&gt; +--- a/gdk-pixbuf/io-jpeg.c<br>
&gt; ++++ b/gdk-pixbuf/io-jpeg.c<br>
&gt; +@@ -625,6 +625,18 @@ gdk_pixbuf__real_jpeg_image_load (FILE *f, struc=
t jpeg_decompress_struct *cinfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cinfo-&gt;do_fancy_upsampling =3D FALSE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cinfo-&gt;do_block_smoothing =3D FALSE;<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 /* Reject unsupported component counts */<br>
&gt; ++=C2=A0 =C2=A0 if (cinfo-&gt;output_components !=3D 3 &amp;&amp; cinf=
o-&gt;output_components !=3D 4 &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(cinfo-&gt;output_components =3D=3D 1 &=
amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cinfo-&gt;out_color_space =3D=3D =
JCS_GRAYSCALE)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_set_error (error,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GDK_PIXBUF_ERROR,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GDK_PIXBUF_ERROR_CORRUPT_IMAGE,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;Unsupported number of color components (%d)=
&quot;),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0cinfo-&gt;output_components);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pixbuf =3D gdk_pixbuf_new (GDK_COLORSPACE_RGB, <b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cinfo-&gt;out_color_components =3D=3D 4=
 ? TRUE : FALSE, <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8,<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbu=
f_2.42.12.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.12.bb</a=
> b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.12.bb" =
rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.12.bb</a><br>
&gt; index 7c58fe1e1d..2f0de425b5 100644<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.=
12.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.12.bb</a><br>
&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.=
12.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.12.bb</a><br>
&gt; @@ -22,6 +22,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_VER}/=
${BPN}-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.build=
-allow-a-subset-of-tests-in-cross-compile.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7345.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-6199.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-5201.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;b9505b3445b9a7e48ced34760c3bcb73e96=
6df3ac94c95a148cb669ab748e3c7&quot;<br>
<br>
Hi Vijay <br>
<br>
Thanks for this patch, but unfortunately I have to put it on hold.<br>
<br>
The fix is merged in the upstream project gtk-pixbuf from the version 2.44.=
6,<br>
and the oe-core master branch is currently using gtk-pixbuf 2.44.5.<br>
<br>
You&#39;ll need to either submit to master a backport of this patch or <br>
bump to 2.44.6 before I can approve it here.<br>
<br>
Thank you.<br>
<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</blockquote></div>

--00000000000081003c0650adbc05--

