Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307DDC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:23:51 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.9811.1667924626983670877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=YXEJ2qOJ;
 spf=pass (domain: google.com, ip: 209.85.219.43, mailfrom: wltu@google.com)
Received: by mail-qv1-f43.google.com with SMTP id u7so10534351qvn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU55YoFkFEAHkH57pF1tE9jgzVRA42UNcwDfQ0lKKE=;
        b=YXEJ2qOJH1gx3j7HQ+uieOgWCjPSuE8zKPBPotl0zGpTBfpTW8QJ/rE/JdE40/ARQ4
         T+OSdS6fpTOpyE54vJzQZ7mAQj+EN5v99sWVgP3fluFTdm81JmlxFBgo5XTxhbHtslv2
         dN7nLUENP7SaPkov8erTBsPwu22hV/V0wkELwCFTe1DU5OrxMCwZx/AsKl5lDCVmZ3ug
         RAcUUFuxVNfaqAkI4y4aUSF2nSUXXQv+lRHS2uA/T78J/e7pUjZxCWxvR8UPmUsYdD/Z
         /eFyrpqfGw18g93+C1gSN68Egddb/0M2GYWkCDByCuRbPjkxzoLzJVknt7pi3+qYLCcM
         arQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFU55YoFkFEAHkH57pF1tE9jgzVRA42UNcwDfQ0lKKE=;
        b=SxJGWqxq+ER/eFBj1av5QHxYenZ6weraWR1uRFcCBwt3bo85/rtr4S44TQoyQVnmnD
         R8//FmwObXLnk1pe1yW3R4GDrxEOx7ORV+CVuGNsED3Y7BpQrYwSn+sdvyGnn5saaPTQ
         GbKYZ9y/RkQT3usLp8yg0zwLjy8jIa3jKvCIxVUP5V2Ut4pqG8BUkLrVdFWpegsnC4Ai
         lGKifSPSPBpUZru+t7SrGPeQrNZIIYmOcrf8d73VGtan07JK+auPfinUmKo8acq3oxyV
         opnrbGkhtV0BgyEoZLl8WfQSYvDAby+05eYrm6QawpVT2UiE/X1UknB/IP54yjeb1qdL
         vSRg==
X-Gm-Message-State: ACrzQf2GQw524XSMlpM+iBcy55eiHfjqY17mY1wlyTuFk1+5/t3ILg63
	IemtXiRtkP6W0QFAOeb+mqaQeKM/fffRzWHC+RcfPg==
X-Google-Smtp-Source: AMsMyM7qxRrVRb6ZC2qAEOlOWinNGrDFkSKqHvDOoXK2pTkVCUNR1ZpxKmpfWZZ3ySvEr1xrE2lcUG3zcYpT6GVtU90=
X-Received: by 2002:a05:6214:20e6:b0:4bc:26a6:b6b7 with SMTP id
 6-20020a05621420e600b004bc26a6b6b7mr30919537qvk.79.1667924625911; Tue, 08 Nov
 2022 08:23:45 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org>
In-Reply-To: <172331B40D5EBCA0.9941@lists.openembedded.org>
From: Willy Tu <wltu@google.com>
Date: Tue, 8 Nov 2022 08:23:34 -0800
Message-ID: <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: wltu@google.com
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d74b3b05ecf7f6c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172975

--000000000000d74b3b05ecf7f6c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there anything else that I need to do to help move this forward?

Willy Tu

On Mon, Oct 31, 2022 at 8:42 AM Willy Tu via lists.openembedded.org <wltu=
=3D
google.com@lists.openembedded.org> wrote:

> Friendly ping. Is there any more concern on this?
>
> Willy Tu
>
>
> On Mon, Oct 24, 2022 at 10:07 AM Willy Tu via lists.openembedded.org
> <wltu=3Dgoogle.com@lists.openembedded.org> wrote:
> >
> > Testing it out more and it seems like the current change is fine in tha=
t
> regard.
> >
> > I was building it against an OpenBMC image which include the change and
> the header and libssh.a files doesn't show up in the image itself
> >
> > ```
> > ./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image
> > ```
> > doesn't have those files. I believe that's what we are looking for?
> >
> > Willy Tu
> >
> > On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via lists.openembedded.org
> <wltu=3Dgoogle.com@lists.openembedded.org> wrote:
> >>
> >> I am testing it out again and it seems like it does install to the
> target .
> >>
> >> ```
> >> $ find -name libssh.a
> >> ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/lib/li=
bssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-destdir/=
usr/lib/libssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-split/o=
penssh-staticdev/usr/lib/libssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.0p1/li=
bssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/lib/=
libssh.a
> >>
> ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6a-r0=
/recipe-sysroot/usr/lib/libssh.a
> >> ```
> >> We don't want this, right?
> >>
> >> I'll have to try to figure it out and fix it.
> >>
> >> Willy Tu
> >>
> >> On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com>
> wrote:
> >>>
> >>>
> >>>
> >>> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
> >>>>
> >>>> Hi Ross,
> >>>>
> >>>> Thanks for the feedback.
> >>>>
> >>>> Can you point to the right repo to update? Just to make sure that I
> understand the concern, you are not referring to
> https://github.com/openembedded/meta-openembedded/pull/597, right? I am
> making changes to
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connecti=
vity/openssh/openssh_9.0p1.bb
> which I thought is part of oe-core.
> >>>>
> >>>> @Tristan Lelong is the maintainer for hiba and is okay with the
> change. Do you have any suggestions on installing it to just the sysroot =
in
> openssh while using it from the hiba recipe? I was not able to do that wh=
en
> I tried it.
> >>>
> >>>
> >>> This was indeed discussed previously in another version of the patch,
> it seemed the best way to expose OpenSSH's internal files was via the dev=
el
> package (not installed on the target), rather than hook into another
> package's syroot.
> >>>
> >>> The OpenSSH static libraries and header files are currently not made
> officially available because the API is not considered stable enough, but
> exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to
> support HIBA is fine.
> >>>
> >>>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Willy Tu
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com>
> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> oe-core doesn=E2=80=99t accept merge requests on the github mirrors=
, and you
> pushed to meta-oe, which is a different repository.
> >>>>>
> >>>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals',
> 'true', 'false', d)}; then
> >>>>>
> >>>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide s=
etting.
> >>>>>
> >>>>> >> + install -d ${D}${includedir}/ssh
> >>>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
> >>>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
> >>>>> >> + install -m0644 ${S}/openbsd-compat/*.h
> ${D}${includedir}/ssh/openbsd-compat
> >>>>> >> +
> >>>>> >> + install -d ${D}${libdir}
> >>>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
> >>>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a
> ${D}${libdir}
> >>>>> >> + fi
> >>>>>
> >>>>> So you=E2=80=99re installing bits of the SSH source into the *targe=
t*
> packages because one piece of software needs the build tree. This is
> clearly an unsupported use of openssh, as the hiba build instructions
> literally say =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure=
 at that build
> tree=E2=80=9D.  If
> >>>>>
> >>>>> I suggest a better approach would be to have a bbappend in your
> layer which adds the files you need to *just the sysroot*, so the target
> packages are unaltered.
> >>>>>
> >>>>> Ross
> >>>
> >>>
> >>>
> >>> --
> >>> Tristan Lelong | SRE | tlelong@google.com |
> >>
> >>
> >>
> >>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172324):
> https://lists.openembedded.org/g/openembedded-core/message/172324
> Mute This Topic: https://lists.openembedded.org/mt/94475279/6858837
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> wltu@google.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d74b3b05ecf7f6c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there anything else that I need to do to help move this=
 forward?<div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 31, 2022 at 8:42 AM =
Willy Tu via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;wltu=3D<a href=3D"mailto:google.com@lists.openembedded.org">goog=
le.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Friendly ping. Is there any more concern on th=
is?<br>
<br>
Willy Tu<br>
<br>
<br>
On Mon, Oct 24, 2022 at 10:07 AM Willy Tu via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&lt;wltu=3D<a href=3D"mailto:google.com@lists.openembedded.org" target=3D"_=
blank">google.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Testing it out more and it seems like the current change is fine in th=
at regard.<br>
&gt;<br>
&gt; I was building it against an OpenBMC image which include the change an=
d the header and libssh.a files doesn&#39;t show up in the image itself<br>
&gt;<br>
&gt; ```<br>
&gt; ./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image<br>
&gt; ```<br>
&gt; doesn&#39;t have those files. I believe that&#39;s what we are looking=
 for?<br>
&gt;<br>
&gt; Willy Tu<br>
&gt;<br>
&gt; On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> &lt;wltu=3D<a href=3D"mailto:google.com@lists.openembedded.org" targe=
t=3D"_blank">google.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I am testing it out again and it seems like it does install to the=
 target .<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt; $ find -name libssh.a<br>
&gt;&gt; ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr=
/lib/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-d=
estdir/usr/lib/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-=
split/openssh-staticdev/usr/lib/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9=
.0p1/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/u=
sr/lib/libssh.a<br>
&gt;&gt; ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+319923=
9c6a-r0/recipe-sysroot/usr/lib/libssh.a<br>
&gt;&gt; ```<br>
&gt;&gt; We don&#39;t want this, right?<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ll have to try to figure it out and fix it.<br>
&gt;&gt;<br>
&gt;&gt; Willy Tu<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong &lt;<a href=3D"mail=
to:tlelong@google.com" target=3D"_blank">tlelong@google.com</a>&gt; wrote:<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Oct 21, 2022 at 6:22 PM Willy Tu &lt;<a href=3D"mailto=
:wltu@google.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Ross,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thanks for the feedback.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Can you point to the right repo to update? Just to make su=
re that I understand the concern, you are not referring to <a href=3D"https=
://github.com/openembedded/meta-openembedded/pull/597" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/openembedded/meta-openembedded/pull/597=
</a>, right? I am making changes to <a href=3D"http://cgit.openembedded.org=
/openembedded-core/tree/meta/recipes-connectivity/openssh/openssh_9.0p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://cgit.openembedded.org/openembe=
dded-core/tree/meta/recipes-connectivity/openssh/openssh_9.0p1.bb</a> which=
 I thought is part of oe-core.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; @Tristan Lelong is the maintainer for hiba and is okay wit=
h the change. Do you have any suggestions on installing it to just the sysr=
oot in openssh while using it from the hiba recipe? I was not able to do th=
at when I tried it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This was indeed discussed previously in another version of the=
 patch, it seemed the best way to expose OpenSSH&#39;s internal files was v=
ia the devel package (not installed on the target), rather than hook into a=
nother package&#39;s syroot.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The OpenSSH static libraries and header files are currently no=
t made officially available because the API is not considered stable enough=
, but exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to =
support HIBA is fine.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Willy Tu<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, Oct 21, 2022 at 7:59 AM Ross Burton &lt;<a href=3D=
"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; oe-core doesn=E2=80=99t accept merge requests on the g=
ithub mirrors, and you pushed to meta-oe, which is a different repository.<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + if ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;opensshinternals&#39;, &#39;true&#39;, &#39;false&#39;, d)}; t=
hen<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; This should be a PACKAGECONFIG, as it=E2=80=99s not a =
distro-wide setting.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -d ${D}${includedir}/ssh<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -d ${D}${includedir}/ssh/openbsd-co=
mpat<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -m0644 ${S}/*.h ${D}${includedir}/s=
sh<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -m0644 ${S}/openbsd-compat/*.h ${D}=
${includedir}/ssh/openbsd-compat<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -d ${D}${libdir}<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -m0644 ${S}/libssh.a ${D}${libdir}<=
br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + install -m0644 ${S}/openbsd-compat/libopenb=
sd-compat.a ${D}${libdir}<br>
&gt;&gt;&gt;&gt;&gt; &gt;&gt; + fi<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So you=E2=80=99re installing bits of the SSH source in=
to the *target* packages because one piece of software needs the build tree=
. This is clearly an unsupported use of openssh, as the hiba build instruct=
ions literally say =E2=80=9Cbuild openssh, then point hiba=E2=80=99s config=
ure at that build tree=E2=80=9D.=C2=A0 If<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I suggest a better approach would be to have a bbappen=
d in your layer which adds the files you need to *just the sysroot*, so the=
 target packages are unaltered.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Ross<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Tristan Lelong | SRE | <a href=3D"mailto:tlelong@google.com" t=
arget=3D"_blank">tlelong@google.com</a> |<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172324" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94475279/6858=
837" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94475279/6858837</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:wltu@google.com" target=3D=
"_blank">wltu@google.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d74b3b05ecf7f6c6--

