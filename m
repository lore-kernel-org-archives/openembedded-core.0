Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613FEC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:36:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.67571.1673256997275542957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVe9KqGE;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id p25so2069000ljn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sa48IDnSXw+HE3DtHIlwG+FVHEuqnsSCGFFiftV/vc=;
        b=PVe9KqGErq6d5jTLHlBb3cVDAiOFQYioxbPq+JbFPtGFaYQ0RHPdLJvpV9dRVErxff
         He6l1Y1/0owHzK7tHChaj1yVI/jh8g6LEwRWLHc3kUoTZGxnRqXd0VPRJDmcnUWUGyBN
         kaEtwrgiRL7ND2rbBzlFBdUGilh+nhPWB4A7XfttIv4eQemdMRerT4KDIirXr53c93H9
         7TmhHNvCQOBOJr067nTBOQYcDFk9DS1Oc3+wNHXS0Zg01tLtEQWvXTWN2YJw1fm5bTl8
         x8Y8ZyNOu2o1oJlqlJ4phnzRxZR7SjC1CAatYpb7mDmI+BQXsHUUwyFT0OuHRvEYeA7n
         JrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sa48IDnSXw+HE3DtHIlwG+FVHEuqnsSCGFFiftV/vc=;
        b=PFFon+ujC1a5dKGIiHRXfcAb05ui47lxwsZjh+VIQYcJN0ED+PsjUka3Pz7kNa6rar
         Ud5R0oIU101qTaWuYSWeRtlAjTNNvm/z3YB/rCmhtaWnZ7f3yKf69MRa9RGRv/4tiRIR
         VWpITZd6YXZVd4OXH70XqtbLeNJqLzG2kRphtQ82oDfZEHY6ZYwi28X+4mluLnlIwty5
         RPC8+ExxCiK/8PJ9OOu0ryUfTPaQ6bN7wrpmA4a/7K/LRe2mzbdMJWwYlHfJte9v+LKb
         96j4KcBPrlfPP863oq3/E2w993PMnGedfVtDMCIhARp1oCgAsMJDJTc4xMn2AjpbNxgH
         xL+Q==
X-Gm-Message-State: AFqh2kqrk2bnkjaFFpn4QwwcfstPJWeTEAtmnuzFhZrBUMyXyfUlCi3X
	CPkCvuYq+gnM/KZOj2OITVabhUHdp9YxV12Di4o=
X-Google-Smtp-Source: AMrXdXtCSCYYkQmEPuD7x/eBbtnvzOvKEmZa/ao7qfHYBTU6EHFy6m7mjC8F1NL5PGwCJJ8GATX3RC3JOaZsO86Polo=
X-Received: by 2002:a2e:b4a5:0:b0:282:5f2d:62dc with SMTP id
 q5-20020a2eb4a5000000b002825f2d62dcmr697397ljm.217.1673256995408; Mon, 09 Jan
 2023 01:36:35 -0800 (PST)
MIME-Version: 1.0
References: <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 10:36:24 +0100
Message-ID: <CANNYZj8u-5c51tDTSEnDXo2NVo8Rxem4UHvrZr5uzz9Fg7U-qQ@mail.gmail.com>
Subject: Re: [OE-core] How about move nghttp2 to meta-oe?
To: leimaohui <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175676

On Mon, 9 Jan 2023 at 04:46, leimaohui <leimaohui@fujitsu.com> wrote:
> I added nghttp2 into image file, the do_rootfs error occurred as the following:
>
> Problem: conflicting requests
>   - nothing provides nghttp2-client >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>   - nothing provides nghttp2-server >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>
>
> This error is because nghttp2-client and nghttp2-server which nghttp2 depends are not built at all. So, I tried to add enable-app option to build nghttp2-server and nghttp2-client. But recipes from meta-oe are required.
> So, I can't submit a patch to oe-core. How to fix this error? How about moving nghttp2 to meta-oe?

libsoup has a hard dependency on nghttp2, so you have to add meta-oe
layers to your build.

Alex

