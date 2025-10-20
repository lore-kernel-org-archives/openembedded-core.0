Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA794CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 11:26:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.15651.1760959564451919887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 04:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IoSXgFvR;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-88f2b29b651so626136185a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760959563; x=1761564363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7PwMa/VYUPXUIGr3czAtV9GUmW8V9wdsd2p/TzISCQ=;
        b=IoSXgFvRKKKATtEGIIHpn6jKYwsv6fbZahZUJ8ZCcddWSIPEYMvySlGxhpAi5zFwYT
         vkNEDx5xjagHm6vLN2H38HRW7NWadbiu/XEzxCbn19B6mvgGAhOZbv9O/NKLYMfzcrko
         Ma9xDm6HFsc80FBkuqJBVLtGPkfAhmHJRuxOAo4tAjISZkQFOhRa4AFYp7560aWCAGaT
         BRbfwEDdthxYWA1Af86+JcphObbwAYEw/WMTT3lK813ZpbmOJf5VyZjXIETW3o5ljwyo
         +sSY43h1KxxGvKRjKopw2sL2gS+NpKEteXkIDPmzjMbmkC2ofmdJ0nlXDla9Quip5UDV
         kCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959563; x=1761564363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7PwMa/VYUPXUIGr3czAtV9GUmW8V9wdsd2p/TzISCQ=;
        b=tQUTqxaLiSpFYrhOSGnkPvrKwEwx3/xirUcDg9l2Usmjs4oJijpP0QUPTxVhXLMBEJ
         pwxkD5HFFg95EQbxiasBkIvYWsmSKchLNx8QxS75VfTtZvbWgAuSqbGfZm4W/JPZhh44
         mr/Rd1LnFpaXMdSCKj3xf3gARWBIeSGisnXZOjX96bOvn9O83QsFfJwmbXun5xMq5aT1
         YuVE05FJG30cipT/KK9YMtzk5rtygUWlwijFn7QWvrhGKj3mCqy4DJLcmFEVylwWaJTG
         DK5fmqkJdA0rJaUBGwVJsk/phFoG3t+OuXExMOWZBk/YIp0fFgCI5sY9S6gZxout/IEn
         ecmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBX+tej5QqqLtteRVlke5+BVLGsxQ/0r1qWYu2b1L+0k6IMGtGrg4b51ASRYgPCvLwvsx3RSW7sZa7fx7CGGHKTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEJv7jjJcDgCDS0B6PFy/7MgZoiXZHBPOLRpkRQ/ohX+pMoA6x
	6Vk83b9HEqy2evFBOGKhREWuxK6No5XrEEgKQ9prmbY3uZqt3+tr8EeWVZqZRFfKEHDztNqgG8a
	dNXRDXiXY/pDyw/mqqukJN0jYOXWg2XM=
X-Gm-Gg: ASbGncu0CGfRPVdZgKjVwzIphDLVwWAwoVstNIxsNzPoKtNTEGhKPnZMeCukxAsdInd
	6gbpJpS+MWXTmTgGbrrvdOTBDqRfcOeN1WjKgfuRUZ5pkUFIZjjIhP2jAad37dxL6jNZugKy2Dv
	u4sC1UZh38x1mvU3/JZw0jYFzxZl2i444fO0rnQKKlzz700aPApRGv8cJN4meiUzFrKpyk5PoLc
	i5Av/4z93b7yfNf6Jthf6a94hHhqYiF8mTGEEbQMu6Zs2qCCQotr6RCrDQIbmHKVRiPxwYJ0+oB
	K02QoakRqmSjUJl0TcaS/5zVsEIZCXbup4fLJ6EJLmDJKHNdM0ZUVKBE5HHBkAwSm3Q7Ng9WK7s
	wq8EtzF8c1S17PY5sWA==
X-Google-Smtp-Source: AGHT+IFjyJjvSMDzLGfJpx7Wj5nUYy8i4VpvuijJqJ0sPwZFlibJd88XlGQWtVHPiiMDSvCK3Me9YUfHwhDKTSUH538=
X-Received: by 2002:ac8:5949:0:b0:4e8:b19c:d5d2 with SMTP id
 d75a77b69052e-4e8b19cf4eamr62263441cf.32.1760959563468; Mon, 20 Oct 2025
 04:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251013185934.GA114595@pevik> <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
 <20251017164332.GA355538@pevik> <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
 <3065c655cb09c8934022b9e9295620024eb3f94c.camel@linuxfoundation.org> <CAB1t1Cw=59ADv+M=bptkEMs4TAotCaE=uc8Nuw39wTMTRQq16w@mail.gmail.com>
In-Reply-To: <CAB1t1Cw=59ADv+M=bptkEMs4TAotCaE=uc8Nuw39wTMTRQq16w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Oct 2025 13:25:51 +0200
X-Gm-Features: AS18NWBJNJVDypFJ4bqZZ7XWGPP0yfvinHNUghX5JvJ1vd5j12rklXBB2t81b48
Message-ID: <CANNYZj93Z8njcksw-SG0REAW=81JPmidVzhYH99KGUa+NJxu8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Yi Zhao <yi.zhao@eng.windriver.com>, 
	Khem Raj <raj.khem@gmail.com>, Hui Min Mina Chou <minachou@andestech.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 11:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225114

On Sat, 18 Oct 2025 at 21:14, Petr Vorel <petr.vorel@gmail.com> wrote:
> I'm sorry for wasting your time, my fault.  I used
> git://git.openembedded.org/openembedded-core.git with
> git://git.openembedded.org/bitbake.git, which was outdated 2024-09-25:
> 29e67acb8 ("tests/parse: Add test for unclosed functions")
> I forget there are two repos. But lesson learned :).
> And thanks for pointing out poky repo.

As chance would have it, poky repo is soon discontinued, and everyone
will be using separate repos. Bitbake-setup will help somewhat with
avoiding the mismatches, but bitbake should probably have checks that
it isn't used with a wildly mismatching layer metadata.

Maybe add an equivalent of LAYERSERIES_COMPAT declaration to bitbake
itself, so it doesn't just check that the layers are matching, but
also that they match bitbake?

Alex

