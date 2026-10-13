Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0655CC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 06:54:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1512.1791874474425110668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 23:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PBsicyO4;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1af482519so793305e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791874472; x=1792479272; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MTQMryuCf0BTBBQeQRlipEV7lOyOdRjrCkc90hoDLfM=;
        b=PBsicyO44Lr5yQBYGLpSyJElfB9QOuZFWJq7uWHiuObqJFvHqTPM5TuQfWmpCybYap
         p3QiGJ6jGlJo5rttfHbJsTS2PSBHuZH0Gzs1M6HNd35iiUuedQtn1C2JOf9rAnKc+kR4
         j0Og4t2Szvy6GgcvrxBNNRNEcGakeenlcZSCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791874472; x=1792479272;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTQMryuCf0BTBBQeQRlipEV7lOyOdRjrCkc90hoDLfM=;
        b=0oNwu4HZka7WWPZjBqARJfBhb/uYWIbt1wRwgOKeF+tj2Zmc6QCs80oKo2+81imIOg
         elSroTg8sTFutCNrEXj/k1dcPs6ADo3EPptLbE99sGZknCobLJ1W1wToNWSSonCl+0I0
         cI9i1xc9zJTmA0QCISjGFSJIy+7Ipy3i0fY4JSuedNvbNFyNhV+kphhgItD296Jyr40a
         Ne70riwouB5onOEEFl4GgyrvSeomkpot4ThrotqOkVyPaeofA2ZD9kkcEONaVQVT5rU6
         qY4u4nvtQa94INRBBOdTKcLuQZKRV9pGszWAu0KrDs0DrooY7TXEMEvEGS93/2ZIgY85
         zdvg==
X-Forwarded-Encrypted: i=1; AKwUvByBv8RzWVEIyq6tV4TQecsKnUvLeuhGCrbsXzLsBC690ugh4XIH5oPCuXMPpr5ouEU6PrsPnkgpSRD8S/zcD/smxw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYII/loC2kkBN8OknAGAytsWCi3XIMYa0tTpeGEDbpI65quBbEMk
	64HxdNPz90oAcuuoTOPWkOqde2/3CIP3Sg8GWAs0rHej3bJsumc3WvCXFKqGQZZyw8I=
X-Gm-Gg: AYBFou0mXDsiNkPzh/sCKGQaSN+4Hdq8ceQ1APkK5WDOVPSfy0P1PoUVj9g/oONhQfV
	2o3aPrAg+P7rcMOB30DhkTygQeNBwAH3nB7++1IxEEz1nRYB9ygcgI58a+rQdhHZHjR2iJ67q6O
	lMuHmRxsFMUNkRd6PLSD4VUPM1e3GychdiCXOwlUxiP31JZC4IaPi7zsaK6uAbx7yQJZeJabFl/
	++3nc1WIPjG4pzlCuRwY8/J99S9hBokzDIFjsJLl2tNbgCfCHamroXRHjsohnxHQGtY/Pqn27Rs
	dWQz4wyDztZOsm4yjKqm8y2xDuSsnKEYcNfBkAql4Bt40UnMnRpnZaRL+F4hKMEzLPGZBMR+qZO
	Bw2CzXppxo86cfOj0IS5E3zm5bC8lrwBbWibRVlhCG3G2vD0BmgnUzpg1fXGZ9JDtwefpmF7zy/
	yJcxjSMXXwWeIou3/bNmgdKAEW19FNht7Obr+iYbM/dMEEyVRGQmRmYF4hseSiwiIlyqEcyW2Ge
	G/lonutUB9i86EUXoqfNazictq2bJWKYWgSZgxXbRSdjr+JJAK+GqTLv7dJ
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr212876205e9.5.1791874472510;
        Mon, 12 Oct 2026 23:54:32 -0700 (PDT)
Received: from localhost (2a02-8440-2605-485d-f30c-a3cf-2eac-16ad.rev.sfr.net. [2a02:8440:2605:485d:f30c:a3cf:2eac:16ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1021sm314265365e9.10.2026.10.12.23.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 23:54:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 08:54:30 +0200
Message-Id: <DM3IHJS5SOAY.3RZ32LVIU57KO@smile.fr>
Subject: Re: [OE-core] Walnascar: enquiry about backporting the pseudo
 openat2 fix
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Harish Bansal" <hbansal@lynx.com>
To: <abiswas@lynx.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <CH2PR22MB2038668BD49A629158C12893CA9E2@CH2PR22MB2038.namprd22.prod.outlook.com>
In-Reply-To: <CH2PR22MB2038668BD49A629158C12893CA9E2@CH2PR22MB2038.namprd22.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 06:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247696

On Tue Oct 13, 2026 at 7:15 AM CEST, Ansh Biswas via lists.openembedded.org=
 wrote:
> Hi,

Hello,

> We encountered a linux-libc-headers failure on Walnascar during tar
> extraction, with errors including =E2=80=9Cunknown base path for fd=E2=80=
=9D and
> =E2=80=9CCannot mkdir: Bad address=E2=80=9D.
> Updating pseudo to SRCREV 9ab513512d8b5180a430ae4fa738cb531154cdef
> resolved the observed failure in our tests. The forced packaging task
> was completed successfully on Ubuntu 22.04 with GNU tar 1.34 and
> Ubuntu 24.04 with GNU tar 1.35, using BitBake 2.12.1.
> This pseudo revision is already included in OE-Core master through
> commit 2c20c05b324e5d6564c8554381019170839509bb.
> I understand Walnascar is EOL and backports are normally not accepted.
> Would you consider a backport for this issue, or should we maintain it
> downstream?

Sorry but no, I won't consider it.
Walnascar is EOL and the situation you describe does not fall into the
very (very!) rare cases where we would backport commits to EOL branches.

You will have to maintain it downstream.

Obviously, I recommend an upgrade to a maintained branch.

Regards,
--=20
Yoann Congal
Smile ECS


