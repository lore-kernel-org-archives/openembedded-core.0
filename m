Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C042E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:49:30 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8700.1771408161113173304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 01:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WxEuS+BN;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-896f4627dffso61796716d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 01:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771408160; cv=none;
        d=google.com; s=arc-20240605;
        b=azmU0mvJCU1hkGTuG2+IxZvpPga+0D3C1cIaymEd3P9rGC64Qhl5AcJZWP82c3qXZQ
         2pA15L/hn8eo0aLbcHoqywtkbs/3HBbtK02UtSLXPjbODBEzzMUyPsE3xRD+0/xL5CQm
         ZMpjt7fK6GcUbZR7b+qcffm6hntdOIIpds/VSz8UY4q7gNEzuzkqmUODNGMxgz67EFSW
         7K3je/+nuvZvde3+iqJ1YBO2NXKEDz+zBVxz2bfzPDbcztXHny1YnWglSaXn1yG6JvE4
         yDgDGzBBm8V4GDBMkfH8tICVvH9rMif4rtnFoGQKxk2RGUyV4+koZ11J/2MPITB7DDz3
         D/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75MEnNa+yyr/O56e4ua6A0/hltVdfkO17pBhMkUpwtw=;
        fh=fPOPf1G7jk3Ey+79L4WObw7PgfMMbjV0gji9SMvK2u0=;
        b=Z4a/xLWGDkEykGTqAG6dWQ01BDp2W/nkI5O/lrfVcWAdoYVEcy0a04FLHiqig8qS/S
         yj3/ruaJf0gWCxt68YEEv74Etq56x7geo3LvQW1ujL6UIcL8Fm8aIxkpaSu7mAXejkhd
         gy87YovioiPJdkxPgOmcslwFHxEr6VJRVgNQ1z0GjkzNd/8OeR6/LEyEcz9IBabW9IJo
         jCGMhiHXd31rII8E/KSDl4YYt2IyzuYZyuzOgl4jBZKgjX5yS5fdZAoJfV+IljVFVqR3
         +jn4hVv/BJEZrgPKXW1nQtsWsi3iNc6d6crRk9BJEUDjaiyBWbrgEAqHpFrocnv0wBXV
         A0CQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771408160; x=1772012960; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=75MEnNa+yyr/O56e4ua6A0/hltVdfkO17pBhMkUpwtw=;
        b=WxEuS+BNvjaLFqeyTYcDJuq3fzMKETq2iRZHiekJd+apKMi/2Tn/0BYgBdiwEJrvBp
         Ac9GTVgpiqso+quR+99/mmAuq7ts+OAeO4AXellxzx45AKp9mGHQxFgZIqFAaTko6fw6
         qQcZ61lxACt48CKnQLC+RJdw2vB5cIljlGh1NkZubBIakOIqz2SFCrF67WJ4FJ9sUl1I
         v6fPtQEMJg/bkxl1iLmZ7FJs169+3diGHoZ2sXI4fbdlystOtXkr+4E97tt63xgsYECn
         tBLXejJ3svXj6wlv4x0wN2qdLSHirziLZjRKbrd+BZdz86SAekfZuVoHqhYAoluUPKF7
         eK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408160; x=1772012960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75MEnNa+yyr/O56e4ua6A0/hltVdfkO17pBhMkUpwtw=;
        b=os/6SI7v9lOgbdLpUzSMM9kbiFGzzrp1X26zl6S6Y9v7RxnwhhihtctzDeQ1svQ3yG
         GcdiREYTNionK9EtwbrSDWvl6/KDqREi9ZM5lvJR8U5Xl1jB7D+M6OtzI6F9QhL4xh/I
         bAjKuYd0h091lvK3s/fBd6T/JsbTwSvf8pSZP2EUaE4vWucJ13xlNaWN+OW9GtvaIUw3
         86TPjsQkyt9MmiaxRzyShjH0rZtHvea1RhybeEi5dBf3Jslvf2bpQDXX9QcpjaFhCdXN
         iYsCSu63R6pQbTtBAK10CwRNCDrPZPcoNhDP1HOfmA+4QDYP+GoLaS6E5dW/w8Cs9U/C
         Cg5Q==
X-Gm-Message-State: AOJu0YwogpadDmL0VqMskfvXkjxmOIP+BYEO21Hs/QkARBcImk76yXxU
	zXMzJOEHAkDIcw08g4qcncPk+xNVTCaFvo95fsK9vQ7zHe2uAv6+w5/NowK5yrR5VY6WXCMeKvc
	W8k124zhzQjpNsdYWzHXFOrPU0PgZ6AA=
X-Gm-Gg: AZuq6aJHXa/npOzAJW/N/Qdz96UcS1LpwhW31epF5voMN5Gp4hD/lXx8O7Up29GNiOk
	n2tcOx8DK5/ouImPInXoXb9DYowk3E6U1327G9dvEjlQp03gjNkaTVyMEWhb8YsgWP1A7GxV1OQ
	5avW8I47XHEVTFqj8F17dk8jx5uCYlanubkaFvkt4pWPis2H60KZzCoZL7dg1SKFWgzvlwQ0Wkn
	QWh2QfyxZBwBEJDFNXEJHvGj6H2rjDWL+P6XeiW7g1obaN5N5c/gDku0TXeusgWCoQxKjlm/PvY
	nB4XhQuF5qefLjc7DM+eqXytg0BsUKjfPCZQWzXSzw==
X-Received: by 2002:a05:6214:268a:b0:896:f97c:2f86 with SMTP id
 6a1803df08f44-8995804839dmr15438056d6.35.1771408160023; Wed, 18 Feb 2026
 01:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20240219012832.3090768-1-pkj@axis.com> <20240219012832.3090768-5-pkj@axis.com>
 <CANNYZj-k6i0nZkSibyU+UX741NAe4j4ue04vjrs5Nnn1t3zEkQ@mail.gmail.com> <DB5PR02MB10213A9566417898F6975549BEF6AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213A9566417898F6975549BEF6AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Feb 2026 10:49:07 +0100
X-Gm-Features: AaiRm50LjP2I3GJvkqjUB-tC1NhZMWa5_Tnw9t3KX4SFvu0mJpxBYMzvsEDvZfw
Message-ID: <CANNYZj9JvKCKgDtBuLxWfDAFyop07sLO3kiqcjsqkWwoLgfnNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
To: peter.kjellerstedt@axis.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 09:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231291

On Wed, 18 Feb 2026 at 03:18, Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
> This was two years ago, so unfortunately I do not remember the exact
> circumstances. I have tried to recreate the problem based on the comment
> in the code above, but I have not been able to do it. This may be due to
> the version of Git that I am using now, compared to what I had two years
> ago. However, I also tried it on my old computer that I used when I made
> the change above, and which I believe still has the same version of Git
> as it did back then. Unfortunately, I still was not able to reproduce
> the problem. :( So either I suck at writing comments describing problems,
> or I suck at understanding them later...
>
> I also tried to figure out what (bad) consequences there would be if a
> note is attached to an old commit during the rebase, but I really can't
> come up with anything. At worst it would be a little annoying when doing
> git log. However, I can't see that it would affect the functionality of
> devtool in any way.
>
> So based on the above, it is probably ok to remove the code that sets
> and removes the dummy notes.

Thanks for looking into it, Peter. I have meanwhile made a commit that
removes the code, and ran 'oe-selftest -r devtool' with it. There were
no failures.

So the next step is to do an AUH run:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/38/builds/58
and carefully review the resulting upgrade messages/patches for
correctness - either there will be a test case for what the dummy
notes were aiming to fix, or an additional confirmation that the code
is okay to remove, as the problem is either very niche, or
non-existent. Let's see what comes out of it.

Alex

