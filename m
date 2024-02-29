Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52B0C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 08:54:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.20237.1709196879782966858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 00:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3P1Ivai;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51320ca689aso693807e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709196878; x=1709801678; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxMZ0HVxUObozRLCMR8FIvDVLHYfdPV8env9sUsDH08=;
        b=a3P1Ivai+dSV7COOFZyoFp4DklDqPjdjDFkRr5Y+wHu6ROHpMl9GlRX7AYXNUiKDQh
         +q9KtycKnUweUEG8EFRG/hmjl9YHlDXBUKuy2pikZXeGl/6TfKrfOWtA57ETCvrb6LqV
         ismHIZTwndNwjC3kT2nImQ+19qxIHqf9x0/zao7jvs29/80hRfn26dtjh+NGaWK+0Iue
         LuaG95TakPcXgf9owh6IcCMQ5IXVXLgUKn3onf+6Hccf/3VHfapzlSnLT4+cF59ftyJx
         zucUL1z2VJS65O468tqJ4f28OPzs5N0hxgT8OnT5lu7i05yPi9qe9HOSxqO2TXgedSJS
         nZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709196878; x=1709801678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxMZ0HVxUObozRLCMR8FIvDVLHYfdPV8env9sUsDH08=;
        b=VksrZN9TFgdI+xvLIx0L0FqkSQhLDbR/07HIW+IsX6gOmguWSfLbdBvA7spYsEH5aZ
         IVV+w5o5TB/tGukAMH6lx4j1wGCVpJqRahSOOeksBO5QyqUvK19AaENKAHZW3EgM9R6U
         ZL7Ku/ie26124qE/m1d4KlcJzyb8nzMslthgn+G5pfEPX2DoB05QXdjWGGoXkcj9AVlO
         ZjLG61JpZQGXJVAGvEW/ozG2fG7jN+4XZa4ZMd5APXEvjfiLE0QUU7XjRBwh5xGgVh2L
         EqYWuxqul31v1Kuu01+GuSenrR8GGLFpYotHv+6LU1TgDYhcEggpWjUJONwGdAYmWmlK
         +X2w==
X-Forwarded-Encrypted: i=1; AJvYcCVJWWTysPVCLQR9UnXKvCkTKl97/GeVN9cOoymgF244Vjovzz17xRCCzL/W1HyvMPbfSBVUrjcOQy+SxkUHjTkAAyh1JVtgvn1vPzB/uogLf0YVmeVnk6f5
X-Gm-Message-State: AOJu0YxXPjhP+JxoFkm7rUIwnb0sHPD+1wJS8TVDGwUoev+2vPgwty9f
	ZLe36md9t+OjjbhEwF7SHD3NwzCLNvEO1v0DykdgjMOxrQ9lMUGNYy+2PQssDn+s26ZXlCSk6KV
	fh5kmb+DA8SbJXb9B4jDeMD9sQDQ=
X-Google-Smtp-Source: AGHT+IFQ9jij4SQWj2wKEhZJCJEHMXQI9Ev/FqFuOi55X+pcLrxoO3WenG8H9E+rCelfKcPuMbHD1xCaCWzbx+JDG6c=
X-Received: by 2002:a05:6512:689:b0:513:24b8:a7b1 with SMTP id
 t9-20020a056512068900b0051324b8a7b1mr1076217lfe.47.1709196877579; Thu, 29 Feb
 2024 00:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20240228062139.473528-1-philip.lorenz@bmw.de> <e5139011c4d44fab2f927332a01947a7eb2c42ab.camel@linuxfoundation.org>
 <c95a7daa-8f9a-4767-ac6d-5158647781ed@bmw.de> <CANNYZj9rcqN44L==NwV=o-GWKCqzU1rOK_U03VK2XQufWos6Dw@mail.gmail.com>
 <f2b0d86b-5824-42d3-b293-c0a6a979216d@bmw.de>
In-Reply-To: <f2b0d86b-5824-42d3-b293-c0a6a979216d@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Feb 2024 09:54:25 +0100
Message-ID: <CANNYZj9kduUpxN7Mpe3VnxuZKP78Nb4_cNXbnRaZXE8kqHrZ-Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Philip Lorenz <philip.lorenz@bmw.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196421

On Thu, 29 Feb 2024 at 09:20, Philip Lorenz <philip.lorenz@bmw.de> wrote:
> > One possibility is teaching it to mass-import pre-computed entries
> > into its index, so that sweeping file tree scans with archive
> > extractions can be avoided altogether. Or doing incremental index
> > imports directly from do_package.
> Producing this data is exactly what this RFC is about. Using the
> extracted build ID information to optimize the import into debuginfod is
> one of the possible use cases but I'd also suggest to keep the extracted
> data agnostic of any concrete tooling (e.g. pkgdata).

This is fair enough. But you need to think upfront about how producing
this data should be tested with just oe-core/poky and what use cases
it could have. Simple sanity check is ok, but improving debuginfod to
import the pre-computed values is much better. Maybe something else
too?

This also allows you to develop and publish the alternative service on
its own schedule and terms, if the code is not mature or BMW legal is
having a hard time signing off on making it public etc. We don't need
to see it, if there's a use case in core.

Alex

