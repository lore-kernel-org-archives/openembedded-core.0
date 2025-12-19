Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F306E6688B
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:22:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25441.1766175759158833377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 12:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=zZS0GR+p;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.170, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1370340a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1766175758; x=1766780558; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=93FirMeR+nBPE4NVXye+XQECwFg4GTXCHvApIcWURrc=;
        b=zZS0GR+psKcCDoERWjUsNhum/xmXSKT8yzQw3pvRUvVAPCe/8bMSs/PIFRgYYsj2E+
         gfAYHNWzg6MigkRukS521/1psNCv3LZONBsJ7huf1mytmys2xPnnKNdwxM8VoCDCcN05
         HElJ9dIWFkBJ8QiIJEijPHQZ15NDFF1cVCWUM+rFrc8PRpoy1mQqMwR68MfZI0Sy3qNJ
         XB0RpBpeEwlpFuaEbwvXbzFJLAtWnlUvSLo9wrjcPpxZPwQDdMU+BZe67kmovq/HmU0Q
         GCxMyuoZF4hheCbKTsLYMH5QfK0AsL/0FZPlG6+0JF3A+fcbcnbMK8iyxV5gnCZeTi2T
         tcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766175758; x=1766780558;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93FirMeR+nBPE4NVXye+XQECwFg4GTXCHvApIcWURrc=;
        b=Z1ZAGT8T+Q5WirT9qPgST1rLPiup03gfmU6h9z8352ofCQIWxc8AvvRn/78AXGUnGh
         kUKqtv6h3HJkak8fo5jKfpvMO7GNa0VN/EyLKClt/yeLlkIWWnPN2Rf8x7D66mLPgwMD
         U7/Xj2lCgVJIMuz8OpzMR5sYLqPqnFxuuCHAHHs87qty/a9U6mUfz/8ozj3xcF1Ske6n
         N+Dg3WV1ZyXN+B0AmwhWUDbN+q6h/KRLLXRufQ0tZtz8XAK/kUH10kLQgVT2erf5O0pM
         2WYxbR+FmaH8OJQ+Xsb6p9z1BcK4g5GWhbkQGbd/H8VTaTAXVf+1ndrRjt1CN5NuYmCn
         rB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWlqT+2vlgWQdiwQGW4ZaJFWQhmMhpEdOmomKb5SM3sa6Y3rsLQeqTW61iIgXr07Kh1LkHGq5DCG1OVdqLRcS3Uw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ8gY3yi5rg5FgaJgIlRHE3Jl0hpXc2kXgMn4PLlw3holfAzTE
	TH2dnzQceqAspnOx4zy3udoXEueLFzrLAeCmdWywoHaPOgFsGWJ0HmgHtUjp4LzLi5+Zbzvot3b
	cTAwWrl7oVklEufmkldnWS0aaubUC2y3CeRZPSJELBg==
X-Gm-Gg: AY/fxX7QTgLOg6xC7Et9eJhbo7hFxSQAvNp2aXICF6Cdegi6NRr4UuIRhQu4WrnI2pE
	HgU9ohk7H07RKix1UxUej5od+bDPMjM3G3O8dLyh+GMLtRcdp3H1Hyf14cHIyOhHMwEvQHSnQfG
	DN3NoBw11YaRIPNVWjwcHdSpO6U8mpTEM81pcDgS2CJe0HFwZ/JtgCJwWdL9Ge5GbAbfXFxrrAO
	aN8Oop0RXe6fpjFkAqt1opFlF+uB58CbVpRmyxDZw226GnDbubnBvRzpZQMk9wBUUEfLjiugvPM
	NPo+K46VIXhGrKusYAfh8jLGQIROqw==
X-Google-Smtp-Source: AGHT+IEy9zGkweVFgHWGtOQ6KPtFhlk8ugxESNKseJJ6QGZifHpP597Kb9myi8T5Gd1P9FhSxKFkUbPEoYK0yDdKNyA=
X-Received: by 2002:a05:693c:60c9:b0:2ae:5092:935 with SMTP id
 5a478bee46e88-2b05ec48f34mr4407582eec.35.1766175758210; Fri, 19 Dec 2025
 12:22:38 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 19 Dec 2025 21:22:11 +0100
X-Gm-Features: AQt7F2p5yy0bf7IU8PpLHd_QPReP4pqgDGNsMRs87qs08Xk-R9w8EWPsRUOcZF0
Message-ID: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
Subject: Final stretch for the OE Workshop 2026 CFP
To: openembedded-devel@lists.openembedded.org, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 20:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228244

You already know that we will host the OE Workshop 2026 on February 2
- the Monday after FOSDEM.

You already know that there will be a friendly, enthusiast crowd ready
to take on all thing OpenEmbedded and Yocto.

You already know that this is the perfect way to wrap up the weekend.

And now you know: the CFP is in its final 48h. That one things which
you always wanted to talk about, now is the time to submit it at
https://pretalx.com/orga/event/openembedded-workshop-2026-2025/

Looking forward to read your ideas :-)

Greetz,
Josef
(OpenEmbedded social media dude, event conspirator and occasional timekeeper)

