Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84740C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:32 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.17157.1706278887751096557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1WSJSGj;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso714770e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706278886; x=1706883686; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GKve0wYAkcHR3uzh1qAf9aCXSYVTwY6IN16HxB6Sts=;
        b=k1WSJSGjfCLQY1rp/pQHoWF1JIBvW0ITUFeI6N4j5l7IyfVeoxbz26aFx51mTqaP8K
         vhRvgqnsRsK2adAIDG2o3lEtHg1NAcS9086BsPhQS9zvlbQ+uhJ/wdps45/4RKMuwom4
         M2ijNr/bjwdkalnQSpRyPco8dfrjlYnJTJzzUhIGAuB6PAxuxOQQOaaOg1FCR1P9CtjF
         wDt80bQ0TslC6337XYQya491iaVtsfOSgRzLuqVPe5f9HqELda6CPcb/LrDF6vVgsSiu
         pmvu/gHQDfKAHUSiz3ieNWjtXTWOgTkWT8wuUOC5mIYorpIHU3e9xDiQebQogeUH8/Dn
         lwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278886; x=1706883686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GKve0wYAkcHR3uzh1qAf9aCXSYVTwY6IN16HxB6Sts=;
        b=S5d/gRqqQQ9K4a8GOIrGAwRAmUBzqxuoqp1U4E9vq0gQ9uMJRsnYziE1OItdu69MA1
         qXwEMuwDcWaGRex/ogjfwNRd77IgsMeMTu4sIAr5pXU6t4XKTIZSIbc1qX5Uz2bOFwTg
         QluCEnpzyqjCMfq+sYk0YH0cEsw7F/m82Qgjc5HuIELzs8QLsB/ngfwyDe+bsugMHhPY
         hm8V1RJsu6S2PWmawypoKwVIwjFYHKfTHZtk2Guge6ZUyRfUoSuAW8+Ey3BwQOaT00H1
         kpftpX6ylDVc4UE2mhTh3jcs7IGiY4OEXlKmlJJq62tVFTrnXR58RzPybjYuKrPbH+vO
         eWIA==
X-Gm-Message-State: AOJu0YzMJ9ke+uN1aqI6XyhcCAfzysLg/wbhni+E2dOya/9X26dcL1Ng
	8r/RnLbbSs8UKALdAsSqx57H3uqj6UNsz/dCm664B6ue/WKYn34RZ+HCLLoqmtIEg+kJNfrpH8+
	LPgeKGAkLzgIrT5VeE5pKtijdxAQ=
X-Google-Smtp-Source: AGHT+IFzIi+GehE5mDuH9r3FkxQ1RtkYRXiFmzn3LJFnZh25HTSylkTmOSpBuLVPKQ+AQ1X3qler18N/9kqbmJdGNL0=
X-Received: by 2002:a05:6512:6d5:b0:510:b6e:3ecc with SMTP id
 u21-20020a05651206d500b005100b6e3eccmr446012lff.193.1706278885627; Fri, 26
 Jan 2024 06:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20240126133455.2609378-1-alex@linutronix.de> <20240126133455.2609378-7-alex@linutronix.de>
 <7c6c18a0f2163e4303c71b50ede0b2baa9553fcd.camel@linuxfoundation.org>
In-Reply-To: <7c6c18a0f2163e4303c71b50ede0b2baa9553fcd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 15:21:13 +0100
Message-ID: <CANNYZj9SNJ3qRFGzkMgVQ=iyjRE9poSQ=HXJ10-q6VR7bW8hBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] oeqa/runtime/rpm: fail tests if test rpm
 file cannot be found
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194383

On Fri, 26 Jan 2024 at 15:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-01-26 at 14:34 +0100, Alexander Kanavin wrote:
> > Discovery of the test file was happening in a class initializer.
> > That block of code cannot fail (it's not a test), and so it
> > falls through to completion even if the needed file could not be found.
>
> Is that true? I thought a failure in the setup function just caused all
> the tests in that class not to run?

I think I didn't formulate it well enough. The rpm test initalizer was
written in a way that it would never fail, even if the needed rpm file
actually could not be discovered and the variable for it (used by test
cases) would remain None.

The reason for it being that way is that the initializer runs even
when the build is not-rpm based (e.g. ipk/deb only), and there's no
way at that point to detect absence of rpm and skip the whole class
(various decorators can be attached to test cases only).

Alex

