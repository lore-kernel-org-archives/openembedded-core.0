Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6774DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.11761.1689696097061403488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=E2HQP53O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-668711086f4so3651944b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696096; x=1692288096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7L6FV1gPM5BLMs8w6jmuusy1CUGUqXzoL8OB09Tq6LM=;
        b=E2HQP53O9U0jQcZamu1CWSVqiLMLxJSaUeGnKsqsbQPRSXGEFlNY0PVuXe5rcN6636
         bRQARteW4wjVjDjrMwfGJ4+yk29NMKwcecYBG+0U6nNjpUx6jzO2OeLx3jPGMwEMOrz5
         fs4E0mPjur2xbRz2bBmK7ufLBB6tDUoPPAuIR7XrgK51uZfnxU+ZX/E0PUTX4rcPhKsO
         pnA/6zWBY1YDCmeQJFcqXqsryVj7Ef86gD0280qcpOY9LCbYZ5DWSVA8QW4cqfu2DTLc
         87bMPgJiw7zEC/e2t4CaBJil9gQ8Nid3wT51Mk65V+6v37yqPszVNuUDNwFr/AK3q0xg
         h4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696096; x=1692288096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L6FV1gPM5BLMs8w6jmuusy1CUGUqXzoL8OB09Tq6LM=;
        b=JVoDRfkW/7fiM3vTehh/q6cH1lu6vYaBUTWjtiCi4o/MOcVoGGem3HSCa4f9QEG8VQ
         vBLJAcKiW0azg95xRTq3bW5wKp/sFlG4fXydb462zZbpeOiWCtwlJtWcsVBxjBG/PxyM
         CBTputH3G+GVWiy+g2mea4XV29SUYNukN/PW2Fyl3KgesvhMAWgRudglESj9d4tZUIwd
         TtxsCDUcykWorG9a6RcuN9oTLcYXgjvhlrY/fkqoUda9+HKCqqyzpUqFnmyCDwsGwleV
         hZbD96jFdQEQ7cIzUfmxX41wZ5lsdBI64NSOpdY8qd0wOMLapdUxWSf1UhbPDnS42/fD
         5+JA==
X-Gm-Message-State: ABy/qLYFYYv8O8e1vhdQpMjyWeWJxCc5exwHEIh71u+L1S9leQ6ib4IT
	RGtYClpAgyJMAjiJFAG0KAVWpHia8Rb1BQAEURE=
X-Google-Smtp-Source: APBJJlGk7RGKsiQ8krcrVGw0jUdPKyhdSR2I945WygKBTl46mor9i22bIsjbGp2sZi0G3JelxU/iXw==
X-Received: by 2002:a05:6a00:2e1d:b0:668:7494:384a with SMTP id fc29-20020a056a002e1d00b006687494384amr17082947pfb.12.1689696096100;
        Tue, 18 Jul 2023 09:01:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/13] wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
Date: Tue, 18 Jul 2023 06:01:00 -1000
Message-Id: <67adfd6cbcdbb765460e6f97d8957c872d8f5c81.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184546

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47438402fa430499864a4b1f1a13eaac66aa21c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
index 295510225a..f3c3cd78e9 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
+SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
 
 inherit bin_package allarch
 
-- 
2.34.1


