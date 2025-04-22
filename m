Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E6C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:05:36 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.40742.1745330726712224445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RvNa5gnx;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so61870676d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745330726; x=1745935526; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DswPNB0lVI21OOIFQgVS49CohqCZFi3NwYFojc9Q9Ks=;
        b=RvNa5gnxK35ENoEUe6qfDeKbHe/C0tYMv3Y5Yd/hkmQpB6J740xCxKItv9uY68XMEf
         Lj/H6VxASpogbM7YODsZbkpFE3GMgjYf2ym7jgamgwJvbata/h8oJkoDhvF1MZsv6dHf
         9MCiEXngSbDzcjWTZuJH5nhUr4BAdhtBWOAasOt1wVej2BNjKjea9hkhXwHSUFgQWJsk
         0Yo+40gJnR4B5Sf3rSR3lnRJi2XcTocRCRtIMW/8/V7yzC6aP2GcTEJp/4+X+eZ9XDtf
         dapnwkQKx6eK6xDsI61SnocYLmLCGEeJWPgdaqi0pxVUzRNQjr2qc3TmgUpgKHROLH9n
         o1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330726; x=1745935526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DswPNB0lVI21OOIFQgVS49CohqCZFi3NwYFojc9Q9Ks=;
        b=UpWZYzT81KUYMY0DUwgNKgEBuDzRNJD0Vmjbclwwr1z3PFFA5pAVMDQjJCEj0XUr6e
         AepGUGYL8o1rJJtLMl0ep6dMvXP7x09S4RvQytJsqbgzZkDe6iZ9QM38yF7c/KSZzJXu
         DoNSCPuyPkhOpKPXGgS7JGuRqFfhrRoIS/WMxSsI2S+0Z1ftbxUnMVu+MLKtaxuIapob
         1OBLmS/QdedK0GWM1BNgzqHIpyAAauIR3ulizK1AqutFJgu/q+OKtcDnd7bfoKX5sszg
         FUu6oj7/uWPHyx6BrndpFhKEljpgt9M0tvtNmGI3sKiNg+OhQNLhfb4/NwBBJbiRBo+X
         Qiqg==
X-Gm-Message-State: AOJu0YzrzLEmj8KJ4zj1M9yl9IL0GwhpjS0r0FMzCA7bHhs59N22YJUp
	rlV3zb5b1kOkGg+1VTpwkVaFlDpBrWDf3Iw90mObaKWGFSCfHbzlKoCUbyjNxiufPQ/ENDKM8qx
	qXMnTe/VFcnuz9OVrS1gXENewfV3cEA==
X-Gm-Gg: ASbGncu9tIjYXl0oTKAUkTDS7sDVA2Pp35KlKrgSZKt6f25vPKAW1VSfMoG6/lSMrjs
	I15onaCA0EeNXpBTxd1D89q5LU4AHsaxVmX7tg7G6IzZ9cGXXrmfrOApiCBovjsmAGSOy1fMnBu
	LRg5D9P5cXVskDfzBgBPtGBZtXJBAbzs2KXjPnVT75pZQkC6PvKQDj1uwykG27VyEodXQ=
X-Google-Smtp-Source: AGHT+IEcu8ZSQglJDmql8uIKD/BeVGy8N3Ua+7WYcAwem2WZesihcGGROM0NL2PzcNTFhCUBTmgNGlbzcVZlSIBgUs8=
X-Received: by 2002:a05:6214:f06:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6f2c26c9d2emr271636576d6.8.1745330725079; Tue, 22 Apr 2025
 07:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250422131112.2392350-1-ross.burton@arm.com>
In-Reply-To: <20250422131112.2392350-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:05:14 +0200
X-Gm-Features: ATxdqUHoIh3R62xFn-vOi5cgL_EH2oehgz-9_GT38H0BY3O-KFoaEEZ_9-KbYC0
Message-ID: <CANNYZj_HBZwv7utxO1+s_-dooFPbqcFh+U_W9Ji+aRuq4-KC=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autoconf: mangle PV to avoid version-goes-backwards
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org, koen.kooi@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="000000000000e25c7206335e79de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215209

--000000000000e25c7206335e79de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sadly upstream check will report =E2=80=98broken=E2=80=99 with this, that=
=E2=80=99s why I was
hesitant to send the update myself. It will start working again when there
is a new release (assuming it will sort higher than 2.72e).

Alex

On Tue 22. Apr 2025 at 15.12, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> I previously upgrade autoconf 2.72e (the fifth release candidate) to the
> final release 2.72, but unfortunately failed to notice that the version
> appears to go backwards as the package managers sort 2.72e _after_ 2.72.
>
> We could resolve this with an epoch (via PE) but epochs are forever and
> this mistake is temporary, so set a convoluted PV to fix the sorting
> order that can be removed when the next major release is made.
>
> [1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf_2.72.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> index f2d2781fec9..04b771d05a8 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> @@ -11,6 +11,10 @@ DEPENDS:remove:class-native =3D "autoconf-native
> automake-native help2man-native"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef=
16c \
>                     file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e4404=
64"
>
> +# Remove this when upgrading past 2.72, as package managers sort 2.72e
> (the
> +# fifth release candidate) after 2.72.
> +PV =3D "2.72e+really2.72"
> +
>  SRC_URI =3D " \
>             ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
>             file://program_prefix.patch \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215208):
> https://lists.openembedded.org/g/openembedded-core/message/215208
> Mute This Topic: https://lists.openembedded.org/mt/112394175/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e25c7206335e79de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sadly upstream check will report =E2=80=98broken=E2=80=99=
 with this, that=E2=80=99s why I was hesitant to send the update myself. It=
 will start working again when there is a new release (assuming it will sor=
t higher than 2.72e).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Al=
ex</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue 22. Apr 2025 at 15.12, Ross Burton via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;r=
oss.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">I previously up=
grade autoconf 2.72e (the fifth release candidate) to the<br>
final release 2.72, but unfortunately failed to notice that the version<br>
appears to go backwards as the package managers sort 2.72e _after_ 2.72.<br=
>
<br>
We could resolve this with an epoch (via PE) but epochs are forever and<br>
this mistake is temporary, so set a convoluted PV to fix the sorting<br>
order that can be removed when the next major release is made.<br>
<br>
[1] oe-core 11ff8dba0ce (&quot;autoconf: upgrade to final 2.72 release&quot=
;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72=
.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a> b/meta/recip=
es-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" rel=3D"noreferrer"=
 target=3D"_blank">autoconf_2.72.bb</a><br>
index f2d2781fec9..04b771d05a8 100644<br>
--- a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
+++ b/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
@@ -11,6 +11,10 @@ DEPENDS:remove:class-native =3D &quot;autoconf-native au=
tomake-native help2man-native&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb=
7fbaa3ef16c \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:=
//COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464&quot;<br>
<br>
+# Remove this when upgrading past 2.72, as package managers sort 2.72e (th=
e<br>
+# fifth release candidate) after 2.72.<br>
+PV =3D &quot;2.72e+really2.72&quot;<br>
+<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/autoconf/${BP}.tar.=
gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://program_prefix.patch \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215208): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215208" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215208</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112394175/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112394175/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e25c7206335e79de--

