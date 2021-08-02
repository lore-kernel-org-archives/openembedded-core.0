Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.2578.1627932843676170675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 12:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxfdyxPZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id qk33so32593326ejc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dw+CrkjflA7zEy8qoub8KlIp7iqjyW43V6O5vbljknw=;
        b=WxfdyxPZ3It1p4iXYpfHLsAdVRxEd0yVnGtpkI34BV6YfhxZg8tlGkZAFel1MtzJvI
         7NKikMaXNoDInkt/CXpGbE2LkCSioUpkBvNDU+YGwSFEsayZkIn8l2iXjd0bpTibyn5E
         yWKkEnpGI5Od/057YpphNCJtCvDxiwRZasqHSiiKsckQdXqq9YIqbRpOwi/xh3Yf21kO
         wvL88A0HvYNedr29vW73Y7PRUMEhLJNzJ+kaEolU4JJAUcreQ9njDZVcOecNNfA92UCB
         wD3Vf6y6UW0cXvzRRQt5p0d8Fbeu6dRhqmbRaLAJkqZbI60t7ndswVY81Uny4gtDw8M2
         W7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dw+CrkjflA7zEy8qoub8KlIp7iqjyW43V6O5vbljknw=;
        b=XYJZ7POz2f8ynoxJlGZ+i0ympkHt9mdqxWEx+6qjNDlcW85P5mY83oxOf0Q/hRKY4s
         9bVe+UNaIZPgBW/8c+izXm1J8Mljh1rOzJM3sjqkJWIyRxRtrPzfL28e42HIkQ4AJ/MI
         0iifBuaJ2krifFhCgPfvkTADhoExpza3rfnOLYMWmsV5y94pYl4w8x3RudLPcEnKeqll
         7fscS4PyQ0izE9Yj6AVCCnqIQDEwB3TgWyObiE/84WOlbOVm9H/+oQXawLtgIHDYEjzM
         mHbu3/ZDx0r/WTDP1zo7qxgNjdMfZR2ZDmf605kB1aV805w14cag/23jcduhaWfZdJZ8
         q6Yw==
X-Gm-Message-State: AOAM5322F70xyTHtwQctqhFzyV8Eq/WYphdSDaBr1guOXeBVSrf4K+Xk
	862YORTmnXg7LTfNhB/v5KjXLm5QHZBX8tFvoDA=
X-Google-Smtp-Source: ABdhPJw3UucCrrOZFetvsV4qCFPw25Uez+mVOwMtY88lFw1IE0ev1BeBHqLbFNvfjGq95SqbpVYKHJbKaMBw/fjdr10=
X-Received: by 2002:a17:906:c2d7:: with SMTP id ch23mr16306811ejb.298.1627932841888;
 Mon, 02 Aug 2021 12:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210802104430.32402-1-paul@pbarker.dev>
In-Reply-To: <20210802104430.32402-1-paul@pbarker.dev>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 2 Aug 2021 15:33:50 -0400
Message-ID: <CADkTA4OufQ-QKEJrxqYAGLJFc7XhahoGXNb=fRcj0qVPA9=dKA@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: Simplify no git repo case in do_kernel_checkout
To: Paul Barker <paul@pbarker.dev>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c24def05c898a6ad"

--000000000000c24def05c898a6ad
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 6:44 AM Paul Barker <paul@pbarker.dev> wrote:

> If the kernel sources are not fetched via git, a local git repository is
> created in do_kernel_checkout. In this case we know that there will be
> no remote branches and we will already be on the correct branch (since
> only one branch will exist). So we can simplify things by skipping these
> steps.
>
> This also removes the assumption that the default git branch name will
> be "master". Prior to this change, the final git checkout command in
> do_kernel_checkout could fail if a local git repo was created and the
> user had changed init.defaultBranch in their gitconfig.
>

Looks ok to me. No concerns jumped out.

Richard: I can take this into my queue, or you can grab it directly, either
works for me.

Bruce



>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  meta/classes/kernel-yocto.bbclass | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 0df61cdef0..18b77e2b9f 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -358,6 +358,21 @@ do_kernel_checkout() {
>                         fi
>                 fi
>                 cd ${S}
> +
> +               # convert any remote branches to local tracking ones
> +               for i in `git branch -a --no-color | grep remotes | grep
> -v HEAD`; do
> +                       b=`echo $i | cut -d' ' -f2 | sed
> 's%remotes/origin/%%'`;
> +                       git show-ref --quiet --verify -- "refs/heads/$b"
> +                       if [ $? -ne 0 ]; then
> +                               git branch $b $i > /dev/null
> +                       fi
> +               done
> +
> +               # Create a working tree copy of the kernel by checking out
> a branch
> +               machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
> +
> +               # checkout and clobber any unimportant files
> +               git checkout -f ${machine_branch}
>         else
>                 # case: we have no git repository at all.
>                 # To support low bandwidth options for building the
> kernel, we'll just
> @@ -379,21 +394,6 @@ do_kernel_checkout() {
>                 git commit -q -m "baseline commit: creating repo for
> ${PN}-${PV}"
>                 git clean -d -f
>         fi
> -
> -       # convert any remote branches to local tracking ones
> -       for i in `git branch -a --no-color | grep remotes | grep -v HEAD`;
> do
> -               b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
> -               git show-ref --quiet --verify -- "refs/heads/$b"
> -               if [ $? -ne 0 ]; then
> -                       git branch $b $i > /dev/null
> -               fi
> -       done
> -
> -       # Create a working tree copy of the kernel by checking out a branch
> -       machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
> -
> -       # checkout and clobber any unimportant files
> -       git checkout -f ${machine_branch}
>  }
>  do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
>
> --
> 2.31.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c24def05c898a6ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 6:44 AM Paul Barker &lt;<a h=
ref=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">If the kernel sources are n=
ot fetched via git, a local git repository is<br>
created in do_kernel_checkout. In this case we know that there will be<br>
no remote branches and we will already be on the correct branch (since<br>
only one branch will exist). So we can simplify things by skipping these<br=
>
steps.<br>
<br>
This also removes the assumption that the default git branch name will<br>
be &quot;master&quot;. Prior to this change, the final git checkout command=
 in<br>
do_kernel_checkout could fail if a local git repo was created and the<br>
user had changed init.defaultBranch in their gitconfig.<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Loo=
ks ok to me. No concerns jumped out.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Richard: I can take this into my queue, or you can grab it dire=
ctly, either works for me.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=
=3D"_blank">paul@pbarker.dev</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 30 +++++++++++++++---------------=
<br>
=C2=A01 file changed, 15 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 0df61cdef0..18b77e2b9f 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -358,6 +358,21 @@ do_kernel_checkout() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# convert any remot=
e branches to local tracking ones<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `git branc=
h -a --no-color | grep remotes | grep -v HEAD`; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0b=3D`echo $i | cut -d&#39; &#39; -f2 | sed &#39;s%remotes/origin/=
%%&#39;`;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git show-ref --quiet --verify -- &quot;refs/heads/$b&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git branch $b $i &gt; /dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a working =
tree copy of the kernel by checking out a branch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine_branch=3D&q=
uot;${@ get_machine_branch(d, &quot;${KBRANCH}&quot; )}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# checkout and clob=
ber any unimportant files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git checkout -f ${m=
achine_branch}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # case: we have no =
git repository at all. <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # To support low ba=
ndwidth options for building the kernel, we&#39;ll just <br>
@@ -379,21 +394,6 @@ do_kernel_checkout() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git commit -q -m &q=
uot;baseline commit: creating repo for ${PN}-${PV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git clean -d -f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# convert any remote branches to local tracking=
 ones<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `git branch -a --no-color | grep remot=
es | grep -v HEAD`; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D`echo $i | cut =
-d&#39; &#39; -f2 | sed &#39;s%remotes/origin/%%&#39;`;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git show-ref --quie=
t --verify -- &quot;refs/heads/$b&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; th=
en<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git branch $b $i &gt; /dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a working tree copy of the kernel by c=
hecking out a branch<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_branch=3D&quot;${@ get_machine_branch(d=
, &quot;${KBRANCH}&quot; )}&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# checkout and clobber any unimportant files<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git checkout -f ${machine_branch}<br>
=C2=A0}<br>
=C2=A0do_kernel_checkout[dirs] =3D &quot;${S} ${WORKDIR}&quot;<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c24def05c898a6ad--
