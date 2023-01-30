Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A83C636CD
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 20:23:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.5506.1675110221111398405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 12:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOe3ICfC;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id d8so1453921ljq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N1dRadQYd+ZCMDT3NAIKXIn6pCXKlQMo83fM9zKoYuM=;
        b=lOe3ICfC6w21NYEMNGwlkb/EWXG5G9hXIkjfPmsFccFkC1SNTzWNwQw1qF82jLRRdI
         kAoPoVL5wdRmX5rRtI6w2IHIKeIpDepCvebK5qtJPwjtW0G37zbDp/Kbc4Zb04sVHPK6
         hcORATn5WqDSNIDCl4lr5GINy+sG5MApGuYEQz0wj5kkkXW6d4wqurxxRfyVHhUX77zW
         x+g2+M30K8KCjwB0UjtIxmrWkYfekzlHuP6M5c3cIVQxNQKxeEJ8ZvENSAiGaN4buaTh
         dhsr7pJC/xKuGN/a4ejsObOfjyBwi8PqQAQB1BYIfKJF7f1v/ECWjc6iOkwCcMqXZpMg
         JPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1dRadQYd+ZCMDT3NAIKXIn6pCXKlQMo83fM9zKoYuM=;
        b=s3Li4X9qR6GP1DOrwOdKsrfrGN/DGoGyryKUMec40jBuJOxPh7alWtmACDbXuyxdRd
         NtKTr+ngxvg38oz3zgfi+LQLFRA+xWAt3zTTnQMYSivaDhE++ObQZDmcU6vvmV72lYaB
         u7RStinjNZrt/HfNDIWt2VvtSX27C3X0LFe1K+aTIYnWC/86LzKeGQb6l21L5Bu/+kSB
         xNmnkXaUP1jOZtlZd38weNn9Dky/oFmXZpulmeHCadprRp8Z9FHTyJFB/ooKTK3cLLw3
         syV9ANddF20BPCQ6etcHsBWLP7dyGxfJqc/887cLEih91cCHK8CUM1xWbrT5ehGdRVS+
         V/tQ==
X-Gm-Message-State: AO0yUKVl6E3xkFd/UrrgHoSxPh575DG38sVoOkslz5hZQJenNnJR6Bf7
	jYNvhty40QNmhlv+F8+itcNe8PJmVMaAi/k3Ue1isuE4
X-Google-Smtp-Source: AK7set/rPEcSGcDks+qXqmbnMg+pCeObvsgA40jgIfQbQQ7X31HYcJ8FwYLBBlIXE84oY3dGVyo0aNWhDMjmyXoSSeM=
X-Received: by 2002:a2e:7207:0:b0:290:637f:c6d6 with SMTP id
 n7-20020a2e7207000000b00290637fc6d6mr702445ljc.132.1675110219335; Mon, 30 Jan
 2023 12:23:39 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
 <CANNYZj9EQ_CEgxYtE7jpzwpnPwtp6mLNryN6KtCYXZz4kwgtPw@mail.gmail.com>
In-Reply-To: <CANNYZj9EQ_CEgxYtE7jpzwpnPwtp6mLNryN6KtCYXZz4kwgtPw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 21:23:27 +0100
Message-ID: <CANNYZj-AWjAE+KN4PxDSLBw20n0KEsA_DmrPcv31DCJooLtutQ@mail.gmail.com>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 20:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176500

Grr, incomplete email! Let me resend.

On Mon, 30 Jan 2023 at 21:23, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 29 Jan 2023 at 16:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > unfs tests leave nfs server running
> > ===================================
> >
> > After the unfs NFS test runs, we seem to leave an unfs server hanging
> > around after the builds are long gone. These build up on the
> > autobuilder workers.
>
> I'm going slightly mad. The trouble occurs in stop() method in
> meta/lib/oeqa/utils/qemurunner.py. The method sends SIGTERM to runqemu
> proces, then runs Popen.poll() in a loop until it is not None [1]
> (which uses waitpid() .
>
> Runqemu needs to do significant processing in SIGTERM handler
> (bringing down the nfs server cleanly), so it takes a few seconds. On
> the other hand, poll() returns -15 earlier than SIGTERM hander
> completes (!) and SIGTERM handler itself seems
> to be interrupted in the middle of it, leaving dangling nfsd processes behind.
>
> The 'slightly mad' part is that Popen.poll() is implemented using waitpid()
>
> [1] https://docs.python.org/3/library/subprocess.html#subprocess.Popen.poll

