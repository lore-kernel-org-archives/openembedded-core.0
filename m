Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73836C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 13:06:02 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.65018.1742907956579219423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 06:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExUO/oQU;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so16926126d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907955; x=1743512755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFKpYvBJvLroSJfiN91AbPzWkjjJyvw3dE1fqGCkMXo=;
        b=ExUO/oQUvT40O3MIbnj0Qc0cWH3tVCWMPIurdirg8TsIUjhqrqbAJqGuHfezU05E3/
         5QE4g0iU5ZgPuysGoy4PUeITao+UzpGn1SjRap+t3AE8S3A5GmTa+lKxsPDj1eSH+yQR
         RY22dYhoEhJqJxLEdVlCTEcyv/m2837kMMGYf4QIMDLT3opTw0bqnbIpqw1iIAd/zPsJ
         IZyAxiCrj+hh/a501ZtaRS4mHfYBe4dP5XMPGtHuHKL7EKWsMHcUKba2utmMRB7MophL
         tYXivvKONhSgUd5NyVpPOFCOS2ndrbEIRcYrDwO0DjclFMiFJ6ZA6IEJiEJFbRLwULw5
         XIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907955; x=1743512755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFKpYvBJvLroSJfiN91AbPzWkjjJyvw3dE1fqGCkMXo=;
        b=gNSj7BMXbN1nhYGxQpbywHIDswOE3wXqcS3fDjVwhYflhmX2Im9gsPDCk9I7A87GNN
         HSgNoB8aLD5PMAlrjiyJ507iAX9FyKYDxL197C5gX5hSaYapL7eIhmtJTSdsz2JzkQ3/
         ETOm3d8wssQWs4dltIV8Rsd5ZAgWuqOHi74LH1sncrjUjvEUfIMymyi3EC4QEakbc9B5
         FGI4nE06AKOe45Ac47vgIG8t+t813vWdB/FfJuiANpCNBiv3aFxjYRjQVG8oTHvF59Rt
         Q6NW5TeUtEE2sMnWen9p+uoPC1PL8VRk73qp6UpMMxaSXx2q2PRWk8F7T47Qc/8MTuX1
         NlTg==
X-Forwarded-Encrypted: i=1; AJvYcCXj7JgvsdGInHgpg/4d00i8BJvjMrIpYkmCg/ktJ7mKY7dtIZvilNKMZdZZB/WdQFDp+nbrDeBLpAReyQZZ8cU3Hw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyECG0EMDt58xm4LNlX6DACqPKJH4Zb/L1t8NywxNxCZMPs0LoF
	s2BmTei6hSvSHsZZgh/6xaOkCasTx3z6yg5i8bjKdHB6rD9GkYsuveEHjBHCfD4V24qbKVyQ58m
	PRJTRx7vJhNFzagi3XCcbMZGg2Uc=
X-Gm-Gg: ASbGncskngk75Kwws2LVIl3qECQPXS3d+jI/lSHYeRzcnPGIiDq+K2cvx3ZLHsjNkJh
	HW5+1l+DciAzrw2EWXne5UQMfrl3QN9Kz50I1ULIl2QxFZbWkGlIeU5GsW43kRwcHBMR+MPYOKp
	5fzzeEIv6aZB0L/J08p8xhHd3SVyhMr+5ACuleQEf3bHvpUa11AVVWZ3//XHpr
X-Google-Smtp-Source: AGHT+IFrJg46+2AA6RPnIWmkpVu31CbEipjAEcZ/sH4ef1lsdcI8b0KnsTmBciMzPHBcdcdFgbTBz/yBlagw2Z7E+W8=
X-Received: by 2002:a05:6214:766:b0:6e8:fe0a:7031 with SMTP id
 6a1803df08f44-6eb3f3b9b97mr234525126d6.43.1742907955406; Tue, 25 Mar 2025
 06:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org> <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Mar 2025 14:05:44 +0100
X-Gm-Features: AQ5f1JrW9Zh4gukQSIN_0dgfrFGXEx15e-XrDYZMLxNCFruwv4KrAkb6g87-TtI
Message-ID: <CANNYZj_5Hd7J2OoNo6ggURCT7n8Caeg+UBhJ2vxQzi80Gbr7zA@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 13:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213602

On Tue, 25 Mar 2025 at 08:18, Mario Schuknecht
<Mario.Schuknecht@iris-sensing.com> wrote:
> unfortunately I cannot reproduce the bug that the do_rootfs task of core-image-full-cmdline fails.
>
> I used the git poky/master branch, sourced the environment, applied the patch and startet the test.
> oe-selftest -r runtime_test.TestImage.test_testimage_apt
>
> The do_rootfs task runs fine.
> NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Started
> NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Succeeded
>
> I see the error in your log file, but I do not see the reason for the error.
> I am not sure if the gnupg-pg package exists or why it is not installed.
> Are there more detailed log files?

I suspect the problem originates in 'debian renaming' (seen via buildhistory):

packages/core2-64-poky-linux/libgpg-error/libgpg-error: RPROVIDES:
added "libgpg-error (['= 1.51'])"
packages/core2-64-poky-linux/libgpg-error/libgpg-error: PKG changed
from libgpg-error [default] to libgpg-error0

It appears that somehow dependent packages (e.g. gnupg) aren't rebuilt
to use 'libgpg-error0', and at the same time apt isn't able to see the
newly added RPROVIDES that would satisfy the old dependency?

I don't have a local reproducer yet, trying to get to one. Plain
selftest passes for me too.

The easy way out is probably to set PR to force a repackaging?

Alex

