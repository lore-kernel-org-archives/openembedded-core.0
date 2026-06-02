Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7918CCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 19:45:11 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3748.1780429504811589023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 12:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZJRHGdbk;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccea53f35cso51632466d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780429504; cv=none;
        d=google.com; s=arc-20240605;
        b=akgbqE+KR3qoy7++foQm5igTGzgT/9Dv3F5MV7mL4/nielVZ4lATxJotAeLEXVU/R0
         5+UldkgNGC64npo3SVnRLusg80h5LwQ0uWdqPslbWIMpc68pJmhuZr4R3NTpBNb0JQmy
         xa6Gh+T7nW4PxyS+0iQ7y0kQZPFIb/nKaIB7chqmIXl0BaspijQ+fayzAfmk4K3Nf8xd
         K2hoqax2+7YGlsYY3hMuALNUagsj7c4wO+W14OUzyF8sXPHWKDL9kjQRPr2aJx7+mYWH
         VZGs+zsmAAVFyvglbvWkLuqlRXn/k8aMnodHyOCkV+A+2ca29eEeIxolcIzBiz1mQgQh
         WWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjGHSVyefQFsLhyrK90sxdLifUSaNlS88ztrFYPACfU=;
        fh=eq6Z1eQiou2ycnbWzul9CDdBuV2p+KMbMfpBJySHArI=;
        b=eArHNxt+djHpky/Zak2+OkeaMThifaJ5fEzyb2BaBeBLsHRKS715b4bu6HTSUgSpUh
         +LL5TckyHQKTVWytAYhmFtrXRws/ZD1SXpDWoiQ7amef5/axn8VuIJkPOUolrbwB/+r3
         SzOFjl8XLP68svVDeGqnxLsPXTL5WGB7AReMXLSWsxkbq6uDsGoAW86WCqLznkCe8jJ3
         4dLRXy92nMrZtbQDiNZrgS/Jw0J8aDbm6/B5ZL1fbxIxqVpSZGIYnp3Xwdjbe1MFadkj
         U4R+VPpA1Mb0xno4V8nWRc4fVq2HMRRWii/UkQz95eu5k8PjLG/K6190PWtbEzexFVJ4
         Epdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429504; x=1781034304; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjGHSVyefQFsLhyrK90sxdLifUSaNlS88ztrFYPACfU=;
        b=ZJRHGdbkxsXdvFCYj74zvS0+m7KZuTcs8YQMs/g1j7mr0Cm0nXgPHJhwM+UauKn2oX
         2TUuMvA2tX6B8Po+nmQIQrOSCH5w7UEjXNUFYGpEu6AqH64l30XnoBsBc/SCSBHdgUur
         mt5V0eUlUtaVXlOm6Ve3rGA2yc/3GP6sRtmczn9A1VxAZXaX85TGceCTfCZogLICvp7Q
         Cvf6g58n6X3Ti7sg2sqIfGw83sC7TLTIT1AHXA9QlUjPz2GJSRxQPZAGInXlwGhwO0U+
         Hr+mmJ7bHzQ29EPVnEKf2/RyuMl70VHFPpk19hJuFCyBgga6djOmvFNEbhEgFhFE7oZE
         1KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429504; x=1781034304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjGHSVyefQFsLhyrK90sxdLifUSaNlS88ztrFYPACfU=;
        b=LuLL9zzJWUHsICQBc7X0+ekCotRv9EsM4kqJf0v97dEZqpsykpPdpK0/QiJT7j36Hp
         0QGXi7wOvaTjTrJ4SCFx1rIFhBL+CzCH/rtpjd/920WeE8ut/EO8swGvfPKPuq1vFnpT
         g7UZ3ru+OAoX2Y9eI+2rcNd9WsTeWW+kkNCGwnISTevKZhqi7kpjSTXGt9xFsnVt+El/
         Yd/oFzCmUGkWm6yY4kGjB3iSAAyJnEzrajjrQZvB/6PzHjlrhGvE5QvKFGjJNXA9oPQd
         /vJpfGXzLI3w8e1u2WkzqL9XTPzvRPanQYNMuDRodW7k55rRW8OJXNE2foKPE4HoSOzQ
         g6fg==
X-Forwarded-Encrypted: i=1; AFNElJ/cgw+oaRWS70mAIIuzlvp8QTP5auQsV5A0pNSf0iKSuOR8FsxI3T39f+MNdI3oIS41w2UB0gKfECO+NJruhR28PA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuNaoLxCNWQhOL4Xg+VrJ57dkgCJYoGLUtnOXOps+zAzdXo7pb
	fp1ONwhrEMyoN4Ox08Ku72LR4azx3hrpGHWIkXlcWlcf7FMt7mXIHa+F/0qt/Z7dCP8p42iochU
	QjCBSj43+SXCd/MNGKwX3RQxtdwZoa9c=
X-Gm-Gg: Acq92OF/9F7N4Zef7RcRuGczLetVG3MHLJBThLNGo/ysC0sXIUveTXaGoGhIredcY6T
	7fSkqilvkiYYqo7w3q8vXFG8mvnf/ZCIFOOwsMuMdpL9YZyNCrtDmPFIDihl/9WDi3ebe1+qdU8
	Wr9h7BdTi4J/o7nMvrEuqlv3VMVQnMn8xKEzHh6wErQa8NCPGUfO1i637887cXUTUZ9zbZ8J/RO
	BsL9q1iSJOlBafKSc4n+eHHpgwl+vbghOewIcjszNxqQgZkcangdWtJjCM00Sqs9e+Kh0D9bDiv
	jHdtR9i5YZAR/3N6D3AlO8pvf8ydP13Fmj7ppEI3OreF/4zBrjYklAky6Hvp9lY=
X-Received: by 2002:a05:622a:5595:b0:516:e517:6dd3 with SMTP id
 d75a77b69052e-517786bdc92mr7873901cf.40.1780429503732; Tue, 02 Jun 2026
 12:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com> <867f6a81-8f8e-40e5-8440-31c6694bf5f0@windriver.com>
In-Reply-To: <867f6a81-8f8e-40e5-8440-31c6694bf5f0@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2026 21:44:52 +0200
X-Gm-Features: AVHnY4IS6vLsyUGbOgG5H6whcNT0dQ8alJBW3GoIoK1fBH4C6jbkC2r3UK-Dc0Q
Message-ID: <CANNYZj-eF0R-LZwLwNqRtA9YH=L17p7i3vRbggjLijfQV6356w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 19:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238071

On Tue, 2 Jun 2026 at 21:25, Quan Sun via lists.openembedded.org
<Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> Can you split this piece out and send it separately?  We can merge this n=
ow, whilst the graphic and other issues are fixed and tested.
>
> Thanks,
> Ross
>
> Hello Ross,
>
> Do you mean I add the the standalone python3-qemu-qmp package to the exis=
ting qemu 10.2.0 recipe and have qemu-system-native use it instead of manua=
lly installing from the QEMU source, i.e.,
>
> 1. Add python3-qemu-qmp_0.0.6.bb to meta/recipes-devtools/qemu/
> 2. In qemu-system-native_10.2.0.bb: add python3-qemu-qmp-native to DEPEND=
S and remove the manual install -D ${S}/python/qemu/qmp/* block from do_ins=
tall:append()
>

Yes, basically split the introduction of separate qemu-qmp recipe (and
tweaks to existing qemu recipe to use it) into its own commit, and
then do the qemu version update in a second, separate commit on top of
that. That makes the changes easier to review and merge.

> As Alex just sent out a patch that would unblock the qemu upgrade to 11.0=
.0, which means I don't need to take any actions here?
>
> Regarding the graphics issue, I do find something interesting: maybe the =
upstream qemu commit 52053b7e0a ("ui/sdl2: Implement dpy dmabuf functions")=
 which added the sdl2_set_hint_x11_force_egl() function. This function is s=
upposed to force SDL to use EGL instead of GLX (which would work with llvmp=
ipe), and most probably something could be wrong there. Unfortunately, I'm =
currently busy with other things and not performing further investigations.

Thanks, that upstream change indeed does look promising as a possible
investigation lead. For now you don't need to do anything; if my
changes pass CI and review, then it's resolved that way.

Alex

