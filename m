Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBCAC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:06:10 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.9250.1646301969259514614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TY9eFnEO;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id y4so4897558vsd.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nvNXYrNdOGKEbfu7LJ80zYgXSnyfP3CYw2+oVU/zNLE=;
        b=TY9eFnEO6hUXwIsAdREmOdNlHYl+UFUxvokeLRbSQhrz0XQa9NHdRqQ8M9EILpaDyh
         Ie93MRS6M2nlBrmuIPH4Y8oxK9lVrHtdnBxPCpxRtmksC8oraE612mc1aPFCdCziE1ye
         lskO5oLQ74lTg5lgmvQH/BCy8WzGKF5LM8ssUd6O8fsV4eU9OWRvqXYJSZKGuMdPkBwu
         wkEAQpBeLTGhppf83z/5EAYNnVCFGSJQEQclQI95JvbluYLQtwIcZNYEgQbf3JRK74KA
         Np5KIMvyYa0GEuC1EdoLrcyzfnjxh5EUtNgo2grc6lrMEWSgZ0CPwVfluONMY/r2twhT
         m5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nvNXYrNdOGKEbfu7LJ80zYgXSnyfP3CYw2+oVU/zNLE=;
        b=A5sZRALMiI9YhKH6ijnNgZZavVLlU7cSjlnB8dh3mGq/pC5YUdYFjSHiLKe1iPQ+Ye
         LgnrZn0CLLfmgcl9qogkVIcUtDabrLSgLFBzTIrPCKux3obHCbvBM+fiHSx3ahoJ4+lG
         DRvSiESyVBU3RnDcPd1kz/SIjabxqba0Ux2HXRabf2zd1oMJ8NbqzAYFky5r1Gzu9G9n
         u9w+DLv6havLY8WWp7/N+HwiZUCrs1hnJaAjfkbWZ4j1ZZVeybl2VTQkMlifnELoqJk7
         dUv7aPJBGV6N1L5ohPHy9BBK4IH5BK33aNv1SymTWy14ILSWHi0DltHj6uJzxsBJAUrK
         WTyA==
X-Gm-Message-State: AOAM5308iardvtltxN01dWPNMpcZzp2OBCretmNpKPoKlLZZWHn5tZGV
	c+dluK+X/4jZRzOKgP0vdgqKGj5cg6UVS/9gaGM=
X-Google-Smtp-Source: 
 ABdhPJzVWbC++70J/qQYybtZRC3YoRAKxBREPD1LlK1zxHG7uXJfY6aVvpFTTQ6YGf6eTOmFETU+dd9xbk3ltTp3V9E=
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr2418708vsk.38.1646301968219; Thu, 03
 Mar 2022 02:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20220303093324.1663870-1-alex@linutronix.de>
 <20220303093324.1663870-3-alex@linutronix.de>
 <CANPvuRnmai3wQZY-P9PT0z=iYephBnYkwf1E=7qFAuD5vMqjxw@mail.gmail.com>
 <CANNYZj-v0L_gm8d0Wtjcvt+gAVBQE4qMDhAkroTiXThR+ZiaOg@mail.gmail.com>
 <CANPvuR=_FJOg56R0_m3DvLmzHay9C6f5mouF-s5V-sUtU0++kw@mail.gmail.com>
In-Reply-To: 
 <CANPvuR=_FJOg56R0_m3DvLmzHay9C6f5mouF-s5V-sUtU0++kw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Mar 2022 11:05:57 +0100
Message-ID: 
 <CANNYZj84_+EimjgWu-=LxBnf=ysgO11QmWUGMg01dFwMBERhEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] glslang/spirv: synchronize with the rest of
 vulkan items
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 10:06:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162644

On Thu, 3 Mar 2022 at 10:58, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>> What kind of reference, like a link to some kind of upstream statement?
>
>
> Yes, I think a link is useful.
> I only found these issues but nothing official in release notes or somewhere else.
> https://github.com/KhronosGroup/SPIRV-Headers/issues/252
> https://github.com/KhronosGroup/SPIRV-Headers/issues/266

"We'll continue tagging the repos contributing with SDK releases, as
that is when all the testing of the various projects is performed
together." is the critical bit in there, so I'll just add these and
resend.

Alex

