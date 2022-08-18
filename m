Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB908C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 08:25:00 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.39419.1660811092309666797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 01:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q0d6sGOf;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id u9so1170522lfg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JnlOm4AW1rQLc1bQvhrRdS+kqmOaj+jRo0VxBoTGjNI=;
        b=q0d6sGOfcTBTQm0T+S5SmcMJm2QpgbzpgAGJVdGAquMLuRAjc/W3BdWCayYDszjs8B
         ROVVyKeiPmcAiG+1CPCOmWXSLP4FB2AlsfXHaX+iPJkmJRHoLI0b5mA7PhgaEMo2eSsg
         gYQUp37UAQ87Xmk9iiaaU2j/1oQ6y1Z3llSN8ZnMpY8tjZdUXgeBCqjj9XMXrem6nwiB
         lE9wfRVei3NIoXiK6j4CQuOq/A28mypXT85yhCefE5aywOD5nE/TRpOA5LBYvxZFDjws
         lKpjimzENCD+otd2F1lzO2vfK+EJ5Gs620iGC8k+cda3YJmmUA6+uOL61CUKG9m228cK
         ygDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JnlOm4AW1rQLc1bQvhrRdS+kqmOaj+jRo0VxBoTGjNI=;
        b=MpefPhmZ89VMDTdPXPcuCItm5dkK53sEiYEQzB70XazTfAKxrh+bpgSdFk+vhnCHTj
         07RAotPNYLLHCZseLP7ywYMjNRUzqoO3iZ4+9MV1eecbZcS3610m0rKwt0stZIcRZEpv
         Zk4mdjmY3FxeRsvebdqKHACisfFT+Nnqs4jCtShOkkgSXGI0QxSCrE6G0nm+tdQIfLrA
         DqBxe8Wg2wgZ+ias/gsbIrPwehv+0kRmO1TLjkF+Szjxfb01mIezVTRwWE/6Zj7A6cPJ
         Rzq9daaea6GoxSIruRAuPCFwhnJ28xMQPmt9saBb3nQ1GkRMSCy+NbE2DKHaZglQgalP
         gbOw==
X-Gm-Message-State: ACgBeo3LSH1SzwGF0vT+lPNnmJh+JwDnblK1uPpNTqxylUi4YjWigch4
	XZLS8IOFeH6mmYxyApnbstqUJ4OfUYENfXuaUFU=
X-Google-Smtp-Source: 
 AA6agR4b2JLDSWS1O/EkIgvAky/J3+UbDWsZ4UnoijN/1ZQqvp0KGZTlVMs1NopVOQDcl3QrBsUBuQIuam4yOwo2PBk=
X-Received: by 2002:a05:6512:3455:b0:48b:c5c:6689 with SMTP id
 j21-20020a056512345500b0048b0c5c6689mr669360lfr.673.1660811090513; Thu, 18
 Aug 2022 01:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-2-alex@linutronix.de>
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
In-Reply-To: 
 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Aug 2022 10:24:39 +0200
Message-ID: 
 <CANNYZj8vXyK0erJ9AGBSiUsuskKXCUY6PPGiZshOf-0Gcak-fA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema and
 example
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 08:25:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169516

On Thu, 18 Aug 2022 at 00:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> It does, thanks. I'm just not sure we're quite in the right place with
> things. I know in your other reply you say we have to start somewhere
> and we can change things. I also know the screaming if we try and
> remove something later...

Right, I'm going to make the following changes:
- machine/distro/config-template stuff gets dropped from the schema
and tools - I am convinced now that it can be discovered through other
means :-)
- config template location gets standardized (perhaps in
conf/templates/), default template in oe-core moves to
conf/templates/default/
- add a plugin abstraction for the layer setup writers, move the json
writer to a plugin

Anything else?

Alex

