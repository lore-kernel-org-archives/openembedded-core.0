Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82300C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.151542.1703864768618641491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aFCz674j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3ec3db764so19249045ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864768; x=1704469568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K4WVdQAlu4ZRuqCCQoZ7vo5oHs/DHnm4XpmhkZIF9c=;
        b=aFCz674jtP5Fke7qjDRxbgTbDrg5Z/Dn90oAYmf2wdTnr5iuv6V6Fi64vrtD1Ibxrr
         mtys7j1IaV+zUeMn0rTt2nWFZZaXBVvvtdrBUirqLg0q3HXgczZkhFPUWnZOi+DuId7j
         vHk29x8XKGF6QyXfQTbsfv7Z8Re68yGJ6DlpemD3TN78SI9c8Jm+jjbi+I3DN11b/N8h
         /FvZu6m4BVnTNrGtPUtGSkjTZROXmYO+dRYxmIA6ic6mFDtzg97E4JOgpQxOpPqLlnTT
         W/v755YTh+ixnJuJfruvQA6XvBuQmWfWFuEqeZ+cZ3wt4BSZlLA+rYwoyuPnERlAGRq6
         GmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864768; x=1704469568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K4WVdQAlu4ZRuqCCQoZ7vo5oHs/DHnm4XpmhkZIF9c=;
        b=LA9zORA+Fv8qXdV1da085g/v1foz+bnCsUAFuwUIVU9JB8Zzci8ADqKc04DO4HxhU6
         xzD47Pspkwrcs10cxB9Y354yqmWXg9PRQU7xuSR2Qi9KJVr6quGZ5VZyZ6vLqTv6zBuN
         24tN1frVtSIac2lqE3hr7t0JYjfwO7vim1U0fBV9DflFk0O2D5CgS0kGq78s3gds11vo
         UbkqAYJ7NdzAnyKTivy4LRkqtH4z3p94TiiNtDKiov2WhJ/jyXbQarXDqLhLtT9Q2o+a
         0EHRE3sMrVN4rNwERnZKlxD0KrJVYCSeGC/vZmXKW/u8mArzB9NwhbYCo8ak+CCp3FJ+
         /ubA==
X-Gm-Message-State: AOJu0YzPwOY2p+EWLr+a6Ax/aCn7q95/fAXdoiY2KeWwUpAcycUJiuu9
	6am5GDuVb9bbp2A5lBH/Z0mcJOQ6vfpa9J8tBAPpm/9TfJ13fg==
X-Google-Smtp-Source: AGHT+IG18u9qjjSp0G7DhhqIOQNbJDW9cke5wjqJOYgbpahaEtU8u8+isuuo1NTCfFPdrN+dVZ+JIg==
X-Received: by 2002:a17:903:32d1:b0:1d4:4f4e:e4a5 with SMTP id i17-20020a17090332d100b001d44f4ee4a5mr4675290plr.103.1703864767738;
        Fri, 29 Dec 2023 07:46:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 35/41] cups: Add root,sys,wheel to system groups
Date: Fri, 29 Dec 2023 05:44:49 -1000
Message-Id: <1cca30bb163fbc3f6b79fe3cff6d6b405830a63a.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193052

From: Markus Volk <f_l_k@t-online.de>

The Cups documentation states:
The default contains "admin", "lpadmin", "root", "sys" and/or "system".
https://www.cups.org/doc/man-cups-files.conf.html#:~:text=SystemGroup

Add root and sys accordingly
Also add wheel group. This is required for systems with polkit support in order to
control the printer settings with cups-pk-helper.
Not only for gnome-control-center, but also when using plain system-config-printer on
a system with running polkit, cups-pk-helper would be a required rdepend.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 572fed0ac6dbcf5749e19c7b624826fc30cf301e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fa32c38549..4c414b6549 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -55,7 +55,7 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
-               --with-system-groups=lpadmin \
+               --with-system-groups=lpadmin,root,sys,wheel \
                --with-cups-group=lp \
                --with-domainsocket=/run/cups/cups.sock \
                --with-pkgconfpath=${libdir}/pkgconfig \
-- 
2.34.1


