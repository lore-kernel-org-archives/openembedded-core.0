Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CF4C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 11:17:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45680.1784719014801866881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 04:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oLst8syr;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1232103f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784719013; x=1785323813; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUTVGTuKFBUY0Ph8nwCU8ur89QOND6Jk5UBEAreo3OY=;
        b=oLst8syrSe36p1luXThJbUyS45BWdXkzpJy0XTiciKFpAq6RKkIcGqSt8pZM3i9Ivd
         poXvOA3z/NBxFxjILiVvBM0kI2AYjhOl70ydxaqTWZ5McpIiV8B30SXRndXu7l54IsFP
         xfPaQzfds7+SZ3LAysMA2GTkXkQ7ZvRjnAaOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719013; x=1785323813;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUTVGTuKFBUY0Ph8nwCU8ur89QOND6Jk5UBEAreo3OY=;
        b=ELPb/Nz+b4sMTXkZgFbJDHZPOKu4e4ZkdU9vDi3WQp1uLHE/ZHi2/N8K5kiRz90Ou5
         u7lkFSC9bvCsV1LCih6a2Y+M+0MT+gRucN7Oe54WCtnW6FA9taAF1A7r20qT5Uatbdy3
         qQF5Aana9NfPx8xJ5lIwuowyc+Gwdt/HZQqXlDKRa0BRPJlnGCOkQ3QUiVKx8Cm1BTJ2
         xpQkEdTKk0a3BEPTbo1gbF01puF+vKtAPxUIKN30el7oYe3n5c1qh8hzV95uP+FULPOw
         tDFMr+ey+o+othClicDFmZccEwacFUj435lEAlsXudfZnkXhlb6XKR3VidVFpcBDnqZt
         tCgg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+vLZpjOYuRTYB4I3LF0xqKWtPYdSxpbemN3pSEiaPeOW/bJmcBw7EYRHaWotmbRkEkIf2GzZQQeeXfqhGJuyJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDJuvtodf2QQvvw2wpqdN0Hm3c7cY8qYEivpA1dj7zRIIAPmap
	mafsj1EDUnb7/6FsORHbZWkTBQZ6Jjr/frEK6jPDgl+iuwmWNrZh61IE0PHhkulfZXc=
X-Gm-Gg: AR+sD10kvQmrci9Qw/TlM5ji1Dzg1Y2D2EYj3ZmPwF5QPdps4NhH3e+t0knTLfyxatU
	luC7bctsh6ZAucfcx/eGb8gy0+mqs88MpQU/srkh3LdewsJIaHVehGSwurtFwmLTJyu+vOeSFZP
	WGZ3Ay5uiIwy+hjeORS8zBF7t0/Z6s5/+UIoZlB4OyECcQIs6nvjlSaJrOVi8o+9EcpImn1E6oq
	6LMEUyIrWgyOuqGIUgmC8EixOIraQUGjWKQp3fmHTpGk3oJvARzKJuO2/Jl/srjJyKdWPaB1hZ4
	wHGZiEN/lkH3seUPrXM+aThBzzTdLoMTc99/C3ldSlPwaU0QNlVvzQJn+8AC7lgDTWb9QXIih/i
	RkSmPpSm9zk8Xz3aSlwWNJzCwCS/O+fIO4jerrYjBMC+cnWgB87Um5VrY9GPVeLsJv/qTNjD/i9
	Ec70gs7rCJF3Nao0ZKDRzHbDRGMb5+mnXy+7/VLh43IIs7PNIX6Lp1f1zPY8nOBldIz76zP+t7
X-Received: by 2002:a05:600c:6d82:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4954a405ea3mr179698195e9.19.1784719012767;
        Wed, 22 Jul 2026 04:16:52 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm151497545e9.11.2026.07.22.04.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:16:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 13:16:52 +0200
Message-Id: <DK5237H22M9V.UZ3T8BFGC5YI@smile.fr>
Subject: Re: [OE-core] [PATCH 1/2] python3-chardet: Upgrade 6.0.0.post1 ->
 7.4.3.bb
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <leon.anavi@konsulko.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722103621.1810876-1-leon.anavi@konsulko.com>
In-Reply-To: <20260722103621.1810876-1-leon.anavi@konsulko.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 11:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241660

On Wed Jul 22, 2026 at 12:36 PM CEST, Leon Anavi via lists.openembedded.org=
 wrote:
> Upgrade to relase 7.4.3:
>
> - Fixed ValueError: embedded null character crash when input
>   contained a <meta charset> declaration with a null byte in the
>   encoding name (e.g. b'<meta charset=3D"\x00utf-8">').
>   codecs.lookup() raises ValueError on embedded nulls, and
>   lookup_encoding() was only catching LookupError. Also added
>   defensive ValueError catches in _validate_bytes() and _to_utf8()
>   for completeness.
>
> License-Update: Change 7.x license from MIT to 0BSD
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...n3-chardet_6.0.0.post1.bb =3D> python3-chardet_7.4.3.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/python/{python3-chardet_6.0.0.post1.bb =3D>=
 python3-chardet_7.4.3.bb} (61%)

Hello,

This is the upgrade of the full LLM rewrite with the controversial
licence change:
The relicensing of chardet [LWN.net]
https://lwn.net/Articles/1061534/

Last time we rejected the upgrade, I'm not sure the situation has
changed: See previous discussion:
https://lore.kernel.org/all/20260421095559.1856-24-wangmy@fujitsu.com/
and:
|commit 4e85dedfcf31f8b4c3d248531c958a635eea0379
|Author: Alexander Kanavin <alex@linutronix.de>
|Date:   Wed May 27 19:35:47 2026 +0200
|
|    python3-chardet: lock version check to 6.x versions
|   =20
|    There's a well-publicised controversy around AI-assisted rewrite
|    for the purpose of relicensing from GPL to BSD:
|    https://lwn.net/Articles/1061534/
|   =20
|    Both Debian and Fedora are steering clear of 7.x:
|   =20
|    https://src.fedoraproject.org/rpms/python-chardet/pull-request/15
|    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1129923

If the situation has changed, I think it should be addressed in the commit
message.

Regards,
--=20
Yoann Congal
Smile ECS


