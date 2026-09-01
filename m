Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC226C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:35:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9838.1788273325203285066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 07:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T7AtLFAe;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: jason.stasiak@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso2292407a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273323; cv=none;
        d=google.com; s=arc-20260327;
        b=X9Ke+rrPQHEqvSOChNspyN0Hr8Wazdh+G4nLsWSIdXjpx2ONUE34Aake9s1uCMH2eS
         mPD5b4QpDBPMe57L8gFvdrSoY84Vicz1GBfSSBh5qDWbraVEPzx1aecDGqp/o9JLQT4B
         wT6uH/mU9vIgzY84VTXi6DnBylLwwxf51X7dMf82K1ZsWpQvZSoopG4EOrfyGJ9cxPrB
         4lSel8sau/s2FvszfxI9AcsVHlgZVrPNXxMbPE5dExYNx+WuNyTGxcVf7S7FhqvsezN7
         r5YVD2KMv3ASdR4Cufe5K1qzumL+9o+l0e1GEzJedGln8AZV4qNfe97uVwPN/+x4Rx0x
         TO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MDTzGRSuf0suiJZUukroB/MoIhkJLBQ+jHZSEmCjFNM=;
        fh=amkBRfQk/xUhh0orwhhoof5egJfrk4+Xu8ibNhi0/iM=;
        b=FECe1FUacUBfprRRU8Bgy45AK6tdlfuPNfRDunUN6pDMKayueSq+ADSUVYZEPnhq20
         aFgey+x0lIBwit2ebVVmywPjsQviRJ0oNGgll2v5fkFAEHzeZg7TqaTsS3uLIQGL13Uc
         9UCBuu5mY2rBkL4UvCKeDlKozNSF30oZn551ds5dqz60QBJ3pv2ZonZahuEtAqVmN7Ss
         heqSrxGZCfNkLhik2QNY6nikwcuVyFMyGq6TT+wsvNcpo05yedBUf0PsE0EHuBvcY42w
         hM4uk4EatD7PVD7sQ8NOIcAsdNtrkAHAIr76SdkoyTPOPlzxZA9v7L+jo3OAjgSxQO8h
         iubA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273323; x=1788878123; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDTzGRSuf0suiJZUukroB/MoIhkJLBQ+jHZSEmCjFNM=;
        b=T7AtLFAeVtz1zqDG72GbfKU20+0QiogpCPlDxXfjnPoNnUB/rUlKfxZIlC55e5iP7z
         PAwZGuOj6q0Nj4Lw+4+Y82MSZvi/yx76qOn2jPNtnDVO4WckbQZYciQ12wQi9lqNN9bM
         Yz2uZVuR4+zecuZYchyOZ2Gezhjl5MviU+acvqg95szKR/3O55jLkq7Z3fqIX5LSRgcz
         2VoWAifsMgOQmnU/nH5CUpvNHOoaPgHQSez7vj0lSdGjGh27SYfoTTwVEc6l9j1lTNQC
         L0yu8IJ1H7IFOAY/Vop5OhpX3jaIKRU6iEZphr/fQeGw6a2QzFk68F21z2X44vmRNj/m
         f2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273323; x=1788878123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDTzGRSuf0suiJZUukroB/MoIhkJLBQ+jHZSEmCjFNM=;
        b=FHZT/sHal/rjetJGExPCE/zaifUgzZrf6MV5Kcu/2qbseUn4JzEKpxt1isz41XU08y
         ooUZ8QfiHo/TycPuhkj4GHn1nncYI0W9EK0twsTCtnz/q8qTmXj5racGMsMIktU05dCu
         FB+LVWX3d4IFPjxVp5mjEZW7x/MkQLI8Rs4HvetVmeVjC6N++lS6YTrlRSr8jFO5WCSF
         qKEN+Ab3LBDDiZhW0bDqKbDBQ8Tp421HTQkagZ0r/9+DVlWtyyfLWDPLjB1SOu0tA6eH
         yGpAUpnYO6XWhmJOs8quAy1kAIgLOXCS5Gua04ZCeBTeLfAIGCqVP9bmtB0C0VtxYRFP
         nSKw==
X-Gm-Message-State: AFuF++lPL0bZd9X+8PYgBbPc9kgdKKTCVKC5wu05Z9lqaoH7KO0cdw04
	zQz05YYYKmXka6KwNcOWVsl0qXsPeGGC8zscxictZFHnQzHM4mJCwFY3OYZCVLaLN+Ydjt1iDi0
	0tIGNoxDp5WgZ7zM5MQs2b05G0JxBsIo=
X-Gm-Gg: AYBFou1tg/nsguVjj166uYeNttmpJGvE633TdbXwCZ9fpPfoP74X7NZI8+u3SJvbY3x
	UDi8Lxht466XPTNEltW6HGyQxPxUN/3yaBgoWjKpIyzTA89P/UpqxJ1UISDcROyTUAUFz2gyMBh
	4nL5ytMFo+IV6lc/xnM4tML26psi27uyg5RoII9BN9PRQiHT75/xWhyjUEA/SSKlj9bgfzBnrTt
	hrDwHICGhxnozAhMFuJWIILdZwtZ1FdV5S8PANeK3OVg4pYASj271AIR3ZIwt1aPHckSnpruXZX
	+QGUbq/Xlx612E1VzEVBMFQEXGqOdWsqXOOj4F7vK+ls
X-Received: by 2002:a05:6402:1ed6:b0:6a1:fd14:8832 with SMTP id
 4fb4d7f45d1cf-6a60d3c8b6fmr20054388a12.12.1788273323195; Tue, 01 Sep 2026
 07:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260831211324.635049-1-jason.stasiak@garmin.com> <DL3U9NAEHMUS.1CB70WHCB86EJ@smile.fr>
In-Reply-To: <DL3U9NAEHMUS.1CB70WHCB86EJ@smile.fr>
From: Jason <jason.stasiak@gmail.com>
Date: Tue, 1 Sep 2026 07:35:12 -0700
X-Gm-Features: AcwNN1X05Y0zN4s9yPEog9xhjbUXWPWnchd2_0m1OTvMo0zNRnbu7ZZrMCrs9yQ
Message-ID: <CAAxqs6n1o90G==0XTG=P1ymz5+HS4x0sJjZOpLnFdRYiiKWBYw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libsoup-2.4: fix CVE-2026-1467
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Colin Pinnell McAllister <colinmca242@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 14:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244830

On Tue, Sep 1, 2026 at 1:32=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Mon Aug 31, 2026 at 11:13 PM CEST, Jason Stasiak via lists.openembedde=
d.org wrote:
> > From: Jason Stasiak <jason.stasiak@gmail.com>
> >
> > Backport fix for CVE-2026-1467 from meta-oe to OE-core.
> > Update CVE patch to address a use case where a uri validation
> > failure was not handled.
> >
> > (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
> >
> > Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> > ---
> >  .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 276 ++++++++++++++++++
> >  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
> >  2 files changed, 277 insertions(+)
> >  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1=
467.patch
>
> Hello,
>
> Isn't that the patch Colin McAllister "colin-pm" (CC'd) asked about on
> IRC #yocto?
> https://libera.catirclogs.org/yocto/2026-08-28#1787933879-1787935062;
>
Yes, I believe that this is the patch he was asking about.

> Is the trouble he mentioned fixed in this version of the patch?
Yes, the issue has been addressed in the patch and the associated test case=
 in
the connection tests has been updated to verify the change.

>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>

Regards.
Jason Stasiak

