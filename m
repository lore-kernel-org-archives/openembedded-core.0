Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.80985.1629448156934760696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ejodLe6Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id lo4so18538617ejb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AVFpeik7vYhD1TnlXwFeLYisBKmrpiM7CCHdLjHPf/s=;
        b=ejodLe6ZYPBX3NH114tB4khaO26mvGVs9rEF4WGitEy6J5qcROOE67YsLp83U6ly4F
         1OOkNLIsgC7QMWCx18GGHE7G4P9mzA8Q6sadFBC2CkkW/bshhH95sgrLvHDhuSQxfhM9
         rJ8211V2PQF6HK2NH4VciDAAXz+7J3p+ofQnkQNKiN/6EIz/Mi5rD2/llOCIGayKR4JF
         x9u/JpfoVnOv+gT/JUIvU+pPueyyBwcRuhcZEzvY8eGQNa+AjwvzQLVi5VfBJhOp7GJY
         2PzZ5pkB2U+o38oVf50J6YGTOeetuszwHhnUlrnZzZH9YO5Y7Q2J5HpzL6RKhFO9kN4i
         hVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AVFpeik7vYhD1TnlXwFeLYisBKmrpiM7CCHdLjHPf/s=;
        b=gt4EHDoZ8dzNYP8FhX/6CAgDYWB3z9XkUVAT5wDhneFTVB/0xQLLMj4JDgkhWcPYlD
         zYSNlrcFk9PpweI7QxzbacVn2tIJkw/LtIVmkNb1M5VrvMgqRq/TY+/a0tun2+U11+ev
         WuXEeR8oE2fzSbd+wHDvpG0VAaokMk5K7B08fXqwRNKiw/QoNS8vPq9p+MZ75Eaes+qI
         QWYrMb1/smfAwV+kHdtHFCWgB3alTRybmVQe8djSDMSW/DsgAjbabRQolxz710k2kNZE
         bqiM0MjMf+WFrgvpgsZBpX+ckUqF1cjvvDRDe0AVN/DpUwqj0i3P6hoWopg3pzr03tgI
         7PYA==
X-Gm-Message-State: AOAM533S0GQY2L87508RyLpIMdV5lAuLpwNf+KAZsRO87R4FbtVu9bRf
	FUZ3/X2iQkFR9hIZ+d2VHe5HMCcckRUPdmkOXkU=
X-Google-Smtp-Source: ABdhPJxwosVQMjBPHNEDg4RQDuublxESiaeDqg1WScEDAQOuv8qKV0WIofjEJvSkStOfASc0OoQLHBr//ZXqPaYJdWA=
X-Received: by 2002:a17:907:9688:: with SMTP id hd8mr20623291ejc.484.1629448155228;
 Fri, 20 Aug 2021 01:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210819082934.10907-1-quaresma.jose@gmail.com> <BE9AF7EF-C06C-4F6B-A1D0-DDB3A6C21D3E@0leil.net>
In-Reply-To: <BE9AF7EF-C06C-4F6B-A1D0-DDB3A6C21D3E@0leil.net>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 20 Aug 2021 09:29:04 +0100
Message-ID: <CANPvuRnz7eZnTLdSv8ztq3MoBTKewVF=tHGBD_8uviACihHm2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] patch.bbclass: check if patchdir exist
To: Quentin Schulz <foss@0leil.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

Quentin Schulz <foss@0leil.net> escreveu no dia quinta, 19/08/2021 =C3=A0(s=
) 10:53:
>
> Hi Jose,
>
> On August 19, 2021 10:29:34 AM GMT+02:00, Jose Quaresma <quaresma.jose@gm=
ail.com> wrote:
> >if the user specifies path on 'patchdir' that don't exist,
> >the patch will fail and there are no message that indicates the real cau=
se.
> >
> >Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >---
> > meta/classes/patch.bbclass | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> >index 559c6f45bd..1e9a024bf9 100644
> >--- a/meta/classes/patch.bbclass
> >+++ b/meta/classes/patch.bbclass
> >@@ -131,6 +131,8 @@ python patch_do_patch() {
> >             patchdir =3D parm["patchdir"]
> >             if not os.path.isabs(patchdir):
> >                 patchdir =3D os.path.join(s, patchdir)
> >+            if not os.path.isdir(patchdir):
> >+                bb.fatal("Patch source directory don't found '%s'" % pa=
tchdir)
>
> In your text, it should be "not" and not "don't".
>
> I could suggest also:
>
> patchdir '%s' not found
>
> Or explicit in the message that "Patch source directory" not found means =
"patchdir" is incorrect somewhere in SRC_URI.
>
> I think you could even tell which patch file has its patchdir incorrect b=
y printing the "local" variable. Not sure it brings anything, just thinking=
 out loud =F0=9F=98=81
>
> Anyway, I like this patch, but it does not have the same purpose as the e=
arlier version of this patch series. I think it is also important to print =
the patchdir when the patch tool fails to apply the patch. It might be beca=
use the path exists but is incorrect.
>
> So it'd be awesome if we can get the patchdir in the fatal message when t=
he patch fails to apply. My understanding of patch.bbclass and lib/oe/patch=
.py is that resolver.Resolve() is doing the patching so in that except thr =
patchdir could be printed.

This is the right way to go.
I will address your comments in the next version, it will come in September=
.

>
> Many thanks!
> Quentin



--=20
Best regards,

Jos=C3=A9 Quaresma
