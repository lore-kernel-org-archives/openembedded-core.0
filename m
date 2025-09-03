Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A40CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 13:01:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.11857.1756904495247012046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 06:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZfR3SHj8;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-328015abe0bso908210a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756904494; x=1757509294; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3NvT/kfVIn7BqSixOdoM3t6df8xFmo38RZVopEiYNzU=;
        b=ZfR3SHj8UF1xVOlNOY8Z+nO9rOt7BlYZ5keY06+7/ofqgCTGKfwjGyfrb5WtpzcaO3
         iE9HkKx8N4O6IQvvpIfqsF480P2ZnZ3nUJmV9T+sgbyMKJJ2OEiFlSQYNR4W+HtFL8ys
         G8xSgzx9X89DpCEEkXFrkpIoIWuBc4dEA85w5utNP86jOBz2n018jdW0hwptaYz1T23O
         vhwuvela5osR9bFWR4PLHcBVqoqP+jr4YdYwhFOVTajkhzIt5bvjFRexdBJ3ZYlkf2pr
         YrIPd4IoNMjFTvypbJqpJZz9VBmKmG+xhFGudZ3rVVYSwSh7vCaAIQmw9E9e7cjEb2E2
         6tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904494; x=1757509294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NvT/kfVIn7BqSixOdoM3t6df8xFmo38RZVopEiYNzU=;
        b=c1bUpq2bR1Adm9wIXNjEeAtIkwpjS2TEz7Sm1kDze/0N6bXp0xVmJ2wO8eAla0lTxk
         hhde+DBABfkRnRgM0nDGCeuCp8ohNf/b44qdiY1ZjdkGiQ1Jsbx0GcZU0pTt+QJjXgNL
         zFBw5luPSqk31ZCqy1yfCBhvVoJ89tTIhJIzNi/DDqauWA0uLY4px30en7sSyAtlPSH5
         6gJ+TZQFSHcrBdMxM/4WtF6Fcm4O3JLvOpAY7cwd9SnWDGoPXDjj0P3m4ly3EbEbbPDe
         EEnh6z+r4BTZ8K5TgPDg+nkxeVljSnHrsRMkcyBmWE5QjcTdK9SZmYSmGYXKIFBjFg/V
         ZHoA==
X-Gm-Message-State: AOJu0Yys4zwnUK3l/HmVhxFjYOrM6RHwVr3/mNVwGMh0BXwoFQg+VgHe
	5av6+Nk2ZekosNTj3HS0JeWyC3iqi1S/S8FdreVdh4Abeu86qBwSdZa9xsmxsEnOgIbA5PkHZyG
	Y+zCdPVCVPyMJEYqx+OCujy5o8dT8P+g=
X-Gm-Gg: ASbGncsjnsyvWrSY2XaWkpEze2/Uji5taGOWcdUduZdYrAgAM0+Zsc2+Z8tVYNeMPH2
	645GHcENY29TUj0/NYPp9aKRDQoCUZS/UMhceXXf8FKBL5BZGDosMVis7TikvxFMmPjtrO6Z35O
	FySyoBGHyvcTuVzcpUSyvYo6+Ka7wsmsoNbK454ta9Q23f/q+wSRXMufFcBs8HRx5sNxynBn6+v
	ESaYvMb74MCWiLh2+GlCkHtT8588Dq138T1lWpzGt46VlPC9i4=
X-Google-Smtp-Source: AGHT+IFv7Vb5ZeN0nV8KwLVMrtpew2IdBOrUyeG7XYf4z9PUoEFHIsf9Ue/KygC4Xy/V7agImNHSPGftJd2fSAKX3OY=
X-Received: by 2002:a17:90b:3b46:b0:31f:2bbb:e6a8 with SMTP id
 98e67ed59e1d1-3280d34bedfmr18715361a91.12.1756904489640; Wed, 03 Sep 2025
 06:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250903124920.1922332-1-ross.burton@arm.com>
In-Reply-To: <20250903124920.1922332-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Sep 2025 09:01:18 -0400
X-Gm-Features: Ac12FXymX_EYOLQP-3c0gFQfWwJkOqEESrktmDL9A8l-lPjwfj_qaV-E70N31Ks
Message-ID: <CADkTA4P_Q9sfQy5vcvTHBig684T04q7Mj9kYvFHtxwusu0gDoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: enable coresight if enabled in MACHINE_FEATURES
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000026921063de534d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 13:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222860

--000000000000026921063de534d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:49=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Enable the CoreSight[1] functionality in perf[2] if 'coresight' is in the
> MACHINE_FEATURES.
>
> Note that enabling this will mean a dependency on the opencsd recipe,
> which is currently part of meta-arm[3]. I don't think this is a problem
> as this recipe is Arm-specific, and as this is a new feature the
> behaviour is opt-in so shouldn't break any existing machines.
>

I don't have a problem with that arrangement. I could see if it was
widespread, or if the AB needed to use it on tests where meta-arm
wasn't available, then the cost of getting opencsd into core would
be worth it .. but since that isn't the cas and meta-arm being a
maintained and well behaved layer, I have no objections.

Would a comment above the PACKAGECONFIG help warn
someone that enabling it does add a dependency on meta-arm ?
Or do we expect that anyone trying this will already have meta-arm
and be knowledgeable enough to sort it out if they don't ?

Bruce


>
> [1] https://docs.kernel.org/trace/coresight/coresight.html
> [2] https://docs.kernel.org/trace/coresight/coresight-perf.html
> [3]
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-devtools/open=
csd
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 4f29bd5bbc3..194c30831dd 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -10,7 +10,7 @@ HOMEPAGE =3D "
> https://perf.wiki.kernel.org/index.php/Main_Page"
>  LICENSE =3D "GPL-2.0-only"
>
>  # zstd is required for kernels 6.14+ when libelf-zstd is detected
> -PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd"
> +PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd
> ${@bb.utils.filter('MACHINE_FEATURES', 'coresight', d)}"
>  PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
>  PACKAGECONFIG[perl] =3D ",NO_LIBPERL=3D1,perl"
>  PACKAGECONFIG[python] =3D ",NO_LIBPYTHON=3D1,python3
> python3-setuptools-native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222859):
> https://lists.openembedded.org/g/openembedded-core/message/222859
> Mute This Topic: https://lists.openembedded.org/mt/115044194/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000026921063de534d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 3, 2025 at 8:49=
=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.ope=
nembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Enable the CoreSight[1] functi=
onality in perf[2] if &#39;coresight&#39; is in the<br>
MACHINE_FEATURES.<br>
<br>
Note that enabling this will mean a dependency on the opencsd recipe,<br>
which is currently part of meta-arm[3]. I don&#39;t think this is a problem=
<br>
as this recipe is Arm-specific, and as this is a new feature the<br>
behaviour is opt-in so shouldn&#39;t break any existing machines.<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">I don&#39;t have a problem with that arrangement. I could see if it =
was</div><div class=3D"gmail_default" style=3D"font-size:small">widespread,=
 or if the AB needed to use it on tests where meta-arm</div><div class=3D"g=
mail_default" style=3D"font-size:small">wasn&#39;t available, then the cost=
 of getting opencsd into core would</div><div class=3D"gmail_default" style=
=3D"font-size:small">be worth it .. but since that isn&#39;t the cas and me=
ta-arm being a</div><div class=3D"gmail_default" style=3D"font-size:small">=
maintained and well behaved layer, I have no objections.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Would a comment above the PACKAGECONFIG hel=
p warn</div><div class=3D"gmail_default" style=3D"font-size:small">someone =
that enabling it does add a dependency on meta-arm ?</div><div class=3D"gma=
il_default" style=3D"font-size:small">Or do we expect that anyone trying th=
is will already have meta-arm</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">and be knowledgeable=C2=A0enough to sort it out if they don&=
#39;t ?</div><div class=3D"gmail_default" style=3D"font-size:small"></div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
[1] <a href=3D"https://docs.kernel.org/trace/coresight/coresight.html" rel=
=3D"noreferrer" target=3D"_blank">https://docs.kernel.org/trace/coresight/c=
oresight.html</a><br>
[2] <a href=3D"https://docs.kernel.org/trace/coresight/coresight-perf.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.kernel.org/trace/coresig=
ht/coresight-perf.html</a><br>
[3] <a href=3D"https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-=
devtools/opencsd" rel=3D"noreferrer" target=3D"_blank">https://git.yoctopro=
ject.org/meta-arm/tree/meta-arm/recipes-devtools/opencsd</a><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 4f29bd5bbc3..194c30831dd 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -10,7 +10,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://perf.wiki.kernel.or=
g/index.php/Main_Page" rel=3D"noreferrer" target=3D"_blank">https://perf.wi=
ki.kernel.org/index.php/Main_Page</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
<br>
=C2=A0# zstd is required for kernels 6.14+ when libelf-zstd is detected<br>
-PACKAGECONFIG ??=3D &quot;python tui libunwind libtraceevent zstd&quot;<br=
>
+PACKAGECONFIG ??=3D &quot;python tui libunwind libtraceevent zstd ${@bb.ut=
ils.filter(&#39;MACHINE_FEATURES&#39;, &#39;coresight&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[dwarf] =3D &quot;,NO_DWARF=3D1&quot;<br>
=C2=A0PACKAGECONFIG[perl] =3D &quot;,NO_LIBPERL=3D1,perl&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,NO_LIBPYTHON=3D1,python3 python3-set=
uptools-native&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222859): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222859" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222859</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115044194/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115044194/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000026921063de534d8--

