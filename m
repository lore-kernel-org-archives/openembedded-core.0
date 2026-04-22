Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AFAF9B618
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:49:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79699.1776854984692671449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sIQv7vzU;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89fc349b5ceso76138426d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 03:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776854984; cv=none;
        d=google.com; s=arc-20240605;
        b=HaqCTpZZbb0fbFpb5dAUpOZxxZQ2ZtkEo4Brl17AyLzxtLq+grNFzEKXXqsmMGX5SE
         irwcB2gG6RJjkg2rRWPW/RkAsGqFKha+87kieFW7dPA6TkK3K6wSEoPzkTqcplabmF6l
         jaT2wKzBwtU1Qhg0MgArssF1sm437vScptq2nvYNfyxKtFxSTYxRzrV3NMSnponQYkY9
         z7Wd4FxiGoHMFVc1UY2A7uIPAqQ6NqJRoup5bGnzUjMFL1kmHBoJNJOq64YJbKyl1c4b
         2zdYZjOjZoxcWjkzwNkJVn8hlTOX0KYBe32P7KDBaF6n3yKWdEzJbEgr7pHoGbjWgFbh
         /eCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G9U3puu5R/vg/3vEttTaJikoDWUZHqwC5K2oHjpjncY=;
        fh=KDBggjr8BLztnc4QKL9wpIZeKsRhbOowKcZEQS8F7CA=;
        b=aeFoXWv9fbIIaY6cic7NJjPoHeijYZoMxYsLwb6Y+ZAC4PTr8vCQaBquZiFtfii74C
         lV7skyDopsHsgqes5bpeikxa5TKj1xtlaVvS0lLtDSfX9Zr/KYoXLuCAz0KKw+9c3Vvd
         jwOLoB2OINeZPZsrH9Cu+QJGB/DrTLCSzzvDk8/tRsimq7O52PMJANsHZbmH6gHnCDV/
         QNvd0Tmm60I46oqV3puB7y/Ndi2MvxItwUFONFmJmXTAdZ6A8oOWc7rXYPxolSdlSQaY
         wLPUyYuOOSgJrx4QMMCnZ/pEbZX7Pkkjo/mhMHXlefzdkYGr2aR/K8iq5e85icuKIkVB
         RKHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776854984; x=1777459784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G9U3puu5R/vg/3vEttTaJikoDWUZHqwC5K2oHjpjncY=;
        b=sIQv7vzU18NRupY7UrfTWQoBWCfAwIbe+q9hISGru4DehYPn+mGwuB6v3CY0POsblo
         Tbp8A8x2jhrbKUizQ/TSxXu6AbRl9NKIfNf5DX2JDDfrM9o9yQrjGJ/hCHUDPt0DSmM2
         SjXEZ5L1PK7/7Zs8MHkK2GnG9ZhyAOMP8HRkOBuQ0r6itRw/d1kDTXLPmlhKxv7qavOe
         7E60nfv+Ll2w2tIqTag/ZsdzIl16KlISIGteS0k2ejbCiKyo487o8lgFJTfSIJVnUq6n
         7qZvkLEUSTpZSpYDyC0qTGU1b7QlITaQQF0o/Uf1CV0d8vtgFOBLb7RcGgzCZEIVp7Ft
         M/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854984; x=1777459784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9U3puu5R/vg/3vEttTaJikoDWUZHqwC5K2oHjpjncY=;
        b=mwFZFE0dF9iRpYik0/DKcPtHTTxqQWJ8ntTKWjrsXH+lodl6cuveOZVGMKXnhvigDw
         lpjvaJz3e7b8t7DrRrbhpYZEu11Ki8jZ9TDo/VzVoH7ffuh4n2yF3/xYv6gY3RRoRcrb
         rwdBUvW8yF9o7BedU0JrWBIhXi1dIJ3F1Fb+Ot6Z3uS7VEt1bSQU/kz7ZCjHYkNwSgbi
         77EVfVEpXbvkyMUnnqT1cKvQgofuvWWfuP86s4reNi4U36kvb3Hj1wGGr5apHvz3aBzk
         YIVj409UVWe/4GJOcQwyORPjq4RFZUQqJeKHRMI960jwMa8d6LmjxvQ7Xfn+7l7oHMnn
         KvkQ==
X-Gm-Message-State: AOJu0YzVFN2l5EjYEtikGpw9jQ7qWcVNXDEl33FJefNXpnIUuRJ0BirG
	11AOiFAtijgAKxvRzRrxNn9JLfuJt/mJiJ386ghpi0RDqCwuT5du8ucvs5PKb46g55p+7eHy7sX
	DXaRBNahUn114jHXXWlS5AuX82ICIR4Y=
X-Gm-Gg: AeBDiesEfgX/5FDZFDT8UG8pj0MAtD1scrRfb6H/1TsZ8oNG8NYoDHqDMgxOelewFLH
	WYh3v76KrEX+2PWkeRX7720TmpBhUWdhzipY69Alm/aYxatb8qpi74zpLe6vMK0qxe8VHGSb7DF
	k+SSV+LsAL3a8kGCacVY17nT8Klz7PvBkByDOv28YTZiMSgfcaEZFXPl3akeaKQw8u6R/HgPzY1
	iEHw/3g+qgvt52/DCzm3ARMBM/RL4dVDmvZUdP5hqf9E+RaAnqiOvxhLZ/TX2inMQ4xXD52wO9X
	NVgfdoAWdfYs6M4wQNM8sxct7VEajnadkG4hfbetcIiNaQlI8aE2
X-Received: by 2002:a05:6214:590b:b0:8ac:ae56:b493 with SMTP id
 6a1803df08f44-8b02810c139mr360119966d6.40.1776854983688; Wed, 22 Apr 2026
 03:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260421095559.1856-1-wangmy@fujitsu.com> <20260421095559.1856-24-wangmy@fujitsu.com>
 <18A8A69CD5F34DFB.1892986@lists.openembedded.org>
In-Reply-To: <18A8A69CD5F34DFB.1892986@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Apr 2026 12:49:31 +0200
X-Gm-Features: AQROBzD1dDkUZN9QNv_CBZ1DLiatAgmhimoYvHZoN44M2WeK6tD4N4nW8VfWi-Q
Message-ID: <CANNYZj87jNu_nT711qBD1KA32rB+CT9pfvUhPW0e=TXUcWhKrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/49] python3-chardet: upgrade 6.0.0.post1 -> 7.4.3
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235714

For reference, both Debian and Fedora are steering well clear of 7.x:

https://src.fedoraproject.org/rpms/python-chardet/pull-request/15
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129923

This AI rewrite has indeed backfired. If the author won't convince
CPython upstream to take it into the standard library (which is the
ultimate goal), then it's game over.

We might place a version check regex into the recipe to exclude 7.x.

Alex

On Wed, 22 Apr 2026 at 12:20, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Neither Fedora nor Debian have taken the 7.x rewrite yet. The AI
> rewrite controversy is well publicized.
>
> I think we should hold this for a bit longer.
>
> Alex
>
> On Tue, 21 Apr 2026 at 11:56, wangmy via lists.openembedded.org
> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > License-Update: Change 7.x license to 0BSD
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...hon3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} (68%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> > similarity index 68%
> > rename from meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
> > rename to meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> > index 14c3247b35..ad36834169 100644
> > --- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
> > +++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY = "Universal encoding detector for Python 2 and 3"
> >  HOMEPAGE = "https://pypi.org/project/chardet/"
> > -LICENSE = "LGPL-2.1-only"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
> > +LICENSE = "0BSD"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
> >
> > -SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
> > +SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
> >
> >  inherit pypi python_hatchling
> >
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235708): https://lists.openembedded.org/g/openembedded-core/message/235708
> Mute This Topic: https://lists.openembedded.org/mt/118935094/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

