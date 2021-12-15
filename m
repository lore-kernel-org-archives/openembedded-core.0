Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B62C433FE
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:16:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.40648.1639577767301287183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=RoIl7ale;
 spf=pass (domain: madison.systems, ip: 209.85.208.182,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f182.google.com with SMTP id p8so33568112ljo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=2gf3oeRdJvRO3LvJuU/oDROOC2HpuEHvEr/dsUTNyiQ=;
        b=RoIl7aleKzKaxczFF79EUfWg/Z7JCH7yrvOm4PfZgWW/vcMKjsVVb1wJa6Kn+ns5EC
         XMt3AjxPZa5RiFkIhyAmRKG6bazr+8sebKHm7yJFTBXbi73gWpcO+wW2H17TtbY06c2O
         zg27tsBDVZ3HXr7npEUGI9S0lxTfI/OUW/yIeqzyUh40Q9845zXOvRWg1cVy7IWm2eI1
         vOHpgtAiL8Wal0YcUc2v4wcOe/HyRkUew7CyjjdW1Ky6bvItTp6aKpQBGqKXuRGE+N/G
         set13x2U7suEJ/vPBgVyFmjaBWLDM9tRipjKXcE5/77qNHiu71WbIE6tt+2BlJPob9lU
         rivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2gf3oeRdJvRO3LvJuU/oDROOC2HpuEHvEr/dsUTNyiQ=;
        b=FSi8JQJmMgntGYyUM7Zrgws0V1PKpmrWoTXZQQIi8I7NGy2jUhkYcKhXhwLPr5cBJm
         At5Lj3DDXdhODPLdgfrxom9sg1AOZQsHselZhxB+O0YAqFN5ypgW/HzXDoOCZHCUe5zD
         Mas0FD24th+L0T635gWOUdE20eU8ma7YC6ZLVQcle2Elkcnz26o//RnugPTjznxoQtZd
         IgeV3uTyWSY0vn8MhWXTmFAUCj2C8Ku1WqjPlAlTEWVacx8ZmUOjq1d9O2tISmvuZ5FL
         hDhDTZjHpQf1GVT6eWfq34juFFQDT0LXW9J6E7hEoTNTeGyFuGVcP8DI0ydec6DvJJ3l
         3ttw==
X-Gm-Message-State: AOAM533ZPrmdLb0bbeZOUELpKlis1zyNoWQCp2ljBSJZwWClXXql4Dsz
	U8GDdKYJIV8P/l8l/aCNDW+8gcDSlEn7wpuPl3OWqX7t4lQ=
X-Google-Smtp-Source: 
 ABdhPJzbg6lOItnED93XbYD5yKAWVp6dRDCLvhLHQmVa7z1nin+L/eELzJY0jO3uL2dEFwejnPL4zgB6E7o12soa1xg=
X-Received: by 2002:a2e:bba0:: with SMTP id y32mr9947596lje.138.1639577764938;
 Wed, 15 Dec 2021 06:16:04 -0800 (PST)
MIME-Version: 1.0
From: Matt Madison <matt@madison.systems>
Date: Wed, 15 Dec 2021 06:15:54 -0800
Message-ID: 
 <CAGgRHJqMNi+rfsiojpsxTG6e2JurK22zwK6CLOoyzz2BW0RQmA@mail.gmail.com>
Subject: cargo fetcher, SRCPV, and setscene issues
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 14:16:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159725

I'm finding that none of the Rust recipes are getting setscened in my builds off
master due to the the SRCPV hack that was added to make the cargo fetcher
visible during parsing. There's no error reported about it, but by adding an
exception handler into the sstate code I tracked it down to pstaging_fetch()'s
using d.getVar('SRCPV').  Since the cargo fetcher doesn't advertise
srcrev support,
the base fetcher class raises an exception on this, causing the
mostly-silent failure.

There's no issue if the sstate package is already in the local cache;
it only affects
builds where I need to fetch from my sstate mirror.

I'd submit a patch, but I'm not sure what the right solution would be.

Regards,
-Matt

