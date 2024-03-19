Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF75CC54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 18:48:01 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.24228.1710874072238082258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 11:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSqVD7+S;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so78678461fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710874070; x=1711478870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PtRubaLoQDs2I2QNf9mdq41embvecUTFIkyymbGLee0=;
        b=CSqVD7+SsKqWHBOfrcbrglM3TK7UgnofxHp9vMBT2B6HaKvre7ZqfFowL3oyUwAmLw
         6O4SLgL4PB8IO8eQuxhkkVbn4+923lGvuSWJThpG0NMk9cZreVLAow9QUbZqM3W2PqkV
         QEAJ1b/YDKbQmqbcREkgJCbxxRWqsuHWkbDxeCfrckN0+v864leGv6NyiUKhp8HxGglU
         63ESC0fvGbT7EBhx1SFbuIimCxuDEnsANNeMA32kEiL8EO6N73gqB0p8gyT3d8S837P9
         w+zjIQV/2QCpGiCMQe5/9Z/vyUDJzjDYQvwjXhwqJmYDvTKoREsQx/CqMDz1nj0BrgeF
         TlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710874070; x=1711478870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtRubaLoQDs2I2QNf9mdq41embvecUTFIkyymbGLee0=;
        b=nrCklWjKb1zmvALPMOup0Aqb2gjgbCIEhFlmOCuKelDe5BPi/STUPif6TSSdO9pr/X
         HI2qmpr8NEdmlW1FubYkb4mXUYFokfrSEKfXFe9Qj5dWymbBNcOf9MDc/YxtuOW/QPhR
         wDvs0RD32YvLDXr9ETzFHSpvys2dGoj2vm0akE/raQA/8DTCw3xsCKm7iZPntjdy1CyB
         rO+pQlRmQ8IvPNW0hJlV9U/j/u1W27BZ3Wm5fPkihqKCnnq2aPLnJla11mj6jap/ihoV
         0uc7cXqV1I7he54rOoINuhOnndafRjM6TBEWPyqNieCcQG2vKcj1cJva5k0YRYwwWoWh
         eNiA==
X-Gm-Message-State: AOJu0YxCT38t4SkPxcb5KEMSZgRCesxv6d0sLrqb+v2DnqKyBdbX2N1d
	6jlh/2jBnLUrcl7DyPYaPn+9aDT3Ld7TXViurFyXiz5L2x44rphwYwEt3KAGNRkwUIrGGhstHzf
	vUt8aHMzNrsD5PbZvBhntq420N6DUEr89
X-Google-Smtp-Source: AGHT+IGRvqiIYVhjhbZbTT4w5MJKhawvxK9TZrG+p34WA9GCZrD4xoV0ViQFxYuN5nUbtlHek2ibi7VSB0y2pyqq7QM=
X-Received: by 2002:a2e:6e10:0:b0:2d2:ef14:593e with SMTP id
 j16-20020a2e6e10000000b002d2ef14593emr2689335ljc.48.1710874070032; Tue, 19
 Mar 2024 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
 <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
 <AM0PR01MB6514572B842524D5F2C7DE73862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
 <CANNYZj_MC05-jd5=3jB5DUxzx=XkupN05mbZ6P1PE43LJf44+A@mail.gmail.com> <AM0PR01MB65148EFD114484DC62231CFF862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM0PR01MB65148EFD114484DC62231CFF862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Mar 2024 19:47:39 +0100
Message-ID: <CANNYZj9FG56RtakhzZShAnbr+OvN7bXS4fZ0939NuoN0n+9qow@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace
 "pulseaudio-" with "${PN}-"
To: Daniel Ottiger <daniel.ottiger@schindler.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 18:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197330

On Tue, 19 Mar 2024 at 18:11, Daniel Ottiger
<daniel.ottiger@schindler.com> wrote:
>
> Sure I try as good as I can:
>
> pulseaudio is part of my DISTRO_FEATURES, therefore "libao" depends on pulseaudio.
>
> As far as I understand that is because in
> meta-openembedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
> I find this lines:
>
> PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
> PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>
> In addition vorbis-tools depends on libao, because in
> meta-openembedded/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
> I find this lines:
>
> PACKAGECONFIG ??= "flac ogg123"
> PACKAGECONFIG[flac] = ",--without-flac,flac,libflac"
> PACKAGECONFIG[speex] = ",--without-speex,speex,speex"
> PACKAGECONFIG[ogg123] = "--enable-ogg123,--disable-ogg123,libao curl"
>
> Therefore if I would like to build
> vorbis-tools-native it requires libao-native which then requires pulseaudio-native, at least in my case.
>
> Since I do not know those projects (vorbis-tools, libao) well enough, I cannot tell if this dependencies are really required or not.
> Of course I would be happy if I can work without pulseaudio for this.
> One solution might be to remove it from my DISTRO_FEATURES, but I cannot see how I can do this when I need it on my target.

Right, this is more clear now. vorbis-tools contains ogg123, a player
application, that uses pulseaudio through libao. So you can disable
ogg123 by setting PACKAGECONFIG to "" in a bbappend to vorbis-tools,
and the pulseaudio-native dependency will disappear. That will also
speed up your builds.

The initial patch is perhaps correct as well, but you don't need
pulseaudio-native anyway.

Alex

