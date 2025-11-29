Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B20D116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 13:21:06 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14245.1764422464416960337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 05:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1xz0CLC;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88054872394so36217616d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764422463; x=1765027263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ms+0wcBb0RahhfHvvEQFaTQhljtbgJ5fgLlCqdbo/s=;
        b=c1xz0CLCk8ylOXMoJ+B1eByTsV05lGBpZfRw7fLCv43LHprH91vEoZ1X7arr1SDkM3
         OPspsgd9p8NdQjaugTODvx4hQlIxg6sQuqbcGmIy/8emrqjCku6EQuy+GqVjjfA0bNqn
         xX9DzopBAOi3Y8+yJzSYDQd4irgVP+J7RE6rXrw7ijBPbTXkIZjFOSzw00qOFfGP2/IY
         C7a4X/G4lf53/Qx8D0zuXidIo4llsvtZRgjfJe4V1ky3CJxPVGf9z45KwhjN23WTc5ht
         d5dvaXKebB6B+Krv4JGrsPtMOWDj1Akw7C39zBGtB1DpYtgP/bnPk865s3+Ypd4sS+XE
         FTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422463; x=1765027263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ms+0wcBb0RahhfHvvEQFaTQhljtbgJ5fgLlCqdbo/s=;
        b=PpwSAkseupUY4XdaoER43G7Jjubs+htvA9gcyCmpHqK3hWq425U89eYBgi978y/173
         4d+5I+tUDjqXQEY913pln6v/dpbW3Ng3mUGIwlkTEJdNFYEdxlqwan4CBwc7L7IuthKS
         3Tb1xpABxZDT+P+9/Mlqa1PI2eoA7ITwL9k34Fact7twmEHLeqhZYibgv5lP84z9E2vg
         9V1mpXeLQE07S68/jAwgauBnaXQfrTgtLkQ2aU+N7G/Vo+2bCzU3vmShnV8zVF1k/WJ/
         PF6eFQxY79klUmqzyVa+vw4c9DP12mz9D2qlyYkCOFAtSjpxEX2C9q2vFCWkwAAEgp0D
         kNag==
X-Forwarded-Encrypted: i=1; AJvYcCVX1VUoWpHxaVsdM9CfrkJVP3L86WNoUwXMngs3OFPLKeiCDOMfRuwFrSKynmyXBxgcs5Y4hfqM+FRal7Rl+Snh/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmTpSASbLFdnoTq+0bqp7O2hldCyy9i7GZR6OrSkkqNsvSZcTH
	yq0HXABd86y6YRaUmEychbCO7c1MT1WZL6Ub2ShDl+1/YP+Gcjm9vazrrFPhFFVcVJoe6fSdnoi
	vCtyb6+BXGGtyDQcfGKVgCfjCx1v3gXk=
X-Gm-Gg: ASbGncuitrtwYOekzY5Tu6QJOe6xztS6nMWHWnMMLCZWA7H7Z7hwIjL03TRv3OEXxB+
	4GemFnEXlKlDI+S4qXooeeAd2/+qveyRUmEilNKq7RJi2NTJrfMr5Ri5WgtUFJ2Co4ytl4qiVEc
	A94ke7WXAXn/sQUn/WkrcYOarU+/AuWr4lB0mY3ru3C9iWJQN6TEI2zdMIm7dzK+3TK+mTQ/00D
	guxiSEgme+p+n2767V5MvvMS9NOAp8RXGZUUQyKFrQiLNdatWQCS+IMAhHGfhzAru+JvCE/F3G5
	tkFuPiEqRlq8YLyCrUjI+um167zM7w==
X-Google-Smtp-Source: AGHT+IE9MIQwmrn7JNxc3XpA5NcKq3D3A+qFoNriceU6iJ0AGd8i18iFT5KkoR2SeKT27bezM/1R71J802Fr7Ch7TLM=
X-Received: by 2002:a05:6214:c6e:b0:882:4632:cf7e with SMTP id
 6a1803df08f44-8847c49f8edmr439118836d6.12.1764422463417; Sat, 29 Nov 2025
 05:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20251128182713.4148461-1-alex.kanavin@gmail.com>
 <247791bb-e71b-402a-b14c-0f51a0bc709f@gmail.com> <CANNYZj_evzQWBTw1gH9GpuqH=wGwmTwg9HhbyWFz_vUq+Z34tQ@mail.gmail.com>
 <cb6c4438fceb407f39f6a0f540928c18474883d6.camel@linuxfoundation.org>
In-Reply-To: <cb6c4438fceb407f39f6a0f540928c18474883d6.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 14:20:52 +0100
X-Gm-Features: AWmQ_bkhFARynOjHKe0RvnY5ooEfgh12BOt_PFv4EMH7Y8agweCFjvW8kBnhlNs
Message-ID: <CANNYZj8fYa5GZ7CNsV5X39ksUSLv09e2Omo8YJPRNix34zCVSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/configfragments: match fragment prefixes
 rather than full fragment names when disabling fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 13:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226935

On Sat, 29 Nov 2025 at 13:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I considered this, but I tohught most people would prefer prefix
> > matching to be the default, it's just more convenient. Fragments are
> > still very new, and situations where --exact is necessary are rare.
> >
> > This will be discussed in patch review. If preserving behaviour is the
> > outcome, I wouldn't add an option (that no one would know about), it
> > would be a separate command: disable-by-prefix.
>
> Perhaps the compromise is to support:
>
> bitbake-config-build disable-fragment machine/
>
> i.e. the prefix matching only triggers if the / is at the end?
>
> That is perhaps relatively explicit/intuitive enough?

Yep, I'll send a v2.

Alex

