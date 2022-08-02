Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3FBC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 17:13:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9014.1659460394007066498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dENkO+bZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: sakoman@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id gk3so14929848ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XNXE7fgYJJin6ZxXuzA20QrFA9WVm+rebf0VpHu5lfI=;
        b=dENkO+bZqVetSYOis5M5VVwit9jLs3aIYF2uiKP7MQ7rm2Pmu8L0cg0cNVLqazG4Zt
         mzyliwKcLKG+VGkWO8Jj7XN8vo+WUueVVwgBghqhtSoK6BsKZ7zS/1skQpP9lfj1lWyY
         41ubfM6BjSt/CEyDQL1taAFAOe1mgavvDukL7xDePERN1v3zYMgqNhhiyIq1vUkFFVoc
         bSctDFXUogwuWP0WWWzRF8c22fPdBESTWaKRQbld5M8wy9/NXmPr58BbiofwWBZw7Xws
         wx94n6eFWx12LhmvBJ1YiBf1nITwxiUSGO4TrVHEVB0mVklHE6aljoCqXTIiCaoC4K7I
         1AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XNXE7fgYJJin6ZxXuzA20QrFA9WVm+rebf0VpHu5lfI=;
        b=EUYMGeeP5bc0mqjfcs366I9ZaDR1TuwDb952eGSityfTpOTA0fwp9xpAQ4kO+cZBpA
         b8NG5DwlLJAJLt5hZS/PO7d93V+cGc1IKs1NOwJqQ0GdYg3Nl6IkeW56kYg0wVJDoyUy
         znXNE7HsxzN195tdkOdNc9Tn8iTqgPMd+oZi/9eJ4BL9uq/fYBNVWojCYU7UnrN9sAGF
         MyEYSulo0YQqRMgTQhRenjDywadXdOn/oTykK5i11gXlEjP1Gw09WL4Et2waztzijpwm
         daIoxLGU05iQbApdOsuORYfrfbUUOK9uUuAvptZIyWZdkP8yS0Il8K0c/dTHoKkdwlF7
         yyHw==
X-Gm-Message-State: AJIora+CSrgIHz0sdWfnM2PZZSEerU5y7/bWx4ihOGWg/nyjdDCewtFo
	rOQu3u7ZaPkDHB35kslMQhQKxxunp2YYl2wljy4=
X-Google-Smtp-Source: 
 AGRyM1vLtJYH9QiGSgPvQosC8HucbnGtb2Oot1CkGWfQti7ZHwcnPiTNfvnVSYTKzAAbhz/t9xu0qEF+mFjSyXrj564=
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id
 mm29-20020a170906cc5d00b0072b1313cd09mr17048249ejb.482.1659460392491; Tue, 02
 Aug 2022 10:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <5f236e744b5b528bdf8d95c9580c273f63c04452.1659105705.git.steve@sakoman.com>
 <8470e905aa3fbdcf2cd34594b4e06800dcfd1683.camel@linuxfoundation.org>
In-Reply-To: 
 <8470e905aa3fbdcf2cd34594b4e06800dcfd1683.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Aug 2022 07:13:01 -1000
Message-ID: 
 <CAGDS+nm0idp1pJMimLJS7rFe8JR88L7O8DoNPu94K6yt0o16Ww@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 01/29] qemu: CVE-2022-35414 can perform an
 uninitialized read on the translate_fail path, leading to an io_readx or
 io_writex crash
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 17:13:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168798

On Tue, Aug 2, 2022 at 4:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-07-29 at 04:46 -1000, Steve Sakoman wrote:
> > From: Hitendra Prajapati <hprajapati@mvista.com>
> >
> > Source: https://github.com/qemu/qemu
> > MR: 119830
> > Type: Security Fix
> > Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c
> > ChangeID: 41d6646e06319e629da574b9b2e8a3a197a73441
> > Description:
> >         CVE-2022-35414 qemu: can perform an uninitialized read on the translate_fail path, leading to an io_readx or io_writex crash.
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >  .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
>
> This isn't fixed in master yet?

Hi Hitendra,

Have you tried this patch on master branch? CVE-2022-35414 is the sole
open CVE on master so it would be great to get this fixed there too!

Steve

