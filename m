Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1633C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:17:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.20511.1744359423856701088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 01:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=XY2laa/7;
 spf=pass (domain: snapchat.com, ip: 209.85.218.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbb12bea54so337146566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1744359422; x=1744964222; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+vaeyJaooMGv/xxD1zOUspCW6Vw3HbWKnmekUmVno/0=;
        b=XY2laa/7UtOtMX1qEW8aP+ExTwfkhJDySWfl/AU1FFB6dOiGSGoqPX4x/qLeD8tiLK
         d0IqWh4cl+F9hgHtoDKtdjjJPaeswRfXKTkP5eZt743RJQaJYD9KCfHKe8/CFPE4hKMW
         uLlYvAUjM4q+ZnNNf49ZLGgy2IwNxJvOERvwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359422; x=1744964222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vaeyJaooMGv/xxD1zOUspCW6Vw3HbWKnmekUmVno/0=;
        b=Kzfkx7ujn8np2k2IF1fwkwkYYaYC/qrE5rla8XeAMtawh9mUZMk+k+RH455gZhCKbC
         gv86OBucZ9rOYl9hH1VoCsR+smv7sJGzEu09hanSdqzia4r8M7PQJV6Bd2Iy2GEx+fCF
         Mhk64xLgH4NhQ2PMXKqTSki6ZBDMRFuy2wE72sPgkLx6vkDns3T4mUjAUS5o3/wzS/5a
         nsLKUGeYi/6k/XZyDlsTyBm50x9h18mkMxo5MeW+NVaGZhm1Z5Gy8KGr0fmpdaKbvSet
         Nq4N5oUSfeqKvNWSLdhpxKBIEiElJy3eF1rrhPv0pJ1qmOcXYiNujiXrm5jRp0srRzze
         +toQ==
X-Gm-Message-State: AOJu0YziXsNvcKhmrVhtizGw4C+wSEwdDexNPUV4u2eCH2OCirfsWFBu
	Z7J5YaH0nNg1gka3EIZEBNvB7Hkyhd2Hqlbz80f2e3hcz82M2HdFNlXkCrjHyVEtwdcBB5pxvqj
	hsoFz58JPZ6E9sb/UimuBW/V+Z4f5QvjasCJmdA==
X-Gm-Gg: ASbGncsH+X7uwxTEo3OjT1jHZaGzM2iBLOj0yUubgtY5AxCshylByYz3Yn9abmCdmUR
	YRS7f8HLbYI1QiB9RwM8X1M8VJj5V02hNPrlweH8cD27rW2DEjux0htyl1JE3RID/fSG+ZoN2Zg
	+fsF2RyZ03Gb6Tsr9bzuU8V3o=
X-Google-Smtp-Source: AGHT+IHJzU7bEdUS/Wa73viAA4f14Nwul8FMSYMuctuKHynNHSB7QksoBHP6tLDbUso2G+/QGc9NFhLqGyW4oiQ3M/A=
X-Received: by 2002:a17:907:8686:b0:ac7:e6c5:238e with SMTP id
 a640c23a62f3a-acad34dddfcmr134848966b.35.1744359421777; Fri, 11 Apr 2025
 01:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250410192632.2818966-1-ecordonnier@snap.com>
 <20250410192632.2818966-2-ecordonnier@snap.com> <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
 <CAHUKmYZkZ0FqSR00-RL+Tbp5v5B2u6ouK3WG+dvdAj3K0FHRAQ@mail.gmail.com> <CANNYZj9_mVZKE2tncTMrHPc69jOhBNJ4xa2h+9HQb=MYdLkaxQ@mail.gmail.com>
In-Reply-To: <CANNYZj9_mVZKE2tncTMrHPc69jOhBNJ4xa2h+9HQb=MYdLkaxQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 11 Apr 2025 10:16:50 +0200
X-Gm-Features: ATxdqUHB3kQVAq87sxbNlrs_qgCi_8NBxzeVkgfFIy4R39MRY2ygvDuQ7szX854
Message-ID: <CAHUKmYb7mim6w-2o+2t7vXocVa7w8_eQ0WxnunnbDBRPQZJ-cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] source-highlight: re-add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b23ea906327c53ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 08:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214718

--000000000000b23ea906327c53ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, in that case except if I receive other opinions, I would propose to
merge the patch adding the PACKAGECONFIG option to gdb, and I'll send
another PR adding source-highlight to meta-oe.

=C3=89tienne

On Thu, Apr 10, 2025 at 9:35=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> I don;t think source highlighting in gdb quite qualifies as a core
> embedded functionality? I'd say meta-oe is better.
>
> Alex
>
> On Thu, 10 Apr 2025 at 21:32, Etienne Cordonnier <ecordonnier@snap.com>
> wrote:
> >
> > That's fair enough. My thinking was to try to upstream first to core,
> since it used to be there before it was removed, and to also get feedback
> on whether you would want to enable this per default gdb. I can also move
> it to meta-oe if you think it is better.
> >
> > =C3=89tienne
> >
> > On Thu, Apr 10, 2025 at 9:28=E2=80=AFPM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>
> >> Unless you want to enable it by default in gdb (and the other patch
> >> shows that is not the case), source-highlight does not have to be in
> >> core. We have plenty of recipes in core with options that require
> >> items from meta-oe or other layers.
> >>
> >> Alex
> >>
> >> On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via
> >> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> >> wrote:
> >> >
> >> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >> >
> >> > source-highlight version 3.1.8 was removed in
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproje=
ct.org_poky_commit_-3Fid-3D6560db9ddfd39a2715ede96430228306b00f53dd&d=3DDwI=
BaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4=
_yp3Vldzt83qQW4zvi&s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&e=3D
> in June 2019 because the was no user left,
> >> > however there is now a gdb PACKAGECONFIG option which uses it. Since
> the last release was in 2019, let's rather use the latest git version.
> >> >
> >> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> >> > ---
> >> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >> >  .../source-highlight/source-highlight_git.bb  | 36
> +++++++++++++++++++
> >> >  2 files changed, 37 insertions(+)
> >> >  create mode 100644 meta/recipes-support/source-highlight/
> source-highlight_git.bb
> >> >
> >> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> >> > index 2b47d3103c0..831494312b6 100644
> >> > --- a/meta/conf/distro/include/maintainers.inc
> >> > +++ b/meta/conf/distro/include/maintainers.inc
> >> > @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D
> "Unassigned <unassigned@yoctoproject.org
> >> >  RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >> >  RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
> >> >  RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.co=
m>"
> >> > +RECIPE_MAINTAINER:pn-source-highlight =3D "Etienne Cordonnier <
> ecordonnier@snap.com>"
> >> >  RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <
> michael@opdenacker.org>"
> >> >  RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <
> michael@opdenacker.org>"
> >> >  RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <
> quaresma.jose@gmail.com>"
> >> > diff --git a/meta/recipes-support/source-highlight/
> source-highlight_git.bb b/meta/recipes-support/source-highlight/
> source-highlight_git.bb
> >> > new file mode 100644
> >> > index 00000000000..ad5085250cb
> >> > --- /dev/null
> >> > +++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
> >> > @@ -0,0 +1,36 @@
> >> > +SUMMARY =3D "Syntax highlight utility"
> >> > +DESCRIPTION =3D "Source-highlight converts source code to formatted
> text with syntax highlighting."
> >> > +HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.gnu.org_softwa=
re_src-2Dhighlite_&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMgg=
BpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DlwbvDkI4fDkloLf3cs3QeCgqOB=
F_LRpfobo2v-EYtEc&e=3D
> "
> >> > +LICENSE =3D "GPL-3.0-only"
> >> > +SECTION =3D "libs"
> >> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;;md5=3Dff95bfe019feaf92f524b73dd79e76eb"
> >> > +
> >> > +SRCREV =3D "894cacd0799ca60afa359a63782729dec76cbb79"
> >> > +PV =3D "3.1.9+git"
> >> > +SRC_URI =3D "git://
> git.savannah.gnu.org/git/src-highlite.git;protocol=3Dhttps;branch=3Dmaste=
r"
> >> > +S =3D "${WORKDIR}/git"
> >> > +
> >> > +inherit autotools pkgconfig
> >> > +
> >> > +DEPENDS:append =3D " bison-native boost"
> >> > +
> >> > +DEPENDS:append:class-target =3D " ${PN}-native"
> >> > +
> >> > +EXTRA_OECONF=3D"--with-boost-regex=3Dboost_regex"
> >> > +
> >> > +BBCLASSEXTEND =3D "native nativesdk"
> >> > +
> >> > +PACKAGES +=3D "${PN}-tools ${PN}-data"
> >> > +
> >> > +RDEPENDS:${PN} =3D "boost-regex ${PN}-data"
> >> > +RDEPENDS:${PN}-tools =3D "${PN} ${PN}-data bash"
> >> > +
> >> > +FILES:${PN}       =3D "${libdir}/*${SOLIBS}"
> >> > +FILES:${PN}-data  =3D "${datadir}/source-highlight"
> >> > +FILES:${PN}-tools =3D "${bindir} ${sysconfdir}/bash_completion.d"
> >> > +
> >> > +# source-highlight is using its own binary from the build tree to
> make documentation
> >> > +# let's substitute the native binary instead
> >> > +do_configure:prepend:class-target () {
> >> > +     sed -i -e 's,^SRCHILITEEXE =3D $(top_builddir).*,SRCHILITEEXE =
=3D
> source-highlight,' ${S}/doc/Makefile.am
> >> > +}
> >> > --
> >> > 2.43.0
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#214702):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_214702&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3D59g=
bMbCXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&e=3D
> >> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_112197845_1686489&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFA=
WS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DLl_TLcnLKTlhI4Rm2ka=
Zpieo_LWka4TfPLOsJ6o8ER4&e=3D
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-Vl=
yTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DJcEYIhnX11pb=
laVhmSRW-5aSQ5QHO6L9M7ugjPg0uWU&e=3D
> [alex.kanavin@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000b23ea906327c53ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, in that case except if I receive other opinions, I wou=
ld propose to merge the patch adding the PACKAGECONFIG option to gdb, and I=
&#39;ll send another PR adding source-highlight to meta-oe.<br><br>=C3=89ti=
enne</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Apr 10, 2025 at 9:35=E2=80=AFPM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">I don;t think source highlighting in gdb quite qualifies as a core<br>
embedded functionality? I&#39;d say meta-oe is better.<br>
<br>
Alex<br>
<br>
On Thu, 10 Apr 2025 at 21:32, Etienne Cordonnier &lt;<a href=3D"mailto:ecor=
donnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt; wrote:<br>
&gt;<br>
&gt; That&#39;s fair enough. My thinking was to try to upstream first to co=
re, since it used to be there before it was removed, and to also get feedba=
ck on whether you would want to enable this per default gdb. I can also mov=
e it to meta-oe if you think it is better.<br>
&gt;<br>
&gt; =C3=89tienne<br>
&gt;<br>
&gt; On Thu, Apr 10, 2025 at 9:28=E2=80=AFPM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Unless you want to enable it by default in gdb (and the other patc=
h<br>
&gt;&gt; shows that is not the case), source-highlight does not have to be =
in<br>
&gt;&gt; core. We have plenty of recipes in core with options that require<=
br>
&gt;&gt; items from meta-oe or other layers.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto=
:snap.com@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembe=
dded.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; source-highlight version 3.1.8 was removed in <a href=3D"http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproject.org=
_poky_commit_-3Fid-3D6560db9ddfd39a2715ede96430228306b00f53dd&amp;d=3DDwIBa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLf=
hQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66=
b8ZzI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproject.org_poky_commit_-3Fid=
-3D6560db9ddfd39a2715ede96430228306b00f53dd&amp;d=3DDwIBaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldz=
t83qQW4zvi&amp;s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&amp;e=3D</a>=
=C2=A0 in June 2019 because the was no user left,<br>
&gt;&gt; &gt; however there is now a gdb PACKAGECONFIG option which uses it=
. Since the last release was in 2019, let&#39;s rather use the latest git v=
ersion.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecord=
onnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 .../source-highlight/<a href=3D"http://source-highlight=
_git.bb" rel=3D"noreferrer" target=3D"_blank">source-highlight_git.bb</a>=
=C2=A0 | 36 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 37 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/source-highligh=
t/<a href=3D"http://source-highlight_git.bb" rel=3D"noreferrer" target=3D"_=
blank">source-highlight_git.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/=
conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; index 2b47d3103c0..831494312b6 100644<br>
&gt;&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D=
 &quot;Unassigned &lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=
=3D"_blank">unassigned@yoctoproject.org</a><br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-signing-keys =3D &quot;Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bl=
ank">richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-slang =3D &quot;Yi Zhao &lt;<a hre=
f=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com<=
/a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-socat =3D &quot;Hongxu Jia &lt;<a =
href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windr=
iver.com</a>&gt;&quot;<br>
&gt;&gt; &gt; +RECIPE_MAINTAINER:pn-source-highlight =3D &quot;Etienne Cord=
onnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordo=
nnier@snap.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-speex =3D &quot;Michael Opdenacker=
 &lt;<a href=3D"mailto:michael@opdenacker.org" target=3D"_blank">michael@op=
denacker.org</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-speexdsp =3D &quot;Michael Opdenac=
ker &lt;<a href=3D"mailto:michael@opdenacker.org" target=3D"_blank">michael=
@opdenacker.org</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-spirv-headers =3D &quot;Jose Quare=
sma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quares=
ma.jose@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/source-highlight/<a href=3D=
"http://source-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">sourc=
e-highlight_git.bb</a> b/meta/recipes-support/source-highlight/<a href=3D"h=
ttp://source-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">source-=
highlight_git.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 00000000000..ad5085250cb<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/source-highlight/<a href=3D"http:/=
/source-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">source-highl=
ight_git.bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,36 @@<br>
&gt;&gt; &gt; +SUMMARY =3D &quot;Syntax highlight utility&quot;<br>
&gt;&gt; &gt; +DESCRIPTION =3D &quot;Source-highlight converts source code =
to formatted text with syntax highlighting.&quot;<br>
&gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__www.gnu.org_software_src-2Dhighlite_&amp;d=3DDwIBa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLf=
hQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DlwbvDkI4fDkloLf3cs3QeCgqOBF_LRpfobo2v-=
EYtEc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__www.gnu.org_software_src-2Dhighlite_&amp;d=
=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJ=
QqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DlwbvDkI4fDkloLf3cs3QeCgqOBF_LR=
pfobo2v-EYtEc&amp;e=3D</a> &quot;<br>
&gt;&gt; &gt; +LICENSE =3D &quot;GPL-3.0-only&quot;<br>
&gt;&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;;md5=3Dff95bfe019f=
eaf92f524b73dd79e76eb&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SRCREV =3D &quot;894cacd0799ca60afa359a63782729dec76cbb79&qu=
ot;<br>
&gt;&gt; &gt; +PV =3D &quot;3.1.9+git&quot;<br>
&gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.o=
rg/git/src-highlite.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer=
" target=3D"_blank">git.savannah.gnu.org/git/src-highlite.git;protocol=3Dht=
tps;branch=3Dmaster</a>&quot;<br>
&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +inherit autotools pkgconfig<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +DEPENDS:append =3D &quot; bison-native boost&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +DEPENDS:append:class-target =3D &quot; ${PN}-native&quot;<br=
>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +EXTRA_OECONF=3D&quot;--with-boost-regex=3Dboost_regex&quot;<=
br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +PACKAGES +=3D &quot;${PN}-tools ${PN}-data&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +RDEPENDS:${PN} =3D &quot;boost-regex ${PN}-data&quot;<br>
&gt;&gt; &gt; +RDEPENDS:${PN}-tools =3D &quot;${PN} ${PN}-data bash&quot;<b=
r>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +FILES:${PN}=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${libdir}/*$=
{SOLIBS}&quot;<br>
&gt;&gt; &gt; +FILES:${PN}-data=C2=A0 =3D &quot;${datadir}/source-highlight=
&quot;<br>
&gt;&gt; &gt; +FILES:${PN}-tools =3D &quot;${bindir} ${sysconfdir}/bash_com=
pletion.d&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# source-highlight is using its own binary from the build tr=
ee to make documentation<br>
&gt;&gt; &gt; +# let&#39;s substitute the native binary instead<br>
&gt;&gt; &gt; +do_configure:prepend:class-target () {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^SRCHILITEEXE =3D $(top=
_builddir).*,SRCHILITEEXE =3D source-highlight,&#39; ${S}/doc/Makefile.am<b=
r>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.43.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#214702): <a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dc=
ore_message_214702&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-=
VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3D59gbMb=
CXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_message_214702&amp;d=3DDwIBaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4=
_yp3Vldzt83qQW4zvi&amp;s=3D59gbMbCXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&amp;=
e=3D</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com=
/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_112197845_1686489&amp;d=3DD=
wIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcm=
gvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DLl_TLcnLKTlhI4Rm2kaZpieo_LWka4TfPL=
OsJ6o8ER4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_112197845_16=
86489&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9h=
MggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DLl_TLcnLKTlhI4Rm2ka=
Zpieo_LWka4TfPLOsJ6o8ER4&amp;e=3D</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=
=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJ=
QqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DJcEYIhnX11pblaVhmSRW-5aSQ5QHO6=
L9M7ugjPg0uWU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembed=
ded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-Vl=
yTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DJcEYIhnX=
11pblaVhmSRW-5aSQ5QHO6L9M7ugjPg0uWU&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000b23ea906327c53ed--

