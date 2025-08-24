Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E544CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 10:20:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.14202.1756030794864773525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 03:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDV6+SWn;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70a9f5dfa62so33807246d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756030794; x=1756635594; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwdMCb5YEHIxtnXXqBhgdkSGer0h0003qSZ8P6NbZeA=;
        b=LDV6+SWnu2OK/Hj9vfF5Fw3qkjBmcdggXMucuLs4vvCxCL9795nn9JR5m1RiJGhMq7
         VKw9C75lw2uUhVdX0woaPcLmBNcHxmridz7HIPXtNkDgpXDeg2DP2gy9yTrPuTcVjGrY
         5JYOge2UYF5V6UTZ1moKo4ZB/ikzYyD8uQf6g2rB0pBNvx5uTlhJig3aLwiJCEP7wIOb
         bqFoAykiYYuTxzthyzmdOZombh+jHC21CIyA2mzqSGDfDAiyfGIMojqwlWQqbXdM/Tp0
         zPIfbO9eZVOzlOR+yTCcL0RF8YTXjgFQ1s6C86gvHSgDq21KhLnwxTqBH1i3S0vuwGOy
         BxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756030794; x=1756635594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwdMCb5YEHIxtnXXqBhgdkSGer0h0003qSZ8P6NbZeA=;
        b=pSCtGxAeZDu/p/BnUK/XOqudSXrCEuvDTjVyLS6/bB58lpI7/G+rB+tnAqkv/ULZCZ
         jTE54wpNxuKF8lrByAiIJQE7FmUmXzAWz3ANSOByLpOwgHzmrE5+33qDl2et5FopBpaV
         X8LVzybWAXBe1MoR2z98CXDC5QIAZ6zO61SGaznz4riLbsx84FMya7n7TT4FGgd8hTxy
         Xb9WfA9lJtazcGwQNl7/R7Ke1Vs6ni2lt5ep6YHPwIdO/iusf02I3VIYur96RXCH8w7I
         GiPaj1rQB3bokpivAzfM3NRncmyS473PvChDsYRnai5Eto4VvY7acewkZS4TIHAsb5fN
         fhPA==
X-Gm-Message-State: AOJu0Yx00biLOwIyaIcHZow2P+TlijAA0uKkPtbqH3S6qe0t04azeaMF
	dCnCfceMdUUoNPAJRm7OOQAX0bYQnmLDyk4g0rcMowVogZ/kuaXSUZY9EiPz+j/M49jZVBlZXSL
	JliaK+mn+P94sQd7WH+O/Qq50vSeqmn8=
X-Gm-Gg: ASbGncuzfgk+2NLNFKXSkUqGkUzQqp8zYqM7fiGh3lYJJvgbgk+FqO/GKnIDMhymd5B
	w/bRSM0/gLRp/ss9mfzRe445kSBSRyusOhTJACqxOaMLuQMyn5l8K+SPyiSlaYIydCGd3vYDz3F
	SLZL5huZwLMWVgZSUONzTpeKtQhpUTLB00RKX5gynFNOG84msYLzOSMaHBr6Obb8jN6aLVKuN27
	L7ATHC3F8/BlUPceg==
X-Google-Smtp-Source: AGHT+IGK+gvolzHs53vuqh/C250szNOJzOSUgCJpEHperWj3K3wIlJEG1DpPZ/ea1bwKWuniDAzwZqTuLw4KWUtgzEg=
X-Received: by 2002:a05:6214:4344:b0:70d:9d45:5687 with SMTP id
 6a1803df08f44-70d9d455791mr98521116d6.25.1756030793902; Sun, 24 Aug 2025
 03:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250822051726.2429206-1-raj.khem@gmail.com> <20250822051726.2429206-2-raj.khem@gmail.com>
In-Reply-To: <20250822051726.2429206-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 12:19:42 +0200
X-Gm-Features: Ac12FXxf165t76Jcbt3kpWi5gCFQXVvc_Z7Wp4fp50YMUpG-vgr0hlzQBePo_QM
Message-ID: <CANNYZj9rS4fYUAuEJQQECMpLGReQWTD01tO-fnBigjfbvTKM1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] gettext: Skip test known to fail on musl
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 10:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222366

On Fri, 22 Aug 2025 at 07:17, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +This test fails on Linux with musl libc
> +which does not support the BIG5 encoding in 'iconv'.
> +
> +Upstream-Status: Inappropriate [Musl-specific]
> ++exit 77
> +SRC_URI:append:libc-musl = " file://0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch"

Doing all of this is horrible for maintenance overhead. We're already
several gettext versions behind because no one has time or willpower
to update, and this makes it worse, not better. If you want to fix
tests on musl please do so with a patch that upstream accepts.

Alex

