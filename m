Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A984CC5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 17:18:49 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21672.1785863924773412573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 10:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Blr5jfek;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f23e851626so313416d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785863924; cv=none;
        d=google.com; s=arc-20260327;
        b=qqiQSGOFk/V69h5TaG2mllWVY74X7qQcPPi9tcJrNAws/n5NQo0SjLKz/7AcAr17+Z
         qgZ1tpeqdwlu59dy3cjzmS1Wno/r6PyK2hxbNJ8fHNuSdgjGjMozwbhh/B0AP62/P5T1
         /0vmffE3oaClPTIhjA+UeshUccHJYyW5Nkmwq29cDr4/Z1D4i2aOygOL1KoOci7UFcku
         4Ao5NyBMUoW2B3+7v2d0VdycPf+Dvz9Q0j7F8r6dqofbv8F068zwuyaKOjD6P/89wdk0
         u0gLrxT88j9c5RWHQEK+7kQw1PnSwYKACW37PWvPyUrPhrdkHLFfQ8LkAZjvwSdbsvgV
         V5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkgeXH43POmjHu1kmEhgno/AWDXZ7fxwey/CSIp4Ptg=;
        fh=C4ktaacVQu8idYct1+mCFSprzSve79apUqXfoLhYxUI=;
        b=TN+0ToRyt4bVMrcLyVF6/UZ1mrXvXMKWqZp2evg1h7gvSdENs2KCzruO8U/FokelGu
         W9tDsaL+u1g4WHC1awf87jKNyA4VBxhNCYiChti4ADf57J4roTsE3mX/UACkOHOpx6Zg
         x85Djrj28hPlU5DX10jBirhc5GUYx/mprG9RS0wJLFWJ0w/7zbk6tK3Zlclh5wY5voIM
         wu7oKYEazjBhlB3ymQr39Sm5wXhvIu6Uq2Jm24gWKvuLc+wtW0mn6iTDgI5E6j6+2oFI
         /6q24MsTJJSoDvREz4WdyXaV+ZH/pwsqgRQ+CdPygwEOxTg22EJdZUbkfY4VGtNJ5bq8
         hGlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863924; x=1786468724; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkgeXH43POmjHu1kmEhgno/AWDXZ7fxwey/CSIp4Ptg=;
        b=Blr5jfekzrgnQugnGAMisS5VwXHAnT+YNjbMaa+nOnukSgMGnUXcsefVIvamSiOu/9
         G3C2dqLTBF+4qhtk312vyaELzHTgBpl/KURsQU5+pyho4kLGm8G32smPKFJfcOffRTAt
         8xdCItUBuDU6hP0ZoLcxxkOs2RqTznoiV3qmb4K77slO/qY8hVh+f6F2OvdDj0GjzlgZ
         A6iBpHoBDRT72vQpPngVP+m0mRcPnbu4OIFVFtxDsWoOQqXZaWKhGNisw37/6eAf0eNd
         yThcgi1TRZTw+l6mvPlq/6NiqoykkM0bpkWJWNHbOO36vyCRr/LxRm3zAggusFZ7EjOQ
         5LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863924; x=1786468724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkgeXH43POmjHu1kmEhgno/AWDXZ7fxwey/CSIp4Ptg=;
        b=WX2X5k1Ywz+N0ziRr/rKEkc0T3351MQjca6OdIWhWynpFBv7ur4lFv4W8KLdyNJ9I+
         NaMRj+vRU9T0GVapW+6D41/Abz2c3XoZ9sqW273jOUs8ZPYXx00EriYQ3L75dlBaSkme
         IvP0VK5Rgh5Pnz7v6HWCGDEjpCM6uUcb4TJeUM1quzBIZu3Ce8t0o2E3eZF+p9hL+0uz
         5wM7vhxu7ThRmgNlyCy1qSG5iEm/bIU3c873N0ARyCG0apbY7EigA4mA3uFpbFQ0xW4c
         /HCm5C6qFzMPcIvB9silUX+SxTOnQYURRgYVFu+uyOGRXNn9JO635L4MGen0HKh1TCd5
         LDAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/go49Vq/mbuxXqqjsWPF7pQgCFiqoBW8z49QMkV1P8k2+1FbumATXZtJKNgPhQ6IKQfVYAhIuWx+UkqbLwevgqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzs4t/6fUmygEpE8FHFdRiFQqs3CQBCeJch0PnQopq3F1douKlC
	jSRp6S9LrwfVJkp81uI2+6tMfeiJaHuTrZ28CG0OA1qSECjq6HD0xyd7ViFwVglWeV8DPg4yAJ/
	HqSI4dH6HHcnKq6fCUo4WqMVtppczjCI=
X-Gm-Gg: AR+sD10mw/ZrtVgSZPYj5ODdZztKxpeqmqSOqCUJ1PN1kRT25/8yU4JdCU6SOQj7X90
	YhhW/DI5mkmTeZ/x3mBtt3R8QNG+RodZstvnp2G6a6M6j6TMm+yjo/xpwNYKmkTJ5fQV3X65yuX
	L5pnyO75Q40Aa2sfsIJFMAwNyiReEOY9SoeKiQwKFWWgU7BjQzqhpdAfX6vhP/wjYHp3tGdYo8H
	iCV+EhbS0axlMcw0h1Zgi1i+99YX936keBnM3pRy+GR+SkCWErkempo6WiYwQX48zm0BaWo8QE9
	dvpzCmPuHSZhpbcxvYmdA29MZ1ZeW49kZYty/l0LscsW/nITP0A2C3Oj5LSJvGy39xn1DwJuhNu
	HmMs=
X-Received: by 2002:ad4:574c:0:b0:8cc:15e4:1208 with SMTP id
 6a1803df08f44-90881394922mr7524126d6.32.1785863923587; Tue, 04 Aug 2026
 10:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com> <DKG838IZIDKF.1IBQ7TAPXMF9E@bootlin.com>
In-Reply-To: <DKG838IZIDKF.1IBQ7TAPXMF9E@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Aug 2026 19:18:32 +0200
X-Gm-Features: AUfX_mw6eEqKswWNIyp-eJdhkIrQqKOLIMkDgqhThPOdMz6YTlblLRY1scZb2tY
Message-ID: <CANNYZj8x654JdZRXfoiceNMGaNM4=fjcf+9k44mLdvzW3nhNoQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] rpm: 4.20.1 -> 6.0.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Sumanth Gavini <sumanth.gavini@windriver.com>, openembedded-core@lists.openembedded.org, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 17:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242794

On Tue, 4 Aug 2026 at 16:18, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>  Problem 2: conflicting requests
>   - nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev-0.1.24-r0.core2_64 from oe-repo

I looked into this a bit. First of all, this is easily reproducible
locally. Set up qemux86-64 poky, run 'bitbake core-image-sato-sdk' and
it will trigger.

Second, some observations:

1. Looking at tmp/work/x86-64-v3-poky-linux/libcomps/0.1.24/temp/log.do_package_write_rpm
I see:

Processing files: libcomps-dev-0.1.24-r0.x86_64_v3
...
Requires: pkgconfig(expat) pkgconfig(libxml-2.0)

So why does libcomps-dev rpm require both of these, but only
libxml-2.0 is mentioned in the error?

2. Let's first look at
tmp/work/x86-64-v3-poky-linux/expat/2.8.2/temp/log.do_package_write_rpm

Processing files: libexpat-dev-2.8.2-r0.x86_64_v3
...
Provides: expat-dev = 2.8.2 libexpat-dev = 2.8.2-r0
libexpat-dev(x86-64) = 2.8.2-r0 pkgconfig(expat) = 2.8.2

3. Then let's look at
tmp/work/x86-64-v3-poky-linux/libxml2/2.15.3/temp/log.do_package_write_rpm

Processing files: libxml2-dev-2.15.3-r0.x86_64_v3
...
Provides: libxml2-dev = 2.15.3-r0 libxml2-dev(x86-64) = 2.15.3-r0

4. So it seems that for expat rpm does write the needed pkgconfig()
provides entry, and for libxml2 it does not. Both recipes however do
install and package those files into their respective -dev packages:

$ find tmp/work/x86-64-v3-poky-linux/expat/2.8.2/packages-split/ |grep pc
tmp/work/x86-64-v3-poky-linux/expat/2.8.2/packages-split/expat-dev/usr/lib/pkgconfig/expat.pc
$ find tmp/work/x86-64-v3-poky-linux/libxml2/2.15.3/packages-split/ |grep \\.pc
tmp/work/x86-64-v3-poky-linux/libxml2/2.15.3/packages-split/libxml2-dev/usr/lib/pkgconfig/libxml-2.0.pc

5. So the next question is why is rpm picking up one as a provides
entry, but not the other. This is where I stopped, but I hope you
Sumanth can take it from here.

Cheers,
Alex

