Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87BAC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:14:02 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.20489.1747746835548191044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vufo8A/T;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8a70fe146so87069666d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747746834; x=1748351634; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgnGtJQPzFuuTzdAdsY5/0x7eET1J/xEsOslBlLKaKA=;
        b=Vufo8A/Tav2ucemnsXs2sO6cHQih2oThCQuU0NEkrULjjrPGjtn4lhuDKjj03bCm4X
         VbifC9DOv5eObwfVdpARS/GXv1M1dUp9jGFz5F8cvOaUrcmBxG6+BByOKNr2PVejWgXu
         E52+ZcjVf45U3ywNL/qfoQgnjbaY9ohjEimGByWVFw4NWDBDb7NT5tEc7TkUnVSCaZ41
         sQ0xierm/LS9lVNOJ5YVK6WKQ8BevZKSq1j7UPZQT88KxCfvIrh/zEQ1K5RBr7EmWoj5
         j6AgpNy4vQYcfclV2ME5HtVWm/MVeh9HhMAoEOcdGPU3hF4L29wgc+SUVx3tjORVz8Hw
         xQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747746834; x=1748351634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgnGtJQPzFuuTzdAdsY5/0x7eET1J/xEsOslBlLKaKA=;
        b=G3Vf9DG2OFE1fOCXxrHo66wB7tsAh4RZj3MAVrR6FdTgN9r04NUHXLezMqhE2ShYgk
         h2yd4jUM7vY5PXmHu+hktZ+frG0nJr603fENmGER9d+lZDZx5cbVXvf06p7agqizZQRU
         PwEqDOmbuW6801Lgd4iwR2Mo1F/z1z8MVB6XTVYr+Mg/HG7xBQTRkUzMNSe8LaryKfTX
         vrIRm1s3FhtCS7CS3t1eNdKxIytXUtvmquR8bm6VMc9PFZhmc2LgGwpKnOhWbGFIDu3c
         KcE1Q9T7LhMiRAQ15+LDm1yPcWges7SexKtUCFdAvD1tW547g8uF2ppEjdisAvcfLcc8
         iGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGk54mrXZO2/aKLPLo4KRFBoRw7BYUd3waKOPAIbOXWKDCmoiXVc29OTMvBUB18PCoZUOld3vCY8klo5J9hhqqyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyw2vIlRw+zn+EFmjIgv0dDgy6kq9+hMmX+X8F9YbWLoAKHYtea
	xrZ15A4vbKooCcm/iRSGF6tHl3Y/Oh5zUhCqC4mzuufOXyg8dnBnjjxwqznf5gKqvCdb8IXPt/K
	fSLxjUVe0lNN83ZbDD05szi8bPKsNDT0=
X-Gm-Gg: ASbGncud5jP5ZYoWBp4Q4AJPmKvG93MsoYwVd8zlCktaTNaFzAk3hNq1IknCzhLwQJ6
	Z9mGsQpvtBF3GdsgYNYmRUKUXqdV+Uhr7OmF3yP0rX+nwJ/OhcvZvfmQWEkAeFOp2PkS0oxi1su
	aRRSqeAnShb92c9/cT3yqndAdtr82CG7qG7A==
X-Google-Smtp-Source: AGHT+IHBRGDKtNQvun27B+41KXHDJnyLqCK2IsbBhgFqE3qLXoRjEDo+JJCK0D55yyaYPDLau0M1PmIQu0jHwX4ES6w=
X-Received: by 2002:a05:6214:1cc9:b0:6e8:f2d2:f123 with SMTP id
 6a1803df08f44-6f8b2c576dcmr261933636d6.13.1747746834331; Tue, 20 May 2025
 06:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250519055150.25280-1-f_l_k@t-online.de> <8EBE7E51-851E-46DF-A6CB-0B24DAAE524F@arm.com>
In-Reply-To: <8EBE7E51-851E-46DF-A6CB-0B24DAAE524F@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 15:13:43 +0200
X-Gm-Features: AX0GCFuPPXxRWQ1CsizY6DB92Xzlntmvolur-f-AqA3UqPXUZ7HXXj4ZJ6IFvA4
Message-ID: <CANNYZj-ujWEfpK7rSxvXX6FQhnr2vnKVHU1xf2w6meqvG5AcJg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] mesa: update 25.0.5 -> 25.1.0
To: ross.burton@arm.com
Cc: "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216909

On Mon, 19 May 2025 at 15:14, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > - drop two merged patches
> > - clover frontend is always compiled, even if not enabled
> >  clover is deprecated and was removed in master branch
> >  add a patch to fix that
> > - install gbm_backend_abi.h
>
> "Mesa 25.1.0 is a new development release. People who are concerned with =
stability and reliability should stick with a previous release or wait for =
Mesa 25.1.1.=E2=80=9D
>
> I=E2=80=99d suggest posting the .0 releases as RFC patches, as we don=E2=
=80=99t really want to merge them into master.

This is an automated text that has been in place for years, and I'm
not sure it's accurate anymore. .0 release is always preceded by
numerous release candidates, and it's not as 'unstable' as mesa
announcements make it seem. Also, .1 is usually released fairly
quickly after with some bugfixes, but nothing critical, and can be
done as a simple followup.

Alex

