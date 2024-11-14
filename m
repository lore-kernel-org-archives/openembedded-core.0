Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE4D68B17
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:33:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.36889.1731591215641004600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gY2UvAaR;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a007743e7so654825e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731591214; x=1732196014; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+Z+qb/QDcD9waHpPC9slf/bJwzkIs4drmgyUjiugsM=;
        b=gY2UvAaR4kMOus5BvDSHsjrDbIN8O1iPzgV6NTklZUciCMWXkLlwDNcrSnlFmiIlX5
         cOCwHxXQlW9owdOlo43I4Bnb42QQvXpD15TukxHFmqbKB0zlqjOtgkLvvmeDnmf/XRPM
         DRtBVW4oDlu7b3oLIj+/BMa5UiXoOyyKD8o5uzaOdTY7HWDCERCy4dsuK0TcbGT05ykV
         DDp7HdTNjiWFyUMiZ4KMUm1SuGn+N9XMQKMZ7y9lc8Pz+smFOVvjaHTBTwvWE9/Psczq
         tXNczf2zXgiKeVFhnQDGjjXzCTnxxK7N+EGdKrJZNVyVXr3u2ErCz4DF7XipH+IfbsPJ
         AsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591214; x=1732196014;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+Z+qb/QDcD9waHpPC9slf/bJwzkIs4drmgyUjiugsM=;
        b=UihdTGKwT0vaK5a3OF7iHU2yf6JP55fuVZ2pOdYmlG4NZuI74a5uTC8I7w3O7+C56w
         22/zwCPGcxS87YbYXqItbnidJdiug8+bHCwpmOqFNP9tROULLwvYMXBP8k2HZGjoJPp6
         BI63Oz/eJUZ+PD+OdyYUYU7FHWJ/6IJhAp38AciS1h+0ijdMN1JxKuKQULjNeUaEm6GP
         HNyQtUXUOlFVtRbNO8pcCEubEeUGB3xWhfyJzTO1nTpy0ZcPlL1RcfOBtA4YLvoNoDUI
         NHLHFr3UQorhjI9MUHMTr0fhcmxxhVM2I2bvF4C2OrX9aF3SxQkvzlbXTsDfFRQkke86
         1CVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Lit5g9nE6mbYBGYkAB+vy4r4BPT+R96xOZ8FyD+n8slqrtWdJ9OTmKW5mbTs4wpSJXGkMDHp1/ukNECQhqjNJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYljxt13/A58QdSMG9d6yBcnGW4mn4rYnjqSuSsaFTmDRR7/sM
	Ef50t08zlkf/ZsH3DdI08rbj3PcSYBYrE0kDp/CK+BXN3L0yHNaSO2rYVyWzZQuS6CcTky/uPXE
	ffnOnx/H0hWixOddqu36CR8TMgLQ=
X-Google-Smtp-Source: AGHT+IG0KSuMBeMCKi143rwyC4pPyzli/0q3GMp3b4asMx2OVsWApDOAUWeks2hT+IP/9RFrOrmJZD80vhJ9xsUll9Q=
X-Received: by 2002:a05:6512:3a87:b0:53d:a523:c248 with SMTP id
 2adb3069b0e04-53da523c30bmr1362993e87.17.1731591213536; Thu, 14 Nov 2024
 05:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20241114111100.2624737-1-alex.kanavin@gmail.com>
 <20241114111100.2624737-2-alex.kanavin@gmail.com> <ZzX5MAt-zQy46oM-@bootlin-mathieu>
In-Reply-To: <ZzX5MAt-zQy46oM-@bootlin-mathieu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Nov 2024 14:33:22 +0100
Message-ID: <CANNYZj-w+h=1mSux487f648yvPnSfbNJEUnynkh8U9tBB0tDZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] bitbake-config-build: add a plugin for
 config fragments
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207165

On Thu, 14 Nov 2024 at 14:20, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> I did not manage to apply this patch on master as I get conflicts on
> meta/lib/oeqa/selftest/cases/bblayers.py.
>
> I might be missing something, but can do you confirm this patch is to be
> applied on master without any dependency on another patch ?

A mistake on my side: I sent it from a branch that had additional
unrelated commits before these. I removed that, and just sent a v2.

Alex

