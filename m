Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A01C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:35:19 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.55848.1697812509177479622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TK5xfBX9;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c50906f941so13461541fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697812507; x=1698417307; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7XLcbmLxZ3bZgqcQWIEe3jwzIqa822c4cmNRfdoTPs=;
        b=TK5xfBX9TurevAjgd1eogMEtB6xoBJ612dQbcdCO9Y6cdHU3V9IQ5CDdaHEqwpUeNk
         R2bgufZRTw7ab1Ctw+0JKNknHFPVK5Qzo7ZvZ2nwuOQ6w5BcyUA3Y6nheCU3Fmj+Sska
         SOy/ypiNFymbUYWRxQEk8IrbhSuKzyuXHOr0SKEWpE+8RMqblwg9OMwtYWdGxevo1KhJ
         MksJh0AZi5rUqiIawgD5oQYtpsbSzjlQwiJ7n9pp9zOWw19FJ78HfebGNDvM6+ZK1Wiw
         Jx5mP4MlSV+CC8Xm4vag/BhzMRBul0TbDtleGebvxXeYPAPImpI4oAeJ6GD9qgt0EjW6
         8n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697812507; x=1698417307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7XLcbmLxZ3bZgqcQWIEe3jwzIqa822c4cmNRfdoTPs=;
        b=ZM+EkxjTivQQzqWLsB3aCCp1SWe2fWKC05KKswhy2jF6svk0J8BDriRNlGLSuP6LcH
         HhmjDw4TqUEY66zCQfqHRgBS7/vzpvKPJwnEtSMGroT6Y/qM/E6Es+letoaYOA47ebeP
         O4VB/qs55wa3l5vxulkwaXypXWynZe6oMRYzbCzR+eyTDjlgJI3pBlViIPvGMciBoBx5
         pFxD0w8+d83gzimMt5T/pqFOo94X/jmv7mDYXAfX2toT/8kvs7zl8M/6yo1ygonpKXgR
         lOR4wXx6hgSjD5SDT37gLyNlJT5QjjMmjc08yX29CgCmE8bH9IJsa8LFYr7z/JXHJPiY
         GGdg==
X-Gm-Message-State: AOJu0YzsGxVklR3MqJO+LAVblQxSfJ9+FuI5wADegDHVx8yHT7hIKUOS
	DjzH6lL7lzcwEVgXg4iNbiZVXisudmjP+b+Oqw0=
X-Google-Smtp-Source: AGHT+IE/uUUyktbqMLe+kAl29tkks4IkzfBANIQEFdWHm68sluMZWssFi+TmUaTFGDZFE/jvLBJJvYSd+WTV7MAkabk=
X-Received: by 2002:a2e:7411:0:b0:2bd:d34:d98a with SMTP id
 p17-20020a2e7411000000b002bd0d34d98amr1439868ljc.44.1697812507129; Fri, 20
 Oct 2023 07:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231018084652.900785-1-alex@linutronix.de> <20231018193932e6cb99ef@mail.local>
 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com> <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
In-Reply-To: <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Oct 2023 16:34:55 +0200
Message-ID: <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for 'bitbake
 -S printdiff'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189540

On Fri, 20 Oct 2023 at 15:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I did idly wonder if we need to set the sig handler to not use
> hashequiv for these tests? I haven't checked if that would help though,
> I'm just making a wild guess.

I fired it up with BB_HASHSERVE = "auto" set inside the test, let's see:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2307

Alex

