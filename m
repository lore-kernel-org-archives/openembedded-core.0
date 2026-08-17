Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD5CC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 20:16:19 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4020.1786997768896818446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 13:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UHFg3oac;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836cd7310f4so56839157b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786997768; cv=none;
        d=google.com; s=arc-20260327;
        b=iPhDnodErK1jCHQSWPQTNZLPzJyD6bKHoMM1CK49bgQ5ho8xn0gDqHQXjDeeNrbkbb
         QtZ542wSfJWlu8eS/mfPRozlLV7Cs9OdeV0o5yw2/kHxrPPxxxTkionO7W5MqaJVPL8A
         Lw3hrjWdoEw/1Qfy8BDj/KXeuodS9wJBMGja+npr1JGpQlt11AXT7x+MKjmg7FbUtMpk
         0AhbzxmCCy9QqU2uDMNj1POaXAv9F7Go2TD/jRm2q9k2EBE1nibGEDF3ATB9C7Mdlere
         9uMefnxYIlOc1XDrLBODEPHiwMaDW39R+cPNeLhD66L5vqgyff0gg3ZIggK/SFrxTD+K
         q4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qE2zIxqYLZLRVU042Ufc3ydAAOGeAUGI9vkf2KsaoCA=;
        fh=mpDAEjnDXr29tdG++W9g6oRMfMWbq2Uw59yBZpvJOTk=;
        b=X8VQexYePVO7/8XTxfLFS9bm0nz+8Tu6JktR9ZWZNIowxDabX7kSNyYbSgPd0i6+0N
         fB6b381CJgzh9fjUlVJhPeGqK1o6u9+yq6Tjw5Hd71EGOLd1HpPce0gdq5GxBKMpjWSb
         gdK5M/Rin5fNgEaK+C6yDFG88RkMjcsKHtHe31tPTYv9qrgxOmdbIDYUP36D+NNDqlEo
         8478uCJSkgvm8IwnZnw8KnOsIev+cu2E14N0a5DMOxCknmAjE0qmieZNGxNWZHODPRZw
         OGohPGOpgzzEcXyVJDa5U1UwFv2TduDd0tQA6zYmhlWhCI5+3YzHUCbCm6/raMaNViZU
         rMjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997768; x=1787602568; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qE2zIxqYLZLRVU042Ufc3ydAAOGeAUGI9vkf2KsaoCA=;
        b=UHFg3oacgQ3drHFSKqxmjh153/pfMgkzKKmf+aEi7bqdOYXwQgyPRMDphFFFu1XmG9
         6WCBjMy4xL/WlsG089Bmqiu/bxFsDeavaeWRuUWMvnLrWaAPYX59XfvWcfurkepyek8b
         XsOIbM8Jgk94z5Qr6SljnVfBuhedNbL+Y0NuqKlB0oCMBoMt4vK0MTXEqj9KYzjA7Fva
         TJIw9+lBSmsnEOmeCPRztB9nNQNNUExQNASujWklxhXqeWgoyW59wf5P2M3hCM+edSMM
         gbbx43WSnFUuzm31mzJyIvSeIJbIPQyJlaFjbb70XmQXbsM4nmNlav6MtwRh6xQxiLnp
         AEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997768; x=1787602568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qE2zIxqYLZLRVU042Ufc3ydAAOGeAUGI9vkf2KsaoCA=;
        b=sHG5NotTKNfsjeBljpisle94EWog0nIGNY+QznkRPI4nXddKrZtK2jxAu4LNf5sJbx
         fV4JQLr488oe09Yf1u5eikGv//Fmn8zcjZAaQcj7DrAWOQIThpkb90defqwKgpDHECXI
         pwqeZysbb3wou4ohHDTip1oz+tl2evWQGQzA5l9O1ipAjn1L3hb8RE1xm0/DTWNNwVuJ
         SXrbCnSYV898YqCWbkWuZrCeDqxEUKTk5DgkdAPuy6xfYZA3Ijau02LIxBed/HeCsfCN
         e94g023Nh0hH7clzGwruDDu08YVe0Cf6H17+ExYbPgaDk4WCsJZzVxKYiCeZwp4hsrTZ
         kvng==
X-Forwarded-Encrypted: i=1; AHgh+Rp4RDLrxdCeXHkcouT0I9t7/yBvhXLs7puyaeVf2wsP+NJP34uYcMCfdvQDDQ9yX+/ab9HuuPgiGpa0zw70+eWblw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/Bcl6FmywHfORBiMQkIviXtC2/lFgxZlyngzjdec6ZDGFDHy/
	cds7PvhABk3yjdJ8GdjVwEbPhJft30eTrZf1zgqZDvwQY55EXYC66Pnth1FKkCYRqskWy8+uMX7
	7C9Kbsvk35GiPdewU1OK70b9P7QVP65Q=
X-Gm-Gg: AR+sD10EKvJXHXmW0sq3Vw2wWYEHpVRnHg+pi5iynMQbhIN2SfZu3bh3gaaLL7W3KJI
	WR6CyhsB5YJVvDg0h0qDUugKilDB1XPzge6KqmEP9ye170kHKqvqpPLYHCU4npVTvrlgQoqjYSf
	2dnH8xyADOJag8BRq6Ru1bOyDWISV15OAwyHm7ebr6wW53eVWtUxPslGP0nxrxNY9Oyw16AMy4j
	1w9RnBuN+DPcbFiiNwT0MdhKPSw2IV4yi0rtG1Fti8rYvN5kJ0DZAzN1U4CSLiEPtHn7+yXtZMt
	69g2ubUF90vlAdikVINBpponcQBrkCgbSAomeC57/6PnM6Y4lVFfvbwEJm7rccNZqLA2msim18d
	Y2so=
X-Received: by 2002:a05:690c:e684:20b0:81d:75b4:925f with SMTP id
 00721157ae682-841304dbfffmr10737987b3.19.1786997767815; Mon, 17 Aug 2026
 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <20260816231104.3871015-2-sumanth.gavini@windriver.com> <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
 <0687c7a0-8f97-4750-bbf0-e8c18772f293@windriver.com> <DKRAVGZFGDPM.LZPQQB1MV24E@bootlin.com>
In-Reply-To: <DKRAVGZFGDPM.LZPQQB1MV24E@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Aug 2026 22:15:55 +0200
X-Gm-Features: AcwNN1WMoe3O5tophBuH1-5u33jasEbqY0I-Ka6pD_SkMzvhdTWqpP-CjtxcsmA
Message-ID: <CANNYZj82e6aB_ggC7NwWWigFzy=zsSgsf-E40Rb2_mfQR5+84A@mail.gmail.com>
Subject: Re: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: "Gavini, Sumanth" <sumanth.gavini@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"mattware@cisco.com" <mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>, 
	"peter.marko@siemens.com" <peter.marko@siemens.com>, "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 20:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243639

On Mon, 17 Aug 2026 at 16:48, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> I can't really do a clean build without the sstate cache, sorry. Or at
> least not just by myself. Cleaning the cache on the autobuilder, will
> fix the build on the autobuilder, but not for any other user that will
> have the previous objects in the cache. So it means we could be breaking
> the build for some users.
>
> What I could do is, as for last week, forcefully increase PR on a bunch
> of recipes, to force a rebuild. This can be used to tests that
> everything works fine on the autobuilder when everything is rebuilt from
> scratch, but probably could bot be merged as-is.
>
> Weekly maintenance will happen soon, so I can't do that right now, but I
> will try to launch such a build tomorrow.

I have tried a local build of core-image-sato-sdk on qemux86-64. It
did succeed. I then checked the log.do_package_write_rpm for the
packages involved in this error seen on the AB:

Problem 1: conflicting requests
  - nothing provides pkgconfig(gstreamer-1.0) >= 1.28.0 needed by
gstreamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo
  - nothing provides pkgconfig(gstreamer-base-1.0) >= 1.28.0 needed by
gstreamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo

Locally, the packages made by gstreamer1.0 recipe do have the needed provides:

Processing files: gstreamer1.0-dev-1.28.5-r0.x86_64_v3
...
Provides: gstreamer1.0-dev = 1.28.5-r0 gstreamer1.0-dev(x86-64) =
1.28.5-r0 pkgconfig(gstreamer-1.0) = 1.28.5
pkgconfig(gstreamer-base-1.0) = 1.28.5 pkgconfig(gstreamer-check-1.0)
= 1.28.5 pkgconfig(gstreamer-controller-1.0) = 1.28.5
pkgconfig(gstreamer-net-1.0) = 1.28.5

But gstreamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 does not even
require them, so the error does not arise:

Processing files: gstreamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3
... (no mention of pkgconfig requires)

So this successful local build seems to contradict the above AB error
twice, on both ends. The AB error happened with both packages coming
from sstate, so it's difficult to tell when and how they were created.
I suspect there might be a non-reproducibility specific to particular
host distributions, e.g. something causes rpm to be built differently
(and then behave differently), or something on a particular host where
rpm runs contaminates its behavior.

There's a bunch of changes landed in master, including a new gcc
version, so we could probably rebase on that, and re-run a-full. More
data points, and especially when there's no sstate (it is difficult to
trace its origin), would be useful. I don't have any other ideas right
this moment, but maybe later something will pop.

Alex

