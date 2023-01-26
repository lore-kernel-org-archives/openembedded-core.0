Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10D4C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:06:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.86338.1674767198515570300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dt47BtA6;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id b6so1939004pgi.7
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mNaxphey1Kexget83zVrqLcl6SGJjTFNsuojRHyAVJM=;
        b=dt47BtA6HbkAZXQmYN18LNj7oZnI6gDEm30xQoEbjG71DQAQ6HWx1oluDUeiFIvFG8
         x3D3WfqRZ2tcy1Kg79eqdTi86fl+HtZILY1g7IhcGQ/2PMbpo4mb41iKJWekb+On2R9Z
         HgxVtNbO3ypkIluVquRf3PqCFZWgQXvnowkhZIaw1teEwJ48n7QoV9qIfa7ISB3FVZo3
         pwOzeJT3oMjrjYhE4oPHNoutAyll9Wpabl76E3wladH9o2VE4qw2I4YSVbpBaU9Jn8Ox
         ev2lDzFK/zcN1dIPeIFC/Hd+qff3BJszOhdwTFYQgb0ex6GWG2btzwF5spFZSO1iXIwG
         B1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNaxphey1Kexget83zVrqLcl6SGJjTFNsuojRHyAVJM=;
        b=mgUhGiecxwD/Bnlekk0IvXK0YRmvCUBLlNXvads3Lcc4y7xohUPKpJ0hShlUbvwQQC
         xH7ZPne/b6HjssnP+25GihoqjHky5QShC3I3apm3otU3z9w+x8XSGh/00ne9G3yyiBkU
         7NR3cMUN9agxBBRM6vW173OegJEZAeWWfL/d07ydfxx6Jua1tlQYQC6L1MEpeeZqTR/d
         TH+1E8bFOQi2yx6reQe3KvHH/VFCUdHys0OTQ8aCVuAhwh5jI8gnKrSyU+pGOCWwsWbs
         13ZDM3eXngIYyS4jfrGu8wfQc2kMSSH8vdvl1Nk2YprD2h4uxPHO/1x1m6qN7EuECqyr
         L1Iw==
X-Gm-Message-State: AO0yUKVYwnNn6xcsK8+V1BdqFE8fId6UgtHMDEGbHcqf9y07trSnI1Jm
	thP7Dfrq/+6AGrqmqrqIiATn2ZSwNb3W3spkjEbN0B55dlM=
X-Google-Smtp-Source: AK7set/L7pa0OoIobXlQEgwbJMy9jKw8NJLGCfwZ84Illig1q9IYQewRhIZQ6emM3vIjiki2YniJQqVVgL5VO7vSpfY=
X-Received: by 2002:a62:1a4c:0:b0:592:5cbf:c71f with SMTP id
 a73-20020a621a4c000000b005925cbfc71fmr227608pfa.29.1674767197951; Thu, 26 Jan
 2023 13:06:37 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jan 2023 18:06:26 -0300
Message-ID: <CAOMZO5AOE=ZPFuz12WKBWJPFZhDH0s3zr=NkLV16g1zcGH84pA@mail.gmail.com>
Subject: bitbake: Backport a fetch2/git commit to kirkstone
To: Steve Sakoman <steve@sakoman.com>
Cc: Marek Vasut <marex@denx.de>, oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 21:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176424

Hi Steve,

Could you please backport poky commit 2ee1fdb8404d ("bitbake:
fetch2/git: Prevent git fetcher from fetching gitlab repository
metadata") to kirkstone?

It fixes an issue when trying to fetch mesa.

Thanks a lot,

Fabio Estevam

