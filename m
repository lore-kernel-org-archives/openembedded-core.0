Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.31597.1590747274980134181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xj9/6sGv;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id u16so964051lfl.8
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Fskx7V89Lhna9787A1uggaLjrCUETZY7YS11VBOVNzs=;
        b=Xj9/6sGvA7nApGR0M6iVi2KPsw+yB6uL72PnxTH7ZCCmQyHH5e8771Vd7/n3SvtVzm
         WLegI7OPPpMOCw10X+srqrBmetdUsPrgCIqgvlktpAhvmDI2VgcverAeGl1oMXF1u1vs
         Rr27twBDWa6hUmGOjAKKqDqUYdunD+oUwLhXUqY1zzGcP+oj/gUVHY6sigkgyuuyiLcv
         k9NNQmtqbIDdSOVIKsjzw65trZXb1k91kt3j40phJlFVE74265aVU1URPcmTxMnzpn/V
         0qhs6z2Nm0VjUsDThImNSDEUbI211tud4q807YuUuJZ0rdkEW4LKvFxtmgiTorlOhA77
         L2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Fskx7V89Lhna9787A1uggaLjrCUETZY7YS11VBOVNzs=;
        b=AqinEK2xrM50FJAfmL2M8HTZp7iUof6DNHQGLdEsDQ3qlGEm1oEAHD0MkFzMxdL6Lk
         dZzoxqGdvvekITdVzJcbYXsca41bkVnUN93cZpVPQWWZ1SUURBJH9j+GcOtM9+fZKfco
         0isqcox1I+mGjM9q46s4ugDuQYttRukP0UvVB96TNCztMsrcmZdXCRftUJKFsD8kIcvt
         GwOoOqLaQfbvWrmGz49YLzxjeuXKv4Ke7nw7oz7pD3i0u8vO26a5LBdpJ762plYKkh7+
         HPC62JVRKqXgkJjsH8Q7enrqddD72tqxtzEEgl2+PR3WyQpPpZQkTByk/2Jt01Pz4uoJ
         N0tQ==
X-Gm-Message-State: AOAM5329WGCRDWYkJD83gVc8qP4j787A2GBH54Lzts8Gk6n3rwWV5Qwd
	kmrhDMvNt9keteCTvTOH1Pqh3wZ+Oh46pTCgyXgeAHs5xps=
X-Google-Smtp-Source: ABdhPJyTK+ABHn1wfk4UKxuUqreJ5daYctL0H/YQk6Ae2sqAFc518VMSyJfZ8gY6EkBhbB6KTsnR0U0a6Jef01Ndfj8=
X-Received: by 2002:a05:6512:3b6:: with SMTP id v22mr3973244lfp.97.1590747272971;
 Fri, 29 May 2020 03:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200529100159.32393-1-maurofrqueiros@gmail.com> <20200529100159.32393-3-maurofrqueiros@gmail.com>
In-Reply-To: <20200529100159.32393-3-maurofrqueiros@gmail.com>
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
Date: Fri, 29 May 2020 11:14:21 +0100
Message-ID: <CAOev9Bfz5oTD1v8FsmkoswdNU7temVv3axOG1HtA0dS5XqAgCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] git.py: Use the correct branch to check if the repository has LFS objects.
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000220f3405a6c6b657"

--000000000000220f3405a6c6b657
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Please ignore. This was meant to bitbake-devel mailing list.

Mauro Queiros <maurofrqueiros@gmail.com> escreveu no dia sexta, 29/05/2020
=C3=A0(s) 11:02:

> Function "contains_lfs" was only looking at the master branch when
> searching for LFS
> content. LFS may be configured in specific branches only, so we need to
> use the
> correct branch.
>
> Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
> ---
>  lib/bb/fetch2/git.py | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
> index eab76a10..dbf87156 100644
> --- a/lib/bb/fetch2/git.py
> +++ b/lib/bb/fetch2/git.py
> @@ -566,8 +566,15 @@ class Git(FetchMethod):
>          """
>          Check if the repository has 'lfs' (large file) content
>          """
> -        cmd =3D "%s grep lfs HEAD:.gitattributes | wc -l" % (
> -                ud.basecmd)
> +
> +        if not ud.nobranch:
> +            branchname =3D ud.branches[ud.names[0]]
> +        else:
> +            branchname =3D "master"
> +
> +        cmd =3D "%s grep lfs origin/%s:.gitattributes | wc -l" % (
> +            ud.basecmd, ud.branches[ud.names[0]])
> +
>          try:
>              output =3D runfetchcmd(cmd, d, quiet=3DTrue, workdir=3Dwd)
>              if int(output) > 0:
> --
> 2.17.1
>
>

--000000000000220f3405a6c6b657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
Please ignore. This was meant to bitbake-devel mailing list.

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com">maurofrqueiro=
s@gmail.com</a>&gt; escreveu no dia sexta, 29/05/2020 =C3=A0(s) 11:02:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Function &quot;conta=
ins_lfs&quot; was only looking at the master branch when searching for LFS<=
br>
content. LFS may be configured in specific branches only, so we need to use=
 the<br>
correct branch.<br>
<br>
Signed-off-by: Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com=
" target=3D"_blank">maurofrqueiros@gmail.com</a>&gt;<br>
---<br>
=C2=A0lib/bb/fetch2/git.py | 11 +++++++++--<br>
=C2=A01 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py<br>
index eab76a10..dbf87156 100644<br>
--- a/lib/bb/fetch2/git.py<br>
+++ b/lib/bb/fetch2/git.py<br>
@@ -566,8 +566,15 @@ class Git(FetchMethod):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Check if the repository has &#39;lfs&#39;=
 (large file) content<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;%s grep lfs HEAD:.gitattributes =
| wc -l&quot; % (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ud.basecmd)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not ud.nobranch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 branchname =3D ud.branches[ud.na=
mes[0]]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 branchname =3D &quot;master&quot=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;%s grep lfs origin/%s:.gitattrib=
utes | wc -l&quot; % (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ud.basecmd, ud.branches[ud.names=
[0]])<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D runfetchcmd(cmd,=
 d, quiet=3DTrue, workdir=3Dwd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if int(output) &gt; 0:<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000220f3405a6c6b657--
