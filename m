Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4535FC64EC6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3125.1675840909917555521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lq0Ah8Lm;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso717636wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbjZ86GzyOw0pWEnYO0D9KGEmLkfZZVbqOgFRaW3SMM=;
        b=Lq0Ah8Lmv6G2yx7oZ3nb5IRWEJMe4/hiMRmmPPNctj+2XYc66TdmmZ3gxo9eJBAvEF
         4NOkiyuTonJpr4Aa6UNvXNiVDmbRY9Jp6qfU6dz/s6YZgHKBq5D1Y/dl0FLyAzPdpMl2
         n/6LP4ZuRrm6mcWUguAaJhRuTi0lc3oP8ksQj+dXav2WYE/37eaz1nOd+LtM+gk0/PcD
         bhgEqrUzax2xHajicWKGN8xbX1RJXx2S55IfCvaNn9hEZt4jV5Kt0Ell5lCl78Y848Id
         88n4nRT5JA8TC0LBplt/PiuE7waox1j3TpmtBkuLj4wG8lWquJrxNxIbz4uwZYZxQp7C
         b+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbjZ86GzyOw0pWEnYO0D9KGEmLkfZZVbqOgFRaW3SMM=;
        b=KhJojqE5fer+Xc7RFGyTmXMtDgSqNefg9yFQtPMSVlhZFdP7TGb1TQ1aDKow+gOCSY
         OgPJuPXTBSav9FBzuHKTJROUNLZw8Ei4jxyJJL4pR5DWCVMP0P1UUwM/CwqsDbKL2PUD
         I3vn2kVmVsFR4rkHAVqMLi1F9QvNvgh40aKzah+a0HdGOVhIgoEhX0fc/sQdPBtkMwTc
         HgE7FMkmiiyEJ+KTmHSFxNLkYHinBXLmm+CAPwjYSjxy79mC/DcFgphWxnYzVy/4CqIm
         g0FiVFFsn1funN6s3rorZdKfHPgMrZzupNyeqAYp7ZuReNpnHWCScKHQ+NFwUQ2oZpU+
         ryBA==
X-Gm-Message-State: AO0yUKW2lApr6HQPs4mk2Tsdwwo3camDLIm5nIzonZG/m9AO/q+4Z2J3
	EbprmlLmwU4WJ45oYtv2j+J2jDeyouo=
X-Google-Smtp-Source: AK7set/c+nUmBqp+MF8k0abWI+ZP2Xl5Ocs6nq6Varh8mEalO8Ky6pFAlncwj7to/3G+84NXIczI9g==
X-Received: by 2002:a05:600c:708:b0:3df:ad32:e5d7 with SMTP id i8-20020a05600c070800b003dfad32e5d7mr5683480wmn.20.1675840935434;
        Tue, 07 Feb 2023 23:22:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/52] diffoscope: upgrade 230 -> 234
Date: Wed,  8 Feb 2023 08:21:39 +0100
Message-Id: <20230208072143.2930292-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176888

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_230.bb => diffoscope_234.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_230.bb => diffoscope_234.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_230.bb b/meta/recipes-support/diffoscope/diffoscope_234.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_230.bb
rename to meta/recipes-support/diffoscope/diffoscope_234.bb
index 496ed9e602..994d3e9422 100644
--- a/meta/recipes-support/diffoscope/diffoscope_230.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_234.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a35908c15bb006058f74c2d4f2be3b1ac7cf62c872cfbd2950114a8a705d8108"
+SRC_URI[sha256sum] = "6091d555bc88ceca285dc40e63df56b57385aa0dc552daa70bde81e8a69f8c7a"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


