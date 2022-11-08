Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A41C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:09:04 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.555.1667927338942047318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=E3JB+Hev;
 spf=pass (domain: google.com, ip: 209.85.219.51, mailfrom: wltu@google.com)
Received: by mail-qv1-f51.google.com with SMTP id u7so10626188qvn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL6ZPt0uLb7ZeMvX59qkMz7Oq9J631habY3g4o+tVgg=;
        b=E3JB+HevbjUBRX/M9jzu/wWxgpNUGWfCJTLOIwwkDv9wo80YLPXV3zjyvmlu9Zksgr
         JR6JGwoJJJokIwu26FEBa/sIqjcKuW25A6i5PRe7EhZYxrsKXQnDWFCskRH0cQyAD4PT
         +zZfUuDyN4R6z8HszACV9yG8BUyXdsNJQMYy7lmx1U1t7h9cJAEd54X+mOmt6eva3MDR
         S5DhhSpZvBs500Wj6mvCxy2uTqsqZ+GjYsyBMyR/iDSYSQ1AC4lvxDYnlomsguB70Ka5
         7zNlkcIJsmpFRv3PMSDqTDrQWFb9rq+Gs11bcDxZjbiKf5FETeSi7hMv+/yGeQVDzL8+
         mFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL6ZPt0uLb7ZeMvX59qkMz7Oq9J631habY3g4o+tVgg=;
        b=HyN8GIwIqCD+0igNgbb+pg1kI1UuFfAmCDEjoIZ0s9GTKZmnDLPP2YBT708Kl4oE1L
         m84NYl74YVkb3KKoB4LZOFE0EHGTagiqroz46My/zdrR5lHrPfkSsa/TAOcMBmpm3qvY
         oiiYRrvNhi2mzYztXgMSTvpC+pCAsX04mLzNCZBcTbKj+KaHgYTjf2cE6YXI2BIJODC5
         0xGIlQeOlP5DeXTEUO5+VEu7K1UOLN5w21U71blb/z85EmZkuXw/wP5UCWqG46D261Wt
         JoI9ZkDU9CfvotBRmQbCKEo0sniRYRi4Xewokw3NanfnORFYzXEC45Sc0ewa3npuAORU
         TWBg==
X-Gm-Message-State: ACrzQf2Lcj/lqNNTsIVO525H2gGDf1eItRodPoqMSrTNvmnmkqaTiF/U
	Flbh2CIBKIOgQUpcyUkVtE69Mfc3o3kdcIf/QnZPiw==
X-Google-Smtp-Source: AMsMyM7k80KKNEcTrIkDdNx/1y3iEyU5KXhccKBmifknMRwRmLbSZ6rlpN0D+fAJVKD4TSyhf0Mna2cXJzhP6XRLZuc=
X-Received: by 2002:ad4:5bc1:0:b0:4ad:34b2:d29c with SMTP id
 t1-20020ad45bc1000000b004ad34b2d29cmr50649046qvt.21.1667927337804; Tue, 08
 Nov 2022 09:08:57 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
 <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
In-Reply-To: <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 8 Nov 2022 09:08:46 -0800
Message-ID: <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172982

Thanks Alexander for the feedback,

We had some discussion internally with one of the OpenSSH maintainers
and they are fine with it. I'll try to see if there is a public forum
where we can share the discussion.

Willy Tu


On Tue, Nov 8, 2022 at 8:27 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> The correct way to do this is to discuss the issue with openssh
> upstream, and provide a link to any such discussion if it has already
> happened. If they don't want to install these things, they have
> reasons, and you need to at least try to convince them otherwise.
>
> We generally do not go against upstream choices.
>
> Alex
>
> On Tue, 8 Nov 2022 at 17:23, Willy Tu via lists.openembedded.org
> <wltu=3Dgoogle.com@lists.openembedded.org> wrote:
> >
> > Is there anything else that I need to do to help move this forward?
> >
> > Willy Tu
> >
> > On Mon, Oct 31, 2022 at 8:42 AM Willy Tu via lists.openembedded.org <wl=
tu=3Dgoogle.com@lists.openembedded.org> wrote:
> >>
> >> Friendly ping. Is there any more concern on this?
> >>
> >> Willy Tu
> >>
> >>
> >> On Mon, Oct 24, 2022 at 10:07 AM Willy Tu via lists.openembedded.org
> >> <wltu=3Dgoogle.com@lists.openembedded.org> wrote:
> >> >
> >> > Testing it out more and it seems like the current change is fine in =
that regard.
> >> >
> >> > I was building it against an OpenBMC image which include the change =
and the header and libssh.a files doesn't show up in the image itself
> >> >
> >> > ```
> >> > ./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image
> >> > ```
> >> > doesn't have those files. I believe that's what we are looking for?
> >> >
> >> > Willy Tu
> >> >
> >> > On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via lists.openembedded.org =
<wltu=3Dgoogle.com@lists.openembedded.org> wrote:
> >> >>
> >> >> I am testing it out again and it seems like it does install to the =
target .
> >> >>
> >> >> ```
> >> >> $ find -name libssh.a
> >> >> ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/=
lib/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-de=
stdir/usr/lib/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-s=
plit/openssh-staticdev/usr/lib/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.=
0p1/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/us=
r/lib/libssh.a
> >> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239=
c6a-r0/recipe-sysroot/usr/lib/libssh.a
> >> >> ```
> >> >> We don't want this, right?
> >> >>
> >> >> I'll have to try to figure it out and fix it.
> >> >>
> >> >> Willy Tu
> >> >>
> >> >> On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com>=
 wrote:
> >> >>>
> >> >>>
> >> >>>
> >> >>> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
> >> >>>>
> >> >>>> Hi Ross,
> >> >>>>
> >> >>>> Thanks for the feedback.
> >> >>>>
> >> >>>> Can you point to the right repo to update? Just to make sure that=
 I understand the concern, you are not referring to https://github.com/open=
embedded/meta-openembedded/pull/597, right? I am making changes to http://c=
git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/opens=
sh/openssh_9.0p1.bb which I thought is part of oe-core.
> >> >>>>
> >> >>>> @Tristan Lelong is the maintainer for hiba and is okay with the c=
hange. Do you have any suggestions on installing it to just the sysroot in =
openssh while using it from the hiba recipe? I was not able to do that when=
 I tried it.
> >> >>>
> >> >>>
> >> >>> This was indeed discussed previously in another version of the pat=
ch, it seemed the best way to expose OpenSSH's internal files was via the d=
evel package (not installed on the target), rather than hook into another p=
ackage's syroot.
> >> >>>
> >> >>> The OpenSSH static libraries and header files are currently not ma=
de officially available because the API is not considered stable enough, bu=
t exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to supp=
ort HIBA is fine.
> >> >>>
> >> >>>>
> >> >>>>
> >> >>>> Thanks,
> >> >>>>
> >> >>>> Willy Tu
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com>=
 wrote:
> >> >>>>>
> >> >>>>> Hi,
> >> >>>>>
> >> >>>>> oe-core doesn=E2=80=99t accept merge requests on the github mirr=
ors, and you pushed to meta-oe, which is a different repository.
> >> >>>>>
> >> >>>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternal=
s', 'true', 'false', d)}; then
> >> >>>>>
> >> >>>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wid=
e setting.
> >> >>>>>
> >> >>>>> >> + install -d ${D}${includedir}/ssh
> >> >>>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
> >> >>>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
> >> >>>>> >> + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ss=
h/openbsd-compat
> >> >>>>> >> +
> >> >>>>> >> + install -d ${D}${libdir}
> >> >>>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
> >> >>>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}=
${libdir}
> >> >>>>> >> + fi
> >> >>>>>
> >> >>>>> So you=E2=80=99re installing bits of the SSH source into the *ta=
rget* packages because one piece of software needs the build tree. This is =
clearly an unsupported use of openssh, as the hiba build instructions liter=
ally say =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at tha=
t build tree=E2=80=9D.  If
> >> >>>>>
> >> >>>>> I suggest a better approach would be to have a bbappend in your =
layer which adds the files you need to *just the sysroot*, so the target pa=
ckages are unaltered.
> >> >>>>>
> >> >>>>> Ross
> >> >>>
> >> >>>
> >> >>>
> >> >>> --
> >> >>> Tristan Lelong | SRE | tlelong@google.com |
> >> >>
> >> >>
> >> >>
> >> >>
> >> >
> >> >
> >> >
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172975): https://lists.openembedded.org/g/openembed=
ded-core/message/172975
> > Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

