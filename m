Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95625C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 11:04:21 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.50537.1724670258284674619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 04:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrGZd2CK;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53346132348so4832483e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724670256; x=1725275056; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TKTlL5N/F7UasSVyX4PvkSUj7wivYkl9LKAYxk/sT+g=;
        b=JrGZd2CKRpBgXIV0xRlT2q9BLzd+M/s6nWxqr7Rh732cmajE4dUBe7NwmdFWeC/TSc
         l+gSTqpHh98n5D0coOoRVyD2DMPwvPEZ8v+DOgVUPjWuIYR3OI3I9DdTKEtdRBIYVHHs
         ty+pVIVm3shU8LBCYkTQ7LWZnxiPGwYEB66NnBPNpDK+SNbGNkXWNNBp8g0dqfMkMC62
         x7i0MG+dGoYdHrnQ4OxnBw/GwpW79qcCV3C71UQGhikrLQvcg026oHjP5znwQ87hvAHX
         K58CxNgL+JoEhS9h0iXpJANiyjacva226TrffowliQqWnpejjtEtv+49xdYKEXfVXikt
         OLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724670256; x=1725275056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKTlL5N/F7UasSVyX4PvkSUj7wivYkl9LKAYxk/sT+g=;
        b=Kwn6U+hXhbugNLaqo3X/FK2E64mcO0ANDlVPlnImgqWjxXDuQ75l/CInX8wZxWtFX3
         V09oo89Yj2sc7U5H76NSEqZb1cXthRRJT332n7xCDRdxc+ATBcllQ5naRikvGs/6e6bc
         Uq6Vz5sy8jGlN8SiecARS6nym14f9F39kTGF+RDTeJChysA4GhPpFi/ytlyf+lrR7ooF
         zExTTF4LBWu5AKT98hvU4uLndD+bQtxrDu7G9fk8KKKwg7EN5Hv6RsXsVGGQs7X9Dsfg
         OqPWNePVHpKMsNn5vdsk7craGoF/OxFg/xext8SD9eu3ul1jLSnxaGF+siIhgae+jTH0
         708g==
X-Forwarded-Encrypted: i=1; AJvYcCVIkzlrAmVBFi2gEoWNnB5meshSpnmharq+xaiNMfqzl6ANJN/RhfHwOuJjChpMQ9H1TkMQWScwRw9djwEWarRltA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHQdMc2EnIIRf4263YyHtUFqYDxWrAzPB45Kbc9I20eG0C258V
	D2OBvdMmgj0Xoy+utaKPCtFGsJbo1BFLXCLxD23Gd19HY4wYj53SDCCsT0zZRLSxFOlqz0NmgU0
	nLvL0gbnRVUtrVzU33M37CPUcGo8=
X-Google-Smtp-Source: AGHT+IE6EfJnBnJ7/aNy+AvF1NpAaHzmgOzp4sfrcK0cyVSJKSV5Brsv60Kltg8oJqRtOMv0/iZG8l5U5RlNQX7uH1g=
X-Received: by 2002:a05:6512:33ce:b0:52e:8b15:7c55 with SMTP id
 2adb3069b0e04-534387853e7mr6446179e87.27.1724670255676; Mon, 26 Aug 2024
 04:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240826085148.3492132-1-changqing.li@windriver.com> <638fcf654276d1ccbf67a8d8881404a78f3b7cb6.camel@linuxfoundation.org>
In-Reply-To: <638fcf654276d1ccbf67a8d8881404a78f3b7cb6.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2024 13:04:04 +0200
Message-ID: <CANNYZj-wzkPSccXYOKm9=Lf00JffvEx8qOU00tzHLWia=5oGEg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] webkitgtk: fix do_configure error on beaglebone-yocto
To: richard.purdie@linuxfoundation.org
Cc: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 11:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203749

On Mon, 26 Aug 2024 at 12:57, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> >  meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 12 ------------
> >  1 file changed, 12 deletions(-)
>
> Why aren't we seeing that error on the autobuilder?

I guess webkit isn't a part of the standard arch-qemu targets (e.g.
sato images)?

Alex

