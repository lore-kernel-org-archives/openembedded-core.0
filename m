Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5176CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:08:10 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.13859.1758881284598494538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdvjPGX7;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-79599d65f75so15440486d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758881283; x=1759486083; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2K9K/uC7dF4TjFJfq4jJbBhN59SS2sdEOc2izZYmkjE=;
        b=YdvjPGX7Y9+qOIQIdvM+/4Y1i8qQ4Um+FxY/vXuUzvvd5L9Ni02hM0CdzbocOqSaXK
         QFvmd91MRD+3AV8/pORB9pmc/wFZZPAPB0xlMc2yXguqLa6/2qKIpEcvZNdUz3BuRzi+
         T/gz9+7OkiDSKvwD6Oq2xTyLw84205uqgYO6tM/2ICEIUzsN5lNJNG7VOnNyUF95CWlG
         9Zs5c8+VpSzWDbY07ppquX5VoyFFxx7hCdCgs+22toHzTIuBbZjkZ/EkpMfSjUqjVBSa
         iUoLfXTjlj68cWAehhQe3R64PIqW6+Z/wAPmrLZqE003LpDCfPuuC2E0AYufwbHsxis2
         +0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758881283; x=1759486083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K9K/uC7dF4TjFJfq4jJbBhN59SS2sdEOc2izZYmkjE=;
        b=PZ5Z0KNjUJXdrRbEkyJhwPeTMF7m/VS8gHNyM4+PUCjtwZOy24MALn0KEnpqFdp+WK
         WaeKqkUg0N3ylpzY/GPBRRfqirfs9qVZnPB7CGWNEcOrQCF74fPv8c+P7dtpwWmTpWNw
         Sz2p5cUTywxqT23NDAxPZHp61xnBBH2q0piGA0m38pWw6wY5PdaUj8Mk4wduBObvltNs
         ow+uV3COsjmzGUMxfg81gfpzDPGLOLz6KHBUrOlWM54j2CeXliLfw0Hx9psYLeEhFKwC
         jbykCjkq6By9BtkHDy/JwHJNak8Khg0CuaUNIM/hByVoopKMQu63sVfaZkf2N8lhdwn7
         uyIA==
X-Gm-Message-State: AOJu0YxtKjzCVg3cXnM5j+fxe6wQtTdWW2Uc6uHUNFSZ5pLo3Z0uOClF
	xFGOiw6QkYJjUygdVo6XB5S+ocg0TG2n6Xme4Na8t9BC5mk3bYNq+yEdqqilPijY+w9GKQMgUpe
	cKRuRadVoAVrdYYPdQ2Z6vMzI4muXz9t5Kg==
X-Gm-Gg: ASbGncs7oVc2doVq+pZx+dRup/0XjmLxZfom1dXcFIiBAcDWXDI1W10bT0fdQb62nns
	nZ7XQXwLncXvR6SF0HQ6iOrxOeaAd5r/cNReJ/IG+xpfGA/fBBME1bWkDeBSQCrE6CzIhBEsCkG
	xPWql6L0ubKy5nOf3OSYNhC6TT8bLF6Lmmqf5jUvpPz45dErYG1eYPD4IuGZ/fJvRftIiNrA2IG
	WiZCJELfjPXi3WJ3DvA+v7L19a8r1PMXKhjzzQMnMDd5zM8koR1WXUSp/EckI7fd4IGwpnU52Cu
	Z9W6gBWyu4XdHBrvdBfY51sWnu6X6M9/C3h8lZXhXcWeZ957td8=
X-Google-Smtp-Source: AGHT+IG7A4UuNN8zppxy8AnMewuacpsc4abDxcJz4iLxzlmRVIURbNQU5GXE04k4dYy1Weexogy6Yhg34sNp2a+dlP0=
X-Received: by 2002:a0c:f102:0:b0:72e:d34:573f with SMTP id
 6a1803df08f44-7fc3c34feafmr91252786d6.39.1758881283615; Fri, 26 Sep 2025
 03:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250926100120.3731171-1-Deepesh.Varatharajan@windriver.com> <20250926100120.3731171-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250926100120.3731171-2-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 12:07:52 +0200
X-Gm-Features: AS18NWCTmadWRTu80MI2JcBOZ52RUEn1_CJe95aQWkx0HB_r0g1tf2JxKTzJ7ts
Message-ID: <CANNYZj-7K8PhydL9bHnSmh4V6DY3F5qS-wvxQZ3=M69MQGJ7gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] rust: Drop rust-llvm
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224072

On Fri, 26 Sept 2025 at 12:03, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> *Dropped Patches:
>
> 0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch(Merged)
> https://github.com/llvm/llvm-project/commit/b46f34452e9dec50eee6ddbe07875f05e421a81c

This patch isn't specific to rust-llvm, and was removed from SRC_URI
already in the previous commit, but the file is removed here, why is
that?

Alex

