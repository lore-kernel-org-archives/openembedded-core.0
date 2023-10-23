Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D66CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 09:17:50 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.116446.1698052667105383073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 02:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKF8XwRj;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507975d34e8so4473400e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 02:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698052665; x=1698657465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P38HkSDM12aTeQHDoFMaafKKgX03YKE1aZoD3is/5OA=;
        b=dKF8XwRjNuQdEfYrDvoENRpu0sDeB7lTLoN1+hKcHfWSKxJ24RMt1/tNNJLy4k36Y3
         o8AQgDvNveqjhbwxeSwH3kNhk6TarJBO6+BIc9B/5VhJeWFOTgLGGTIfZRSFh8IIJvO7
         nkDKKmlZ82CNG4QsbtpwACkB5YK9LSx0EJpO6C6y0qTyY254NHe99kYbWOIxZ8VOcqtz
         6bi7JwvnDWApmZDNWU6c2/Tlgdj999zm8fYxIOFrKAD6d2AWM9IQSc1li2TbJYjN08tV
         ohTmXo22+GntulJjA+siOz5g28OFJRhVoOE13YnDNsUc2XoTdMUQpMBHP0bQg6Q8nLL6
         +Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698052665; x=1698657465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P38HkSDM12aTeQHDoFMaafKKgX03YKE1aZoD3is/5OA=;
        b=jXuWADqCs7ZE/YSPsbfjVXQxibWQB1ParVPLfK9+P+oXvUzGKbZQSgQ69CE3QBjUSc
         ld8bbeYVGudoAE3O6rz6XZXd5jJu5Vzp4ALFVzrocct8gpoV940ZZ7FFh6SqdePN/GjR
         u/FSgUIUXt7lBUwGBhAlV5wUsHbFbsuhv4m7hJHnvPmh8PkjpnziCxrdRphii6XVdzTz
         yfALbG4B1v/uXHp/JbRV+Yss3R/qQbJk+/GCr7zVpWZTMbK3gj97Lv7+Ge7ExZb03azy
         7xTigK/vaNt7ercZ4uLbLQ2o4c/IWw9epbaaXPili8O9PNbjR/BHjafEp3EBiMFyfPxm
         /EdA==
X-Gm-Message-State: AOJu0Yz6bWqSOLRXCj6p6zhoArBZYo1UK53gFWZNOn8L0L4xE3NS+BlV
	lKvHRlfZl5oZbXlfJERFS1vb/zEOuKw9PtC1JgY=
X-Google-Smtp-Source: AGHT+IHQBEhfpLGbuUC/tddkVHlv8YAHJqAw2Q0MtIMEVu5kKtVa06lg5VfwGFsUCVhczFIrSelHBzSRf1G7WqeeYQU=
X-Received: by 2002:ac2:5dc3:0:b0:500:8f66:5941 with SMTP id
 x3-20020ac25dc3000000b005008f665941mr5905952lfq.50.1698052664898; Mon, 23 Oct
 2023 02:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231018084652.900785-1-alex@linutronix.de> <20231018193932e6cb99ef@mail.local>
 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
 <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
 <17906BBEB8B5FFF5.20272@lists.openembedded.org> <CANNYZj9psB-6JEaKp6HyBbGy2VTHxn8DQ8MsRweGYJYLo+ikfg@mail.gmail.com>
 <8614ecbc167a87768f710b5f1b43c26221aa3202.camel@linuxfoundation.org>
In-Reply-To: <8614ecbc167a87768f710b5f1b43c26221aa3202.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Oct 2023 11:17:33 +0200
Message-ID: <CANNYZj9ofMU3NF9qZ8nV6-UvvHQ6_J8=+TcBj1MaQKLR2pw5TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for 'bitbake
 -S printdiff'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189616

On Sun, 22 Oct 2023 at 13:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > Seems like that ('auto') had no effect. :-(
> >
> > Hit send too quickly. Should I try with your suggestion?
>
> It is worth a shot, yes. One causes a local hashequiv whereas the other
> disables it entirely.

Seems like it worked:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2314/steps/15/logs/stdio

Should I fold BB_SIGNATURE_HANDLER = "OEBasicHash" into this commit,
with a FIXME perhaps? Tools should work without special tweaks, so it
needs to be addressed.

Alex

