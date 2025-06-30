Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920AFC7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 11:05:59 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.36834.1751281552042611392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 04:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYuP6uuy;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so32554806d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 04:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751281551; x=1751886351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=23XDkQSJSOZnh3Le0aOhyLBZvefUum4A/e6W9Ig07w4=;
        b=UYuP6uuyNOfSqYowQ8c27l1OgmcuqgVn8WTkXI55IL6B/QiPAgW4oVj4zXGSOV2ZKw
         e2E7UF5DKHvb0R/b7P9Yr0Bm9WjPcR9iOBxjBUG7BQDIWGnM/KnTcsmCXJ80dkD8EsH8
         RFwLoAWdTtjWczGjR3mFERi88iY8YilSndXgBggOwXWrR708HgzeA3kV07MO9tGKUvtK
         HLtLDPGWK+h+U9aUGnEhtAnCPF+poZ2x976V9s6UjtrwZEckVyzZLc+idr6FNX+q97Fd
         tX78OxZOGAT/guwGgP2kume52xGXPMnIMo5/8boeZtiiS4X7HQZcs/Jq/sOkEOzCavgx
         Lxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751281551; x=1751886351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23XDkQSJSOZnh3Le0aOhyLBZvefUum4A/e6W9Ig07w4=;
        b=idDxi7TszgdgaL+lhvj94i5D30MEFlBqPlpujlzLxDxvs29W+57BQo52x1WjELXUwF
         3qAd44sgIelKBMMTIPo48eBMneJdu/n5xwYi3grccayqw/qkC/6eSlS0twGUAjOSf+Do
         GfDT5qbYgEJJLTsvvw1Oz1pdlg6551ZnAmq9dkpRgH8VPoAH7PU+S9tTmgqcyl3Rpdyv
         BME2JTycJc/QT0RIaTDqzmSo9bQ2QlSQnxRWyiZDqtcXScN8nkI/4qoFN9ef4rzSOOuq
         S95FrZMRlVpKJsormCdKvT88jtHcXQkeccv4h4lgCGKxDI5OXGsY5oG5fxFsoJjgcDIi
         Q69w==
X-Forwarded-Encrypted: i=1; AJvYcCVRRMfpIXxbh3MpOVpxWzeONhfG4K3bTQEWTjgt5UidrrMbJhmkud1e238fuwTVjVMaiqVJD1p4UCdo7dHMM+h2LA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfWMXYCWL1yFID4h1TbbRzpbEBfHG9GXmzHNPFWXigP34jnEjS
	YgvBMt/dagrU1z/znTbKFa9SlcQuCt47WSSzkNkp3Z98Ev64XgB1FYcl2ilHJ6bPnm2RMogffSt
	AcITaUAKXUBBWY1MwEzEb68U3zdMgyfw=
X-Gm-Gg: ASbGncukNx6SmvsaOktB+euj03xz9Id3eMqzIQjZ5gIQyfF7eHzsKTVJjgd7rHlk40Y
	tI+eeTesxGPzi9oQDwY9IHec92mluZ2RdzglnAIbMTeoOGsRzCYyTjXY/NQijLlqqMO2o/llRC0
	IsR+PQcuLxS5BicoEf+uEHSdTifnXFc0sSdt+r5x1bNIJ5bf9FgktWo62TM1fv3cBiSIPZErCHU
	+DkjjJglhiNHWfw
X-Google-Smtp-Source: AGHT+IEbVxG+8JF9cZoYUgBtSZEG2+ZN96VM6qlsHGzhv2eInubWjS2CZLAvHBskwIRdmz7FIQrdRyFxE+lc2JuKih4=
X-Received: by 2002:a05:6214:d6c:b0:6fb:5fbd:ba70 with SMTP id
 6a1803df08f44-700032be559mr141887946d6.43.1751281550600; Mon, 30 Jun 2025
 04:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de> <20250630104104.4093207-4-Moritz.Haase@bmw.de>
 <CAMSfU+7WhC+=fKu8kGOSiqH2cnRqisJy90ZBMcUB27NYiCPesg@mail.gmail.com>
In-Reply-To: <CAMSfU+7WhC+=fKu8kGOSiqH2cnRqisJy90ZBMcUB27NYiCPesg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 13:05:36 +0200
X-Gm-Features: Ac12FXxD0jSrOSXWLxpJWMURZvhUcw_RO0NtLZlUxz6II70posjsqij2Orr6Zfs
Message-ID: <CANNYZj99OZz_zK=vhei1N5rwbrU3QsCTWM963NpUx6t_O6uTsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] cmake: upgrade 3.31.6 -> 4.0.3
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 11:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219510

On Mon, 30 Jun 2025 at 12:51, Yoann Congal <yoann.congal@smile.fr> wrote:
> Out of curiosity (because we will soon find out), do we know how much of meta-openembedded does "Compatibility with versions of CMake older than 3.5 has been removed" break?

I do not think this is a fair question, and it is asked too soon
indeed. It implies that the submitter should set up an (extremely
heavy) world build with all of meta-oe, and possibly makes them
obliged to fix the fallout. Neither is expected from Moritz, just to
be clear.

Alex

