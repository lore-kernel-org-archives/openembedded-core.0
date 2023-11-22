Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15293C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:12:47 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.16052.1700647957701854365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5B3MpYM;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so88025431fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700647956; x=1701252756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kaS8tCk1rxp76sdoWMBLYTTFDordKEf0EyHsV6s9LrQ=;
        b=e5B3MpYMBmPLM0uHiWUABihBebAtQNs7odpv+85fb3Hs1NLmYl3zqaW7Q5rT1hL5f5
         0t3QbTZPaRrqOIiG9QHstauKz/+ySegzNwhYr2K6bUS1iPKVoDCovxH5ypmrMH8NQcd9
         vd/RWTDMk7rYS4UMRV2Ei0R3rmoDBhAE4ACqlFyKf3Pd6OmzdGmGsjuRx8k9FfWPGcgc
         9xt3xvSA7bfeowUhfr9HDAniuPopLG4ZdETx+ivzlT2l1TB2oX5jNYTfFOU4m7cme5Zd
         Nu0UklN151k3q0H6iOC17l8s1rxGzSXxQEbVR9S9YAxl+RLd12nFkhkJPJK1dxXvtGW5
         UZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647956; x=1701252756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaS8tCk1rxp76sdoWMBLYTTFDordKEf0EyHsV6s9LrQ=;
        b=xHXl+Z/w/JrXtPQOGcznBrUfed/2wUO+8kDQr79/IWa/atMDfb40FwgyPnfcNEYUSz
         9CaEy0CVMEsozU+HndWyiEce+qQaAOIBxwLE21GmShsdEZfkiMyjmfDuUZ2OI3HWhjbe
         Zir7Ma8o5iV/EKfiM0R3+7uYL086dgGHKps/Z5Nx8TUMiOQ7gijw+oMQwFYrUiCnxLas
         3IFQ6Wt8AF78eA1Fc7RH0ijavUXNGudfwZFSOdM4VGtibwFYCN4lJR0P3SOCcBNoUClh
         /C5CKdR3ZAdAar9drVGI4/P9yYBGqJ3Ev5QVJmzvrfoR9aP9JF9DFF6hRk69Ex0phx/J
         xYbg==
X-Gm-Message-State: AOJu0YySuE4bTW/uJpC9wNHTjax/B1SxggKbsG2XXulzzLO5q79geWwd
	D0udAmWan7EBO63nMbUMd/fJNyjJdWYMZp0nuo99ih10
X-Google-Smtp-Source: AGHT+IFcLKk/Wo2WjXdl1MK/FhR4bZcJaNGe1L71t2bXf2a/A6uXxem26/x77klPnsNaEeGH4K+uK2szT4ncH+ErX9k=
X-Received: by 2002:a2e:b8d4:0:b0:2be:58f3:ccee with SMTP id
 s20-20020a2eb8d4000000b002be58f3cceemr1625683ljp.41.1700647955773; Wed, 22
 Nov 2023 02:12:35 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9AN=Eq0DKPeGS-N-XP2=OitMzW6sOcBpH2MUNzugY1hQ@mail.gmail.com>
 <31510.1700647822136703903@lists.openembedded.org>
In-Reply-To: <31510.1700647822136703903@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 11:12:24 +0100
Message-ID: <CANNYZj9g0uu40tyH9+QY-W7s7ND+6OoUOwhDHVxsfF3=1vhikQ@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: tobias.jakobi@compleo-cs.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191052

On Wed, 22 Nov 2023 at 11:10, <tobias.jakobi@compleo-cs.com> wrote:
> P.S.: So oe-core/master does *not* work. master has ncurses 6.4 (no patchlevel), plus the patch for CVE-2023-29491.

But did you specifically verify this or is this a conjecture based on
your backport? We would need to fix master before fixing any of the
release branches :-/

Alex

