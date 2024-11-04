Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835D0D132DE
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:11:03 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.59900.1730733057788697819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 07:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wdJDR7xa;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e690479cso4424070e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730733056; x=1731337856; darn=lists.openembedded.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tqg7TnaGxH9badRGvMZeG37PiGTKgILl4zQiaFatTjA=;
        b=wdJDR7xaI4iiDSRFSDLhufENn26U20hhw52+EKpkHyDGNGcpf2nd5QMpqSJ2bTUS7J
         Oy8z6QNVeNp8KTqZnNnqyFEsPIxJ2FBsnsWJSNRUymZHdWHXPl3poevg2mJECe+VKKqV
         H3mVUpJ0+TQ7CvpzFkohkVmeI8ocM5hxhrDaNLwnd2tZX2tYD70+rXv2kJN1E8mNz1ac
         vgc0eWmgZ/ekTYWgiYZr95xqfb6zumv+OzwPsy/n2e2BSYoyItf5AIym7751i6kaoUR0
         sDu0duViF9L78yf0vZUYnu8WH24shQl72cVUiFLXDjE90M31GbMkNwD65cRhxOWTcluL
         t/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733056; x=1731337856;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqg7TnaGxH9badRGvMZeG37PiGTKgILl4zQiaFatTjA=;
        b=u6EPP9ngpgN4aukVz5DTbFeZdxBrpFaijtmc82mMGlBrKt9MUmWK8E7RPecQ+4hgsw
         aoq3ck1SetkG+0C3ZcCQz0RG+5WS/oNeizoyoyF1A/oI4gYx2buE9QNIKRtYTp83LT/w
         QJZs6ZwzN1stQpUfdquq71/kGd9o96XrlQ5doJg29PL34sweBN9INGJjVxk3nsF+AzRq
         LzsnynEe69i2o00nWM0/6vdPB95WH4xey9R29ZGq/4L+c85jV+S/GhQbJPJSO4VuV2DO
         RtXYypnb8eKMiCKRioz9iEhSGiQnJHAtoeEUbLzvbZxbK5vxaU0L4z9rOerEozhcHFCt
         dQeg==
X-Gm-Message-State: AOJu0Yy6F5hbVcTMC0g7aTdv9uBXUGMYwNd970Voe10zua8BubCieX8R
	TByYA+V0SQrJaOuR4M06uE+Bc5hKbLnavtgUvyqf3Baflsm8uUme/xiBnAJ26Yo/nWaLjAcEkeN
	gVyo=
X-Google-Smtp-Source: AGHT+IG7OJu2GG2AwchrAfObEk9sNRWrWtEdoFPfWwXLZSnMGVaHbwIcxQrPk5QfKuQwrnfU1T8gpA==
X-Received: by 2002:a05:6512:1089:b0:539:959e:f0e8 with SMTP id 2adb3069b0e04-53d65de8ba0mr5677168e87.21.1730733055569;
        Mon, 04 Nov 2024 07:10:55 -0800 (PST)
Received: from nuoska (82-68-34-100.dsl.in-addr.zen.co.uk. [82.68.34.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e848csm189143135e9.3.2024.11.04.07.10.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:10:53 -0800 (PST)
Date: Mon, 4 Nov 2024 17:10:51 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: wic builds an empty rootfs on second image build with rm_work enabled
Message-ID: <Zyjj-0oflBsZfj1C@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 15:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206689

Hi,

After image build completes, rootfs directory is wiped by rm_work_rootfs.

If the image recipe is built again without clean, for example when
TESTIMAGE_AUTO is enabled to run tests, then rootfs task will not
run and thus wic uses an empty rootfs directory to populate the rootfs which
of course then fails at runtime.

How to fix this?

I know RP doesn't like rm_work, but I really need it. I can't leave all
builds laying around and bitbake IPC setup fails if a lot of IO is wiping
build/tpm's while recipe parsing is happening (the famous 30 second timeout).

wic image related tasks could possible depend on do_rootfs instead of
do_image_complete but seems to break the whole do_image_complete design.

Should rm_work_rootfs be moved from after do_image_complete to after do_image_wic
if wic images are used?

Or should users just remember to "bitbake -c clean image && bitbake image" if things
fail?

There are some other issues with testimage.bbclass and leaking cooker processes
which confused me for a long time but I'll try to send patches for those.

Cheers,

-Mikko

