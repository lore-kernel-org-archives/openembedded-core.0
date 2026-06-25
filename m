Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD4BCDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:01:36 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13670.1782399688573919301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j6X6VZcA;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43fc82b52afso1488085fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399688; cv=none;
        d=google.com; s=arc-20260327;
        b=WpHiYSXrXTEcMPZNB6XImYHR2Rk2gXU50qkbb5urW9DO+BwTtdqMcO/YFDAJZsD27u
         VjEwv7HPTCX8Q6k2vv3d26XU0IOiSAczk1bEOq4/gGe+O0BozLlLNynyo4lMgT+yaO6Q
         xGXKKBK+B4bobgQf3QWqf39y6iz6PAfINrz3iTz9FZ1zLBupEybT4K80liKuoSa2zFX2
         6A/7IOQ2Gt3GSfuFGcf+WZDXo5lllN/7zJ0kIsfsvFVEcKu8depE2hWJS8MWFiehOZOA
         p2IwGQd+lXhs9HW/gTb7YWUgdPBphCSuQHXWwWi8fdu8i7Q1XKIpyQ0tnT4Bh1uN4qwS
         Nj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2DQzni29ElcpYjgNeIC9As9hOLkTmACpPzuP2zXMlKY=;
        fh=NQynYflPbhwxCry+mt0U504sMPg3rrBhItGfPE/9NrQ=;
        b=B+CPtMiBiXJ/FxZGW4HECN9h2TOmLpMMBTta5KcZWpIJo8QweVf77X7x8dAM3nfdm6
         E8WUYNkGokJA4KONv7i2wNfJa8txv/SGrlpQJGecpxsgK+UURPFkV3h22QKSFCQOLbDd
         W83q9Yj3rnQNl6SPzSqG4LCj8QjViRvt68j5l6il0AdjC+Afaaff8T/QVcXHUrKC5mtE
         XEAuH7AEwwe7lt9h7VgCR5OClUakxKrJlkjfbt5YQvvqsS63sbfaH8k9w665v0UWLPp7
         iVhAJLJh8eM6J2OWmnzFkIsCLqAkcNhWRQuwCjfS1YkDUNBb1tMFKDSygJwYxeX8GgN4
         tyTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782399688; x=1783004488; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2DQzni29ElcpYjgNeIC9As9hOLkTmACpPzuP2zXMlKY=;
        b=j6X6VZcAnPWFYQVhQYLQTOEcx1v85HQuG7ibtbDzNQKIspxsjyOQEF+YcnlXjarc9W
         /soSkKQ87afDZsu4fr9FKFibzZ6eCQQjzxK4qmStBercWW2kgcc53dQl0WyxSL8WNxkB
         pxrEoJUVMakpTbjSCLTpu05Bah+iJMRn2sLG8rs7oMIzZbf52uQAsnqkSZ0G480sHC0E
         /7O4GjpZerXWL2UAKpH2/wW/ZJsVzt34N4FVuhH38f4/NscnfJgf4c/Dv+eEeVdUxXHd
         a90h/dAQ4Q+dnhC7HBlTgwyS3rhHwqfXj9AkaIHp5DWbvoKQukwQpvgmHThKL0AZLeQf
         RWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399688; x=1783004488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DQzni29ElcpYjgNeIC9As9hOLkTmACpPzuP2zXMlKY=;
        b=pdFxheLde3N6aVn4mdCbJcbQiXhD4K94zaCMvvIUE5JkklKP+FV5vsKlLTh2rXbI0L
         tq6zF2qp4Kz3q7/zMT6oLZxeYmPWJ5yA6svxU+745ytdUcrkCSvNME1GbF2vZnIM6rgS
         FeiLRe7qJGyOWNxQE5+IDuy6+BnVWblLed1OsfkSpDX+K09rwiYeToT2a4ekMJKA3ziR
         m9nPalyMvTqo50WzYUXxSHCdN+gBnbI3N8n+YamMtMXf0BTIvrZHwcKRVs9w9+yaa/Li
         SnKRQmkQmZ532zoXLJXl34a5jaKIM5Lrp6hq8kz7fWVeDwBI8ig9IayrVvnbGLS1RuOt
         mndw==
X-Gm-Message-State: AOJu0YwIA+E6faAGNJmK6wv0togu2rozhuzx0p833DstBZzb3mSiR8ek
	KjOa2GXQ5LBR7RhTUao09HKYCJVxRzRFCCA4ylX2NywP/Baq7A0hCNlEgZYyw5xo41y1JDN3XRa
	D+J18jcRFYsV6M9KrrCIpIPwaiZ18btE=
X-Gm-Gg: AfdE7cm8NY1KXkNEWUVeeJV+CIvu1M5kGROXZk3u1ZLSb5MM+c7qdOOI7tLvfen6y81
	TIJHityaLpxy0JIghQDeMYdc8aZwOtBjonVuqmUz8PHKgk8cND3VpO5OrpGuwpdyGH6lN41CuyX
	p5e8/MXUhtNcvqLKyebx6sMsZVSlNhXp2jRbFbdSkwp2XboGDMGPgnpfijAMJ9wgBr9Xg+g8Ivw
	+YFL0V1zej/2Behy/CLtWkOV1nRAS3w54lJsC2fDxmO+YtWT3G9I/GEFTA0NCl4bmYQYy2OWQ==
X-Received: by 2002:a05:6808:1814:b0:489:5c86:ba96 with SMTP id
 5614622812f47-4921930d475mr3079402b6e.17.1782399687006; Thu, 25 Jun 2026
 08:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260624083854.190049-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260624083854.190049-1-joaomarcos.costa@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:01:15 +0200
X-Gm-Features: AVVi8CdoNY5ilDhf__B4jjn0hGh6pxKXE1rHbFKxLWcBE6e0a413CSWwPQF84wM
Message-ID: <CANNYZj_WMnqwNbg16BWUs9S9y+V6FNzvQqJB_DaNN1siksLREg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-packagelists.inc: disable glib-2.0 for RISCV64
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239572

On Wed, 24 Jun 2026 at 10:39, Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=bootlin.com@lists.openembedded.org> wrote:
> Timeouts and other intermittent failures have been observed in the
> autobuilder, and they are tracked in different entries at Bugzilla:
>
> - https://bugzilla.yoctoproject.org/show_bug.cgi?id=15891

This one has been resolved six months ago, and so isn't relevant.

> - https://bugzilla.yoctoproject.org/show_bug.cgi?id=16230
>
> They also happen when musl is enabled, but not only.

I don't think the entire test suite should be disabled. We should turn
off the particular tests that fail (if they prove difficult to address
by increasing timeouts for example), but not drop the entire ptest.

Alex

