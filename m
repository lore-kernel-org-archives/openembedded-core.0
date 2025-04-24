Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFACDC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 19:49:55 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.3206.1745524194065710886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 12:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EZY3GXUz;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8ffa00555so13736866d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524193; x=1746128993; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RqklR3/MZXpsvdsNzkbSkUQp3NeyEyVuv2oJVoFqU3g=;
        b=EZY3GXUzuams+4Lk+UKvyFI94DSkBYA6qy5tZFxIj2ZtSicYBfHpSy8Def+oTNCRwx
         Q1KmMc7+1sM/va9VpR1ZRSClZrm4u9kaUwYYvECt4SWBQ8haHX3IN3dgfYWoA3oJyAjz
         idgARkEIrmOzzwib8f8EM9/DUtHT7ZiWiKFbtzNFKLzrYWAINRavIjb+HY1U+Qokl01W
         mUu5MMxgscdzSMGAFwxN1TGfyF56Mh2WnG7I2eTzWDfNlSP6654vtykHt1Dnrg4kriDQ
         kU95//cDL/UI3P9bJiR7gqvgev/6Ya4LFvLVezoS+raW9Z8UEXre9bc/nGnNwqEwIUlZ
         +mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524193; x=1746128993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqklR3/MZXpsvdsNzkbSkUQp3NeyEyVuv2oJVoFqU3g=;
        b=twHTJTo30JMjNtTkH+/L2Jm43e2x42ef/Zm+HvTwwqNGZ9vGQsKmIakKNcoFK+UDrs
         jeguo5is9Ie1tP0r9k8+3vyrBbBV5etI4EnLsO1z/MaMYo0f5RoefPgFqpxd7tzOnnyI
         dGq6uhqCkWzthOScpIa8VXq9aAokRb32mIphNdExhSSUj/kk29ziNlsoBR1IN/MkzSYr
         OokX+hnGh1tzEEVfVJibvcN7mjOJ1eI1v2Vw4M0sCCtxJeJZ+JLjdt2HY4V8QY1uJ2wl
         EzlqLsMKzmH0DHifU7c+c3nfi29LJiH5R7TA+ED8XeZfp/MGJA2ddFQ/JNhTP/uNh2gP
         WhzA==
X-Forwarded-Encrypted: i=1; AJvYcCUNu2z8Jo8iYBCxLTrNvRs6I4qFIdjvF/X4KDg9HMfVNKOvjKMpSrPbjbYNzTRj8FbgdzTz0YTs+1ZIl4CbIiHGXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZXmmyAFkPofJsjuXJMlQveCsIdNmMlHfIH/5sb/fre7jhoyxn
	bJNSyd9URQaE8k/oLP7HojuLuS6pWEAxZKejW6LXU+o3xMC+tR5JAehugiFCUymJ8rCuvxUOd4/
	5JkI8WyPu2CtI7VKtfs7/UAEKgqo=
X-Gm-Gg: ASbGncvwKfWsMDIT6ho+Rm1hjPsYXcUU1WpyxwKigdwXZCk/rLPvFsJ+JOdJnlDPGTZ
	JSUHo6SyxXUgXbbX0oHSbvImIOi3ngjJgnagBXQQ6iANh05NLntxc2C7Edk3pqFDjrayAf7BlhQ
	OzUFNimGrV2Q5lTzlbgAantzdilwF8rM7uG7vKuSz+lPruW2NeA/OBUABa
X-Google-Smtp-Source: AGHT+IEOQcBoFWVIZ7LwP4cVWHQrVmrxneh11zrMB/rKSMq/dtzBW0R9vdRPcNyh+/WxTAWtWRAiw91JmzRW0EUsl5Q=
X-Received: by 2002:a05:6214:300b:b0:6d8:8fbf:d1b7 with SMTP id
 6a1803df08f44-6f4c95d0289mr12663176d6.43.1745524193143; Thu, 24 Apr 2025
 12:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org> <CAB3asfjUNTGO7+xRrNbPg=ZuDaj451OQHMUcWqUY5SdiYNFwcQ@mail.gmail.com>
In-Reply-To: <CAB3asfjUNTGO7+xRrNbPg=ZuDaj451OQHMUcWqUY5SdiYNFwcQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Apr 2025 21:49:41 +0200
X-Gm-Features: ATxdqUGYSDO1y-uFWG6a60EIm3XbGQVG2KSXa9Z1JFrWVneV-wM_5fKfcZeiRoA
Message-ID: <CANNYZj9z6-=ynucks1EY23abki-Cc11sj5fXQktVysASuzkbsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 19:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215402

On Thu, 24 Apr 2025 at 19:36, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> Maybe now it is possible to clearly define how devtool uses or maps S, UNPACKDIR
> and WORKDIR in a generic way rather than trying to fix the code in some way which
> just works. Or is there already such a concept behind this patch?

I've just described to RP how devtool figures out what to place into
workspace/sources/. I'm not sure how we could do something different
than what this patch does, without breaking the layout of that
directory, and all tools that expect the current layout with it. We
could, for example, just copy UNPACKDIR into workspace/sources/${PN} -
simple but completely incompatible with what happens now. And it would
introduce ambiguity and inconsistency into where the source tree is in
there for anyone trying to edit source files.

Alex

