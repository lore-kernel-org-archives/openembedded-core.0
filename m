Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B46E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:41:47 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.140868.1734648099058827667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvMSR6Ig;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dcdd9a3e54so14070626d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734648098; x=1735252898; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gdeP5yzPrFMyaAemLWpDl7021kGzpv0Qk+Gz+S561CY=;
        b=NvMSR6IgPkFl7oNtEXzCZqK/oLtZfKD3WX35GjgcgTdQCZv6jSUDT91wqvsfB1vZOU
         SzQFA8JGO1u8jWIl6jWTKQFMTtgZlskLZyu5+lH5x8+LX8J8S56c6egpmuXCmaJMMYnW
         MgvzCmTYUWkpHJs/ranod9iazewBE1KfQ8gArX9EAGQLkmddY28Brg8TH9tuV2jmesTG
         UttUw5CkBLyvxQcDwyRxIUW28oAKzhuugnhp2n9QMoSXEmNDFAfkntz1cPMqxGTsVSKu
         pLWCK6ygMPud2Ce9dYmCkSgwcfbylTj55GG1irKhC2TfXA/XIFMbJLjH0fNHG1lS5OHn
         MZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734648098; x=1735252898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdeP5yzPrFMyaAemLWpDl7021kGzpv0Qk+Gz+S561CY=;
        b=O8Lf+mpXS6uxSMWuSE7cZK6xiNLF4811K1yjQdKTxIqAH9DLyYS1JwloW+RSht8d9p
         rUgsUHaavJZfqTsee7G8gag9kdEuZytKrvUDjFH0OlpZu7Z5IC506B35HPhFBNXQhhq6
         TaKkETaLeaxpEctF/56zuX2b6cK8LITT/3TypbMQBLkKddJonRw4Csj1M0mE7tcoNY0w
         I4CobvqZExzoQ0qgLnzPhtLPITCwSZ2ieFFe0NPOmhwf12xV5gbsa5zbrHHQKmwAVkB2
         pNvFUgV3tCKU6gzN+yU1j1M4XPWzzcmmMkhS+IrZl4LH5NuNnMpHszOA/mhUn9lEM0aL
         DWew==
X-Gm-Message-State: AOJu0Yyw8HQayeShpp8dE6GHzYr1BNHL6T/2r6gjF2+GaOdM+V9Hmolm
	BA4j6XBQDJAYTfwDG5Ay2c+ioZIEitDutSnfgAtMikNChCf5k6OC5fhHwv8ZinC7iRTVjZkVv18
	6wY2wcPmvaWBrAKpmhzuMezI4y+I=
X-Gm-Gg: ASbGncsvoO2eEz1IT2SUCYthDlrEalzQW1928awRByus4yN4wGioEPg+VIPMMuhCe7n
	pXOYkIg4r9IMyQz95sgODuuc6Y7RkYeChRI6XQAzLKHCVftgxAXZZNgsNzk10aPiwMmZ3/rgL
X-Google-Smtp-Source: AGHT+IFIaLhV/CL45hMX2VLTrLP/jxNLkVKkXwHljEmGxYCNOBLfWyt68ZlySYaUq62PtSmf6QC23OUSBJA1jpzZ3Mk=
X-Received: by 2002:ad4:5d67:0:b0:6d8:b189:540e with SMTP id
 6a1803df08f44-6dd2332ec1emr11539226d6.6.1734648098049; Thu, 19 Dec 2024
 14:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com> <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
In-Reply-To: <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2024 23:41:27 +0100
Message-ID: <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: tom.hochstein@oss.nxp.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208963

On Thu, 19 Dec 2024 at 23:22, Tom Hochstein via lists.openembedded.org
<tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:
>
> Building weston with core-image-weston SDK fails:
> ```
> Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)
>
> tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor required for running xwayland tests
> ```
>
> Fixed by adding xcb-util-cursor as runtime dependency.
> -PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland"
> +PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland,xcb-util-cursor"

I'm not sure I understand. If the error happens at build time, how is
it addressed with a runtime dependency?

Alex

