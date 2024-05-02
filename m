Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE30C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 13:01:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.4628.1714654906792780724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 06:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWG2+D7j;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2db13ca0363so127737711fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 06:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714654905; x=1715259705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fCj1eRLMaKgLiWpkq0WQhxQBrKQwuCx0ixXEHmx8q8o=;
        b=GWG2+D7jXhhgz6CCkUDP5ZTySqniH/LywiiQf/4T9NcjeLFjeacdOvodve5yefLHBi
         3jgkmw1mLohsqYdq49eQFkNNg4jzdLPJqnLTRwiqUjJUrByRKStjQ5G0YzfhmIZD924A
         PynOe/dmkAoT5I/2O6dw7Jo+aK68IY92sUy0JcWG0JRFJlIuORPMX5JH3sM7ryioFwyo
         4JSB1dKqCF72cDSdGU1wTKCTDJ2d1pFDU+SHRpMs3Cd3UsbcltGFWGKq4pTA0n/k7mfR
         EJPIUymYK2mk8rCqqz3UnFJYXGjTJvOzQYtiZ/Nb1EDZ/jE+UV+N2FYc3BmXltOUYhFu
         injg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714654905; x=1715259705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCj1eRLMaKgLiWpkq0WQhxQBrKQwuCx0ixXEHmx8q8o=;
        b=feHeNQtCGgZsW6V1ZTxXqZt0xAP6z7vBecCLKNgZY4sY2WO22vdMLYrOTIWoOvKi9E
         HqDgPdGtLptOFSGb/V7LsN6DKqbOxXxfL0AX0T18i8oaZzzoO5y2pYR//wTMcSKCb3HX
         vrXiYGX6MzOmSmeC73TMqtbHMM3iN8P3JViJNAopIYzV9BsAU9dsKhucQZgyQcmYgeem
         dw9qYBBYY0xWzqHkcX4IPPjGDiKyP5Pm2Mnnz/Ih8QgdgFWmUv0dVQAN+N9wijIVr/nK
         4olIjDW8FCARGqGnwEt3qkfKsGB8Ze1qvcBMquNVF+zE6X1r0C8fFqiCCh3X3HUX+Dbp
         Ko4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNek+AeJkWlVY6X5KMHabWOCdVCF/pUSFkRsPfv9HkjFbGTTgSCVllZ7eQhQZgmI+RtMkGcu1Grjd+hs7V0fVhxR/yQDiHnWNRjoTwwWLa2aBujhvUImiJ
X-Gm-Message-State: AOJu0Ywwtc2Le1DuJD6Q2CTXANzfRfXTkijqSRt/Wgn6UUADQPLec8E0
	qNg26QU7OVoOHHi5bZzh7t3kaDrGF23PRcgflpb7sEikBi/0ypGFeJbzAdXZSJzosj2friMhNe3
	IEk55ox0qQU6yQYlPKzc+WikU35c=
X-Google-Smtp-Source: AGHT+IEzvuP0LmHxWTikC3GruBWyMFTN3L6rIfiYL3M8zu0pdQBIWKZzAwa5LeNi/brE3RAzrgFgAbm61r4T4cGhNZU=
X-Received: by 2002:a2e:9ac4:0:b0:2e2:64d:6849 with SMTP id
 p4-20020a2e9ac4000000b002e2064d6849mr931092ljj.50.1714654904768; Thu, 02 May
 2024 06:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com> <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net> <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net> <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
In-Reply-To: <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 15:01:33 +0200
Message-ID: <CANNYZj8DP4Mpab21jLEnC9ybP8jrT8p+iRFg=LnSOL0esknWGg@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 13:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198918

On Thu, 2 May 2024 at 14:57, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I've also tried switching to this, which is very clearly a "target"
> > qualifier and have the same exact results; it applies on "native"
> > `inherit_defer` evaluations:
> >
> > btrfs-tools_%.bbappend with...
> > ```
> > PACKAGECONFIG:remove:class-target = "python"
> > ```
>
> class-target:remove, not the other way around.

Ha, I got both of these wrong. Sorry.

Alex

