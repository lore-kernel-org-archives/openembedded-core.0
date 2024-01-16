Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7000DC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 11:23:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.11135.1705404182537579337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 03:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K+Jsxz5x;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e78f1f41fso10261231e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705404181; x=1706008981; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k0vTzHcCk/R6AkpSJ1Os8QqnTvuvOh6XC0+QeaLGILc=;
        b=K+Jsxz5x7WG3/vnCfzBmosvRof1qCoDLX8vIi57RMJeZIwpP8cuKRnGnIHgCoCBJ6C
         V0oce6btUzd6gFXxCJX/Nyc1VgAMBL2X1rYnjU75vL5O/+OtdyORKgH+hTBpZHWhFEvl
         wQ1bIjwFXfr4LyoEhXn9HiRqIZoEm5XfgyuPmVkF41IEiUR4VpBnP7/dwLJrQ6pppnNH
         /Fp0bjreTO4eBg1SiZw6D8I3EWCHYDMoEZuyu9NOAHBUJ0/dQtbYqXzk9EU1eX5uXx5o
         4RYvlTH1sJSlv7fKfC7OzXbG2jzO+JHYV/Fh7ZA4j8d46Lfubnr4sw5oRRakawdLZSlo
         1LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705404181; x=1706008981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0vTzHcCk/R6AkpSJ1Os8QqnTvuvOh6XC0+QeaLGILc=;
        b=D83aUmlvj9gxFRdDvpWVaYip8LsAIbVXT3lLvRCVont79KSA0YDOBwtvLBzJEFdYGS
         AoWZCQl8AjuIstfr9AdLxKZnTbvLv0nG3l+fMQETIaHaAANuOFKBZQeOUP556LU3ck6I
         2usufVJ/5lTUXzK4rV6UNtoRj64x8ahud5B4o94QyuP4HXdvmIt1dRFHO1HoJQb/g/3N
         YPIKR7xgzYmpbHOinbmoKHKpHBdwyzbjAGaKUWqPDDn7DgY2gU1TtAaX/slx6bV33mBz
         +ruccS+YWNxuYBtEEIXe+IcTzyIUsaBqRV7hauq+Cotv2xw0Vm9tyiu9LR8GpYqP99Yx
         WXqA==
X-Gm-Message-State: AOJu0YxusMX5cd+i5huwdgui/wIhdf6WhrcDxHE2T9WTvjhU0n6SSRMB
	llm4PxrLv75N+m/QEGK77PWBqW4h40DIQtP3hYM=
X-Google-Smtp-Source: AGHT+IE+giqCjXoyYxtJX1SP0mteNkJWgg2XvVvfnhYGrxDus7HWLfwZRsu9wVdIo3WovTWXBra1U0ridKTWzQWDuto=
X-Received: by 2002:ac2:4adb:0:b0:50e:935a:b682 with SMTP id
 m27-20020ac24adb000000b0050e935ab682mr2604715lfp.45.1705404180591; Tue, 16
 Jan 2024 03:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20240108143857.2316-2-jermain.horsman@nedap.com>
 <20240108143857.2316-4-jermain.horsman@nedap.com> <CANNYZj9umrn2k6Z=+Q3cmEEg=x9TDWBUFwuVZSVUxbBHbhFEHA@mail.gmail.com>
 <VI1PR10MB3182B4EA15E8E4EDC4F7F879F7732@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB3182B4EA15E8E4EDC4F7F879F7732@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 12:22:49 +0100
Message-ID: <CANNYZj_UPz=8T7neGos_-fZorJ_qPWWNV7rf31Oj5T8=oXA1Aw@mail.gmail.com>
Subject: Re: [OE-core] [RFC v3 1/2] bitbake-layers: Add ability to update the
 reference of repositories
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193857

On Tue, 16 Jan 2024 at 12:02, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> I did implement a new version, it is available on the mailing list,
> it should include all other feedback as well.

Thanks for persevering; the last version is good, so please re-submit
it without the RFC.

Once it lands we can think of further tweaks, but I think this would
cover the majority of situations where people want custom or floating
references for some of the repos.

Alex

