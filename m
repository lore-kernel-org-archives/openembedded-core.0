Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5C2EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:05:01 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.29611.1691395496330806076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kj8yG4IV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso65587341fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691395494; x=1692000294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1EzY1DRLlsAnKwpexuv0vXM+vVzidZwttcXzgD3zQQk=;
        b=kj8yG4IVTxNRXIMEJwhc1scMzbaaBE5ZFknY+WQJ0WvUTExjuJ+KmhAWewcQhZFjek
         MvfISwg3KADpSa/vTNl/UlcfaaBACUk6PMXHHpQUqF1Oi13MofTo0jbSsNO9/zZlIC1i
         uBpjcRMADtnChtm/tLMQkH3dAuGElAFbqOgu7UYBAZCOrrIGP/nS+Shr+x6J/kHWOMM3
         NMIUtdAgGSubyv1bOMkD4bBXIwEs1P/Cjif520WdTJQaZ+EZo6y+NzLue+8qafMqDJOC
         ClQfqJmhIeLIqVkLXvJbuy9CMRo7Z1JZr4WjGECj0LkvJjSDEYJ83K1ejq9Eo+HdpYh9
         ST/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691395494; x=1692000294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EzY1DRLlsAnKwpexuv0vXM+vVzidZwttcXzgD3zQQk=;
        b=EaNrW/gGGo93S5TTur9ccOugAUOIDbKp2M00MQPieiYlybAYs3tnRk2YV6Qpabpg8s
         grDHW6CRJDY3TydFADUc2zPwGZkyn2DcwM/wAVwkyZcUUVuLW1f5CutgiYeh50z3aY6W
         SOv05SXmnPf6iYlV9WAb/h/aNOMtROHsXcu7DYcz0SqUYTGY18h3oX3wOz43WAdO4UPF
         61Dvbq0WI9ZY6fy7xWJVuy6y/hKudMLZJ2nL1clwJl7M+yp9fB8o/CHOYbZfiE67HZrf
         66r7kuiavoR9efmFNm7jrD273osWtVy9Yuh42AU5AaRxAmVJvswl0vRh+AtVO5rcSERc
         Q/Zg==
X-Gm-Message-State: AOJu0YzFcHSl1bIaye+KrjU5s1twlhY6VYWobt+LKAM62MWtDawv9PrY
	0rqEs8atMzWT9lLJ/K9xISTaydj0EN65A9Hg300=
X-Google-Smtp-Source: AGHT+IGU2gyufXFx0pVtp4ONv2zuWdSUkuUndFl5A2BuhNu4Q3p/J4HBeVDCt5XJ0VxUEh/nK9WvFQOdveBbq0h+Sro=
X-Received: by 2002:a19:505a:0:b0:4fc:dcff:773b with SMTP id
 z26-20020a19505a000000b004fcdcff773bmr4694264lfj.3.1691395493740; Mon, 07 Aug
 2023 01:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Aug 2023 10:04:42 +0200
Message-ID: <CANNYZj_QRe7SwA8+7_oVN=YJC44VtqtwYVveriXUudwfP-TdsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5 v2] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
To: charles-antoine.couret@mind.be
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185587

On Sun, 6 Aug 2023 at 23:14, Charles-Antoine Couret via
lists.openembedded.org
<charles-antoine.couret=mind.be@lists.openembedded.org> wrote:
>  documentation/ref-manual/variables.rst  | 14 ++++++++
>  meta/classes-recipe/image.bbclass       | 30 +++++++++++++++++
>  meta/classes-recipe/image_types.bbclass | 43 ++++++++++++++++++++-----

This does need tests and examples. You can grep the poky tree for
places where related variables are used, and see if you can expand
those places to include the mechanism. Please include an explanation
or a demonstration for why existing facilities are not good enough.

Documentation updates go to yocto-docs mailing lists.

Alex

