Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9B6FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 14:06:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21541.1777557983672016994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 07:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VA3H1Jy7;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so5682335e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777557982; x=1778162782; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YH87Gsb3STTWgXo6urrSViBE7bxVlLLxx3QmMcFvn2k=;
        b=VA3H1Jy7oUYKQyw8FIONZmzXWm4dBTVZQ6MB0BxBwgDPO4LDz0rAH/FWa6/flbd5KA
         Ajy2e8dpyXulYE0LaBd0JA6kqkwH+jkRwGENpzlC3vVXwHrVUIh7uOGuD3kw+D/TsOsj
         D/s8YGXbZeDxuYkPcaKTd8dF+dkNJ4Doi0UmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557982; x=1778162782;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YH87Gsb3STTWgXo6urrSViBE7bxVlLLxx3QmMcFvn2k=;
        b=VP9UohEaQM7xLpbMFxfUVcFLxP7VRO6EQsar0Qh+2MznzYQnARDghz++MIBNycQHV6
         2aNl3vzCeWSvat9bbzx19AKVZoDTAJWE9LaUZaj1uHHSdVaU/E/gKsxHZ8PXMluhP/rE
         j4JaU/FYB4ne90VsbpGwp0i6GgDeeIIW+v2kwIh6jv9ld9ilLnDGLghuNPSMX+gncS6M
         OzMJ5U/t4qzPh+OFw2V/x4du1iaLBBvpsMVtPoB2fS+FVFMhlTCGxT4pHz/oOtN52Nt3
         FKmNmX3Wd2zCeLwdG0IQk70KmlgopALSLA1qiUMf+s3SgtzQOakkK0ZiygcEJi5O7TqO
         9W+w==
X-Gm-Message-State: AOJu0YzwuQnGPA/tNk9cZJQMG0cMdKF8Dk81hQDHkFqcKmnjx4yObCWX
	5AWpRHL8jftl3miUBIplMZrictCkE6kh9yCLDlls93FIuts+KCAj+SriuUx5zvGZXkY=
X-Gm-Gg: AeBDies8W75P5/V4E4V1kHL2LAHtqao2y4kIQMeDYAR42p+w85nYinIogQuDEwuAVbi
	BWdXrrFuGA01/1kIHcPQKS4LtkF62zaVBGGUDdtRoUG/oIeCiei5AAFDKyHQIV7rn8BvnpNh4Ec
	MkOQNa6d3sJsc4Nv4wOPZlGNv95Ag9G5eFBIeoW8k/uG9CqLNH9woLWdcbZaQw9f10uUWCswjWB
	F9qFGjxRB8eUZ5oRZFZ7/dyc3LzhPf8E07+VDhRTVi5oznrL7/WSsV+ce/sh8WbW+MMddGREUDv
	F/HDrTyoP5qkjCYE99iS37D5uM+m3/YJdwIeYXWQq04Qaai9Ez8Gw8FBmb1Al0USlOF9Z40luI3
	tjZ+6etvFzhDVYXB/ucAevJ3tSzK8WSG93D/E6n5uDmTOAdDLXsxhPvAmiwOUTRmilZr5tvfHyb
	JajyTFLaUHR0Ke9sTN4vAc8ukyNJexo3X7BbIFcDvOWcWFBWjun7vF+nYtmW/LK/gm1zmQdo7sD
	b0P+SK70wxezRSWBK5pQwu5/FVJgpTueLUrZw==
X-Received: by 2002:a05:600c:6285:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48a84485623mr57490495e9.28.1777557981803;
        Thu, 30 Apr 2026 07:06:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822d4b3csm66705145e9.13.2026.04.30.07.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:06:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 16:06:20 +0200
Message-Id: <DI6JPR0Y0VDS.3CEDCNZFTCAUZ@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch] gdk-pixbuf: Fix CVE-2026-5201
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: "Vijay Anusuri" <vanusuri@mvista.com>, "Fabien Thomas"
 <fabien.thomas@smile.fr>
X-Mailer: aerc 0.21.0
References: <20260428070240.2691024-1-vanusuri@mvista.com>
 <DI6J7XTUQ6CP.EB98FAD9J0WE@smile.fr>
 <CANQUz1-UDQb1muUeuU5Dw9h0aj641scOOgvdWoXLroBVg8hWXw@mail.gmail.com>
In-Reply-To: <CANQUz1-UDQb1muUeuU5Dw9h0aj641scOOgvdWoXLroBVg8hWXw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 14:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236171

On Thu Apr 30, 2026 at 3:49 PM CEST, Vijay Anusuri wrote:
> Hi Fabien,
>
> Already AUH succeeded for gdk-pixbuf upgrade to 2.44.6
> https://lists.openembedded.org/g/openembedded-core/message/235274
>
> If you want me to submit the upgrade patch, i will send it .

Oh my bad, you're right, I missed it.=20
It's ok then.

Thanks,
>
> Thanks & Regards,
> Vijay
>
>
>
> On Thu, Apr 30, 2026 at 7:13=E2=80=AFPM Fabien Thomas <fabien.thomas@smil=
e.fr>
> wrote:
>
>> On Tue Apr 28, 2026 at 9:02 AM CEST, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > Pick patch according to [1]
>> >
>> > [1] https://security-tracker.debian.org/tracker/CVE-2026-5201
>> > [2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>> >  .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch | 44 ++++++++++++++++++=
+
>> >  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
>> >  2 files changed, 45 insertions(+)
>> >  create mode 100644
>> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
>> >
>> > diff --git
>> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
>> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
>> > new file mode 100644
>> > index 0000000000..97e0dddb62
>> > --- /dev/null
>> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
>> > @@ -0,0 +1,44 @@
>> > +From 6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b Mon Sep 17 00:00:00 200=
1
>> > +From: Matthias Clasen <mclasen@redhat.com>
>> > +Date: Mon, 30 Mar 2026 12:21:56 -0400
>> > +Subject: [PATCH] jpeg: Reject unsupported number of components
>> > +
>> > +This condition was already checked for incremental loading.
>> > +This commit adds the same check in the nonincremental
>> > +code path.
>> > +
>> > +Closes: #304
>> > +
>> > +Upstream-Status: Backport [
>> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/6cce9311e70b969cbcc6e=
3e1e74ae1756ed02d5b
>> ]
>> > +CVE: CVE-2026-5201
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + gdk-pixbuf/io-jpeg.c | 12 ++++++++++++
>> > + 1 file changed, 12 insertions(+)
>> > +
>> > +diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
>> > +index 9ee1d21..d419812 100644
>> > +--- a/gdk-pixbuf/io-jpeg.c
>> > ++++ b/gdk-pixbuf/io-jpeg.c
>> > +@@ -625,6 +625,18 @@ gdk_pixbuf__real_jpeg_image_load (FILE *f, struc=
t
>> jpeg_decompress_struct *cinfo,
>> > +     cinfo->do_fancy_upsampling =3D FALSE;
>> > +     cinfo->do_block_smoothing =3D FALSE;
>> > +
>> > ++    /* Reject unsupported component counts */
>> > ++    if (cinfo->output_components !=3D 3 && cinfo->output_components =
!=3D 4
>> &&
>> > ++        !(cinfo->output_components =3D=3D 1 &&
>> > ++          cinfo->out_color_space =3D=3D JCS_GRAYSCALE)) {
>> > ++            g_set_error (error,
>> > ++                         GDK_PIXBUF_ERROR,
>> > ++                         GDK_PIXBUF_ERROR_CORRUPT_IMAGE,
>> > ++                         _("Unsupported number of color components
>> (%d)"),
>> > ++                         cinfo->output_components);
>> > ++            goto out;
>> > ++    }
>> > ++
>> > +     pixbuf =3D gdk_pixbuf_new (GDK_COLORSPACE_RGB,
>> > +                              cinfo->out_color_components =3D=3D 4 ? =
TRUE :
>> FALSE,
>> > +                              8,
>> > +--
>> > +2.43.0
>> > +
>> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> > index 7c58fe1e1d..2f0de425b5 100644
>> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
>> > @@ -22,6 +22,7 @@ SRC_URI =3D
>> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>> >
>>  file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch =
\
>> >             file://CVE-2025-7345.patch \
>> >             file://CVE-2025-6199.patch \
>> > +           file://CVE-2026-5201.patch \
>> >             "
>> >
>> >  SRC_URI[sha256sum] =3D
>> "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
>>
>> Hi Vijay
>>
>> Thanks for this patch, but unfortunately I have to put it on hold.
>>
>> The fix is merged in the upstream project gtk-pixbuf from the version
>> 2.44.6,
>> and the oe-core master branch is currently using gtk-pixbuf 2.44.5.
>>
>> You'll need to either submit to master a backport of this patch or
>> bump to 2.44.6 before I can approve it here.
>>
>> Thank you.
>>
>> --
>> Fabien Thomas
>> Smile ECS
>>
>>




--=20
Fabien Thomas
Smile ECS


