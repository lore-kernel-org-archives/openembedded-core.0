Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCF9C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:21:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.55990.1741015310931024742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z8IEzJBl;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf4d756135so365936466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741015309; x=1741620109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MVaX2Lh08tGeHwhOBB71zpBLGKc3tmhm3oLyopmfk6w=;
        b=Z8IEzJBlZaGkAERLM5B67aLSAyYy1L8pkXHySMmF1IHS3TAHJDebUhrrmuxGzUbEpS
         050+naEjPrO9t5HcTu4JISlQx2PqpuhvmLhRGeOgO7441IX+cIbuTDD8m1Egouijz8Y0
         Z+XZlYAEmh7u4aIWL9OBd8ynYlzHPtIVKlgLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015309; x=1741620109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVaX2Lh08tGeHwhOBB71zpBLGKc3tmhm3oLyopmfk6w=;
        b=m5/QnQBEWNo0ae/Zrk/q+vm9xG+UxnoTAbMGWxAV8WnOzeoZQeK9n49OSU2hkPvSZl
         TAhnXcRqXHArDZLl/BRUKUQfxD+SYQkG7VqOD/+kmtHXNHlK0sTEAyvNG2mqXeB5CyGQ
         4x6YpK3tq1vT65J8tPqLAW0t07iXwU4Ju8OjZU5lPDLATq30QBr4s/2fF0vhzCdKT5Rq
         Zevs6gYolRKHjYA/7RNEHP/40dA5KrK7c9u16mGYAW8B1yNz4yXgjbClRtlYvfHVDp/Y
         STH7XWrA8gNhcHhHypG2Wgw8Bjta12KSopqHF5H1bKGkNGAB8hjWAejiHW1t9c6SMhbU
         PlPw==
X-Gm-Message-State: AOJu0YzOHtjYeyqu4vPo55csBTGHG6TKxEM6hM+Wg+5CUOfGhrRuBUTa
	5m2dwTwOaehkQyBwKhl2zUo0RWBezX93Rkp3cEIj1ThK7gGls/q07nL5js539mkZwMPqHFk5G9P
	uHf4kCvFF5qO6JrGpK9ILz5qBrAoXn5vHQs8m1w==
X-Gm-Gg: ASbGncu6KsRPE8dkj3IaZD0i30vAEy/9kBOApuMgAlgV6lEnX20vYMG3TeANzZf5p1x
	rK45uByxaz7dv/PFL7+wYZQuttgCxyWEHRVpu/LYCKOF1mZtLCUNyXeG38KbjdYL9YFt+pJfKBJ
	MQ9T6hV+4ib9fscZa2r6I8/Skf+6I=
X-Google-Smtp-Source: AGHT+IH9c95QDkeaSOo6z9LbCa3V6G4y8Th0bEn3QEPvC+mUMz947aBgtO54zf2/PX0RWQDdm7lV5Mrf95kwVagQrFY=
X-Received: by 2002:a17:907:7ea7:b0:aba:620a:acf8 with SMTP id
 a640c23a62f3a-abf25fac8e7mr1499361066b.24.1741015309267; Mon, 03 Mar 2025
 07:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr> <CAOSpxdayD11HBG8t2CCNgGF1PkEMH=pagm2tfh7hfk3HhRjU6Q@mail.gmail.com>
In-Reply-To: <CAOSpxdayD11HBG8t2CCNgGF1PkEMH=pagm2tfh7hfk3HhRjU6Q@mail.gmail.com>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Mon, 3 Mar 2025 16:21:38 +0100
X-Gm-Features: AQ5f1JrQRZ82GPh9xMxJ3RTKmCbk271SM38ltDU5t6RdyzJScGRU8oWVyhtwDQ8
Message-ID: <CAEs58j5dRQEoNkA8MXcAV+qqvaCNDUQqxdkfNW8yOqHkBrspmw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212210

Hi,

> Is this also an issue on master?  If so, this needs to be accepted
> there first before I can take it for the stable branches.

No, this is not an issue on master.
On master, systemd (v257) has a tool to generate those "weak"
dependencies, based on "notes" in the code, that is used (see file:
`meta/recipes-core/systemd/dlopen-deps.inc`).
On scarthgap, systemd (v255) already uses dlopen, but this tool and
"notes" are not in the code yet. So we cannot backport what has be
done on master.

Regards,

-- 
Alexis Cellier
Smile ECS Developer

