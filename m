Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09931C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 09:54:17 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.10822.1642499655510848937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 01:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e+dnA4xw;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id u6so35557726uaq.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RDoHVpoZ+4p3xhrJ2i/et7UF7tZ1L1NXXHeAunhgqpc=;
        b=e+dnA4xw8PJRqdi8bvgvucV0Z3e+9+DM+Wl17WgLbkHRrB7uB4rntuK8E8ue2OZFIi
         1AGNdED7MpB/AcLe+iT3/5whRH1AXlGop/cfB97EIWTxQyFrdyMjhImo0kdcNEb6haFb
         Gr5vCewGi60yShf+c5iTV4Ys7vjwT5+3yug3942qebb8IXBsNKv8k7RxD28js3/FOZth
         +Ow/6q/SI7Me94zGAao7+J/jdW4TeaEfY0fCINysdsckko7028ET+NfzDIAqdtjI6lch
         vqOdHBWFG2xMbfzuHqin1mTEnsgJFP6ldwD8y/E8RBINzIYmeiJ1bQy+za6YNnKIhzKp
         9NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RDoHVpoZ+4p3xhrJ2i/et7UF7tZ1L1NXXHeAunhgqpc=;
        b=HgRuTradNS59LFUXaYggBGraOCZ+gmxyKv0Jl5MaTz8fbr3OhxZGlr7gm/9IuzHZ6p
         RXRm22aiYxoul6GRshm5aguRSqP7HOp/KKNEDEeW+BQSJxo3yYCS+kUBwmSVyFICFAPl
         aXzQnzfI3hvCUiAueXIVA6qRVDh/GFznejI5/kuckqnoJoGRsF5hXl1SeJDVoSiWGPDo
         DsHyxkbr14WDXGTHNNHN/c8jkV3RgauCgXTjpSueftjU3//4bZVOWvAGnOSUzE+wcrCf
         UKWwUbSZcQmMTsq4wp4Tfg0g4/mpZw3FryOA/doI1iLfGaRGzWc2cryoKm4/m8C1LvMn
         KFmg==
X-Gm-Message-State: AOAM533l7OPhaabEbkSQhm64aB4qaceZgjXpdvT4v9MVhlctheM98EW7
	pGcqA5LF/fGSgPx6mSmgH0GdtSusMLc2iM4i8NeDgNoZ
X-Google-Smtp-Source: 
 ABdhPJzBcsKmR1m6FEIwJaVw2M0VLO83Rp6CH1J+PMEG6m5Rwnj8AOLYoBDgFXfYL/zQ7AEUQOAkGlyITqjNtMWfpr4=
X-Received: by 2002:a05:6102:3026:: with SMTP id
 v6mr8696606vsa.19.1642499654661;
 Tue, 18 Jan 2022 01:54:14 -0800 (PST)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Tue, 18 Jan 2022 20:53:38 +1100
Message-ID: 
 <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
Subject: Honister broken WiFi communication
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 09:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160670

Hi,

Has anyone successfully built a Linux image by Honister to run WiFi
driver, connman and wpa_supplicant for WiFi interface?

I could build an image by Zeus to run WiFi driver, wpa_supplicant,
connman and dbus well, but after upgrading to Honister, the Linux
image building was fie, but the WiFi is now broken, the WiFi failed to
respond DHCP the WiFi could not connect to Internet, something is
broken between wpa_supplicant and connman which setting kernel WiFi
driver, WiFi interface and connection. I don't see any issues in
kernel WiFi driver, connman and wpa_supplicant, something missing in
the Linux image failing to set up the WiF network interface.

Appreciate your comments.

Thank you.

Kind regards,

- jupiter

