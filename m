Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A13C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:18:08 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.20573.1747909078726102229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJlifXtS;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8b9c6b453so70717916d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747909078; x=1748513878; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mfE9GS8VmuHhrUizwx3k0MsVHB3R0ndxbX1afveGeQ=;
        b=jJlifXtSBShHP26cz6lpHB+Nw25LKctDejiZomB2LNFVqFyV5u9XEyXwuApbwZDWmJ
         aHFM6DBtEf+rZsWQCrcnpW/5lRnHgmJg+oYI0ulK5HEBs0gMZPk9/KtHr9ekYAB/AM4c
         3diIEywZr4oTcWMAYclXeSmL/veSAqMADT8DL8ZhH7eKyYMDUJvodywD8Potl4Q9sf9W
         etorp9M9kU00/9nkWtuFov7II0MdugV7M/W6bwcDj7vtof1x6YYZGGoBB8ZbAGu9OKqa
         ygNTJwmzaRjwGM4l7VYSxalUZsraqfeMH5ChHwviZRqsHp8CVfeKS1qclJ0HC8HsnkUH
         w1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909078; x=1748513878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mfE9GS8VmuHhrUizwx3k0MsVHB3R0ndxbX1afveGeQ=;
        b=aEwSbjL7kV5Cd0MaOC8A7ygYBTUPzAYihCRT0p9CyjfM2IQFbfBTk//mPzjjiDForx
         7LCADU+4GYZ4uCdXI+9+rGkAjbO53OxGrv21+A7OA8p+cYw5YqWp7kXvTokgEbxNmUci
         htlI7zuqOgpoo/XDO8khNs91nTlxNJcfKIUZbmDxjMfWEPfSReg1GG/SWw4/U12w1QzC
         BKPYaA3Hu1LKEisnP4aGryDaqC2bhLesHE2nu/yiNbYrQvBRw9wYB24+8Rx1CJa2uyqF
         B5rJ/jD1AXEPqUpMn2iTMNANkANVR28cLk8JAM1tno6YUsB15W0c9Jwm2oA/ltZKC4yE
         O+ew==
X-Gm-Message-State: AOJu0YwH+bukxE0eAkOl53wym1PmLVTytAahJzwXtZFhZJGCwEb4WkMT
	aoIv5cJ4Q+EzRseJDz6uJdJLW8zGLYtZdWs9nE4XDKn6BCvNpFjIUdPEHQuNXq4NQZR4OmHmCzS
	zU49KonciZlfeVFspbhiup0xjj6sB5dk=
X-Gm-Gg: ASbGncspdOkaGlv2hBBEmNzZarUdpTtljGyqMnWsoiQfvtG1VQziju1zeyS+5fOaUsh
	MzG+LQZ2CYj3UY8DVCM+vENzGrTguX/lBaCCkw8a2hogm9jlvM+X3wzc/Fdjxpm0OGv73uFB7SS
	N/4F+Efp/7TgceCtqmh2be7nqE8XUnn4yU0IlikEmrZG4m
X-Google-Smtp-Source: AGHT+IHghFxKDk/qBZ+TlzYiDrXt8zHo4Y/rtIEtvi6Ra1C1PJptZ2OYeW8QiC6WC6b/oLNgqUZTbpmiDdHfnvAUJyM=
X-Received: by 2002:ad4:5e8d:0:b0:6f8:8df1:63e with SMTP id
 6a1803df08f44-6f8b2cc82aemr403783546d6.3.1747909077789; Thu, 22 May 2025
 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com> <20250520-clang-toolchain-v2-25-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-25-db97c2eb3756@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 12:17:47 +0200
X-Gm-Features: AX0GCFsIXkmHHK0DM5bD2K2iaF-_T1I0MXY49jkgoepWrCq7RcQvQV5ZcxuRdb8
Message-ID: <CANNYZj8zmVkDj=2H-iPvGiYUy=RUnafr4HEb0eXRH+NpaM6JRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 25/28] seatd: Disable sign-compare warning as
 error on clang
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217081

On Wed, 21 May 2025 at 08:20, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +#../git/common/connection.c:154:55: error: comparison of integers of different signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare]
> +#  154 |         for (cmsg = CMSG_FIRSTHDR(msg); cmsg != NULL; cmsg = CMSG_NXTHDR(msg, cmsg)) {
> +#      |                                                              ^~~~~~~~~~~~~~~~~~~~~~
> +#/mnt/b/yoe/master/sources/poky/build/tmp/work/riscv64-poky-linux-musl/seatd/0.9.1/recipe-sysroot/usr/include/sys/socket.h:358:44: note: expanded from macro 'CMSG_NXTHDR'
> +#  358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >= __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
> +#      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +#1 error generated.
> +CFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"

This is silencing an error, and it would be better to fix the issue
instead. Also, why is it musl-specific?

Alex

