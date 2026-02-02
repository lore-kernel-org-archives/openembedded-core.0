Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493D9E7DEFC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:58:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56330.1770047899453006807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SK4SHWXc;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6a50c17fdso487735585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 07:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770047898; cv=none;
        d=google.com; s=arc-20240605;
        b=Hj/QrBLcfSHK5qFRw5sOiDkWdzslT2yi1WiXIIEIr5rUc/D6eGcBu9Gj1kzxVpANFD
         X/Wd1vlRptsM48dRIrp9f0wbr67vGK0u3s7v4FM5kWYhll2XuE3l9+g+bAEUKaIxMWos
         zzIkIdnVkhjHXRjPSHa7Le8MFKG61JYtTRleVxMzB2uky0fGrrdyoc9/2YYNhoHA1mmf
         5ucnsh0CrAAlBqLpEWhYaPVYw9V/GuaW1chwpAnUIky+KuyYXixRQJtjvo7bKNYbPN2T
         xdHfBX/rINphiDs3LrGWiYoCp4yDCZrZPygFAE1wnY//uJ0xenzU8j0FgEjpdQyDepxj
         +h2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jqpgqApFZrmG8loh+B2GLQ4egbwfUOh+pg5QuFQ243E=;
        fh=5d/x43IPv3dchei7/ZEIxHUqqMHlSFQXzUJUuGToiyw=;
        b=fhp93UZQ01Wt+DI8ocGFoBevu46bGvPPho7tpT7ZhK+ybly88MyL14SyKkfdQszkGz
         CRSmWufbgCFINTbwIr6i2nZ0K26RcmJEZ2g4rkceAZoveOxKsjioQh5sFrYsimkeubPF
         dMSkGV0kHjynMv96ZIAaCpOjIy4+wa+OBF7IpqRDGSKJ5mZ+9Aagenj92LCUb/qnqjFe
         lybsRFm+61lXliMDxIVRaBdJQ6IM/Le2gUnDEd8UNy9OTukR5T5mf4DqqqmtL+oTT9Kg
         1EAIxtzcBIbLP0DFegVnu+htWk0eAt8vCegt7e/XvdPdSYJLJNsPKIb6o6m0TqbS+gao
         I4tw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770047898; x=1770652698; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jqpgqApFZrmG8loh+B2GLQ4egbwfUOh+pg5QuFQ243E=;
        b=SK4SHWXcNDxJZiBHSQRyCQyXqQKddr3CAOtFjOvazbh7LkTKzGlmie3u5noArz4W5q
         WlpgmbT//trOeeqAJ7zky3rKDPmG7X5Fd7j08ML6FdzoIIhc4C6Vw3g8MJxJCYE5z4GN
         kJT4Yg/5b5+69ji60Z7S12JhP8K1Vz+HpcwZ32ccJ3rAfBoXOMQpQbtNf2PsKT4Ayhbp
         rqxh090mM4/u9Xp8tRqHQzhNG0+5DUd/0/tAmClmFCcHpPoJjmlUYljL7qIQu1AFSnKu
         O2iweNGXG1SG4jPv3/O390wcN8tecUGi9nNsZFFu9gI9DAi7MrFjreD3Rso0ElHhA4rJ
         HyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047898; x=1770652698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqpgqApFZrmG8loh+B2GLQ4egbwfUOh+pg5QuFQ243E=;
        b=DXJPoAt4YkCSXmkRnIvQmg3tHfTggVJ/PT4PWbt9B2PSBkbPajjzXoBwzGkhWBkAEW
         CTXfVJAkX7gwCjHWc9ieLkkWZAIGPD5ocZ5Cf9iq1BOV7DKRv6Fv6A2I+byiOTOCOIvP
         wkFLbJHDdbUZQ2iiSblB+Ys6+0NKLJINp7dng+8WeLRL76gxevRuk7TChKh8xZe+ABOD
         8d+JJrsBq9eFE8PiajRWyWMiFxlniWntH6d7a2FJSsFC4ZGAmVXiEQtEITY9vI1zWT3e
         LMDyGHgDDso5y0gXvaHwBqEaVhJD4Wq2eE77HV+EfoFk8wbxQYdyO8MjNSkZWEKYJzCY
         fZLQ==
X-Gm-Message-State: AOJu0Yx194nu2O6BSttsoahDSEy72W5Q6Nv2RBYtcYTIpP40stOYA9Xo
	MtKASp7s5ohbiYznkQzLp3YWHD1n/suRNlcqlucpKom07N0wpBm84h1IbWyNIpX97UDZnXoyX5W
	UlB22Mj3menIEZJBvGxsvNerIgdX4FGk=
X-Gm-Gg: AZuq6aJlmqIRB22eD1UY4i0xwuBobvEDKb7HQYyw66m4m4D6T86lzs70Dwl+njH1mRt
	nHBRlBaxphZ0brj3lU1VeZmgr5/biy+aFZLYR+6DbtJdKCCdst77oLXg4n4tJbT//s0wnLm1IdW
	quQW9oIk6jG3IYRvKRcRPNrsdaGGXha9qxYl5TXGNPzBJsJQH21hQgF/DOTWQEDlb1gvNRvvg8g
	FBfVizMNu8JM0e2n3jRDEz1J2iG1mC2ZOVYmvBdu+0yYbtRq59/9qCE+EnF00kDd346DKgj+UhO
	OJAb0sww4ALo7t0w9ILO8NPwimUXZA==
X-Received: by 2002:ad4:594c:0:b0:894:6cb6:b270 with SMTP id
 6a1803df08f44-894ea0b58c2mr179023096d6.45.1770047898396; Mon, 02 Feb 2026
 07:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20260131211111.1189479-1-charles.embedded@gmail.com>
In-Reply-To: <20260131211111.1189479-1-charles.embedded@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Feb 2026 16:58:07 +0100
X-Gm-Features: AZwV_QgU7HPw1ahK3ztPcb2lRNa_QIGGH2ZfVXsjfuw_IRDchtuIdBT30qlnsiw
Message-ID: <CANNYZj82ZMXiNpFC4tihxgmcLJEJ143Jui+1KAaAXokrj-uYXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: parse QB_GRAPHICS for nographic flag
To: charles.embedded@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, Charles Dias <charlesdias.cd@outlook.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230378

On Sat, 31 Jan 2026 at 22:12, charles.embedded via
lists.openembedded.org
<charles.embedded=gmail.com@lists.openembedded.org> wrote:
> The setup_vga() function was ignoring -nographic in QB_GRAPHICS
> because it only checked the command-line self.nographic flag.
> This caused QB_GRAPHICS to be appended after display autodetection,
> resulting in conflicting options like "-device virtio-vga -display sdl"
> and "-nographic" in the same command.
>
> Add a check after reading qemuboot.conf to detect -nographic in
> QB_GRAPHICS and set self.nographic accordingly. This prevents
> unnecessary display autodetection for BSPs that specify -nographic
> in their machine configuration, as happens in meta-zephyr layer.

I'm not sure specifying -nographic in a BSP layer via QB_GRAPHICS is
correct. QB_GRAPHICS is intended for what emulated hardware should be
present in the guest machine.

-nographic is a host option that tells qemu what to do with the
graphical output (in case of -nographic, discard it). I don't think
it's up to the BSP layer to make that decision.

Alex

