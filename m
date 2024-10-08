Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D73CEF15A
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 11:42:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7063.1728387765546994697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 04:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lXdD/UOq;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398a26b64fso5383721e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728387764; x=1728992564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t2skEyw6zFxypG5iguKcRa6kdkiDr/kDj2fB+dTgI30=;
        b=lXdD/UOqA+rsdnSyEkitHbo43dhNaFUB3ToHsLiqsVEZADew7tmudJ7BAf+DgvQMn2
         JboPhTpQ77nGnxBIA9Ba03nLpeWMHcEZGbUb4aob1WXkPqz7cqhI97idN6YDW9YgvEWZ
         TylE+qnEj4woUKAXlD9M1yTh9SmYs1A5L5HUfpzOr04pi8nA98IPEvNSMc4jwf9HhXlh
         i2YMdvNkTfEFXW397P5RcUV4CBTGxycUjYrorTQmM0TUpBFRIGKxzGDzaQ2JlkYLmEVJ
         zUwgOpSz1LrfZc32fcjAEBfaxvJ5gpL0maLJ9d6KkYwEJzYj0aBMnoYWMqwIrtlOhN5H
         HtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387764; x=1728992564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2skEyw6zFxypG5iguKcRa6kdkiDr/kDj2fB+dTgI30=;
        b=rwnCU9dne6r0410UUM9a8G63qFIf4rqDQKdPN96Mgz/FYN0gH08yemqhRtYpSzj5QL
         IFCSkzJXZbCaOZYwzvlWdHrqEht+WtfiG9f2h92vjMRXXZGnlXmhfNEZLkxY3pZlqesI
         whn59M82MM7WIudAC1nxFkBTuSrf+/28BiV1EJtUstcvJOWY4OOHn/+Jhb0f/qp/whuV
         kojwIn90m9JDXxNWuYCbhfMhgb/uaOfMc0rz6DCMQ/ZpJR3cmUuZBXViMpXWAyhdwo6V
         zFuB57C88rs2H+tci2xTgtcJylRpyV682ek8Bp6Y0H07arjs1j1ADhv20YdstDSaY+Qn
         oJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3HP3KSMDjFLdqDqYcvIozm4DsKJzb90FbjGI+/psv7Xvc6E18HHyl/N1pdO+26wzLHtWmgzK9+nvhlaaGaKdivQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIFeZUk3M1TxaWKWuZjXbRHWnSdJ++hpSJVA9TPFdeCWmIkc4V
	kbH610nXf3xFFI+/xKdEfwfoCF/b5EKOi1zfP2w/sWOLisNF8y70vQa3d8x+IZqxEN0ebQ0NOc/
	uxh6MNnY0rgT4nXKMDgVKQ+mntcs=
X-Google-Smtp-Source: AGHT+IGi1AIvvQvKU8wOULjE7WPyciPxS4XCVsP5drO98TjABbsUg2ubzhw9De6feRjUwcEW5bF+McEwh1UDC6N/bes=
X-Received: by 2002:a05:6512:3b8e:b0:537:a855:7d6f with SMTP id
 2adb3069b0e04-539ab891f52mr7978100e87.34.1728387763259; Tue, 08 Oct 2024
 04:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com> <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
In-Reply-To: <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Oct 2024 13:42:31 +0200
Message-ID: <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
To: claus.stovgaard@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 11:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205288

On Tue, 8 Oct 2024 at 13:24, <claus.stovgaard@gmail.com> wrote:

> It is a build time dependency as I see it.
>
> if foo.bb is setting DEPENDS to include "bar baz and qux" to indicate
> it need it for compilation.
>
> When foo is added to an image, and we then populate_sdk for this image
> I expect that the SDK includes the dev packages of bar baz and qux to
> be able to compile foo with it.
>
> This has working until now as the SDK installed the recommended
> packages.
>
> The key is that process_depchains in package.py make the
> recommendation. From the comment
>
> <snip>
> def process_depchains(pkgfiles, d):
>     """
>     For a given set of prefix and postfix modifiers, make those
> packages
>     RRECOMMENDS on the corresponding packages for its RDEPENDS.
>
>     Example:  If package A depends upon package B, and A's .bb emits an
>     A-dev package, this would make A-dev Recommends: B-dev.
> </snip>
>
> I will start on creating an example on my github account showing the
> issue better if it is not yet clear.

I still don't understand why the standard SDK population mechanism
doesn't work for you. It does pull in -dev for everything that is in
the image, so where does this break down?

Alex

