Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661AFC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:51:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.37855.1738839103691623333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ddb20qLR;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be49f6b331so58287085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839103; x=1739443903; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6HCg0O7Ntu+SwlUYWWjF4QOx9iPmbStXMkn714Pcnk=;
        b=Ddb20qLRQqxoQ25bbwCjBgW/aO3V5hTvg7LsYKuIgzHZB4jkYM2R0dimsM0IdxJxZk
         FipFelCSZZQLSCt10ElfPBS7+JEm7BikSckuH9kbGALKiXoA2tk1nFo8p+mHW98hJ+y9
         ETxPx7NMkcYb6qwrDBsLyIu6PEjQHFopZtUup/ISGphPDx6JfX7ivlAepn6TOPhbYgP+
         ydNXGIJ5YRAovkqzFXebhg1UajnngAzgogzEqwYqPTqNKZoQtuYUVW99IfgEKK+u+UwB
         oASvOPgoRE8V8Vh8UrZMkH/wwQX/bEcJ/a3TMMtmMY6J/1ZAF/gLCtKzlziU/DRK7ZsF
         0WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839103; x=1739443903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6HCg0O7Ntu+SwlUYWWjF4QOx9iPmbStXMkn714Pcnk=;
        b=oweuhOXUtC1pA8aIrBlYNYeKFKOvTs8rktP4xx7yNTktRniQZX9Cnqu0ivk4d+xnTc
         VO8Ufc5yV/FjAYXnyYH6Ay4o1MJ6QZHbzXq4MmhaxKiG7d+x+n4vdCz8LM+svnVbbPIv
         VZrbSMKLtgoQnuNdunwn4UF8XPVB/PgfbuJ3nuYa8Croy6geyCj4hLtWntnLSvU0kAQx
         bfiugAb3HD7MEnAVQ2Lnfyh1EIWD50uOg8kMqy69YETEL5coV/5XgcVcR36maralxhpp
         kDU9VHq2gQ0oHrw9737XqhOuowDCui2TD9wfZTrbVXQHStEDAgcc5Co2DwtMZsPBkaNP
         006w==
X-Forwarded-Encrypted: i=1; AJvYcCVlKGce4q9afxAwxZoKa06ZN7+G2zL18yY/EH+34XrIFCJbIBiQlYfzge+JwZlUBNZtIgnqV0Lz1zS7qwJUOo4TRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHzWeG+Ti6BYzxjXnUIB4s9zokmJhwAtJEy2TCaFYOn+eGXZz4
	lfwmWbUJAGV1+ZK4ggC013Sgf2P4tVtnGJmm+cL/XlWlujdzxsFlD1Mr7G3Ui71Mw+0eHk7+ZN8
	7OAI1upB5+CI/6yNALF2eH5qHOQ/oeQ==
X-Gm-Gg: ASbGnctnBjwfPZ2BchwfyjfDhosxgtbhUu+E6Rmqhn+oUxE/zHzGwJPiI1zX43OuGE3
	MYZNcINI3ubfbDGLrSyPyoUIRBw/wNAIpd6/8EwiVo3SWb+TtWBa/iGN2hJkJXqtJpDyX+mFzC3
	yxk522Aorc4lXJHEk1Kjz5XiuE5yeUVH8=
X-Google-Smtp-Source: AGHT+IH4OXUoh5ohfa3ij4ym/8+rUmyqW18RQcv1lnoH7tDfGWfos4WDUefTgzamF0otephyO36NKdijL7SFU5OxS4M=
X-Received: by 2002:a05:6214:252f:b0:6e1:a36b:3442 with SMTP id
 6a1803df08f44-6e42fbb9ba7mr91659426d6.17.1738839102711; Thu, 06 Feb 2025
 02:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20250206055222.3319167-1-zboszor@gmail.com> <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
 <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com>
In-Reply-To: <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 11:51:31 +0100
X-Gm-Features: AWEUYZn1hage73YkxvjxUuFPV8_FMf3sH2L2cfQriMc9-Y69_JrGEM5ILbsSzLc
Message-ID: <CANNYZj9KVxZ3J=7pK+DO26_MrGEvwL+HZD1hK4vkuQM+Epd-rg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210917

On Thu, 6 Feb 2025 at 11:42, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:

> I will try to patch and reduce the dependencies instead, as there's no
> need for building the documentation for the crypto policies.

This would work too. Those aren't trivial dependencies to fulfill, and
they're unnecessary for us at the same time.

Alex

