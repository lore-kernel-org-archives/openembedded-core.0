Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE79EFA3743
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:42:22 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.10807.1667230935966884712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=UJ6Ker0W;
 spf=pass (domain: google.com, ip: 209.85.222.181, mailfrom: wltu@google.com)
Received: by mail-qk1-f181.google.com with SMTP id 8so7810086qka.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+haQBJBy/S76/8V6VQBqIH+8D6y0yMUSb7TUbV9WIk=;
        b=UJ6Ker0W1ZctEeXLFPhx3Jw0BFWMjd2zFs6A68dcgiODAU62T5gvvjaNMvIEcnVpYj
         IA0bTc51uSfwCYedOHdhHmi5fS4Cr9JMmgZdZfJCazcVoFBouF0KZ6pN7iSWcZ1WQPfH
         q+9jpY0yD6ezjTND5Uos61n1PsmXGrOMf0WSJ/lw26ErhfG9/JsPE4LH3Bt9FyUlDMei
         Wr/ZWV1bW2jLYgI6ArKqoSVtoZbHs4e1E1kImwaItXvAPO8XzM1HQLI2Xbt9ALvJSxSI
         RFFcD3krm8wd1A+OjLD619MWWP1PtQm+IG0fIb9zNfCRton75UdrqCMSAsB31+gqwiTZ
         22ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+haQBJBy/S76/8V6VQBqIH+8D6y0yMUSb7TUbV9WIk=;
        b=jPeASswwPZZQD39XlX3U8zaMMpCttVNo65jW/wcnzjRGR+4M0XQqM2r90kgfYfZtO8
         RYSAxOFK98z5ILT3VymBbUqW0rkt2Wg3LM0YvynytUfQR/nLtN8ClD22Q/7b0xK+H9HQ
         yxa3Im48qoTSNTczuTLTdwwbPVJDuHUksVeKfp/qFYrfnxo2SpIpEfKtkHF/ft/hV3Ks
         Us/G4JdFR5P0sDohIqnDbkv4nB/MRsSl9hY/sxUXox5LDJ0ziQ0k4Cc0reDpMibrIEET
         rzjozfivQachxP3pexucdgXUGRqW/Eioj8xogxYVr3+fYWgatLHkFRFF1e41wzJV1JcH
         DT4Q==
X-Gm-Message-State: ACrzQf1xI/PChyWx3wmIl6LjaKzWBxor5aFm/Jr63E2Fbuq6L72cKF99
	AuV75N6k/7na3yuJq9pVbq73IUZhMZwV+PACLypWIA==
X-Google-Smtp-Source: AMsMyM5SHvrxx2UFW0ZlOoVoYHc0zfc/fYrnOLsss23Be5Mmkoln39gzv/BWU62xko8w28yVCtZ2kIlimmC4WUTGjHA=
X-Received: by 2002:a05:620a:1377:b0:6fa:2fba:1a7c with SMTP id
 d23-20020a05620a137700b006fa2fba1a7cmr3386597qkl.221.1667230934924; Mon, 31
 Oct 2022 08:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
In-Reply-To: <17211049B04D4148.10479@lists.openembedded.org>
From: Willy Tu <wltu@google.com>
Date: Mon, 31 Oct 2022 08:42:03 -0700
Message-ID: <CAHwn2XkMTRy-Rj=ULTXumRpZTN93V0+U+zs+tk7cwy2F=VgAmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: wltu@google.com
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172324

Friendly ping. Is there any more concern on this?

Willy Tu


On Mon, Oct 24, 2022 at 10:07 AM Willy Tu via lists.openembedded.org
<wltu=3Dgoogle.com@lists.openembedded.org> wrote:
>
> Testing it out more and it seems like the current change is fine in that =
regard.
>
> I was building it against an OpenBMC image which include the change and t=
he header and libssh.a files doesn't show up in the image itself
>
> ```
> ./tmp/work/izumi-openbmc-linux-gnueabi/obmc-phosphor-image
> ```
> doesn't have those files. I believe that's what we are looking for?
>
> Willy Tu
>
> On Mon, Oct 24, 2022 at 9:05 AM Willy Tu via lists.openembedded.org <wltu=
=3Dgoogle.com@lists.openembedded.org> wrote:
>>
>> I am testing it out again and it seems like it does install to the targe=
t .
>>
>> ```
>> $ find -name libssh.a
>> ./tmp/sysroots-components/armv7a/openssh/usr/lib/libssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/image/usr/lib/l=
ibssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/sysroot-destdir=
/usr/lib/libssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/packages-split/=
openssh-staticdev/usr/lib/libssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/openssh-9.0p1/l=
ibssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/openssh/9.0p1-r0/package/usr/lib=
/libssh.a
>> ./tmp/work/armv7a-openbmc-linux-gnueabi/hiba/1.0+gitAUTOINC+3199239c6a-r=
0/recipe-sysroot/usr/lib/libssh.a
>> ```
>> We don't want this, right?
>>
>> I'll have to try to figure it out and fix it.
>>
>> Willy Tu
>>
>> On Mon, Oct 24, 2022 at 7:57 AM Tristan Lelong <tlelong@google.com> wrot=
e:
>>>
>>>
>>>
>>> On Fri, Oct 21, 2022 at 6:22 PM Willy Tu <wltu@google.com> wrote:
>>>>
>>>> Hi Ross,
>>>>
>>>> Thanks for the feedback.
>>>>
>>>> Can you point to the right repo to update? Just to make sure that I un=
derstand the concern, you are not referring to https://github.com/openembed=
ded/meta-openembedded/pull/597, right? I am making changes to http://cgit.o=
penembedded.org/openembedded-core/tree/meta/recipes-connectivity/openssh/op=
enssh_9.0p1.bb which I thought is part of oe-core.
>>>>
>>>> @Tristan Lelong is the maintainer for hiba and is okay with the change=
. Do you have any suggestions on installing it to just the sysroot in opens=
sh while using it from the hiba recipe? I was not able to do that when I tr=
ied it.
>>>
>>>
>>> This was indeed discussed previously in another version of the patch, i=
t seemed the best way to expose OpenSSH's internal files was via the devel =
package (not installed on the target), rather than hook into another packag=
e's syroot.
>>>
>>> The OpenSSH static libraries and header files are currently not made of=
ficially available because the API is not considered stable enough, but exp=
orting them in OE for HIBA (gated by a PACKAGECONFIG) in order to support H=
IBA is fine.
>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Willy Tu
>>>>
>>>>
>>>>
>>>>
>>>> On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com> wrot=
e:
>>>>>
>>>>> Hi,
>>>>>
>>>>> oe-core doesn=E2=80=99t accept merge requests on the github mirrors, =
and you pushed to meta-oe, which is a different repository.
>>>>>
>>>>> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals', '=
true', 'false', d)}; then
>>>>>
>>>>> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide set=
ting.
>>>>>
>>>>> >> + install -d ${D}${includedir}/ssh
>>>>> >> + install -d ${D}${includedir}/ssh/openbsd-compat
>>>>> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
>>>>> >> + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/ope=
nbsd-compat
>>>>> >> +
>>>>> >> + install -d ${D}${libdir}
>>>>> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
>>>>> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${lib=
dir}
>>>>> >> + fi
>>>>>
>>>>> So you=E2=80=99re installing bits of the SSH source into the *target*=
 packages because one piece of software needs the build tree. This is clear=
ly an unsupported use of openssh, as the hiba build instructions literally =
say =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that bui=
ld tree=E2=80=9D.  If
>>>>>
>>>>> I suggest a better approach would be to have a bbappend in your layer=
 which adds the files you need to *just the sysroot*, so the target package=
s are unaltered.
>>>>>
>>>>> Ross
>>>
>>>
>>>
>>> --
>>> Tristan Lelong | SRE | tlelong@google.com |
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172111): https://lists.openembedded.org/g/openembedde=
d-core/message/172111
> Mute This Topic: https://lists.openembedded.org/mt/94475279/6858837
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [wl=
tu@google.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

