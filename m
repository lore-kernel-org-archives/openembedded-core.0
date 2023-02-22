Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070DBC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 17:56:51 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.91.1677088608237209453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 09:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kgNbdaMe;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id i202so3638806ioa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 09:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tTC/FiM+9iwAKQ+ZVPnd6xDKsUOx6SR3iJGPxH8rP4E=;
        b=kgNbdaMeJLF39XH/A/+/m1GgpIXxziX9LKiIl08wCSGYpXLAJKo6QtUr4JGBteJ7/o
         m/mbZvN+w58kD7+MYpwyikrViIs/NYSjSSK/nSC2mlV2R8RKOYe+M2lP1HmtT3kWbog4
         1JPPvDmlMapp8tQGi1DdlJ0tOjfbdCzRFoD0+dSj1boaboBXn5MdAb0UlDDenkKPVwmz
         6LG8qZXGlf3uPdbT9N7nMlTh8Gm6N1EIgbioT2gY4sGN4KqLKOJStJS/4RPing3uwX75
         Su6XNQpE/UX6tLtv/Q2Jc7MEZHgDAsut3aEwt+8Yng6P7l8ywlJeOhZwf9Y6r4kGlDFX
         wycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTC/FiM+9iwAKQ+ZVPnd6xDKsUOx6SR3iJGPxH8rP4E=;
        b=dyTgdTGwG9rcgBIGIs2ZTIqJSxUDPhk2nRfGp7DDRskgCj+2MKzYBrLYu289azSgES
         0TOEps4sQIWRu+UiQsQMmk2FKBkLtN6TeB6uXR1WeFC1KyKeWx/PyytOjLIsB5DsWcBs
         EuAKzG1+6xwr6mBh//J3V6otjfdB01B4yJ2TFhZ17G92FNl9H4UD65YvxVjFNNvMgUYl
         jibPQaBZCIFu0q9ZMLIGx5btFdXwk2QKJIvkiq2+JXcDQPPE0kyPgvJ3bgx+TDuRTCNi
         86Wu1RfDqKhoUcxmICPp39G4WbCz8icmn5G/Ve31HfuSBDPoyIQEG7vnaYHNd7NKX7e3
         qnpA==
X-Gm-Message-State: AO0yUKVdsZeOTctBxjxWcHpXGABknGRm1rxhkpoF9CkaGI+qQ9xjQ6Pt
	O6fPfQvsL8noehj8QYnR/6R/lLYPX7HbYygMnsw6Bphl2pA=
X-Google-Smtp-Source: AK7set/r4vtRFmsCVkWLS5usPdDre2HBFfNOUaXthRwzUP6AflFkPSszGpTwm5cNpLTr1JYDblrCsbNhj6huT66os50=
X-Received: by 2002:a6b:d10e:0:b0:733:db49:e6d5 with SMTP id
 l14-20020a6bd10e000000b00733db49e6d5mr242485iob.2.1677088607187; Wed, 22 Feb
 2023 09:56:47 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 22 Feb 2023 17:56:35 +0000
Message-ID: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
Subject: sstate cache management
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 17:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177579

I needed to do something about our shared sstate store and waded into
the sstate cache management problem as the existing script takes hours
to run over NFS (which for better or worse is where ours is). I've set
myself the problem of replacing the existing script with something
more extensible, understandable and performant.

I've got something which I believed was roughly right, but I'm ending
up with questions I can't answer when comparing the two outputs...

If I run the existing shell script against a tiny sstate-cache (on my
laptop) I get 420 duplicate files eligible for removal, if I run my
script I get 491, looking into the delta, I pick out things like
these:

$ find sstate-cache/ -name
sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:*_populate_sysroot.tar.zst*
-ls
    49067     16 -rw-r--r--   1 alexk    alexk       14435 Feb 18
15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst
    49129     16 -rw-r--r--   1 alexk    alexk       15205 Feb 18
15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst.siginfo
  2490392     16 -rw-r--r--   1 alexk    alexk       15204 Feb 20
13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst.siginfo
   339439     16 -rw-r--r--   1 alexk    alexk       14423 Feb 20
13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst

Which look to me like I should be able to delete the older ones, or am
I missing something? Trying to follow what the existing script is
supposed to do is challenging!

-- 
Alex Kiernan

