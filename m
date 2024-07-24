Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0598BC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:17:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.14850.1721837868824850120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kB4q3Q7m;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef25511ba9so9682321fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721837867; x=1722442667; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IhuGXw/diCSA/bb6fUzfyTM1Z4MvKOqJNXFcz2ov/Q4=;
        b=kB4q3Q7mnYs6Jh5h5ozjbyXBRPs4iejY6usRkgjcVsIVqGINAXQVQ+08HoxFXytUAW
         LvWEpQf/8nkLvES8UcF0JgTHa+FHEU6+MSM7f7yqv52y2spo2TK1tLlEbG23cFR+aWO5
         18Bik7gsgDyg5a8RCl/UquRV5gDvcpj9HfPH3hCtNrRfzmdFeZx4nmE4I/GjaQjnmF+G
         5e7L3J4gf2shniN2DX8xMLacHaBTG7Qxv4lPYVLQR2cA8JE1ou8kL29fTmjDqIu0+dcs
         da9RzpYms5Ns+9GJ/eUy7nmBKMhrSnVSKMZMXWyqkb9NVpSPwKcOY4a44jGE+2lP2OnW
         50yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837867; x=1722442667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhuGXw/diCSA/bb6fUzfyTM1Z4MvKOqJNXFcz2ov/Q4=;
        b=sB0jn0VJNQi54Zho+/LWP/aLli3zDG1/WXk4VK7BtG0eRif03RLJHeeh5SxKsRuCTa
         hSq0b91yVerrdRZbn+BGNxUJwBH7pdB7KUstxuOVB4DCRBPlgeXWcwv1IJI7oEUn4p8U
         u9BMgFBoJaK6MSo65UBS2sfyqgFR6jDhHtp7qnl11VvEeUJUQ7Cc5ljD78Ik83Ky2ErM
         TALE/m56Mmp4oCV/qXDFIhyfadmO4JDYfMQMCSVe47Bx0vNBs+U/mdZj3o4BJzXcfqyW
         a+2F7L+G+1UY+PV3BqCrqrb8oEEwIoMIeWnF50qVNMh/oVKDnaWO0g9X9b9oC/trI4Qz
         rADg==
X-Forwarded-Encrypted: i=1; AJvYcCVy7mjc4Qxfrqj4fszaRNaJfPMv5jPZx+7nlFOpvRNA9aXxvAVkB0OBKI0zxuvgdsfVKuxRY3SL6kTUTNCxwxoej069g/22xq0fC930icKeL5K8nMuoas69
X-Gm-Message-State: AOJu0YzNkPnBmuDWW3I5bUekyDrwzeYbQVfEav4Fem/EM237KWFAPaZC
	sdoeDvkVOlp0U/LIOHWxe4vIz6twoDJ7x5FemeFpeF8Ib2KzQfwvlyUQmZ2HRvwbwoiWOVFQoVc
	CNnCE3B6UTktHjBBwwQHJEDnlNomsqA==
X-Google-Smtp-Source: AGHT+IFaPAE5QchV71D8At/mXV4NeSZAu587nlnseexQJi4OTjROOQSMPxYEuD1vU8gPkFkdMRcmXIARwVuivbt+7WU=
X-Received: by 2002:a2e:a284:0:b0:2f0:291e:d1dd with SMTP id
 38308e7fff4ca-2f032cb1496mr7042551fa.11.1721837866444; Wed, 24 Jul 2024
 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com> <78ec945a12ed570b274041fe8b14568e270fab06.camel@linuxfoundation.org>
In-Reply-To: <78ec945a12ed570b274041fe8b14568e270fab06.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jul 2024 18:17:34 +0200
Message-ID: <CANNYZj8JHCp1O9LoKxKMzfy2vACWn7GZLzBTrBHrmFk44bDM_w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202465

On Wed, 24 Jul 2024 at 18:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Having listened to the discussions and given this is pretty much a
> solved problem for the majority of our current metadata, I'm in favour
> of maintaining the status quo and not taking this change, even if we
> have to carry a few patches. It does at least make the situation quite
> clear and explicit.

I'm fine with this. We have significantly bigger issues in oe-core
(e.g. the rust situation where the slide behind upstream is constantly
growing).

I think the really correct solution is a coordinated effort by common
distributions to convince python upstream to add the symlink directly
in cpython installation. Or make an official statement that it is not
going to happen, which would explicitly mean that scripts *have* to be
written with python3 shebang.

Alex

