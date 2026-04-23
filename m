Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E094F99362
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 09:42:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15834.1776937345537734773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 02:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b4TPS4Jf;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso8209298a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 02:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776937344; cv=none;
        d=google.com; s=arc-20240605;
        b=WNnGMfAxGWrJbGfk83OHWbe/50pX0OHT/nnU+U9osX11dqpudKKocL6z23xsHjk3dk
         1jx1awrtDEeSaDyrdxKjqWqYtKbIZyWlm2LzouEULBaAJPnCado4LlXysecxxGtPDcEt
         fNd/6DNzYw57HIkgaXXmHjy8vhMhXblzIZiYUkkB1nPs8rwoLH2MI7F+oGfAl9jDGQuS
         fLsapwedYeyCNeCmpr1r99SpVvBrJHLgnstOHS5xEmKvjBveB8FsCat7+RqKZwxoU7Sk
         ft2/LDX70sIJhrirOMK2+mz1KV1zjFPLswLCeI21seuewWsOnDhvs72YtL9fS8+7Z1+6
         q0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xk7fkfwzje5iKZKfHYBMKWxLz9Fd/5NJbeuMtfCqRXI=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=AHLm2+xIVUPTJVpJyWwraS2jWoJe9v2LMVIS4hC+i+kksQuC7hqZSmUf5WVkvJU5tU
         FZRTaNTGC3TGONrFhyRvuoLSKcCgVbY9Th5HgBfaPn3bKNTeM4denJbthIAi1Srv/uwt
         aQW0fJl0/+7jHybLf6gENIkO/YbjMl/GdBD1+D0By473GapDHuF+3RymDnSi/Q7yOJ8j
         VhxCgfbx1uTiWOaDfA698XCyc1J4ZEtwnKajZPq0j2FO+r5d8mJCRVMIphz+bUqAmhbb
         KX3ZGo0jjzvmBfGJPDORN6idGXHwYkYD3Kme6iOW7uuOG9kFG6jyNwJft/68luwVRrXw
         zxew==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776937344; x=1777542144; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk7fkfwzje5iKZKfHYBMKWxLz9Fd/5NJbeuMtfCqRXI=;
        b=b4TPS4JfY6CJPbuhrutjfv1cV5lvAWHlxhkOTthjxHfEA4DCSeMoFOE6WoHhGB+OU8
         oTvbJxpID2cvibvVes7kvA4EZClGELqaGY64oH3tOUkcoKIuJVvotImd3L4nPEfoTAP7
         Lunw7ipyvxQ3RsWR1QDhX3KEFstlrXODtZ3aVRkxHPeT7hPoJVPt3lwzjd5zi041YQIP
         59esiB/ArJqBPzxoULBXPYBz0ZQh8dT66BgwJoP4VhVcFaoVKA32JpIXniuyQgwdNCKd
         jsF3524jHsy0grXl5lRGAhPgRja44zh6wWPP3ZxAEVgr88j67CS++HiM16BSmbf9x723
         j72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937344; x=1777542144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk7fkfwzje5iKZKfHYBMKWxLz9Fd/5NJbeuMtfCqRXI=;
        b=sdzjPwEouMu2EgPztUPgfE9oiKCkQeq+ovjqBDmvLCGfP1ZHy6KjOTr0WwRz5olQTw
         /X0mCTKpgwkSJ7YGLEp2825CaNCKX7sW9eHKf2lS99bCJ1Tzo/3r5M2P+O7hrIZ12PDx
         MwOBJDoXabOw3FXMSmzty7TVLAkOVJhT7tX2lqHzWUth5wImiAzAzDA/PfKCpOG5Pot5
         quw1A3x3WP7kHg4SAWo0N07mGyNeyFLLz86Lb9pCBTGxwvzF2rPI8nKx5UHG/FIW0WXV
         yJdXVQWtGkeh3X1rWT6K7OwH7g7qOJpCHU63/cMj1ba9Yq1QHtMS8hksu/4C80MmLZjk
         FZ3A==
X-Gm-Message-State: AOJu0YypehYFFDmk7pABaVJuKbZeAUK4WUYxJpAVW7qwAwe8N2A7ysYl
	dVWhYIQ6zF4QGa+CSSxyEZc1zrFbmFmH6dYgybNnIwAgaPG9HxKo+M1TVtWiV63zlFV5yphg+78
	GA/PbjyOgsxB2/bmnStNT72ZZRdEcKH0=
X-Gm-Gg: AeBDiesLlmyvMsSulX8KhaNahQjuMxC2L4VQa435EJS2ppUb2Dh8LXKXZTbDJHqw0Yu
	lHy8p0kOWILQjHLHnc4pcKNwhjjw8RcjKQ4vgbfz21T2W7vK7WE0BGIOhymQbY4iFoHnTqyCWxg
	pLQTNT+XX4m/3HIJzRnrOlCjgDgAY4zJra/Y7OaE1mVXdpQhkFQiGV8qLGcLEA8qxEdtIeiH5JQ
	EuxnvNfXVGAFF64h/W//OLrEMvxsOU+Szbw6jhGw0XmeopuDaqgXMdpnUmNOlMXyX0Grd6i4c/Z
	CryBIRn7d5RpIBbyxo6hDHPC34mYPH+pIhuJ5cjn+GPV/7sxPHwgU/MhvcREkR8MTxgC7ruOkHb
	ZcAKikA==
X-Received: by 2002:a17:907:72c6:b0:ba6:1412:9339 with SMTP id
 a640c23a62f3a-ba6141295bfmr1047587066b.20.1776937343238; Thu, 23 Apr 2026
 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
 <20260401-default-features-v3-2-8f4b40401ab7@pbarker.dev> <18A8B511426C8EDA.1516946@lists.openembedded.org>
 <CANPvuRmjv0YyiPqACX6JuhUfxSTYsiCQfstHxA+kFmE0sny+bg@mail.gmail.com> <b44d65517593ec7279aef2618f49e00908eb938c.camel@pbarker.dev>
In-Reply-To: <b44d65517593ec7279aef2618f49e00908eb938c.camel@pbarker.dev>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 23 Apr 2026 10:42:11 +0100
X-Gm-Features: AQROBzAjH03JOh9ttGe3uxDvkaXbMBdMrqok3yNqVHehyAvjUtwyWeBtcHxfSpM
Message-ID: <CANPvuRknbV72HkpBRBeuGxAKViS9JOW=3xTYc_P50ePGR8L=LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/4] meta: Support opting out of any distro features
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000021c93d06501d77b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 09:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235753

--00000000000021c93d06501d77b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul Barker <paul@pbarker.dev> escreveu (quinta, 23/04/2026 =C3=A0(s) 10:12=
):

> On Wed, 2026-04-22 at 21:26 +0100, Jose Quaresma wrote:
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> > gmail.com@lists.openembedded.org> escreveu (quarta, 22/04/2026 =C3=A0(s=
)
> 15:45):
> >
> > > Hi Paul,
> > >
> > > I think I found a bug that is somehow related to
> DISTRO_FEATURES_DEFAULTS.
> > > I don't understand why, but the variables in
> > > DISTRO_FEATURES_DEFAULTS cannot
> > > be used in inherit or inherit_defer.
> > >
> > > Let's use the following recipe as an example:
> > >
> > >
> -------------------------------------------------------------------------=
------------------------------------------
> > > mkdir -p recipes-test/inherit
> > > cat <<'EOF' >recipes-test/inherit/inherit.bb
> > >
> > > LICENSE =3D "MIT"
> > >
> > > # FAIL
> > > PACKAGECONFIG ??=3D " \
> > >         ${@bb.utils.contains('DISTRO_FEATURES',
> > > 'gobject-introspection-data', 'ccache', '', d)} \
> > >         ${@bb.utils.contains('DISTRO_FEATURES',
> > > 'gobject-introspection-data', 'vala', '', d)} \
> > > "
> > >
> > > # OK
> > > #PACKAGECONFIG ??=3D " \
> > > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'ccache',
> '',
> > > d)} \
> > > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'vala', '=
',
> > > d)} \
> > > #"
> > >
> > > # get PACKAGECONFIG
> > > # bitbake-getvar -r inherit PACKAGECONFIG
> > >
> > > # get CCACHE_TOP_DIR
> > > # bitbake-getvar -r inherit CCACHE_TOP_DIR
> > > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
> > >
> > > # get VALADEPENDS
> > > # bitbake-getvar -r inherit VALADEPENDS
> > > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
> > > EOF
> > >
> > >
> -------------------------------------------------------------------------=
------------------------------------------
> > >
> >
> > A clearer way to replicate the problem:
> >
> > #
> >
> -------------------------------------------------------------------------=
------------------------------------------
> > mkdir -p recipes-test/inherit
> > cat <<'EOF' >recipes-test/inherit/inherit.bb
> > LICENSE =3D "MIT"
> >
> > DISTRO_FEATURES_DEFAULTS +=3D "aaa"
> > DISTRO_FEATURES +=3D "bbb"
> >
> > PACKAGECONFIG =3D " \
> >         ${@bb.utils.contains('DISTRO_FEATURES', 'aaa', 'ccache', '', d)=
}
> \
> >         ${@bb.utils.contains('DISTRO_FEATURES', 'bbb', 'vala', '', d)} =
\
> > "
> >
> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
> >
> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
> > EOF
> > #
> >
> -------------------------------------------------------------------------=
------------------------------------------
> > bitbake-getvar --value -r inherit PACKAGECONFIG
> > bitbake-getvar --value -r inherit CCACHE_TOP_DIR
> > bitbake-getvar --value -r inherit VALADEPENDS
> > #
> >
> -------------------------------------------------------------------------=
------------------------------------------
> >
> >
> > The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:
> >  'aaa' maps to  'ccache'
> >  'bbb' maps to  'vala'
> >
> > I chose these two classes, but it could be any others. The idea is to s=
ee
> > if they were inherited by looking at the class variables.
> > The ccache.bbclass was not inherit and so the variable 'CCACHE_TOP_DIR'
> is
> > not defined.
> >
> >
> > Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn't work for thes=
e
> > cases, which in my opinion is not expected.
> >
> > I encountered this problem while debugging the patch
> > https://lists.openembedded.org/g/openembedded-devel/topic/118939974.
> >
> > Best regards,
> > Jose
> >
>
> Hi Jose,
>
> We can simplify this even further to demonstrate what bitbake is doing:
>
>     LICENSE =3D "MIT"
>
>     python () {
>         d.setVar('MAYBE_VALA', 'vala')
>     }
>
>     inherit_defer ${@bb.utils.filter('MAYBE_VALA', 'vala', d)}
>
> Looking at the output of `bitbake -e`, MAYBE_VALA is set to "vala" but
> the vala bbclass is not included.
>
> If we simplify the last line to `inherit_defer ${MAYBE_VALA}` we get a
> parse error. It also doesn't work with plain inherit.


> This contadicts the example in the bitbake docs [1], which suggests that
> a variable assigned in an anonymous Python block can be used with
> inherit_defer.
>
> [1]:
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-use=
r-manual-metadata.html#inherit-defer-directive
>
> I will investigate further!
>

Looks like you found a much simpler way to reproduce.
Yesterday I spent all afternoon trying to figure out a way to reproduce it
because at first it didn't make any sense at all.

It seems the problem is somehow related to the python setvar usage.
Given that some of the values in DISTRO_FEATURES are now set using the
setvar function,
like the ones from DISTRO_FEATURES_DEFAULTS, it will suffer from this
problem.

Thus some of the elements in DISTRO_FEATURES won't be usable in
inherit/inherit_defer.
This is a serious bug affecting DISTRO_FEATURES, which is widely used.

I will continue my analysis as well, but I doubt I will find any solution.

Thanks

Jose


> Best regards,
>
> --
> Paul Barker
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000021c93d06501d77b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Paul Barker &lt=
;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt; escreveu (qui=
nta, 23/04/2026 =C3=A0(s) 10:12):<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, 2026-04-22 at 21:26 +0100, Jose Quaresma wrote:<b=
r>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
br>
&gt; <a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">=
gmail.com@lists.openembedded.org</a>&gt; escreveu (quarta, 22/04/2026 =C3=
=A0(s) 15:45):<br>
&gt; <br>
&gt; &gt; Hi Paul,<br>
&gt; &gt; <br>
&gt; &gt; I think I found a bug that is somehow related to DISTRO_FEATURES_=
DEFAULTS.<br>
&gt; &gt; I don&#39;t understand why, but the variables in<br>
&gt; &gt; DISTRO_FEATURES_DEFAULTS cannot<br>
&gt; &gt; be used in inherit or inherit_defer.<br>
&gt; &gt; <br>
&gt; &gt; Let&#39;s use the following recipe as an example:<br>
&gt; &gt; <br>
&gt; &gt; -----------------------------------------------------------------=
--------------------------------------------------<br>
&gt; &gt; mkdir -p recipes-test/inherit<br>
&gt; &gt; cat &lt;&lt;&#39;EOF&#39; &gt;recipes-test/inherit/<a href=3D"htt=
p://inherit.bb" rel=3D"noreferrer" target=3D"_blank">inherit.bb</a><br>
&gt; &gt; <br>
&gt; &gt; LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; <br>
&gt; &gt; # FAIL<br>
&gt; &gt; PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;,<br>
&gt; &gt; &#39;gobject-introspection-data&#39;, &#39;ccache&#39;, &#39;&#39=
;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;,<br>
&gt; &gt; &#39;gobject-introspection-data&#39;, &#39;vala&#39;, &#39;&#39;,=
 d)} \<br>
&gt; &gt; &quot;<br>
&gt; &gt; <br>
&gt; &gt; # OK<br>
&gt; &gt; #PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; #=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, &#39;ccache&#39;, &#39;&#39;,<br>
&gt; &gt; d)} \<br>
&gt; &gt; #=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, &#39;vala&#39;, &#39;&#39;,<br>
&gt; &gt; d)} \<br>
&gt; &gt; #&quot;<br>
&gt; &gt; <br>
&gt; &gt; # get PACKAGECONFIG<br>
&gt; &gt; # bitbake-getvar -r inherit PACKAGECONFIG<br>
&gt; &gt; <br>
&gt; &gt; # get CCACHE_TOP_DIR<br>
&gt; &gt; # bitbake-getvar -r inherit CCACHE_TOP_DIR<br>
&gt; &gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;cc=
ache&#39;, d)}<br>
&gt; &gt; <br>
&gt; &gt; # get VALADEPENDS<br>
&gt; &gt; # bitbake-getvar -r inherit VALADEPENDS<br>
&gt; &gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;va=
la&#39;, d)}<br>
&gt; &gt; EOF<br>
&gt; &gt; <br>
&gt; &gt; -----------------------------------------------------------------=
--------------------------------------------------<br>
&gt; &gt; <br>
&gt; <br>
&gt; A clearer way to replicate the problem:<br>
&gt; <br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; mkdir -p recipes-test/inherit<br>
&gt; cat &lt;&lt;&#39;EOF&#39; &gt;recipes-test/inherit/<a href=3D"http://i=
nherit.bb" rel=3D"noreferrer" target=3D"_blank">inherit.bb</a><br>
&gt; LICENSE =3D &quot;MIT&quot;<br>
&gt; <br>
&gt; DISTRO_FEATURES_DEFAULTS +=3D &quot;aaa&quot;<br>
&gt; DISTRO_FEATURES +=3D &quot;bbb&quot;<br>
&gt; <br>
&gt; PACKAGECONFIG =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;aaa&#39;, &#39;ccache&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;bbb&#39;, &#39;vala&#39;, &#39;&#39;, d)} \<br>
&gt; &quot;<br>
&gt; <br>
&gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;ccache&=
#39;, d)}<br>
&gt; <br>
&gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;vala&#3=
9;, d)}<br>
&gt; EOF<br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; bitbake-getvar --value -r inherit PACKAGECONFIG<br>
&gt; bitbake-getvar --value -r inherit CCACHE_TOP_DIR<br>
&gt; bitbake-getvar --value -r inherit VALADEPENDS<br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; <br>
&gt; <br>
&gt; The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:<br>
&gt;=C2=A0 &#39;aaa&#39; maps to=C2=A0 &#39;ccache&#39;<br>
&gt;=C2=A0 &#39;bbb&#39; maps to=C2=A0 &#39;vala&#39;<br>
&gt; <br>
&gt; I chose these two classes, but it could be any others. The idea is to =
see<br>
&gt; if they were inherited by looking at the class variables.<br>
&gt; The ccache.bbclass was not inherit and so the variable &#39;CCACHE_TOP=
_DIR&#39; is<br>
&gt; not defined.<br>
&gt; <br>
&gt; <br>
&gt; Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn&#39;t work for=
 these<br>
&gt; cases, which in my opinion is not expected.<br>
&gt; <br>
&gt; I encountered this problem while debugging the patch<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/topic/1=
18939974" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-devel/topic/118939974</a>.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Jose<br>
&gt; <br>
<br>
Hi Jose,<br>
<br>
We can simplify this even further to demonstrate what bitbake is doing:<br>
<br>
=C2=A0 =C2=A0 LICENSE =3D &quot;MIT&quot;<br>
<br>
=C2=A0 =C2=A0 python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;MAYBE_VALA&#39;, &#39;vala&#39;)<=
br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 inherit_defer ${@bb.utils.filter(&#39;MAYBE_VALA&#39;, &#39;v=
ala&#39;, d)}<br>
<br>
Looking at the output of `bitbake -e`, MAYBE_VALA is set to &quot;vala&quot=
; but<br>
the vala bbclass is not included.<br>
<br>
If we simplify the last line to `inherit_defer ${MAYBE_VALA}` we get a<br>
parse error. It also doesn&#39;t work with plain inherit.</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
This contadicts the example in the bitbake docs [1], which suggests that<br=
>
a variable assigned in an anonymous Python block can be used with<br>
inherit_defer.<br>
<br>
[1]: <a href=3D"https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manu=
al/bitbake-user-manual-metadata.html#inherit-defer-directive" rel=3D"norefe=
rrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/dev/bitbake-u=
ser-manual/bitbake-user-manual-metadata.html#inherit-defer-directive</a><br=
>
<br>
I will investigate further!<br></blockquote><div><br></div><div>Looks like =
you found a much simpler way to reproduce.</div><div>Yesterday I spent all =
afternoon trying to figure out a way to reproduce it because at first it di=
dn&#39;t make any sense at all.<br><br>It seems the problem is somehow rela=
ted to the python setvar usage.<br>Given that some of the values in DISTRO_=
FEATURES=C2=A0are now set using the setvar=C2=A0function,</div><div>like th=
e ones from=C2=A0DISTRO_FEATURES_DEFAULTS, it will suffer from this problem=
.</div><div><br></div><div>Thus some of the elements in DISTRO_FEATURES won=
&#39;t be usable in inherit/inherit_defer.<br>This is a serious bug affecti=
ng DISTRO_FEATURES, which is widely used.</div><div><br></div><div>I will c=
ontinue my analysis as well, but I doubt I will find any solution.</div><di=
v><br></div><div>Thanks</div><div><br></div><div>Jose</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000021c93d06501d77b5--

