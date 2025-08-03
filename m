Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAA3C87FD3
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 01:38:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.9651.1754185083444331804
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 18:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjlLuFt4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ec651c2a1so1749784a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 18:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754185083; x=1754789883; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AL7KEHN1X2pDTzzAipeOyI1rV3+RIX8ZU6s1U84c3E8=;
        b=CjlLuFt4ChspSGTEVIUKTkVEjxzrVfa78iWvdaDYNszf/zUacK0+3+/l/Hna7hG57k
         OSkGKYvNwCSMhmkmo4jzQWKL+oXi2oHc01VzBqInTv07R1ULNoueNtPWaMeOr8NGNHvK
         zlcsM16mE0E78/mTPWvZ9zFJ6yletVGDQUxH2lkrvAO7ZA6uOdBS3PWG2vASvUBhjh82
         VA+VLfo1Ge4YAs6FiN+n/HPkmGilmHczGCK/kJDPwcKr+AObLF1nwfe8ApXtyVPy0/k0
         n/x2YiM4oK29e6qFbk9bs5tBpitwdg0PajpGZ7QMaMwqMPP3hHIG1gAgqXnyjBvLGfDW
         PyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754185083; x=1754789883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AL7KEHN1X2pDTzzAipeOyI1rV3+RIX8ZU6s1U84c3E8=;
        b=YNZ199k61r6riz9Hs190EzVwygGbOOc3GFABv9Vuy+tBZsMdY1HX3KfTnY/hfXFNpi
         XPZiQ9kszuXvsKA8MQj0OGNqn7I+CooslpTeY4Ix0qE1sF5jAPpp3r4cF207sdwBU2WY
         ecZPHJ+ok7Z26PB8Iyaq98xPtl1B8zXMahq7uwReZ8UcQQeB6OdGhlYu24vUptmSCFaw
         Pr22sWxQmgP4OqLCjemVzRNaiVmJqTkoSeXfSRsrz0XItcmTTEwp+O1uyWoK1pqYGb+m
         mN1vCccnBQiN75ih3Fytqa1tiZ2aGeYjF68Wn4NCjLB1cXcuBn8VgvDIZaKVwSrXpmH+
         RkWQ==
X-Gm-Message-State: AOJu0YwRUOW+PKE+xklGId646FPMk/N3MXmgy7PQCCS1yf4n2zwP9Lb6
	u7X0xHPnDu9lP0WnjciGxiEQ1knGJcVl7ouaBxDCSLqv1yxdEKN77w9DYNxjQ2RNWA4WPu79Mnr
	M+dX0DxTyUJ3QGFlJW6I0O186rrQBYXQ=
X-Gm-Gg: ASbGnct6SsOBxnwREd7R/m03DmSGHBM70VfHpE6isFWJ5mdf8tdO2AdGP+A99J3C68n
	OTGG7Zgz30cYAULiaNelpM13IQGb+SWASV9GF5Wy3M4WQ6VKRU3J5Ap0HdfyIjrsvVDy0pYt8eN
	MRqPJMgM6uJ4vByTWirzEyEongfysZ2KqwQ345JmZB2xwLZJrQyPiyqQg/I7EVL+W98Z/UJxcTt
	j9ivvmt
X-Google-Smtp-Source: AGHT+IEOxS/SfA/Mj00Qt66Ht/aiNhnZX67thiU0iYCXKLbYVOOhoGgcfIwybNYFnwLLolYdmpFfI478EC1soExXwWQ=
X-Received: by 2002:a17:90b:3145:b0:312:e91c:e340 with SMTP id
 98e67ed59e1d1-3211630be2fmr6895092a91.35.1754185082688; Sat, 02 Aug 2025
 18:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250802140649.18734-1-anakin@childerhose.ca>
In-Reply-To: <20250802140649.18734-1-anakin@childerhose.ca>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Aug 2025 22:37:51 -0300
X-Gm-Features: Ac12FXzpjyp9LA2WcXJsfRYLsDwqrvxmNjjQp_HVYw-8a2i3h9dwBoFaDLZnOIA
Message-ID: <CADkTA4M3oOErNXzNK0AgAq5XDg6Uwn20ovzfKH-K7kb5LPwDLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: generate compile_commands.json
To: anakin@childerhose.ca
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b95c95063b6c0ac3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 01:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221400

--000000000000b95c95063b6c0ac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 11:06=E2=80=AFAM Anakin Childerhose via
lists.openembedded.org <anakin=3Dchilderhose.ca@lists.openembedded.org> wro=
te:

> Add do_generate_compile_commands() task after compiling to have the
> clangd language server be configured correctly for the kernel by
> default.
>
> Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
>
> Upstream-Status: Pending
>

What part of this is pending upstream ?



> ---
>  meta/classes-recipe/kernel.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index eb03424dfc..ef7f00e6dc 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -464,6 +464,20 @@ do_compile_kernelmodules() {
>  }
>  addtask compile_kernelmodules after do_compile before do_strip
>
> +do_generate_compile_commands[doc] =3D "Generate compile_commands.json fo=
r
> the clangd language server"
> +do_generate_compile_commands() {
> +       if ! [ -f "${S}/scripts/clang-tools/gen_compile_commands.py" ];
> then
> +               bbwarn "no gen_compile_commands.py script, cannot generat=
e
> compile_commands.json"
>

What if I have no interest in clang, I wouldn't want this to warn if for
some reason my kernel doesn't have this support.

To me, this should be something that is opt-in via a distro feature (or
similar).

Bruce



> +               return
> +       fi
> +
> +       cd ${B} && ${S}/scripts/clang-tools/gen_compile_commands.py \
> +               --output "${S}/compile_commands.json" || {
> +                       bbwarn "failed to generate compile_commands.json"
> +       }
> +}
> +addtask generate_compile_commands after do_compile_kernelmodules
> +
>  kernel_do_install() {
>         #
>         # First install the modules
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221383):
> https://lists.openembedded.org/g/openembedded-core/message/221383
> Mute This Topic: https://lists.openembedded.org/mt/114501421/1050810
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

--000000000000b95c95063b6c0ac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 2, 2025 at 11:06=
=E2=80=AFAM Anakin Childerhose via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;anakin=3D<a href=3D"mailto:childerhose.ca@=
lists.openembedded.org">childerhose.ca@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add do_generat=
e_compile_commands() task after compiling to have the<br>
clangd language server be configured correctly for the kernel by<br>
default.<br>
<br>
Signed-off-by: Anakin Childerhose &lt;<a href=3D"mailto:anakin@childerhose.=
ca" target=3D"_blank">anakin@childerhose.ca</a>&gt;<br>
<br>
Upstream-Status: Pending<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">What part of this is pending upstr=
eam ?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index eb03424dfc..ef7f00e6dc 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -464,6 +464,20 @@ do_compile_kernelmodules() {<br>
=C2=A0}<br>
=C2=A0addtask compile_kernelmodules after do_compile before do_strip<br>
<br>
+do_generate_compile_commands[doc] =3D &quot;Generate compile_commands.json=
 for the clangd language server&quot;<br>
+do_generate_compile_commands() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -f &quot;${S}/scripts/clang-tools/gen_co=
mpile_commands.py&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;no gen=
_compile_commands.py script, cannot generate compile_commands.json&quot;<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">What if I have no interest in clang, I wouldn&#39;t want this=
 to warn if for some reason my kernel doesn&#39;t have this support.</div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">To me,=
 this should be something that is opt-in via a distro feature (or similar).=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B} &amp;&amp; ${S}/scripts/clang-tools/gen=
_compile_commands.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--output &quot;${S}=
/compile_commands.json&quot; || {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;failed to generate compile_commands.json&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+addtask generate_compile_commands after do_compile_kernelmodules<br>
+<br>
=C2=A0kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First install the modules<br>
--<br>
2.50.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#221383): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/221383" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/221383</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114501421/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114501421/1050810</a><br>
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

--000000000000b95c95063b6c0ac3--

