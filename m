Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A14C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:35:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.7321.1744313744747665891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EYjAs/DR;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso10122656d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744313744; x=1744918544; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLE5XRcJOEFQT4w3Qmjj1l6MgWHhV7/LSL/GqGqrXN0=;
        b=EYjAs/DRYZYFG4Fsp107nO+QyUUrAjp5QcfbAOusNH1gpEBAPyLLKNcti6LkAoLkJY
         MzecxLw5h0ZrvAs+TB5BKI3bWqS1ToWtJkJcKShxqVHU5Byqiyu6T+egSmdW52q9nvQK
         1w5ErYUBl2tajxND5tPicsPW+q03MUVraRd8G0/tqE+9QTfDPRiN35hMQOF5A3ZIBPzW
         5btxPgoeCFwHTXMt9bIqIM7faT/fM3oAeKJa5k+RBFGTjy1V+kTnwfmGS7FEUUizvKOk
         gTeTJWw/4jAkrVjnv2cE5sRY5323DCXAN+JuqY79v3hONFyqv/VKQAz7hbi8vHoaPdJn
         uV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313744; x=1744918544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLE5XRcJOEFQT4w3Qmjj1l6MgWHhV7/LSL/GqGqrXN0=;
        b=UZ2Sr4dUOEYZZLM/63bhoWDrVcjlG2WIi8vzZYrq3I+V65AI1b5vNcXgys2xFar1yR
         e78suUFDwvWiBKIUg+72Krhq9Q3Zez2y6HGRjsysir8T9DgUhmB0cvH+m3UY8EIbaLVS
         zQNwOxVN5D+N8kNTAee1YcyPub1Uj/jcCtv1o5PmBY9Kj//DVTEUKYuaqB/oltUqHl5E
         jNq4HqtzoG2Bc5ipLhjRrjboE3wX/nCrpkajl8mhCDDxmK5dH66hXzL3Ps6BOVhtjuEx
         BK8WqBdeVCNk7FzC3TUPsF8wSr3I1CKmfCv/+/xTZCgPHXOTi94HeLJOUhQslGG2vPu7
         eBLw==
X-Gm-Message-State: AOJu0Yw5wSP+JU0P6oEh4NgY2j44YAaS9p+jn4EhZSYE9BhYHcGymahE
	Y8M2PwCbnOgUkN7+Iq5nTWLAc0K9q529VffODcIW30pWertKbSFSffecO7kcJeke93aeGiDx8SZ
	kUlbAMa3VKQzDaXs3agCFs9aninU=
X-Gm-Gg: ASbGncvx98WZvtlvbnj4FuZZT73t1k2ES3BkibwAYmG+KNUtj8Y87bs4S+Vk0sNLGuh
	Ahy7NtsfjGQkRzQ0GL/TBkY3+yChS/Vw94iiaxjDVx84jZzAI+p9yzP9Nbq/WUDbZcVEHRJUyRH
	gWrM87cMTikc+d6ooxeHTYXksHiVWri2TrNmyCCUI+AU9BnJp88F1FsBtBShkRtE0Y36c=
X-Google-Smtp-Source: AGHT+IGML5oAzmzpHZmvhe/aSAJOF3HTiLJNECnY7/J4BwNMHQCYPdBQe2S0eYZHJyoR/PcrIeAXEvSAmOxYmYs+3os=
X-Received: by 2002:a05:6214:c8b:b0:6eb:2e88:d47b with SMTP id
 6a1803df08f44-6f230d227c0mr1690526d6.17.1744313743498; Thu, 10 Apr 2025
 12:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250410192632.2818966-1-ecordonnier@snap.com>
 <20250410192632.2818966-2-ecordonnier@snap.com> <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
 <CAHUKmYZkZ0FqSR00-RL+Tbp5v5B2u6ouK3WG+dvdAj3K0FHRAQ@mail.gmail.com>
In-Reply-To: <CAHUKmYZkZ0FqSR00-RL+Tbp5v5B2u6ouK3WG+dvdAj3K0FHRAQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:35:32 +0200
X-Gm-Features: ATxdqUEb-CKt-Ns1BjEAznsKoOifxblovYrOSD-5rwWlq4lMAL2FXNhHyptUVoI
Message-ID: <CANNYZj9_mVZKE2tncTMrHPc69jOhBNJ4xa2h+9HQb=MYdLkaxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] source-highlight: re-add recipe
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214706

I don;t think source highlighting in gdb quite qualifies as a core
embedded functionality? I'd say meta-oe is better.

Alex

On Thu, 10 Apr 2025 at 21:32, Etienne Cordonnier <ecordonnier@snap.com> wro=
te:
>
> That's fair enough. My thinking was to try to upstream first to core, sin=
ce it used to be there before it was removed, and to also get feedback on w=
hether you would want to enable this per default gdb. I can also move it to=
 meta-oe if you think it is better.
>
> =C3=89tienne
>
> On Thu, Apr 10, 2025 at 9:28=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> Unless you want to enable it by default in gdb (and the other patch
>> shows that is not the case), source-highlight does not have to be in
>> core. We have plenty of recipes in core with options that require
>> items from meta-oe or other layers.
>>
>> Alex
>>
>> On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via
>> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > source-highlight version 3.1.8 was removed in https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__web.git.yoctoproject.org_poky_commit_-3Fid-3=
D6560db9ddfd39a2715ede96430228306b00f53dd&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DGDe=
kE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&e=3D  in June 2019 because the was=
 no user left,
>> > however there is now a gdb PACKAGECONFIG option which uses it. Since t=
he last release was in 2019, let's rather use the latest git version.
>> >
>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>> >  meta/conf/distro/include/maintainers.inc      |  1 +
>> >  .../source-highlight/source-highlight_git.bb  | 36 ++++++++++++++++++=
+
>> >  2 files changed, 37 insertions(+)
>> >  create mode 100644 meta/recipes-support/source-highlight/source-highl=
ight_git.bb
>> >
>> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc
>> > index 2b47d3103c0..831494312b6 100644
>> > --- a/meta/conf/distro/include/maintainers.inc
>> > +++ b/meta/conf/distro/include/maintainers.inc
>> > @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassig=
ned <unassigned@yoctoproject.org
>> >  RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
>> >  RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
>> >  RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
>> > +RECIPE_MAINTAINER:pn-source-highlight =3D "Etienne Cordonnier <ecordo=
nnier@snap.com>"
>> >  RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <michael@opdenacke=
r.org>"
>> >  RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <michael@opdena=
cker.org>"
>> >  RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <quaresma.jose@=
gmail.com>"
>> > diff --git a/meta/recipes-support/source-highlight/source-highlight_gi=
t.bb b/meta/recipes-support/source-highlight/source-highlight_git.bb
>> > new file mode 100644
>> > index 00000000000..ad5085250cb
>> > --- /dev/null
>> > +++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
>> > @@ -0,0 +1,36 @@
>> > +SUMMARY =3D "Syntax highlight utility"
>> > +DESCRIPTION =3D "Source-highlight converts source code to formatted t=
ext with syntax highlighting."
>> > +HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
www.gnu.org_software_src-2Dhighlite_&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjB=
I-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DlwbvDkI4=
fDkloLf3cs3QeCgqOBF_LRpfobo2v-EYtEc&e=3D "
>> > +LICENSE =3D "GPL-3.0-only"
>> > +SECTION =3D "libs"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;;md5=3Dff95bfe019feaf92f524b73dd=
79e76eb"
>> > +
>> > +SRCREV =3D "894cacd0799ca60afa359a63782729dec76cbb79"
>> > +PV =3D "3.1.9+git"
>> > +SRC_URI =3D "git://git.savannah.gnu.org/git/src-highlite.git;protocol=
=3Dhttps;branch=3Dmaster"
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +inherit autotools pkgconfig
>> > +
>> > +DEPENDS:append =3D " bison-native boost"
>> > +
>> > +DEPENDS:append:class-target =3D " ${PN}-native"
>> > +
>> > +EXTRA_OECONF=3D"--with-boost-regex=3Dboost_regex"
>> > +
>> > +BBCLASSEXTEND =3D "native nativesdk"
>> > +
>> > +PACKAGES +=3D "${PN}-tools ${PN}-data"
>> > +
>> > +RDEPENDS:${PN} =3D "boost-regex ${PN}-data"
>> > +RDEPENDS:${PN}-tools =3D "${PN} ${PN}-data bash"
>> > +
>> > +FILES:${PN}       =3D "${libdir}/*${SOLIBS}"
>> > +FILES:${PN}-data  =3D "${datadir}/source-highlight"
>> > +FILES:${PN}-tools =3D "${bindir} ${sysconfdir}/bash_completion.d"
>> > +
>> > +# source-highlight is using its own binary from the build tree to mak=
e documentation
>> > +# let's substitute the native binary instead
>> > +do_configure:prepend:class-target () {
>> > +     sed -i -e 's,^SRCHILITEEXE =3D $(top_builddir).*,SRCHILITEEXE =
=3D source-highlight,' ${S}/doc/Makefile.am
>> > +}
>> > --
>> > 2.43.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#214702): https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_214702&d=
=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68=
ddzZf4_yp3Vldzt83qQW4zvi&s=3D59gbMbCXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&e=
=3D
>> > Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__lists.openembedded.org_mt_112197845_1686489&d=3DDwIBaQ&c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=
=3DLl_TLcnLKTlhI4Rm2kaZpieo_LWka4TfPLOsJ6o8ER4&e=3D
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__li=
sts.openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&=
s=3DJcEYIhnX11pblaVhmSRW-5aSQ5QHO6L9M7ugjPg0uWU&e=3D  [alex.kanavin@gmail.c=
om]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

