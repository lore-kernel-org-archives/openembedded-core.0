Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22695C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 06:39:13 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144610.1783319948302066584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 23:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tFRxCybK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso18255566d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 23:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783319947; cv=none;
        d=google.com; s=arc-20260327;
        b=q/Kvt2rwAVi35d4eMWE/NZTAtFaq7AbBZQrc8Qk8sjaPdofCgHTLYWIFIdRVOUcSmp
         4JvPnFFrQ3PsSX7np+N43CsOVApobAAldihh0QUdWDJ4mlnZny4bm752lOjgfansWwO6
         o9nVe1r6MqSwHckxNYR4YdEl349aO6LhAyAMOnodDQ/PfXykuL9iBf3AhXrFr74I8HwO
         TRxevJ2NTCD5ebE34hmemWGM9DpyU6AP9X8BM0jQ3dpBkrj+lqE3TsW9FNVO6PRmRnj+
         rYcBxnjL8QLMUniNgqW7kTfR2CRmppFkSi0da0S/nM7GmXfmNZyHJn4IENSZGt2NculC
         qaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=al1Bk0EcSRbUip9lTFvfuKsEEsTxluE86ZwHgomGIic=;
        fh=uQWOQHiNUS1MJniOlqe3c/XNDtNi4hMRPdx/zJDRbu0=;
        b=OcYQZTFTIuKEphC7gihFPjqbDFGubxlO3TpDfsjH5kzasxQWvX1UuaFfvMACYE5vot
         YcD+AG0IkwcShyVZB5geZFGgQnXXj5fo1OlwmLrnjvMK5WHgZrKpvZeNZ+YmnRqfdbX7
         dyzWVyf2sPLVy1liIdB/qW5oFfrExbdnvrjtH3IeCiwo5/K1k+qxtbADjn05GqxGjZIi
         pRNFobMpk802KtrKFN3ZqeGO25rSe/nT/vZ5guTSyjKgLjU00N7iSGwmeCV+h9lyGSxs
         iFw4bkhRk0wblrA9cxNxHeIjaggi0dMLqth8kcoGEiK7RzRhEDQ6UFRWV5DY20+0PjI9
         NjXg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783319947; x=1783924747; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=al1Bk0EcSRbUip9lTFvfuKsEEsTxluE86ZwHgomGIic=;
        b=tFRxCybKKuFrq1ArFcopb5sCp1RRcUBf7z0Q110SoZzsJXmgoedxu4egDNP8OnznOj
         UsPMQGe1/kmfrjs0ayRQqCGJR2RL5lSIrH/IZrSQNQtCA4CTwHFcLz9+4uBJXXDLeWRh
         xWAw/gvkLQTA63kQl6RFYgHND1bYOe2No6MT/57GKZT6dtvZ0oD5H+95oBd70Iehe27G
         yiemmsEP8Gkf4aOm9rPsuM28yTmjNf4IzYoKLjTgBTYzPi+D1tvCFAo0x/grIo1Dhbvy
         hKODIO9QLBTgH5Qs8x66GImpE6u8bmgqBxXzlTP+Z7l0kTU77nWq9ytOVShUkRMabea5
         Hdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783319947; x=1783924747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al1Bk0EcSRbUip9lTFvfuKsEEsTxluE86ZwHgomGIic=;
        b=n8vdlLqwDs9ZYPw8DqR0P63jRowI8tuJdkm0n9kRiwdGRV6cWwWiXngyc86gDZgKRI
         eRQ/yriaifG6LmCVInvYHAca7S+Zv2yvvm1Gseg7DDiWDm6gJ3TUrBHu6SI7RcPkduN3
         C18YVaYRh0Cfj6WiC/rkEGBSanuPLSIbMyHIUf9cXW3AeL4Za9KxJ4eO1L/2qzxDoFLV
         /aFq8rVyOXrg3rw/XLC3prgA17rqGSxj4EdaC0VFEaATm9fAOkHPJ7dp1NJ5DXiLf/9x
         HBKmQF6soZBXIz8ncUL8NtH1EHTX+QQAXwfltWrkZtbDhVlY9OxqXMPQ6Yt75VyO+xoH
         4ndQ==
X-Gm-Message-State: AOJu0YwvGERe5KKv545J5Rl/273n3QUMSF0C2ddmazqPzFtIn8hkLL3e
	oy/r6MwTBmIpYZPCtoYRlhBzXshcmHUOKCuexIV5b5qPYB4lgu/A6y3N/a+5OHWk/dm0ZosRRYL
	TCE/F4sNSevwHo9TVzzV2h6ivtwJChbE=
X-Gm-Gg: AfdE7cnFmObdY7EyLc9Oozhyg40dLunrWHmPVIOz8OVIJfI0xhA10VWWmoIIBaA/It1
	owVuazFr2r6skb4MeCUjQaKGeDwswyJlGmzE8i1c2BUyV3E2r8urgVxJsSN3hOT70friZDnMmmz
	z4GUi/LxPCbXOsYKQRXqr2suBmABz9Va+ESs03R8AhJbwF6CgjSG8wfV9taqoxKJ/f9qmrKZrTN
	0POy7JxxTcRJL9d9vQUCSNA/X/sPLKe7RmDt8SsIpm8L85RHPAJljFjvOetBIr7gEQz2z/jkx9U
	WIOkSXh91Nqq/bpzIiQztjKObA==
X-Received: by 2002:a05:6214:2a88:b0:8cc:ea95:2261 with SMTP id
 6a1803df08f44-8f74bd99985mr137261516d6.36.1783319947068; Sun, 05 Jul 2026
 23:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260625150015.2832246-1-sivakumar.bs@gmail.com> <DJP0OZECQ9MR.1AGCZVSYCIK1H@smile.fr>
In-Reply-To: <DJP0OZECQ9MR.1AGCZVSYCIK1H@smile.fr>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Mon, 6 Jul 2026 12:08:41 +0530
X-Gm-Features: AVVi8Cf0Gv1q5ZADaEoeOSYXp_tkV3hd1SXB3ISsOlEL2gwZKPDx8sob_Jw-KZQ
Message-ID: <CACFV95LP_GOsVBP1NOYaT7iS76pNQ2f0qmpODhAf0jD2in6ZhA@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] util-linux: backport pam_lastlog2
 libpam linking fix
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 06:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240215

Hello Yoann,

Thanks for the review.


> Please don't rewrite patch message when backporting.
>
> Only append backporting info at the end. We depend quite heavily on
> patch being similar to upstream patches and modifications like your
> makes it hard to check.
>
> Please send a v2 with the commit message preserved.
>

https://patchwork.yoctoproject.org/project/oe-core/patch/20260706063055.1914103-1-sivakumar.bs@gmail.com/

Understood, and sorry about that. v2 keeps Karel's upstream commit
message verbatim and only appends the backport info at the end
(Upstream-Status plus a short note about the dropped LDFLAGS hunk).

> Also, I can't find the corresponding commit on oe-core/master. If this is in
> util-linux/2.42.x branch, can you tell me what is the commit?
>

This is not for the oe-core/master. It is already on
util-linux 2.42.2, which contains the fix, so nothing is needed there.
This backport targets the wrynose branch, which is still on util-linux
2.41.3. I've retagged v2 as [OE-core][wrynose][PATCH v2]

The upstream commit is:

  util-linux master: 5683ed6320e00205146cbb3d0c76462733530eca
  ("pam_lastlog2: fix libpam linking in autotools build", PR #4358)

It was cherry-picked to the util-linux v2.41 stable branch as
c8d0af0421f6 and released in 2.41.5, and is present in 2.42.x. v2 now
points Upstream-Status at the master commit.

One note carried over into the backport: against 2.41.3 only the
LIBADD line changes. The upstream commit also removes -lpam from
LDFLAGS, but that LDFLAGS reference was added upstream after 2.41.3
and is not present in the wrynose tree, so only the LIBADD hunk
applies (and carrying the LDFLAGS hunk would fail to apply).

Thanks,
Siva

