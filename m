Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5301BEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 06:49:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.21735.1688366967700953813
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 23:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DlVFx8Op;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so5416414e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 23:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688366965; x=1690958965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/cjscw4x73v12UNQrXo1C8yyvVcXB7FI9+w5YTS0LrY=;
        b=DlVFx8OpNpy/eIV6gh+2zfDOwp3l8DbXS8Zz4gXtcswNLv8sGpeF87IOnhHg3kxIws
         n21PzquQBMQz4rnzNyJaHlpzmvIKSkCTOkfW/GxT0Sj5B+HngPb+w14ftawq2PqGy+5r
         /oaiHR8BTfhj5VTOc5qhY+Tl5NkaPHdu3zVxsKyKgkjoca1gYt5FJwHTtkekhod3y31a
         aDmdnUdlk657UKMfLsm7KrBxxDKEjbfU1PfYM0JWDCEY1Muf9Z3ezDitwrFGbp7wmU+d
         X2Si8WmKADZtTFNq/WjVYxDQGUgjkM6AaYud98MMp9WwzflhwYxtOVUF9SMFTnqOYpll
         /N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688366965; x=1690958965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cjscw4x73v12UNQrXo1C8yyvVcXB7FI9+w5YTS0LrY=;
        b=IWGsxymP/sGVNucQwv8jzDkgRxNOXrd4D7xDzWNWev/G7CyyH/f9ZL8A8ck8kM8Pes
         dwzXHtkhZvosT92fqpAiOnJowKv6qSPfkWJh/eqCTelG9gzJcksqbzfNq2xCtjzT4dS/
         zzQmLK8Yq0IJu+BDdfBez78mfk42ouwSj8ua2ZNetFUq/gNcj+f/WnBiy3k3ux9Bs/Kg
         nfingbcDi3+poo8q8JZv3hrF5HJ21Tj/rZXIJpWUpZsqKbkDXk8eEAbTkewmkn2ooZkc
         iGvej3llvx2tNExIm08vffRc53dAnXD61CaKftGGkYUJQQs2vl4L+PBUu3C2Plq9jFH6
         72tw==
X-Gm-Message-State: ABy/qLb1Fh1G58t2l/QGtMK3sUBYgf1qRhZo0E9TD7cW9219BCbJrDe9
	8i0yYSWxDSKZEjDphn92kgcay/d0NsgpnR7NFkU=
X-Google-Smtp-Source: APBJJlGaBz/8zLSjiGdxMU7JFVVnDbutjEwxqi1eIQE/nGmv3QWwFJNh6ODl9V07H0Ekw8oR+fHu+D0kSNJePIfNerg=
X-Received: by 2002:a05:6512:2006:b0:4fb:751a:98d5 with SMTP id
 a6-20020a056512200600b004fb751a98d5mr5479288lfb.18.1688366965248; Sun, 02 Jul
 2023 23:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230703025959.3968541-1-raj.khem@gmail.com> <20230703025959.3968541-2-raj.khem@gmail.com>
 <CANNYZj967uL0xN2e1VhkkVEuVvF8_-XM=mUmWAnKDHyHyZGx5Q@mail.gmail.com> <CAMKF1sqdq3U0OXhuajFR=vmmowH2CeB0L0ZisEZALz6ezTmPhA@mail.gmail.com>
In-Reply-To: <CAMKF1sqdq3U0OXhuajFR=vmmowH2CeB0L0ZisEZALz6ezTmPhA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jul 2023 08:49:14 +0200
Message-ID: <CANNYZj9c9s7DaAvFpQvxF6VF=Q7d5mWBiQq85NAccWXAdA=7JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] mesa: Point to native llvm-config
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036d87d05ff8f919c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 06:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183794

--00000000000036d87d05ff8f919c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would rather fix it in the class from the start. Sed hacks like that tend
to obscure the original problem and/or quietly regress.

Alex

On Mon 3. Jul 2023 at 8.36, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jul 2, 2023 at 10:49=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > But should this be fixed in meson class rather?
>
> I am not sure, llvm-native is not so common yet as a dependency. When
> it becomes we can revisit.
>
> >
> > Alex
> >
> > On Mon 3. Jul 2023 at 5.00, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Default search in meson would grok /usr/bin for llvm-config and if fou=
nd
> >> will use it, which might add wrong paths into cflags/ldflags, since we
> >> depend on llvm-native when building gallium support ( thats when
> >> llvm-config is effective), its better to point llvm-config into native
> >> sysroot so it can add correct paths into compiler/linker cmdline
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-graphics/mesa/mesa.inc | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> >> index 928899008e6..63d7494dfc4 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -75,6 +75,11 @@ EXTRA_OEMESON =3D " \
> >>  def strip_comma(s):
> >>      return s.strip(',')
> >>
> >> +# llvm-config should be the one from llvm-native and not from build
> host ( if llvm is installed on host )
> >> +do_write_config:append() {
> >> +    sed -i -e '/\[binaries\]/a\' -e "llvm-config =3D
> '${STAGING_BINDIR_NATIVE}/llvm-config'" ${WORKDIR}/meson.native
> >> +}
> >> +
> >>  PACKAGECONFIG =3D " \
> >>         gallium \
> >>         ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)=
}
> \
> >> --
> >> 2.41.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#183787):
> https://lists.openembedded.org/g/openembedded-core/message/183787
> >> Mute This Topic: https://lists.openembedded.org/mt/99920489/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000036d87d05ff8f919c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I would rather fix it in the class from the start. Sed ha=
cks like that tend to obscure the original problem and/or quietly regress.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 3. Jul 2=
023 at 8.36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">On Sun, Jul 2, 2023 at 10:=
49=E2=80=AFPM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; But should this be fixed in meson class rather?<br>
<br>
I am not sure, llvm-native is not so common yet as a dependency. When<br>
it becomes we can revisit.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon 3. Jul 2023 at 5.00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Default search in meson would grok /usr/bin for llvm-config and if=
 found<br>
&gt;&gt; will use it, which might add wrong paths into cflags/ldflags, sinc=
e we<br>
&gt;&gt; depend on llvm-native when building gallium support ( thats when<b=
r>
&gt;&gt; llvm-config is effective), its better to point llvm-config into na=
tive<br>
&gt;&gt; sysroot so it can add correct paths into compiler/linker cmdline<b=
r>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc | 5 +++++<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gr=
aphics/mesa/mesa.inc<br>
&gt;&gt; index 928899008e6..63d7494dfc4 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; @@ -75,6 +75,11 @@ EXTRA_OEMESON =3D &quot; \<br>
&gt;&gt;=C2=A0 def strip_comma(s):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return s.strip(&#39;,&#39;)<br>
&gt;&gt;<br>
&gt;&gt; +# llvm-config should be the one from llvm-native and not from bui=
ld host ( if llvm is installed on host )<br>
&gt;&gt; +do_write_config:append() {<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;/\[binaries\]/a\&#39; -e &quot;llvm-=
config =3D &#39;${STAGING_BINDIR_NATIVE}/llvm-config&#39;&quot; ${WORKDIR}/=
meson.native<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 PACKAGECONFIG =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gallium \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FE=
ATURES&#39;, &#39;x11 vulkan wayland&#39;, d)} \<br>
&gt;&gt; --<br>
&gt;&gt; 2.41.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#183787): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/183787" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/183787</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9992=
0489/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/99920489/1686489</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000036d87d05ff8f919c--

