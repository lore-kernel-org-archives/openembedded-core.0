Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CA6103E302
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 00:05:58 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4920.1773360354845072770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 17:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NO/o3Z7q;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alistair23@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso2400082a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 17:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773360353; cv=none;
        d=google.com; s=arc-20240605;
        b=axfCy9x76oCqJId49BLOsScXscqfiTY45vUChx+eTwTthrStUuc3CMM3UHVJtFRhAg
         klbcuE/8yZ6D2SQmEQwbecYQMZEavoAP3t3A3VoDEzO/T5BEkiee6kUnUFkHipA4e5jU
         Oop7SsSceXK+IxrAy+rmiYgtLhAkGeaaqjIZt831rgxnwcPT/+xUSw5j+QLfxAww9Kvi
         aSttYMey3Gy7yOcDuBfLlgs8w/nVlwOYDl0PNZpuH9+Ln4QzJ2E7/Ks9xPlPyJIJPGOp
         QZKrnuLrBCUfuiIifz91ICPHUC5JUqK+tHfPSkJOckshXZBoATZWKv4mDgjggDyCfEBp
         WUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/c8mCWmxGz3OgR3pn5W++1iwxlkbmvVo4iEIaGgohE=;
        fh=QpDdLk9QoDyvHiRtJcehFjJzli5JVKLy7CidXnWqcy4=;
        b=LWHRl13beXT62ZWPp6XFDfql8DLlxhnNE/frck2ltfRWtZf/Ggm/dNJ59g9UuFHuaR
         rvcmq9LyTJXbZJV9fXJ7novJiEJVoEm+N1i1QObnRyMd0IRUvmfQcHehHa2gM+rqdkRi
         3XrVVH+5IsSODgKyVLnnf1f5b81cDZltuOdUxWYt0uulpwdpLS3TFZxtc96cZ0XjaeDE
         zEGqGDnO62tD3RgaGReJjcRs8jaTmVNPIVmrZLhuVGmZkGu5meJeS9dDOX152j3EJuaL
         Cn9uosMkGa0VK735kji5lloE3HH1J5HI7BIj/u7c9Som+Fg3Evg7JRh+mnyCCwPT2tYW
         cj9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773360353; x=1773965153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/c8mCWmxGz3OgR3pn5W++1iwxlkbmvVo4iEIaGgohE=;
        b=NO/o3Z7qPU0OpnjGlu7bIPtcRBUUM9mrV2m/Ib9XvJmlZ4w3OJFKEYAovPwKNA4qZP
         DKJ+C377q4ewyjKkKZkye93t1qW9GcslNY7Lo/y+hDDPwZczbgLfhQZtD4rGOknhsG/N
         Yxkncq0VEDAywn8I5KNISoJ1IJKtjeo9iOmNtFKcSRPsBDbl7MPpWxfORtOtJxUfYZeq
         l0YQgd0LPpgB6o4aDPjAygoGGXNuHnKn0dBzXLKc+PTnUhaE5hBMYob4Nhw7xlCMRS1H
         JPlRvLvj+AG8k4nu57CgUOXd8MlEI2Dum2lRunI0AsBn+aJuM/hWsA7e2/Clv3YQCCBh
         S2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360353; x=1773965153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/c8mCWmxGz3OgR3pn5W++1iwxlkbmvVo4iEIaGgohE=;
        b=BbnSAxZpW3+JDzyUQ6I7v4Yi8IeGkP9uykNo2hTVRPW2K7QoyPQ2JNFjZQ+xGBCpS/
         Pd+2JTlC08r0q3+JeYmz9cRswDW6GZa4F2YmuuWTzo/OncfBdQMO5BIkQO7GRc69Dwxj
         4NpcoGwZEO47H2rLUq3lubIwDcdUr+wKws+hXtyQMIDDicfnoVJg4LDxDi5UTXxjZ17t
         Wii7+dEaIj8XcrFVJ9l4ofNmsRfjQyoZG2eFBt4eCjIYQvaAqSFfvpEetw92RPEHTMzY
         HOCZnWqhHrl56Y5qfHSqyo/E/j3oh4N24Aq2dOdZmFEq05cigq7+nDdSSeB7+8oVbALk
         Gddw==
X-Gm-Message-State: AOJu0Yx+4lcJMVZlfju0JzR6UHo4DgjNXG/tG8oSCPpt/RhwWr98i751
	/UM73rG/RAgCX6kTLJ/1hGUz5OhmsOU68OkBJY+wQNNPPwjOeKjrxrHk55r1CCc/mF9BBAG8b4G
	LJYP7bZFVkz8xkZPpo6exI7UpN3vnN00=
X-Gm-Gg: ATEYQzxOfPEqtno2FyM8NKS8/EzDZZEgW/E/4HSQPMoC3pEkkYgttCZke85zO0Pz/Ow
	tcc1GznG3ECL7x181mXMSbbHhW0qUt2zcVWvNcC+c3Nu3e3Q7v2McAKCLEHZ4clvWEOCN/sPAr/
	GgZ8bPLSsiSFiDpPKKKD8UupIpli1UAqyj9tVWEOiJZho3P6ydMe13is398qxMJTKA/q6AuPVVt
	Pf3MSkKlczohtGqXzKUE1OC0sh7CZPqz0rM1qi5cJsD0rTok3RDdKcaUpwGUEx5onu28C53zcAd
	Y61GBQ5PR+Tyb9KXRUILRkGcuoWNu1BOgCdSMg==
X-Received: by 2002:a05:6402:42d5:b0:663:552e:4a82 with SMTP id
 4fb4d7f45d1cf-663ba8ba2e2mr679291a12.14.1773360352810; Thu, 12 Mar 2026
 17:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260305053505.1632077-1-alistair.francis@wdc.com> <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
In-Reply-To: <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2026 10:05:25 +1000
X-Gm-Features: AaiRm53yV22cjpjziE0YLMkTD9ZQ-aTP7Cjww6yszGVOy669N8K6WSUFWqAGFSo
Message-ID: <CAKmqyKP7+qWZfEsg1R8geLVeOoime8w0wAOf5kK2qp12PDZ+bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] machine/qemux86-64: Recommend extra kernel modules
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 00:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233015

On Thu, Mar 12, 2026 at 9:22=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 5 Mar 2026 at 06:35, Alistair Francis via
> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> wrote:
> > When bulding Linux with kernel modules by default they aren't included
> > in the qemux86-64 machine. Let's ensure that they are included by
> > setting the MACHINE_EXTRA_RRECOMMENDS to include " ernel-modules".
> >
> > This is already done for the qemuppc64, qemuloongarch and qemuriscv
> > machines.
> > -MACHINE_EXTRA_RRECOMMENDS =3D "kernel-module-snd-ens1370 kernel-module=
-snd-rawmidi"
> > +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-modules"
> > +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-module-snd-ens1370 kernel-modu=
le-snd-rawmidi"
>
> The consensus in the patch review meeting was that BSPs forcing *all*
> of the kernel modules into images is actually an anti-pattern that
> should be avoided. It should only list specific, known to be useful

This is very confusing to users though.

If I use menuconfig to enable a kernel module

```shell
MACHINE=3Dqemux86-64 bitbake virtual/kernel -c do_menuconfig
```

then I expect that module to be installed, but currently it's not. So
even with a module enabled it's not being installed, which is very
confusing and difficult for people to debug.

Alistair

> items, similar to how linux-firmware or python modules are packaged
> and installed. This has unfortunately gotten into qemuriscv
> definitions, but the correct approach would be to replace that with
> specific module lists, e.g. by replicating autobuilder tests for that
> target:
>
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>
> Alex

