Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8799D74A35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 21:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44RYGt3tPWz5h;
	Sat, 23 Mar 2019 22:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553375767;
	bh=sSPsVB6GXYCD7eqOsgXVzH30deMxyp883Ncl0dcjuBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q16bXu+ZeBVdymwws+/UvCKUwAZMFlxHkQHDrY6BNbRBKV2qlZl9zbJ/ZMvadxRA1
	zxMkj/XZnaaLqp0gBjR14e6Pe/U4St++rJ6gTFBw7eVUJdeEEljV9s1DR+SnOOGJbT
	lMP+Nk+8BIN/lpi59osczd+XroMsfl09/tyury1Gtp8XESZ+j+uZgHiGV5mVnJCPwL
	LqO2UUVfi6Ft596Dhte+meKW2tWP0vrHEKxRZvhZQItmraas5pFbkrVopHbMqJvWU6
	em+tAvs2kZMXrCI/2csmEn6PrEynKT8cIxoJ9O2zqiNcDfPmmvPIY/C46PYUyTzKAw
	0R2OExaBN1l9pXzyeDX2Wpgp3Ju1/rULgn9tAWXxfPpnN6pqng/GfvEnerDC+9/eEw
	eayqMe/ThNngWweBIX/HqY+NONPSjPhgw1qBuMN8/0yX3x+b+B3iVcY2+S6ZvEdMVX
	5K7W6nMxzXhrDkR3PR46JNj255Hq89kmEvoDryhyk3auk5lSiQybSGa4LJA5NhQRcI
	v16spVKY8M+Stvrhhl7GE5hj2YFUjJNnY5wlh5JaWZz2Wot+vWKSx/dfkFSowD9Tqs
	PaFKtwDwcI8pQy8rDnGvXgtWHvBJ/DouACw6q97EuHRkT/Hlql4e+Re2ahybjccSzk
	mKZDOTzvH1ZG8E9vs4Ly26y8=
Date: Sat, 23 Mar 2019 23:16:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190323211604.GA20793@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2019 21:16:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
>...
> There are certain design aspects of musl which are actually turning
> out to be good
> e.g. there is no __MUSL__ define, so non-portable code can not be
> hidden which is a good thing,
>...

Please take a closer look at some of the musl changes to NM that made
upgrading NM so hard for Andreas.

+#if defined(__GLIBC__)
 #include <net/ethernet.h>
+#else /* musl libc */
+#define ETH_ALEN       6               /* Octets in one ethernet addr   */
+#endif

Using __GLIBC__ in workarounds for bugs in musl is wrong,
and cannot be upstreamed since it would do the wrong thing
on other non-broken C libraries.

> While the eyes may hurt
> to see them, it does serve a
> good reminder of whats needed for a given package.
>...

Who is responsible for fixing the root causes of such bugs in musl,
so that the workaround patches can be dropped from packages like NM?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


