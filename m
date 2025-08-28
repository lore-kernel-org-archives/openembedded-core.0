Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A33CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:51:55 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.20242.1756385506940475106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCzW33cR;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e8704cdc76so92696685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756385506; x=1756990306; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rrv8Y1xJyfOf0DITSmwXFRXYHb6pSAiH4/zwhKtjZXM=;
        b=bCzW33cRA0ayZGhQ4xzJdiaGKe0u7mxHTa0u0nsp3Med2Bv5qX24mfXf8VWXRSUl9j
         FlXBydTxcsFV0/+sM7/q8i1x6G1zjxUJTzlaVkh+Ea3agrxRgTcJVArjk7ZBhI0BKq+H
         9jmqAYJXL1IAZ7U+7NMgkCUfVqgVaDq9Sgh9cxbBkGrLdrkNo7cMcuStzKQZx4joYvfI
         qErYnaJVz6aqVsO7p4RWl/e8BcdLlGIOva99hghj7s+7HmNvlhPbrSFLtyoctF+JaMao
         L9scCU+UcB8AdzNozi8pHppGApa+5dp7gMCa9VXDHnQ97she2CZ4J/cl5kOpg/xM6zSY
         ALkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385506; x=1756990306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rrv8Y1xJyfOf0DITSmwXFRXYHb6pSAiH4/zwhKtjZXM=;
        b=cDt0ONTJhkkvciqVmWMOFvJkqjlNrz6fC1sqwPXj+7dFD6KVGAvbIDqT1O5fB02bzS
         CZjJj7ViwIBzgogz3pXRnUGizi6S2E+poobHk6qKYmtKFAopa5QNUsgG83E2vY9vLYeG
         x3dVF4RWpIjGGil1WWJ4TDPC+CYel563N/vQ8mMWn18YKbPeHaF61w35xBDnPL+WsScw
         O3dkJAupMhkgkDbAtaE3GbV0PnWJ/fAjsrHBahUbVVOzWxvQdim0RS4Frgq7oXYQo3TO
         SL/Ohunr/8dr3xptUONADikT3vLEBkbpdnQkmRRjliSSNfQjx/+6M0t5VVDNzGTW9XSZ
         10Og==
X-Gm-Message-State: AOJu0YxYOY75b/6/QlLaZ7UtuvVqU6KVqKB2Y2pItbN39c0YncgaLoaA
	+p0nhavGwDB6JGYpuCwhikGKE0ZTEOQQQ2joTFIgUrj0Av44BeIrFTuvRYbaGrCibyPkYQwTkh1
	5hydHqP3VOlp8pxsKo3S6+J1WuLvDsMw=
X-Gm-Gg: ASbGncsnQkBbeVBn0Wu0PDxDDddgSsK54Yk52CZDAjwwShQVqCAjdgix+Sfl66Tsgj5
	+0qkCjxVmyCCHg0ZxCcTnCIVP8FYVTmss3n8N6oNAml4HIAKgiISyGqOQbStwURBtYYQhO/oRkX
	H5C78kOzLL99t50ka6Bsgzs4E1UEqRQZJ473d38iPGZofFT9tOvkQLfrrmaB1brxFv2UHrbhNE0
	aAwccPV9l4L9ZeG
X-Google-Smtp-Source: AGHT+IHJKApe1eIL+KqAqGSNJpX2hSwuh/SQRUdosk9yDTfI39EQHhxskl3FmWSBwaNMR229H+r8ViZNEiXMJt3v0h0=
X-Received: by 2002:a05:620a:2890:b0:7e8:147a:73c5 with SMTP id
 af79cd13be357-7ea10f538c5mr2739085685a.3.1756385505845; Thu, 28 Aug 2025
 05:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com>
In-Reply-To: <20250827222051.367093-1-a-christidis@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 14:51:34 +0200
X-Gm-Features: Ac12FXw5FdUq6OGoTRXRsZFxPBDJ9hl4BSyUpcgjcub3O18IBWT4uWDAk818bH0
Message-ID: <CANNYZj9E1JB2tdWMUL_fz_rjyACSyw9pDAsJDQH4eJtEUC3c5Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest support
To: a-christidis@ti.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222572

On Thu, 28 Aug 2025 at 00:21, Antonios Christidis via
lists.openembedded.org <a-christidis=ti.com@lists.openembedded.org>
wrote:
> +test_array=("testdraw2" "testgeometry" "testsprite2" "testgles2" "testoffscreen")
> +
> +test_path="/usr/bin/sdl2_tests/"

I know this somewhat contradicts what I said before, but now I think
we should just keep this simple and install these under
/usr/lib/libsdl2/ptest/tests, and package them in $PN-ptest. Putting
something executable in a sub-directory under /usr/bin is very
non-standard.

Also run-ptest should not hardcode the list of tests, and just run
everything in a directory.

> @@ -48,6 +50,7 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
>                   -DSDL_X11_XRANDR=OFF \
>                   -DSDL_X11_XSCRNSAVER=OFF \
>                   -DSDL_X11_XSHAPE=OFF \
> +                -DSDL_TESTS=ON \

This should stay as PACKAGECONFIG, and be enabled subject to ptest in
DISTRO_FEATURES.

Alex

