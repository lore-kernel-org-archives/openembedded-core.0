Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A3FB678449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:51:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r68so17698403wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 03:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=mhBxLqi9YtQ/rA1Z/yb64gwRuSZXsAoGxu+Qv2dz8vk=;
	b=JZjj5tGZPrbZ9oDSH0oJ3npJ1hEq8U9g9KEmTtVNZqBNi1zjginq4ehmldpwAcVnVp
	+3X+RuTE5SRI9Y97vg114I8Vr68R0P93VtjFukq1Xj1hU4UzA0DfkGm5cFSbJq6DPrpZ
	ikZWVUYQK5+VIMUGuTti35MdS9/4/VO/HmLpcKP2dw0UIWQRLmoK3K4QLLZLi5rj03H0
	G0a1/oEh9cqA+0VGm6+ZtYwDONuiR+2djlYwxuVRUETgbpGrRwiOZZ1eb6ID6efTewv4
	/WNRDDBmYtStZVVeV3y9sEzT6kYVw82RFnK1L7tCNNx4sTi5Boc9y+lUnjOZzy8tqVwH
	A9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mhBxLqi9YtQ/rA1Z/yb64gwRuSZXsAoGxu+Qv2dz8vk=;
	b=UStJ3YYPoErlqQjn9PDLW622UUF6ruaY7e2GWsEqK5gY+xUKZ2yPUmvgefpR17njgA
	SXMOsFBy1d/djQnSf4JTVsy5AjIyK9B7rZNZWf5jSaL3o924DtvvsQAUNwAgeEORsdwc
	/xqrODyGDPzbqL0xbTBPWHMzlPBZlGTPcAI99CQ3exrnrwkhAGbDDVaNkY+Q6aqiLTqI
	LECzKaxF/P47wo7M3+pIpeIe4+2a1MiQ2hwdKRq/UtalvmAF3QvIIB+DCWPQqt5V6ndi
	muOTbsc+8o588jFhwilKwQhXXpTM3xq4FbihFoGmF9TxqDAMi6s54akIzQNrF6/SM5ya
	2TJw==
X-Gm-Message-State: AJaThX4l0RMqbeEdLQ8IB1+Ci1EPJARY6Bu57GxtAuQ9QftNQ4hTMXAZ
	VZbcG56Ryr+QClGFf8Wnwr174kh3uc9+doIu1hRQ
X-Google-Smtp-Source: AGs4zMb+Of2I35ps0NW+bekkmoJ4Wz6UGMHux9tD9juXwQiNvgkylj3Q/oYaFiyZm2HU58DF1U50t+MrxYXOJkJlVz8=
X-Received: by 10.28.143.84 with SMTP id r81mr6074735wmd.122.1510660312919;
	Tue, 14 Nov 2017 03:51:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.67.65 with HTTP; Tue, 14 Nov 2017 03:51:52 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Tue, 14 Nov 2017 12:51:52 +0100
Message-ID: <CAHvQdo0LKDbFYudJJHbpLt7mEZq62vdG9nAoiYjBsTwHAqFM4g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: glibc 2.26 memory leak
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
X-List-Received-Date: Tue, 14 Nov 2017 11:51:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I started to switch to rocko and noticed that processes like automount
are steadily increasing their memory usage over time until the kernel
kills them with out of memory.
After a bit research I came to the conclusion that glibc could be the
guilty one.
I updated glibc 2.26 to the commit which is used by archlinux:
https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/glibc
After a rebuild everythings seems normal.

I found a commit in glibc 2.26 which could be the fix for my problem

commit 6e1ea21501eac981204c3cc8212d45998f74983c
Author: Carlos O'Donell <carlos@systemhalted.org>
Date:   Thu Sep 28 11:05:18 2017 -0600

   malloc: Fix tcache leak after thread destruction [BZ #22111]


Have somebody noticed something similar?

Thanks,
Hannes

