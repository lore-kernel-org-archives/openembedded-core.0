Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F0E68960
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 09:18:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.8357.1730366281968565454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 02:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcGQYCNJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb51f39394so6233631fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730366280; x=1730971080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmNpt4pKJGTyI3ZhRQ6qysBQ1TkbbOEjAcIIlZCZvV0=;
        b=IcGQYCNJP8C0Jmd7EvkIOYyYOh/d46qmZhlZ1kc1bEYwgW8IY2tcFMHT0pPMrGLxqk
         qL4wpKDB38ifY6vxCoAOpkEWzakWISKG84HPMBi1fK6rELYmK21lOAEJEV+SF0loKCxV
         NHPFOHj40KwrrKNMIYj46qI4LSK9+TyoKa2CS7j6Qs2O4gCmHlKTUhjiX0pA6rRe/KNr
         FuZPrRDx7azWYe3mbU3jX4hxQCLR3JhpU+yOJNKZg91rEV6UvcOovgammS847wGwX0Zz
         RvnQG7qOX2ZmmCvg3ZnA0XUvXY9VfmKRYw4kYtGs6rubLgbiJfBGBLfKDIF4nnHYjAke
         c6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366280; x=1730971080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmNpt4pKJGTyI3ZhRQ6qysBQ1TkbbOEjAcIIlZCZvV0=;
        b=fQxdHwLH1cQbC/ON5DW+8kIkhcb3N32hRmHoyXXu8vimj2T5kuReJd1JPq4QUMvBgp
         SgZC437fMEyBPnYy7aQShSJoNzm5FkheZPSzqCPTUAwFncaa0OQaH3PC2PhhV9A+QTIV
         /82CHZO3gKY8GW/5reiikVfyTDn7YeFKoH9ojVRjuNP6cYgv1B9/DD4RVlw3OwlRSUs/
         c17lst1YDmFFbPpCYbdQKRI3Lr1A+Tio+R0P9KWh+SH3OLI3xv4bCN95kqQhjkmUpCFc
         N1QfcL4KE+SisBa1HcEW9JzoI6ecRqluiH9LCAaWd4/9Dg82qKBoNSBty7aSSdLJWNlz
         JiyA==
X-Forwarded-Encrypted: i=1; AJvYcCWYoHph5iefINn3L9oKnRT5+TCqvBuszXN941/a2peQnnMIo7IWrNc8eNd9BpL55yhDBGfe/l0gWE3Ex3MsGiFkTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3942Ws3RBv6WccjIuCQhp4nyPyKF9cOprSoDmPBBISHWE7Dit
	7bhKR9LTP0SOuYLp+iIhaBUu9pFDTxGh4U9Kws89PAP67W4h/nuAikDwwYnWRdNWga1mGfWZD5c
	YLxeXimeyfDnFEIC+SP/Y6RnqzL0=
X-Google-Smtp-Source: AGHT+IHwLA6co7J2yl/d8CPSHMWwER8MGam9JZsgloBZxamqQELI0NkI6Ppdgad9eizFOFFtZfU8aQ2j2gVpWKfbXfM=
X-Received: by 2002:a05:6512:318c:b0:53b:1f14:e11a with SMTP id
 2adb3069b0e04-53b348d0d32mr9343130e87.15.1730366279465; Thu, 31 Oct 2024
 02:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
In-Reply-To: <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Oct 2024 10:17:48 +0100
Message-ID: <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: vince_chang@aspeedtech.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 09:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206572

On Thu, 31 Oct 2024 at 03:46, Khem Raj <raj.khem@gmail.com> wrote:
> >   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/wic.py", line 877, in test_wic_sector_size
> >     res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p 2>/dev/null" % (wic_sector_size, images[0]))
> >   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 212, in runCmd
> >     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> > AssertionError: Command 'export PARTED_SECTOR_SIZE=4096; parted -m /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3537958/wic-tmp/tmpr6vrw11i-202410301331-sda.direct unit b p 2>/dev/null' returned non-zero exit status 127:
> >
>
> perhaps make it
> PARTED_SECTOR_SIZE=%d parted -s %s mklabel %s" % (self.sector_size,
> device, ptable_format), self.native_sysroot)

I tried this (dropping 2>/dev/null), and indeed the error is no longer obscured:

AssertionError: Command 'export PARTED_SECTOR_SIZE=4096; parted -m
/home/akanavin/poky/build-st/wic-tmp/tmprac0npku-202410311007-sda.direct
unit b p' returned non-zero exit status 127:
/bin/sh: 1: parted: not found

So basically the test forgets to adjust the PATH to include wic-tools,
like others wic tests (that need to run parted) do. Some build hosts
have it, others don't, so the error is intermittent.

Also if you can (in a separate commit) drop all usage of this
"2>/dev/null" pattern in wic tests that only harms fail diagnostics,
that would be helpful.

Alex

