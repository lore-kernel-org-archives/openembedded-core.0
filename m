Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D634810F2878
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 08:41:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7700.1774687283253642674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 01:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mfnK/8zz;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso2871851e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 01:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774687281; cv=none;
        d=google.com; s=arc-20240605;
        b=Ecnj6r53Vg6u6A3cjVAzzvMB/e9ylo8QcdSrHx2UHDLbAKjqDNvcGUb0U8u4LOnNtP
         cVtp8sYqLEaW0pF+fA2bnsMR7g5uH6LkoEMP6SVnPOvNnmaMhv+dEdVX9DQ2jV8yU5Hp
         coZUsyGCzRM5SGJ6xnGaQUcdNiVv2UbHtTseCHie57Ue7q/8VGfLPS/PQS0oMKcL7xVE
         JFvGar8xW/NONIvJiTAOS4BJ1FICyRYT605xVORH+XuBvzAKqstW80raUWqjScBdR67a
         aGIwIM4V1Y80fzsCXGPvacbfDLJ5hBwD78DHb7ndTnsJ08A+F3G4ySJ0zXz6Pht3NfFN
         pBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1f+kCm+fsIcCzpgKT2vHhStOfC0SVfF+owck2W3qx4g=;
        fh=o6Jzo0SrRIwaXMNaGts05pG6DHtlSYXTqFMNb+H2R2U=;
        b=D7PiOD7e6j6ca9yeXwd4q4FpDCywtza86wKFSH6sYutPnePVzVTa2IWmMICWomXrBp
         SOtC7oNL1Qx+7NbHMeP9qf9qrhetKSB7KNdL6CUTget6Hu9z4+cgVG96QmGjPo/ReKqn
         N30XutYPWnpH9ou+nhQ13iaRSU7GcW30iuSow2lYG3k7G291DskRKL91m77Frh+CgYNC
         XBLAK0ZVRZwV+E88iJsjp+dMD34rn4pKaO84MmNpTCGN+03vrx61l0gELw5+YuEI9I/y
         6jr8wCJL2TpkDSkT5ICCDZ8oJX164FdPq3ueqnYU4x/nzhRizpSaRPUZdKWKaNqVPKIY
         xO5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687281; x=1775292081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f+kCm+fsIcCzpgKT2vHhStOfC0SVfF+owck2W3qx4g=;
        b=mfnK/8zzC70REi5NpXLRhEypg9SXkqbnS2JFY8aypHWQNxVVsVmMohxPmGmcoENxBb
         F1v64b1x9Uo9Flu3GKx99nan7veBav5g1kcHJaG8D+u75fmyWfG1b3lJDGtqMmPjcGte
         ed0SO7mMKUNsHUFCapJ81kDxdA1osGpMYZ/zwmRNZmF54TuoPJATKgncXjZbvKpaNzZW
         UzlAB9ELjjZlF7Na7JOLFfGj4QaNsvUl/vDFtlSjbd7J9CFNPS0mOcaIAsTM3NM5LaP8
         6wrByrYkpK3uGE8+3uGESMVCGIzygVA4ybOFi9jmuf2DBNPlL/AN+bjLqxxCNcH6X7tD
         8T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687281; x=1775292081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1f+kCm+fsIcCzpgKT2vHhStOfC0SVfF+owck2W3qx4g=;
        b=kUeNb11kLYpdzyCUKXiH2YVDrugdVp5yNU4yRknwgyb4drNLQDG/QmelODjtSoXTJp
         pII5JXqa4Gosb/viMX7+P2P7Ov5j3IVdBc6t06VOz87nGhAzaRpI+nrcSwzGjeWZ1nxm
         HCpVh8I+LnLdInoZYStX+ri7O+LD/ZnPCzTyBEitna6C3HLEcro3gHqCBvF1rltI4hCH
         safGcj4Po0wx16sSEhcD0Ve1/nNTZdvqKM3KPCYnt2emosuvjqgSZWrcmfMwsdYZ4uAK
         kyXIOkw4IrA1alL8X/zxcWfXkOZmGGNa9HoUGynuZuNqNLWjnbMtkvkE83N84uuo6mZ9
         r0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWGCZ0Im83UbvrFXwf6PJrPP/mA6nubvB00q1URAJF77Z4kIkv6Mu8NpxjxueLD2jppznIPlw80z7BxrrTQGPjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFp9uQainpSW/OmoWoU9QYvBBMIOZst9Vmwy0CmESRsVOi1VGr
	SbD/FX1U5id5Y0vgYCW8XUuD/XWzAN/GcsajYA2oslbkHMsQZ+lXNx186cF/RTHq23bxDroLJUf
	q4FTF4KzjKTtA+9GKukT92es2iVZAFDg3YB2S
X-Gm-Gg: ATEYQzy4R2Lq7PyYqTeQD5hKuj5/c92jT470H6vDUOl4NG6Yok6ePLzYISszhiPMY4G
	4zYibvEaiAkZArmcUJCk1pHCsV7hJ/yR9FXi8EExAPbvmLcbVwixkfslYMvFB3xnmV5Q2XfkE9l
	b+7MUb8CaQfBfbe0Dxm/sidpd3iiI8Y74vX1XS9jvkTUi6D4cdb8761ZScLVwCRcY44eqR7S51j
	mFNI8kpCY8FgLPGJdIEHq2L44Xv0jAB0JsOl3SDBrfE00kfELtoLWwiz9oilkhhAmnip1ASsNl8
	NrBtPJqaqg==
X-Received: by 2002:a05:6512:3405:b0:5a1:3d07:a057 with SMTP id
 2adb3069b0e04-5a2ab7fce47mr2068225e87.19.1774687281201; Sat, 28 Mar 2026
 01:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
 <20260326181450.1262870-5-martin.jansa@gmail.com> <DHDZ7EG0XTX2.115YOC91NT8OQ@smile.fr>
 <18A0F4787AD7D398.263554@lists.openembedded.org>
In-Reply-To: <18A0F4787AD7D398.263554@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 28 Mar 2026 09:41:09 +0100
X-Gm-Features: AQROBzC-rnoknp3eWjviLQm6nkm2PVX13v82PzhAm8X6PzD2-UkOi1NzG_A7Hh0
Message-ID: <CA+chaQf2S_F8Su0yOeEfn-Mo3canfNi4Xtz6z3O+e6_p4NF3+A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 5/6] elfutils: don't add -Werror to
 avoid discarded-qualifiers
To: martin.jansa@gmail.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 08:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234120

On Sat, Mar 28, 2026 at 9:37=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Sat, Mar 28, 2026 at 1:07=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
> >
> > On Thu Mar 26, 2026 at 7:14 PM CET, Martin Jansa via lists.openembedded=
.org wrote:
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > >
> > > With glibc-2.43 on host elfutils-native fails with:
> > > elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization d=
iscards =C3=A2=E2=82=AC=CB=9Cconst=C3=A2=E2=82=AC=E2=84=A2 qualifier from p=
ointer target type [-Werror=3Ddiscarded-qualifiers]
> > >
> > > elfutils-0.194 in master doesn't have this issue thanks to this patch=
 avoiding -Werror from:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D1d6ac3c81=
1798732e6addc798656bbe104661d77
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> >
> > Hello
> >
> > Isn't this patch (and 6/6) also needed on whinlatter?
> > Can you send what is needed from series to whinlatter please?
>
> Hi, I've asked about supporting hosts with glibc-2.43 in whinlatter
> and Paul and Richard were concerned about the impact and whether it's
> worth it considering that whinlatter will be EOL relatively soon.
>
> I have some changes for whinlatter already, but it needs more fixes to
> build image (m4 and gettext native are failing there), while with
> these 6 in scarthgap I was able to build whole image already.
>
> There is one more issue with latest ubuntu-26.04 (after updating
> docker image to latest last week) which isn't solved by these 6
> changes - libcrypt-dev is no longer installed as a dependency in my
> minimal docker image, leading the python3-native failing to build
> crypt and shadow-native failing to find libcrypt - I have explicitly
> added it to Dockerfile to fix this one as virtual/crypt-native is in
> ASSUME_PROVIDED and not sure if we want to use xcrypt-native to avoid
> that.
>
> Corresponding IRC log:
> https://irc.yoctoproject.org/%23yocto.2026-03-25.log.html
>
> JaMa paulbarker: Hi, any plans for supporting ubuntu-26.04 with glibc
> 2.43 on host? We will need at least new uninative from master,
> m4-native, gettext-native fixes (instead of upgrades from master) and
> probably more, I can help with that if there is consensus to get them
> merged eventually 10:01
>
> JaMa I mean for whinlatter branch, surprisingly older m4-native in
> scarthgap doesn't fail with glibc 2.43 on host 10:02
>
> paulbarker JaMa: I think it usually comes down to how invasive the
> needed changes are 10:02
>
> JaMa https://git.openembedded.org/openembedded-core/commit/?id=3D28552a7b=
6c94060c7ab3899619ab8afb74124d02
> https://git.openembedded.org/openembedded-core/commit/?id=3D7d35b0e7929d6=
66af783db835a3a809f8f6ce429
> https://git.openembedded.org/openembedded-core/commit/?id=3Dc1fb515f2a88f=
a0a0e95529afc07a99db001af0e
> would be the start, then I can extract just the glibc fix from 10:05
> JaMa https://git.openembedded.org/openembedded-core/commit/?id=3D97dd5582=
77ea48e2161f389d6458517da6e04e4a
>  and similarly from
> https://git.openembedded.org/openembedded-core/commit/?id=3D0ed7b56814d83=
37d1bd97cd2a4460065dba79207
> that should be enough to build minimal image IIRC 10:05
>
> RP paulbarker: I guess whinlatter is to be discontinued soon too which
> is probably part of the reason for the question 10:05
>
> paulbarker JaMa: I think we need to wait until 26.04 is out, then look
> at whether we can easily support it in wrynose/scarthgap 10:06
>
> paulbarker As RP says, whinlatter will be EOL, so will kirkstone 10:06
>
> JaMa OK, won't offer my help until someone looks :) I can switch to
> bit older 26.04 snapshot (the glibc was upgraded for 26.04 in last
> week) 10:08
>
> paulbarker JaMa: Sorry, I don't mean to sound dismissive. We're just
> focused on the last features for the LTS release and I don't want us
> to take on too much more until they're done 10:18
>
> RP JaMa: your help is definitely welcome, it is just a question of how
> much work we should do on whinlatter now 10:28
>
> JaMa RP: paulbarker: thanks, I have started with scarthgap issues, m4
> and gettext surprisingly doesn't fail there so it might be just the
> first 3 commits I've mentioned, doing the rebuild from scratch now

And this elfutils .patch is already included in whinlatter:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/e=
lfutils/files/0001-config-eu.am-do-not-force-Werror.patch?h=3Dwhinlatter
so it shouldn't be needed (I haven't tried, because m4 or gettext
fails before starting elfutils).

Cheers,

