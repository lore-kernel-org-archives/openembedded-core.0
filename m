Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web08.9556.1603275113348022297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kBvb/u7O;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e22so2379536ejr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HtVvEPDIT5O8z7Oqg24kzkv/9FQUhvRzEZzIDKYtmCc=;
        b=kBvb/u7OboZRf71R92IdUgn9CdDGTSbRUTMyyJwgFRyG+Seb7x/r+JayGN6DEHeOwL
         81t4lBSH7h4Rrk/hog9PyW+HgW5CQMcUBnh3jl8S6Oly//0T+HJHQDAl2sC1k8kQtwoC
         ouBJolyA9uUjqfaZTj0BiUNwSZ2k0ULDUbB2eEmupkhJtP3gvUOEkc8b8NJlMwQDctcW
         lrJRkbatrEVBT7OKC5hy2ktkgCy+tRcbLGG5QuGyZONIjD1OSrZgE9/Ns0UssJhIY10U
         HWA1pwOd9NDP4b9AFcBY4nZvzGteBy65d27oEwZvOK9XZOdArAVt4iMs99SDpC+dzAaM
         gDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HtVvEPDIT5O8z7Oqg24kzkv/9FQUhvRzEZzIDKYtmCc=;
        b=b61eMHy5pnRsNL8t0GWWFmLCJwFgTeb+Tbr2+kP7tXo2LaZaHy7oC7AbLmu/77ctXo
         xcGJk6A2CUBSst3AOOjW1z7Nh5NbXEwNpUq8GLEO6qAB70YhUS6HE0bUJUrMWHcvQdte
         DQqxuh0BmOO9844v3hHzzuZCnJJ2t2KlNj2BxAsV667IR78vXvAlVqdB1x347lJKyJzy
         hoTNY78XYqW8GMPhtBul4e33epfO58j0EAglPbZOmAWEgtQ93EeQngSKLQ50rHAlG5C0
         gU5CW858KdjDhipVeW3nurxJemyyvffNcZlsGJLGS+aPaqN5yzC5g4f6cXB9wMklxAnp
         fBwQ==
X-Gm-Message-State: AOAM5332b+nRtm/4zSi2QiLmtgd0tzTqtmXNZprC4z4FuF/5DqouBq8R
	bC9rffdKBiot/BfSErtXAp/otgnu5OHGlSU3amU=
X-Google-Smtp-Source: ABdhPJzz/mfQlc/M1dWrP+G4FtX1jxEd5z2lsfR/7LMtu+/3yqP3vpSZKtxdKgp4ZzrBuy11NpqSgNdynaLsHm7m1fM=
X-Received: by 2002:a17:906:b285:: with SMTP id q5mr2773259ejz.470.1603275111374;
 Wed, 21 Oct 2020 03:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201021092401.41424-1-mingli.yu@windriver.com>
In-Reply-To: <20201021092401.41424-1-mingli.yu@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2020 12:11:40 +0200
Message-ID: <CA+chaQdwgNY7j6xBzzgeYXGv+V=BqiAxuy1_OovZTN88Bc7wbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcl: adapt to potential psuedo changes
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007da3a105b22b93fc"

--0000000000007da3a105b22b93fc
Content-Type: text/plain; charset="UTF-8"

There is typo in the commit summary and doesn't base.bbclass do this
automatically already?

See
https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

On Wed, Oct 21, 2020 at 11:24 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> It failed as below when rerun do_install for tcl:
>  $ bitbake tcl
>  $ bitbake tcl -f -cinstall
> [snip]
>  | NOTE: make -j 72
> DESTDIR=/build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/image install
>  | abort()ing pseudo client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>  |
> /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_install.3490694:
> line 184: 3499214 Aborted                 (core dumped) make -j 72 "$@"
>
> Though unpack tcl source to ${WORKDIR}/${BPN}${PV}, but we set
> S as below:
>  S = "${WORKDIR}/${BPN}${PV}/unix"
>
> Exclude ${WORKDIR}/${BPN}${PV} from pseudo database to fix the
> above do_install failure.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
> b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
> index aedd96b021..e6feb25a7e 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
> @@ -32,6 +32,7 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
>
>  S = "${WORKDIR}/${BPN}${PV}/unix"
>
> +PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
>  VER = "${PV}"
>
>  inherit autotools ptest binconfig update-alternatives
> --
> 2.17.1
>
>
> 
>
>

--0000000000007da3a105b22b93fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is typo in the commit summary and doesn&#39;t base.b=
bclass do this automatically already?<div><br></div><div>See=C2=A0<a href=
=3D"https://git.openembedded.org/openembedded-core/tree/meta/classes/base.=
bbclass#n396">https://git.openembedded.org/openembedded-core/tree/meta/clas=
ses/base.bbclass#n396</a></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2020 at 11:24 AM Yu, Mingli =
&lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank"=
>mingli.yu@windriver.com</a>&gt;<br>
<br>
It failed as below when rerun do_install for tcl:<br>
=C2=A0$ bitbake tcl<br>
=C2=A0$ bitbake tcl -f -cinstall<br>
[snip]<br>
=C2=A0| NOTE: make -j 72 DESTDIR=3D/build/tmp/work/core2-64-wrs-linux/tcl/=
8.6.10-r0/image install<br>
=C2=A0| abort()ing pseudo client by server request. See <a href=3D"https:/=
/wiki.yoctoproject.org/wiki/Pseudo_Abort" rel=3D"noreferrer" target=3D"_bla=
nk">https://wiki.yoctoproject.org/wiki/Pseudo_Abort</a> for more details on=
 this.<br>
=C2=A0| /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_insta=
ll.3490694: line 184: 3499214 Aborted=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0(core dumped) make -j 72 &quot;$@&quot;<br>
<br>
Though unpack tcl source to ${WORKDIR}/${BPN}${PV}, but we set<br>
S as below:<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}${PV}/unix&quot;<br>
<br>
Exclude ${WORKDIR}/${BPN}${PV} from pseudo database to fix the<br>
above do_install failure.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.10.bb" rel=3D"=
noreferrer" target=3D"_blank">tcl_8.6.10.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.10.bb" =
rel=3D"noreferrer" target=3D"_blank">tcl_8.6.10.bb</a> b/meta/recipes-devto=
ols/tcltk/<a href=3D"http://tcl_8.6.10.bb" rel=3D"noreferrer" target=3D"_bl=
ank">tcl_8.6.10.bb</a><br>
index aedd96b021..e6feb25a7e 100644<br>
--- a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.10.bb" rel=3D"=
noreferrer" target=3D"_blank">tcl_8.6.10.bb</a><br>
+++ b/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.10.bb" rel=3D"=
noreferrer" target=3D"_blank">tcl_8.6.10.bb</a><br>
@@ -32,6 +32,7 @@ SRC_URI_class-native =3D &quot;${BASE_SRC_URI}&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}${PV}/unix&quot;<br>
<br>
+PSEUDO_IGNORE_PATHS .=3D &quot;,${WORKDIR}/${BPN}${PV}&quot;<br>
=C2=A0VER =3D &quot;${PV}&quot;<br>
<br>
=C2=A0inherit autotools ptest binconfig update-alternatives<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007da3a105b22b93fc--
