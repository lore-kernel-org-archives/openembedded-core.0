Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF137C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 11:42:33 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.10112.1675165347232139355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 03:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJHCjb6V;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z27so8366778ljq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 03:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNvQqsYvi38rUrvvwqGTXJnOjLPlk0qXNoZ8Tmq10nc=;
        b=MJHCjb6VL4iiWGWWdTS+uYDuGPvQSU/9XD9/LdUU4lYpT+g8ul2LdqYoBXzbA07nQj
         fj/Ukz2k5OLbqUOPuxJXbeMKZOeAivmH/xp0tT4NbRVWmYlb06Pr6VDWOIA5mqMYCXFE
         TcP+IdSVS+28Y21/sDCCh/k3DdGs73oZZCMX8gJqbxo0MknxZAzw94kUUWW3lCqf8KMc
         Fggt6sbNN/MaMN9JFB8bYFoaR7tbBSXGeWnhjhWJ7fTSV+zZHEA3rRd425SWO0csfS4R
         nawwMqz2vp21Leag3KdAxK2L3PFYQryIu5VYGvsDpp2pL6izJKuPY3g0rKKzJ82L1dYS
         HBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNvQqsYvi38rUrvvwqGTXJnOjLPlk0qXNoZ8Tmq10nc=;
        b=DH7XwwwnWtHV3RNi//GTtsaCR9x+sbk7Gc/M3QFNoz7tIlhuno7STaSzSgv320OgtX
         /VbXwhrRBZ09nI2IUyeQHuhNWz/XjcugLnq3TteT9ZV/135WijuUXKx7cGcAZf/TFx67
         zpRsN6QRbos3x7prdtxGimhbOOgmNCSww0f3CMNfxybGcoPs2UExpDNvllZIOKfyQBIb
         vGuZyFfukwybP5Ge0nweTUObT4kL+NhpWlH0kudioZsxuwluwos+amEewLf5t5Ovj1Yy
         CYFXJNw6rVifaxlUrW0MjIPw5wbkeCCgU53Xpwr32eyZ9/4jwTuxOtHrcdimyPJkAFC1
         P5Ew==
X-Gm-Message-State: AO0yUKUWyBQjE0YtkU6sudEPbJcBKiTk6SClsYzXxfA0fnDcR7U17mHY
	9B7oggnklSltdgFw4yp9qvOXA61hBOBIJiE0wYg=
X-Google-Smtp-Source: AK7set94Yzz0/UY91EG6lQytHTGKYatpmTAvfIiF/4c2IABGk5DZchEked4a1aHuVDqsyirEkZH/hC4WukhutraQDBU=
X-Received: by 2002:a2e:9d92:0:b0:290:56f9:3338 with SMTP id
 c18-20020a2e9d92000000b0029056f93338mr1459183ljj.55.1675165345032; Tue, 31
 Jan 2023 03:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20230130221125.2299244-1-alex@linutronix.de> <Y9jFWJg9baNOeryh@nuoska>
In-Reply-To: <Y9jFWJg9baNOeryh@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Jan 2023 12:42:15 +0100
Message-ID: <CANNYZj9m-=+nJucGZpSmETJLbcmq31HwJNO7mVy=VG21CC7QjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/qemurunner: do not use Popen.poll() when
 terminating runqemu with a signal
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 11:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176514

On Tue, 31 Jan 2023 at 08:38, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> On Mon, Jan 30, 2023 at 11:11:25PM +0100, Alexander Kanavin wrote:
> > This does not actually guarantee that the child runqemu process has completely exited:
> > poll() may return prematurely while the SIGTERM handler in runqemu is still running.
> > This thwarts the rest of the processing, and may terminate the handler before
> > it completes.
> >
> > Use Popen.communicate() instead: this is what python documentation recommends as well:
> > https://docs.python.org/3/library/subprocess.html#subprocess.Popen.communicate
>
> Was I trying to solve the same problem in
> https://lists.openembedded.org/g/openembedded-core/message/176203 ?
>
> I think so.

No, this is different. Your patch treats qemu process itself, mine
fixes the problem with runqemu script. The whole qemurunner.py is a
mess, for example it sends SIGTERM to both qemu and runqemu, where one
or the other should be sufficient (runqemu will shutdown qemu if it is
itself terminating, and will terminate if it detects that qemu
finished). But I left that for another time. I only want a clean,
reliable shutdown of runqemu.

Alex

