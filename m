Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91FCC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:39:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.10647.1699439955776317744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P9ixVmyh;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso88367861fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699439954; x=1700044754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M5wlWnI/LlgKhiGY36ViBwBayijhj0aMSbQSSmwsCiY=;
        b=P9ixVmyhqUpQuj3SOspdOq5ARgxK/YznHQ9NmZK0NefftER+dea1Y+ilz9PXExh7w/
         c6ZbUygN4tWF2uTtuIdkQUgPejWtL0rUeGTeDeGfsTe9L4TymQzrCDI+cKJe5A8H1L2W
         Ug034y6KkdyvyeFhzYnz5G7s/HXgU5A6JZu5KJF8Wbj5WPb+mAxH+kJOyiwyxcNDd65A
         IpAoaXfLtPuqep++PuKRTM8otMlhrBtUUqe53HahKQvKqKtUhpgj/kDXh4ZflB1lMW+D
         Wy9Z/SdSM1h2ahELa3INTD1bvB2dHh9+a7djVP+qq2XYNntf7IqauV/L3/VHvdO+oBHc
         9lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439954; x=1700044754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5wlWnI/LlgKhiGY36ViBwBayijhj0aMSbQSSmwsCiY=;
        b=h2Ijlrh6NeNdcOBtOWgDQuYYcYCFhCCAsSGNHNuy6LE6RXEk3NwmKg4mFnWrTJ6fke
         fUrE6s1HRe6FhLBkJb1H2H81wjr0td11dmcO8BPf0U8GX7H8in/++F1ubcd/mEwMBZGx
         dJp6e26iaFyCQ3heYp7D6a657XRp31lEr+mMWUYGz/xffZHyMLJg64zOjNqJTvmzLaJb
         2RFqrodSAh5gdYVsYo2EN8nYnx/0oTuudc38roKDpNcRAr/HR6Tvl55xRwYP8Z2egzpz
         g3kxAmZLj9SnOEP/q2J0rIhFfWeurJCsEhoQw0LvOKe9YuNPp5bPJzIwzTMicazb7R/E
         mbDw==
X-Gm-Message-State: AOJu0YwdSkH/1nRbpdNbGH4RwELGglspeF7rRkwTHKu9juG3wJxEdG7X
	NsQa4eUqjneoLQ5esGQZH8ZC2frBO3dtL0dwkl4=
X-Google-Smtp-Source: AGHT+IEoWaC1rRs82IhClKyhhDASQ04s9xOfWjKw+J0P74m3WSi9xvUdVyJaZsC9Fir6KxBS9k1Ic7VDO4zbFSn/Gw4=
X-Received: by 2002:a05:651c:ba4:b0:2c5:13b1:b450 with SMTP id
 bg36-20020a05651c0ba400b002c513b1b450mr1238688ljb.26.1699439953747; Wed, 08
 Nov 2023 02:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com> <20231107152641.1043-5-jermain.horsman@nedap.com>
In-Reply-To: <20231107152641.1043-5-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Nov 2023 11:39:02 +0100
Message-ID: <CANNYZj8_gtZxzuUiAuu=ykJ05xK=cYqi9-D9697Zfiee5rU7Vw@mail.gmail.com>
Subject: Re: [OE-core] [RFC 3/7] bitbake-layers: Add ability to update layer
 repository configuration
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190313

On Tue, 7 Nov 2023 at 16:27, Jermain Horsman <jermain.horsman@nedap.com> wrote:

> +    def register_commands(self, sp):
> +        parser_update_layers = self.add_command(sp, 'update-layers-setup', self.do_update_setup, parserecipes=False)
> +        parser_update_layers.add_argument('json',
> +            help='File location of the setup-layers json config.')
> +        parser_update_layers.add_argument('repo',
> +            help='Name of the repository to be updated.')
> +        parser_update_layers.add_argument('--branch', '-b',
> +            help='store branch',
> +            action='store_true')

I'm afraid I can't accept this. The UI should be:

bitbake-layers create-layers-setup --update poky --reference <ref>

where ref is a revision, tag or branch.

A separate top level plugin is problematic because create-layers-setup
has specifically a sub-plugin mechanism in itself to support various
ways of writing layer setup, json writer is just one implementation,
and all extensions should be contained there.

Also --branch without parameters to say 'use current branch' is too
limiting. It's better to explicitly provide the reference, and write
it out into the json without validation for existence.

Alex

