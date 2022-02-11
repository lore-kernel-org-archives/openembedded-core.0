Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62587C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:39:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6149.1644579597711959744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=LFukBIGA;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id u1so983143wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ymQItRlOl80AXUv87KbNVqUO3m77Nnj0dhAJX4hiv00=;
        b=LFukBIGAKwGbmHFy1IpclhDS95v/8VSNi+EVZRlVsNy6giabg4FXgpmHWnssFk2Svb
         Gnsb/bEJWfgfQ9RnFHOIiFzUWoDz5hipN6qFEjucjVW9kXw0VF2T3SfN/Vs2q1WYYy6T
         eJnjKAye1vVnYuqSE6E/WmCZo97LHKayYO4+ij6wYxYfB8YA6W7VjIeW9+hAMMyJBdSh
         N4reJ78iiaJ6NXEo1dvrLlKMlO8Op/0QZMRN5r2UhcEGaa+7mGx2VQqhxfVcM8PGEoyQ
         FbEDBiG9fCB9OzIWsKfU1Er0DRO3rjT4vWP+bkYiuniVlnsXHsdkHuzFvTyzVr4EYn1q
         4tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ymQItRlOl80AXUv87KbNVqUO3m77Nnj0dhAJX4hiv00=;
        b=DHG1SmzyvUYjnPGmKTpHb6POUSwG0i2vf/xD2ZKZVuaCb0hJ7WK9fdxDE5hKJJWx4R
         YhS9b7/LVvcy/BibOxI6EsDSD4hZKIE2lLEpcsNltaaEUgGHY5VOJeobTcwWrCRZLiQU
         I1xV9dW0w0x7txXGjFqJfRmXIq7pR7K8l2AQr58tIyjoSr9BrMg3+8cX/wNL+zkfWH6B
         4oO7zEuF2h3bWeYk8eg9tQT8rvHYLzQB5ofE0wXenbwpUWKiny9GSvEj+UWuP14PiWFv
         w6lzngB2STF1JvPHpGkFYSNW/K2rUQTO+6gktXsZBpT204B6iuB/CcZHJ4y0Zj6s+gZd
         wNuA==
X-Gm-Message-State: AOAM530ZGE9tPgOxxA5VtsN02bKz5paMno19/OjxN5exUw/g1lFVgizk
	5JMp1H+Se2xSm1s3tmsVWropFvHDXqhsAnOYrYuDFURqgDOKuYLQ
X-Google-Smtp-Source: 
 ABdhPJz+LeqONlgroq1p3PsoimrwevfLoGfus3iLoKklgX02ahAb2jczuAht8vJtTAeLrErKU15G43Lghi6d7qoyG60=
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr1054990wrs.620.1644579595641;
 Fri, 11 Feb 2022 03:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20220211084433.10614-1-pavel@zhukoff.net>
 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
 <be3113b8-81a1-ca3a-32d2-4fa6783bfec2@gmail.com>
In-Reply-To: <be3113b8-81a1-ca3a-32d2-4fa6783bfec2@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 11 Feb 2022 11:39:44 +0000
Message-ID: 
 <CAAnfSTt==tDAVW7DaGKKDwwJvwGbTQPw26-Oc2dDpeQf263Wsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.class: Add possibility to configure
 networking check
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 11:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161644

On Fri, 11 Feb 2022 at 11:23, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> I vote for removing the check altogether.
>
> As I understand it, the check was added in order to prevent
> hard-to-interpret error messages when network failed. I can live with that.

I think the check should remain, and example.com has served well for
some time now (since 2016 in
423a2645377bff2cd7292e1dc9796eeb3595e937).

We moved to example.com to speed up the check: the old tests were for
two yoctoproject.org URLs and it downloads the entire page, so that
took time.

If we can get a minimal page added to yoctoproject.org that doesn't
involve hitting WordPress, then we can own the URL and have fast
responses.

Ross

