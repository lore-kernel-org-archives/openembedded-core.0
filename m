Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6BBC5DF62
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17501.1650104775477232441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iAr9LwnP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id e21so13187434wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=MxxptLaW4rFtnwIkbIWAr7yx7XglXm5a0JGFfJxu0r4=;
        b=iAr9LwnPVzfpfgKmIk9bocXPqZoRC0vzzzL8bp+etTI74wiwxUpDE/ge0T3ErICgMt
         k8EI9EluyKxaWsZHz3TzaWe+udnaTSJVGH+K4/YqXpy6ZYvgRKFjuho3OqUhmzkfriTJ
         VKDcduGrYdBFuqsQFU2IDrk1/Nk9/YYYhxu3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=MxxptLaW4rFtnwIkbIWAr7yx7XglXm5a0JGFfJxu0r4=;
        b=xV2KDTObVDWQLXX8zblulTrUGxaA5xxQ3T8TQJnpUP2f+aLmo6eb0aoLxxgDGTQz9n
         mfoXtIQMRsfADZnmJgmxGbyEANolQr0QzifTPygG6rap5x/RnCNQrGrPfZHZIbw3aw/9
         Z7fFBqFdTQ8jOFP3DKSUR8iHxi5A0wNuy44dmQg0aNwgmWUWR1uvLjUXJHYgBMY9j0dZ
         zAqYBas81HUuXKrd8ZztC7Zr7GWNMssumNV43+88DJBL71IPwfYEmyOgNUZ8//WzMCn7
         1cbik8/kDd/fCfQdDsVlZ42zmjssnIF4o95MVb5WYBrdTuYH5p/JAP8eqEY9QZa9GrnZ
         D7VA==
X-Gm-Message-State: AOAM531iYTezQ2QXAacTyjiSEUs9EiS0gG9nbXlc9+OPWFSQ4QMfmVCY
	62TVM0uNgeZVIFW8xv98DUPnoRXAZ+YNvQ==
X-Google-Smtp-Source: 
 ABdhPJyDGsYatBOXrc1MKUwdK+pkDU++R8CP1rIhtpQ/siTqt76u7hAJtlt0dtKRLwFfSFIVVQ39qw==
X-Received: by 2002:adf:d235:0:b0:207:9c11:c8c7 with SMTP id
 k21-20020adfd235000000b002079c11c8c7mr2071243wrh.443.1650104773676;
        Sat, 16 Apr 2022 03:26:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78b1:67ef:e54f:6288?
 ([2001:8b0:aba:5f3c:78b1:67ef:e54f:6288])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a05600002aa00b0020a7cc29000sm3608978wry.75.2022.04.16.03.26.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 03:26:13 -0700 (PDT)
Message-ID: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
Subject: Intermittent failure issue summary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Apr 2022 11:26:12 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164532

I'm guessing a lot of people don't follow the intermittent issues. I therefore
thought I'd share a summary of some of them along with some random thoughts on
them. There is a mix of different things here, each needing different skills.

Systemd daemon-reload unit restart failures:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14787
AlexK has got part way in figuring out the circumstances of this, any systemd
experts able to spot what I think is a service file dependency issue?

EFI Boot Failure:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14018
"oe-selftest - efibootpartition.GenericEFITest.test_boot_efi selftest"
Does anyone know the EFI boot process and know what logging we might add to the
system so we gain more insight when this happens?

Bitbake parsing error:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14665
"Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, parser
thread killed/died? Exiting" - I just can't spot the logic bug causing this
error (and some similar variants), maybe someone else can?

sstate files not found:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
For this one I think we need to write a standalone replica of the tests against
an sstate mirror that sstate.bbclass runs to check if sstate objects exist. That
way we could try different load levels against the project server and see
whether it is the sstate/fetcher code (which does weird things with threads and
concurrent connections) or if it is the server side of things that has some
limit we can't spot.

pseudo do_flush_pseudodb task error:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14654
not sure why this sometimes happens, like need to sport the race in the pseudo
shutdown code.

Memory resident bitbake PR Serv issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14786
This is one of the blocking issues on moving to memory resident bitbake by
default

x86 boot log serio/CD drive timeout in qemu:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14743
We've talked about disabling some of the peripherals we don't need/care about
such as psmouse and the CD drive. Anyone fancy digging into this with upstream
qemu? I suspect there are other people who'd like this too.

Bitbake Server timeout:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14201
This one really needs a rework of bitbake's main loop with a new thread so that
the UI and server can talk even when whatever it is doing (parsing, event
handlers) is blocked. No takers?! Just thought I'd add to the list! :)


These are 8 of the issues and probably the most frequent/annoying or ones where
there is a clearish path forward. The full list of 57:

https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

(it was over 70 at one point, we've beaten it down a bit)

Cheers,

Richard




