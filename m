Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501A5C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:40:58 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.44218.1745833248940561558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DabAhUBc;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso51752746d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745833248; x=1746438048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rn4HIiAfAuKtKY1HrBUWgliSgNY/7GN1J8wj/R9ofQY=;
        b=DabAhUBccHaErpp+knxwNhyWjKVmDA6y8VW7kn4fDLuEja8xNvJbF7omGmAPrMKNsB
         Q0ajAII3KcJNjYoJmoTQs8XTT6lyF0dbHblFv1V67fN3NuJC+sbz4LS4PQwJHoASkkpy
         tAk/opx1W5kSt9vjyV6RqSoqWCA7huu54WTrdyVXZ1KoQB1OcpAeHo83Wdbk2tbyDWKw
         Lvj0NKpkXOhY9AwqXm9pjw93sQ5Y9ddfi2jSS28mnZVVLST1fOHuufWvkwgiSLQtpoxu
         bpRTEVKYee+WgaGW4XqewzTf0viQDANFq19eNF7RXmq92rfi3xnilMCXjXSeFerbLW5H
         I5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833248; x=1746438048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn4HIiAfAuKtKY1HrBUWgliSgNY/7GN1J8wj/R9ofQY=;
        b=HmbxSr7lYMQnhE8dJEE5uxsRtQ4xHf+38CE2bkpvVV4a3nsfl/86/cSsWcHepI6mGH
         +PJPqR3UnK5/3JhfrqqcYeoOymXVFmtTuZsznqwGd3aU0H0x238xA578YmgO9Fv9m0xC
         HqS5SL2p8DbxRUNvRhWTxQqBJ+6CuWOPQoRDxEl1S22p47zFg/w8i356a4+w/yuCkQ6/
         r7vein6LHJaw7hN/7GFOizXJr1KgSTp4/u65DoEUxfRDYn+zx262YRUZLrVOPGONbUdA
         5ziLOxgb1sIKjVgna356bq6ZYX6ShuCW6/l6DbxH4T6OIvj0GtHuowJKP8Aa5/4qxdE/
         +pjQ==
X-Gm-Message-State: AOJu0Yxl9zbaGvembFn8n3QmkU9DqBBof56OBiU2ZiMQNGCv1ebxNP8c
	wMuSBZr0EUBNKDjYm/TeyKFjEDKB9QzALkgEA4pRwB3I9Npy8QDNwJqCEy6VEthK9EHywZsXnpF
	Ks+LM6eXaKue6jvHOut55APdZZqAUKg==
X-Gm-Gg: ASbGnctvOpLS5MN4XA67KI6hTjssgXKjZAx3ADv8qxyZQdCSYrriiMxzkvQQ9gERsW0
	WnW6cRMYdG4HyeqbaUlG6X40+0VwQd/xcdf26hILuf0idXiLrJXdCHBRrqQAZxzvvBvkKJLpKIv
	yKAtN6oY0k61CFkme5OwQ+LFlQbaByI3oTidjR9xx3/JwJKj3BoztoLMhB
X-Google-Smtp-Source: AGHT+IHKD0lUM6ZrbXY0f/Rnrwx7a6Nbs9RvSGC3GnqeHDNCPGvsJvtTI7oSBU/j6DwmRGiD+g17B52H5F0MNp+S9Fs=
X-Received: by 2002:a0c:f850:0:b0:6f4:cbcf:5d41 with SMTP id
 6a1803df08f44-6f4cbcf622dmr162244766d6.27.1745833248040; Mon, 28 Apr 2025
 02:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250427223046.3447347-1-raj.khem@gmail.com>
In-Reply-To: <20250427223046.3447347-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Apr 2025 11:40:36 +0200
X-Gm-Features: ATxdqUEFOyrMWiDtf1-KJYNX0jqkSuzRxjGy8ZrR-O77RfKLLSHINxQA8Ods8Yw
Message-ID: <CANNYZj_SU5QaVmQ37C8gRWGjdW7DOzK8J4CwY2acHg1VnE5uEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] harfbuzz: Fix build with gcc-15
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215587

On Mon, 28 Apr 2025 at 00:30, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:

> +Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
> +
> +This helps compiling with GCC 15
> +
> +Upstream-Status: Inappropriate [GCC-15 workaround]

The patch still needs an upstream ticket link for the issue.

Alex

