Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1164FD1A62D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:56:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10534.1767967008182424185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLbz/jxJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bae9aca3so29904915ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767967007; x=1768571807; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tc8P58acXRFQBce9ump+sIqPk9lHoV4KLbTgJLJD/XM=;
        b=NLbz/jxJPv5p/IJ7AvBS2oS4u8gmtgqOIqhMUzs3j/2lTF6puHUl+C+shq/nivZ8YN
         QBfU+ZypEcXZ1eXRhr7LiqddemZLVDliS1HUO+Kk1C08Bcbrsrga/slD+vt2DLYOJ3fm
         pgRq+ihknQxVuVCt6x+y6w7o4gccpwtqmMfRQyFYHa3aVnIQ6llHBmxt9vjKvB/SKixZ
         VoS3WxSL3UJxcGTV8/xHnbFeyE2erXPAKFtcdCK6fl9VMaEmKOa64UjiTpMPueSK8kN0
         Vh311IWRfCf964Dr/uHOmWBkqqvGRqyE/MKpGKEWzipcKSq9qCw+2vOHji/shxmdq3wx
         gZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767967007; x=1768571807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc8P58acXRFQBce9ump+sIqPk9lHoV4KLbTgJLJD/XM=;
        b=XcVO0LGa7SG4GLFBLqE1wRgx4rFwtz0afejGseDlkX4oI87svDHJFhxSGOyC/YK7ge
         r5BdSDgDStiVwT/gPMA46KUKUKpfoic0Fc8oEebAL8fBoKj83NrXRy7CdoNGg6TckdDw
         MfcPkk0+DhY2f3ZQswJQAHQY6EjKGdRwNdXdQGnUwai9+MNGwSNALz1VJR3sJMR8N+PP
         0/mEnIrPSfEEKt4AQuyDM+1ZKsvk2Ac7nTBF3B8KLlYB2x9SI8WS6Krq/M2fP5vNEbq6
         WfajKW1okA6KRNo0eiVajApKnSh7JdJiRfCDbRZKQwDFJXUgcxaw7aj8cfyBWQNs8Z0x
         uwEw==
X-Gm-Message-State: AOJu0YzEA56W7hWMYxk1eeOOdMq/G7yHc96PYVFB3nBPgohIJ3n+sbZR
	AtQoUqWOERvD71XlWKOAmuswbSzEBWe63VA4nlzx+WRPYyHC2T2gmCeYgilUEPhf2Q7LQCv3fjf
	h3oqUOzSvVTgNADPNMNnxjshQNEV93/w=
X-Gm-Gg: AY/fxX6p7lFJuj3oYTED807VKzg3/mjaKdJZHHfXJLzLzZQSlEIxqlTbbJ46IK5Uf14
	mt30N+2tPOgA7iN0lUXMYExJAbz9djZqyjz9QsGOXSIsu/CdcxGo0X5JfayFwrytj9ZHQ3gZAI6
	NiZjIDfTmShWRHBKbw9/4cM3I0pmcnX+tKgROcVXL0fVBjpm7tmfzdce/EW9dPHohbAYKChB2Vc
	IC3R7U6qJ6mu/SHwPqb2sHhtz25h08AfQDcIpWjP16/Nu4jFhThXW1XSY1w+CrNIjzH2P/7
X-Google-Smtp-Source: AGHT+IHWPoGxLFgP/cl7YWezI+vq7A5kx6FMApGjNZvY5THYLadzQDAZFdYZihSBRI+qmVTd4qkrUj4nw4ISQlX7osE=
X-Received: by 2002:a17:903:1510:b0:29f:5f5:fa91 with SMTP id
 d9443c01a7336-2a3ee472bb9mr93767755ad.27.1767967007443; Fri, 09 Jan 2026
 05:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20260109045447.1933604-1-alistair.francis@wdc.com> <20260109045447.1933604-2-alistair.francis@wdc.com>
In-Reply-To: <20260109045447.1933604-2-alistair.francis@wdc.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Jan 2026 08:56:35 -0500
X-Gm-Features: AQt7F2qVATpjlNtiGDmcOJnfQSHzSQnoxa9cRP45cZ5Sx3sZKUGckia1LsGjtes
Message-ID: <CADkTA4MCa6SsZr5-rmhFcNTq+5c0bakZ_KDr7oY_SJ4Vqm9mVg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cml1.bbclass: Support the rustavailable task
To: alistair23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000740edb0647f4e5ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229117

--000000000000740edb0647f4e5ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:55=E2=80=AFPM Alistair Francis via lists.openembe=
dded.org
<alistair23=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Allow the user to run the rustavailable kernel make command to determine
> if Rust is avaliable for kernel builds.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/classes-recipe/cml1.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/cml1.bbclass
> b/meta/classes-recipe/cml1.bbclass
> index 3c2b4da4af..efbdd2a795 100644
> --- a/meta/classes-recipe/cml1.bbclass
> +++ b/meta/classes-recipe/cml1.bbclass
> @@ -107,6 +107,15 @@ do_diffconfig[nostamp] =3D "1"
>  do_diffconfig[dirs] =3D "${KCONFIG_CONFIG_ROOTDIR}"
>  addtask diffconfig
>
> +python do_rustavailable() {
> +    oe_terminal("sh -c 'make rustavailable; if [ $? -ne 0 ]; then echo
> \"Command failed.\"; fi; printf \"Press any key to continue... \"; read
> r;'",
> +                d.getVar('PN') + ' Configuration', d)
> +}
>

This seems a bit heavy to just determine if rust is available. Since the
task is already after do_configure .. why not just check the .config ?

Bruce



> +
> +do_rustavailable[nostamp] =3D "1"
> +do_rustavailable[dirs] =3D "${KCONFIG_CONFIG_ROOTDIR}"
> +addtask rustavailable after do_configure
> +
>  do_showconfig() {
>      bbplain "Config file written to ${KCONFIG_CONFIG_ROOTDIR}/.config"
>  }
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229092):
> https://lists.openembedded.org/g/openembedded-core/message/229092
> Mute This Topic: https://lists.openembedded.org/mt/117170673/1050810
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

--000000000000740edb0647f4e5ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at 11:55=
=E2=80=AFPM Alistair Francis via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;alistair23=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alistair Francis=
 &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair=
.francis@wdc.com</a>&gt;<br>
<br>
Allow the user to run the rustavailable kernel make command to determine<br=
>
if Rust is avaliable for kernel builds.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cml1.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bb=
class<br>
index 3c2b4da4af..efbdd2a795 100644<br>
--- a/meta/classes-recipe/cml1.bbclass<br>
+++ b/meta/classes-recipe/cml1.bbclass<br>
@@ -107,6 +107,15 @@ do_diffconfig[nostamp] =3D &quot;1&quot;<br>
=C2=A0do_diffconfig[dirs] =3D &quot;${KCONFIG_CONFIG_ROOTDIR}&quot;<br>
=C2=A0addtask diffconfig<br>
<br>
+python do_rustavailable() {<br>
+=C2=A0 =C2=A0 oe_terminal(&quot;sh -c &#39;make rustavailable; if [ $? -ne=
 0 ]; then echo \&quot;Command failed.\&quot;; fi; printf \&quot;Press any =
key to continue... \&quot;; read r;&#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PN&#=
39;) + &#39; Configuration&#39;, d)<br>
+}<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">This seems a bit heavy to just determine if rust is av=
ailable. Since the</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">task is already after do_configure .. why not just check the .config ?<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+do_rustavailable[nostamp] =3D &quot;1&quot;<br>
+do_rustavailable[dirs] =3D &quot;${KCONFIG_CONFIG_ROOTDIR}&quot;<br>
+addtask rustavailable after do_configure<br>
+<br>
=C2=A0do_showconfig() {<br>
=C2=A0 =C2=A0 =C2=A0bbplain &quot;Config file written to ${KCONFIG_CONFIG_R=
OOTDIR}/.config&quot;<br>
=C2=A0}<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229092): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229092" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229092</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117170673/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117170673/1050810</a><br>
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

--000000000000740edb0647f4e5ab--

