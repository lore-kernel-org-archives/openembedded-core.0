Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6438DC54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:52:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.7374.1747821172563304937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRkkvoA0;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8b27c2d7bso66814776d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747821171; x=1748425971; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QTBvcUrbMx0yE4ivI7cWd9I+Xk04vWfJhsFmFdX7U94=;
        b=dRkkvoA0/Ec/1yJxkjZp1bwRBWfhv56clR45Bni5dKWBUlLBKv7ZWVJ6be/hWwddlX
         spHDHwWXnD+m/3gbdodALrjJtG+TirWUSFg+OV9LgiZc9cGWo6eKcxNCeMRJDY2JLu0w
         GT2iL83eLllN9K5Dgh5CUGuf7JIpWqBafa3PMmzV2knaj0ajn53J5j2HQVsbdjr0iDr0
         8fnPDfBsf17z3fuhWnCkI2GSAaXMfW5uESDvr2QgXZ2+EbB810uqQWr0P9PJJrSa0vuR
         CT1JohjYDQVKQFJqfZbcmBspKipyUG7Sxl1iMKeTo1ofsGdQ4WqwkDOjscCxDNmhtxSC
         U1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821171; x=1748425971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTBvcUrbMx0yE4ivI7cWd9I+Xk04vWfJhsFmFdX7U94=;
        b=I/eVWIsn8WM3aw7xeNOxoAGQ2xffSP3JXcDzCJllq4gzW+3JDLzaeF88XFC87co2U4
         53xeSCusr558OmkfA3DVlQqCmQEU4OyB2/DG1VMlDUAa3UGPb+gNPGosqdwjlemyeuS5
         WpKdujX96/HTlAeLvVr8Tbjh9uoUi0lSzLohm6DYy3X4KV7lv0or+E3y4L2/ABWJpmCx
         g3JB3S5x09cNG5j00JKc+kI1jiKtYWam43LUEZFXMyYNrtPIdNQ/nTft68Y+8WW3eXcq
         z7FtrUK8ZySYq5v7Dv1eHCc4JGTPS2jNzXwmsrRHou6cLafD6Y5iSP3sK2EcWsXm3uKT
         N5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvaOLZxFikJCH0zpeOq2BHxZZbBW2t1Ix1IwoT87AV3768B6tB11k7VqOlzaPEMmladxTYbJaUAzcK7G86yKgm4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YysnyzFXG8lqvFK1uvJiR8cG1S4nhSYALdS7XHlnzncIjqgsn6h
	XDWrn19XHD+HMhWZEym1/0ULEJ/8mThiFS1FPpAgu90GN28pIPCyYN+FSI1JTy4Wug36zz/MJpI
	a8WB5FwWl5K0TJ1kBXBDnqrY8F3WRCeM=
X-Gm-Gg: ASbGnct+3GjhcFZ9Ue4npMaveHfd54muKU953YE3PxrYxaGEUGnor0alRsR4gFG96wa
	+Gw6mkc7pqhvtfK5JgW8qX/s/Pe7LagWMKm0Y7QKOEnRRFRPal1FsVFhanwQXLUDY0tpE/Xerc4
	aHFz1BjCxasTl61kheBYucjszdmwc9CYIvVw==
X-Google-Smtp-Source: AGHT+IGzvAHDw9Ky7wC/VHO68DpsMmYh1X8YNwbnobPEDPrIb04QtPY2Uz7V2qG2L/a9HO1vxwX/zQuz2Qpo8gJT75s=
X-Received: by 2002:a0c:f201:0:b0:6f8:997d:fc84 with SMTP id
 6a1803df08f44-6f8b2d25cb4mr335438786d6.19.1747821171565; Wed, 21 May 2025
 02:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747770224.git.steve@sakoman.com> <f1653e02abc2fe88fa33cb0956e43312c6c2cc25.1747770224.git.steve@sakoman.com>
 <852cb6c6-86cf-4f24-a334-5d92cb56425f@gmail.com>
In-Reply-To: <852cb6c6-86cf-4f24-a334-5d92cb56425f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 May 2025 11:52:39 +0200
X-Gm-Features: AX0GCFvb0Cf2VMES_SJO8R9LuOWH9jHmFlhKGI3yz9dxPuVuhXmREAMKJ3xcPxo
Message-ID: <CANNYZj8hVCY5vXS3wE-VTyHXGskD7Dy__Y9=1KpuBLDDG7aXvw@mail.gmail.com>
Subject: Re: [OE-core][walnascar 4/8] openssh: Upgrade 9.9p2 -> 10.0p1
To: skandigraun@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217011

Yes, it's a new feature release. Should not go to walnascar.

Alex


On Wed, 21 May 2025 at 08:42, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
>
> Isn't this an overly big version bump for a stable branch? Not that
> bothers me personally, just asking.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216997): https://lists.openembedded.org/g/openembedded-core/message/216997
> Mute This Topic: https://lists.openembedded.org/mt/113217664/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

