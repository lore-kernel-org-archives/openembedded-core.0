Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4F1D2125A
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:49:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.44677.1729154936676773568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QsarcttV;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso7380211fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154935; x=1729759735; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gASyDLP5QPJfiejtvs6r1jqvE8IO9GJxHp7+4gcYNtk=;
        b=QsarcttVhIaZP+smfYQS/yem9yUIjN5IfAouKCCln53FJzXizdCQJT5lZ0YVIE8q5a
         3Ct4+gvXiFhWfRkv2b+UuBqB+WIlxd1tPvFhdZwGrDw51ZY2cbFGFIdlTAQpcUh0rDsx
         BpGL1GMAlkIHlEG9lo9E3fQKqV5E9XFWHAysJorG0EZU9d3voqawi0Fykk/7k63mpiqG
         uSr8ODmoB2zBefCN+oQKf0G7vHn8nMtfgO1i0VdIj6pGS8SedGE1DfPpycmy78nN4OCL
         SeVsYWxRKFa8bE0sghCxp0VH4wHaYI6Akfy7MW+Mh3BKlEXC0ilNFPORViKMAe7GH0nE
         xFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154935; x=1729759735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gASyDLP5QPJfiejtvs6r1jqvE8IO9GJxHp7+4gcYNtk=;
        b=US9RAUO7hxbSHVzQiejS3PLEXxIDObTBKT9S1WIB8GcUiFma/QAlMjtk9g2bjXHJ74
         fj2j4Es+sO1u6JFThYhZpyq2iO2sR7T12R0memSw5Tqi9/EVls4P1rdyi8v9KL2MyIje
         8OG/zi9OZNuv+AlFe4abDRtWqIsBPI2lbJ3hit+yjyMSWP0yMJmio6T784s42cb9/3ci
         Dga2923sYZs1noqVV9n2PEbjqcNGYEYHNqGCqf5AYxgMUJ2zH9PSFSKwm4KVfpCBWkrb
         SG9/I5XrBiYS/KGRdfiPOXbmc/OC+30PRja/SyGzhKx8s56tpNZWwHGMeuHh0DT6s2a7
         srXQ==
X-Gm-Message-State: AOJu0YzacmNwTqkLRn5qhlDGY2tNlfOe8o9mGrjmRJr1eWFxtqrtVK89
	5imt/1hVBcM+rqAZTlMvxaUzbALt00Vi+HmegBqHywsiCFObNEv2pfpHEO8WBc1v9y1B+0jmHdG
	cdffcQ4E+QKfjR3T187ijiXEyE6/nUw==
X-Google-Smtp-Source: AGHT+IGMPSmE4PQDqqSE/76CLS9BolVdYOY/IzFKIGYLYQQnnTDhGKgIjufqSkuc42NK56SdgDN/krcgthAAUe+PG5c=
X-Received: by 2002:a2e:511a:0:b0:2fb:5014:8eb9 with SMTP id
 38308e7fff4ca-2fb5014914fmr55572831fa.10.1729154934632; Thu, 17 Oct 2024
 01:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-2-alex.kanavin@gmail.com> <17FF097430B9CA8B.11625@lists.openembedded.org>
 <CANx9H-A+YJEcstXeh4N74m0N-xtm7AvWT621W18G9MtajG=a5g@mail.gmail.com>
In-Reply-To: <CANx9H-A+YJEcstXeh4N74m0N-xtm7AvWT621W18G9MtajG=a5g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 10:48:43 +0200
Message-ID: <CANNYZj-SK3jt365gTkjqh2kZXAqFG=L-vnQeZWPxXYY_0o67Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-cryptography: update 42.0.8 -> 43.0.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206007

On Wed, 16 Oct 2024 at 22:41, Tim Orling <ticotimo@gmail.com> wrote:
>> Tom already sent a similar upgrade with more info in the Figur commit message.
>
>
> s/Figur/git/ (stupid autocorrect and clicked send too soon)

I just wrote a reply it explaining why I didn't take it and kept my
own. (it also doesn't have the needed reproducibility fix)

Alex

