Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D17EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 15:54:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.2063.1687535640157644560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XeaAmakN;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f86e1bdce5so1073212e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687535638; x=1690127638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yo6T+zdzao2C+R8RWsIJf+QLbOVpmOjM+xr/JHQU+O0=;
        b=XeaAmakNy20VhT/beqlTtASsRRE3rA5IoNIf3vgsw0OvzSYgL3z+uzDv1ofXCQioaK
         64caELvlk1Hm1gOxIb3mYTYRifdr6JfLlhhxuz29S9aZjeDQ7DF+CSUGU4OLbU87ZP78
         dqjvLcIThCJ/zkuV7SZBBtTHY/JSJM+Z5s9L7k8lDCPgLnsTPCWTSWVu50QDQ601lEz7
         Ok9gMrosSalqkKG1t8rBUjwnTls1WF6lAq0lt3Vn+r4EntquDjOJGazDV/lU/+ErOR0u
         TBx3mrODbDpUrGhTUWfTD6/S7ZdzIQ0eGWwemtO6g5/wf5v+f91fPQvBVVquisgCd7NQ
         vo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687535638; x=1690127638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yo6T+zdzao2C+R8RWsIJf+QLbOVpmOjM+xr/JHQU+O0=;
        b=ZLp7HyRwBmktEx5HWBz0jTZ5u6BuiUqn9AtcInHgA/VzRcmMZ1YCS3RJHJPX8uSjJQ
         MIE5IODMGGUEIfAcGq2M1723DxwS6X0HvWUzrZO7ktWuPAt7b+b7xT4pL/yHbvBWGQmw
         8bkjIl1SLLO1mQmyutaO2k2WoYx+1Ly+hLaxg3ojHWmhyFGrPiYAbfjdtkB1gWQqc6B0
         +aOTpUvPsRLTAOBDXoDKTq3TwtGzYmWuVpyU5PCtc6ewbg7ROHZTqYQV5BdxjPUNr6Jm
         KxYAHpZVJAnx3A7ngKxKzy6oz4arD/OYumGnQdKC4yiKoNjZ7axb7qVEaR8hfLDGEI0Z
         UC5Q==
X-Gm-Message-State: AC+VfDyvblAaO7mV/uocg7UNnrzMIJ4/EwlIOnhjhnJVRyQtFMlWfyG5
	jorJgkAzO+qRKR/DQole4U3XAYy5ds8aduoSoFE=
X-Google-Smtp-Source: ACHHUZ7HSGOOCOJl7+qMoM9wsYVrHqsx4hpY2SwIsnsVc5jKR4nHcDrlG5HywlmiApOrMp6o74Dtb7oAbGaiW/7W8UQ=
X-Received: by 2002:a19:6d02:0:b0:4f4:d2ed:410 with SMTP id
 i2-20020a196d02000000b004f4d2ed0410mr13051522lfc.41.1687535638121; Fri, 23
 Jun 2023 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com>
 <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com> <4821006.GXAFRqVoOG@n95hx1g2>
In-Reply-To: <4821006.GXAFRqVoOG@n95hx1g2>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jun 2023 17:53:46 +0200
Message-ID: <CANNYZj-r8obYydCCNEysqP5d8T-8Hu_KViQJLTQR_pv-RfXMAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: Christian Eggers <ceggers@arri.de>
Cc: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183335

On Fri, 23 Jun 2023 at 17:42, Christian Eggers <ceggers@arri.de> wrote:
> In my project I have added BBCLASSEXTEND="nativesdk" to many bbappends in order to have most
> libraries I use on my target also for nativesdk (I can compile my embedded application also
> for nativesdk then). As debugging performance using gdbserver is quite poor on my system,
> developing my application with nativesdk is a welcome alternative (that's  why I also have
> enabled debug information nativesdk).
>
> But from some previous comments on the OE list it seems that nativesdk is not really intended
> for this purpose. But what is the alternative? Having two SDKs?

The intended way to debug an app is to actually run it in a target
environment or in qemu system emulation. Yes this is more tricky to
set up, but allowing native or nativesdk builds of the target stack
for the sake of debugging is a can of worms I would not want to open.

Alex

