Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF88C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 12:57:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.4547.1714654664038805674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 05:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MKF2Iu6Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e1ff3093f2so6303651fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714654662; x=1715259462; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sELVkJhhHxrtTsicBgo7inFp0Vr9O4G53m6iKclmfXI=;
        b=MKF2Iu6ZA9lvswE0G4PPnhXvV8Ba9wy5E2DGoOBrvrRsluOTjbVlivrt+q+yO8DrK7
         BN4wQJJLUgYitslcsCJSAGGysnPtvybQfumk8CgJVDYGhA4TIrMvI6KpT+x0TBugvoKN
         ecyMLTKOosQD6017MH5p/ma59V0WrbO/u1QEuiPAwjJ7ZFeLJHAd8ETLAwimkMizu3Gw
         apfos470UDp5qBybzF5mUk3AwPf0OmyMSszu30YHRposnQQENE9QiOAMmmrBNFZ9c6Bi
         7cNrlkyPH76rJfZTVYA64k4KfSJ7VgOAqjWucw2oalmMCTvIbEJcaZGXYqLq6VuPy5zs
         axDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714654662; x=1715259462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sELVkJhhHxrtTsicBgo7inFp0Vr9O4G53m6iKclmfXI=;
        b=Be+/EVU5YSHKrLleRFFdkHf01MKintU7fOBoyp19adNzq7CeWRLWYedx+u7rnr34sz
         vOezO6ZnKqvw0OD5RZirLsYmSKLCiiH1Nlhol/gW2fzu41zYmPtCbfqNFMrY4GhTwaCl
         TAGRDGl9CJhBNTN1J0GmPayT16dcEgOsywEPC9QeTE93PNXy6vPz7OEetCDm1x1kdaqn
         5kA5PtgRlawlxZOkdI9H2sRboVdOOKsN19aze4WzQoTy+0lU600Qf0tTU5qrVGCIG/RY
         I2k9CiNm22yu4hOe47o901xiOe81WRiH6lVwBAtJuPbaIjwS0BjFQRTYUNyIUDe6PZuk
         E5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL9GpVyGnLFrC6Xv9RdRzCBRMQWqDThkB3hRKe0CG0XahsO23crm1ZjzIV2ThK7Tctj+qI9N0S1AzO+tQsb+PZcBnu4vuDObRBQCBa7EN7z5+hJK+FdPJN
X-Gm-Message-State: AOJu0YylZkGNBryHKUsLtT9WpFXPobwWA51IUCJ9PWw3qyen9FS4j1bP
	hsCP0c+kpbJj1EoUef7b1OW9yqseaNAvw3e3uUXewM+BOpppdqVYA1ysrh9eh3mR361F6qd5tpC
	rHAodF2dOxcRnNafvZBm6VS7XLu4=
X-Google-Smtp-Source: AGHT+IG5VAw3fRj1sHzO5nGIJ8Lt/9575AhTYW5ihX3rlm9rNdW9eW3wdge5CNgbhdzx7dDyPs3hDanphdR1apSorIM=
X-Received: by 2002:a05:651c:149:b0:2df:5116:928b with SMTP id
 c9-20020a05651c014900b002df5116928bmr3211634ljd.25.1714654661989; Thu, 02 May
 2024 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com> <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net> <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 14:57:30 +0200
Message-ID: <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 12:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198917

On Thu, 2 May 2024 at 14:52, Patrick Williams <patrick@stwcx.xyz> wrote:

> I'm not convinced this is true.  As I wrote, the final result of
> PACKAGECONFIG is exactly what I expect; it includes `python` for the
> btrfs-tools-native and doesn't for the plain btrfs-tools:
>
> ```
> # pre-expansion value:
> #   "     programs     convert     python     crypto-builtin "
> PACKAGECONFIG="     programs     convert     python     crypto-builtin "
> ```

Run experiments with plain poky and changes in local.conf, and that
will convince you.

> I've also tried switching to this, which is very clearly a "target"
> qualifier and have the same exact results; it applies on "native"
> `inherit_defer` evaluations:
>
> btrfs-tools_%.bbappend with...
> ```
> PACKAGECONFIG:remove:class-target = "python"
> ```

class-target:remove, not the other way around.

Alex

