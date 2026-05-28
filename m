Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DC4CD6E45
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 18:25:54 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17620.1779992748526749481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Lk/eH1py;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso7610846d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779992747; cv=none;
        d=google.com; s=arc-20240605;
        b=S4836tNnp22oxL+8hWekOMdz/1cYkW2ZxRmVOhcBACp4Oa1hfINoVua3voyMnHePMj
         6Vh0oukix5JbBitWP9bGh0xugEmBhz2VYRwFwAT22+E5EzntIQ8HtgJxVFWOj2qBfjfy
         irsdE+1un5jUGYcgD/GqCMla6L3KHM4yrd6svYXYvVyckmrUf6ZrromQtPyTiX7A7vUt
         dsWJEp/F5XUautWLbzjXOR6XfvtXMQvz1ulbfdii4RkuCMIeNfzOb1GYq+BXSTyNxcoa
         g8ns6T6yZaiRbHxy3WYuC3YtCYs78JngtbvlQNnXTXMHvb4RldklW7CwNnxVOY56nFnr
         OQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kfkrSq7aCF/WyGP4kTfambKqjR160006jStjJvrsdVY=;
        fh=mknMAB465/bsbMm77BFD2bx8Fk8ciagIJ0ZJVcHYAd4=;
        b=Chy6nR3hPRlFeNQMVX1akZzp20O/F1yelLykKwEMPHc27wdT/9ELfqpaerIw8jS/KF
         JVYAEKWMRXRqAYPAbaMh1l9x0XLDeI1idWcAP+UOIWJEj8CbnyWSux7yWm+tRh7aSIRz
         Dk9tbZAfJro5IiLxIVaduVZfa4tDJs5gc6xqpo8wjiiDmuCS7WTjELLTidX7y3xLYKLC
         8urfC62V+E08aYUnuhNwmJ+lrRnc1UYccMBL2Bwrxn+VOwNj141X4QH4yWz20t+Ysfcg
         NjAcKTZeYyPtqSD+WgH9qFX6v9DlkKi1g2NAcFFZODaqUL91HX5unXgix4irhEyg9DCG
         dIJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779992747; x=1780597547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kfkrSq7aCF/WyGP4kTfambKqjR160006jStjJvrsdVY=;
        b=Lk/eH1pyVsP6ATv09FG8BFgnuHoskdabYJhlvTk5HBR+6hnkuWF8Us5qtsdnWNC4Hl
         kxL90M5WFgkGUgtbLtt+y3LxrYVjOQ4qz4Xlj6acaadHkKZcXCwmrHMTpk71hArFONnv
         haQTuMrKtRD7H91yXSOxxA+Ae+JVzas+CQRUelX2dgW7r3GOxkRUG3AcsBKHu6cMGF72
         XhlrsRxc8tmRIY1VLGUlBd7U758ebvxRGzK0JtmLD+u1tJeN1ID7KtEoWRYcbXcfwCz2
         RMTTbw7FGWkq3+utsDuAHC6bVwUK3cMqGCdOx03tahnvpZAfMdC2Wx2Ijpn732yBhXnC
         8/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779992747; x=1780597547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfkrSq7aCF/WyGP4kTfambKqjR160006jStjJvrsdVY=;
        b=q7SRafcEHgzDLWaE5VlHId+f4WFL4DZwXvEse9WEPUsXl4g5r7u5n2JE28/hrrgSM3
         Z8Y7QG/OHLqGo2I5Amvg4/6XyEUTvlvowbr4//YfKfoD0bYjNMngdq2Dx1yMNaDvVhyw
         cWwI77jFX2TGlJunD7/QfPF2GktyiUZBPWbShA2U0YKs6TaDDrvLtT+yjZY0n/6BDx9e
         JdGCPLkO06mX/KwQrTAKKlv52VAzlJds70X3HNFfhbVFwnsWctVJiGedCoTLXTGgWfj5
         9z4iYFv4wNQBkxeA22rE3srOOM/wj1+aC0lti8Xc8g6velHNGZ1pxPnY3KItfHEa1kaM
         GaxA==
X-Gm-Message-State: AOJu0YzKoc5SqJo7DCXDax2FAtv9Z7Fuwl0pH8Ofm3L1NWcY8PNOnc55
	SUqfaRkPUg3iQREIb+QxJNrXtbImmkf/ul/vo/oeD0BUjcOItUl8mFMKYnL/4h6R/nS216heuNH
	X94dVelXfnJwobqmOzCNZFkeuBX9dKeE=
X-Gm-Gg: Acq92OGHelV8neI8OcYdojg7eAQc8F5qkjlwxy5mMxEq1mpf0Pyyy3nN7KHJp+h8jLr
	rCJ0qKi03fSjGpqiq9X2hv1XdPFndEaXijOaI9qqP5dvp1qF7zAO0G0nE0diUlEQ0QHpzzrpGvQ
	VkK+dOOvmNd9Mby8ROJcfl3ANC0yKF2jtVIhu1bGQwcrz4ZWFUEd+MxdTtSOD41kaBHsCVXy0od
	p1UURiU8PvWYY4F+6APFdBkRYM0rS2TK7zTKXMCYS6kM/ewlKgeqWcjltSYoQIMXttcOP8UXcIc
	8al+mkgFc8gsZwKu9jiVc1yjY5AKkyY6bnSUGYcOcl5XAhtZgTdJ
X-Received: by 2002:a05:6214:3d97:b0:8bb:2e70:7a2b with SMTP id
 6a1803df08f44-8cce20cd2bemr6034376d6.15.1779992747507; Thu, 28 May 2026
 11:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260528174515.1274649-1-adityags2004@gmail.com>
In-Reply-To: <20260528174515.1274649-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 May 2026 20:25:35 +0200
X-Gm-Features: AVHnY4KVRR8O7UMiz_if6FId3Y_dOi9YTCN-8V5ZCFM1gl26tfMtDijtfIbGWw4
Message-ID: <CANNYZj9sQ7vmZorrSvHGjr1iqzNKEdTwvuVSdH6PCuJDssD8Og@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Aditya GS <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 18:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237721

On Thu, 28 May 2026 at 19:45, Aditya GS <adityags2004@gmail.com> wrote:
>
> Backport upstream fix to improve stability of randtest.sh by
> retrying when sigma is too small, avoiding intermittent failures.
>
> Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]

Upstream-Status should only be in the patch file itself, not in the
commit message for oe-core.

Instead, provide a reference to the yocto bugzilla, so that the
reviewers know which bug this is fixing. A http link or [YOCTO
#nnnnnn] tag.

> +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]

It's better to link to the web interface:

Upstream-Status: Backport
[https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a9834a1c24915acd]

The reason is that sometimes a patch submission is labeled as
Backport, but actually isn't (not here, of course). It's best to make
that easy to verify, with a link like above.

> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
>             "
> +SRC_URI += "file://randtest-fix.patch"

You can simply change the main SRC_URI assignment and add the patch
there, instead of making a new statement with +=.

Other than this, looks good. Thanks for taking time to develop a
proper fix, and getting upstream to accept it. It's much better to
solve the issue properly, than simply skip the flaky tests.

Alex

