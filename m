Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF5BC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 07:37:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.3312.1657957047871305049
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jul 2022 00:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GyTxGx9Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id u13so11149548lfn.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jul 2022 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sxtvt9Pq8YToPFuRFy7qthj2FKJHt6bkc2KaJHtbh4E=;
        b=GyTxGx9QzRI8heTihBLJZxKUqliCxyrKkGkDUkar14QfZ8VairSklMi7U6Uqh4i/Fq
         GGMsmZWa9Nb3VRwzjG6Su7GuQpzYNc+G7tGuU6dCDLh+iHKicGPiXijzk95G6GRhzqpg
         Kdev3fiYW4SBGGOeAdA6WFV58wy23h/ofn03KX0cpp3gAcLocysCo9mBzWAy5/jV+4Oa
         FEtFQD4Hq0oZQXHK33A/CMqTWleZO7MOROhCTlAraqxJ+DzNU1vGNfomfkuAyr6t2e+O
         4FpttVG/8lEokPlNhpFGkgBSnJAYLa2kVOcDDwDw00NE5VLXjrlaY6WKBP+ED1vscJjT
         UcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sxtvt9Pq8YToPFuRFy7qthj2FKJHt6bkc2KaJHtbh4E=;
        b=f6kcuS4RoCmOZWc6UAUcIvr/ecTOaDc5tztRunXN6CrNtQ+CkvMIL3SF/y1INI9JnH
         WQnlfjoSFp48608ouWC6DOG5H/C7h3J0EpBgH2xPlEadq1nYl9xEdVIm6+UAf3sEuFTy
         RZ+E5ZKSt0uuDY1ou828jWC7+U89E5PUavQucIsr0aOg6QYvlAfvLqu+rSi6yOkn9rxb
         DUX6yWNL2dOOiwFOVzhjRlE/SE2DxUpi3DHFfC+cV/2uRh2kzilCPhVE/+CbjA+5ZgFG
         HHtw6HYqA3r3o8KKnWu0unoUudo36hYbo0Jr6hLNsZL3HUupXUhOwb3r+qdSJapCRQVb
         +omQ==
X-Gm-Message-State: AJIora9o0ywV5SdHNlXCpDASg3RMNZB7iuOaHmNtFTBcLpReTthL5hUu
	I0d3Da50wvEyLdUhgxPbgGVZO0do68JBm3uWzo8=
X-Google-Smtp-Source: 
 AGRyM1syWVN9cdxawJZOXixXNO+IH48HZVg9nXiKbvPC2bSf/YHbFpaVYl+6THL+sc51zyBCLWX7GHmj9XBHpfTxx7k=
X-Received: by 2002:a05:6512:3996:b0:489:d526:93e5 with SMTP id
 j22-20020a056512399600b00489d52693e5mr10177805lfu.534.1657957045788; Sat, 16
 Jul 2022 00:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
 <CANNYZj_fo5_KbvnXvCqPvoPiy6wgNr+By8Xf724aQm70xxCpkg@mail.gmail.com>
 <YtHiu9pR5QMFkXRP@mail.local>
In-Reply-To: <YtHiu9pR5QMFkXRP@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Jul 2022 09:37:14 +0200
Message-ID: 
 <CANNYZj9W6PM20kH=Fxz7tTj=KCM=08vYPosO9t+SvcijMJBW3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Jul 2022 07:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168142

On Fri, 15 Jul 2022 at 23:57, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> I don't think you need a custom script for site.conf, it is searched for
> relative to BBPATH? I usually just put it directly as conf/site.conf in
> the custom layer so it is in version control and not copied to BUILDDIR.

I was thinking of situations where the settings that go there vary
between build configurations. But we settled with RP that then they
should be in local.conf.

Alex

