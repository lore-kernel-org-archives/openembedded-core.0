Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FB1CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 09:58:24 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.12737.1757671102676094956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 02:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fpBUHjhh;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b6004da52bso14928971cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671102; x=1758275902; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1dt9cfKlFRzRaRXuYXVnTG/nco2YwQ/Q4duQHTU6ts=;
        b=fpBUHjhh/Ym6PsSRD4zGJlYayeAqxbfkjqSZAGTLxnpof2eTSSC1lO6s0phaOyiuSi
         Xoms88midNoQOPnLwsKEIT5iLI+OfMfFBMN5R9X6N1xsYZvNa8RQfS6MlqNYMOV+Plhu
         bPEIDMuRcRJd2gQRU7aq+BP389rF6PcLpCHDzGDGZ4VHXkwhCMQrja47svaPu1MrN8dd
         L2+/Cr9GGCt89lqeBgDJ380Jh4NwipY6reue3dryh+nC6dcRkiIfUBGJQALYbf7Huzrz
         ze1llhtlyCSWysVzJNXl+kDVJQDTjt0vF/+hW6mk7AAuKggS5z5CENipQT3OZKBPG1BJ
         D40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671102; x=1758275902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1dt9cfKlFRzRaRXuYXVnTG/nco2YwQ/Q4duQHTU6ts=;
        b=fepSJTeDIo7HT0zWuuSlyjDrOmlrg9s97ATsU9jS76+aPkTavh1Q42RQzuBmDLhPBI
         kt/sfqD+ej6O8Wnap2c8b8mJwxW8HjZVk4loSWRGKZ2WKvXjq5i5kEab+QEmGY4aDTOX
         x91T16/1p2bBFAWRuMeEwpv0qBkG/bvM1LqYnL3by4fam3TZw5NJQQPi3TwSLFWvLGe5
         NbyNFIaP0lTPEnahlV3S6EReLvWMOCWSpENa/rdsfEAO5W329dGHmiSZJ29lgHKSWR2q
         1uTuCoxNO/HrxjJNoN4S/KH9Vk9qhzp/JAiHZrJfTE9al3FmccsrlH8OLbs1qg/Peg7f
         Ww+w==
X-Gm-Message-State: AOJu0YykXpMOa4gZMQXyKPma96uoghzgmFo0+8pKpXNHmP95ivj1LkIf
	EZdWOMqLKQNVtnF6d6zHRaRQ7c5C2FXC4eMNibIMZOcCs9+Je8XBXX6F9z1mvpNTW4I59i9F3zu
	DOxAKqbIXnl3s5kDPXo4Ww1q3Uhec0Mc=
X-Gm-Gg: ASbGnct5d55EIb3tW2QMBzR6xhLYBLCVRs3D6ahobPBY9XCQhWnDQhbePChQkuGi+tf
	oY2BY/lU9sBoRYOT9IYkKcsKhEyJsW7yUyfO57qrS1pt01rQY1qQa2NyqGUb2aiHzAFX5uNd2FH
	yD1/E/lWrXUUtrirzNbYHe2dkNeexuyv+MZcUHJ+ffXcD6At4WPrHqn6FoWSEXi+0My+PveP849
	jPEI1Tt8cofLTwEBrLhFbSaY4JeQnkFqS3DkinCIWvfBrSvdbcCAuqcs1dDIdHRfB8iOpSV4Me1
	WNkQ00qXHF1r9WIaouaG0vOA8szpkZ+Jp+EmUmkQhS9JDhawJqM=
X-Google-Smtp-Source: AGHT+IHnY+4Y7RJytZiRmlIqrrccWobJwqC1h85csRabVQdDc60aYimmZFgK2JR0N5rP5cDIbdmrrxNonwyTlNa58Ac=
X-Received: by 2002:ac8:6f16:0:b0:4b0:7d41:df7a with SMTP id
 d75a77b69052e-4b77d063ebbmr30680241cf.56.1757671101738; Fri, 12 Sep 2025
 02:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <186275A42D34EEAB.19063@lists.openembedded.org>
 <5I7F2T.KIGKW1QUPNT51@t-online.de> <CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
 <J9PG2T.NK5VSUKA3AQO3@t-online.de>
In-Reply-To: <J9PG2T.NK5VSUKA3AQO3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Sep 2025 11:58:10 +0200
X-Gm-Features: AS18NWBoXQ61Rr1bnKbxeEKJ0iXubpWcUkrPApOazzdS1K3_v5K5pHfOmmX7VsM
Message-ID: <CANNYZj8=Le1Eod6NfcmSFNiOuLafD4WoC9qSU4yRRpCz3So4nQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org, 
	"Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 09:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223307

On Fri, 12 Sept 2025 at 08:13, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
> so can we identify what is specifically broken with current gnome shell 48 and see if it can be fixed?
>
>
> https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4f3ae0e36775af46bcc8009
>
> Here's the problem. This commit breaks gir at least in gjs, causing gnome-shell to crash.
> Reverting the commit fixed the runtime issue. Maybe we can adopt this patch until we're ready to switch to gnome49?
>
> I'll send a RFC patch for it

I saw the patch on oe-devel. It looks like a simple rename of
methods/properties/etc? Maybe it's possible to extract and backport
the fix to gnome-shell rather?

Alex

