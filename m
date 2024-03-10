Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71B4C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:01:22 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.37370.1710079282082143095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 07:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CK9+aK9e;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d204e102a9so45255461fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710079280; x=1710684080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzCWEn+sMUk1CVq6XXYwxl+Ed3SwfUDV8c13Bf4eJK8=;
        b=CK9+aK9e0dv9Dllbk6+N2MfXUchQ7tDF7GJ2GX67cx5YtTyp4y5BvLPGe0+hvZtYTz
         betlmWXqvy/mqybjh8M/mR2ClIeewwD4vZhMXmVfyRYcT7oQ03LwesFW5VpQMadklYDt
         MwgpfTcTaHksaUHk73JNj7tC6DL6ZS52S8gp4UDFsSrwlwBdHB83H9gwxzgUrrEBNXPt
         LfLiy2DXTBwdGzt0AoEg1CfOmLst/fM5/DlR6fAOJSB14SL+wDxXigEsG0V13r5ispGt
         KoqNg8dvsP2NbLcUz6kFeHoOvg4ZRmwF4zUe+6rHQW7MqgcY9ng7PUd/GwqXQBe9+HQl
         U8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710079280; x=1710684080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzCWEn+sMUk1CVq6XXYwxl+Ed3SwfUDV8c13Bf4eJK8=;
        b=LTS69gqnaVqW/UJ0C0lmwzj/zngCDA+tPW8Z4YKew55uFtdJBPi+e5HWUzUDi0Z+eN
         OvU/t3kVTYICscoxz7JtXoIk77Hf5Ja6OjjmHZUlgBuR96nmGktQrX9bBdtoIvRZreRv
         q7jc7OoYYqUmRV6nTP294u1Vf+aaCUsWzdhHojIWeqKuOrXjnWLk57flQ+2ca98InNzq
         qVPZoHcA22G7JfZAh73VZSON+TLLNvblYV6lHg5Qnq8ctIW+44W7R3X7KBgOgY+vzGzJ
         o9PMFHkbZ8TQcqMHlxNvq7B6GPIwupLurh4ucBbBjR3B9nst9GUs6f5mxjrATtfWyCO5
         RDMQ==
X-Gm-Message-State: AOJu0YzU+b5500t4h0KCRvyURjndMuWpYhN6dWpM1NGwovnisxwpX1Y4
	NZwuqnPYzGCLzccgJ6FmKc6Exxdj43hOpyUNUSEhQi+JY1ZuVxEFJPE9XTVxGcbE55Wk3yvWYM/
	8EbTBRxhTKp9UQZBwYtfG/I83BLQ=
X-Google-Smtp-Source: AGHT+IGC5ggHL1bQ5WyZ2eb4s9DMSZb5QmScHZ5zsrHOpPzO5w3HexIEEYcEUgvKkOmxhLus3lhWY0t2qz68XqnT42U=
X-Received: by 2002:a2e:b048:0:b0:2d3:e0ec:36c7 with SMTP id
 d8-20020a2eb048000000b002d3e0ec36c7mr2270141ljl.43.1710079279767; Sun, 10 Mar
 2024 07:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
In-Reply-To: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Mar 2024 15:01:08 +0100
Message-ID: <CANNYZj_GWJDA6i6c+83RZw4nQbtYocypQ6x96y_v9-1eehPaBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest: test for PTEST_ENABLED instead of DISTRO_FEATURES
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 14:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196884

On Sat, 9 Mar 2024 at 11:29, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> As ptest.bbclass defines the more intuitive ptest-related variable:
>
>   PTEST_ENABLED =
>     "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
>
> modify a number of obvious recipe ptest checks to use that simpler
> form.

I disagree. When someone reads a recipe, and sees a variable, the
questions that typically come up are:

- where is it set
- how is it set
- what needs to be done to change it.

DISTRO_FEATURES wins all three, as it's commonly known and understood facility.

Alex

