Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14D0C25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 11:38:20 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.19273.1717501098236984909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 04:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=VFQOS+yJ;
 spf=pass (domain: snapchat.com, ip: 209.85.208.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a50ac2ca1so3486534a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717501096; x=1718105896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YRWLDKStEhi3IjWUI+Yc26TBW4q5SoTq8y8o92Ed1OI=;
        b=VFQOS+yJEBh47tPRVaKCynI8rpOFpMheFRMLXryrQkoTxEiAN3HwE0DX8g2hZvFpYs
         t4NbInwcTF9TRaWrSthPpcGkHC4l/LuMPlJJv9IVfFFZCONevcKWKgmBYp9TPMkDReYV
         ypmUBWalQ0qApPTV0FdXK+77K8fcpPOoLDbCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501096; x=1718105896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRWLDKStEhi3IjWUI+Yc26TBW4q5SoTq8y8o92Ed1OI=;
        b=C2QrLFq7S8Zd8zL6/RqNfnOfwnNyq0e0ry9m4vp1dCvPLxne1ONVYvPnIHdr2xREHj
         6FJbOzHNwX2sdPaUQFm5YXxd1ApkwxqeN+lDApfroGAvpG9IFD6CK+XUWBn6VqwigWos
         6xBInFjW4xYJTriXliPvps0dlF3IZFPM2lFtdtkprc2SW3SsmmjSLtk7o8VRuqQPL1mF
         T/cSFTqgNTd5gJR07t7fLxSqXNF2O3RTZs1D6u7NrRuhKIAz2bjpE2LMcY/cyXyA5SqT
         fMJw0BaxfKCgJGyWCHX/dmsWcCeH2HO7MG1y8rGKDmMdm5bPTFd5G+Md/8u6dFi1Y3Y+
         WWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZihzy66JlHRf7L9ZqP3tgzO3rdDyeJ2GoUSX8ydeQ2D1hkKzkXcKciEkO7G3yn61l8BVx+Godwbf1Op/NJnSQiBnL2pq5sdQgw24gJM9A8OWh2w6o9+bd
X-Gm-Message-State: AOJu0YzKpZDDjF8tsyPqWJGTO9dbST3AxS0HMOoCLCA6ISR/1Ig7ZAA+
	V80FJWR1iuB6GvW6lpsH+znkKtdenY2EM32SHA8uuyifRw6Vq43jDtMO8Gccb3z8+GrHaHn3/ou
	Mj7Olw2gE8mqH7CpJjnYR65mwNXY4FPGZwhLyoA==
X-Google-Smtp-Source: AGHT+IH5SPzNfTzf67/olIZisjo3vknXsnBjRLGUGUwO6oAIKwm60+Twv2Y5H90qGDrzhFWqoZUlrCI6qIt7twnAWzE=
X-Received: by 2002:a17:906:66c8:b0:a68:fb6d:2768 with SMTP id
 a640c23a62f3a-a68fb6d27a4mr396264066b.18.1717501096361; Tue, 04 Jun 2024
 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231205133754.906479-1-ecordonnier@snap.com> <db4abfaf9dfeead32dd8fbf1f620d9ebe4e128d2.camel@linuxfoundation.org>
 <17D3F01628D1B399.19857@lists.openembedded.org>
In-Reply-To: <17D3F01628D1B399.19857@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 4 Jun 2024 13:38:05 +0200
Message-ID: <CAHUKmYb80Rd1doaTcb8sCUMQ5MrnzJeK_-jv0KiamU35zepahA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] gdb/systemd: enable minidebuginfo support conditionally
To: ecordonnier@snap.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0344b061a0ee210"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200326

--000000000000c0344b061a0ee210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I found the issue. It is caused by this image using sleep from coreutils
instead of sleep from busybox (which I had been testing locally). I'll send
a patch.

=C3=89tienne

On Wed, May 29, 2024 at 12:51=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> Hi Richard,
> I had missed your reply. I have changed my email filters so hopefully thi=
s
> won't happen again (still learning how to work with mailing-lists). I sen=
t
> another patch fixing a regression in the test:
> https://lists.openembedded.org/g/openembedded-core/message/199999
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_message_199999&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3Dqd=
d1Hlh8d6ZAqV_SuHUVVv5-WB5TseS86WR_xox_uZ8&e=3D>
> I tested core-image-sato locally today and it is working with this
> configuration as far as I can tell:
> DISTRO=3D"poky-altcfg"
> DISTRO_FEATURES +=3D "minidebuginfo x11"
> TEST_SUITES +=3D "ping ssh systemd"
> IMAGE_CLASSES +=3D "testimage"
> MACHINE ?=3D "qemux86-64"
>
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D9c069e00a0867de11a6069b99a07d2c775848c10
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.=
org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00a0867de1=
1a6069b99a07d2c775848c10&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6XfROaEv_=
y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3D28mfjPdYEI4BDYapLnLM=
We2T6_rNbG34bE__DMTng4M&e=3D>
> is not a valid link any more, so I'm not sure which constraint you had to
> put to the test.
>
> =C3=89tienne
>
>
> On Fri, Dec 8, 2023 at 12:26=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2023-12-05 at 14:37 +0100, Etienne Cordonnier via
>> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5=
qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3D8AuyQ5J1BLj-4jsmffBD9mvb7i6mnqvH8auiQwn=
HvXE&e=3D>
>> wrote:
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > Enabling minidebuginfo is not useful if gdb and systemd-coredump
>> > are unable to parse it.
>> >
>> > In order to parse it, gdb needs xz support. Systemd needs coredump
>> enabled, as
>> > well as elfutil enabled as well (systemd-coredump loads libdw which is
>> part of elfutils using dlopen).
>> >
>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>> >  meta/classes-global/package.bbclass           |  2 +-
>> >  meta/lib/oe/package.py                        |  2 +-
>> >  meta/lib/oeqa/runtime/cases/systemd.py        | 21 ++++++++++++++++++=
+
>> >  meta/lib/oeqa/selftest/cases/minidebuginfo.py |  2 +-
>> >  meta/recipes-core/systemd/systemd_254.4.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__systemd-5F254.4.b=
b&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaD=
LDKhvt5DP2KQjTZSenZlRb5gPku&s=3D7P2Upi6dKNjBpoambsGGv6skf477wBPYY4AolklYG5w=
&e=3D>
>>   |  1 +
>> >  .../elfutils/elfutils_0.189.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__elfutils-5F0.189.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qea=
DLDKhvt5DP2KQjTZSenZlRb5gPku&s=3D5kNMyeQ_U4UNyFeFtERxV83Bz_bHKJmlwVy6EOZSmR=
A&e=3D>
>>               |  4 +++-
>> >  meta/recipes-devtools/gdb/gdb-common.inc      |  4 +++-
>> >  7 files changed, 31 insertions(+), 5 deletions(-)
>>
>> I merged this as I think it did improve things but adding a test change
>> to poky to enable it hasn't quite worked as I hoped.
>>
>> I had to put a constraint around the test to ensure it only runs on
>> systemd images:
>>
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.=
org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00a0867de1=
1a6069b99a07d2c775848c10&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DFLdd1vErz4ATg4=
RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&s=3DTtR0nmCl-7A-ZW0pyAbO=
ZdeTP1CvFHG88dRcF_5szJQ&e=3D
>>
>> and with that applied I then had this failure:
>>
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yocto=
project.org_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdio&d=3DDw=
IFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHu=
JmnUZaKuZxRFKFzAB_D&s=3Dyt0et2kFgyojvWvRCXU6ieXQ5tQNyWXUV-WEVS2rJkc&e=3D
>>
>> I can queue the first patch but I'm not sure about the failure above.
>> Any ideas?
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200002):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_200002&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3DxeU=
0-cUBBEcehIlkgM731a0fl7PJ_XTo290NM6mKQ_4&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_102991294_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6XfROaEv=
_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3DCWHi5m-gDJ6BmsE0O5y=
Tj4b2LNgCtLD4yALsCMxRPHE&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlY7kf6=
XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&s=3DiyiTZXWj1zB0=
iKenrf5hCwnfalL0SPL3m-oC2lU3fD8&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c0344b061a0ee210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I found the issue. It is caused by this ima=
ge using sleep from coreutils instead of sleep from busybox (which I had be=
en testing locally). I&#39;ll send a patch.<br><br>=C3=89tienne</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May =
29, 2024 at 12:51=E2=80=AFPM Etienne Cordonnier via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"=
mailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">Hi Richard,<br>I had missed your reply. I have changed my emai=
l filters so hopefully this won&#39;t happen again (still learning how to w=
ork with mailing-lists). I sent another patch fixing a regression in the te=
st:=C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
lists.openembedded.org_g_openembedded-2Dcore_message_199999&amp;d=3DDwMFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDL=
DKhvt5DP2KQjTZSenZlRb5gPku&amp;s=3Dqdd1Hlh8d6ZAqV_SuHUVVv5-WB5TseS86WR_xox_=
uZ8&amp;e=3D" target=3D"_blank">https://lists.openembedded.org/g/openembedd=
ed-core/message/199999</a><br>I tested core-image-sato locally today and it=
 is working with=C2=A0this configuration as far as I can tell:<br>DISTRO=3D=
&quot;poky-altcfg&quot;<br>DISTRO_FEATURES +=3D &quot;minidebuginfo x11&quo=
t;<br>TEST_SUITES +=3D &quot;ping ssh systemd&quot;<br>IMAGE_CLASSES +=3D &=
quot;testimage&quot;<br>MACHINE ?=3D &quot;qemux86-64&quot;<br><br><a href=
=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded=
.org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00a0867de=
11a6069b99a07d2c775848c10&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&amp;s=
=3D28mfjPdYEI4BDYapLnLMWe2T6_rNbG34bE__DMTng4M&amp;e=3D" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&amp;=
id=3D9c069e00a0867de11a6069b99a07d2c775848c10</a> is not a valid link any m=
ore, so I&#39;m not sure which constraint you had to put to the test.<br><b=
r>=C3=89tienne<br><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Dec 8, 2023 at 12:26=E2=80=AFAM Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blan=
k">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, 2023-12-05 at 14:37 +0100, Eti=
enne Cordonnier via<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.open=
embedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfRO=
aEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&amp;s=3D8AuyQ5J1BLj-=
4jsmffBD9mvb7i6mnqvH8auiQwnHvXE&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; Enabling minidebuginfo is not useful if gdb and systemd-coredump<br>
&gt; are unable to parse it.<br>
&gt; <br>
&gt; In order to parse it, gdb needs xz support. Systemd needs coredump ena=
bled, as<br>
&gt; well as elfutil enabled as well (systemd-coredump loads libdw which is=
 part of elfutils using dlopen).<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/package.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/systemd.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 21 +++++++++++++++++++<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/minidebuginfo.py |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttp-3A__systemd-5F254.4.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DUL=
JTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZ=
SenZlRb5gPku&amp;s=3D7P2Upi6dKNjBpoambsGGv6skf477wBPYY4AolklYG5w&amp;e=3D" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 .../elfutils/<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttp-3A__elfutils-5F0.189.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku=
&amp;s=3D5kNMyeQ_U4UNyFeFtERxV83Bz_bHKJmlwVy6EOZSmRA&amp;e=3D" rel=3D"noref=
errer" target=3D"_blank">elfutils_0.189.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 meta/recipes-devtools/gdb/gdb-common.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +++-<br>
&gt;=C2=A0 7 files changed, 31 insertions(+), 5 deletions(-)<br>
<br>
I merged this as I think it did improve things but adding a test change<br>
to poky to enable it hasn&#39;t quite worked as I hoped.<br>
<br>
I had to put a constraint around the test to ensure it only runs on<br>
systemd images:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.opene=
mbedded.org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00=
a0867de11a6069b99a07d2c775848c10&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hp=
F_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67=
E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&=
amp;s=3DTtR0nmCl-7A-ZW0pyAbOZdeTP1CvFHG88dRcF_5szJQ&amp;e=3D" rel=3D"norefe=
rrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__git.openembedded.org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26=
id-3D9c069e00a0867de11a6069b99a07d2c775848c10&amp;d=3DDwIFaQ&amp;c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DUL=
JTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaK=
uZxRFKFzAB_D&amp;s=3DTtR0nmCl-7A-ZW0pyAbOZdeTP1CvFHG88dRcF_5szJQ&amp;e=3D</=
a> <br>
<br>
and with that applied I then had this failure:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuild=
er.yoctoproject.org_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdi=
o&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX=
_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&amp;s=3Dyt0et2kFgyojvWvRCXU6ie=
XQ5tQNyWXUV-WEVS2rJkc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yoctoproject.o=
rg_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdio&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-Sb=
ugHHxHuJmnUZaKuZxRFKFzAB_D&amp;s=3Dyt0et2kFgyojvWvRCXU6ieXQ5tQNyWXUV-WEVS2r=
Jkc&amp;e=3D</a> <br>
<br>
I can queue the first patch but I&#39;m not sure about the failure above.<b=
r>
Any ideas?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200002): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
0002&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g4=
11a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&amp;s=3DxeU0-cUBBEcehIlkgM73=
1a0fl7PJ_XTo290NM6mKQ_4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_200002&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gP=
ku&amp;s=3DxeU0-cUBBEcehIlkgM731a0fl7PJ_XTo290NM6mKQ_4&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_102991294_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt5DP=
2KQjTZSenZlRb5gPku&amp;s=3DCWHi5m-gDJ6BmsE0O5yTj4b2LNgCtLD4yALsCMxRPHE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_102991294_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa=
-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&amp;s=3DCWHi5m-gDJ6BmsE0O5yTj4b2LNgCtLD4y=
ALsCMxRPHE&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411a5tUebbL0pa-5qeaDLDKhvt=
5DP2KQjTZSenZlRb5gPku&amp;s=3DiyiTZXWj1zB0iKenrf5hCwnfalL0SPL3m-oC2lU3fD8&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlY7kf6XfROaEv_y-g411=
a5tUebbL0pa-5qeaDLDKhvt5DP2KQjTZSenZlRb5gPku&amp;s=3DiyiTZXWj1zB0iKenrf5hCw=
nfalL0SPL3m-oC2lU3fD8&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c0344b061a0ee210--

