Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F78C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.15348.1634673275121758418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1cxdrkLO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id n11so14471813plf.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e3zNXdJxcUMbM3mGgNo9+FaMttX4u74UPVGQM3XtACA=;
        b=1cxdrkLOCpROIVTsTB7HntsM1aUJdP/1ODxpZMq7+eCr7sxhEStHC8rS190AAnvdqP
         8MzhBrv/Vb5Z5dQi8GaVxCkFTb6YTq97dGKVIuL3W/LZYHppc3UAQsD7zbymdFXc5z+y
         PYFC/xt3irmcAd61+IHzzAkbqNpmfWUzeJaJH88zZy72sMCh+LNRjZf0JKnPOhb0hiYo
         nwGar8xDwOqycGH4c88ZPlga3cpk2ZGnlLlbxYY+ZgdzoM6EFOeTb6IIZwUV0ATZf071
         UMCwCO/kVLmFlRQ4yEGf5Cj4nXwBp3ibHLrWylpLM2D6yC7vgXbmRXLvNcUFFj3yDKAy
         hQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3zNXdJxcUMbM3mGgNo9+FaMttX4u74UPVGQM3XtACA=;
        b=QNjIBhat+8qcnBoOioRD9SHcq6353OhA4m9eUlhsbPwZZjCAcpuVO4Wu9BX4DyuwTp
         HVcjX7nau2r9jfjJ2xAH3J0DMDTJtUygIP1DwczoRcZLm8IHxKZN/ckHmVKIYtbMvorT
         bJRcsdUkssoynXaK/rU8CXWmduXq0VY83QDTlYIiIHPDLNa3E6z8TZ58ovOmuweNoo95
         i7DHFuMFNeQjBuwY4gvU/r0mCOl7cjzIraDfTWTODCRtT9yoTvVLKOqmI7+oWkt/5d1S
         mym1UDrzDCQ1IfQaPHqK1H+AMYPjrY1ARqdi1hLWyG8ASQmbaVETnqB+Vk17hKBbTC7d
         S5VQ==
X-Gm-Message-State: AOAM530bMHRHrrin8mZe7aHoZBYEzOBdW0FzcDDFuQJ/uiuVpO0yGzWR
	vKcvFwIEWwnUsxVZ5+bVCU4KSWWdODTdAE9vga0=
X-Google-Smtp-Source: 
 ABdhPJztkHETvgmKjznmXlpO2Vf41XUwA0CznC+JaR2tSVyxtulpVMtsOUP8DbSgpJzV1DDd+0Q2TA==
X-Received: by 2002:a17:90b:120c:: with SMTP id
 gl12mr2136096pjb.50.1634673274266;
        Tue, 19 Oct 2021 12:54:34 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/38] rng-tools: add systemd-udev-settle wants to
 service
Date: Tue, 19 Oct 2021 09:53:23 -1000
Message-Id: 
 <006b5221ed6dac9964f49a03a55de2e847118dc1.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157217

From: Claudius Heine <ch@denx.de>

rngd needs to start after `systemd-udev-settle` in order for the kernel
modules of the random source hardware to be loaded before it is started.

However, since the `rngd.service` does not require or want
`systemd-udev-settle.service` it might not be scheduled for start and
the `After=systemd-udev-settle.service` there has no effect.

Adding `Wants=systemd-udev-settle.service` provides a weak requirement
to it, so that the `rngd` is started after it, if possible.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9715d4234eb7b45dee8b323799014646f0a1b07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index aaaaa29074..f296a99e1f 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
 Before=sysinit.target shutdown.target
+Wants=systemd-udev-settle.service
 Conflicts=shutdown.target
 
 [Service]
-- 
2.25.1


