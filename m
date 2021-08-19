Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.66285.1629358610196053766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 00:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fk4jUU7D;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id b10so10808978eju.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nyrZNM9Eb/Z0kdduM7Duh6or2nFHI6Apa2PEDWs9evs=;
        b=Fk4jUU7D+cDOQZrhiAWlf/8rofNS77tplWVR/oyhGZ0mzv2f6iwbSXf6gW7ZR41WDw
         aEsMudOsKmz3+OO0ZgNR0kZnj5495QOUp9cCh2gyIvJsMhPlOI7xwbk0gA6Ft6iSRnQT
         jSJGGKhh/ZUEEUqM0r2OkZYHHiTJqSERIOHyVQujf6xuORawyguq39qd4kIg/a6uDnQZ
         /4FVDDcafUjJnF6yBCWT39hmloTTc6Uc6YZNRDCkAtpOxykWShc9e6ZybTsIJ5//c4xm
         C9aB8LNm+d70ioFjpheA/XKshwfTumCYQBOqWtymaVcr6abQts39zrxf1okfb6FuqMRG
         S1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nyrZNM9Eb/Z0kdduM7Duh6or2nFHI6Apa2PEDWs9evs=;
        b=B5NzoPNQx/x8a+bqugVXUDsfMmr595ZgZKHpZ5Jm5c2f8vX+GrOIUhrMLbHFjzFuCd
         j0tH/wmv/zPt3/8WgMAB46tClGRUwh1JaKPTcWj6Ff3+Aqq/fLnAyhlcQRM9kkyQveb9
         ggsE4fDVFEzWhb966zRTCW44Jcc2eOeTgGXAVHnRLh162gXJKyYuFfAp2CvWIss7IXLf
         9GmKTpaNoc9u4AHOsVbAbpubkPuV/JSkh7wWbJYYQ9z4CjBp85RSSTPNiGpboccNpxYJ
         PWblA+n/+BRFcmGRpUDA8JrNHDAj3uJdbZxotTlKQMiFNSQvzrcYK5lUHPLk83u55evp
         1WeQ==
X-Gm-Message-State: AOAM5338MkmghvmdA39ZVXfVKQHti7NnIWY0SOSc1eNTUcvbKHXVES2/
	hf8CezTM/SUfRMp+PtmJQtJLm0M+EuuDnqmha0k=
X-Google-Smtp-Source: ABdhPJxsJRX9R9YTb48GybEyG/WTe8RH7G3FPlgaLUfX8Aqcf2d9qR4GGJ6bQSLxGygtlUDTGFxJmLXvbRDwr2pcpds=
X-Received: by 2002:a17:907:9688:: with SMTP id hd8mr14459617ejc.484.1629358608594;
 Thu, 19 Aug 2021 00:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212824.146143-1-quaresma.jose@gmail.com> <CF5F148C-F40D-42CF-84D7-88B293D9E752@0leil.net>
In-Reply-To: <CF5F148C-F40D-42CF-84D7-88B293D9E752@0leil.net>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 19 Aug 2021 08:36:37 +0100
Message-ID: <CANPvuRm1oHd+ZsBgV_XO=POPnvifv8O3xi01GyUbWtnnP39SuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patch.bbclass: show to the user where the patch is applied
To: Quentin Schulz <foss@0leil.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

Quentin Schulz <foss@0leil.net> escreveu no dia quinta, 19/08/2021 =C3=A0(s=
) 08:20:
>
> Hi Jose,
>
> On August 18, 2021 11:28:24 PM GMT+02:00, Jose Quaresma <quaresma.jose@gm=
ail.com> wrote:
> >- There are situration when the user have the 'patchdir' defined
> >as a parameter on SRC_URI. However he doesn't know with this,
> >the patch is applied relatively to the receipe source 'S'.
> >
> >* On the next example, the patch is applied on ${WORKDIR}/contrib.
> >But if the user specifies a path on 'patchdir' that don't exist,
> >the patch will fail and there are no message that indicates the real cau=
se.
> >So showing the source path where the patch is applied can be useful.
> >
> >S =3D "${WORKDIR}/git"
> >SRCREV_FORMAT =3D "opencv_contrib"
> >SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \
> >           git://github.com/opencv/opencv_contrib.git;destsuffix=3Dcontr=
ib;name=3Dcontrib \
> >           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../contr=
ib \
> >           "
> >
>
> This shouldn't be done. You do not patch files in WORKDIR, you override t=
hem with SRC_URI and bbappends.
>
> This breaks devtool.
>
> The patch is fine for me, just complaining about the example :)
>
> Are bb.note printed in the log.do_task files, I don't remember? If not (o=
r maybe whatever the answer since it could be a bring a better user experie=
nce), would it be possible to print this path again when it fails? So that =
it's clear from the default loglevel output of bitbake that the patch faile=
d and it was attempted to be applied to "this" path?

When I made this patch I think about that but I don't understand where
is applied the patch:

        try:
            patchset.Import({"file":local, "strippath":
parm['striplevel']}, True)
        except Exception as exc:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(exc))
        try:
            resolver.Resolve()
        except bb.BBHandledException as e:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(e))

Is the patch applied on resolver.Resolve() ? I am not sure

>
> Reviewed-by: Quentin Schulz <foss@0leil.net>
>
> Thanks!
> Quentin
>
> >Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >---
> > meta/classes/patch.bbclass | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> >index 388773a237..559c6f45bd 100644
> >--- a/meta/classes/patch.bbclass
> >+++ b/meta/classes/patch.bbclass
> >@@ -142,7 +142,7 @@ python patch_do_patch() {
> >         else:
> >             patchset, resolver =3D classes[patchdir]
> >
> >-        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.pat=
h.format_display(local, d)))
> >+        bb.note("Applying patch '%s' (%s) on '%s'" % (parm['patchname']=
, oe.path.format_display(local, d), patchdir))
> >         try:
> >             patchset.Import({"file":local, "strippath": parm['stripleve=
l']}, True)
> >         except Exception as exc:



--=20
Best regards,

Jos=C3=A9 Quaresma
