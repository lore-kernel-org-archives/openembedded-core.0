Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.31803.1590747290204357398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JKxkicsC;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id r125so948455lff.13
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=2bNUwams3ScS0FhPjgYa329HqBSivu8IMaPC3uxy+0o=;
        b=JKxkicsCseZcNJvLaw0kW/dlNkuRzMsVLI09nOj7pvqW3HQSTYoKFXCHD5I+Y6crJz
         aYi3bq6ypn8KbIKrISwOMkMiJCCDg8C9Zl1YaSOp274FHzE2u1K/1NYw1eAxd8lp+/aK
         54Owlgv4KFMg126SvmvBYiXaKgaHpMKjR5bynSiu2yN9+1NfjC5iBnD0avdw2mrEJzRG
         zxyHodPz/MiPDq4mWQG+D7hAmr67TODHj+xV4T6vWqBak2e6rVnkCFXuZW6zBjM0FeX7
         jZzNiHt+hJLyPcAD3WklHlaV4DG8UBj6Sf/84afRNQxb4YPAlQfwsIE/LR2c49xuY3ky
         fTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=2bNUwams3ScS0FhPjgYa329HqBSivu8IMaPC3uxy+0o=;
        b=XvDpcN8cJt2NSk/iAP2oCqHqJ/jlQHxCDoUbh/ZTUWvpFvUfbNmXPKV776v3ZBItEf
         gXY7r8uRaj1fO9AkbAWBXfqnDZVfGFL07v+GfuhY3qLm1n1aEDzjAuEUTEbpd0rbrPOp
         6P65Kh+iOfNPG7KBEQuNMyGwO4skZ0Ig9xXSk4j3XwhUHZtyeIY3803OiWySvYANYgps
         Ma9iEC9jpK/gzt3lz4kN/7m8dZAH85t+DkAdB2vJ6awOMFrX9fMLlLBgqr54iiOppu+m
         Q9GjE4NlZt/M0BDPpCzvyPLEEu6ujqzwNLAqjEr+w9ekrEXXCNAn/W/Zbwx5/jtR6Pc/
         unHw==
X-Gm-Message-State: AOAM533WZ/AX9brKMPUFgmjPsZ5vGT+5bSBpDViQcCyeZepzdPl863Zw
	DlSQsxlsoU+vMPvoQpYhh42V7Z0xWyrQ9E9WheHTN5YBWT4=
X-Google-Smtp-Source: ABdhPJyOt5syxfaxPM6gsGmWNJx5B7DaQrM9JtHeux+h12o3D1UafghJQBeLrKWymZRTueV6Zqufk1DYkwkWEgkZ2Kc=
X-Received: by 2002:a19:6cd:: with SMTP id 196mr4047334lfg.216.1590747288301;
 Fri, 29 May 2020 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200529100159.32393-1-maurofrqueiros@gmail.com>
In-Reply-To: <20200529100159.32393-1-maurofrqueiros@gmail.com>
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
Date: Fri, 29 May 2020 11:14:36 +0100
Message-ID: <CAOev9Bd5_1Sz9Z7RJgaph-_XSn92yDdo1CJ8fsCnsuZaamz6ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] git.py: skip smudging if lfs=0 is set
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000bf90305a6c6b7f4"

--0000000000000bf90305a6c6b7f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Please ignore. This was meant to bitbake-devel mailing list.

Mauro Queiros <maurofrqueiros@gmail.com> escreveu no dia sexta, 29/05/2020
=C3=A0(s) 11:02:

> Git-LFS objects were being fetched even when lfs=3D0 was not set.
> This patch disables LFS smudging when lfs=3D0. That way, only the LFS
> pointers
> are downloaded during checkout.
>
> Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
> ---
>  lib/bb/fetch2/git.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
> index 5b3793a7..4c7d388e 100644
> --- a/lib/bb/fetch2/git.py
> +++ b/lib/bb/fetch2/git.py
> @@ -475,6 +475,9 @@ class Git(FetchMethod):
>
>          need_lfs =3D ud.parm.get("lfs", "1") =3D=3D "1"
>
> +        if not need_lfs:
> +            ud.basecmd =3D "GIT_LFS_SKIP_SMUDGE=3D1 " + ud.basecmd
> +
>          source_found =3D False
>          source_error =3D []
>
> --
> 2.17.1
>
>

--0000000000000bf90305a6c6b7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
Please ignore. This was meant to bitbake-devel mailing list.

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com">maurofrqueiro=
s@gmail.com</a>&gt; escreveu no dia sexta, 29/05/2020 =C3=A0(s) 11:02:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Git-LFS objects were=
 being fetched even when lfs=3D0 was not set.<br>
This patch disables LFS smudging when lfs=3D0. That way, only the LFS point=
ers<br>
are downloaded during checkout.<br>
<br>
Signed-off-by: Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com=
" target=3D"_blank">maurofrqueiros@gmail.com</a>&gt;<br>
---<br>
=C2=A0lib/bb/fetch2/git.py | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py<br>
index 5b3793a7..4c7d388e 100644<br>
--- a/lib/bb/fetch2/git.py<br>
+++ b/lib/bb/fetch2/git.py<br>
@@ -475,6 +475,9 @@ class Git(FetchMethod):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0need_lfs =3D ud.parm.get(&quot;lfs&quot;,=
 &quot;1&quot;) =3D=3D &quot;1&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not need_lfs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ud.basecmd =3D &quot;GIT_LFS_SKI=
P_SMUDGE=3D1 &quot; + ud.basecmd<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source_found =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source_error =3D []<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000000bf90305a6c6b7f4--
