Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B5CC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 19:12:22 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.40525.1653937934868408160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YuUgfEoy;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id h19so6629347edj.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bywyn3GwleIpO6nGohoa6sITI/6EX1Dk7SQbdA8qMP0=;
        b=YuUgfEoyb0YXwKOXX5BOqio7pvXbMxf1TL+FXUNjSSmJ8ohu7G87BofVB9xFjSEgqx
         aTQz9hTd3x2YemwauTW/hPHOtti8Mim+U6j72egKsSfqY+2Ceu6yECFVOjFYebwf7Mdf
         Pmdu/xs0kms+NwMKpZNl7iidSiItEHXo7pQLNAB8VMmFQvqsie8VTGH3tnsrbVPwe5BE
         ihmksiAUa8qr6uHibaCw9MvjAJfU44FIcmDSfDJgLWulkpTW2fOUTALNMZ6YUfePdVt1
         pPQFGeaRdY8ZiqXnld7dVs/s8GPqybCt/5NvvfBpiWTD1XZ4lcMQ9aU6gNUQ5pp/PL4c
         BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bywyn3GwleIpO6nGohoa6sITI/6EX1Dk7SQbdA8qMP0=;
        b=KgFetWMdsTptvrYRtwhcqAR63z/HFMiGMlytKh2BO0F+/wtkfKSCpQCIvo+jQkg1w5
         F1XWU6jf0DxhlBFTsQXhIoH6QEtj1h1hYU6V4L2D0JQ28jed4Nf3ZPkuSftgcqZO68OG
         ayBK9XuKg82X1A5coP3aZTSph09gQOVdgZ9VPNnYmU5xDghuey6Iou2IARfMT4BneA/L
         W1FoxCv3sEjfTZKtizjpOfvZlwJtezgceNe2RG4d0cQChCNYP223kJHG6T2gSvC/UiY3
         D2BW6Kes6gT8VLvQ73HfTdbOw1BXVnpaw7sTWkFOYtoqOTzKn1Lgm85zHIpxselKDUQi
         Okwg==
X-Gm-Message-State: AOAM531gn7D3dHUkF6s282GFpJoVyARk+PiNbZCl18XjCeTAZWV62H8F
	+SgOR4lUD1PIghzXFJjLELUQbAU0JoV9fCQ6ACIxoQ==
X-Google-Smtp-Source: 
 ABdhPJzkNTjx1zm+0airxtEk42QjHCDv9BRp5KzOyylRH9cLpRSZ1EIRROsJgP2XD2HGr7s0kGtsBCzriUB3KeWWynM=
X-Received: by 2002:a05:6402:20c:b0:42b:d302:a80f with SMTP id
 t12-20020a056402020c00b0042bd302a80fmr13912699edv.330.1653937933185; Mon, 30
 May 2022 12:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220523081041.5680-1-rak3033@gmail.com>
 <953.1653909572199421376@lists.openembedded.org>
 <16F3EE351D040CFC.21867@lists.openembedded.org>
In-Reply-To: <16F3EE351D040CFC.21867@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 May 2022 09:12:01 -1000
Message-ID: 
 <CAOSpxdZwmoHa00W8-Vj-vON8WVBhmm55oEW7hfqFKkAD53H+Cg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] curl: Add fix for
 CVE-2022-27781 CVE-2022-27782
To: steve@sakoman.com
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 19:12:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166297

On Mon, May 30, 2022 at 6:16 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, May 30, 2022 at 1:19 AM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
> >
> > Hi Riyaz,
> >
> > You have used the wrong label meta-oe while sending this patch.
>
> Indeed, I missed it due to the wrong tag!
>
> > Steve, Can you please take this or do you want us to send it again?
>
> I've got it now, no need to resend.

Actually you will need to refresh the patch so that it will apply
cleanly.  It is generating warning on the autobuilder:

stdio: WARNING: curl-7.69.1-r0 do_patch: Fuzz detected:
stdio: WARNING: curl-7.69.1-r0 do_patch: QA Issue: Patch log indicates
that patches do not apply cleanly. [patch-fuzz]

Steve

