Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A81C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 14:08:39 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.24264.1661436516624186088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CEXmqwT+;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id r4so26260690edi.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WB0IVFlRMsYQelX9y5Fp18+KDS4LyrxsAvXlp1LUASc=;
        b=CEXmqwT+hwLalGAaeudAT4XelyoVqh1hmO65Fw4R5xAb1c+Bw/mC4LrJ4d7wdN8VIx
         RNeIlahgs9cgvHeNqueiiGe5I8YLRVn+4CeC+8Fvas6L3xC6cw3sLqc3tdBvZQpNQUaG
         IkNaiyvnt0mCXH6oZwwxbum6Vrver9PUY9qbd16x+QaR0wVdK0/pC/AzJhDONOknqo2F
         mbHPmWGXkMAJoNpfO/0IVF8S8HZRWSc38nBF387Da/Ib2YxeuUgoCaPX9a0zbuYjuHg+
         g1SLoBavZ/iUd7QxwXFKAQznt3idAFZrnNAnzmCMveMqZsxuoNG3ZLF+IB4/0ZT0GmzG
         YsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WB0IVFlRMsYQelX9y5Fp18+KDS4LyrxsAvXlp1LUASc=;
        b=zPco3tu1xJsKt2qnWcDd4jbsLk+CiKnK/3PbzlekpfgdMRqM30SjvOjVz05XJmq6ji
         JMJAjU2E9thZLPYBSdgMQ/XP1bJ1nEBC28VdOHXtLFEiqOxdJ/ZEzZIWRm0249sgT+TC
         B89pOgHM/6ZoM1pB8zV3LXORsZXt6ADud5gqs3Ut6L3j4+4Cs1N0E4ohayYqcFE5BG2m
         sgRWhL4wIWhhV5gsdplvU4qdAYLH6cAIZUR/uvE3qStHjE9en10G1olcqJjPBHkjCMkI
         es9V/BSm1r07psP1k8bxQm0K/90oxR1IVQqDp1qz0t3/EfXUZpnHuU0YU2VQ9+YMkc2J
         JWXg==
X-Gm-Message-State: ACgBeo21e8LT26NClVcUxda1io/tNA6nQfhNpRLGMisDmzpwdwP94zUa
	cWlGOyFmdvatHKMbZYFBWaVQ+BXC7gPYHw9bSTKDqg==
X-Google-Smtp-Source: 
 AA6agR5GQ2oXWV9jgCbnawzKaXuP+9jzhmTB6j7O3ZMb2al0UIQ5Fpcxo+xbPcSvlx8VaJ3FfUK+fuo+x7+9q4AmmKk=
X-Received: by 2002:a05:6402:554:b0:446:1013:c898 with SMTP id
 i20-20020a056402055400b004461013c898mr3395623edx.269.1661436514945; Thu, 25
 Aug 2022 07:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220825072507.6568-1-ghassanebb@gmail.com>
 <CAApg2=T-BqLnaJgjBuxnfemPvfkQyWmF=r1XHz1vHa2qFKoQwQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=T-BqLnaJgjBuxnfemPvfkQyWmF=r1XHz1vHa2qFKoQwQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 25 Aug 2022 04:08:23 -1000
Message-ID: 
 <CAOSpxdbjTh8CimLRNefoct1-bDc=ObHu-HC1M+LBP7N1vHP8CA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH] sqlite: Increase the size of loop
 variables in the printf() implementation to avoid harmless compiler warnings.
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: ghassaneben <ghassanebb@gmail.com>,
 openembedded-core@lists.openembedded.org,
	ghassaneben <ghassaneb.aattar@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 14:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169874

On Wed, Aug 24, 2022 at 9:34 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
>
>
> On Thu, Aug 25, 2022 at 9:25 AM ghassaneben <ghassanebb@gmail.com> wrote:
>>
>> From: ghassaneben <ghassaneb.aattar@huawei.com>
>>
>> Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737. This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).
>> Original commit: https://www.sqlite.org/src/info/aab790a16e1bdff7.
>>
>
> Steve,
> I'm adding it to your watch list. This is a CVE fix contrary to the "harmless warnings" one of the commit messages is telling us.

Thanks!  I'll update the short message to reflect this.

Steve

