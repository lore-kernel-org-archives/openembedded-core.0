Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85594C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:42:10 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.20913.1660682520850529092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GmEoy4kl;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id z25so16480619lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qQooenh8+rASUeAQBWG43FWMGzOU3dV6flw13aW4zHI=;
        b=GmEoy4klX3MCg6OlPcL1LMzIETMXk57vjl2DfR4sDUXK7Z6FBPXpSADyDU1ITY16e2
         ZZdiVFi04HYIlX/BNMSdIa6qLo7av3I9qmObmNZ9+LW9v8bCvz5It+SIydTqldtODksv
         mUNGp9FnXFcX49iS1tpZ5/x1h50buLiesj/z4cLAgSQgMPX8UJdSe2+8M07ptRGv3Vxs
         fMaZlRvbf9o9cOvRJlIO4O5/Lj2BMhIXkkASB+IkG7r7lGmUuLRtG8mV2M/kSlMsPOvR
         ywxvctdoI8MTizv4TN1L+6UlTpFCr3NgFUYbyj9XXtJ9yBfs5xHGM6LMbESnSNmEHwLZ
         N+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qQooenh8+rASUeAQBWG43FWMGzOU3dV6flw13aW4zHI=;
        b=QIa+OIfW22vdcEaU2tz1L8c9UgPiVT8Rsqm0uAQ6/tlXPmNeiJ3LTP4zygJA8lZFc4
         4XmSRMqJ5GvjyaDpCXT5P7v6Ce7gG8tMN2mN0ClGEcKM+dldaSkvcSQsrWkunQPNXRw0
         vVtzqlewBvQs77ruZUEc5KiYWopRfy+qL9vb6uduUkgHTUSIQ9EeGv2WUtLDW6AnFdVG
         fannWDQwfHW/5HZQYyCFoTV2Wk1BXONMZ2RrCRlpl7+SJ9wgMj3pphGVZzYGgGxaKeIR
         vwLyFZ7rpOF09HuhnemCvR7TBydtA13igt695Q5V9i55yOZb1ZQaW6Pr03yGboAKjLe7
         Du/g==
X-Gm-Message-State: ACgBeo3KTGdVn1iw1axydiPDV3fepXFbX4UPaI3fYbcPMHVZ0zR3oZyt
	OqtImX9w7pGJaQLWoKA8u5qVlyOPtirLb6yxKxA=
X-Google-Smtp-Source: 
 AA6agR7AiKQwS01jZqgthMRtyR2TXEOF0KdRS+xzVRoiBXq3P1j20b7fWDHhEYtqQKEG67uR7zFN9vG5rHQ3Y1AwJDM=
X-Received: by 2002:ac2:47f1:0:b0:48a:ea6e:b8fd with SMTP id
 b17-20020ac247f1000000b0048aea6eb8fdmr7274977lfp.26.1660682519036; Tue, 16
 Aug 2022 13:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220729141049.835733-1-alex@linutronix.de>
 <20220729141049.835733-6-alex@linutronix.de>
 <e8df5fddbd7eec4d13f111da863e71b75a0dbabd.camel@linuxfoundation.org>
In-Reply-To: 
 <e8df5fddbd7eec4d13f111da863e71b75a0dbabd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Aug 2022 22:41:47 +0200
Message-ID: 
 <CANNYZj_vnn7O0uQkg4krd5HOvkiLRP=5g4o+f+LDA1mpm+8qHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] selftest/bblayers: add a test for creating
 a layer setup and using it to restore the layers
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:42:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169454

On Tue, 16 Aug 2022 at 22:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4001/steps/14/logs/stdio
>
> (and other similar selftest failures)
>
> I suspect this was due to master-next being force pushed whilst the
> build was running.

Right, the test operates on the poky-under-test revision, and should
either patch the generated json to contain a revision from a stable
branch, or do a pristine poky checkout into a temp dir first.

Alex

