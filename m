Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8BAC369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:52:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.43631.1745337143302690595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCD9zO0z;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8ffa00555so45692486d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745337142; x=1745941942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjJ+HsR34ZKo8XklZ2UrUZ5eIyLmLGo3tm7gTUQSq84=;
        b=bCD9zO0zuR9rmHXAZ35CoxZncKxkDiUxi1Z+bzCXGPxxre7etb9XDcVd5HgZwIf1e2
         BzkxbgfR9QJ/TOa9NLEFWyAyxFCWCa8dgMaBTItW1hlr3SfWi+FDf+IVLrOxbxZaCDHI
         PSToPhs9jCEqmtycqdzCte5PQPZ/9/A0ghZwbbmzbBq0jmvbE4rfBG9kPXCGXaO89XDP
         Ji1tFf/Lmk2GIqj/TPeOh2wZCoW9LX+DVW6xxsVmlM7J/Fwn1+18Qv+9134xaIY+/OCo
         bO1qia1wGMEuGmjYbTctxVyXxttF8SrEmidZ9gX2sX2Igysj2sTxPr/W1p4rVxztbbAb
         +C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337142; x=1745941942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjJ+HsR34ZKo8XklZ2UrUZ5eIyLmLGo3tm7gTUQSq84=;
        b=E8wenlaj0UuoJoFzbG96wpRXHsievppwi+/buUMEoMFLdCFOHRBt1rVlXb7qo/2aZI
         Wl8S1C9QRvRJNUurDfUYSI+KQluJGUIrfDWDQEFoeuy7j6boivLlRFr84j4FQXTrvh4S
         ZceYX0PLTsBtmlGkYvMNt3svTuGDF3ihETiJoPRiK8+VQf+1AKZkDMSBpfvWlUmq9rlg
         LRyx4M86mBCZGlCrSmT06qqaPzDt3JmfMtgo8O5tlRKcsXtJ1FdoVvb2VxExgPUqHz3B
         2xd28EhT+yvvfSc5bHSeWQFH5KexKeCrPTFZucYf/9DT6kUPqD0ygRDbU82nSYo7PNdg
         hg4Q==
X-Gm-Message-State: AOJu0YwHmn/5BTkwJjZVsJTS3OMwdx9DQMHuVG5K7TT7Y58AFI1UOTge
	t+WJA8gfxZ1h78aeeXn2nVoz8lOeFxGjrRQJ9tG+/MxDLD51umQunp/Wva0kLJp0OoFP4dhFR6s
	Q6wUQIUHnJg0bOZeVxEE6W+oJG60=
X-Gm-Gg: ASbGncvqlJxhJqJPKaNYwPxzw9hj4xsJngwzSmj5yeor+62hYYm7gqnIzhvIjwUIvJo
	b2kjCBX1HVrV9786wTnJM3lCwukeb3IcvOJZeoLvahrw5R3McTf87RXFnA73Gk/mDOSwaXYYSE8
	qch5SUrUgs3o8zNpvK7hbFzXMLu6/UWF0Qd7gBSUJOiM5Mv6aeyrj+VbLDUkluQQLqZ2w=
X-Google-Smtp-Source: AGHT+IEMAR4b4v7QlKYDgImJXMKxy7Ay87V4O6l40AwkXi1Df7JH9shpYaEIUJLhwvYss9vwQahnp6Q5rrjvhS9VhxQ=
X-Received: by 2002:a05:6214:508b:b0:6e4:269f:60fe with SMTP id
 6a1803df08f44-6f2c4535865mr343782556d6.10.1745337142320; Tue, 22 Apr 2025
 08:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-vNYxOSBoUw=EhYbzN-s3vEKJZ+oROpo3P+tRm1VNXsQ@mail.gmail.com>
 <24438.1745319782531209052@lists.openembedded.org>
In-Reply-To: <24438.1745319782531209052@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 17:52:10 +0200
X-Gm-Features: ATxdqUHbI9BbC4lxes9MTUX8xOtt3kNwkfQpn9WMcGn1E6IirNAiXGIho165TNA
Message-ID: <CANNYZj8ineDyXv8pNgb3GkTJ2RFFm=md5-JiPRo2TxbouP9PPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-y2038-tests:add tests-special in
 run-built-tests yes
To: semc.2042@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215236

On Tue, 22 Apr 2025 at 13:03, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, Apr 10, 2025 at 07:34 PM, Alexander Kanavin wrote:
>
> Thanks. This patch is invasive and adds to glibc maintenance burden.
> Which begs the question: do we need the recipe at all? Is there a
> particular reason you started looking into this issue?
>
> When we moved from yocto kirkstone branch to scarthgap branch, we found that
> compilation for this module taking longer time. hence started looking which stage
> in this module takes time. Found that it is in do_check() stage.
>
>
> It is by now well established that glibc itself works as it should,
> that all affected 32 bit targets are configured to use 64 bit time_t,
> and that any lingering y2038 issues are in components other than the c
> library, and usually come from C programming mistakes (e.g. storing
> timestamps in long). Maybe we can simply remove the recipe?
>
> This recipe gives only two test cases in the packages to test. below are the
> test cases seen for this package
>      io/ftwtest
>      io/ftwtest-time64

Right. I propose that this recipe be altogether removed (with the
rationale I provided above which you can add to the commit message).
Can you send a patch for that?

Alex

