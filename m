Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B43EDE9AD
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 11:53:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10102.1694692393358476718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 04:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=osQzeFli;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bfc14e6d03so10868731fa.1;
        Thu, 14 Sep 2023 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694692391; x=1695297191; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4P/vUFfYpo3vZn+mxT0FP/PjJUy6+y/8pdEv0ZtUQo=;
        b=osQzeFliGTuu8700YJNY8/r4GNOK6S5otL0BFMbur9fWcGwzSyHtRBwNq3whotbb9v
         gsRigkMPfJfb7mwL7FlVHME69MJUhOMyUtOpsAXlH7mcz8NUT6FFOa9Cnz4KVpcUfdRe
         yOMogpBx/UVGuFS8ubN+ZFOwkvph8BII6zJHSWr2b7NiUXHx9mgDb2G2B67rYzsYtBz5
         cQ6VdWa81XP/bia/HVyCt5GM8iBUU7ADSaNi7uy6MmKM+CrkOqittQcG8PCCOYKF7ZVN
         QNOFphxxuBfWX4x1B+2cieRVWQLSyn5ScH1Xo3SsVCakDHxlwKn2wuDlU5jcJEI0b5jw
         yLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694692391; x=1695297191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4P/vUFfYpo3vZn+mxT0FP/PjJUy6+y/8pdEv0ZtUQo=;
        b=A5tZk4aiSXrF4J/4m5aNU+oEtgmwajXEtuzD4kiJtnOBR3LmrpWNPW4EW2jNaIh6bg
         pvN4o/e7p70x4VxPc7qrJDXtZt2nDFa7N98rltqPhRHsWgqcQSjZQQFu2Fjgvdkt6hal
         /NDkNarcp1iIIIU+mZR4KLheuw/7fX0GcpsqfLG3ZHaDsNXgtAUCBafSAXWYGlFsKxOm
         daVpruZFSC6UsEyQR85vpDjcuF1Or1qeGOPIzcuME01RuAVDIxb/Jj4vPgfKuZPKR3ZO
         /fzxZ5a6kJWrgCl7qzyI2v51F/4H2hMJbdaS7Q297ZCjlY5KJ0Jc26sjhTI/g3NTxhuB
         0DSQ==
X-Gm-Message-State: AOJu0YzrKKqs46w4zg6rSoHFERD8roOxSJPFDOaSRDvWk8mJDlsbSHJI
	4qTsmKIuRHbZw//41NRxzA/n4ktaqvVwzseuZP0R5jLGarY=
X-Google-Smtp-Source: AGHT+IF2ZEl3sZW4LpiXyW4jOJKnxZK1/uFGYXjK5PNq/mQ2Ye2tXu0C98xNQUcP6hixEHnm5OJnbdCze2Dh/GbTZpg=
X-Received: by 2002:a2e:981a:0:b0:2bc:d507:6ee with SMTP id
 a26-20020a2e981a000000b002bcd50706eemr583548ljj.7.1694692390963; Thu, 14 Sep
 2023 04:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
In-Reply-To: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Sep 2023 13:52:59 +0200
Message-ID: <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
Subject: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 11:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187636

On Tue, 12 Sept 2023 at 16:44, Stephen Jolley <sjolley.yp.pm@gmail.com> wro=
te:
> Alexander Kanavin will be working on the core workflow topic

I am now ready to start doing this, but before I do, I'd like to
decompose the subject into manageable tasks with a bit of help from RP
and the community:

https://www.yoctoproject.org/community/yocto-project-engineering-request-fo=
r-quotation/

=3D=3D=3D=3D
Core Workflow =E2=80=93 Process Improvements

Background

The project builds everything from source by default. This means it
has a reputation for being slow and heavy. There are ways the project
can accelerate this which means faster workflows and improved
developer experience but these are currently cumbersome to use.

Rationale

The project aims to defragment customised embedded Linux. This is
important as if we succeed at this, it gives benefits to the wider
ecosystem through making it easier to inject security fixes and an
ability to share and collaborate without re-inventing the wheel.

To do this, we need to provide best-in-class support and compete
against binary distributions for usability and speed. One way we can
do this is provide better support for binary artifacts via our sstate
mechanism. We do already have some of this functionality in our
=E2=80=9Cextensible SDK=E2=80=9D or =E2=80=9CeSDK=E2=80=9D.

Deliverables

Enable a public sstate mirror via a content delivery network (CDN) and
populate using the autobuilder
Ensure CDN sstate is reused under normal use case scenarios,
particularly for slow components like rust-native. Identify any common
sstate mismatch causes. Ensure test cases are added to cover the use
cases and prevent regressions.
Add lock and unlock commands to allow specific components to be locked
down to specific sstate checksums or allow them to vary
Allow switching between eSDK and non-eSDK modes
Add tooling so we can understand why something is rebuilding when it
isn=E2=80=99t expected to.
=3D=3D=3D=3D=3D=3D=3D

So: where to start? Do we need to 'design' something, or maybe time
should go directly into addressing specific sore points? All feedback
welcome.

There's also an unfinished patchset for adding bblock/bbunlock, which
I would prefer to *not* 'take over and finish' but rather see the
author get it merged:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D15276

Thanks,
Alex

