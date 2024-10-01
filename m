Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC9BCE8374
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:56:19 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.80506.1727787378400482638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UFhpN6JG;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so3133354e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727787376; x=1728392176; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUpIRZa4pj6hibPJ4WvcAth3He5BBB3NjsmRKT/ft8o=;
        b=UFhpN6JG0PkN5Ov7ulWiJ1LPp1ZH+2P4u+DDF9aUtL5R4S1AMSy1c3TzB5GzzGnHIz
         YITpWvc3+9BHufj/bEm/siTxfQkEymFDFEnOLuJp+9537b3nqHuAg54PWi4oiQRDO4Br
         7m+SE5j2kVe0Zzpjx+Jy39S7Z7M46nFq02r1rpKKZW4aMxGPW7eHdvhwTbDHQyhNWuss
         3Ws3kEN/qghaDBq4xkX3LP7F4Ffx2zceHYdXWi79BgrG5Ss8taHSpPmidWMN58ta5q9c
         0HknzBIASjl8SACES/J8bD2BRjaBxQcGci75+xE6wrQT6oaC3EDOMGtYbL58kBHTbVzj
         NfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787376; x=1728392176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUpIRZa4pj6hibPJ4WvcAth3He5BBB3NjsmRKT/ft8o=;
        b=f05r0cSR0U7Nxy51ropcmq7S3Is6EjhqlIXkGVCfkiEQjxvrMNZSaG4JIVdlkMIPZe
         SJwbIbxe8ut66ez+ON7wgxwpX2Ym/G69obJOzgJtOORQWVl3kVaeIvKxGh1xiDULDT7+
         t/baONqwzwbBmsZQmlWnJWeOYpYltwLbeDp6hKZjMsWPHDuoec/+ax4DoIwyST5dpTVv
         n3NnS5rO355fg29qTEpKRiuFKZLl0iTEpPik4fN6rIyecmmuvytx2u0sUxDR8rHnl9Eu
         aT3jqxpvcEVJUUZQ3fdu3klHDHtuFhYe8QHs0W7GYqGYv8mrHoPhzFRUZ+lHxnN39QAC
         qTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwbxwEFJOYjgd49CCglEhuKkk26dkLm5E5y+jeZfbK0rvtlgF0cQtpjig5Vi3QZaok9Wa30GZ7PsNd1NsXaMyxag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeuNcxbrAxhgYPQBGErLcb628cd6e7GPfINlH1vktsYaWJMgN4
	S43nsAwSG3NxF7gjQLFOFcl0YVVNoEd1zWGE/4cDXzq9GXHnemLemZ0fVrnkNZfWI2FqjOKtb5+
	qIOz3po7xU2P9z/3Vnvmogf+TOb4=
X-Google-Smtp-Source: AGHT+IFcdqLf+LjlY2eX1UlFtVjHICfH5+zFF6GFrarvOyRxoihPT+oHA0mTYu4GMCeQp+BE309GuUxiPvc0tOCa8LI=
X-Received: by 2002:a05:6512:280c:b0:539:9155:e8cb with SMTP id
 2adb3069b0e04-5399a1eaa48mr1082155e87.0.1727787376219; Tue, 01 Oct 2024
 05:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
 <20240924115503.1599651-7-tgamblin@baylibre.com> <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
 <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
In-Reply-To: <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Oct 2024 14:56:04 +0200
Message-ID: <CANNYZj9+bvOEKxND1JoNeUY+-tsTfWj2qqMGeO09BDFN7+3_eA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] patchtest: use black to format libraries
To: tgamblin@baylibre.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	tim.orling@konsulko.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 12:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205163

On Tue, 1 Oct 2024 at 14:47, Trevor Gamblin via lists.openembedded.org
<tgamblin=baylibre.com@lists.openembedded.org> wrote:
> Is this a reasonable goal for some distant release? I've CC'd Ross and
> Tim since they're also doing some Python work. I might bring it up at
> the weekly today.

Can I raise a strong objection? I've been writing python for over 20
years, and I haven't once been in a situation where formatting would
affect my ability to form a mental picture of what the code is doing.
It's by far the most overrated item in various coding guidelines. As
long as people stay roughly consistent with what is already there, and
remember to wrap or split long lines, I utterly don't care about
anything else, and feel it's a waste of time to enforce a particular
style.

Alex

