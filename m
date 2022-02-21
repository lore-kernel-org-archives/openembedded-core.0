Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C295C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 15:30:51 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.2.1645457450212179900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RADe+Mep;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id j3so3762763vsi.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PlGqspAjoyGi8zm92w1F7Bp8MQO/ISjNIolWn2jhBw=;
        b=RADe+MepNjjFfXgqXSRDVFzsfGdqtnaY89AUls9psKhI9rkwemARVa4lrbK5btdu6x
         T+JXzU0VmRJjVWTRBtcf3FRZrpfb7DfmhCFJALrCjEkArwiYGXV8sw15Iaqfa8vd2umt
         26Og8KC6kwUf5AK075E2a/HGniq4t1AQV9MoHJYf4QpV9p7FZJBgRSUPNLsbEEXmdPN/
         fpr1G5hNTHuuMcS1ash6zFlZKU7YNQqS0hlcLA3oYONxmMyaVLD4bUWyKc24bDEelSUM
         uWNNtnzfifDUVxAEHF0x4gZyC5VyMZMph06dt2RF05ArwLMThNvIZJr1bPFiwh394nDF
         SnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PlGqspAjoyGi8zm92w1F7Bp8MQO/ISjNIolWn2jhBw=;
        b=0Kwtx/IM39qIAV0J1BCVfKJDZlKxBBz/k79nRuwFyac4kEA5+dmQYdnQCQ2MT/eBEi
         ilH2C48OXnOriNv69VReubPdZJAkwTVxAcfS/Tf3AuqwhT3SbaDw1f0SEWudlRvXZPyA
         O4cs+zcAxy8YcF3S3QmOOi7vNYa3pRxbnkpxujPe0DbJwZoXqn9TijzXgMwN5+q2Y6U/
         ahyRxcell0PLOK37/7LRcouVNgoWbaKxiXNyJOQzGh8+P4Tij8ocWQkHGLiAUiAEAfAw
         jY6r3lNz7Tiy+wzkSd04yrGZMnzRuHMEd5SuRdMD4T7FkTfmcqghoh9ajrStliSOe6tj
         ijmA==
X-Gm-Message-State: AOAM531rZ3vX7zpSZSdLLwkIP+L8xAd3DplPFVWTNelnPnq7Q+VZZni7
	ueID/NOD4QUv9jSa0Ds8sqHAsmMRB8CqpZkLxNo=
X-Google-Smtp-Source: 
 ABdhPJzdQn7FJXTQ2f617btPKrz90dXt1w/bU2UMonds3321eB9Wch0Y6YkjRmVszwPALtlwqofVa7Zi5db2Y0QHrww=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr7988591vsr.73.1645457449339; Mon, 21
 Feb 2022 07:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
In-Reply-To: 
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Feb 2022 16:30:38 +0100
Message-ID: 
 <CANNYZj8EuqEdU9A4397BemMWtiqNmZ1yZmV9hwzT3PS8k4pZjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] meson.bbclass: add support for running
 the meson tests at build time
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 15:30:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162056

On Mon, 21 Feb 2022 at 16:00, Jose Quaresma <quaresma.jose@gmail.com> wrote:
> It works on pulseaudio that has only one test and some others that I don't remember now,
> but the tests run successfully only when there are few.
> I use it extensively with gstreamer and the failures is mainly because of files that are not
> found inside the qemu user mode.
>
> I think that this feature is useful for some other people, it helps me a lot in debug some tests in gstreamer.
> Anyway the feature is disabled by default so for sure it will not introduce any regression on OE-core.

What prevents you from running the tests in the target image with full
system qemu?

Alex

