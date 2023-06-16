Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CA0EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:18:02 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.3752.1686903480109323897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=euI+oIX5;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b4470e1500so4825181fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686903478; x=1689495478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NODb98kN66pdiLmZELLe4I9zT9jbfAXiYKIsOOH/F7s=;
        b=euI+oIX59e+UCY3oorW0EY9tDuZo2SsyNkVVpkeHdbfH6mhLZt6/eaOgqo3WcRFQTG
         ornxOS2XX0gVBz+DSwbb0N714bg8JGW29pP7PQPMT0tSFI1ClG+uKDGAN3JagAeLecga
         mg3966BdCuD5sQbJVgVcKiJOWksiA2ARa0AKmIQ827LQfNYg3u8zdBvvWDrlRjiy3izp
         3PzQmKLh5xuQ6A/A/hThoGOaiaSeW7DiviYRuuxs8aClbvtt6B/mgyavaK2SObYEx9Mb
         vZtbfMAcsQ7E+ii6AvLR2hIq5a+T/hGhbRX/U9dNTlkCL+fBBvrQSZHEBIfqrNwdjGrQ
         ++mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686903478; x=1689495478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NODb98kN66pdiLmZELLe4I9zT9jbfAXiYKIsOOH/F7s=;
        b=M+fOwPvJOKhz7HahQ7XgmmGHnIHK90BS3ToNB+dhqu4gTSXp8fPPLt1fpuspooGzXd
         Kekbmqjk5UG5YBwpRIrywYw18DAM7wkF84DlrODecjv34R1dTHW1VXYlmVQF/kWuCdVD
         5I/0XzhkXKPOL512lIPgUp7A7uVRdlZ0cYr04fh873uc0cA6lLi+yglgHhqJ2nb0k3ut
         WzligxvViM6CEe4Ejgmv7agz76VTwcBG+1pB7a9ZQqkUeQliVvNe2Y8VYnwNQq9Nognw
         P4VQQmI3j5yUx4en78rbOm1+oURo7v1X37u9ue+eGXZqg+WNt9GHdQ7k6RHGqC+UIqfC
         Mnpg==
X-Gm-Message-State: AC+VfDyNPf4tV8D936n+oDcMoXGn08DvHkTdiyN6Bo84FnJNoFeBBUz7
	hAVLkQLfUSC6eaCPywtnSelXLlt7m3/WnImdOEg=
X-Google-Smtp-Source: ACHHUZ76idHHZeFmYBnfXqMOOZg7j+3+tpaaBAYVoCmbtNo3/FbEuL192d3TjDxVan2FjLNjJ9wO3JiDFWKwpx8AKg8=
X-Received: by 2002:a2e:9192:0:b0:2b1:be22:4741 with SMTP id
 f18-20020a2e9192000000b002b1be224741mr1088164ljg.51.1686903477944; Fri, 16
 Jun 2023 01:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-13-alex@linutronix.de>
 <20230615222659f26b3e59@mail.local> <20230615223419da9b0a46@mail.local>
In-Reply-To: <20230615223419da9b0a46@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Jun 2023 10:17:46 +0200
Message-ID: <CANNYZj-5MQ5Kpj+N+FiNYs+0FvtVw4Fap6dO2F4ntVyOAzc=CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/55] glib-2.0: backport a patch to address
 ptest fails caused by coreutils 9.2+
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183000

On Fri, 16 Jun 2023 at 00:34, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/06/2023 00:27:00+0200, Alexandre Belloni wrote:
> > Hello,
> >
> > Which ptest are you trying to fix?
> >
> > I got:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5023/steps/13/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5207/steps/12/logs/stdio
> > {'glib-2.0': ['glib/file.test']}
> >
>
> This is probably because I didn't take the coreutils patch following
> Ross' comment.

That's right. This fix is tightly coupled with the coreutils update.
glib upstream did further fixing to make it backwards compatible with
older coreutils, but we don't need to take that as our versions are
deterministic.

Ross sent a patch for the coreutils issue he saw.

Alex

