Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30C0C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 16:44:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.15243.1645548271503635236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 08:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=4Mvn4c4Q;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id u1so34482809wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AO3zQGk5NoXcV9mCHSafxmsIbSMsYAKxIJZ1C7eW6s0=;
        b=4Mvn4c4Q2+4UjXrieUjk848yC9mHIH/J0cfGEB0mEoVPZQbwtlb+Tu/vyQwlRbNcwq
         NPIvlMTNJw86Kd+HyCGMpHdscZ8H6WQWnN0u9xQZJd4h5oqg2akaFekWZJNFkH5IYqKb
         o7wbfsimqeQvLkXyKx7DwT02NVZrZ80cCHBHX8H5jekvP4YnF755v9nGXim0qCz8iWyx
         Ccucq53tPUxVCmQ6foOgrFK7NT4xn39Kh+ghHFfAw5QQRixJjqIBTVm3TmFswmrAUhLP
         VALAYjSv8ybfOK0gv3CQIFHXIpg8SyWSaKQHburuaN1cSetfhnAtEUz2wmd3Gbi/b7fV
         JIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AO3zQGk5NoXcV9mCHSafxmsIbSMsYAKxIJZ1C7eW6s0=;
        b=sDt31MqBCpn4OStRgvwZ+c+l4OEJl2Rzogs+9/iRQBCUD5Z9xOTicb8fPrU6zWlwfV
         EDgb0qj8tblnnluNXP0bOYMkLPIK4eORpT8IkK8t4zPacx4ni7x7EOexzOBfATSjkxRB
         HZ3/cKKqllACqpKrxby4uidIlG8q9QZrLOCdJPi3fId5JAqvsguK0pH6emn1rHQjkpLQ
         06BB60ZV5fk9oe0DIDNk4CORt1N/UNFWpB7iW7PKRuLVL3Tb2zFvJNKZrlbtLPl4Bl5X
         sYjh23Id+4wnTnlfBN+MlE4VMoBNmC/RAyI/GymGFOjruPh2SVE/8mJ5UuOLs+TI2B1F
         RjHg==
X-Gm-Message-State: AOAM531yDXHwDazkI7q9wEBf+cfuTk7BzAVRWicfuOT+zk4toYmbnC9+
	0jjaLkwd7u1wlML2SSEBPd3rRgwybxngBy/6b41chw==
X-Google-Smtp-Source: 
 ABdhPJxyQmPhxnnvpqsishMQfRIRtGijY2g24sdo8mEeZuyZEUAP7oAKsO5zOT9fVPE5JEZCVFlKpl/EPPsx6LxUMhU=
X-Received: by 2002:adf:fd48:0:b0:1e4:99d8:48bd with SMTP id
 h8-20020adffd48000000b001e499d848bdmr19749795wrs.497.1645548269971; Tue, 22
 Feb 2022 08:44:29 -0800 (PST)
MIME-Version: 1.0
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
In-Reply-To: 
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 22 Feb 2022 16:44:19 +0000
Message-ID: 
 <CAAnfSTs=_5o5xqDa9haUUYLfC40g+OCmbKLebVDYeiM58JX86g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 16:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162178

On Tue, 22 Feb 2022 at 15:50, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> While I am writing, I should also mention that the CVE JSON feeds are apparently going to be changing (again).
> https://www.cve.org/Media/News/item/news/2022/01/11/Changes-Coming-to-CVE-Record
> I wonder if we should perhaps move instead to using the git repo:
> https://github.com/CVEProject/cvelist  (existing v4 format)
> https://github.com/CVEProject/cvelistV5 (preview of upcoming v5 format)
> This would not solve the sqlite locking issue, though perhaps we could sidestep it and just search the json directly?
> I guess I should really start a separate thread about this ;-)

Urgh. Thanks for bringing this to our attention.

Can you file a bug?

Ross

