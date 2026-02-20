Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5589C55164
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:00:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34587.1771578016774600895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q9kjV39f;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48375f1defeso12862655e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771578015; x=1772182815; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjendAkUc7287Rlo1F7N05EF8sdsFUpyZ55MW8NMEw0=;
        b=q9kjV39fOxYidzGwXGSugmXdGZrER44OtlIR14X6XTD3mIQonS2nzZjtVVrIagziss
         3wGPl2LHHU5OzDcrNn6bP+0jd/BXSC8/cVlPL1LmRJ6Syca1VK2bYDDM/nZ3rymDDlvq
         fsK/vjZ13DUPJ6DbSNUGb0S5Sr9jFLrdAY/lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771578015; x=1772182815;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjendAkUc7287Rlo1F7N05EF8sdsFUpyZ55MW8NMEw0=;
        b=WO3Se9+yTi7pvo+Xs9osRU0ZDgh9QlJs1eDhsur5Pvy21WJFAxbA8pO3iterYWW/FR
         Z7roSaFCfK21omestUVlIwuwNnNpUrUghImiofNO2oXwwxHqU/OfD6c8W1HmjgjxjtKg
         rMku1R6YBITGGqyvtyAt+gsr4RzCQqv3q9GK6XgREsNiu107G4g1SqZtizHqmXc2RINm
         RG+67FyH7aBH9odOTaaSTXbaj2d6+PbEHGdeyylWiwoRD5/sv4IBjsgrP1j9JY9cqEYy
         9R0vAWeRP4T5Fe59gN51PftRNpz1ZvfdvqkG9q+2xFuDuFMnrTbvDcSfxwRklRGsuim0
         m7Yg==
X-Gm-Message-State: AOJu0YzoSHJqqYaLMh4vETCl03ciT11GbbEPyhXyxlLbuN22Dc+7436D
	dYgCeMMdqr01SLB9Euft/s6o6wpivDf+Ot5PO6+p4SqUGNfNBBmX4PothGo1k0kIe/g=
X-Gm-Gg: AZuq6aLKJkXF3wUcjVwFQycktcNs/2kqosIWCP/x3bUHt2as5RBJ1ZKK0JAPw8tFWij
	l/MPXK6/Sh1i9zEM3qiOjNWQDBlrfcaRAoTECvKpyjgwHwpK8DpE/PM0walCTvxqYEwynbercyn
	ChcmwVzKA6hJvCsPzB4oMT9I3+aNJr9xLxDLCTdomSTIRc0BHnr1+VBcVXBaV6E0IUyj8CjVsmG
	1+En3sO0rz8qt7Eiq1Wob8Nk3xdVAbikze5MN929fTxxO0pZJ4DIP3IIo/fdyno7VAkC7PtgeIr
	VVMVAmDyH32KSc5riOuwk7ndPzO/8Fd2IV99jRQMMumTdk9AI6n77RCZ2vzd4GfiCmz3Onz1nrT
	y6AJ8iqKtimy+KGsg3I85T7rURB872/Qy22ivWJp4Iy4LD2gzsugh6lMDKYPj7fCSXs2J0CpqB9
	tBBWqcW8fUwSm43sYMVrbdJR6j3ZgaQvnEZK5wiE0tgu+rdRRfOvqYMK7c2iZwQ9SaC4AJ6SqMQ
	3I712YIa6oqC+g=
X-Received: by 2002:a05:600c:3e0c:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-48398a65eefmr121441345e9.8.1771578014967;
        Fri, 20 Feb 2026 01:00:14 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c0779sm85949555e9.6.2026.02.20.01.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:00:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:00:13 +0100
Message-Id: <DGJNZS5SAUYX.5NJP35H0U9G3@smile.fr>
Subject: Re: Private: Re: [OE-core] How to backport latest go version?
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <navinreddy23@gmail.com>
X-Mailer: aerc 0.20.0
References: <nOYT.1771515503207887946.99kd@lists.openembedded.org>
 <DGJ22TW6NQ7J.26KZXIRN87D9B@smile.fr>
 <48326.1771577023423291484@lists.openembedded.org>
In-Reply-To: <48326.1771577023423291484@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231495

(Re-adding the list in CC)

On Fri Feb 20, 2026 at 9:43 AM CET, navinreddy23 via Lists.Openembedded.Org=
 wrote:
> Hello Yoann,
>
> Perfect, it works well!
> I have added it as a new layer, checked out the branch you specified and =
changed the preferred version to 1.25.7.
>
> Thank you.
>
> Another issue I had with Scarhtgap recipetool is that the generated recip=
es do not work right away.
> While that was not true for Whinlatter poky build (with bitbake steup).
>
> I see that go-mod-update-modules ( https://git.openembedded.org/openembed=
ded-core/tree/meta/classes-recipe/go-mod-update-modules.bbclass?h=3Dwhinlat=
ter ) is missing from the recipes. What is the best way to have these featu=
res in scarthgap branch?

Since backporting this class to scarthgap is not permitted (as it is a new
feature). Maybe your best guess is to get it merged in the mixin layer?

--=20
Yoann Congal
Smile ECS


