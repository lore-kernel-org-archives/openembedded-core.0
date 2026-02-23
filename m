Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6238BEA4FB5
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 12:16:05 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33921.1771848964710164711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 04:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kn00x9jS;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8954c9daaeaso55150336d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 04:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771848964; cv=none;
        d=google.com; s=arc-20240605;
        b=LkPLzjtMwioRQNqipF03pysV2NRqHwfL4r1nhmy53QrJm9qdQYkaI+asz0T6YQOjmi
         pcZuL41CkLuPZdMqlg4TYMDAQFbVfTPYJmWNfrSLAIU5iliD6Bm/+cf/RQHs4qvtx0rY
         JtfzktAT5B+OJbOHIjCb6UtLF6CttWzRwTPfGDKglEOnZMnwQ9vaHbZ2Q0Kj9Uf9p9vB
         lGDCwPvyDd2YgFY878R+GuiS56rs+ptMkIyR6Gasq1D+8xZe/B8ODmZObfukbQYbrrom
         tfxtPsuJy1yZ1yIhOOGaxe6NtAf1NqLjFZXdGEMXWw3Ch6gKzu2szyFiORCICcFvRlSp
         /bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6C6UbqaA7UyFDUQQimvAG/FNyWo6+OySfvihqHNmiwA=;
        fh=PzIZmP5y417tX9SKIcF4myPLH/Z9oslVgKKYrEG060U=;
        b=QlbguUc+L/6NQQFoZd7F0qBLTMP7wNNlkwajL2og9x+UvLwLQlFOGSpB2RyM2jpqEY
         4g3Hh0e8C5z3A0E6wGOvPvMC2LofcKzpkXNTDZomYnmx75/kBoZwIwdyisl33Uywxs1c
         PKgw7FgA2IedVnByBSkZBtPN4KlHMhXIDF2pRL/4gHYArjwBykSV5dgkZqeP7B9nFZk2
         woS3Si+KC2Ubqf7uxfZYxgx1N1sy7Fppn6IzBvpEO7W87/eApaAm6YywD+gKvIBiiaSo
         jE343pxHi/0CHqi+s4O1LB7xHRFCbklBNuoHFzictk0/migyYtKEEqx/DGyeTAyVmHbB
         STCw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771848964; x=1772453764; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6C6UbqaA7UyFDUQQimvAG/FNyWo6+OySfvihqHNmiwA=;
        b=kn00x9jS1EYrEb2bt4HpURGL0BKNQEyXDx4pawwPx7VEeDrqf3j6SdwPKg2tR3RcoM
         ydgeY96Y2BOtQ0X/OLdVGNut9jbDdshVsADr4eCJ+2l38vK8+MLBEKhWDN9aV/+q0TGn
         YXRHkpyVuQSMuK7uXVLtemnGGy0yBk/dumaqEVxIxlO3io1rSInP9tkP5cIsqyZRtQUV
         pwyyNr1EnT2mZYvaumNNnasNBzuLJbm7M0Y+/5nHpjmnFnPp5dopscRzcvVV39QC3O5y
         3jCAkIXSocsEnDsPPXKHfCN5LlHACk5DFyE1Zl8WojkgUy66wf4uZoW8EIxfZ+DIEftr
         hZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848964; x=1772453764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6C6UbqaA7UyFDUQQimvAG/FNyWo6+OySfvihqHNmiwA=;
        b=N1GZQMjW1n1QAyEqsyJH13Vj54A6ErvESsK73QckQftZLif4cTXPze1Rt0c7JMGyJe
         TmZ4nlWDMg4QjMXyi3zDrHN1x4jK2LDSBPXE9aPUnIxZywPQLjkcxi+gRoIjUhcyeh4I
         hvW2jKfh02T9VZHisOYCIPrt4y3ng8EVlWLRu0hGEgh6z/lk9iUyvSnms0larQlemc5F
         wMAu/6OyATmfzr6R3JQx+/EtoWOVfExnB95tn4LUstJO3ZfZ1sQXKzr9yJDTbU77BhN1
         G9xaQB0Deh5uM0yDciT0d+CsA6V/f8Msgbs/71wE3QnfL+jIKa5ZFxz9W/jZVMQNY8ho
         B9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUOXB7udzXFb4WwbZ8rhDZ85xYeSWQHrz4L8bQa30S1Swc8tocK/tSR/kkn4aTlXpgR354W1u+TfFqjpSzJvWABCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9cir0DcvOim9IUgtT3QZ/YjpIsT6nfMx2Dl9XQhqtpvdFXswQ
	uUoroqOTclcMaOpcgJ09XFLn5zF2IaYvI1pvofqALtgERZctimv4jgBwTAtIdem3EEKQZRB9jGz
	xtAAwSmLiM76EYBlYDBx3AtpfTCnNvoU=
X-Gm-Gg: ATEYQzwmdrobgfw9D6Gpj9I07iNxmR/VucaWaSrE4XjmEN2qzcbDwbf4KMKoBLIPluR
	dJAzCHAyOQ4XmqdGxpEwcG6xrA2C3PIYMu2eEhWwcB2Q20TUUUjJKB6IlFlAQ+/wpgwtR+1DyTG
	XrE9pt67LUM1hLBvZfFUGjr7n0dCsELniMfdrTaY0JIwLmO5Uj464SwM7krGII6q7/JSG1M5PzG
	bguAFGUB7DFmZdscP1u/ikI2m7nDxgIidlyyMfNVKWGGdDtAUJeccak75ag8GALYLBleIWykMnO
	SXGfWkWYxLHN3io7t5+a0Pvpth+/ELjyLbl2emM0aw==
X-Received: by 2002:a05:6214:da1:b0:895:d629:508a with SMTP id
 6a1803df08f44-89979e320acmr120771496d6.1.1771848963551; Mon, 23 Feb 2026
 04:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
 <20260218090606.3693584-2-ankur.tyagi85@gmail.com> <DGKMTIQVT97I.10NPWRO24MLGR@bootlin.com>
 <CADySD0ExUn0uimBUEXTfN5D_oZN3Ueaw5+L0_teLYvQQTi6xdQ@mail.gmail.com>
In-Reply-To: <CADySD0ExUn0uimBUEXTfN5D_oZN3Ueaw5+L0_teLYvQQTi6xdQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Feb 2026 13:15:52 +0100
X-Gm-Features: AaiRm51Bg_cw4i1j6lvYY44LHZogi64W47RkjCEdHWvFgf6lfAXVUcLzuWZMOUs
Message-ID: <CANNYZj9-=RyBa14CCGKfdwTsJ7NFvBZwTyxdMWNhs05Ba2BYzA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] mdadm: catch sed substitution failure
 during install
To: ankur.tyagi85@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 12:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231665

On Sun, 22 Feb 2026 at 11:13, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
> So does it imply hash equivalence related issues which Alex was alluding to?

It's possible that by random chance the issue hasn't happened yet, it
may be specific to a particular host distro.

This new patch could also be improved, if you drop these tweaks as
they potentially can obscure the issue we're chasing:

-        oe_runmake 'DESTDIR=${D}' install install-systemd
+        install -d ${D}/${datadir}/
+
+        oe_runmake -j 1 'DESTDIR=${D}' install install-systemd
+

Alex

