Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93DCC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:00:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.45345.1683190846221625163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 02:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TYLi1PXx;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so238727e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683190844; x=1685782844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DTkelCrthwC40ce08STgEFiRzDgbkFGMt/iiRlmYBkY=;
        b=TYLi1PXxK+5K+lrSYnhW8wUleqtmfcybYZcZw/AoxuL1Q96Jgz/rWYsuSP1Qyc6TP6
         pgLWcQSg8lY+BrOgfm1UkHuPjPohvxFpiV47QM4WLHRcG63FFoVJag3CCudrSscxB1wp
         pPCWyz5Ha2guBx9WxbccYCKjTn03dufr2N/fklKvANMhpxC6/5N//fzZVOz4rQ8m5hVe
         5DWi+XkSPL3MjSxgrI2frEJ4zj9+hfqtNlq2v8JqQABFfEm7F1cJUKQSWwsYhAhsOx9i
         ctI2A3Si9BKMSmvTadp6THWgm5JSEojP5GQL9YCJaLP7j+e2C/wP+pCFQFVqsMgavVeG
         gytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683190844; x=1685782844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTkelCrthwC40ce08STgEFiRzDgbkFGMt/iiRlmYBkY=;
        b=RbRxMxT/WCThcMbUoV8j4h3T+XNsa1ZZimeNNj2/fbHtBLbGiidTPEt24vv2Mztxbh
         ConpSjT+xTeeWMZqhEUpKVMClLHqNabGbJTrga33Hhe4xUhi6BKV/xQ1noPy2sMBAtTP
         KAgqKcqxssyNQIZfytsQXbxaGg9pWzIho7KdRQhpEZaQbHzYBAmm3obUUiVix+/vPYaj
         HS54h3gCmVoWzpvf/J507nRvXZC1NZDGY7+uVdmNDPJl/UQvlPwVZlvtXg4bj3WrHhCi
         EuH9wFm+emotj7jy9BV6XJgC6cqeLczWjxy2vMG2hfVRigbHEA8OCVpVbikQWwCpOm7w
         yVqw==
X-Gm-Message-State: AC+VfDwZ1oFbkDzIFhSirM2DmodnFgvGwRkgyC3c+HEW/IwlcnxlR04e
	Wm4StXVdkzfF1WRFIiPVJ9wa7ITs0VuFLQ56uVc=
X-Google-Smtp-Source: ACHHUZ60jb0BKYtHDineKW78/niiLosFvFAfuJlzZjQkvmyygvQTpucBtZEMOPHnDCHexg+l3FD/FgczMXZLxfnB+28=
X-Received: by 2002:a05:6512:910:b0:4dd:9f86:859d with SMTP id
 e16-20020a056512091000b004dd9f86859dmr1615342lft.13.1683190843998; Thu, 04
 May 2023 02:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
In-Reply-To: <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 May 2023 11:00:32 +0200
Message-ID: <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Peter Bergin <peter@berginkonsult.se>
Cc: Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, frederic.martinsons@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180855

On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se> wrote:

> At
> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
> the path to python includes is defined by calling 'python3 -c "import
> sysconfig; print(sysconfig.get_path('include'))"' (but from inside
> rust). With print-debugging this seems to return the bad string
> '/usr/include/python3.11' which is then passed to cc::Build
>
> I executed this in recipe context:
>
> do_compile:prepend() {
>      which python3
>      python3 -c "import sysconfig; print(sysconfig.get_path('include'))"
> }
>
> and then I got the correct return value:
>
> |
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> |
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11

This is pointing to the native sysroot in a target build, so it is
most likely not actually correct. I believe 'inherit
python3targetconfig' may help, as it substitutes most places where
native python gets queried by components with target-specific values.

Alex

