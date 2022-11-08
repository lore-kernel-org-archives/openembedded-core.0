Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C9EC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:27:24 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1.1667924841240791885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iz4pikAz;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id be13so21957163lfb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWv1fmeq5JDif3w4LoP4AqdW+z6joHcdRDhXrpOt9ec=;
        b=Iz4pikAzB0ovFsDlP0MkoJM2/Min9XAuAE8cGY/+UqwPzwgofdbP4AJTa8dOY5yjcU
         pdV7Vm4wAwX4S9F10Asc220ItpTNR4d8X6GKhvSUx9L6wcmvKAopOWHyYXxsrKjp4ttP
         kTxmWR2XXh7ynBAilcMtn8zo2DwzJL5RUVphS7/vghgPZfoEtK5ZsfwNdyk+D5Wyxp/u
         PKXu3DxCcnTIMpCsyAVKIoFHbe3R4zidTW5KUXo5ZP85qUP0yFD7l2WjGzLP0pboSdLj
         25SiPkaQx+4zLwFnLumcCKT3UHu8hVT0o/qnQfYLp5RIlFRFDGyIkmrMmmzF7mPTNX7b
         1vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWv1fmeq5JDif3w4LoP4AqdW+z6joHcdRDhXrpOt9ec=;
        b=o5PbVmPdqZHYKPtrso6fqhpBhu0GMHMQMc7Wq5Nb2tzIRLR8shGLYWZ+lsV/CPzsSE
         5MnKera1jIsurd8CyZ7tID2RBHxNvBl/coV1s7vAyDaV8FbIRSTpqUSOCCIWwvmQCkB+
         gIaK+ogWSvwT3pL20raIH94+BDMQHmnK+iH8kLwS0+1X1NBMvsVAaIgIxcPTD3LxPrGu
         sAkdV1RRJDBlzMMePCRwKY8XQyfW43Ioeapu6L3QC7xJeQDpxVZ76dSF9qcbzsyOf5Bj
         eFsijcoibIh4dZIIcRN0OnB8d2udCfnsgfRIeo7yPc9tMBMXv3W7ruJRcw2URpYHA6TY
         XZaQ==
X-Gm-Message-State: ACrzQf03ML14xMZay/z8mhxekwfAcGKsRrOOotynhyLh/xY5i9hSLzoH
	XEYGPYZ+I+wgJOH+6KvD9lbcVn1AKsoCyKZaoBg=
X-Google-Smtp-Source: AMsMyM6b8jZtpwU8k0hUc/zlgmczx2uicyJ8RZDjB1R8IYmzIgEnpEHumWpHB6fTV14aG5UNDZGPzz5SbZXb8EDy1fo=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr19336382lfl.367.1667924839396; Tue, 08
 Nov 2022 08:27:19 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
In-Reply-To: <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 17:27:07 +0100
Message-ID: <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: wltu@google.com
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172977

The correct way to do this is to discuss the issue with openssh
upstream, and provide a link to any such discussion if it has already
happened. If they don't want to install these things, they have
reasons, and you need to at least try to convince them otherwise.

We generally do not go against upstream choices.

Alex

On Tue, 8 Nov 2022 at 17:23, Willy Tu via lists.openembedded.org
<wltu=3Dgoogle.com@lists.openembedded.org> wrote:
>
> Is there anything else that I need to do to help move this forward?
>
> Willy Tu
>
> On Mon, Oct 31, 2022 at 8:42 AM Willy Tu via lists.openembedded.org <wltu=
=3Dgoogle.com@lists.openembedded.org> wrote:
>>
>> Friendly ping. Is there any more concern on this?
>>
>> Willy Tu
>>
>>
>> On Mon, Oct 24, 2022 at 10:07 AM Willy Tu via lists.openembedded.org
>> <wltu=3Dgoogle.com@lists.openembedded.org> wrote:
>> >
>> > Testing it out more and it seems like the current change is fine in th=
at regard.
>> >
>> > I was building it against an OpenBMC image which include the change an=
d the header and libssh.a files doesn't show up in the image itself
>> >
>> > ```
>> > ./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image
>> > ```
>> > doesn't have those files. I believe that's what we are looking for?
>> >
>> > Willy Tu
>> >
>> > On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via lists.openembedded.org <w=
ltu=3Dgoogle.com@lists.openembedded.org> wrote:
>> >>
>> >> I am testing it out again and it seems like it does install to the ta=
rget .
>> >>
>> >> ```
>> >> $ find -name libssh.a
>> >> ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/li=
b/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-dest=
dir/usr/lib/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-spl=
it/openssh-staticdev/usr/lib/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.0p=
1/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/=
lib/libssh.a
>> >> ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6=
a-r0/recipe-sysroot/usr/lib/libssh.a
>> >> ```
>> >> We don't want this, right?
>> >>
>> >> I'll have to try to figure it out and fix it.
>> >>
>> >> Willy Tu
>> >>
>> >> On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com> w=
rote:
>> >>>
>> >>>
>> >>>
>> >>> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
>> >>>>
>> >>>> Hi Ross,
>> >>>>
>> >>>> Thanks for the feedback.
>> >>>>
>> >>>> Can you point to the right repo to update? Just to make sure that I=
 understand the concern, you are not referring to https://github.com/openem=
bedded/meta-openembedded/pull/597, right? I am making changes to http://cgi=
t.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/openssh=
/openssh_9.0p1.bb which I thought is part of oe-core.
>> >>>>
>> >>>> @Tristan Lelong is the maintainer for hiba and is okay with the cha=
nge. Do you have any suggestions on installing it to just the sysroot in op=
enssh while using it from the hiba recipe? I was not able to do that when I=
 tried it.
>> >>>
>> >>>
>> >>> This was indeed discussed previously in another version of the patch=
, it seemed the best way to expose OpenSSH's internal files was via the dev=
el package (not installed on the target), rather than hook into another pac=
kage's syroot.
>> >>>
>> >>> The OpenSSH static libraries and header files are currently not made=
 officially available because the API is not considered stable enough, but =
exporting them in OE for HIBA (gated by a PACKAGECONFIG) in order to suppor=
t HIBA is fine.
>> >>>
>> >>>>
>> >>>>
>> >>>> Thanks,
>> >>>>
>> >>>> Willy Tu
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com> w=
rote:
>> >>>>>
>> >>>>> Hi,
>> >>>>>
>> >>>>> oe-core doesn=E2=80=99t accept merge requests on the github mirror=
s, and you pushed to meta-oe, which is a different repository.
>> >>>>>
>> >>>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals'=
, 'true', 'false', d)}; then
>> >>>>>
>> >>>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide =
setting.
>> >>>>>
>> >>>>> >> + install -d ${D}${includedir}/ssh
>> >>>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
>> >>>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
>> >>>>> >> + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/=
openbsd-compat
>> >>>>> >> +
>> >>>>> >> + install -d ${D}${libdir}
>> >>>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
>> >>>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${=
libdir}
>> >>>>> >> + fi
>> >>>>>
>> >>>>> So you=E2=80=99re installing bits of the SSH source into the *targ=
et* packages because one piece of software needs the build tree. This is cl=
early an unsupported use of openssh, as the hiba build instructions literal=
ly say =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that =
build tree=E2=80=9D.  If
>> >>>>>
>> >>>>> I suggest a better approach would be to have a bbappend in your la=
yer which adds the files you need to *just the sysroot*, so the target pack=
ages are unaltered.
>> >>>>>
>> >>>>> Ross
>> >>>
>> >>>
>> >>>
>> >>> --
>> >>> Tristan Lelong | SRE | tlelong@google.com |
>> >>
>> >>
>> >>
>> >>
>> >
>> >
>> >
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172975): https://lists.openembedded.org/g/openembedde=
d-core/message/172975
> Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

