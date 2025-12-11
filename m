Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6E2D41C36
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 13:06:22 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8786.1765458377079109003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 05:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EnXx7NtZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbde7f4341so38802137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 05:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765458376; x=1766063176; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9JUVcr4BQYhpznLfgIestv094fK3+Yj2NAdeuQYOvNI=;
        b=EnXx7NtZMVs0sIEvgww2R+1bgKseJrLpM9GDloJJZ4G8Oik900We+QSZFnaVjYe+pu
         GHV45JRy2ncJd3ou9XUSffbvrisnsBUrfzzHQbDhTWPIKqmEo4Fh2V/BJzbNaQFbObbQ
         /ccb4fFMEdua5cAO95qG5MOOjeiGMmir9wqa3XEEu+X2dtETrMuM8xUGjoCeqqlTrBwq
         lZuuRjDLU4QPsN21nNQWQPKJ6bWUiRJZxeSAwYtTHvz7IrXnvAmkWBqZtui+BJpwXY3n
         9GlckXcoRVzr909qoJ0gmbbUrC7TUKX/tgWInvxnZ71qq/ffEb+73ny/SiXAYB9O9txs
         AKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458376; x=1766063176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JUVcr4BQYhpznLfgIestv094fK3+Yj2NAdeuQYOvNI=;
        b=aw6xHJGRJ/W6zm6jtrswSdSVWBILnaV8voLPZzrCrEFjkKJKUIEVhxYNblAEFmuJDd
         6CXe8T3JCjEuNPQwr4xdrT1flzG4oWqyaFuf00Byxz8VL/src6p18v1JUEEa9yx088SO
         PMdaxqdyLdgvzOBe7Le8eMi7tDG/mzFcbR0X1ylN2OYipbnWcjl01oNymG/Ut2r1uHeW
         pruUkFytpiIG6Z1DwGLudex8m//Hdl+QEjJQHmyK4O7qC/MuTyfZY64iop2Gixwait8l
         vanSQeMcl52OBbAPS2385VPh8u0N0BNvbs4SFpDvGoVnT0dXGht+Boaaqf/uK/p57JCG
         MZEw==
X-Gm-Message-State: AOJu0Ywn73kzsx0eudMV6ATqLiKc5OEOl3P3XF7Ia7V+eCHS5Ywi0FAY
	qWLFEu2J9CIAEDiBq98JsXcYqSJEYUOSL1AO0mEovG3JvHIdWCJx58ZgnFvIMEreOSDZ8jAgC58
	76danoEY/FvgNQul77yPUqctr1DD83kE=
X-Gm-Gg: AY/fxX4SeIf0CilolRHYyueyZnA5MsCMwTOeC7W7bfV3Ilx8NuuhESW3bdcjxbpXDyG
	DzriaeUAnC2ESCXJJiwZN4/2m/F8/0vipq2v4BZRsl2qHZLe6J+KDkrrX7szbPa6YuOZ+mVbIHo
	hT5mD9xnJfErRSmkJqFaCvepJZ/JO7RlgS66GLY/PLgdxncOShgzYdXrI99pdWX022mf6ch6pkx
	DJDZLCAUK9KeI/CwmCs0FNWuIu/WDmxUF93ambqQ7ZwfFQmQ4/3tOU5y6vS/R+h/F8NcsM0KS+x
	fc8M8NZqN2DNzQjPHE9zjNEXDL3eXw==
X-Google-Smtp-Source: AGHT+IEfB18XMfehrYjzceD1AxffGXFgcTToUjq2D6ppdG2YOGCNwALBmjZefXjagVUE3nY3272e0ktn88Q0aZX/vfY=
X-Received: by 2002:a05:6102:38cf:b0:5e5:6396:48e2 with SMTP id
 ada2fe7eead31-5e81173500bmr675352137.16.1765458367829; Thu, 11 Dec 2025
 05:06:07 -0800 (PST)
MIME-Version: 1.0
References: <GV0P278MB06880222F486E5880988044993A1A@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB06880222F486E5880988044993A1A@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Dec 2025 14:05:56 +0100
X-Gm-Features: AQt7F2oLhTD9jlP-ErHT9WMta7m59hMoS97wRarwfaUjQRrJAB5e-m2Y9qe5w-w
Message-ID: <CANNYZj95ZV1CTMFDTLPR_0WQf-7XW4ypo9ihdM0VTJr6ERwQqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fix(run-postinsts): exit on error
To: Bastian.Germann@duagon.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 13:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227528

On Thu, 11 Dec 2025 at 13:23, Germann, Bastian via
lists.openembedded.org
<Bastian.Germann=duagon.com@lists.openembedded.org> wrote:
> +                       if [ $? -ne 0 ]; then
> +                               echo "ERROR: postinst $i failed."
> +                               exit 1
> +                       fi

Indication that there is a problem is probably ok (although there is a
post-install-logging image feature that also covers it), but breaking
the loop most likely isn't. The current, expected behavior is that
execution of all postinsts is at least attempted, and you can't just
change it to 'exit immediately when one of them failed'.

The if..else condition is also strange: check that the file exists and
is executable, and say 'postinst is failed' otherwise? There's a
possibility for improving that too.

Alex

