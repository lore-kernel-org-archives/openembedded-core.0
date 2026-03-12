Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C218EFED2FE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:01:55 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17838.1773309707483002554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHOVnszR;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffbcfbcec4so194700137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 03:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773309706; cv=none;
        d=google.com; s=arc-20240605;
        b=DRezHbYGsiUjeKnlPqzDn/XMbkiWA9iJEILxhMfqeBe5Z5Z2dnDnT/x3fD/AG71ryd
         9GrIcohB+EiD+V05Om83QysxOOGjRPZ6Xr0SjiklfphNFAaBPX37Xm678SBwhqVYK89F
         F9L7QIIJ0HMQM0kv+ZVnN59fR756FScUgvGoHBwjWcEUJ5Sd15duxtKJvLlfFn+qIqbv
         7vj/91J2tFhxWd5H0A8yYTdqqmXatkctm7LZFh+qyG35IhVICdRJOSWeYkgJtoJTz++a
         qfxr7p2UX2se0eYtv9RMnhzCNW/z08dnd6QmjKntYrgCgY/hyG+Hdym2Uu42Ky8r0MiP
         16Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XiKoZvDIg5adc8b4Pd2K4GsEI8Kg4z0zQRkieA1fiGo=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=SaQozkoibEeFSM0zETqbFealHs620OmOq2AsVhSgxOvEhlXQixOkuR3nYSO3FLrcsJ
         ELGecFN3SyYUjPbj/CdS3SU/0v7EsLzddfB3q6tau3iCAlFUj37Q45gwo/JkWB9N5Upj
         V3ibQ2w15yyJpen8eWJzIZMdH0FjJH6lIXY6IgZ1FLVuoMXANgQ8AF8mpiA0bWyXvLrf
         OpGqdFHg+JnUe0ag2iiQ7PyJOJ8+nPbRZ0SaKRjtKyRteN5xr79qXhdl/YNE30l3gsLQ
         pCcd2IAqA8SvSdwZGUl6e7Rz3+M+UfAXR6PRqdCztRGnyE4ltRWlEmOuAWZzV0rqdsQw
         Ix6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773309706; x=1773914506; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XiKoZvDIg5adc8b4Pd2K4GsEI8Kg4z0zQRkieA1fiGo=;
        b=KHOVnszRhdJTtT190BBLuKaBhBU2Aw3ov5koK4PHUYBO8l8MMyApFdN2bjKXt5z0dY
         2aVxtqbG47Mu5CD/asFgNQlwvCH3iW4nUrQwxNP0ZTdceFhWMDJgwftTXqqupzMdFTcj
         nhO3wkw7hWgi0/8MsM88O0tNNZG/S7gn7AneeD9NSYA+kdC0YlD0H73e+5LmwokTqTeS
         6VqqpTWArC/E0LzDR1FFCkHvjmNptZaS7wxgoqFskQx7NKBzt/x1Uhgm5RQo5i5dsmwI
         3DIQ6fgXHOzt8ClgDtakF9FL0idW4A5RMbM9KcR9FItU0zULGZKLVgC0UD9XyWy87R+Y
         IqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309706; x=1773914506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiKoZvDIg5adc8b4Pd2K4GsEI8Kg4z0zQRkieA1fiGo=;
        b=w7uRVQ8RBz3R0jaqIOIVfZtabJiwE59DuJR3wm/BUmnzvX09+IBpeKHLxLEzDNwuPw
         kZ3zi+ztsQJR/Fc5qJLQgfIyUG9sKPWMf6wnfXark3Gq0aJY6sVLzymjVfnBf5DTk9N6
         PDTwcq/MlvgETb34G0PYarcrdGH1iHEM7262nMJfm+h2UxYYeoxwWE7vzwcKURC/BYV/
         mQ692SHDZwKsKZXyRiRVndkWnqXy++dSjEXsCC5UUTYTKV6OijSkh95SP7x0h4Y+6YE2
         GSRDdEWSuWvNXMukXI4Carn5VKlr6baUtsuQQSSAXssN/HAEfAsUVJSkgRwvTXtOKBVt
         daag==
X-Gm-Message-State: AOJu0YwEaYuH+7YuZL8cKpuWvSYyLgPUGQ7kq3QFpLmfGqBt5DwvA/DA
	prM7LWh1DCH960W+9zg5gAuYNtmyEWllCMKf2jwOec75kS6vkMhPuw1EWYXv44uYkzlZltUbbop
	xqMTy+7Eu+P6eXyXvhkTrBbhljDJgstY=
X-Gm-Gg: ATEYQzxoqJ+gM2DhAG3BeWiD07xhnH+px7F37gXxuDWgCjI4gtbpDUw0OJwoxFUHxCC
	FSeUihMUX8vqPXgEHo0o1pCOxrx/D3D3W+0tSzQCQU5bli2GhWbikfVHSpEPA72TiZ79neWi1Zk
	0GOnkbScwWbRGonJXddXN3DYp4lokVqn4nw3Rmqp50HDkcqNVHL4HNVjMqdrM8Jk4MGyD/4xK1Q
	Nor0qlA1wUAUQKG+wWP5tCOcXbq36gKQ4CiG7CHWbGO95JmDAw6NIzIXysXGaukOcmQqxDrtULD
	kZcXoia6acI2ZKGxbK7HrqmbCR7hoG+wpsjBQqX7sA==
X-Received: by 2002:a05:6102:6c8:b0:5fd:f509:c97 with SMTP id
 ada2fe7eead31-601ded4f6bcmr1915539137.18.1773309706427; Thu, 12 Mar 2026
 03:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260312081506.970978-1-changqing.li@windriver.com>
In-Reply-To: <20260312081506.970978-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 11:01:34 +0100
X-Gm-Features: AaiRm51OyTd2innVHRBv6axfE5gqyELSspXARen0eNFwP_mp7WzxjtpX672cpp0
Message-ID: <CANNYZj-Nxx=XJgXEi79RJxmE_qZNxHo_yfkqc1d4XcMZRQ+vGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] webkitgtk: remove PACKAGECONFIG soup2
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 10:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232937

On Thu, 12 Mar 2026 at 09:15, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
> -PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> +PACKAGECONFIG[soup3] = ",,libsoup"

If soup2 option is removed, then libsoup dependency isn't optional
anymore, and should just be added to DEPENDS, and both options
removed.

Alex

