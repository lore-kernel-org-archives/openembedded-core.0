Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6D7C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 10:35:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.6415.1666175750413272642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 03:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RIE7gnYM;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id p8so1178641lfu.11
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WUsEKiU/LFcXNAi3SRWXIMoLFmK96UwScc/PhiIL9M=;
        b=RIE7gnYMvUXkaX1ngg85sjGN37Ol/fs82dcbjBdL/czc6QCSNtOLskc5NqJEpCdtK5
         aE0GHx/B2x/S+VzcfXJ7h4HJvBP2OV0xsQE1Qm/v/oihCZ66JIfJ/cMHL6aqJZFQCENj
         U6EENc5cgZlRS+Xr7WLm5V30WU318a+gmR7+UMP9dVHi06lvOdioZWmwIRVtmWpykVPs
         Lyis9anVHur2HFDZs37xnXQoWPy7lkb9DbdWxZhCNesiVLBmeXjefqg3k2nzkR+ZWrlk
         yiDtSHD4ougNC9/RpcbOGi2RU687oQg5CqY6y3qhIy5q3r73Rgl6uDQ5Jgw0fuUF3CRq
         0LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WUsEKiU/LFcXNAi3SRWXIMoLFmK96UwScc/PhiIL9M=;
        b=vQXMs7Lg6ZIpgFuBL/JXXyJCjzep7W2AyX12S9f1ht2eJ3UEHN2guGjilipb1pWKUc
         zKLzic9Q8o3GDCyvOC0ax0AWvqabzYdmFApf0XEU0N69FGvZV2Le5Evi2K+oQgFLlanE
         0UeS0LZHJRBF/qKRy4WvXfJejYU070eHEsigTUlVQ0ct/ugugVXRsw2IWh3TzVk5AlQC
         M9PDKhDvqB319fvx9iXweS61L6j5D3H5gCM9Lxn6rQANBVDMPuyvfjj62hnBKVuILRVd
         sHNL7nAjSHkJ9r4Z55gSxaLyq99uW/8WqUITAA7rlEYotAmjMwsvAMmSkW//8vLqO8NV
         KocA==
X-Gm-Message-State: ACrzQf1ywRdbq+F+Ifv4+w/kK6UTDdMijXxgB6/Ed06ynbRJUUXn0q5n
	9XbeUqCROkWz5IrAtQVTGw8NpB5zT5RMOFddYX4=
X-Google-Smtp-Source: AMsMyM7heTXuOcNKTM2zQk+js0EfIVYRyhJAH8uLDZ2nr4Mn/KzDMu476jrlE0BBSgXXjenlzHBgF5zljr6jlEftdGc=
X-Received: by 2002:ac2:5939:0:b0:4a4:5de1:681a with SMTP id
 v25-20020ac25939000000b004a45de1681amr2359075lfi.263.1666175747888; Wed, 19
 Oct 2022 03:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com> <171F65F5948858B5.6129@lists.openembedded.org>
In-Reply-To: <171F65F5948858B5.6129@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Oct 2022 12:35:36 +0200
Message-ID: <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 10:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171964

This also begs the question if mesa-gl is actually used by anyone, and
what warrants its continued inclusion in core as opposed to
product/BSP layers. I'll propose dropping the recipe and merging .inc
into mesa.bb once patches start flowing.

The original commit was:
https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D015cb13

Alex

On Wed, 19 Oct 2022 at 08:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 19 Oct 2022 at 08:34, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Can you show examples where this is needed? Custom variable does not =
seem a good idea. I also worry that it=E2=80=99ll break automated updates (=
it=E2=80=99s bad enough with mesa-gl, this might make it worse).
> >
> > https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mes=
a/mesa_git.bb
>
> "require recipes-graphics/mesa/mesa.inc"
>
> Using recipe includes across layers like this is not a good idea. It
> imposes requirements on core to continue providing the .inc, and not
> doing anything with mesa that can 'break' users of that include.
>
> Please make it self-contained.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171959): https://lists.openembedded.org/g/openembedde=
d-core/message/171959
> Mute This Topic: https://lists.openembedded.org/mt/94420106/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

