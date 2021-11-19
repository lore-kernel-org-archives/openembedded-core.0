Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3AAC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 08:17:40 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.6061.1637309859602518186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 00:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JyfAvNRh;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id l24so19683714uak.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 00:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bJTPWoH3RZGFX2B2AkUMide7RKsVLL01srpM7vDSxcU=;
        b=JyfAvNRhNC77WZ/bPYhAEN0pd8aku808je6LDVv4tFjt1NTK0PE0eWH6D7wpt7AabX
         mX9EsdjZpl7kEKqaSY+rqjO2g+yN8g2fefKzw1BNpWOhyo06goikc3NE8pw13hoM6kND
         wjuWc+YEt4t2oMTmWq8D9MCG8HKbJVqBDycqdy3kYoRZENSwiOod45xknkyFxPR8dQLw
         3EAIjI65HLOHDu4tNyEZSiqriE4jHjaeexZfUoYSuQXm1zpqX4pcdHF0C/tJoCcSNkG8
         /uHVnF/5jdtBAucCP4FgQUPLnJSG2SDplxO8P4kLm1lxV2Q1mOeB+wS+I4E8zJ9k2PaM
         nhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bJTPWoH3RZGFX2B2AkUMide7RKsVLL01srpM7vDSxcU=;
        b=SZScv0jfFCgHq1Z6UkrBSChQ8r2n9cZPCNyePCqb9/4eMZOaKibjHYFyJiuUcYQzBo
         MvNxeYryFBC7R7MDE/eIIlrDbkuK0QCGt/znpNKPaT3hUx99zCyZ3anHbRKAc297KnZd
         dNjeMx+6ou4SyfK5Oa3e1QJPGZG3tMB5BfwHSx4gaIrQGCx/gg/Pa3Y3ri6D1l/zk4C6
         hZ/dBMt2c8qxjMLHoYk+QNLU8vpEiMYgXTmTeOSKZY1M8IHRYcrtvIlBAkeisIyF/Ss7
         HM7DEcouMKUAN1lHlEJQ/fjXDwL7sSraCDMBjJbAZCWQ1t/hz5VexGgYXUjdUXh/vrdf
         kLRg==
X-Gm-Message-State: AOAM530G9HrDrq428+n+KxswUikK23UXC+hPOgZULmATw0ZXjRiaO6fK
	sT90akJP0iubHtBeInyII5yfhkmUTU4R2KWfl+w=
X-Google-Smtp-Source: 
 ABdhPJwrm+2TNubC9QIhZRxW1cie7FIevpX6U31S5PM/Ay+2PjU0S7iUKh47hwKy46P11pk+jvl2hC6ZjuVXx9WvjwY=
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr92149086vst.1.1637309858740;
 Fri, 19 Nov 2021 00:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
 <16B874A872BAAE14.8846@lists.openembedded.org>
 <CANNYZj9g5RRyQbU6+=gNZQ0OXbgC2OVtWYtnNbW_bAvRDT4_eg@mail.gmail.com>
 <CAJ86T=XEZ4jqyujLiUoqtw0wODUtxUVvVLCzQ3jDVihwF67nCw@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=XEZ4jqyujLiUoqtw0wODUtxUVvVLCzQ3jDVihwF67nCw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 09:17:27 +0100
Message-ID: 
 <CANNYZj9EwKk810HdJxHSNogBa49a32W4tvmTGbcY0+qwjbwm5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: multipart/alternative; boundary="000000000000847f2105d11fe8d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 08:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158499

--000000000000847f2105d11fe8d3
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Nov 2021 at 00:14, Andre McCurdy <armccurdy@gmail.com> wrote:

> > So everything that is supposed to be there is actually present, and the
> patch is indeed unneeded.
>
> Looks good. If you have the full strace logs for both cases then it
> might still be useful to check which (if any) command lines are
> changed by removing the patch, but if not then removing the whole
> patch does seem OK.
>

There is no tooling to compare strace files, they have process ids, and
probably other unrelated files that needs to be stripped out or matched.

Just to reiterate: this is for the master branch, and I do insist on "if AB
is green then it works as intended" - if issues are found later, then the
right way to deal with them is to improve the AB tests, not ask maintainers
do even more manual work. Can you help me review the remaining 400
"upstream-status: pending" patches?

Alex

--000000000000847f2105d11fe8d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 19 Nov 2021 at 00:14, Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">&gt; So everything that is supposed t=
o be there is actually present, and the patch is indeed unneeded.<br>
<br>
Looks good. If you have the full strace logs for both cases then it<br>
might still be useful to check which (if any) command lines are<br>
changed by removing the patch, but if not then removing the whole<br>
patch does seem OK.<br></blockquote><div><br></div><div>There is no tooling=
 to compare strace files, they have process ids, and probably other unrelat=
ed files that needs to be stripped out or matched.</div><div><br></div><div=
>Just to reiterate: this is for the master branch, and I do insist on &quot=
;if AB is green then it works as intended&quot; - if issues are found later=
, then the right way to deal with them is to improve the AB tests, not ask =
maintainers do even more manual work. Can you help me review the remaining =
400 &quot;upstream-status: pending&quot; patches?<br></div><div><br></div><=
div>Alex<br></div></div></div>

--000000000000847f2105d11fe8d3--

