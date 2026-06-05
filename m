Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5CCCD6E7B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:46:07 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6285.1780699564703884017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YK2/gDi6;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7de68222e96so22246057b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780699564; cv=none;
        d=google.com; s=arc-20240605;
        b=WGAN/aCEbkPo0cs1pu0pSTVcvqFeEUcJ0+2R8etoR5YYgzVUUqvxTRg1LR7WgJ9h6M
         f1SFot4zxxbKm6kHSYBlIJz+zQTRJtqTGp+91uAe8IpKDNn/0/jiSNciffvFMN5heFin
         cuU7uhgJRa1HtpFXp3z3o4RFTGrlxZgDVaahX7AL7aSBVuzfNIgS+Teujlukc+aY8RgW
         uIgIREl94Q8tewPcP+m8czdXtBDt8pb0IrILxWXegoLhVtVIo7CmZIPDtx1Tif9VvfTa
         Fx0yBKIf/Vpq5UvcsGGQTb3cP7yREqNBreEylNgnNl4CUFcuxyYV3twx0QHqfBmB0IEG
         XqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ZvBB0KGrCFDvJVffn5U6TLmge3rsj21w3fU9OAsuU8=;
        fh=cRbnzUiwalDjfywChES4ejFtOE/qduzXrAbY6z1y84o=;
        b=lZtp0VPW5Q8E9QuwdSS7RpULb7vQ+Y27Ao0PszAFV4ErlurbbrKwBmvkP/QgyOsRGF
         /e4orJzs92M36zEGP6CmP6wST6W7WWxH4l/8hreP+RRJWhLyPTu+h7sxSK4g0TsmyHNA
         nEH8IWPxIV17WAHF89wmCR/HU3PGjpAfHbXC76Y05yXATqg6OsyXIKG/N7JCNAX27esD
         y97dcebAJrwJzRB45ZXAXe/geuWeI8lR8KEOBpCTPtONPPSoQoVgW8NsPfSAohH2ZnA2
         ELO0h0+RPqt/nACOSHqIHpUCK3Kx/1u7wesghX6SC+BkgW5twL+DoFiGAehGXehEy/JZ
         7Vkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780699564; x=1781304364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZvBB0KGrCFDvJVffn5U6TLmge3rsj21w3fU9OAsuU8=;
        b=YK2/gDi6GIhtpOqimERqH9Nsmn7tAujVtZrlsaoIMc2wd1MQ2TPO58gZSWSZo2y3aN
         gE4mzt/HIQMVk4VRlci1+/m71zQU/NKpV6v8hoCzftgXHlq/uMBLWJLLhK4aHANyYa6a
         uYQDJmDtZ0fxO2fTDV9+A7LVBhIZecpqqr8TI6vzymDtoNT86N33VCx09kvLUjve2v70
         LFbhKU0S7w7rY2/OXUo3qhD1vZwjR3n/Z/sXYuaAas5pCamD1tC38qA1MbgV60UORLLQ
         g90eJ0Eqrx5KyCH9bo7ifYnm2c8J+EpISqs6OoJjhrdnyPhpJDosTzGZtIXq4ITh5PEL
         l7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780699564; x=1781304364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ZvBB0KGrCFDvJVffn5U6TLmge3rsj21w3fU9OAsuU8=;
        b=d8gHTtsAjtWMgZBU7mMJQbUyZVRoCYVQ3LcQx1C7OkMBpowCOdoYHdcpsslqYa72bY
         ep4Qxj4+TOdAr9D3iQh6A8/7EG206UaX/I5u4u2jF/iyQjzoxa8qqi5vAbDCoC8lxcQm
         U65NU9apUnaXGVW4O0u0BeOsieDCxYRN39M8vh1Mx1VnkOf+Lu23wpZ8eg0DJDC/iD9e
         CG0qMwuxH/nfeLBspoB/xq+hEcuTwRin6pGu0OJux4aNY6Nb649eiwvRPB4bsQNqN8cy
         lEYPr/4amxI5QOE97sDFYVft6kBYCIGv2nVdbE0KxFjmz8miKDslXq4xZ9qdcEDlkd7i
         uV1A==
X-Gm-Message-State: AOJu0YySmMlFfXcBjdnkydxq3kvM2xhyfbm9jsu4atg14WuUy1rkde8q
	RKsboOFHNJEMzVENrfh5hSwYY2x0sf7z3MbWlpzK+MWJsmO7smRWkHnJUakMVW0mviXGb+IdW/T
	DPSuB/+3eW3BKAeHz+ccOPDFS2h7j+ZM=
X-Gm-Gg: Acq92OHRxB81gAUFg7gy7DZDhze17milpnQrmXQjIjTOlBeEm6QTcV1J/wEINfP/U1k
	BLTYo0GH3aSUe9K8PbMtyV9SoseQOxSj1RHc23VW7yi0aQLYIOJ1f3uhnUK69df0KWRw1CGzonc
	iL7ae9mlRMAMUr0OAemPI0pICZBb1BcgN+YOBovSwlnkQJwTcF8m29Mr1JkqIyLXu7WDUvONqeJ
	YAg5Ojc+0Vc/r4NwvhvxUO6lb6Ijq6zp9jLOsNXisel1VbLkxUQjiIRhAwLWrJxlogOWgWH5kXU
	ASK6+qXu2DQP5DN1QefxriYdDSXFXOEJ
X-Received: by 2002:a53:b203:0:b0:660:68e7:ee50 with SMTP id
 956f58d0204a3-6610701b685mr4285504d50.31.1780699563740; Fri, 05 Jun 2026
 15:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260526185633.24403-1-leoreis.costa@gmail.com>
In-Reply-To: <20260526185633.24403-1-leoreis.costa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 5 Jun 2026 16:45:52 -0600
X-Gm-Features: AVVi8CetGlrwoxcZVx3j3AAmmY6QvINiPU3he3l_cEG-MY5XDxGfCC2zwOXR9GM
Message-ID: <CAJdd5GaOu7+31fZnPODccwxdFqHAvEJ485RNruKcwQDSgmRr1w@mail.gmail.com>
Subject: Re: [OE-core] [RFC] Bootloader components missing from image SBOM
To: leoreis.costa@gmail.com
Cc: openembedded-core@lists.openembedded.org, leonardo.costa@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238213

On Tue, May 26, 2026 at 1:57=E2=80=AFPM Leonardo Costa via
lists.openembedded.org
<leoreis.costa=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello all,
>
> We are planning to release SPDX SBOMs along with our images to provide pa=
ckage
> information about the software components that make them up.
>
> As it currently stands today, bootloader components are not included in t=
he
> final SBOM generated for the image. In particular, for our machines based=
 on
> i.MX SoCs, the imx-boot container, along with boot components (ATF, SECO,=
 SCFW)
> have their SPDX files generated in spdx/, but not included in the image S=
BOM.
>
> If I understand correctly, the SBOM is generated by looking at the packag=
es in
> the rootfs, and recursively adding their SPDX entries along with the ones=
 for
> their dependencies. In our builds, I found that U-Boot does get included =
in
> the SBOM, but in our particular case this seems to be due to the presence=
 of
> libubootenv in the rootfs, which has the U-Boot recipe in its dependency =
chain,
> so the inclusion of U-Boot in the SBOM is only a side effect.
>
> I have not seen anyone raise this as an issue, but my intuition is that t=
his
> information should be included in the SBOM. Despite not making it to the
> rootfs, these boot components are still part of the image. CVE informatio=
n
> about them, for example, is relevant to users.
>
> My question is, is there any configuration that should be set to include =
these
> components? I couldn't find anything about this in the documentation or i=
n the
> code. If there is no configuration regarding this, would a contribution t=
o add
> components such as these be welcome?

FYI, I started working on this in oe-contrib/jpew/spdx-deploy
(https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djpew/spdx-=
deploy)
if you can try it out and make sure it will allow you to do what you
want, I would appreciate it

>
> Kind regards,
>
> Leonardo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237625): https://lists.openembedded.org/g/openembedde=
d-core/message/237625
> Mute This Topic: https://lists.openembedded.org/mt/119502448/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

