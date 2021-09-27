Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5D0C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 01:30:06 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.25789.1632706204853291708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 18:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AHqHdpOU;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id y141so16415809vsy.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 18:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/R4quABcNQg4WbdWc1XdzKB0hHyACFB4SNwEbb60Ys8=;
        b=AHqHdpOUa1oWP4cMNMpJkpiEMGNnLVcvR8Dc/YWdJ7epL118Dc3mDz/Fdubttrq3Q1
         Gda3VGj7NNf3NdCF6mqhZvVbxwTceX3DktZmcTqhvyZWrOd6kf/Y0wyrLLwcn9i4H5FW
         WC7jYsXmb1StE0+N4iMlnjAd+djALZCHwLrbrAS8u66kqnkjHEmpxYQRJ6D/mliGAjLz
         M1qGVi+koQkym5pD+eBV1Cd0QUk+NNSCUj7abW8kthdd9YYDWlmaybpURVVo8hrEG+oP
         flwlUZEEZF7y6gSnLBNFfn3jxWuknIvO9SvIwN9P1EQkHVS+ksaH9gXcW12IP4GXFLCD
         euTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/R4quABcNQg4WbdWc1XdzKB0hHyACFB4SNwEbb60Ys8=;
        b=6jhQANGaCDHfWnkTjMZB0OHHxanO5zD2MkPZUtMNzhjUzJQTU9neBm5VIVqPpQRL+2
         PZurs5o7Y9lBqDth97nIAFgE0OuziulqxJlBEQ5tFLeO+z19sGKpK/cxQFIdVcmPxr/4
         A7g0YEy8ivyoJtD9o+DRBw4hrKnuBMXW1390KhryT7igkqSeKCCSkzilrcEs3vcvOBqm
         fU9VuwDmtWcqSqsRrYli28ZLfEIdn9T5BWoXLG8tWSLFouulvTsDpeD2nH4LxguWfskH
         HYUhpKYNe8uTxf/A9kpgltJqCxaVaZkjnypuR6N7gyipNBbUJS06Fqg9MiyeI5Yytm3B
         i3xA==
X-Gm-Message-State: AOAM532oBikaSDfeGmsKeGmgbRpAFvPpoCghcK0M/ygrczWP1up4EPcd
	x4kPU1eBeDZVx3QlxvTmTn1gkmutrj5FdJ93Xr3LujlfB3s=
X-Google-Smtp-Source: 
 ABdhPJxLCy6vnkKsJh19IVDKk7Cn2ft0XXvhlnPN2PNZrv2pBxtMKN5MsNJhRa5bfcJ3sq1E3H/U18phhW9SsQoH0Cs=
X-Received: by 2002:a67:2dc2:: with SMTP id t185mr17176011vst.1.1632706203870;
 Sun, 26 Sep 2021 18:30:03 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 27 Sep 2021 11:29:28 +1000
Message-ID: 
 <CAA=hcWTC3_+Fg9uRC7ZnAEKhNEcF5Z_PM1WEugxQD76oFJ33dg@mail.gmail.com>
Subject: Incorrect systemd timer
To: yocto <yocto@lists.yoctoproject.org>
Cc: OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 01:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156371

Hi,

I set up a service timer to run the service every minute at times
01:10:50, 01:10:50, 01:10:50, ...

[Unit]
Description=Run watchdog job at every 1 minute
[Timer]
Unit=mwatchdog.service
OnCalendar=*-*-* *:00:50
Persistent=true
[Install]
WantedBy=timers.target

But the timer was actually fired about every 8 - 9 seconds:

Mon Sep 27 01:10:06 UTC 2021 start timer
Mon Sep 27 01:10:15 UTC 2021 start timer
Mon Sep 27 01:10:23 UTC 2021 start timer

Not quite sure if it is a kernel issue or Yocto oe-core build issue or
what I could be missing, appreciate your advice.

Thank you.

Kind regards,

- jupiter

