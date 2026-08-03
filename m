Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCB7C55197
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:18:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40116.1785752321948415134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 03:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TrE9kpd8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10028925e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785752320; x=1786357120; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2h/ZVeHh5ATtE64qQJUmYXvZJp1jviywk9MjXmpwC3s=;
        b=TrE9kpd8x97Nwo3Gbhiwc0IZ0vjvaQ0UzB0Ps7tjDqPN54gT3E4sUQe1c2VJdtrq0m
         Une6jHYLD4WdWpdtr8V9MXYBzdvmRPce1N9xRD5jbuZUKTqBfgapcJc6rUshPmdUc6XF
         wU/3PXFuXoNS+/lkmZSIWqCQRqasrs2TUigIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752320; x=1786357120;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h/ZVeHh5ATtE64qQJUmYXvZJp1jviywk9MjXmpwC3s=;
        b=WoJ2aHca7W+hQu47ZWyANmO1ScEYc+fUQ680QmhXT1lR7QCV01aILbQBTo/lmgf7xJ
         7D/w/2ne6knZASuKayEwD8jZI+4Yl6wWTFf2j5Cf2ZyNQ8Z7noORje69Y/cah1/465Vu
         kIIan7C+S3aAUory3zYXB8xWaryUjEB7U5cdXP0ORjlvgtndgSYxxUTdYyvKnS6AqlnP
         3SoMn6G45ehkkTNjR7+SPafOcBdnbeBik0OlMfaD5szZdSAKgKgc4M8VhTqeEmUCkPA4
         DvEktvh9T5hrNsZj5DXlel1jvx+Xq9Q0t1wHVgOi+zlzo3CX40D8LgMSHZVS146Fe8PQ
         o66g==
X-Forwarded-Encrypted: i=1; AHgh+RovMnKw3duTvDH5xnL8yXOX6ahxaUmgLefKLOWSQxJcEJNU39HbN9Cn7bkTHPYt+qS8wlpLZMTKgkuRdkXGYnLdgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjgLTIbx1eD7Bj/sSyVRB/+ZnwT0AddwkCif1uTw06iit+8DJZ
	yVLCdagSlYPfhy1vo+Ye5KTpxWebVikwyRcbwReBn5hRZ+H1yODvHLHMc6fbqxgfsdg=
X-Gm-Gg: AR+sD11+1gs35F9q5nXhp4vL+I4sYY7iu5Rj1aC+PUYHowuWsBCdf2W0oi9X4yp1CeL
	+wi6eaGRDPdN6QvSO+m8iMcr7a+F43wHEZGd5liiuH9Ld5p4VTWYsLP90ASbt5u1UO6TAP26ROs
	54iNUBVF6Zv1i2Z++7nYgqy+GhWZKW8O6uurG3Ualz9wVXhGiD5/HsJA8mQv6ihUShp6BTDuZ+6
	mIojiLwcrbr3WApDXDpZSZYPTd3V/XYCGyOBlsPDcWoNbYrf23TPiGc/E3zZGfWQykv0pthSYbk
	810bVCRi0RF4h2dmBz1GzsCKXP/IiHWQak1SrL0qDNccH9KdtiJDd3FHsMMx3EyMlF6cGBrHRc8
	O00Hkh1b9FPJyRGLBHxDni2q5yrJtxIZyxvJLmuauvJ3vD9bLa3JJDqzRx91vwHBep5eYBVM4sP
	XDgyWYpaFM/ptZhUavBE/rJQA9avEYCoDhzbqOEJF3H4nUVhev9QTVRz80A8ISSLZhK+wg0hxaa
	T6hjokoHXsYdAHM2+9a66HxfehZfxyun3DK7ehtv0D7WlwiyvCEDjo=
X-Received: by 2002:a05:600c:34c6:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4980c66b50emr227468935e9.2.1785752320198;
        Mon, 03 Aug 2026 03:18:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm30449482f8f.34.2026.08.03.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:18:39 -0700 (PDT)
Message-ID: <30940d7e4b46c8b44c0921956fb0785b4d164606.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v1] libpng: ptest: disable for riscv64 due to
 timeout
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pratik.farkase@est.tech, openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Date: Mon, 03 Aug 2026 11:18:38 +0100
In-Reply-To: <20260803093344.15211-1-pratik.farkase@est.tech>
References: <20260803093344.15211-1-pratik.farkase@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 10:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242647

On Mon, 2026-08-03 at 11:33 +0200, Pratik Farkase via lists.openembedded.or=
g wrote:
> The libpng ptest suite consistently times out on qemuriscv64 due to
> the emulated target being too slow to complete all tests within the
> ptest-runner timeout. All individual tests pass but the full suite
> does not finish in time.
>=20
> [YOCTO #16215] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1621=
5
>=20
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
> =C2=A0meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

When you say "does not finish in time", where is the timeout occurring
exactly?

Do the libpng tests emit output as they go, so each test should reset
the timeout in ptest?

Or are the individual tests really so slow that they don't emit any
output within ptest's timeout?

We did have an issue a while back there the output wasn't being flushed
periodically and once we did that, we stopped hitting the timeouts,
hence the questions.

I'd just like to understand where the issue is before we disable it
entirely. A comment about why it was disabled might also be helpful if
we do ever come to revisit this.

Cheers,

Richard


