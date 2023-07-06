Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73941EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:28:20 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.22480.1688650090940963418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pk/+b73o;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso1008546e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688650089; x=1691242089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWIm+9CG/pg1w37QxFaMAUlvrqKtIixSXebFqikzfYQ=;
        b=pk/+b73opIdUXsmUnt6FyKkAO1XcehWiPtcQKV28yZqt0bscEEhJNW7pSpqxNAJCxs
         buHq9+zbqLkNX2EJBirCy9FrZT4U7Y3hS0H8k3VLgZ0Gwu5EPCky2YKLwKvOAVqCS4I2
         opAdbs873qeu03zYiQoR1VMKvmNf3sSMQunVbZAVEPP6+VkAOEtFjTzW65QETCKlzin3
         aQuAZOh9sqDaslY5wAQZgp7HRqAIoBFPmsufqShQDn6G9rECELi2FAhUfr+ModulQH3I
         cQU1GEZCz3O5ydC+ZOQo3ufHxes1uZYnZTDklWqarTToopkJQI/kcfGDg2eiuVpw5L62
         ZiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688650089; x=1691242089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWIm+9CG/pg1w37QxFaMAUlvrqKtIixSXebFqikzfYQ=;
        b=DwgHNm8ntdxaqDbrw/SWJxAZj91ezqJ74KJhSPfXwldOh7Sd07sH1VvlknK0Jc6FB4
         vFfgxONHfd1VWvNDZ+HwVFmD95YqcXlrdE+MLpJP6O7MFh8v7UVJiS4b6a/fz8hlpwUp
         P7LeTwixzhZ2dzCD6pH/8JL/pgq7L1kbXZx5iKxXygJYA0CY5a5uMLO0b5UPF5YFhVn3
         g4tdl5rL3d3CnVFrq/atWZTX55sFaQEBYFt/PjIYc/kz1KScUM/tjzlTtHlSHE1L0P4B
         O1FUkpuWwYHdBpG02oYMEpxobBBaMJrWreeaQbm5jBcdwtrYBmfjTiqFZhbMzGk4ZPha
         X53g==
X-Gm-Message-State: ABy/qLYLwWJMtiELb7cMcf1Z/oFQwBm+UdWpimysDb5fQKmwAVZCDCM9
	z0rp72caFehwdhULSenSQD6tIQ2qx1BEkDnW6U4=
X-Google-Smtp-Source: APBJJlGyVusH3imM/Zju6hGoR80cVxzUbXhwVe2WRZ+3TOnXc0IO9pVttZDhzrD16KXZ3HJll4PapxhjwYTDAsEiD4o=
X-Received: by 2002:a05:6512:1310:b0:4f8:4245:ed57 with SMTP id
 x16-20020a056512131000b004f84245ed57mr1747171lfu.35.1688650088773; Thu, 06
 Jul 2023 06:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230706120105.553140-1-jstephan@baylibre.com>
 <20230706120105.553140-2-jstephan@baylibre.com> <CANNYZj8AhEXqdQpSYZA4hJEcA2jzbeHcMp1OtkRzPXGKA7dp2A@mail.gmail.com>
 <vfbabgctr6i6zah37ctmlbu7e7bc6gmml5ttrdcaynb7nvwet2@lpfagv3gbnne>
In-Reply-To: <vfbabgctr6i6zah37ctmlbu7e7bc6gmml5ttrdcaynb7nvwet2@lpfagv3gbnne>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 15:27:57 +0200
Message-ID: <CANNYZj_1MQ2OHECdrePvHf+t9DW7GUT=cBG_qGDoqgwQQfWA6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] less: switch to github URI
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183946

On Thu, 6 Jul 2023 at 14:48, Julien Stephan <jstephan@baylibre.com> wrote:
> I understand the issue but I was thinking of pushing a v3 to fix the 2
> failing tests so we can have a fully working patch when ready to apply.
> (I will also push a v4 to add more verbose output on error as suggested
> by Ross).
>
> Do you want me to update the Bug 15073 with a comment explaining the
> situation and a link to the latest series? So one can eventually (maybe
> me?) start from what I've done?

Yes, something like that would be fine. If bugzilla lets you set the
bug to ON HOLD or similar, that should be done too (otherwise use IN
PROGRESS - IMPLEMENTATION).

Alex

