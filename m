Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.66737.1629359250448603884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 00:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HXZw4c9J;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id z20so10914439ejf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 00:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PfsnVhGdL4pcUaDmr0Fuc7eLApBA0JfRR1y7hNEvK34=;
        b=HXZw4c9JZmoPN9fVM98eaKVHQPP5tO1A154vkjGKLZi0G+85SL4MWyFe5iR7X2PrX5
         IPw7fo4m88UiT0ByO79OKRrEoJZYwMGy9vtDDoDbl9FF3aiCwaa/qkkD5uZhY2A0n3Cg
         FZkwwLcox3T4NB1kAE/z7j6L3cUBKzDRFBsjDXQ82DIi4Vrh1cvHf6vzXaHqY6cVBiJZ
         V2ttjsEQEwHw3dwSmyYQXKdetbafb4s9dihnYlurxfFfQBFnv3sRhvgfuYBUmq6F3H/3
         DU2YaFRx3PXtoHLv9rJgI7yGlAlC33kOKhMG+f5i6qLOtkd0xx+w2i9tOXmvhxSlnLgh
         UyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PfsnVhGdL4pcUaDmr0Fuc7eLApBA0JfRR1y7hNEvK34=;
        b=UidT2umhAzVCg5IA/uHUlp5FgWK175TrlZIIpkOrVp7QSP/tnwosNCb/SseOjRltBi
         BydgQlh9SDhVDrPl6LkYWSdVrlBht0bzPKxmFM7STF2wFwRHt6HuRwH8kmCbbJNrFAGn
         BgOjsYnseIG3muCvPncQAG7A382s3N2H+NutCwV9qUrxWLu3VsQnwgqRHJzYfR9bV5Y9
         oYFapJQViSingUfKyn7xFWN8IKRonyREH1R/posMNKl22ITAGfX0MAcBAHGSJKLpxyGC
         t3sRu7o8hz7B1wE6uN5sl7wZxjCImGRsMF/PSa9Jzfpe4T3MCfi0kJVDFWyAjs1z4gUr
         v4JA==
X-Gm-Message-State: AOAM5335+xdM50kEgFjDs4zKQ5HhsVukDK9zUcNg9BQvsXacWMt+WawH
	1KWirsGNbNZjt7nAxGAaJAPnYXQ5tg2jWlYJYCg=
X-Google-Smtp-Source: ABdhPJyGAM7Ff382n8T8Lne+fcb8exaukhKhJweH8QLBeKuciqUtu0yEhU7rymNa2eZnoCOgCUE4vQmvWPqE+j5WMJc=
X-Received: by 2002:a17:907:7883:: with SMTP id ku3mr14763626ejc.453.1629359248828;
 Thu, 19 Aug 2021 00:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212824.146143-1-quaresma.jose@gmail.com>
 <CF5F148C-F40D-42CF-84D7-88B293D9E752@0leil.net> <169CA50611C58685.3513@lists.openembedded.org>
In-Reply-To: <169CA50611C58685.3513@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 19 Aug 2021 08:47:17 +0100
Message-ID: <CANPvuRnd+2un2OO_R_UouQoH_FmttppRRn7z_giBaUUMLL7Gpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patch.bbclass: show to the user where the patch is applied
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Quentin Schulz <foss@0leil.net>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will send a v2 that only check if the patchdir path exist before
patching the sources

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 19/08/2021 =C3=A0(s) 08:36:
>
> Hi Quentin,
>
> Quentin Schulz <foss@0leil.net> escreveu no dia quinta, 19/08/2021 =C3=A0=
(s) 08:20:
> >
> > Hi Jose,
> >
> > On August 18, 2021 11:28:24 PM GMT+02:00, Jose Quaresma <quaresma.jose@=
gmail.com> wrote:
> > >- There are situration when the user have the 'patchdir' defined
> > >as a parameter on SRC_URI. However he doesn't know with this,
> > >the patch is applied relatively to the receipe source 'S'.
> > >
> > >* On the next example, the patch is applied on ${WORKDIR}/contrib.
> > >But if the user specifies a path on 'patchdir' that don't exist,
> > >the patch will fail and there are no message that indicates the real c=
ause.
> > >So showing the source path where the patch is applied can be useful.
> > >
> > >S =3D "${WORKDIR}/git"
> > >SRCREV_FORMAT =3D "opencv_contrib"
> > >SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \
> > >           git://github.com/opencv/opencv_contrib.git;destsuffix=3Dcon=
trib;name=3Dcontrib \
> > >           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../con=
trib \
> > >           "
> > >
> >
> > This shouldn't be done. You do not patch files in WORKDIR, you override=
 them with SRC_URI and bbappends.
> >
> > This breaks devtool.
> >
> > The patch is fine for me, just complaining about the example :)
> >
> > Are bb.note printed in the log.do_task files, I don't remember? If not =
(or maybe whatever the answer since it could be a bring a better user exper=
ience), would it be possible to print this path again when it fails? So tha=
t it's clear from the default loglevel output of bitbake that the patch fai=
led and it was attempted to be applied to "this" path?
>
> When I made this patch I think about that but I don't understand where
> is applied the patch:
>
>         try:
>             patchset.Import({"file":local, "strippath":
> parm['striplevel']}, True)
>         except Exception as exc:
>             bb.utils.remove(process_tmpdir, True)
>             bb.fatal(str(exc))
>         try:
>             resolver.Resolve()
>         except bb.BBHandledException as e:
>             bb.utils.remove(process_tmpdir, True)
>             bb.fatal(str(e))
>
> Is the patch applied on resolver.Resolve() ? I am not sure
>
> >
> > Reviewed-by: Quentin Schulz <foss@0leil.net>
> >
> > Thanks!
> > Quentin
> >
> > >Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > >---
> > > meta/classes/patch.bbclass | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> > >index 388773a237..559c6f45bd 100644
> > >--- a/meta/classes/patch.bbclass
> > >+++ b/meta/classes/patch.bbclass
> > >@@ -142,7 +142,7 @@ python patch_do_patch() {
> > >         else:
> > >             patchset, resolver =3D classes[patchdir]
> > >
> > >-        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.p=
ath.format_display(local, d)))
> > >+        bb.note("Applying patch '%s' (%s) on '%s'" % (parm['patchname=
'], oe.path.format_display(local, d), patchdir))
> > >         try:
> > >             patchset.Import({"file":local, "strippath": parm['striple=
vel']}, True)
> > >         except Exception as exc:
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
