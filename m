Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0EEC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 10:58:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10127.1783681126718703476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 03:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N6J7UfFe;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9034b6b7674so1386346d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 03:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783681126; cv=none;
        d=google.com; s=arc-20260327;
        b=I44jCvF8BOze3EyLddFpmPjMUCqWQS8jHaVhj6kmufdZ+J6ZYYWM98c9DQlmVwqKe7
         6oLyK/e0q13lGj9BtQ3BZboxcZfPLH8YVm+7f8/yitjJ+JIp61Bc2fvESSJMXm0u/tcX
         FdPuEy4UziLQXtF6EoblJpSOpWFo9Ko4b2lpW82eMHIuz1MJsFrEM1feUd9WE+NvBJqX
         HIy7aLfeuKgjWTkhf32Qp1Yfu6ZgN4gl+19XD7m/3gxkR4oaDGBl87NAND0ZJuk1CMX3
         CduJ30l/5tt38HbJhND7WeVPWZT1McS5lXNgXsD3Czr3iONECXL+00FKr9ASfIzjLjGe
         bv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9bvHVEciBFQ6/oLVrq+TbI1QW5ZQiwwltAeTa+XsQpE=;
        fh=65t7Y4j8LMUEtpUHfeDkLo7p6+778j8Q9VhLSnf6m3k=;
        b=CsETJUdRSI37ouhnJGlaVQ1D/xyctPddhJDYbQ0PoXgfmJp3OiPDoiBG0CV8AUan0Q
         yfHYm5bZcbpZIjJVW24XwfU1iBSTsrZJhtEp4g8vKDluqkq4lzI5OWOmnodi1/hYeIVl
         z0ouL1RYB1FpPZtnzKvnzb+lez+wquMe2Kj5ds0LCUf9QvcbL7Dk/3NQOPCx+lKe7B0F
         auc3AfeCFmLPT9m0eL/xc+hypvXer+17zujS1ZHprnA+LJwnetmWECI7yhsO0j6cv5PE
         KEvb6ofJInQBPLgXJ+nTPKjEqix/nQy0n3t/HTRX566qL9fezEx2BnoGZZwONvcrSxXh
         ahDQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681126; x=1784285926; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bvHVEciBFQ6/oLVrq+TbI1QW5ZQiwwltAeTa+XsQpE=;
        b=N6J7UfFeYuKpRHojW5iW4KR9DDC5e35UBJp3r7/jgsznBd23Tj3olVdFppaPN3fHlv
         WRSEiEICiTTZEoWAFdVCYtru66f/OgUmcaOK7OjWRsc44foQDrGeLLGKnsDPGe8gKWGC
         z/uWsJEbXEqqjhOfOfI89+vWEp+BtWaaK8HHPF+ywDCN1lF6H7wutqTJBG72z3gmOikM
         XPT2LesamXDMUm2NJkc1XYmYfRMey8z2YF2Fb+DK0FTymFYrKr0pW2nh1zssNgYzC7nf
         nPohx2ew1UuGAsZ2Bhg4rajGJkgvrsrdIXfxczX8p5ZzktQx6KgQU09OJbzal3sUsbDa
         6d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681126; x=1784285926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9bvHVEciBFQ6/oLVrq+TbI1QW5ZQiwwltAeTa+XsQpE=;
        b=RxD3l5FKCAUoTEjivTAYhpr7QumHUaSvWn/vbCg41CIUGrWKQgQxtoF5JbMgTVs/dJ
         lO9dXB8jUCv24aDtZ4zxNcHmVf7dROm4NBRlPxEIXYIHC8HrRSBUJx2bu/tlaDvqdGzL
         dZoCkIQQq6hPgDFwNBKFKR2AA8SpVmGm6/URXxsiy8TtHcTUuVAd8yMk/L9SH/X/FBjH
         cW8cixcXHdLyBCNGIk7TiBZIoXDppdKKS+i9A3/n4OYC9bELNZ691kdPpDmfgfsaqS0N
         Z1qr0p1CY+g9xSg370Pwc4Mz2dM4YegicqwlMRiC6HSuqRasBN5KaqXx3toX5qHwEs84
         yK/Q==
X-Gm-Message-State: AOJu0Ywhk7MmLIAOqvaMx0xBUxsw/2/zkBqpW8X+l9l3vb7LGRqQyfVT
	mZf3O2izBs6C1UvYgN6QSnt6NAn5GqejYY0pfWIWcP994FcQ1mMNBGML9cgEDT5NrzJ+kgHuXmL
	bwdN2WoRpnrUGKMCujevmluLiqsYq4LtypA==
X-Gm-Gg: AfdE7cm9fKknCmHh2SAiGaTnFD3fU9pSESzHoprwmiBa6260Vsbeqb9wG6IJXxqwgsN
	J/74SS3+69MYMZiKtWsZv3JSgqtzJWCCoqxCtf9bUa5/pWC6dUh716MjnIfWpLN6p6+ne8eG0B/
	JJ/fm8OVEv4ascMq2cpWmXOvtFYPyDszFmjNK1TlaFEcn2rKMCKqvwnxseaa559SU9gaWF9RzSY
	PRCrLHkX4K/X1IvdO7XAivO+5na5ybzvLc044wUStkDOWI6uLc5Dc0sIkjgANTAqKNlSnBgl4te
	OLDPohNdvvxxb+FCiMk18WZBUe9chCA=
X-Received: by 2002:a05:6214:6017:b0:8ff:496e:1071 with SMTP id
 6a1803df08f44-8ff496e1138mr111666556d6.1.1783681125576; Fri, 10 Jul 2026
 03:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <0101019f4b00d130-1a3cb0f6-fc04-4f3d-aac3-0da9b48db997-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019f4b00d130-1a3cb0f6-fc04-4f3d-aac3-0da9b48db997-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jul 2026 12:58:34 +0200
X-Gm-Features: AUfX_mxDYKtXgZNTQ4cPna-hQz72Wu1q_VtJRfpw9pKxIllOwAk-KyczjfFHqHI
Message-ID: <CANNYZj8uqVF53+FPP0yRYNuzYDmv4MOCrfdxBpO-9jFTnzLPfg@mail.gmail.com>
Subject: Deferred version updates (was [OE-core] [AUH] Upgrade status: 2026-07-10)
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 10:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240630

Hello all,

I thought I'd summarize updates which have been deferred, so you know
where help would be most appreciated.

On Fri, 10 Jul 2026 at 09:49, Auto Upgrade Helper via
lists.openembedded.org <auh=yoctoproject.org@lists.openembedded.org>
wrote:
>         systemd-boot, 261.1, last attempt 2026-06-27 05:09:47 result=failure; will retry in 18 day(s), Chen Qi <Qi.Chen@windriver.com>
>         systemd-boot-native, 261.1, last attempt 2026-06-27 05:09:47 result=failure; will retry in 18 day(s), Viswanath Kraleti <quic_vkraleti@quicinc.com>
>         systemd-systemctl-native, 261.1, last attempt 2026-06-27 05:09:47 result=failure; will retry in 18 day(s), Chen Qi <Qi.Chen@windriver.com>
>         systemd, 261.1, last attempt 2026-06-27 05:09:47 result=failure; will retry in 18 day(s), Chen Qi <Qi.Chen@windriver.com>

Daniel Turull proposed patches. They're held up by having resolve
Debian 11 fails caused by unsupported older glibc. There's a
disagreement over whether we put buildtools there, or try to patch the
fails. RHEL derivatives which are of similar age are not affected as
they are already using buildtools.

>         openssl, 4.0.1, last attempt 2026-06-11 08:18:59 result=failure; will retry in 2 day(s), Unassigned <unassigned@yoctoproject.org>

Current python (3.14) does not support this yet, upcoming 3.15 does,
and a backport won't happen until after 3.15 is out (which I find
odd). I guess we'll just wait until 3.15 lands in oe-core. For now
staying with LTS openssl 3.5 is fine.

>         nasm, 3.02, last attempt 2026-06-29 05:08:22 result=failure; will retry in 20 day(s), Richard Purdie <richard.purdie@linuxfoundation.org>

The rebase of debug-prefix-map patches isn't quite working, hopefully
Joshua will look into it (it has landed in master, but apparently
needs further work).

>         rpm, 6.0.1, last attempt 2026-06-11 10:36:55 result=failure; will retry in 2 day(s), Robert Yang <liezhi.yang@windriver.com>

Robert has put a lot of work into it and posted patches. They don't
quite produce a green build (but getting close). Unfortunately he will
not be able to do any further work to get it finished. We probably
should go straight to rpm 6.1 (which is as usual expected to go out
once Panu comes back from holiday).

>         gtk-doc, 1.36.1, last attempt 2026-06-11 11:42:57 result=failure; will retry in 2 day(s), Unassigned <unassigned@yoctoproject.org>

Ross needs to review my patch.

>         spirv-llvm-translator, 22.1.4, last attempt 2026-07-01 06:20:46 result=failure; will retry in 22 day(s), Khem Raj <raj.khem@gmail.com>

Needs a new release of vulkan, as it uses symbols from the
not-yet-released codebase. We take 'sdk' vulkan releases, as regular
releases are too frequent, and not always include all parts of vulkan.

>         libjitterentropy, 3.7.0, last attempt 2026-06-11 15:47:41 result=failure; will retry in 2 day(s), Ross Burton <ross.burton@arm.com>

Breaks current rng-tools, which in itself looks like an abandoned
project. I filed a ticket, there's no response, fixing is non-trivial.

Cheers,
Alex

