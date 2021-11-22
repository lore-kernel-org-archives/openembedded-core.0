Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46D0C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 16:51:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.452.1637599874693948500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AYl426yK;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id y13so79676725edd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4mCqa3ZCz8bHrrVI3zfchpu9CKOdB/TLSg7PWTaWCo=;
        b=AYl426yKN2oB8MwsBs++/kezWvQpNYjc5v2fkuMRXH7uzb3GQ9Pkl4/KVoeasM0R3k
         ombsIdcTwu+wM0HeyNi8oRAW26stvT+xhLYaiNFt+Tzsy/ssvpkhKsBI79FHrhdLbBsb
         Q+VLk64zQSMYQeDxv39oejIcQDFNCO+0CfTQoB50EuPcX1H1SIVHj3sLStC5ApZOhXzz
         uPF8ZRnhopEpUeC4RT+Cc4zw6slUx9uRa4XvOKigdyR12DBJUBB6rav0tPH08sg5lHEz
         0XFJTCewgjQn+7EYCeWaFSSiZ/DF+6fZfkqsrSveZkmaRpm/pA/XJQWSGYdiMJjKHyx+
         i6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4mCqa3ZCz8bHrrVI3zfchpu9CKOdB/TLSg7PWTaWCo=;
        b=2zn9nIQY+1hqr83Xyns7kFLN/Dp/SpItT1rZ3AyqtQD6p3+a53xk3/3vngkOIdGSk8
         MgFRZgIy73cAbYotuBa5ityN4MVQiXV60w82/2xiuLMFbaQ+GbMpKa/wuQc+F3g6AQLN
         zrO6kUNK7zwniltQPgLzjORENTZoW2oLD4PtWDwWigaOPk6u020ZCnbtjuOn5gNYCWv3
         ipDUVg9seQpi8WozaqpA3t5RwpncZJbpzSPxa9CUT9u5WvBEwHbVUbwbtRxKQDwiwere
         HGe+vjPXOvkv4tgoAl9j/wYBj3JulckFaZLQ4npg7ZY+hNQp18xSdWxwiye1P22k6FJd
         iJhg==
X-Gm-Message-State: AOAM531tM5Zob2RFTtjT9qGWQD+prgJ5Z8NLsEyxIv2UanU7SyXcAtbU
	AQY654rixQOzEqJlrWN0baXM2gVCHN87oH2JmG0=
X-Google-Smtp-Source: 
 ABdhPJxvwQDcikcrZa0XocrPybTlTFAQ9pIZGs+6+BZk9Q508h6vveBlYj//8GRK27qcAuhF/tqnB3w3qthfD7nvCH0=
X-Received: by 2002:a50:c31c:: with SMTP id a28mr66283088edb.4.1637599872696;
 Mon, 22 Nov 2021 08:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
In-Reply-To: <20211122163459.41079-1-max.krummenacher@toradex.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Nov 2021 11:51:01 -0500
Message-ID: 
 <CADkTA4N0kF36bOyQu=jOkT_253zQy9sXqnywv9z_E5GZeewpJw@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 16:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158585

On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> that perf fails to build in do_compile with such a setup.
> Root cause is that the kernel did add 'static' and 'const' to the
> arrays of structs which sort-pmuevents does sort.
> This is addressed in the second commit.
>
> While at it I noticed that there are some struct arrays which neither
> have a name or cpuid element with 1 array element. That 1 element was
> dropped. I did not verify if that causes any issues at runtime, however
> that behaviour was improved with the first commit.
>
> Note that the kernel itself doesn't build either as after 5.15 it now
> does try to run the dt_binding_check for which the kernel recipe does
> not provide whatever stuff is needed.
> I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> DT schema checks for %.dtb targets") to get over that.

I have a fixefor that particular problem (the bindings),  so you can
safely continue to ignore it .. but I hadn't gotten around to fixing
perf yet.

The changes look fine to me for perf. The sorting of events is
hopefully something we can drop soon, as there have been other
reproducibility changes to perf upstream, that will make it
unnecessary.

Bruce

>
> Max Krummenacher (2):
>   perf: sort-pmuevents: don't drop elements
>   perf: sort-pmuevents: allow for additional type qualifiers and storage
>     class
>
>  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

