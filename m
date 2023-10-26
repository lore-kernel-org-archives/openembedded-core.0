Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3287AC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:33:06 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.68268.1698319984081084551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 04:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+Rs/8TZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so11856991fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698319982; x=1698924782; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dJcNyVE1YUZO2TsIUhhYBo1T34vIOJA0YFRRdCzOklY=;
        b=d+Rs/8TZ2lqOp5f97pX0MkeVJjHyX2Cehu52L0leBHhjKD16J9sFe9q1FxuLrHKv37
         hkoOxNWEtiU24lAwg5bfBddbSncnayXdXE/6uXMsiveqFufg+Kr8UOXLYBjBfOQuJEJo
         qtiHb/umRgTmPZKOUVCWvmsJagcKWROM4hGGZHCzgxirSb6RV+WKqMYP4DncSe0Rht/A
         ZViBatEu5btU+DR/ApVSXt8OB++vcYW4ZScbwLehauYK0XRqEGvd9HuNbR04oR2o5NkU
         Byrtew9wkv1Kaf3AZDpZCg+xQFigsHjR/A3q1CWxryZOX8UwtyeRs0/m4SUBbSckXCd+
         gs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319982; x=1698924782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJcNyVE1YUZO2TsIUhhYBo1T34vIOJA0YFRRdCzOklY=;
        b=sdnzm+WhxG2WpBs00sp1sorlvsQsrzoU2TmtLkH2n8B4TwbUbl6m0SAl/J/fmcOa1e
         BiYAy6Kol+0sDgvMbq+Gg4Lg0X+aOkH51iZJqC99650bmA8ZPIwQFOn7ZgGNEbRM6OR2
         WcChOvK95PyDscPtKTr/B2D7DzFSiPzeoVudl8JLLIn7zM42fOq/KHcNNGfbGx2ANnwK
         0Kj4AkKLhq6K1zmpb7Fl4DSVtwKjmklpagX3sdYZUI7bUZb9p2jbEqV2vfQe+OTbrQP1
         QzV7axOOpMSEl54UQjgd20GT018AXhe9bZF5gyJTyp3w0pBvfdVwZe/mHWRKdxoynfex
         1H/g==
X-Gm-Message-State: AOJu0YwqllufLu6MCmKMhVzvxG6K+zJWhlSvtypeNtfwdwk7A8XeH1V/
	NhQ3MpOC/BFsrwuoogMdRk66n6dHtljdq0yP6Uk=
X-Google-Smtp-Source: AGHT+IF8OOvneql0sMMO0Dc2/uSj7M2ie63zg7b1UYiCBxNwbHE23xfYw6YmFEG93bZsxmFbacT9p+mSnrSt7BDCbcM=
X-Received: by 2002:a05:651c:1409:b0:2b9:55c9:c228 with SMTP id
 u9-20020a05651c140900b002b955c9c228mr11492295lje.27.1698319982045; Thu, 26
 Oct 2023 04:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231023110618.3525311-1-alex@linutronix.de> <20231023110618.3525311-3-alex@linutronix.de>
 <20231024103345.306b9171@booty> <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com> <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
In-Reply-To: <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Oct 2023 13:32:50 +0200
Message-ID: <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 11:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189722

On Thu, 26 Oct 2023 at 13:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > We need to think of ways to test/debug this that don't require running a-full.
>
> We can create a separate target (builder) on the AB to just run the
> test?

But it needs to run just after the task (e.g. world or some other
which should be dynamically specified) that is supposed to create the
required objects. I guess it needs to be done with a custom branch on
yocto-autobuilder-helper which would define that, but then how to
trigger it through the UI?

Alex

