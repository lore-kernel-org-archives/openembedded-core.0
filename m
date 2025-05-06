Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CD9C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 10:13:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.72452.1746526425975133141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 03:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=farJ4Clx;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so218081f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746526424; x=1747131224; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwyTpOUzbMZPQ29q4OHzwocXVXnCz5CRFdNWwn7mGTA=;
        b=farJ4ClxwugovLSSE8CtKgmvaoknGYZDm5ZOwo2wzb6aFVYY9cUqtTRAAvb69R2g8e
         cGvjUgmrwpz6dQWH6cKFtybp+RlMnIZZ70EzZ0wTP+RKLYIqLMxKD7lkbguct9CIYzvE
         VRarxm/5FfBSQ2BN6S/Cd94lihidSNOjkBgy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526424; x=1747131224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwyTpOUzbMZPQ29q4OHzwocXVXnCz5CRFdNWwn7mGTA=;
        b=rP2tNRZu72lFaPgGB4F6VEMiD4WdLGsSaEA56IH/1/JRTiiIj9bDjmN5loZcj/4p/C
         95LNnBYBD7TyIAHK4uknQQMEAzSkCc9UQP7o8D4OrZZm2DCBJdCXcp1nvLeVDw/Dbk9+
         /WmzuJ50xz8WvT97BAgEi8UhfzeEQrMWROlCz58qLdrElwj99pXcqpeHwXGNUF3x9Tql
         i9d2V1dbg07EPJs2lVXWf0FMT35DuDf/JpIe7ACHou+fReeMqSvtV4xXV7Ofk7RF262X
         GA7ax349eVWyCrhWUytq9BQAVu90i0Z0sKbYtmW0tqo8oBQ6o1GAa75XvNfkJDEXGiy+
         fZvA==
X-Gm-Message-State: AOJu0YyofUtDCPQ8F9YMbe3nKoaOh++oqjB0IJ0p6Fcn3ydy81DLVXvP
	JN3WyGQ4IuIV7W1DFPoN/mD//x+3vtOg0lgQOTiZvePAi5DmNx6k1OWf8dFFmxYfZF3yox7BtNi
	v3txiURkVJxV+lqK++UHgKpf/x4iGXfhfSS06Kg==
X-Gm-Gg: ASbGncv7TSN+J1rb/lGa6t6kUPdUzePA95ofk/dSOhHDxUvQC5KPwL3eGP+khVKxSPS
	KEdREWnTPKk088+8dFV5Nr8NfIHS00o+9i/Sg9AFFhdM6V0u1V0GXHSjoygOO9XLknNz96EVR7F
	tTESwjqysqKP354hBDGu6H058UV0nmRvpl99WB+SV/CULcIva/Cf4RCAaG
X-Google-Smtp-Source: AGHT+IGocXPwnKBqb6l3MFIDLwDXHkQwXuKYecjYgcIr1URn1P0Zc/MwEWeQeAuKEQgOOWVYSEWL1PQpJiY5nnNhL9U=
X-Received: by 2002:a5d:584a:0:b0:3a0:8c4d:7033 with SMTP id
 ffacd0b85a97d-3a09fd6f998mr8422434f8f.5.1746526424181; Tue, 06 May 2025
 03:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250506100824.391727-1-ecordonnier@snap.com>
In-Reply-To: <20250506100824.391727-1-ecordonnier@snap.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 6 May 2025 12:13:18 +0200
X-Gm-Features: ATxdqUG_6WGrAAVjNZ6CC_2zgA7L4M6Mab9jeZLTkZEQAPukfDR1jFncdn-BUIQ
Message-ID: <CAMSfU+4+MLu4VcBdgp_vN20MWAWua19OQde8-MQ6tE++K6jkBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] coreutils: remove outdated comment
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001ab96e063474df6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216036

--0000000000001ab96e063474df6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 mai 2025 =C3=A0 12:08, Etienne Cordonnier via lists.openembedded.=
org
<ecordonnier=3Dsnap.com@lists.openembedded.org> a =C3=A9crit :

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The comment about hostname not being included in base_bindir_progs is
> wrong after
> https://git.yoctoproject.org/poky/commit/?id=3Db9bf37ec6792f82753fe265fdc=
fc19db7dd51ab6
> ,
> so remove it to avoid confusion.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.6.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb
> b/meta/recipes-core/coreutils/coreutils_9.6.bb
> index b876a8fdd0..16f56ac772 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
> @@ -50,7 +50,7 @@ PACKAGECONFIG[single-binary] =3D
> "--enable-single-binary,--disable-single-binary,,
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>  PACKAGECONFIG[openssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,ope=
nssl"
>
> -# [ df mktemp nice printenv base64 gets a special treatment and is not
> included in this
> +# base32 base64 df mktemp nice printenv get a special treatment and are
> not included in this
>

You dropped the '[' here which in this context is "alias of test" if I'm
not wrong.
Also, this hunk is not related to the commit message so maybe you did not
want to add it?


>  bindir_progs =3D "arch basename chcon cksum comm csplit cut dir dircolor=
s
> dirname du \
>                  env expand expr factor fmt fold groups head hostid id
> install \
>                  join link logname md5sum mkfifo nl nohup nproc od paste
> pathchk \
> @@ -58,7 +58,6 @@ bindir_progs =3D "arch basename chcon cksum comm csplit
> cut dir dircolors dirname
>                  sha384sum sha512sum shred shuf sort split sum tac tail
> tee test timeout \
>                  tr truncate tsort tty unexpand uniq unlink uptime users
> vdir wc who whoami yes"
>
> -# hostname gets a special treatment and is not included in this
>  base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false hostn=
ame
> kill ln ls mkdir \
>                       mknod mv pwd rm rmdir sleep stty sync touch true
> uname stat"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216035):
> https://lists.openembedded.org/g/openembedded-core/message/216035
> Mute This Topic: https://lists.openembedded.org/mt/112646299/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001ab96e063474df6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 6 =
mai 2025 =C3=A0=C2=A012:08, Etienne Cordonnier via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"m=
ailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com=
" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
The comment about hostname not being included in base_bindir_progs is wrong=
 after <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Db9bf37ec67=
92f82753fe265fdcfc19db7dd51ab6" rel=3D"noreferrer" target=3D"_blank">https:=
//git.yoctoproject.org/poky/commit/?id=3Db9bf37ec6792f82753fe265fdcfc19db7d=
d51ab6</a> ,<br>
so remove it to avoid confusion.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.6.bb</a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.6.bb=
" rel=3D"noreferrer" target=3D"_blank">coreutils_9.6.bb</a> b/meta/recipes-=
core/coreutils/<a href=3D"http://coreutils_9.6.bb" rel=3D"noreferrer" targe=
t=3D"_blank">coreutils_9.6.bb</a><br>
index b876a8fdd0..16f56ac772 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.6.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.6.bb</a><br>
@@ -50,7 +50,7 @@ PACKAGECONFIG[single-binary] =3D &quot;--enable-single-bi=
nary,--disable-single-binary,,<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinux,lib=
selinux&quot;<br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;--with-openssl=3Dyes,--with-openssl=
=3Dno,openssl&quot;<br>
<br>
-# [ df mktemp nice printenv base64 gets a special treatment and is not inc=
luded in this<br>
+# base32 base64 df mktemp nice printenv get a special treatment and are no=
t included in this<br></blockquote><div><br></div><div>You dropped the &#39=
;[&#39; here which in this context is &quot;alias of test&quot; if I&#39;m =
not wrong.</div><div>Also, this hunk is not related to the commit message s=
o maybe you did not want to add it?</div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0bindir_progs =3D &quot;arch basename chcon cksum comm csplit cut dir =
dircolors dirname du \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env expand ex=
pr factor fmt fold groups head hostid id install \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0join link log=
name md5sum mkfifo nl nohup nproc od paste pathchk \<br>
@@ -58,7 +58,6 @@ bindir_progs =3D &quot;arch basename chcon cksum comm csp=
lit cut dir dircolors dirname<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sha384sum sha=
512sum shred shuf sort split sum tac tail tee test timeout \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr truncate t=
sort tty unexpand uniq unlink uptime users vdir wc who whoami yes&quot;<br>
<br>
-# hostname gets a special treatment and is not included in this<br>
=C2=A0base_bindir_progs =3D &quot;cat chgrp chmod chown cp date dd echo fal=
se hostname kill ln ls mkdir \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mknod mv pwd rm rmdir sleep stty sync touch true uname stat&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216035" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216035</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112646299/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112646299/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000001ab96e063474df6c--

