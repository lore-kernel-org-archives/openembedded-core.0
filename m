Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F607C0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:43:51 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.65660.1738921427776827879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 01:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XL4mHHKw;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e41e17645dso16003116d6.2;
        Fri, 07 Feb 2025 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738921427; x=1739526227; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CagGV3EhIIkvwsRiywehjPahwoTfgx6dffbFVnlTpp8=;
        b=XL4mHHKwLUrugeeoswg+XfDFd+7Lw1BsRm0L7K/+bns7dVk9um3X7Xh5/yzT4TpR7g
         JJJb1KmagFh1HepkuGMEh/BpKAkJcj1eI/44NMXBMGELGeTwywSuf9PsCAUUM9GH7Fas
         +n2UJZbdo+mZup/j3/nwXnLyGXo2w467c3EveoxELz64kMZGwaS01E4tjGgOQbVVPt00
         OK4Dw0CEHpygqmFKLqJueY4IV2KxrFjRf9SIb3vc0whyaicj4qkAqDJl6NqIwvlLLMl2
         uElLEO9y9aNFC1jm4fatEx1/Sv1Q3UtoNK4bVOmmWGcEumWXML8wIp2kKYaUAD1vX9Jf
         0M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921427; x=1739526227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CagGV3EhIIkvwsRiywehjPahwoTfgx6dffbFVnlTpp8=;
        b=mQwRI0kBqqEePj3wb6F0hk+vOjRZONXEpEDA55+wezK8xKZAtJhYFLtRQCVKU3n6e5
         BNY475xCwB3+W2X2b5FbrlP442QuYzIxMWDQXXtpCHWG7z0+FAnwsVCyOy9+x5xbW4di
         xXkkaYD3XgzI7g3wUPlXTKQB12KZ4Kegz51jFs6124H8ppMv0X9GghNwEvbc+cKqVnCB
         xqVPqZjCnK2vO7HLcNxYKJ9Sz6iv9aksPkzhNU6MY0FexZW/W8ewlZ07dq5QhqLnEVEA
         YYpGfDT1xa++14xGYaaNgQiXDCdMe8xrZY19q6C6KdellKk1AoRzgr/+4ifK/JoFKCTM
         +QCg==
X-Forwarded-Encrypted: i=1; AJvYcCUxWvwvMWvPKIh28fHTSIFyktkrAIcYQ/mL5pLOJxIqFfRCW7D53nxpmkLTUTHWGXHzharICuBUJeUy2WbozrjomQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEkWohaSii8+cTXaqu8LxEua+ovOe4cYhmrIEUCe9pA9pbhtBC
	L4P24Hj6EdcN7VuwLpQ3RhvIPQi++eIIIG7tEMSs9XbrQq6QWuYGdvaeRFv4paoxbEWnU36vGuf
	DhXginFDiGG9hBsKisdTPMXINiCrGmg==
X-Gm-Gg: ASbGncuciWP8DQH0xxG4VxRfu3a5Ne/WA9wqGX5I95l+Oy+Ii1Nl9qyyeSMYyQLDrMe
	r1GSr69vSnui41o247Ee/YK+ewcqP2nKL53Bjw6996b9ZTZ0BHstl1ZscA3rfPmysGRVSJDc=
X-Google-Smtp-Source: AGHT+IFwYXhY0vsYI7YHFq/L01z2dYQ6+pA23Rll6gLRE+r/Etcpk+skR/34fpL3+jCd1siB2qtf8P2FbeOQIcv5Cu4=
X-Received: by 2002:ad4:5bc4:0:b0:6e4:41b3:4983 with SMTP id
 6a1803df08f44-6e4456dd202mr35700616d6.35.1738921426809; Fri, 07 Feb 2025
 01:43:46 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj85xWewvktp1OXPK71CGe4i=p80LYxLuU0cyQUOCH3Zcw@mail.gmail.com>
In-Reply-To: <CANNYZj85xWewvktp1OXPK71CGe4i=p80LYxLuU0cyQUOCH3Zcw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Feb 2025 10:43:36 +0100
X-Gm-Features: AWEUYZkpi9GRP3icI38V2B3u8Wp6MbQ_mcqD5iqQ8_lC5qdUZvEF7DjMLgA1cvo
Message-ID: <CANNYZj8rk4+jKVYCSr0JSeiSDgnd3yxkx0jZroSbbuLRaMZTQA@mail.gmail.com>
Subject: Re: proposal/plan for taking bitbake-setup into use - official
 configurations (with guaranteed sstate)
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 09:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210977

On Thu, 6 Feb 2025 at 16:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> 4. How is sstate availability guaranteed?
>
> There would be an autobuilder job, part of a-full, that would use
> bitbake-setup to set up a build matching the branch being tested, and
> use that setup to run builds that populate sstate.
>
> Then, bitbake-setup would be used again to set up the same build, but
> instead it would run a selftest inside that setup that checks that
> sstate mirror has been properly populated. We already have such a
> test, and such a job, but they work directly in the bitbake build set
> up by the autobuilder.
>
> Note that master-next (or somerelease-next) doesn't always match what
> then gets added to master (or somerelease); for testing exactly master
> there are nightly a-full jobs. There could be a short window of not
> yet provided sstate until that nightly job runs, but I'm not sure how
> to address that, short of asking maintainers to run the sstate
> population job from staging branch before they push that staging
> branch to master/stable branch.

Ok, doing this in a-full is both excessive and unnecessary. Rather
instead of the above let's run a separate job, triggered by new
commits in master (or stable branches) that would populate sstate (via
bitbake-setup plus autobuilder sstate tweak). Existing tests already
cover for that sstate propagating to CDN. I need to check if buildbot
and autobuilder code can support jobs triggered by new commits,
otherwise it has to be scheduled like nightly or auh, which I'd like
to avoid.

Alex

