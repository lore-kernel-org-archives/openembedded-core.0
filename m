Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C006CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:59:39 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21625.1781101163014652716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fRwgeOIw;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: leoreis.costa@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7defee656dcso46488287b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101162; x=1781705962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL2BDF3HcI2eS9X5yPcKZBXVC0qFUJYD85+nM6VTewo=;
        b=fRwgeOIwP1gSsTwkdK4S8mLfZ4bW8JKIuFvrMe35ot/erYTTMaoUrcvkPr7v8NiNRT
         LyiI8E5bekhHXSnEcnAbbcjkL8b7Y20bVFr1gpMiP7aMeQlium8MecJAi8FMbl9+RF0T
         oTumDz53En7j4xJy6gdZ46yfMfimKINl1YjGl5y2EEdBR0K52kFMq7PygGrFUncXzb+q
         XlHK9WnQgMbm7os8OGx/7KRXRSftntzgwSn2LWB3Piyzfr2zGO+C4ULnqsdX4SpZMJTH
         xM2+lbuYF0pC0Cynbp4pXn060ArJRmoMw+kEutVK/kdOLK6HQwGHZB/l4Vx4cgCaltd8
         F1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101162; x=1781705962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FL2BDF3HcI2eS9X5yPcKZBXVC0qFUJYD85+nM6VTewo=;
        b=ovfisQpOWTomvGA/XpaRwD+ny2iHWfa0HxC14+i5DyDXD0AWJl8zd3iXtFDQcDMRBu
         BK7d6ckJVJcCn7fXZFYe8xqNh8U9eahrK1AMS7xxKzz//whVFYH6g3dXVFbQyCCv0Rog
         WmyEG6Hv6tqDAORuwu5tlYMoF2dnCRAIJ3WobD1ba2X8zFH634cXH26d47hGvySWbCEy
         OzspGJ6MIOWS07rvyrR2gEXxRm40K4+czrSUAeay0RGo90fd+xjK2j3Nok4q0wHimWDe
         gGlHQk4niNSTyPAJeNeaenBNpAZztLk4Yr8rjL6x6JQ19hNpAltB3/Va1ANFfBDF2mJ3
         ZOqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tceVsjwc8dFx3LPTX/fGkmiRWEXstyrIniOG8M4to00pPwZmxPdMfszkXeBhG26acxWZh4oVreZCve5MlFdKjxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAvSdi6BNmciP1mMol3kxELEnjHcsaHTW6Sde8vOzTzrJiax/C
	kJD06LaAPgVZeNKVF7MWSWP10iQlcQRFtBfMtEAZafUGzYEZnMztMZPWhqj74ZQG
X-Gm-Gg: Acq92OH0nvlFbspBSEUVvhGcYIvJTT51vI8fxyb4uouPjsjW3K05sdlCOTPk7Y5nxNA
	zdZtxESXFQ9pOz5sRC1VIM8dOs0gD93WVQg2IRZM6wKnEPmnKTLmPp6z4ttY3t8v8I9/w1liG1T
	WX2pa+A/FA6S2sSIvEDI1J5Jx74n9bcvYjC0yeV0LocRsyYzAfse6o80j9mXUWVMqoLAsw6h0VN
	NlEhUCsgD/l0m8N1ti1RzmQ0YYomSJiysjdF3EjxpWDf1eDF4gYjobVGo81SZzPRvaC3iSs6F/H
	a3fgR9hI/33KaTwFK9CzOS+ju4Izrhr63sZQ8LYTFZ+PmvqwizwRK3OT+KXBzNqFEekww91CXMu
	zml8+LjkwKRSjH4CWAcvUl2npqEwrrxIFDSco3vxYDnHogc4Ap9UPP+MfV7T7LpoStrvUMXCKWo
	+tCk1O0oN9yFBoky/IiVG35f+ghMi8Ujpv9V3Mv3RrxMGDbd1g/aTNxIZNvINvaDNWXHkTyATSX
	+j3ogk4F4X2d2ciyHtJ7MOjqFG8Rw==
X-Received: by 2002:a05:6a00:4304:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-842b0fef2a8mr25837201b3a.45.1781100700569;
        Wed, 10 Jun 2026 07:11:40 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282378986sm25615134b3a.22.2026.06.10.07.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:11:39 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: jpewhacker@gmail.com
Cc: leonardo.costa@toradex.com,
	leoreis.costa@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [OE-core] [RFC] Bootloader components missing from image SBOM
Date: Wed, 10 Jun 2026 11:11:07 -0300
Message-ID: <20260610141128.6606-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJdd5GaOu7+31fZnPODccwxdFqHAvEJ485RNruKcwQDSgmRr1w@mail.gmail.com>
References: <CAJdd5GaOu7+31fZnPODccwxdFqHAvEJ485RNruKcwQDSgmRr1w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238368

Hi Joshua,

Sorry for the delay.

> FYI, I started working on this in oe-contrib/jpew/spdx-deploy
> (https://git.openembedded.org/openembedded-core-contrib/log/?h=jpew/spdx-deploy)
> if you can try it out and make sure it will allow you to do what you
> want, I would appreciate it

I've done some tests, and it does solve these cases mostly. However, I got errors
in the case of Heteorenous Multi-Processing. Some packages are built for both
cores, and the build tries to generate two SBOMs with the same name.

For instance, on the Verdin AM62 the U-Boot recipe fails because U-Boot is built
for both the Cortex A53 and Cortex R5, and both SBOMs are named 
u-boot-toradex-deploy-sbom.spdx.json:

ERROR: mc:k3r5:u-boot-toradex-1_mainline-r0 do_create_deploy_sbom: Recipe u-boot-toradex is trying to install files into a shared area when those files already exist. The files and the manifests listing them are:
  build/deploy/images/verdin-am62/u-boot-toradex-deploy-sbom.spdx.json
    (not matched to any task)
Please adjust the recipes so only one recipe provides a given file.

This could be solved if each recipe could define a custom name for its deploy 
SBoM. Then the name could be altered for different cortexes in the same build
I made a small patch on top of your branch, adding a SPDX_DEPLOY_SBOM_NAME
variable that allows this (similar to the existing SPDX_RECIPE_SBOM_NAME),
I'll send it in reply to this email. Let me know what you think.

Kind regards,
Leonardo

