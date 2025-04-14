Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1F7C369AE
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 07:32:21 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.44430.1744615931732348082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 00:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=UheA1xmu;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso627242566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1744615930; x=1745220730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hutJ8OZLXrv1FpTLYh9ZRvGTgXY0uWkVGx5do7s5cz8=;
        b=UheA1xmuGC+I5TZAWfhxSCFQjiI0TmctCNvtRHwOOb6flCaW5XnJdjfMmofA2GbiFO
         mRZftKtqlT6a0odOpYMoRUjAlzf8AjWaXO9DnLEQHf5R9BWVV2df84RSUKM28SPd+Ph7
         P/7sJ5oxgUhGP4O9WC3YqblrvbWH2NV9StP3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744615930; x=1745220730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hutJ8OZLXrv1FpTLYh9ZRvGTgXY0uWkVGx5do7s5cz8=;
        b=mwSK1vJTNaiQcrCbBYpV9WEG8Sel+R0/AHIiJN+DAXbUtIzHyvJCWWD3qGQ7vI5zsX
         r940a1u7fv7mEC+9FYYl1Qybn3x/EBI7H+Nb2OEs/v7W0NFad3X277VjH/pTf8+pqs8/
         fQTUXWceHvv4YU5CfD5kh0bw0QfavE/OWKBul5KLWS9bago3hvqK8x1CgxBXSqpXbjRJ
         NipbNbb2dvSOzoWUlmWy+yEgDX3Szhxq5ayYstYooX+OatrVmCL8jMA/Z0aAMjpJL5jo
         n9n5y3ac1m6VePUEHMRg5p/V4pTFC6GVLB/5dVXOqea2S2SrRtJRe0KijknanKVp1IZV
         XJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCXEIqwt3Fpa1Czvr+cqbN+WnJEn3Xnl9WcnYaWcIB2PTRvQiTxRwX29EACZ7tnkVPBO2hcZROR1cN41lGclgfOn/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8z0EPCWM8fkVogt953Aw2QzQ13VdFISX46bUG/Tyb4KBxgBJ7
	0fXHU+5+QR6OgUWevHsIeIJc9gfoz7VtUHtSSP4MSTAG1/IkMM7z/eep0WTAfURYMmic6u34SSO
	MR6Gn3dqxw9klPMUXu+MExehbLjiXTGpKRgZFiw==
X-Gm-Gg: ASbGncvSgu9dlKFAcuDWjyf9vvQKb8DmfvXMHo5FAyzp//4TZ6A9XKZQBX+pEkVXVuf
	jzUDtCmddUEmgMMnwM7DYfxSebr9ZSCGHfJ7gea8htTOtNRW7CmXOUTc09+KVlqj2o/+WdW9RDO
	1I7mFIwDrF2e88TR65U4xrmg==
X-Google-Smtp-Source: AGHT+IH8fCYy54LWoPE6rQ9Guef0T8uQ24k4E3MhZuldawfHdISTYl4gSaMg2y3gEtj8lEd0t8mODV/a5y0wUGePfT4=
X-Received: by 2002:a17:907:c23:b0:aca:cef4:c2c6 with SMTP id
 a640c23a62f3a-acad36a0d8bmr968537766b.48.1744615929874; Mon, 14 Apr 2025
 00:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250410192632.2818966-1-ecordonnier@snap.com>
 <20250410192632.2818966-2-ecordonnier@snap.com> <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
 <CAHUKmYZkZ0FqSR00-RL+Tbp5v5B2u6ouK3WG+dvdAj3K0FHRAQ@mail.gmail.com>
 <CANNYZj9_mVZKE2tncTMrHPc69jOhBNJ4xa2h+9HQb=MYdLkaxQ@mail.gmail.com> <183535A78DAC85C5.27206@lists.openembedded.org>
In-Reply-To: <183535A78DAC85C5.27206@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 14 Apr 2025 09:31:58 +0200
X-Gm-Features: ATxdqUEqKT4kbodhmJDXuiPTOtImi-8_FYFG_eWkTLzpEEPrmscIeRmdQVMC8Ho
Message-ID: <CAHUKmYbbLZOso+Mk5raVt9yEki5Xd7FMAkuCkyuo_Zu3XK0Kxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] source-highlight: re-add recipe
To: ecordonnier@snap.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c53dcd0632b80c10"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 07:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214799

--000000000000c53dcd0632b80c10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The recipe has been merged in meta-oe, thus this patch 2/2
"source-highlight: re-add recipe" should not be merged in oe-core. I would
still like to merge the patch 1/2 "gdb: add source-highlight PACKAGECONFIG
option" into oe-core however.

=C3=89tienne

On Fri, Apr 11, 2025 at 10:17=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> OK, in that case except if I receive other opinions, I would propose to
> merge the patch adding the PACKAGECONFIG option to gdb, and I'll send
> another PR adding source-highlight to meta-oe.
>
> =C3=89tienne
>
> On Thu, Apr 10, 2025 at 9:35=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>
>> I don;t think source highlighting in gdb quite qualifies as a core
>> embedded functionality? I'd say meta-oe is better.
>>
>> Alex
>>
>> On Thu, 10 Apr 2025 at 21:32, Etienne Cordonnier <ecordonnier@snap.com>
>> wrote:
>> >
>> > That's fair enough. My thinking was to try to upstream first to core,
>> since it used to be there before it was removed, and to also get feedbac=
k
>> on whether you would want to enable this per default gdb. I can also mov=
e
>> it to meta-oe if you think it is better.
>> >
>> > =C3=89tienne
>> >
>> > On Thu, Apr 10, 2025 at 9:28=E2=80=AFPM Alexander Kanavin <
>> alex.kanavin@gmail.com> wrote:
>> >>
>> >> Unless you want to enable it by default in gdb (and the other patch
>> >> shows that is not the case), source-highlight does not have to be in
>> >> core. We have plenty of recipes in core with options that require
>> >> items from meta-oe or other layers.
>> >>
>> >> Alex
>> >>
>> >> On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via
>> >> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyR=
CS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3Dt2HL6XaHbnfyOul6lHPhmnc0jRotjdxDqaD0W3q=
UQ2k&e=3D>
>> <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> >> wrote:
>> >> >
>> >> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >> >
>> >> > source-highlight version 3.1.8 was removed in
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproj=
ect.org_poky_commit_-3Fid-3D6560db9ddfd39a2715ede96430228306b00f53dd&d=3DDw=
IBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf=
4_yp3Vldzt83qQW4zvi&s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&e=3D
>> in June 2019 because the was no user left,
>> >> > however there is now a gdb PACKAGECONFIG option which uses it. Sinc=
e
>> the last release was in 2019, let's rather use the latest git version.
>> >> >
>> >> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> >> > ---
>> >> >  meta/conf/distro/include/maintainers.inc      |  1 +
>> >> >  .../source-highlight/source-highlight_git.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcU=
QJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXID=
qnmJzcglk&e=3D>
>> | 36 +++++++++++++++++++
>> >> >  2 files changed, 37 insertions(+)
>> >> >  create mode 100644 meta/recipes-support/source-highlight/
>> source-highlight_git.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcU=
QJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXID=
qnmJzcglk&e=3D>
>> >> >
>> >> > diff --git a/meta/conf/distro/include/maintainers.inc
>> b/meta/conf/distro/include/maintainers.inc
>> >> > index 2b47d3103c0..831494312b6 100644
>> >> > --- a/meta/conf/distro/include/maintainers.inc
>> >> > +++ b/meta/conf/distro/include/maintainers.inc
>> >> > @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D
>> "Unassigned <unassigned@yoctoproject.org
>> >> >  RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <
>> richard.purdie@linuxfoundation.org>"
>> >> >  RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
>> >> >  RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.c=
om
>> >"
>> >> > +RECIPE_MAINTAINER:pn-source-highlight =3D "Etienne Cordonnier <
>> ecordonnier@snap.com>"
>> >> >  RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <
>> michael@opdenacker.org>"
>> >> >  RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <
>> michael@opdenacker.org>"
>> >> >  RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <
>> quaresma.jose@gmail.com>"
>> >> > diff --git a/meta/recipes-support/source-highlight/
>> source-highlight_git.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcU=
QJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXID=
qnmJzcglk&e=3D>
>> b/meta/recipes-support/source-highlight/source-highlight_git.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcU=
QJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXID=
qnmJzcglk&e=3D>
>> >> > new file mode 100644
>> >> > index 00000000000..ad5085250cb
>> >> > --- /dev/null
>> >> > +++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcU=
QJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXID=
qnmJzcglk&e=3D>
>> >> > @@ -0,0 +1,36 @@
>> >> > +SUMMARY =3D "Syntax highlight utility"
>> >> > +DESCRIPTION =3D "Source-highlight converts source code to formatte=
d
>> text with syntax highlighting."
>> >> > +HOMEPAGE =3D "
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.gnu.org_softw=
are_src-2Dhighlite_&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckf=
diw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMg=
gBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DlwbvDkI4fDkloLf3cs3QeCgqO=
BF_LRpfobo2v-EYtEc&e=3D
>> "
>> >> > +LICENSE =3D "GPL-3.0-only"
>> >> > +SECTION =3D "libs"
>> >> > +LIC_FILES_CHKSUM =3D
>> "file://COPYING;;md5=3Dff95bfe019feaf92f524b73dd79e76eb"
>> >> > +
>> >> > +SRCREV =3D "894cacd0799ca60afa359a63782729dec76cbb79"
>> >> > +PV =3D "3.1.9+git"
>> >> > +SRC_URI =3D "git://
>> git.savannah.gnu.org/git/src-highlite.git;protocol=3Dhttps;branch=3Dmast=
er
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__git.savannah.gnu.=
org_git_src-2Dhighlite.git-3Bprotocol-3Dhttps-3Bbranch-3Dmaster&d=3DDwMFaQ&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llq=
ej2MWMKkIVrLzf&s=3Dbr3YXbaxuyHAty0PKTXl9dyDgQdvPpIiJloBrrqTsOg&e=3D>
>> "
>> >> > +S =3D "${WORKDIR}/git"
>> >> > +
>> >> > +inherit autotools pkgconfig
>> >> > +
>> >> > +DEPENDS:append =3D " bison-native boost"
>> >> > +
>> >> > +DEPENDS:append:class-target =3D " ${PN}-native"
>> >> > +
>> >> > +EXTRA_OECONF=3D"--with-boost-regex=3Dboost_regex"
>> >> > +
>> >> > +BBCLASSEXTEND =3D "native nativesdk"
>> >> > +
>> >> > +PACKAGES +=3D "${PN}-tools ${PN}-data"
>> >> > +
>> >> > +RDEPENDS:${PN} =3D "boost-regex ${PN}-data"
>> >> > +RDEPENDS:${PN}-tools =3D "${PN} ${PN}-data bash"
>> >> > +
>> >> > +FILES:${PN}       =3D "${libdir}/*${SOLIBS}"
>> >> > +FILES:${PN}-data  =3D "${datadir}/source-highlight"
>> >> > +FILES:${PN}-tools =3D "${bindir} ${sysconfdir}/bash_completion.d"
>> >> > +
>> >> > +# source-highlight is using its own binary from the build tree to
>> make documentation
>> >> > +# let's substitute the native binary instead
>> >> > +do_configure:prepend:class-target () {
>> >> > +     sed -i -e 's,^SRCHILITEEXE =3D $(top_builddir).*,SRCHILITEEXE=
 =3D
>> source-highlight,' ${S}/doc/Makefile.am
>> >> > +}
>> >> > --
>> >> > 2.43.0
>> >> >
>> >> >
>> >> >
>> >> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214718):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_214718&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3Ddjq=
36a_AhIUqATKwgJZ04sTfLa3fDmS3XP5zNHUf5gc&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_112197845_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzOYPYvdpW=
2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DzDx6WY1qU45V-oTmBya=
iPVl1Jwya48XRdV0JNKgCpa4&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DImlpzO=
YPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&s=3DUbC2G3fAWcrz=
u-oU-WelpYgh4gurV0G68EJtqUvlFBU&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c53dcd0632b80c10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The recipe has been merged in meta-oe, thus this patch 2/2=
 &quot;source-highlight: re-add recipe&quot; should not be merged in oe-cor=
e. I would still like to merge the patch 1/2 &quot;gdb: add source-highligh=
t PACKAGECONFIG option&quot; into oe-core however.<br><br>=C3=89tienne</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Apr 11, 2025 at 10:17=E2=80=AFAM Etienne Cordonnie=
r via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">OK, in that case except if I rece=
ive other opinions, I would propose to merge the patch adding the PACKAGECO=
NFIG option to gdb, and I&#39;ll send another PR adding source-highlight to=
 meta-oe.<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Apr 10, 2025 at 9:35=E2=80=AFPM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">I don;t think source highlighting in gdb quite qual=
ifies as a core<br>
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
&gt;&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__l=
ists.openembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgG=
kICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DI=
mlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3Dt2H=
L6XaHbnfyOul6lHPhmnc0jRotjdxDqaD0W3qUQ2k&amp;e=3D" rel=3D"noreferrer" targe=
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
&gt;&gt; &gt;=C2=A0 .../source-highlight/<a href=3D"https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighlight-5Fgit.bb&amp;d=3DDwMFaQ&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYV=
lmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DN4_1lMw_iULEa5kI0yuDTOxIdU2snOyXIDqnmJzcg=
lk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">source-highlight_git.bb</=
a>=C2=A0 | 36 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 37 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/source-highligh=
t/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2=
Dhighlight-5Fgit.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DIml=
pzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DN4_1l=
Mw_iULEa5kI0yuDTOxIdU2snOyXIDqnmJzcglk&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">source-highlight_git.bb</a><br>
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
"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighlight-5=
Fgit.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2U=
CTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DN4_1lMw_iULEa5kI0=
yuDTOxIdU2snOyXIDqnmJzcglk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">s=
ource-highlight_git.bb</a> b/meta/recipes-support/source-highlight/<a href=
=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighligh=
t-5Fgit.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdp=
W2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DN4_1lMw_iULEa5=
kI0yuDTOxIdU2snOyXIDqnmJzcglk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank=
">source-highlight_git.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 00000000000..ad5085250cb<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/source-highlight/<a href=3D"https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__source-2Dhighlight-5Fgit.bb=
&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhB=
GFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DN4_1lMw_iULEa5kI0yuDTO=
xIdU2snOyXIDqnmJzcglk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">source=
-highlight_git.bb</a><br>
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
&gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"https://urldefense.proofp=
oint.com/v2/url?u=3Dhttp-3A__git.savannah.gnu.org_git_src-2Dhighlite.git-3B=
protocol-3Dhttps-3Bbranch-3Dmaster&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLz=
f&amp;s=3Dbr3YXbaxuyHAty0PKTXl9dyDgQdvPpIiJloBrrqTsOg&amp;e=3D" rel=3D"nore=
ferrer" target=3D"_blank">git.savannah.gnu.org/git/src-highlite.git;protoco=
l=3Dhttps;branch=3Dmaster</a>&quot;<br>
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
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214718): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_21=
4718&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTl=
hBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3Ddjq36a_AhIUqATKwgJZ0=
4sTfLa3fDmS3XP5zNHUf5gc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_214718&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrL=
zf&amp;s=3Ddjq36a_AhIUqATKwgJZ04sTfLa3fDmS3XP5zNHUf5gc&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_112197845_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmSXFs=
_Llqej2MWMKkIVrLzf&amp;s=3DzDx6WY1qU45V-oTmByaiPVl1Jwya48XRdV0JNKgCpa4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_112197845_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJX=
yRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DzDx6WY1qU45V-oTmByaiPVl1Jwya48XRd=
V0JNKgCpa4&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhBGFCg4PcUQJXyRCS-oYVlmmS=
XFs_Llqej2MWMKkIVrLzf&amp;s=3DUbC2G3fAWcrzu-oU-WelpYgh4gurV0G68EJtqUvlFBU&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DImlpzOYPYvdpW2UCTlhB=
GFCg4PcUQJXyRCS-oYVlmmSXFs_Llqej2MWMKkIVrLzf&amp;s=3DUbC2G3fAWcrzu-oU-WelpY=
gh4gurV0G68EJtqUvlFBU&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c53dcd0632b80c10--

