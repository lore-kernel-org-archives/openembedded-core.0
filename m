Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67A5C64EC7
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3137.1675840910086201632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e+AnjtC/;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso741911wms.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmfSi9XPXe6qE945eio9K2KJDOidDd2wUAEG2Ov/9cM=;
        b=e+AnjtC/cfPf8uyFxWYv09Cd6Pl0dbOYAEdu1AcIMtobR0Ya2YZ3nj72vwg08jPHrq
         OENkjFT4WkJNo3q+mXelG2YBYE4MRd/ecbzeHa6A7aCj/UiGbicZdFxk+3rhHKxc+uOw
         qk/RXB5dL7NTo1ywKkDS+fRtVTeEEpnbsywbE1wzW9fmwRm0u2xwQAt2IjbODZiEzmAU
         nzRlsEfEfxRY+m3z5tWp1qMkVhKvnBHTN6GmRtgRwv3OFdc7uPkXZ3O6J9cHdCfXE5xD
         PUk11OgkghoPvIMlnIGiqhWP9D0vQzEG5S7oASdqnm1695HLyyze0pdBoc3P9XKLvLIu
         VXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmfSi9XPXe6qE945eio9K2KJDOidDd2wUAEG2Ov/9cM=;
        b=3ffc19TEtw1So8CgwyzKfuo57cSB/dy3LbrqVmzAizczf+1c70yMACCYbcuCv03600
         iTAmlkWmrO3wioGjsNpf7g+UexVeAnBRxpUAZED+j2SYR76zwMDmHwuewXSXtAVuBiuJ
         iUgAYv2n+7ClD8LOp+p/b6Wwrk7Y5iBBshmros1mKMDrM/pssTxpv6nF+WPzRAcR0F2t
         y9RCABq9QRNSLDVVkoPfj7klHQWtKJNsLQFKbPT2S3mOaw6ilu3+cyfGljI60hwWOMQt
         IOh1O0uAW7dAnfiRyDGKagohRbCRnAjZc0NJLSdIof+9A8jGN/8eRKo2rUanpi0GskQ/
         tN7Q==
X-Gm-Message-State: AO0yUKWa3KrwKGTGsBoQG7JY4pXR7JzTkMfVpAdI6v3uIPQppoyoEZtD
	CY0We7AngW07OtfqP/AWZR3pgZfVbl8=
X-Google-Smtp-Source: AK7set9dU/EQd8g4yvaW6gXE1pIO0vSVgqeysXGZ5QHchVCrW/+FC1aaxrh2zSIGxoLRDVmEkCgA6Q==
X-Received: by 2002:a05:600c:2e83:b0:3e1:787:d70f with SMTP id p3-20020a05600c2e8300b003e10787d70fmr800703wmn.32.1675840928449;
        Tue, 07 Feb 2023 23:22:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/52] ell: upgrade 0.55 -> 0.56
Date: Wed,  8 Feb 2023 08:21:27 +0100
Message-Id: <20230208072143.2930292-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176876

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ell/{ell_0.55.bb => ell_0.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.55.bb => ell_0.56.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.55.bb b/meta/recipes-core/ell/ell_0.56.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.55.bb
rename to meta/recipes-core/ell/ell_0.56.bb
index 7184701e4e..0ace622835 100644
--- a/meta/recipes-core/ell/ell_0.55.bb
+++ b/meta/recipes-core/ell/ell_0.56.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a7e1fd3e13d9083f80eb9787546add49fba5c3d9e9f166b06e2ff9fd8030dc6d"
+SRC_URI[sha256sum] = "58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.30.2


