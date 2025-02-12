Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBACDC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 10:32:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.12588.1739356368415744578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 02:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EAHAkA83;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e45dd13b24so28377516d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739356367; x=1739961167; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gso0wpR/A61554xJfMozWh0WJeehZv3v9fzadgj1abA=;
        b=EAHAkA83D7a5VgAWlasOVUJfUGIoF2mZm/uZnnUUcCbzUyorzHUZXVYeAc631fmBbA
         jDwIq6AfujCwnq6XFoz2NwiXngY8o3NLXUcDHWhnEm972xsXwgctbJNjGlCLtzXQ+UfE
         i+0wGyqs5W0jVHiGA1pH1IrBc+X43z2wpdbx+FJVkjNFd2dsShe+WgPkUw3ZHIucQaMy
         RIBqhDmHvWXALWYgJ4ochJMC1VxgglLTtFaySwk0XOeCx5EUrTwq8ThKNpY5XL7jVEUD
         ANXhytELKLEWh+zxzm4zTng4l91ptyo63ZJVIQyQow1/a64Jo5NRhXLFdCQunoV/CO/J
         3w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739356367; x=1739961167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gso0wpR/A61554xJfMozWh0WJeehZv3v9fzadgj1abA=;
        b=JhhrLn9M9L3yz+z9h2n4mNAn96R7dbiHqXvqkTd96MqrLtLtZZ5ufuvv3PWdU/W0/k
         489p4HZUohh82NYIiY2sZZVys9pHQYUqH9gNqh4AfBnSHbvJGx+q40TdHT5Gw73KPMOA
         J5FkFxPHXhA0FNRgZuJdjtISmpFSRlT/mwmctYMMzC7YJUvX9MccjXXIeiscjpHEv2In
         JglTii7vQQCUUv14IwmCn2cMKx9DVYV+1M7mLEE9QqZ7/xQlHUQBRlDoQqtRn1zSWuSJ
         sNU2v/0CB6HjXHBCweYI3j8G8H8SWNoLIbn4LlQjO2vm38NRcm65VMbr0Z8S85zCkjVf
         Ppfg==
X-Gm-Message-State: AOJu0YzcMCLUXTZwIw7yV2u9U7RUDS2vqM0izjznxtS529ID5xz7PHF+
	aM7NWLht34g8ArFLnrwh7rNJw54ss/sKB2ohsBJuYMa30/Oqz4b6H4t7oSmz54sZfMrp9emf2C6
	QZI7OV0p4Oo2L8R7IaTE5EtFMq70=
X-Gm-Gg: ASbGncskXgzoNY/UsO8AhAaUoz+g+/z7+ftffUPmbJ+vywRg8GJFhHdJYBkr0NIt0JH
	ed83W2/UkweCzWM9E5G5cwD/flTp6X9iWodL6RKxy2opXCMA3pBhTaT05/Vcj6nZMm9Qe6O12zx
	11SeWttEYeyMRyd8WG7u/tJ0MbTUnAtHw=
X-Google-Smtp-Source: AGHT+IFnPx1onSS5zhjx+NO6MhMG5n+Nv7rRHtU5wPTBU6koIw73miIMnIKdx/YnRLfjsebamcUK4j134V2pWjLB/0w=
X-Received: by 2002:a0c:c481:0:b0:6e4:4484:f357 with SMTP id
 6a1803df08f44-6e46edaba29mr30102316d6.30.1739356367507; Wed, 12 Feb 2025
 02:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 11:32:36 +0100
X-Gm-Features: AWEUYZkuYTtxkgBx2DT_eP6RmEUboOaYl2CA4O25QJX87Ax0qWMohddd-RWLZ_8
Message-ID: <CANNYZj9sk7Ex98MuBABRrDv5LKYNi2FJRt2XXFtWGv7tig5thA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 06/30] lib: oe: vendor: add cargo support
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 10:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211221

On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
lists.openembedded.org
<stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add a vendor module for cargo to resolve dependencies and populate
> vendor directories from a Cargo.lock file.

It isn't clear what is a public API here and what is internal to the
module. Perhaps you could nest the internal functions and constants
into the public functions that use them? Or use the _ prefix in their
names.

Alex

