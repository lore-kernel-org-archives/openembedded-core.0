Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C467C54FB3
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 13:11:44 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.12911.1724850696261499577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 06:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kawoDauW;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334c4d6829so9326021e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724850694; x=1725455494; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1pbd3n3D9Sw92VnrF9p1y+ttq0VTHac2pkkZzeEHSo=;
        b=kawoDauWOmS6lgJ/D7pwgpi5sq0/7L0mPFcheST+/SwkpE7jVF+AerOfwzFI7btN7/
         7iaF5WrTRK641kaK9tqZwOC52Tsx0ibIhuZ5Q4T9w/Bql+KLzfxddaAUw39ebMqQKrOX
         cyETQSqypDT5j9lq4XITvUYEdkt1e+GmCCRZDpcK3Ibedy0evSgcOeE9YEzhr7nFkKhg
         bYHJySDjmT5x5OiCjiZ0AT+qacIdB2J39JVTlAXsCSSpxPAtTnWbyj0ftzp09hTSjKSC
         8b8nEKyiYO0zurDDBMKKExtfoIxxbH7/nRGmrJ/o/aMMqHI5nidG9wS1/6j5MTS/BVJa
         tWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724850694; x=1725455494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1pbd3n3D9Sw92VnrF9p1y+ttq0VTHac2pkkZzeEHSo=;
        b=QogW28MID7jf/0LMcLDPD9eFa3BgD597lebOhyGug8TNXZc632qHqqMsTFKp0S3lDy
         gVrbLUD5JsCs/9py7gsVSGmL+tjNGorWnBczkUvGqFhd9t3m6RUgcuXZixR6V83OfneB
         9IRRHIlzJVJo5lB24YjftzDZuAUl0Btpn8+WGe6+TEpxKqsD3MklXa5cTV4IFnop6EU0
         tUkgBnj5FDBcQqQy6kRrhQLEqBvbDooiLRNLznSPVxKYMmNuuC0LZmKbK35YDvj5wfFs
         lmoDPHxQa1KhlileWv0nxzwEui8Y3awqhWr59SPh/tt2SXBp0lJt8crpQ6ProCFmPmUo
         ioIA==
X-Forwarded-Encrypted: i=1; AJvYcCUARmaLnFux6b7VFtgJJNzaH1arLcQ+2Yr28IOksTBLe6V6Pt7aL3deHK2B50DbPveVHqirWA9mkQsshdeiSrRi9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyr61+0kYe5Mdj1ftTPT8fb2JLD4oVkCiD+PyyigbCKaArNrUkL
	k1WGhySq5Pc3FeEb8q/h8WPXqhoD4mUNnHkZwvPWEg7SEUywPVyU8iE/iNhF4XBUaclUkMr21cR
	K1HoCMHySFmEDqH/awhGiWgh/eFU=
X-Google-Smtp-Source: AGHT+IHsLE163cPDHNrHrU5n4MMQUOTO/6a9UhW4Y49z1wtix/6krYdOt1dH6FuCJmb8okpDrg0abHVkGp9kL8WeAHA=
X-Received: by 2002:a05:6512:3d27:b0:533:77d:116f with SMTP id
 2adb3069b0e04-5346c3f6f79mr1438680e87.9.1724850693614; Wed, 28 Aug 2024
 06:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org> <17EFA28FD32C2C48.20373@lists.openembedded.org>
 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com> <CAMKF1sqtFQr1cSfB_Pp8cszWX2LbjoPpi1pQzks_J-SJfx2+aQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqtFQr1cSfB_Pp8cszWX2LbjoPpi1pQzks_J-SJfx2+aQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 15:11:21 +0200
Message-ID: <CANNYZj8ACp7A1iD-9gPg=T_ctMvXcs2eCH1FVnv+jLVyg=E9DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Yash.Shinde@windriver.com, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203882

On Tue, 27 Aug 2024 at 23:02, Khem Raj <raj.khem@gmail.com> wrote:
> OE/Poky compiler is built with --enable-default-pie and that will pass
> -pie option implicitly whenever it is invoked. Perhaps
> default system compiler on alma9 is not.
> zlib crate seems to perhaps ignore the option or maybe its missing a
> place to add -pie to its build options, whereas the
> consumer of it is trying to build PIE executables. If we use
> buildtools compiler then it will surely get that consistent but it
> will also hide the issue at hand.

I got to the bottom of this. zlib crate is using libz.a from its
native sysroot, which is coming from zlib-native build, which was
performed using the alma9 host compiler that does not default to pie.

If zlib recipe is adjusted thusly:
-CFLAGS += "-D_REENTRANT"
+CFLAGS += "-D_REENTRANT -fPIE"

then cargo-native builds fine.

I do wonder if that's just a whack-a-mole fix, the problem may return
elsewhere, and we should actually enable pie flags native-wide, for
consistency of native builds between various distros and our
buildtools? How about enabling the entire set of security flags?

I did a quick check, and there's no consensus among distros. Our
buildtools, and Debian (and I guess Ubuntu?) default to pie.
Fedora/Alma does not.

Alex

