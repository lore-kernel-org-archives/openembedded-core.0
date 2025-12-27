Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001B3E9271B
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 18:18:19 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11933.1766859492816373586
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 10:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aB5whTHK;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8888546d570so115474626d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 10:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766859492; x=1767464292; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sK1WRmsCorbgntJ8h8eA1tVD+gHomJyDPkUaYHhTCvw=;
        b=aB5whTHKLp1UcBfs2Cf6psGXzKdKYxn333ktTjSeiUgXXUHsTwk1GZJ4M1XkDOOYax
         v5fVvmaXg+JuFEJ2ooT9eO1ApV6O5TDVKD/xixx8tOMQfaeeDQJEPuOdndWHqxiFFUYz
         MfPnUSyGlH6BR+UmJcoiFXNtqaOGHzQBMtjVAR46Izzr9chXEJ+iv6Nbsg9XZVVkvgnV
         7E2trmtIuJgav1qomATPYbczu2I3XOlKKwqzTvG6ReLilqsvJwhwwOj1B5wsDKkuqHgw
         TNZzujxwxpYqA2/OWbnITfmCmJ0csioyp4UDy8nty02mBFuEgvL99FyooFVV9kzA8Yz/
         Qe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859492; x=1767464292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK1WRmsCorbgntJ8h8eA1tVD+gHomJyDPkUaYHhTCvw=;
        b=K+RrJToHIFUv+Fhmw8vM8AukM0zUe76YvnuA1eX0GTkuQVnirApvyjqAuYbWoX2E24
         FL7Kb+XqcbS/y8/uHjzKQAltWEyituihF6czPs2rvGJ1N/VH3VZeZECrfZHaB9yVplRk
         QhFH/V54TXgHmIjWaUkVvIGgxJmtuGZnYBXqzHdrpKrFf9fBaxx5NKo1+KZBVahclKlk
         L88ryOuUKbGziOIwiBVeqYfWPoILViVyS1eLl8uHZ6YqwV1uxgSZRpmU8TbonsIRi3tK
         rCJ6Awuyl5vuL7pnne8SwuIpwSjlZd2C+rbvkXegZNA4bsXOcuxHZ57rrkyEHAS3Xp7Y
         v56g==
X-Gm-Message-State: AOJu0YxZhA//AOIFpaOUYtI6YXIX8iiKlEWbbagaojmfq7zD3K1PmKEK
	KNTql9aX2cPjjZk4eNBRNAHVUcGkH+BsALXSlWJGMR5BWvoT0G6xSMJxrN011aSneKsRsx6vPFn
	s0aysYslYSeLskKISAGU6Wdd2hQi8sBc=
X-Gm-Gg: AY/fxX4xTpBudiA3DK/jdmDx+f7knC4sMcihgRArBhN9t73GZbz/CDStoX8FfRubdOY
	N/GCgSQ0sYhWpEWgqs1h/9uMrczjpeRrcN5Te8tiiJkxg99sMP2OuWXXHcZx90gFgjgIgcEzzBf
	Nk5ZEVpr7mMDCm7bcBPMxFOYSVyU/dl8skQv9F6Lkem3I7xg20QFrCmbP1R9W2F2as4f6w8HjD4
	ePxd8BsApDMDZtq3HD779+VbudFj/d7ACXSvVbIdg3VadlqOiU/1VKqgmNU+6DhGcjBSw==
X-Google-Smtp-Source: AGHT+IHxvb0Gk6z3dd5qA9+t/4bSfgpj+0P9jeQLZC3o0OAXUEh1PiPjaVs5kpvgg46FiDjni3EpIZjFuKFJcRx/knA=
X-Received: by 2002:a05:6214:4103:b0:880:298b:3a6d with SMTP id
 6a1803df08f44-88d876066eemr448174876d6.35.1766859491728; Sat, 27 Dec 2025
 10:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20251227172301.1967831-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251227172301.1967831-1-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Dec 2025 19:18:00 +0100
X-Gm-Features: AQt7F2qI8rP7m6lONgY0ZqjGr7rL-wYGBLnzezMDXVwn8Z53JNWGKoTZOpVrDm0
Message-ID: <CANNYZj_S_korZ_5ywcBwdSugFqMbWLarUJDHwfs9qGU_bs8WGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fragments: add a 'devtool-ide-sdk' fragment
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 18:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228579

On Sat, 27 Dec 2025 at 18:23, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
> Add a configuration fragment that enables devtool ide-sdk workflow
> for development and remote debugging.
> The configuration is intended to streamline the development workflow
> where developers can modify recipes with devtool and debug them
> remotely on target devices using IDEs like VSCode.

There are tests for ide-sdk in
meta/lib/oeqa/selftest/cases/devtool.py, should they be adjusted to
use the fragment?

> This also includes the EXTRA_IMAGE_FEATURES from
> root-login-with-exmpty-password.conf. Ideally there would be a possibility
> to define fragment dependencies, so that this fragment could just depend on
> that one instead of duplicating the content here.

This is somewhat more worrying. Having the settings bundled into the
fragment this way quietly opens a big security hole in users'
configuration, something they did not necessarily consent to. The
original fragment at least warns the users of the dangers involved,
this one doesn't.

I would much rather take an opportunity to set up proper key-based
authentication or something else better than simply not having a
password. There was already reluctance to having the original
empty-password fragment (because it's the easy way out that only
delays solving the problem properly), and spreading these settings to
other fragments makes the situation worse.

Alex

