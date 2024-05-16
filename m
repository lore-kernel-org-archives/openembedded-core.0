Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35E3C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:29:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.11143.1715858962348494670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEbPLLSu;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f174e316eso769537e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858960; x=1716463760; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zyrER2CNpq9xmJdbFtboMb/q36KrC7NZSIqSVRLyPBQ=;
        b=PEbPLLSuv2ebVu5RuTKFgNurFoATz4risYuH+k6yX9QQp9VM0c3gMVD1vWSf5v+dTi
         BeNzpMNi/wNCIlVFx+X+NZona+vFR3ZzZxn3SZQyyG8tl5JuowRZi73l6x08/eSLNrZ/
         Al30MamiOftetafQItY3jnoicETcatU7W9HTz6zFJ4hAeBwpfe/Gb81a0UkwnwE81yUR
         HOht1jgLqpTFsJSRnS8THfRDXlnKGFKHdwg/dBmb10nZ9mEDqyFCuji9an3UYl4NLBAj
         eH5QkdPMlHi3zI7m7sClkM8aoBxCRE9RpwuRwDKUFitTcr90NsOJb6oR97XRznt7BQOi
         B/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858960; x=1716463760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyrER2CNpq9xmJdbFtboMb/q36KrC7NZSIqSVRLyPBQ=;
        b=aK3RUk64Msuzjk90NLDqrErHxJWOSg+12Qq86EPw7TW+s8OWiDU8qTqh8w73WYvyf4
         95WX8fZLA+iFnOGE/8QL2ldInoJeVlHttGj5PVcdda/Z0WN+vIBq/mxyYYmlLpfO4zQD
         0Wk5SI4IQYJTKcaXGBg9H642dFbsOXnk0CzSv/ZUCh1HBrF3ogByjCDsEPTYX07lpvIr
         qUUV/WMFaWFSKKlJ0LW3YwCHpqE3n2oP4OLCZr6PnZ+uEQcydHgvZDzdct2zpheq6uRn
         fJ7k84nnw0VX10ad3IwKbc6MZrH/jNQtiV/Rbx74S3JhFNx6E7gHfoQbuxvlLS96AIGY
         7xxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfAqjXa06de/gQt0ngg7TXWgwOz2pSoyHrdqTwwxEWTp83EVVPSvuBI9OUb119Y2ff69EAIOb9Bbf3DICts5Wh/g58/3y6d5mT865SA+FNG5EMg+fr4GCf
X-Gm-Message-State: AOJu0YzPfnJTXB+wPPYNM8BpY/YTQgCTXBbxg9GTBVXdDbcxj3YYoT7/
	hgOMFJohUkX10ifY1q24KQwfa0aHTlilSMPPkh+lK6gJQXietuw5z3GPMSiwlnL1wmXtT0cp966
	4QM5lOKtTid19AiPskP8Y9QbYiHM=
X-Google-Smtp-Source: AGHT+IFMR50cB8ToNN0klTFr5RLNd2JB4CynXykCf8yGTcWC3oQ/G2cISTGdEQwc+K5COI1Q7uM9XYIULP3xd12eWfU=
X-Received: by 2002:ac2:53a4:0:b0:521:9963:3896 with SMTP id
 2adb3069b0e04-5220fc6da32mr10670126e87.41.1715858960296; Thu, 16 May 2024
 04:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com> <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
 <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com> <17CFF314D55865EC.16299@lists.openembedded.org>
In-Reply-To: <17CFF314D55865EC.16299@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 13:29:08 +0200
Message-ID: <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Yash Shinde <yash.shinde@windriver.com>, 
	"Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, randy.macleod@windriver.com, 
	Steve Sakoman <steve@sakoman.com>, alex.kiernan@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199481

On Thu, 16 May 2024 at 13:00, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> I'll send the ab patches that break the test suite later today; the
> request is to take them, and unbreak the test suite.
>
> Then you can rebase your upgrade work on top of that. And address the
> usability points I made.

The patchset is now sent. Please fix the testsuite, and send that as
soon as possible.

Alex

