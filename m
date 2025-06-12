Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E02C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:20:14 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.9472.1749723607124328182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGnlYrVu;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0ad744811so6437686d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749723606; x=1750328406; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n6gbhLvD9f/zyRsJpTl9wpD6xYZEltRZQyUZ3/3zLFg=;
        b=DGnlYrVuDs+RUb+eS6mOEMqnHSkKdADljjRFk0GRJB9ZhbD22L3YdkKcmw7ndihT2q
         4vDlMYGjs8C42VTy1mn3+z8Sq1lZjIaadFctGYozgSE7MZHu3dWZetAEfs+zO9WyGj/C
         IYRF6hM5NyMN+SEuLViOcN/Ci6jErZf5wdbebFMGamRVmnebh++wckUQzkajilm06hb3
         N2MERnEBJoSFnGplBcSkKN8Z2Aipld2Tv76um6Ia18R3LMY7pdn0zNYq03nHBgfO20XR
         PIVXj38q8Xf18U+6vWzv+OrERC11Jmu2yUswA8BiESelzS8xyENO6rLDEV+PYAy/26/d
         cOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723606; x=1750328406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6gbhLvD9f/zyRsJpTl9wpD6xYZEltRZQyUZ3/3zLFg=;
        b=V0FKKI8yxVOkNjcRASMyBI8QmMb4+t7jUHoDgyIv8/0IzrOi4X3nBRntUJ4mSpAJYV
         T5zglJCkENWhnqQBweJuixnqzU/qQBwyrFKslLhV/0wFmcKm3BsO5ZztjqY4ipy1XrEa
         iv1ww4yeFjDQ8yAQuk6751hryYxkYYlSNYSyCqv7b11GAaCCy6fSaBWuO5lj7bw3SDed
         H967m4Z30oyk671yCBy7JoLjZB/aa+NVDt6v/xTyYUyvf0xYdriNk5OYk3mGQEQdKyeI
         upvJogViuq9qQG0qjsrhjChgOTcj8UMNU+uAusZORKT6B9Oeg+Sw0e32NraUmlqnpusc
         DsSQ==
X-Gm-Message-State: AOJu0YzLn7RR3MmE/YY4qMruyoFvRjhaLXqQySzlkRxn/fdCUhonVmZy
	+bGGLtlrcCSW7MmoooQCYhw3xf6phOshogp6eCkuoEJZxL2x4LCZw6hU2hqjrVMdcE6waqOdoFn
	5/7faow068mXuVkyIfrdeCz5wFaGs18nn1Q==
X-Gm-Gg: ASbGncsdPeRmxkdaXFONXrAQNFXRa+23YeCS3qCMuKq7m3pUJYrLfxPx/dK7GOXBh0s
	6reOmMPulGW8n3xyZ68PJWc+WLbnL6jmWWQVEcYdsGu4FpkaWNJLfV0G8QU5N85dPu/Qq0v1TWI
	Lvjjs5uzmh16zpIDl5Eg0Hj/AFGQoDQbMmMB5nrMCz9XKXdyN/76LmlY+7A0LQCgU5YSpBJN7yR
	5TMnlC8aGBcsWUU
X-Google-Smtp-Source: AGHT+IHXmDQ3oBgJQNnd0A2d/VFUstOpsOBaGYD0N1PvS1MbNv8hHOdbVaai5eOX2fAX5+KJqZUk12Jgr6vV42iNcEw=
X-Received: by 2002:ad4:5aac:0:b0:6fa:ce87:230c with SMTP id
 6a1803df08f44-6fb34e9ac2dmr43193646d6.25.1749723606041; Thu, 12 Jun 2025
 03:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250604081744.2068514-1-hongxu.jia@windriver.com>
In-Reply-To: <20250604081744.2068514-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Jun 2025 12:19:55 +0200
X-Gm-Features: AX0GCFufkBvpgkuLm_H9Eyn4ENiw-_lOdDONwhT-LAS9Z_O6LiYF37RLFvCBFOY
Message-ID: <CANNYZj-s9CQMzG3+b2N-ppbCT9=Gt5Ax9OUH1hBJMW_EFEROWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysfsutils: fix my_strncat function
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218501

On Wed, 4 Jun 2025 at 10:18, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> +The meaning of the "len" parameter in the my_strncat function is the size limit for copying characters from "from", not the size limit for "to" after copying.
> +Also, the "#define safestrcat(to, from) my_strncat(to, from, sizeof(to) - strlen(to) - 1)" has already imposed a limit on max based on the size of "to".
> +Modify the function to prevent truncation of content when too many bytes are passed to the my_strcat function.
> +
> +Upstream-Status: Submitted [https://github.com/linux-ras/sysfsutils/pull/30/commits/c2326946c0c2a4206c9b079a9fe25f7f9115295c]

This project was last active in July 2021, so I'd like to ask, how are
you using it, and are there viable alternatives?

On the patch review call we were wondering if the right thing to do is
to remove sysfsutils from oe-core, as it shouldn't carry unmaintained
software.

There's a number of recipes in meta-oe that depend on it, some of them
equally outdated. That needs to be reviewed.

Alex

