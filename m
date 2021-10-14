Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38B1C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 14:36:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.10261.1634222163380593222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=egybqdLP;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id g25so20125447wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0EqrWY7l9un+nLv4RI/3otuaus1GZoCGBqZxJcflOk=;
        b=egybqdLPteQj+q5bv9zB+5Jr5m8CA84Fkaf102R12XU/PnPuOnXzLkvlouZSyKcN1n
         tU8nSrMxee3LjhmxVr5v28WPJMoPOb8+sExB2jRdo5GhuLMttjXA2ZdCG8IHLXKTE3K/
         C8N606Jok9rrDYsbaFpA8yBSfam3BsEMGBhYuh40Dl4aJ4Ee0n7tzPaqRHbS6lL2/vrW
         YY2MwCN666rR4q+AIuBVD5Wzpxa//z37r1/Xudb21oMUL9VxPdaG2tl42fGhaxp0bRCW
         +m/xzkS0fJLJsTQCHJxOGfgyX1YEBwj//J07uYk0JmC8RpetD+O7oCUmuBWLS0U52qkL
         g/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0EqrWY7l9un+nLv4RI/3otuaus1GZoCGBqZxJcflOk=;
        b=Hy7JqWjF9UgtnQwjFWnJPLhDLraUSVh3er8MkTKDfHgiXOqAPtBF48U7HA+u+VdY0/
         bTRrWapVvppVK/Ezjb364xTNIp2ARCWZvZYarhg2Raexye+KlCuiNC3mmQhlg2w4ZlH3
         a2/be20p9g9I6FtxrNbp+blMEn16HKlWnMq456Fd2ee6q62X3tvsbU8fSqTerTU/x3/z
         UaqeVP5WRh1+xPgq5EaeaUUzy2nNCMVdapy8QeNJyOH2iNA2KvAiuZh2hX0zEd7VE7q4
         l7sJICdl63eU35U4okNlIsDwMVb1pPVrL6w8cqMZtWDznXpQhr9Rxf8axlnsBEGVfz6f
         3DxQ==
X-Gm-Message-State: AOAM532kjWL/GFW0CwP1a82qy5/Ti+Cs9f+VEGVClesmKbk/S0Wt05oF
	8gB+BD8KP7nGA/J9s7+H2c1PfMWA3MIf69y0j3zm3A==
X-Google-Smtp-Source: 
 ABdhPJzG0ZjWawsFJ+8n5dRcMnIHII9+kst6gOIZ5FL624uiZfxFaTHGli2Wo5N0KUNOpvwta4Zyqce91zCb0GVBVGs=
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr6213565wmq.62.1634222159454;
 Thu, 14 Oct 2021 07:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <CAAnfSTsLvK-Hm47UNQ7M6iB34P73t3cb11PM3qRGVUGfSuJfRA@mail.gmail.com>
 <CADkTA4N-dCkAOe1=soaHUgBfoS8r=FEsCaYiki0WP_SsK4EWfg@mail.gmail.com>
 <CAHtQpK6d2xNpen4nGd9mbd4QfYVJ7re0V=cEWUnadsM3480Rmg@mail.gmail.com>
In-Reply-To: 
 <CAHtQpK6d2xNpen4nGd9mbd4QfYVJ7re0V=cEWUnadsM3480Rmg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 14 Oct 2021 15:35:48 +0100
Message-ID: 
 <CAAnfSTt4acRN1PoDGXG3iU0LZTixQcaZrMhpKeXPvUvZ+3h9uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 14:36:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156960

On Thu, 14 Oct 2021 at 10:21, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> It seems that GCC plugins are somehow disabled in SDK GCC, but Kernel
> build system checks them on the host, which does provide them. This
> leads to a false identification that plugins are enabled and leads to
> further build failures.
>
> This behavior came with commit 1e860048c53e ("gcc-plugins: simplify
> GCC plugin-dev capability test"), where previously build system ran an
> internal script to verify if plugins are present by running compile
> tests, but after this commit - it checks only if the folder containing
> plugins is there. This leads to the issue that when host GCC has the
> folder - plugins are enabled, but when later the compile pass is taken
> - it fails since the .so is not present in the SDK sysroot.

Urgh.

Can you provide a minimal reproducer for this?

Ross

