Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E07C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 12:05:46 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.29157.1665921939385232559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 05:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YV/KzQZV;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id l3so4238286ilg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wlAQV3hFF+S9rpF0Cqf8h4b18CRTElR/vpwpk8fGUG4=;
        b=YV/KzQZVtsh5dP5VjmPH4g/w+bL8yuOpNCyBaKhCVH2NMhsF7kLmNRAOmAUBhmcUH3
         jv6ThPtxx0TAI0ve9Oxq1tm4KzRYOtXH0GyQl9nJWwD1AqeCuGNDyBRao0GaShBWBL+k
         gLO0KMfK+H9N6pblXG787coR5zG0yeY56JsFsb+u7Q6lFUfqQHtMPypcVOyxG6njv2I+
         sRj17FsWjUNIjSP4/xzmz23NAINthiLSv8N4VIlteKxNjft4m3n0kvJJ7LGbM+kyVbEG
         6QT9/z0tIbveRgD2lhvinMg6hI8mlXxeC0pAz+GAyGJsqVvqI1DmLrKgGQSKt31L0NMe
         kUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlAQV3hFF+S9rpF0Cqf8h4b18CRTElR/vpwpk8fGUG4=;
        b=77a57cb7xFHXL1JWq6Xy68PjFGbpDncnrT1FdSOZoyOKzvHaffjuJCIctVrxqVcNGk
         o6Dz+Wk9Go8kIEcul7MD56fNTavny5UeXoqJWDmj8jKBBjh/g1yYZa9CG6ilsWNv9Xtl
         rb3kb3zWva/j3za13kPX+8DlkU4PKSATS0Zcg5i4UsnVTpH5vdm8DMNXvs+w3Gc9WGpe
         H5/fccHtCBopNvZn49TJR27NtPEsiPxRUWsF/E4zTN5wHmg+1MZ0MRxyqj5rC7INOocZ
         tV3oNYB4apRCLw0eZW2y6q5W/WTdT6mF2aAU/9aTkV2j579wOb5HwdKXhQCMgZNOfWRw
         w+DQ==
X-Gm-Message-State: ACrzQf3zFNLMWbWN9fYSy8ucUUezZB2iv2oMBRLTsQCTSxnHrh4gFfPR
	/i1bgy9wie4YEHGPFh6D/F9sL57WZZenRiftDK8=
X-Google-Smtp-Source: AMsMyM68IMe33JEzoIPnK6WAJekOeArumKJRJLsLYz+KeNeQYLZj7zYneDhYk6R9nFN8N7Jgh/Y44lkhFvP052Lc9Yk=
X-Received: by 2002:a92:cda6:0:b0:2fc:8e0b:31a3 with SMTP id
 g6-20020a92cda6000000b002fc8e0b31a3mr2807023ild.307.1665921938576; Sun, 16
 Oct 2022 05:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
 <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com> <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
 <38f702d0-1b86-9612-e431-a43fcf960c4f@gmail.com>
In-Reply-To: <38f702d0-1b86-9612-e431-a43fcf960c4f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Oct 2022 14:05:26 +0200
Message-ID: <CANNYZj-wE01Eei1eEHOoywngiBO6Sgp_gp3fLxDQEFYAzuPE6w@mail.gmail.com>
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 12:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171893

On Sun, 16 Oct 2022 at 09:56, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> I do think it is reasonable to ask for not being mail-bombed with
> machine generated emails.
>
> I am asking for either to:
> * put them on a separate mailing list
> * merge them into one email
>
> If keeping core updated still is "Alex's problem" then the AUH emails
> are not having the intended effect *anyway*.

They do help, just not to the level I would like. They also provide an
easy way for someone who is not yet a contributor to become one,
particularly when AUH did succeed and produced a working patch that
doesn't need manual fixing. They also make the maintenance problem
known and visible. Sweeping it all under the carpet as suggested would
make the situation worse, not better.

If you do not want to mix those emails with those written by humans, I
trust your email client has a filter system. I still cling to the
belief that you would want to help the core, and only personal
circumstances prevent you, and therefore this filter will be set to
put those mails into a separate folder instead of deleting them
ouright.

Alex

