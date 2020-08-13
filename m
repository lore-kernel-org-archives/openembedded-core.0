Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.12359.1597331975171479545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=mbJJSHjy;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.217.66, mailfrom: andrei@gherzan.ro)
Received: by mail-vs1-f66.google.com with SMTP id 1so3093531vsl.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=7gLy9GDMOdY2HMZBK9/YtkOwmTn4wQsJtYuhFdWMK9Y=;
        b=mbJJSHjya0q4aTUPDbGIrzyVisseF+e0UUsGuUWg1RdSKBPcsUtutRsIHqU8pmidnF
         JssqFnKPdcy8Lo1alC74qZLN9+mqxmLl2gtivHzC5nN6jX78GyndDTE9i3pHBQRfr2Vg
         uuRlslWTl0jn0UeQabWm/PN1Oiy72ZPjZN3l7JZy+6ZqJyg1nQ5ZXUFvSzGnzmChbqg0
         Zhe+xPtQsM9PJAxbVWyo17hr2VoSgQntRKhp8ulHa59/KmW6SRvq2T63t20hSLn6Cg9n
         Cu/LtD3pATSoWGuIsf4qRvjudA1xs7wFr5N9RqdYmPkhc9PfmXy2vTHyerSAVPUJiyMI
         SYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=7gLy9GDMOdY2HMZBK9/YtkOwmTn4wQsJtYuhFdWMK9Y=;
        b=qOh3lQVvqS8rVn4t4KaoDu4gHTFG13ozzZh5ltO/e5Q5l2RoLh5yP24sta2f2lW9Ug
         V8J633SjZNI79Jqj8YpDg8sO0tWZLUWHxEEwcSPsRuZBP8khgts7LpbBfvuwcac4evUH
         adAYOKWtRbNJ0YohOPSwT83/FDz4rOTkBiLg9LM84TzRZ1t6SDiapjW1UH7IeloB+EjP
         dAbqqR1FGZGlx2Zl9237UqT+pDg01j331lK1juviwOvtYPYCf7gV9MpY1VqgXXJCEyvb
         JCuTeBd2HeWI2XL/Voyxfm17NASPcEIYOLkGIi9ZqG+Iaf+LTVXOj7uaTrNsasWMw5vW
         1qGA==
X-Gm-Message-State: AOAM530Ra5Cu4vvo1n26CluNps3CnyvuvS8XBcML7vmQR0qKAhWn+OoS
	8qUmv4QQ8q4X20YDxawL9OH5Tvt1wM8h8zyJ5nBOfHgJ8vc=
X-Google-Smtp-Source: ABdhPJwVKzEw17TqxH+AI5suHorow81bIWofSaCSSZEKGhfNME5RgXgccY1HVkNnVv8Tn30vnfiCPduSrU3wJPJ4v7E=
X-Received: by 2002:a67:4387:: with SMTP id q129mr3614273vsa.26.1597331974033;
 Thu, 13 Aug 2020 08:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200316152820.23437-1-andrei@gherzan.ro>
In-Reply-To: <20200316152820.23437-1-andrei@gherzan.ro>
From: "Andrei Gherzan" <andrei@gherzan.ro>
Date: Thu, 13 Aug 2020 16:18:57 +0100
Message-ID: <CAK18fxHYa6GfbA7mnaAkjh4+9siDqUY8HcnfZtqd9WBX64nB6g@mail.gmail.com>
Subject: Re: [PATCH] wic/bootimg-efi: Respect fixed partition size
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6ae6805acc3d4f0"

--000000000000e6ae6805acc3d4f0
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Mar 16, 2020 at 3:28 PM Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
> b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 2cfdc10ecd..6c3d7b8491 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -263,19 +263,22 @@ class BootimgEFIPlugin(SourcePlugin):
>              cp_cmd = "cp %s %s/" % (startup, hdddir)
>              exec_cmd(cp_cmd, True)
>
> -        du_cmd = "du -bks %s" % hdddir
> -        out = exec_cmd(du_cmd)
> -        blocks = int(out.split()[0])
> +        if part.fixed-size:
> +            blocks = part.fixed_size
> +        else:
> +            du_cmd = "du -bks %s" % hdddir
> +            out = exec_cmd(du_cmd)
> +            blocks = int(out.split()[0])
>
> -        extra_blocks = part.get_extra_block_count(blocks)
> +            extra_blocks = part.get_extra_block_count(blocks)
>
> -        if extra_blocks < BOOTDD_EXTRA_SPACE:
> -            extra_blocks = BOOTDD_EXTRA_SPACE
> +            if extra_blocks < BOOTDD_EXTRA_SPACE:
> +                extra_blocks = BOOTDD_EXTRA_SPACE
>
> -        blocks += extra_blocks
> +            blocks += extra_blocks
>
> -        logger.debug("Added %d extra blocks to %s to get to %d total
> blocks",
> -                     extra_blocks, part.mountpoint, blocks)
> +            logger.debug("Added %d extra blocks to %s to get to %d total
> blocks",
> +                         extra_blocks, part.mountpoint, blocks)
>
>          # dosfs image, created by mkdosfs
>          bootimg = "%s/boot.img" % cr_workdir
>
>
Small ping for this.

Thanks,
Andrei

--000000000000e6ae6805acc3d4f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16, 2020 at 3:28 PM An=
drei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/plugins/source/bootimg-efi.py | 21 +++++++++++-------=
-<br>
=C2=A01 file changed, 12 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wi=
c/plugins/source/bootimg-efi.py<br>
index 2cfdc10ecd..6c3d7b8491 100644<br>
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py<br>
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py<br>
@@ -263,19 +263,22 @@ class BootimgEFIPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp_cmd =3D &quot;cp %s %s/&=
quot; % (startup, hdddir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_cmd(cp_cmd, True)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 du_cmd =3D &quot;du -bks %s&quot; % hdddir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D exec_cmd(du_cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blocks =3D int(out.split()[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.fixed-size:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blocks =3D part.fixed_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 du_cmd =3D &quot;du -bks %s&quot=
; % hdddir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D exec_cmd(du_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blocks =3D int(out.split()[0])<b=
r>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =3D part.get_extra_block_count(bl=
ocks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =3D part.get_extra_=
block_count(blocks)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_blocks &lt; BOOTDD_EXTRA_SPACE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =3D BOOTDD_EXTRA_SP=
ACE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_blocks &lt; BOOTDD_EXTR=
A_SPACE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =3D B=
OOTDD_EXTRA_SPACE<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blocks +=3D extra_blocks<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blocks +=3D extra_blocks<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Added %d extra blocks to %s=
 to get to %d total blocks&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0extra_blocks, part.mountpoint, blocks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Added %d extr=
a blocks to %s to get to %d total blocks&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0extra_blocks, part.mountpoint, blocks)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# dosfs image, created by mkdosfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootimg =3D &quot;%s/boot.img&quot; % cr_=
workdir<br><br></blockquote><div><br></div><div>Small ping for this.</div><=
div><br></div><div>Thanks,</div><div>Andrei<br></div></div></div>

--000000000000e6ae6805acc3d4f0--
