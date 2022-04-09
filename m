Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244F8C63719
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.9148.1649528099180022694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 11:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1TXQxUOr;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id l26so23250708ejx.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjiZFAaHvRUoYhaoMarGeVTXPgzQqUIIYvcAh4QpOkI=;
        b=1TXQxUOrI7PhhKBDGhmhGNJPzjbG/Yd1SX7/aHcfJVHbkNKLv9EZW4bebuyEwNEUSa
         pwJ9ngU4wGqddlLgJ0p2jkJq8lA/1PlPUg07T/rTCmyL81i6ukoqa7I2ejoXfriq1b3G
         RVNVtmYY6JIydBimUa5N4Mr9ighVJ7DTw9qMlm/CLGFvgUxFES9mL+S3cFoIJCNAVu/n
         JLS7AkwXx8TCGawtnZyxfWkzGhj5EfAyhW1n481ULCIOph3LLow+0HZh3UvA7Zd4l+TR
         E8B/838BVjAflLqBssuIE/waJZtJUOB69l7yawY1HU5fZWcqjV5LqYIEci3riFyq3D9S
         yeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjiZFAaHvRUoYhaoMarGeVTXPgzQqUIIYvcAh4QpOkI=;
        b=iyYOlcCFTK0b//FtUI16Btlz+YZtyLTEpeSkKmL1iMKINQh/W41YXIbERvG8vcnTkI
         aSw+dEhexYp8i5qyMUsZ9LAr53znvPmhZ/Jy7wiRsjNNveb84pfkp5DQiCPYxvks/7zz
         LNF9Z+01YaQsdORhLwHC0PVyz0nBLYXhUwryOvPaXWYWj4AsCXDRXc9cxNOBZVOm4dBJ
         BuuFVgyBWWRP1abYL8iuDl+hFi6giWvcA+s7yLSK+vL1Lc5yz/Ae+0ALo7NWR2LH5BaW
         UdX7j30ZSgtwHLqa80SK4VbhzPxQ0hnYh48OYqesV7Wb3d3tQCXDO7TucMgKqEwX/aCz
         +hWQ==
X-Gm-Message-State: AOAM532e8ysOp4LVFvdMRmOLccRr2bNjykXu9bE+GHYIv7W6i/kicEdU
	FWlZ+uD7JV6VoeEQ4jVpMKwNuVwXX3dOgT/T/YpTgg==
X-Google-Smtp-Source: 
 ABdhPJymyPSzOo6dsuHoKSJ00V0f9Y0iskoILWOEtbvaioMg7WeQJPf+i3hs15Gd9KnrgfQQU9m5QCYHnaUITDzQSzg=
X-Received: by 2002:a17:907:6e06:b0:6e4:dae7:9574 with SMTP id
 sd6-20020a1709076e0600b006e4dae79574mr24110708ejc.540.1649528097418; Sat, 09
 Apr 2022 11:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <f4e17d13-71cc-b25b-9a56-207ca89c76cd@victronenergy.com>
In-Reply-To: <f4e17d13-71cc-b25b-9a56-207ca89c76cd@victronenergy.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 9 Apr 2022 08:14:45 -1000
Message-ID: 
 <CAOSpxda2R7S=qJ73nHVr-rA78=6KPG0Y_0ysCQczgYjZAZ=gFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: jhofstee@victronenergy.com
Cc: ross@burtonini.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164191

On Tue, Apr 5, 2022 at 9:05 AM Jeroen Hofstee via
lists.openembedded.org
<jhofstee=victronenergy.com@lists.openembedded.org> wrote:
>
> Hello Ross,
>
> On 3/29/22 15:07, Ross Burton via lists.openembedded.org wrote:
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
> >   meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
> >   2 files changed, 348 insertions(+)
> >   create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> >
> > diff --git a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> > new file mode 100644
> > index 00000000000..5cb61836419
> > --- /dev/null
> > +++ b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> > @@ -0,0 +1,347 @@
> > +CVE: CVE-2018-25032
> > +Upstream-Status: Backport
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> >
> It seems there _might_ be another patch needed.
>
> https://github.com/madler/zlib/issues/605
> https://github.com/madler/zlib/commit/4346a16853e19b45787ce933666026903fb8f3f8.patch

I did a dunfell autobuilder run with the second patch added, but
unfortunately still get the same failures.

So until we fix those I can't take this CVE patch :-(

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164052): https://lists.openembedded.org/g/openembedded-core/message/164052
> Mute This Topic: https://lists.openembedded.org/mt/90107518/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

