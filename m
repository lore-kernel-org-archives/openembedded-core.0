Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B99E7D0A3
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 17:36:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.2036.1695317813614623278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 10:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzgryLhC;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-503012f4e71so2887774e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695317811; x=1695922611; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ypn7+reJkgFNQhJlGciedjg4PwJYwzahtGdwgSUONmU=;
        b=dzgryLhCV/pmvvd02+eqQx6N4wZLudRRibsQuvv7qByVefKRJno/IbwoblH1GSypgg
         uh7HUeIp21mQAdbu/jlo6/sitAiR+EjfneBURB9drIwx5HHT6wDvFuch0UK8YszAi1rd
         JF1siPH7i04KXo3Hnqxkkf8UVd1SNOU5sAv0PPr+J8yujlKLBdDlpEzZLwx/yxYVN+Rd
         vWq2DWXUHLmf00li7JLrcSNKj6NUxfBuBNAM5xfcr4F1+GEguKmlx4gag0EfHZ6JlTvI
         WBpHwNjL92LyvPnkODOGyRL6AVuTa6jZj5EO23oFLZP2nxDeYbemDJy28X121QvLlV66
         7ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317811; x=1695922611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypn7+reJkgFNQhJlGciedjg4PwJYwzahtGdwgSUONmU=;
        b=Pb4eQdkJc7CdOXFoT+TrzV4u+GeH0LVT0rF9/XXFlwM6xLZxRrfB1Me5QhLWqyz5qz
         0CmC+e/T5p9NrxLE91DI1NP8sTLNH5WTrGnLzH2cONB5OgNO4cT5Zgrys3kzHaWBJcrj
         pT64AWDu9BEOkWNHLIkYFF4ZME33BURiCRcx30yX/htEjvAV4/3wxeoLKlnZTkW8Vsyi
         s9F5IFpqMqcEOs4K4GWXLWenyehuSyH15jsEtVnFHpIYy8bRWNf+tNYIjZ1KmslbNsll
         +EeDXk86tOK3HQiXxwGsdPc3e7IrByoht1MmCNyaTqrcg7P7dYSfYxuTBeV3YTEJyJ6A
         BPsA==
X-Gm-Message-State: AOJu0YyRO40yB/7Hqc+WjYC/eTej/TsunWds55fnT7LK96wKsKv/nwp7
	23P4Uq1/In9pCOp8g5CUjhAl408DQ5E8PkYpkoA=
X-Google-Smtp-Source: AGHT+IEh8NSQ9AFt1lN/KyUx9kEHNyLZbCoBH1iHAgngzvJYsIsnk3dK9T8A0QC4wzHlQF+knuZfCGT04of9tjLkBkk=
X-Received: by 2002:ac2:5ecb:0:b0:4fe:b97:e361 with SMTP id
 d11-20020ac25ecb000000b004fe0b97e361mr93626lfq.18.1695317811342; Thu, 21 Sep
 2023 10:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com> <VGUB1S.EQNLFG4U297D@t-online.de>
 <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
 <3SXB1S.VJD0PU0SDSPS1@t-online.de> <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
 <V3DC1S.GMOO9XQMVAE72@t-online.de> <CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
 <EPEC1S.ET9N9UD2HEU43@t-online.de>
In-Reply-To: <EPEC1S.ET9N9UD2HEU43@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 19:36:39 +0200
Message-ID: <CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 17:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188021

On Thu, 21 Sept 2023 at 17:51, Markus Volk <f_l_k@t-online.de> wrote:
> How did you trace it? That doesn't make sense given what the test does, and the task where diverge begins.
>
> but still the test failed. In the next step I excluded inherit allarch and the test succeeded
>
> Looking at allarch.bbclass, this was the most suspicious part to me and first thing I tried was commenting out
> #addhandler allarch_package_arch_handler

I see, thanks. Unfortunately I think you went down the wrong path.

The recipe is meant to be allarch since it doesn't build anything for
the target and only installs pre-built data which is identical on all
targets. This improves sstate reuse for one thing. This worked fine
until this version update, but after the version update the signature
for the newly added task write_config (which I think comes from meson)
differs depending on target. Something creeps in there which varies
between targets, so you need to for example use bitbake-diffsigs to
compare the signatures (the test prints what they are, and
bitbake-diffsigs will tell you what changed).

Alex

