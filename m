Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652D9C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 19:10:30 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.83784.1674241828205918773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 11:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PkOCGLfa;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id z7so6545343ljz.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/dTdUJpQytQDi3TEcBqX5Uz4L/lQlmZ77QfXWT/iFA=;
        b=PkOCGLfaDGa6cVJaYLTPVLCJebfbiDbmuz9HXU59fCTKcMgxeB7Z+HsFFf60nRkIMI
         qWXdnZhGUPvfY7WX6EUQbvAULQa2FC70w/LUww0+U3WZtXH8KwfmsC1m5T3sh5cjfJrY
         Qq7uwhqVyhmZHzD9A6evqzOCYfLHrSccPlDvZG8XJ9eN8TXgLnmXREYFZo6jklT9316n
         K1U/PBlJ1QbSS+wtNbFBJ3c4JqdPuyxH3KNmExNkFiwCG0B6e8sBVQtU9bfeMGu0WjeA
         fvKkwM/f5jfEFv7lpOyJXHLvgFSF+y3TXuYJIn17S/5F6LvHySf42BSOi7Dg7sHhgNbR
         G6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/dTdUJpQytQDi3TEcBqX5Uz4L/lQlmZ77QfXWT/iFA=;
        b=455kDhfylwKg+VhnPMZfrw5h4phdGP2+8jURWHVcB4EZLVQyTOXivu6vJjAwqLt+rf
         jQ7kcgQX4sUquMvtkD7xeRPVvDv64URWGlDKpLk8ud1fv6eWFWBfYE7CFQylQE5SV85G
         chTJe1pif6QV4t7njSZYFNASkcMcPhdIKi96TI9tdpKv0V8tmoFUQcuOAQWe1/hz0+oR
         LVx4yp7f5k7ePh38jHXMmHoaSBzU6dpKyDARQ0vUnyORk8rp/BVh/qXbpygLL3v5ocTS
         VbVMOLFuoOS2VEgAB37lifzUB9iqoUqV4Ypy1dC6vWNg8tJFvd1mzVdzeD1wITKLEzfM
         ARcg==
X-Gm-Message-State: AFqh2kqj5CT4DSM/jaLxG2Nead/Wb1Gt26Ihzcf7atZnRIxYxMyGn8MA
	V3A+j/l1XgzAnTLQ2qMXg+6/FFm4sJz2BEuvrbQ=
X-Google-Smtp-Source: AMrXdXv6FkeCbuvjcNcBCBz7eLNDvXGXA1qMqjn/eic7W9Akw0qm6sXfmYc+WMinB5m6QZgzDQF3ngI1NqBPU9ICIFs=
X-Received: by 2002:a2e:b042:0:b0:28b:6d42:c63a with SMTP id
 d2-20020a2eb042000000b0028b6d42c63amr1496207ljl.45.1674241826090; Fri, 20 Jan
 2023 11:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com> <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
In-Reply-To: <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jan 2023 20:10:14 +0100
Message-ID: <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 19:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176249

On Fri, 20 Jan 2023 at 15:26, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> but again, I won't insist that everyone does that
> on submission, so not having the warning/error disabled is just an
> extra load placed on me.

I'm not sure I understand this. If the appropriate upstream-status is
enforced by bitbake, then any contributor has to get it right before
actually sending for review. Or otherwise it means they never built
what they're sending.

Where is the extra load happening?

Alex

