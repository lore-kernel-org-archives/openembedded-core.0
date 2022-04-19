Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD38C35296
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1827.1650387047713525315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 09:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=YgFjm4fN;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id w4so23246639wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tl4d0/+O7hdqs/LLzxvEkS21F8CXn6EjlBe787KVDJw=;
        b=YgFjm4fNioCuGcIawClxCofHdUcDG3w+WWCrNnKGBdfwRIj96Ue22fmI1xFb4m0FDX
         cihUXRoM+nZGBwwf3wPEG22nrDi6RK1JYjsXk7W2s3zxXMDkgPr4ATMqy0+KoCnTrM8s
         jWIZKX/1ABqeGPD566sDHBDN+IKKcUprBxLszsvEFims4K0xTPuBCXHTxOXLEacoQZ5T
         rKjQSlcj2BeILwBrLveroq7M4GBdxNQjYOoXOOu1PvdTU6hLqmbQxVS9W/YWDzCpmLdk
         JMjKNdI/bFRDjK2uo97knhdA2Ft/FGPQY+t25n11cZY/1dciLW6UNFR1xPEeCgOhKd55
         jsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tl4d0/+O7hdqs/LLzxvEkS21F8CXn6EjlBe787KVDJw=;
        b=sIpFKXLMRHFx1vfZIX84Q3wjXf/57v6v86FlhGh633BA24GKeWoMGO39hZv2iLAL7W
         S56HWqO6Fw/VtOrcusBDhNzjs7bvLYjSUhmizAXR9adBfN/0sMCNfk8ZNvbiT+XGvHUi
         s/Z0Yv6nxMvpfSzTYF5VlqQnWlLjUMmE0Z3cW9uuPaKLLy7yDueL8csZsBIB/DuTmzk3
         ZTDzCKhA4kS2kL+CH9Bt213dkxMDtsnZc7CMaZObCNaWWPVl2zrGCWfH54e4T0SOzLZt
         l2nlQwF61ENJY5sedDnkL2UZOiv6LHfsFtRIShi5VfJWJgZ1b82+prMatXeHh2S8tG2X
         besw==
X-Gm-Message-State: AOAM533kIF2AbvrXIg7c8H43BTvgV04+QqTCLH1UGaWQffjYuFiXhLCi
	Mxlqm1Vg40Beht5H4Hxb6c+Zr4RS+UVyXr1Kg2R8Jg==
X-Google-Smtp-Source: 
 ABdhPJzAvF4SGnuuKy2iKxVqAPNhnIpxOxuyBTgcvEhzAKGBao9sQpgb6Qoxd3qXErDOPsRrFHsW5cleWFB5FL9o0iM=
X-Received: by 2002:a5d:59a2:0:b0:20a:a6e2:cf5c with SMTP id
 p2-20020a5d59a2000000b0020aa6e2cf5cmr3127190wrr.451.1650387046130; Tue, 19
 Apr 2022 09:50:46 -0700 (PDT)
MIME-Version: 1.0
References: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
In-Reply-To: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 19 Apr 2022 17:50:35 +0100
Message-ID: 
 <CAAnfSTtF8M6SowDmW-tv+D44vNWNrapOb6PGa1GedbZxKf2zNQ@mail.gmail.com>
Subject: Re: [OE-core] Intermittent failure issue summary
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164636

On Sat, 16 Apr 2022 at 11:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> x86 boot log serio/CD drive timeout in qemu:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14743
> We've talked about disabling some of the peripherals we don't need/care about
> such as psmouse and the CD drive. Anyone fancy digging into this with upstream
> qemu? I suspect there are other people who'd like this too.

Patches sent for the keyboard/mouse part.  The CD drive is trickier...

Ross

