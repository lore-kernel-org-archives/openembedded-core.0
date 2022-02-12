Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B951C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 13:22:51 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.8861.1644672169676342416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 05:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUtxSk3g;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id r20so13685489vsn.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zOlrwsZXOIvkPP0fBVbx0oRcN0d6VSPQQL7QAQRWvc=;
        b=VUtxSk3gkUqxqPcyGaldbqlFMb04e/ZutEqfPiMinsSYIi+rGOXYK/+BMWlTvAgWhq
         ZXu8XU5tEibV5rRMZdDj8PbKv6rxVM77BGZMP8w9eFu+TtcK2IaWB6Vo60LoeTMs1pnK
         2Z0mux/elG27NU+ng9htltUPRZSWgMkEtKrDEQ6Zpj6478djksJYB3tYCg4gUaXb09Pu
         tkHwl4mw9GsbCc06AeDhpq78NGO7YlkyPZ5Is8tiq/FCxBwTcYdfOrhx4Gz9MwhmXvnH
         mwFokWmzHuxeJKcsMZ+nw7KSwOKSO+hCq6hLgET3+enGUTXgIxN7RC593iPMmSeQ2q7W
         m4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zOlrwsZXOIvkPP0fBVbx0oRcN0d6VSPQQL7QAQRWvc=;
        b=UtdwYF/I8734VMez4wx7OIOUWfDHbRh+Bj+86RA74woTedQ1bif5dj3dkawfWZsQMi
         2R6+s4+E14rjAUtkdmpACpqIfH/vw3qHmX7etzjcxzcQxNFWgE3uDwHUzwvZYgHNHcPS
         PcvQdNqSJszT+lfeA2wEwewL741gzKNfr4757RJsLddIA9kXKWMyCBa6oYaxKg8/OiWq
         xO5x8TpX4vB8mLNukvdM3oxTfa9jpkQmCMS+9JE+6EgukdttEwTfLaSvwkh5O39Gqck2
         fSvU04iLo4VrHb3k5uOjE6VgUbzJ/EI4qNio66zx/SCG8O0/q0b0IhQgEfrMeTn4BeJ8
         WRWQ==
X-Gm-Message-State: AOAM531E7RaLXmnd/kBXhx0Axg7tuBqFz38+M0XortHJ6yBclTixkyIm
	FIQOMH8iuEWfwpzncCDZmy27BiaVttDRAL0A0Aw=
X-Google-Smtp-Source: 
 ABdhPJyGLj6b0hYzsK3t8rwAPwM7ZjzUbNo6dfBPBIsyLFmg3NnEeOMF1GWEPy+hENdd4tQjhO3g2MsSWMvwgahEVR4=
X-Received: by 2002:a05:6102:3707:: with SMTP id
 s7mr55098vst.42.1644672168781;
 Sat, 12 Feb 2022 05:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de>
 <lywni0cjfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lywni0cjfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 12 Feb 2022 14:22:37 +0100
Message-ID: 
 <CANNYZj-DCa5Pwz9eNDKgiCBOKGxe9wbDDrFcEg23=jK5DZXQQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 13:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161671

On Sat, 12 Feb 2022 at 14:18, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> | File: '.../meta/classes/qemuboot.bbclass', lineno: 141, function: do_write_qemuboot_conf
> |      0137:        else:
> |      0138:            val = d.getVar(k)
> |      0139:        # we only want to write out relative paths so that we can relocate images
> |      0140:        # and still run them
> |  *** 0141:        if val.startswith(topdir):
> |      0142:            val = os.path.relpath(val, finalpath)
> |      0143:        cf.set('config_bsp', k, '%s' % val)
> |      0144:
> |      0145:    # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
> | Exception: AttributeError: 'NoneType' object has no attribute 'startswith'

Fix is in master-next.

Alex

