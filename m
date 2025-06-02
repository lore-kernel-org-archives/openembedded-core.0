Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B365C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 08:03:34 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.44298.1748851404220951427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 01:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvX6f+sx;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fac7147cb8so80986196d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748851403; x=1749456203; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3fENQXt2ndKj461iayFEkwYia1AfaI6XTUKpge5Kqbc=;
        b=QvX6f+sxdyQf6ZU02SpTlz0F1vezK6EehUF8Gv3aXXIVSrJ9A32nfFZdFpgvGP7VnO
         I7sDPnsU3Z3nDv0QCJQNSNtsXYPD30Zv5GlwNxwxQMD6zO/5WEoSa8a3zx2BQ1PLbnU0
         asHWXvBxg00ql+Iz/06leYXdT6oFdIG5GB3mt+AOQVu537Kdgt4jYk5I+9cz2rVEdn89
         dSblGvqQfWXdA4G3TxXcT3iX4tfcL6OiXvZiOIYLVOh+Pws8ciLf1XDRG2G8P794X3B5
         mTPPF7MLYM/VujM9A4WGbERnkJgDg+yQfUHRqDdhFej52G06iErV69ghn2vZXV3tgyz8
         iShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851403; x=1749456203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fENQXt2ndKj461iayFEkwYia1AfaI6XTUKpge5Kqbc=;
        b=cJ9aMY22zrmb8P8ePI1fZXJqyjRdMrfYmktquzdwWWbPm5ls+OFj57DQ2ptP3+59dY
         tz+66roRgCqkWn0NgTc1f6tZB/9Mgee++6eN5gRMprvKEZpEis9LqaYvEBtRSVKd1LH0
         SHuKmqytRMBOLluqTBAWCWEjvXAdVY4OPfMwRib/X+hEBvDruTmFf3ltVG8rwjeK0CeY
         W5KjHRoyZmm/IOzdZrHEp8fnblIFK26TB57YormJnLeWViuRJvNH6dfEdNydzqIb7qnE
         G+C+AONSkz140zyJHEsdgIuF4bz136YxGDNcxhzN8fc+IaAFKnbAe9bpcET3rvB4GnN9
         UsDQ==
X-Gm-Message-State: AOJu0YzItCBu8jMUacQL4tC8EF1v9rgyzBTDVJ+CiGxM7MIaJ/cmHY78
	gXPgniExaOysnYEWcbbCWry3c5UFfpIeJ4d2aTUCI7d6Zc6lJeI14YuodBuRmLsjSDf5vcT/T6X
	Pj3UMtQfTGuQBT4iyW5HFJ7iJjE6OW6Y=
X-Gm-Gg: ASbGncsCk2w2pU0AcwKQmw/Z42oIiocFe5iTvfsNwTpNRcH1rJSsVYOqujXA1vTc+FU
	hTupf71fZhaowffDo1U1tOgLPQQPSxNcG0o/M6HPEyp+65xyFt6pH00HxYBPJcDNsme4TFcVUm3
	fdWXHJ0Ycw8fM++3OWdBLRfl59JmfvnuClj9DeMbl4vKAySnAFzmRrrhBzx7FmZYf/nWI=
X-Google-Smtp-Source: AGHT+IGmDiu6R07KUQnYUJKNNdiu2eAHxzY3oMo61IDFf9K/qYLHCJJ5wCHcjJLYg7DSsQQqpzZISZJF/pnwnufhlWg=
X-Received: by 2002:ad4:5745:0:b0:6ea:d033:2846 with SMTP id
 6a1803df08f44-6fad196db9fmr219416666d6.25.1748851400869; Mon, 02 Jun 2025
 01:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250530205609.3185264-1-raj.khem@gmail.com>
In-Reply-To: <20250530205609.3185264-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Jun 2025 10:03:09 +0200
X-Gm-Features: AX0GCFuOFmbQWymZwL8IuHXu0Qe417ucwy4xAhPukF_RHoHkdyW2erOzxC1SbDU
Message-ID: <CANNYZj_Y5joEgV5iWXxBueiXTvoEjxaFTtbBHkL1y4GuPHAONQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] pixmap: Enable openmp support with clang compiler
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 08:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217710

On Fri, 30 May 2025 at 22:56, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +PACKAGECONFIG[openmp] = ",-Dopenmp=disabled,${OPENMP}"

There should be an explicit enablement too, otherwise we rely on
upstream default for it, which can silently change.

Alex

