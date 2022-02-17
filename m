Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150CCC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 19:57:49 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web08.1679.1645127867987261786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kM+aEMeY;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id 110so1239169uak.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lM6nlbdhGZpS6PsUkIll3CrZIiqr7toQyZRo7eDNvCY=;
        b=kM+aEMeYgy0jH64hSJEaOK5gykYIY1cXNQa+0siBZwnsSw4agNIU+ANDLqSDE1GcoP
         UfJlAc0EgU0H/zJ/k7uxGpaasIyERq+v4ENOeYP2HGO48WGqKIvyib7jKXQ3e1XUvizj
         zVY8SBUEVXOGD1PcyoPNzY3OhPjcNHMSDzDWyhTw/rvqgSFajd1V7oDiQA2zfLPE6dOU
         pYalOSHDZ+qE5cTw1twsmVt58r/pTIp0cA5fvCjY7q9s/ZRXtZ/RDu7OthXuvw5nDMF2
         D18y41rwO43ob4hTgiQnFeS9ozLyAIypm87FIKaQTvwUWKhcY8lkCKy+32I1R2tnCJT+
         9usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lM6nlbdhGZpS6PsUkIll3CrZIiqr7toQyZRo7eDNvCY=;
        b=cOcksI2dmV0dlfP9gF4KiU4rzBPmbpKJQZ2qdPW4VYdV8uqedJKx68Ig+NA3TMxYDc
         UOiQNAgs18tGNeiUZiREfI0EIWMiGnZrG7/N/FAWYcCipvTCUvBghAnMecM/J+2mGGst
         gWZtn0t2WFUaxof5xxoHPG9qeICjkSX0pbXPHxhHuBCHIa6Y2M01MsZ2nkedXq/dl+2v
         9BsWBlX2iVxdLYs8XViFKfpn/ZWt6DBGOMXtXAs1sfIWhwkYzvOuahjt0BgoIc7+XCzn
         TKjJ1tpeoWXJo+TrAPmU0+0oFWQ/Ctsx4zGaMeDQzQeCLKtQZKIJ5Z81DcfntBOYjhU5
         pi9g==
X-Gm-Message-State: AOAM532uuGKneCntXs0U47PSc+c7yDTwBgDOnNkBWfTp8rAKbkFgS84Q
	gSGbnV8hAES9oFgigm/p+B9hAasv6BKW/h8igHA=
X-Google-Smtp-Source: 
 ABdhPJwKkhWJqd9SwOxjYqJ/kbH9w41UWp7mEGnGpJMshv9L5F9jG0ARKdE8HEQJhAe/LY0RNuAQCDGtOQMzVn2OEPo=
X-Received: by 2002:ab0:6dc7:0:b0:33c:749f:e3da with SMTP id
 r7-20020ab06dc7000000b0033c749fe3damr1844266uaf.100.1645127866742; Thu, 17
 Feb 2022 11:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
In-Reply-To: <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 20:57:35 +0100
Message-ID: 
 <CANNYZj_V=2ErFhDUQ-_XVzYdyu_iHSm3LWe8Wz=nBn6ZdZP5Ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 19:57:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161855

On Thu, 17 Feb 2022 at 20:54, Khem Raj <raj.khem@gmail.com> wrote:
>
> Does this switch fbdev->drm backend work on all qemu implementations we
> have in oe-core ?
>

Yes, I ran a-full with this change on top of my transition-to-weston
branch (where image-sato is swapped for image-weston), and it passed
with flying colours. Without kvm performance may not be great, but we
can tweak that with --use-pixman later :)

Alex

