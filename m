Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F92C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:26:41 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.49528.1743420399069675643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 04:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0NEDOGW;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6df83fd01cbso20137646d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743420398; x=1744025198; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4v6hxG6MFHjTqc81+hv5S0j9qqie+LW0EHPvoa0oB7E=;
        b=K0NEDOGWKm8mgearphQkUwq8s2td8ZWlx0iZc575oIVdZjpsyMI9GZ1Ow2/WJX1UUt
         Z8Dv5KlBAeRYclEpS3sFgiyd+M+uPa4ExCz38SFddgYgJilDsJMf7LqC0ZapnN8UwJaB
         IYw12ZVk2MkLuVzgqfhwCmlqtOxuvilInb7+yOnKiM9mpseFqtiCwE53W+7KkNtdbu8F
         KJaoiOLFAfCTswAlG4om6HyxxyeQa/swARWEafqhlkNoQypDO1vowVO1JN9ghLauL++D
         0b5BDSDMQAgVOL0NgI4wBw3i742WXO9RdLGRAZDFM0rkdq3P1cO3KeUZRaMkCGW52Ved
         wfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743420398; x=1744025198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4v6hxG6MFHjTqc81+hv5S0j9qqie+LW0EHPvoa0oB7E=;
        b=CpsB6Jsqbc+9WaIEbb0yWgDmBT+PZIPzo5z0rhc8MbCmxUcmuNq02bO7ORt8lcLtUC
         biQOBMwtS3zSUIueQM9qRJ0YABWpDPOnRjnf1xP/PSMll9o80crlZqCC3sqVgWaCpng2
         qAIwMPMRBJrM5hw7T/jSMA+TlKsFO6M5JHPWnCl386xljxAUdXIQ8cUWnOtcFxJAT2ya
         Q50LcNXO3ahDMRCZnla8Fxr5ByovlfCE/+hxij8/+kO9B7+wVn6emZ2QfMbn7Wtm4lFR
         e0glda/A54fxhFWhv1QwmCsGOC0OPmIVdH3hNYThQoc1Dt25GNUM9NKuG4cSCWbJSZSw
         zXRQ==
X-Gm-Message-State: AOJu0Yz2Us3YI/inJiGuZQmf4rSl2yjMPkJlx6qpyt1sz/6BwCZ9TFpr
	Bd5ygVw2SO+V2wa5QV0xo2CelfI086Lxymzp84hM0BkvHMO0vPG8m/JV39hRW/NxRna7t+SJlo4
	j++ysfOb1RUKr9XbnL3xBTAJLHsg=
X-Gm-Gg: ASbGncuzHX7WoZV+kg17i2zYqOuQjPAy1GeXDP2HERFdyD4lJLrezRidgdU+KZVaUn5
	wZTYJLRrXYbsrgRyMqDKwV+ZZaFjB3IbpP18q+7oYo41zc7B4pKQfU71A9De+FlZZXxRLeJdX24
	t2QV+xL0AbZ1hwFkpE8wvFeg6BE5Xf6KE0zMmCkoWWTtxOhYdcNAAzpC3zsaDZ
X-Google-Smtp-Source: AGHT+IHiNcRUNJehgOrWykbSe/vHQjk/X4qtzsUe7TvHGOvkP1iQDTxoxyS5QYgmc5z/Ez148BunhleZSdqDAciI7IE=
X-Received: by 2002:a05:6214:d02:b0:6e8:ec85:8325 with SMTP id
 6a1803df08f44-6eed624aaebmr132436446d6.39.1743420398058; Mon, 31 Mar 2025
 04:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-iggtcaaeJfD5opNQEr8A0TFaqaLuEuYwUCXrk=ZVoKw@mail.gmail.com>
 <32465.1743419604038823066@lists.openembedded.org>
In-Reply-To: <32465.1743419604038823066@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Mar 2025 13:26:26 +0200
X-Gm-Features: AQ5f1JpZag7MHoqOA4Rsi1J12aMfXja_WFIUvsZv3yM2ODo3SQUeQ6KWJkEMHsA
Message-ID: <CANNYZj9wb4wkvhwmPnj=FmQAPu1G-oWDxeFGqNDZBLjHo6Fb5A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc-y2038-tests:add tests-special
 in run-built-tests yes
To: semc.2042@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213967

On Mon, 31 Mar 2025 at 13:13, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
> Since the change is in 'Make[file/rules]' and 'Rules' file,
> so upstreamed for scarthgap branch.
> Once the scarthgap patch is reviewed and no comment or
> any comment is present, this scarthgap patch will help to
> avoid extra-work for master branch. Hence upstreamed to
> scarthgap branch.

That's not how the oe-core patch submission process works. Internally
you can write and test patches in any order you like, but when sending
them here for review, you must submit for master first.

Alex

