Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525A4CA6007
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48817.1791301587455893602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B2oS5mqf;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1592843f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301586; x=1791906386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=01QW0eGY8+ojjLI/rRZ3JGFPuWAzICGNUXUJ3WC605s=;
        b=B2oS5mqfnMNBS3LqcRM/8cghW0JRRrJN1t6zto0wrx/b3inXMv77uJIkVt2IQBCvCy
         vgCKXTEOu6BWG9OPrtK6zP6C/yyDKC2O3i+ey117S0iV1dvr2jbVk7y5fatZlZF8rYQm
         ArF9ZNr11hhn/NtjrCyLWeaIc+bG3ATjlpDOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301586; x=1791906386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=01QW0eGY8+ojjLI/rRZ3JGFPuWAzICGNUXUJ3WC605s=;
        b=2sYMWovIDfQsDZyqkBzYKMqS57fOM+fkw+ZVgWqSZSwt/NMuMMR3/i7eq/GhqYfZ7M
         FxxIkOIIn1lSWjuVSkipSK/r4gFb0ybPs5n+nAZZj6bRozcAilbjISg3zQt9dKmaPDqf
         B9pYSEQMexjjKhxy2NkY+DNUc28QpZ13By5IXYHRzLVHILjbg4twwe9iid/xyNBZcQVS
         Z3gXUDZJJtI8DD7DCjcmPkZnDSQGX1AHt+enApn8VVNoC4qmCUr8sNLe01eAG4jts5QU
         T/y/++RQwXAjrgY+osTRDUQsRVWpxvMtuzGrXuhWmX8kvoUeO8l2nb7J+JJxvEmwGHSs
         QytQ==
X-Gm-Message-State: AFq9FYJydTNldw+SkNnlwTMenU7YMFAPJyBdsGkYZNcuZbPMDcfXcu58
	Pe/modqCcK3QvPJm6/FnLKcnYNEsbjZPiB5/J5+2ytywRnx9fgEig9w5+h2DvmphGhNHSTRe/1z
	q2NOY0aA=
X-Gm-Gg: AYBFou2n8wfjwIdd/UW5rZ/RYVNDt8Fe4EMvflrH2XMtcqQ6kjjeaLHPmGZml+GzgM5
	6a+0affHp4V7yRk/WDsVS22/SjgKgSIhkNUmpS8SOoaTyDBwryoO9Ym0UJqhreUkPS3lFC9PfZr
	XkdKYxSCuLSSIKt2GxPbxoM/2NrPisJ+EmY2C1g3UhdVQK1jheT5XzLPoA2rS4pT6/RXGgsTSke
	8cV668/0/6fIfhgAcIodrbyPISFJrW7xrKcs40opHEJ1AqtTmxzOp3zSplGaWm2CmVElwGrZAK7
	LEZzNQ5aRRr12IzeD7mj1Si0cOGWW3MSXllH2I34CWe9HRI3lrSYQy6yKF8nkSg5yZAfbaCwbCk
	EOYckFwohEFoQXA/plNF8xCLaZzx+3+bz4NwNIJHdBXM8y97ns0HJc1JiBWOhv0F1zv3wpfF88K
	yPx+ZYwfyXJfuWidoly8/QJlM2TERjpfD5Cry+3LUByOrxWj6WGdE+7ks8qW9vIeT05/TCfg1aR
	N9nk/OlY/pWq0TMmXVvg9i+sRK1kw+ANnIGZLIdFbuZut/00G61JbJyxpHWIFU0b845RMhWTKQm
	+y+obQ==
X-Received: by 2002:a05:6000:4b13:b0:487:2387:7c9 with SMTP id ffacd0b85a97d-48c47fe7582mr18750842f8f.14.1791301585655;
        Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 04/19] tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF
Date: Tue,  6 Oct 2026 17:45:50 +0200
Message-ID: <c7176cfee9859ced362f8efea0eff6d830b0b5d5.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247293

From: Joerg Vehlow <joerg.vehlow@emlix.com>

Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new override
for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to be ignored.
Furthermore, setting --without-headers here is not required,
because it is set in gcc-cross.inc.

Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 020d5f018616bc48eae3a23d5498dec3c78a1386)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index abea5a71629..6043cb6654e 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -18,7 +18,6 @@ USE_NLS ?= "no"
 IMAGE_LINGUAS = ""
 LIBC_DEPENDENCIES = ""
 
-EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
 DEPENDS:remove:pn-meta-toolchain = "virtual/libc virtual/compilerlibs"
 
 # certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs

