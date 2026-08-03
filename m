Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF7C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:36:28 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44483.1785767786522552312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R+VeWcLf;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8efbafa1bacso18086466d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785767785; cv=none;
        d=google.com; s=arc-20260327;
        b=jxLzIz5Nf9qtf3/3xxYuULrNuP2/J5gjqXbqMnXNRL+2+Lc2xJ2LuSOI5tTyjg7E+K
         MficRcMkkrtV21HEueYvi+mtTa23773W1khIJFx/i2qZjBVKhUkVS+2CQq7nFkW65S0S
         UYOgqemngfeUk3pOHBqGHjowYDMIhX/6PK8hEgnfZ+C6y+82Jpje10Ah/KfmIM9DYS6a
         ZqDsRksbiVQQtUtjPJoFDAJ31BSi04GgKsLHUP1ABQKb5RRPUc1vgdZ4GL+MRGl08fnp
         DIApi/N9tIZQugAgdvzslu3kjKC/nWrj7jA5l0GlFICpCftYspzS7KvyubTggH1bNv29
         bWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gY8YD1vWgJHGSq/GFQRkpwTDJqzVvRQgLjC+hyiO0EE=;
        fh=thtY2DGG2xlWqVe0IB8XfAaJbV1rYyvTSM5Rih8ASCg=;
        b=FIKonYMkskbE40vh3cLxoSVx6JeJPJPoXpt89a7nrDhTGV8KWAttWKbqnrhHFyG2I/
         FX9g9Z5GQOTWEzt7ra3pC6NYWZvpzZKLHnB/c94OxcQRTj+A1bO+sij3VIOBuuWu8Wsi
         o+uFhQ7yvgMmQrfWsmmGv2367pvQgov3ZalVh8sjH4M4NqeyijYx81ATlklzc6WeBv3Y
         oHtHMpKCC8WqiuP01oLgyaTelLZN7VeBnk98v26/ESHsONwzvm0DYBhaLz8bFDfxYm2h
         kzQK3isGGe3bqUTvY1Mufhm52ddfig18M5jkOYR/h7PF2tAq7JaTU+mO9dLRGu9hReSN
         +zdQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767785; x=1786372585; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gY8YD1vWgJHGSq/GFQRkpwTDJqzVvRQgLjC+hyiO0EE=;
        b=R+VeWcLfsqMxN4Uw4WLW63VDss6DRrE2Mp9UPiAY+auWz9t2xQzDySjj0M7pOuWfCG
         T7ZmiPiKB+CikqQmHqHg8kSC9uOQgjMU3/xian9wQVY4ACZwq92A+QOuhdG6iODetP/M
         zLWNngo2gvXYBSsMy2BbgWT0kgjZd1Xpx9JJ3ERPVcVg59ZK+5lU3Zequve3fwIMwF4R
         oPF/w8hG3jJ9KQFO0ewVV/1hgyLK3Weg3+BYb4E01ue4f0L7Dclc/9LFZJtdwvgUkhht
         QU+9HT96cGJb1cBufoD5pVFhRejcW7ofe2GU7jhWYuFPCAV5T4werYTcih0aEguxMOF5
         IKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767785; x=1786372585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gY8YD1vWgJHGSq/GFQRkpwTDJqzVvRQgLjC+hyiO0EE=;
        b=tWn+wo3K1X3V+eD5uNMJiHH3i4O2qepq9pekj7DflOWLr5JsxCQkyrOc21tmSdAEud
         3y/qz1MlA9cC6r/AaifkjaAIt0IMqQyvFlxP8IVYXMfyEcYCc8b59Idm7mSwX08i+SDv
         JkZP+rSMN5sbGypVGRLaR1QOFSZdc7RvLgcW9jI8T39cZwF9DG6wE7jeerv+Ii5rmxM3
         mtGdDlgtJvy2a4bqwwrgANle95pRNwK7PxI4KJ0ttwrL/jbRgnZ04Y1KFtE4K1JkOEf6
         +3AEh9i0l5BZsgh4TqJk0XYzlbjM3bNFdEmKm28ddUpoNhXM+eIosFFUO38s6J4dVArJ
         2InA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2TKdggYwCA7UlMWHbq9k+NVP78Qa29FTlL+f+OwGnKD3cvl8DxRKYiz6JL9yBoL04dKOwLfagt/V2MQ5KT+pWRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YycbfSKlHm53HGwVpbxkLTmkXC9PxCDuE2ppnKk9c9JDwXu4RUc
	RgpjyD8RBcuYw96PW1sGTIJucWJzpbYbXdNy1PZUwMl0the9Fgabaz0A7/MGT0CTwESw20ne70l
	gzQSOntXr4doKbr0qRnRe1yh1srpCvfg=
X-Gm-Gg: AR+sD11Mhvu38/Wg241xZ23azHR172CJ2mLUq6+l4hVa+FpkjpeeNxeYBjpm8YCsrHH
	31Chxdaz++HedBhPvwgkDXu+yP7rh8euwtb0GbHgHCjTqhjcvaMiiFM6B/5S9gqeI2hsWBAndWs
	mIepBD5yejUd6VaYJLqGu6X0Fa2NDJQNhL/F2/7+jarG5bZyCZ/cpVgugyaNIq4VGusuaBTZ+Pt
	o9juoeKXaBTnHnxFlTmzBCokQVmXjXPjxnakoDK8/Ue9RSCqrpX/aLEQyLQ7BZiTazHdKJdYAcl
	s1R9aSaHm+HnrMn0EtDPufoIRNCelXBgMDk6nRnPkz5pac+8RwZyuZb6VbjjSKGoPGqLKTaehWt
	D65E=
X-Received: by 2002:ad4:5f0c:0:b0:8e7:d752:ab34 with SMTP id
 6a1803df08f44-90849584801mr186593166d6.12.1785767785122; Mon, 03 Aug 2026
 07:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
 <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev> <CH3PR11MB8774C3DADBA455D8721EB8198FC82@CH3PR11MB8774.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8774C3DADBA455D8721EB8198FC82@CH3PR11MB8774.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Aug 2026 16:36:13 +0200
X-Gm-Features: AUfX_mx5B6sGtpKXPyXWnwB5OvwvxPQlxJ2T2K5uMmXa7rok-Up11hNowKw485k
Message-ID: <CANNYZj_c+CJ+asij_nZoZ3PsZtjL45aGv3nfLnPXooYGO9gJ=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] systemd.bbclass: fix service enablement for
 cross-install scenarios
To: HimaniRamesh.Barde@windriver.com
Cc: Paul Barker <paul@pbarker.dev>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Komati, Shiva" <Shiva.Komati@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 14:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242655

On Fri, 31 Jul 2026 at 09:12, Barde, Himani Ramesh via
lists.openembedded.org
<HimaniRamesh.Barde=3Dwindriver.com@lists.openembedded.org> wrote:
> I understand the current behavior is deliberate for the normal Yocto imag=
e build path. The issue is specifically about consuming Yocto-generated pac=
kages outside of bitbake - which is a supported use case when package-manag=
ement is enabled, and packages are meant to be installed via apt/dpkg at ru=
ntime or for external rootfs assembly.

Using apt/dpkg at runtime on a target system to add or update packages
is supported. But assembling rootfs from a package repository over the
network using Debian-specific tools isn't. I'm not sure we should set
a precedent for it, as there are no tests, and it's just not how yocto
is meant to be used.

Alex

