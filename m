Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050B9C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 17:45:05 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.4803.1744307100911342121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 10:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/QdpbAo;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so11121026d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744307100; x=1744911900; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tRz0RfYAf6Mkxmls/iYHuR/oZWEsc32sviSP0+sZNW4=;
        b=O/QdpbAoztiE+xFXN+f51hBeOsg7mOPMlY2x8qOUY57cCkHiuuiZ0xNBC8KObqaJ2B
         FBvWNsgJrPAFqoS1rcrZ8TzVfVWJvoS886OBbAf+TGX06ZlwrVH6KoHIY8yLDmivo4vW
         eQnBYLzIfBdTIQe7gGJ522+OTTdvVd+0HVHX6mNB0JKj0gm90CP5wnHZou81NmrGP3Wg
         Rysly0+vCULeCBxm21GP+2a/E7DLm1qfbWuBKtLp0XOrt0yqT3lPDWuBHSoVrh1TMxhE
         alIgEZ6+IdraqyHPNYNthA/pp/rF1/AWrh12rIbqxZpWNTY8mtbFwqiSfebx6s0qsITJ
         qlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307100; x=1744911900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRz0RfYAf6Mkxmls/iYHuR/oZWEsc32sviSP0+sZNW4=;
        b=Xhjl4T0jUll70UT9xTySnkEMG2K4L6qQiaO5xIQy23W2os1H6k3WWgbD1N+yORkGni
         TBrqdWHZuaes5lnsni9bqsk6wCU1R8V4hxFMxdJUNFlf6PGJshTun2V0f75vkRzO9/gJ
         CHEjfKXXHDodCD+4wg2VIvMYDUT5MZzW1rIan9dR9J5nCD8mRnEgG7lLRJxuzfoh84bm
         Ut9DWkKVgJNwycpRiPvm9eDxFtSPGrdKwqvaFj1ylHiXFC5aXRI7z6Fga4rXTedXiN8V
         YhYkt0hOlNtvqV50UOOcwcgtGmH1BhvVAxHHSVfUdwHoh8/nlC9P5ppNghit9dFioijc
         GiZg==
X-Forwarded-Encrypted: i=1; AJvYcCVxntF0Fa33P4uHjaKrZ48Zd0G/YAI5A98i+aCFInSx+Msw1AwWKnOd2R5Dhw+hXU50bxZylqM0Hh0l+bsWFgXtlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgwFIRLVM1qmSH+8R3K7vak78j+4p3t0whLhBJXMl+DK+xjJ39
	DJZj4OxGk0t+CYa+7pmQTKx8x+UiHwbXe5E7/qvCiQIkbUZPWEgcDBsZoSIu83ljfNUzH5gBlSK
	DeZ9YMPN9OjSv101dMbLVKnXkqBc=
X-Gm-Gg: ASbGncvaDvqo42QxcJhk1h7+U3O10zTglrgW91i8Rtv8KbJyPqHuAMHRzkNjpFZE5q+
	dX9Xb7QvBiuJyH+0VJIJVKtTn3TDGioxUm8ein+BbDghKm7G0OCeJT+w/SFo0Xo9e68CNRmw1zE
	x1hyfgrjdo+HiMtkFPl4Gyl+/lPgBSS5qCeM/RTNfSzPO30tTIVjrr44U=
X-Google-Smtp-Source: AGHT+IF6+0CH+Qx+pNSrtH58W5fehIOTX4rLRx7D9J1N1oGi2h8at6quhej3MbRuf4xnyob6W1w+yMoAeRx/klEBpL0=
X-Received: by 2002:a05:6214:3985:b0:6e8:f166:b1a0 with SMTP id
 6a1803df08f44-6f0e5c5fb10mr72574376d6.36.1744307099814; Thu, 10 Apr 2025
 10:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com> <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
In-Reply-To: <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 19:44:48 +0200
X-Gm-Features: ATxdqUGfvYNVCZma8fkdTxAiyaxfE7pAOKfUWRieM3RxWBvUrgwRNlKhcEXeTak
Message-ID: <CANNYZj-ORUDVcfGMBUczC-CQ1LwFZiS=6qToSCZUH2WCVqxGbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: ilias.apalodimas@linaro.org
Cc: adrian.freihofer@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000105069063270254f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 17:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214689

--000000000000105069063270254f
Content-Type: text/plain; charset="UTF-8"

But none of the last few messages answer my question. Can I restate it?

Is there a physical board that can boot from ESP formatted to something
else than FAT?

Alex

On Thu 10. Apr 2025 at 18.51, Ilias Apalodimas via lists.openembedded.org
<ilias.apalodimas=linaro.org@lists.openembedded.org> wrote:

> Apologies for the noise, I forgot to add Adrian in CC
>
> On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Adrian
> >
> > On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer <mikko.rapeli@linaro.org>
> wrote:
> > >
> > > Hi Mikko
> > >
> > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > > and in u-boot. Boot without "efi" in systemd works with
> > > > EFI protocols but for example efivars is not mounted at
> > > > all so various checks fail in userspace. Fix these by
> > > > enabling "efi" support by default to avoid making
> > > > it machine specific. Fixes efivars mount to
> > > > /sys/firmware/efi/efivars etc.
> > >
> > > My point is that many OE/Yocto-based embedded products rely on a fully
> > > redundant and power fail-safe firmware update and boot implementation.
> > > So far I have not understood how this could be implemented in a
> > > similarly robust way based on EFI as we have now without EFI-based
> > > boot-up.
> >
> > As far as the firmware updates are concerned there's [0], which is
> > also implemented in U-Boot.
> > But even in that case, I am not sure I understand your concerns. What
> > prevents you from having the existing mechanisms for firmware updates
> > on a system that boots with EFI?
> >
> > >  I would therefore like to see the EFI implementation remain
> > > opt-in until it covers at least the most important use cases for robust
> > > embedded systems. What I primarily miss with EFI is a reference
> > > implementation for an A/B update system without having to rely on a FAT
> > > partition without journaling. Please correct me if I'm missing
> > > something!
> >
> > Where does the FAT partition requirement come from?
> >
> > >
> > > Would it make sense to declare poky as an EFI ready reference
> > > distribution by enabling the efi DISTRO_FEATURE there, rather than
> > > starting with making recipes enabling efi unconditionally?
> > >
> > > Could something like this in poky.conf work?
> > > DISTRO_FEATURES:append:aarch64 = " efi"
> > > DISTRO_FEATURES:append:riscv64 = " efi"
> > > DISTRO_FEATURES:append:x86-64 = " efi"
> >
> > [0]
> https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FWU/MBFW/chapter1-introduction.md
> >
> > Thanks
> > /Ilias
> > >
> > > Thank you and regards,
> > > Adrian
> > >
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > index 64fb8fe69a..06e5621398 100644
> > > > --- a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > @@ -68,13 +68,14 @@ PAM_PLUGINS = " \
> > > >  "
> > > >
> > > >  PACKAGECONFIG ??= " \
> > > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi
> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo',
> > > > 'coredump elfutils', '', d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '',
> > > > d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '',
> > > > d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit',
> > > > 'link-udev-shared', d)} \
> > > >      backlight \
> > > >      binfmt \
> > > > +    efi \
> > > >      gshadow \
> > > >      hibernate \
> > > >      hostnamed \
> > > >
> > > >
> > > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214684):
> https://lists.openembedded.org/g/openembedded-core/message/214684
> Mute This Topic: https://lists.openembedded.org/mt/112087523/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000105069063270254f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But none of the last few messages answer my question. Can=
 I restate it?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Is there =
a physical board that can boot from ESP formatted to something else than FA=
T?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu 10. Apr 2025 at 18.51, Ilias Apalodimas via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;ilias.apalodimas=
=3D<a href=3D"mailto:linaro.org@lists.openembedded.org">linaro.org@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">Apologies for the n=
oise, I forgot to add Adrian in CC<br>
<br>
On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas<br>
&lt;<a href=3D"mailto:ilias.apalodimas@linaro.org" target=3D"_blank">ilias.=
apalodimas@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Adrian<br>
&gt;<br>
&gt; On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer &lt;<a href=3D"mailto:m=
ikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Mikko<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; For example genericarm64 enables &quot;efi&quot; in MACHINE_=
FEATURES<br>
&gt; &gt; &gt; and in u-boot. Boot without &quot;efi&quot; in systemd works=
 with<br>
&gt; &gt; &gt; EFI protocols but for example efivars is not mounted at<br>
&gt; &gt; &gt; all so various checks fail in userspace. Fix these by<br>
&gt; &gt; &gt; enabling &quot;efi&quot; support by default to avoid making<=
br>
&gt; &gt; &gt; it machine specific. Fixes efivars mount to<br>
&gt; &gt; &gt; /sys/firmware/efi/efivars etc.<br>
&gt; &gt;<br>
&gt; &gt; My point is that many OE/Yocto-based embedded products rely on a =
fully<br>
&gt; &gt; redundant and power fail-safe firmware update and boot implementa=
tion.<br>
&gt; &gt; So far I have not understood how this could be implemented in a<b=
r>
&gt; &gt; similarly robust way based on EFI as we have now without EFI-base=
d<br>
&gt; &gt; boot-up.<br>
&gt;<br>
&gt; As far as the firmware updates are concerned there&#39;s [0], which is=
<br>
&gt; also implemented in U-Boot.<br>
&gt; But even in that case, I am not sure I understand your concerns. What<=
br>
&gt; prevents you from having the existing mechanisms for firmware updates<=
br>
&gt; on a system that boots with EFI?<br>
&gt;<br>
&gt; &gt;=C2=A0 I would therefore like to see the EFI implementation remain=
<br>
&gt; &gt; opt-in until it covers at least the most important use cases for =
robust<br>
&gt; &gt; embedded systems. What I primarily miss with EFI is a reference<b=
r>
&gt; &gt; implementation for an A/B update system without having to rely on=
 a FAT<br>
&gt; &gt; partition without journaling. Please correct me if I&#39;m missin=
g<br>
&gt; &gt; something!<br>
&gt;<br>
&gt; Where does the FAT partition requirement come from?<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Would it make sense to declare poky as an EFI ready reference<br>
&gt; &gt; distribution by enabling the efi DISTRO_FEATURE there, rather tha=
n<br>
&gt; &gt; starting with making recipes enabling efi unconditionally?<br>
&gt; &gt;<br>
&gt; &gt; Could something like this in poky.conf work?<br>
&gt; &gt; DISTRO_FEATURES:append:aarch64 =3D &quot; efi&quot;<br>
&gt; &gt; DISTRO_FEATURES:append:riscv64 =3D &quot; efi&quot;<br>
&gt; &gt; DISTRO_FEATURES:append:x86-64 =3D &quot; efi&quot;<br>
&gt;<br>
&gt; [0] <a href=3D"https://github.com/ARM-software/edge-iot-arch-guide/blo=
b/main/source/FWU/MBFW/chapter1-introduction.md" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/ARM-software/edge-iot-arch-guide/blob/main/s=
ource/FWU/MBFW/chapter1-introduction.md</a><br>
&gt;<br>
&gt; Thanks<br>
&gt; /Ilias<br>
&gt; &gt;<br>
&gt; &gt; Thank you and regards,<br>
&gt; &gt; Adrian<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rape=
li@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_25=
7.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_257.4.bb</a> | 3 ++-<b=
r>
&gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://sys=
temd_257.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_257.4.bb</a><br=
>
&gt; &gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_257.4.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_257.4.bb</a><br>
&gt; &gt; &gt; index 64fb8fe69a..06e5621398 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_25=
7.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_257.4.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_25=
7.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_257.4.bb</a><br>
&gt; &gt; &gt; @@ -68,13 +68,14 @@ PAM_PLUGINS =3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;acl audit apparmor efi<br>
&gt; &gt; &gt; ldconfig pam pni-names selinux smack polkit seccomp&#39;, d)=
} \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;acl audit apparmor<br>
&gt; &gt; &gt; ldconfig pam pni-names selinux smack polkit seccomp&#39;, d)=
} \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;minidebuginfo&#39;,<br>
&gt; &gt; &gt; &#39;coredump elfutils&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;wifi&#39;, &#39;rfkill&#39;, &#39;&#39;,<br>
&gt; &gt; &gt; d)} \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;x11&#39;, &#39;xkbcommon&#39;, &#39;&#39;,<br>
&gt; &gt; &gt; d)} \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;sysvinit&#39;, &#39;sysvinit&#39;,<br>
&gt; &gt; &gt; &#39;link-udev-shared&#39;, d)} \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 backlight \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 binfmt \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 efi \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 gshadow \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 hibernate \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 hostnamed \<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214684): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214684" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214684</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112087523/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112087523/1686489</a><br>
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

--000000000000105069063270254f--

