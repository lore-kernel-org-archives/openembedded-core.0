Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368DCC7113C
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:52:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.9480.1692359569276004469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dg12XUn+;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ff91f2d7e2so1100119e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692359567; x=1692964367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2pBOM9ZswMF/4YHXUvW0RX271ZIdFEXg4ioQEOc3fg=;
        b=dg12XUn+f32dSUUDaialfortkMTLK0EyPovPThPZ9/awe99VXHgtlECqAalzqhLS/G
         aukxGI9sRhzHMVapXtIbvj1zLHE++Wz1NVl0XlfrAU5+p5AIb1dgYjISkeKT43mI+fPY
         E3yDZ3IDkH0Yw5C7ROw1vb8nETnnXoIPUYe2fxzZz0GQquWo0cYEdjaJ5tXf7wvQWyqE
         1/OADaE+4Qz4qtX0Bc7pXO65I00rdqNJsWL+2POydO0sxZ5ANKG3TiHSa3qr0jbqpggq
         FUVZWKt47eBX9zCeQgQeHNo6YhCmH1QjDHGRVS03maMTznTKYmiqOkvhlMGQQBEy0avl
         m7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692359567; x=1692964367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2pBOM9ZswMF/4YHXUvW0RX271ZIdFEXg4ioQEOc3fg=;
        b=C1XH8QB1YbOyeqy+biEpQD5Rw+6t/kO2Uwe/L/doZ3dkEwDl/w4VpZDP3pzjIU5IEe
         XhpGyv2Zqnx5NHmOFEN95EMh08Qn2RyPT1pqlRnrhcF6sVaozU4Sy6oq4jKXWJktguVj
         XVT42K6VgimVV4ffzNDtpUUkcoO3tmzF26GloAZipFWKlmVVVAX8rRojiG0zw/5RncUn
         BDDxJxRpgj9t36mswJNci9A6L6NtgH3ghgykwi9DbuwF0XDKNAw37L4JbOqyQ6XGgUPc
         jR8gJfTSYa68J8YrWhdbtiVcwT/fHjq/95Ac+cEn6P7tfsjxeAuS/YU3EJIgZPOJMeXe
         1Naw==
X-Gm-Message-State: AOJu0YzdlGHfo/j8BEvcJRFv2shXZDjXx8qELaCFn7Qn0PSLU9niRLct
	2vPBxAwTbtcsNtb1fQJtkWJAi7pZCHWpqP0XHZA=
X-Google-Smtp-Source: AGHT+IFjFeUegLAkS9SdqczLn/b10tMK0J45qGZVpvPTy9lyl2bBaPP2qlVCgRU6cIrJVzb33LNllOIxrurLV9c38Kw=
X-Received: by 2002:a05:6512:38c9:b0:4fb:772a:af13 with SMTP id
 p9-20020a05651238c900b004fb772aaf13mr1328460lft.28.1692359567018; Fri, 18 Aug
 2023 04:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230818114413.3236712-1-Markus.Niebel@ew.tq-group.com>
In-Reply-To: <20230818114413.3236712-1-Markus.Niebel@ew.tq-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Aug 2023 13:52:35 +0200
Message-ID: <CANNYZj8_T6g2Y891K3Qm0s2H5rkhaZV6ewh=m57HRDpT6W3uzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: fix wrong attempt to create file system in
 upartitioned regions
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: openembedded-core@lists.openembedded.org, oss@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186365

Does this mean there is a missing test for wic? Can you add one?

Alex

On Fri, 18 Aug 2023 at 13:44, Markus Niebel
<Markus.Niebel@ew.tq-group.com> wrote:
>
> The kickstart parser defaults fstype to "vfat". This leads to an attempt
> to create an empty file system even for regions configured with "--no-table"
> if used without fstype when no --sourceparams given.
>
> The fix tests for fstype "none" or no_table in Partition prepare method.
> This will omit the file system creation an the potential error for small
> region with --no-table option.
>
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> ---
>  scripts/lib/wic/partition.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index bda4aef1b4..f11c393df5 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -134,7 +134,7 @@ class Partition():
>              self.update_fstab_in_rootfs = True
>
>          if not self.source:
> -            if self.fstype == "none":
> +            if self.fstype == "none" or self.no_table:
>                  return
>              if not self.size and not self.fixed_size:
>                  raise WicError("The %s partition has a size of zero. Please "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186361): https://lists.openembedded.org/g/openembedded-core/message/186361
> Mute This Topic: https://lists.openembedded.org/mt/100818637/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

