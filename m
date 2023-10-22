Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB93C07545
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 11:52:13 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.97139.1697975525983373492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 04:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGKVaaR8;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507f1c29f25so906809e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697975524; x=1698580324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1Q6RCz7r1MUMrLgpG6CUV7fcOIXS3SiYD82jfm+fgU=;
        b=UGKVaaR8ye9A19urrVKDhf26/agybWTloqpLU1pBBmrbboMXQz5mX+lGOsbmiKAX2n
         XrZ/dl4z+5Q0hvCRpjKIUQKbHGIHCHq8t+Y59hEjukACIyYTVkIBVU9bga/5PZAwFqhl
         ycg5Rk+zZ7DeXxDZxBEJPAOFW+dTdflDnVeKsEVuGWQlpg0gHcSx62wXlLSbhl1PCxnO
         aMzOyUud2M7z/yvW9U1Na/4NXl4eS2qwOsgVBjsER2jKt67VH2eUtuD+rcdXT3xymAkZ
         fRm2u10cTYlXsIRO4sKYxVN8NoN99bxPL7iwjPqmzWiMcbzmn/EUSfxNAlTr2lbINRoB
         8LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697975524; x=1698580324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1Q6RCz7r1MUMrLgpG6CUV7fcOIXS3SiYD82jfm+fgU=;
        b=PEvBGeTY5EqIs9stOEG02fhuWtc9JxQhpB8sVMdpIztaKv2YHasBRjipJpRRFw4Pnm
         /4kT0y8IfCObwXaE0emccgN5BhHPUoIrBJ9n4T+yl8Kdl5yUS/sH666FUE2UN0OPrR/O
         AKvdtFEAgmUGkWmcaQ2sLgKPK9lF4se4+IafdB2uNwi7PpHYPgPPETkf6Fpfd+68BuMj
         bQRZiBGl3+zuI4CjBSZC+UTANKZ1306xRuPbZXk35tW++rQf4z7V2TsLNNnBYcM3ydHk
         VzfgTzWpR3LmlAcrnaGrlrV9d0wWCjR7nokig+HclKEceLLpFzutM7jeD4gC5QOeNiJ/
         tJEg==
X-Gm-Message-State: AOJu0YwCkkFiGYodEKkjVN14CHupQ0tx4w2t0BzQl7xpPfcQM4sh0qbu
	760U2/EOXrvE8F5R7yFnKROb56HZNgqvbQrVQkQ=
X-Google-Smtp-Source: AGHT+IEcqER1G15oxrpDR5Zw5F9xej7vEJGUaHJDJ4maPtAjiX6JFxF18RJl2uIumxrrO2KNqi2eaxolPJ6mHck2YFc=
X-Received: by 2002:ac2:5a5d:0:b0:507:a6e9:fbba with SMTP id
 r29-20020ac25a5d000000b00507a6e9fbbamr4066956lfn.63.1697975523641; Sun, 22
 Oct 2023 04:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231018084652.900785-1-alex@linutronix.de> <20231018193932e6cb99ef@mail.local>
 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com> <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
In-Reply-To: <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 22 Oct 2023 13:51:51 +0200
Message-ID: <CANNYZj_gRJ8XH0wSr4gaQ6m6wA8wrfxoXqWro=mtSai2bGid_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for 'bitbake
 -S printdiff'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 11:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189600

On Fri, 20 Oct 2023 at 16:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > I did idly wonder if we need to set the sig handler to not use
> > > hashequiv for these tests? I haven't checked if that would help though,
> > > I'm just making a wild guess.
> >
> > I fired it up with BB_HASHSERVE = "auto" set inside the test, let's see:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2307
>
> BB_SIGNATURE_HANDLER = "OEBasicHash"
>
> is the thing I had in mind FWIW but that should be ok.

Seems like that ('auto') had no effect. :-(

Alex

