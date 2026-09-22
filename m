Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D68CC982E6
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 00:44:13 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175.1790037850269631732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 17:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bGFmWuTr;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef1d0so30522001cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 17:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037849; x=1790642649; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZIJKuA9uNkbrq9AoKwML/bKLJlK5zVVPh3GTvj/UxM=;
        b=bGFmWuTrh0unMyCAmyMcwWCjSIq9nvzS9XVN9+Ozaw7YekE4vIvQDNJI5bvZOuWdlg
         0sah1YpFtBUxt29/pCSiuyUGeYVk/jrM0AtRltb82fb6z9PUNwVBWtgJpYiNbV2YffGH
         4fs3LahveaCXuawhXkDBqfaqIdnYKpDcMGC7gpTsu/CG+p9VXId+RjnyQDH8XzoRBexp
         4DIWXJsCH7jK4y6WB0JY0g9Id78qauKFulAcdwXls5zxgGmo0zmcwfOvIgj+b/eAf5VG
         16UZ4wMNjxynPbqYIxdhvdAk2zq8qm4QvKqzjpl6w6GQ6YNm7jKX7fi9+rc7+0fvgQP0
         IrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037849; x=1790642649;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZIJKuA9uNkbrq9AoKwML/bKLJlK5zVVPh3GTvj/UxM=;
        b=1O45KU6gSa179c665RPpVhuy7wAlbgS1qF/f72ucSn32aW6SoCTh964GgEBqLSIbXM
         vjjC+ZruHSUbz60b94rEr9R57q1qyJpMh/NZy3OQdxOzvTmBGMjJ0WTQ8HajOZoiON8A
         WWEc8Fms+3NTVOTvLX75ZwtXM8LK8l1VVRHHCdNhEZIkYZx3WlTYcz4zhNaC5RYQj00J
         hlNaAEFzoGhDEhnojL4wzJ4YlvunBTn4zwx/J813PM0NKfjbhkbYfCSmLD8OHZQ9cJTM
         8Ae3vRYRRfFWu7GQZ5ltLv3/SA4ovTbs62b1dMWrL9Lkl8GFnhN7OEDiJZGszH3ka/Hf
         7fhQ==
X-Gm-Message-State: AFuF++nzwajt+goTBJQ+CWGfcLzMdc55GcZQSYSJHmhdH6ZH3eiKiJXd
	OUWDSN10scXDLxGPJzBc7nrYByXOd6+8oY8UFWu8QrK2zKtx8dcJTJq4
X-Gm-Gg: AYBFou1gfPtmLHO3PCda5zHcmbpJ03SlnwwWDnMsu0a85yjg0YmFIHNlKK56iqVw6Bj
	ikyrICE/jx72ScMVM26lBMOk434v02VfgxS/SAsgTLzyaBctm/LPIpxiZLceG9icqibaIRXxoJt
	L62rRGkGrw+FKZkgdOyZVg5Ale6JKilE4BkP1j3LKdrlq/mKsm8zr2LjM9aYCJTtjqi+Ys8bLrb
	k+dlaSXBK3pixPRrQtkAoCRA8Q51+E9DL/yG/pUjYgElBL2Nqz0nWF9Ge3EXnQBxKJaDu8nPG6R
	7e5ninvbzaK3w0AYObknP9XgQdhSfesjFNSFQYRmPgIRxrHcfFGh5mpZwm9yeXWURnqqSNfBnwJ
	JiBi5M/6rSmgwxm+TdZuzkLfaL2s7HoCZKZ7W1kbokMnG6ojXrhc7+OaqrTzmCez/Wm74LNCi0Q
	VxetuPBsk5snmGEqVyQLGj5b6PfkzQx2MOqanPlYJi99XRw+0J2+FCdgn7tyuWe07Ef/nJYgpJT
	vNNULH9xS/23INn2oRBUdx6h4aBH0u5dhs2+i0NBPaQV+V7Dk/je/U5DghACgVQaubiplqL4DkJ
	PS/2cGAbwpOddyf3Lr6tprA5YpWrzSMnIb6GO3Uyi9wW3wmVA0zAqdE+gSR0M5c8hQ5pcofoL+h
	Gdlx03w==
X-Received: by 2002:a05:622a:150:b0:532:c2f5:85b8 with SMTP id d75a77b69052e-532d8d69620mr33838091cf.19.1790037848953;
        Mon, 21 Sep 2026 17:44:08 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e171290csm265771cf.2.2026.09.21.17.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:44:08 -0700 (PDT)
Message-ID: <6ab1cf58.edd6aae0.7bbc9.5d1d@mx.google.com>
Date: Mon, 21 Sep 2026 17:44:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org,
 Vincent Davis Jr <vince@underview.tech>
Subject: 
 Re: [OE-core] [PATCH 0/2] Fix kernel complementary package installation
In-Reply-To: <20260921215300.582692-1-adrian.freihofer@siemens.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 00:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246366

Thanks for digging into this. I am curious as to what is the use case
or configuration that you have where this became an issue ? I'm not
challenging the question, I'm just curious as you've explained it well
.. but didn't say how you ran into it.

The question is real: the kernel emits kernel-dbg/kernel-dev/... after
KERNEL_PACKAGE_NAME but the auto -src package lands as ${PN}-src
(i.e. linux-yocto-src), so the family is inconsistent: the PN-named
-src gets pulled into rootfs-dbg but the KERNEL_PACKAGE_NAME-named
kernel-dbg doesn't ... you end up with kernel source and no debug
symbols.  No argument there.

Where I want to discuss is the direction of the fix, and it is just
what you are asking. I'm not only saying this because you asked, since
I immediately thought it on reading the series :)

At the risk of repeating what you know already, let me summarize for
the mailing list archive. The kernel isn't really a normal rootfs
package, and I don't think we want it behaving as a complementary
one. On most of our targets the kernel isn't installed into the rootfs
at all (as you said) it's deployed by the bootloader / to a boot
partition, and installing kernel-image into '/' is just one model out
of several.

Riding the generic *-dbg/*-src completion machinery to pull kernel
debug/src into rootfs-dbg fits the recipes that live in the rootfs,
but I think it's the wrong thing for the kernel. I'd rather debug/src
for the kernel be delivered by a purpose-built path (the kernel
already has its own special install handling) than teach
oe-pkgdata-util and pkgdata to special-case it.

So:

- Patch 2 (PACKAGE_BASENAME into PKGDATA_VARS + oe-pkgdata-util glob)
  is the part I'd push back on. Its whole purpose is to make the
  kernel participate in complementary install, which is exactly what I
  don't think we should be doing. A dedicated kernel debug/src
  mechanism removes the need for it.

- Patch 1's underlying point: -src should be consistent with the rest
  of the kernel-* family, is fair on its own. But I'd rather not
  introduce a new global PACKAGE_BASENAME variable that every recipe
  now carries just to fix the kernel. kernel.bbclass already names
  every other sub-package after KERNEL_PACKAGE_NAME; if we want the
  -src name aligned, do it locally there, not with a tree-wide
  indirection.

There's also an interaction to be aware of. Vincent Davis had sent
(and you may have read it) a series ("[PATCH v4 xx/27] ... globally
define KERNEL_PACKAGE_NAME") that makes KERNEL_PACKAGE_NAME variable
across the tree for multi-kernel builds. Your PACKAGE_BASENAME is
defined *as* KERNEL_PACKAGE_NAME, so the two are coupled.  We'd end
up with two variables both encoding "the kernel's package base name,"
threaded through packaging, pkgdata, and pkgdata-util, and each series
would have to reconcile the other.

That's probably the opposite of where we want kernel packaging
complexity to go.

My ask: let's not merge this independently. The kernel package-naming
story, the -src consistency, whether debug/src rides complementary
install, and Vincent's KERNEL_PACKAGE_NAME variability, should
converge into one coherent design, and the goal for that design should
be *less* complexity in the kernel packaging path, not more.

Happy to help with that. But as usual, I'll defer to RP if he thinks
this is ok independently of if the kernel should be in the
complementary package mechanisms. I've never looked at the much, so
I don't have all the history behind them.

Bruce

