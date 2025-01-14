Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292D4C02180
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 00:26:40 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.33747.1736814391943364361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 16:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IxcXhqzf;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f2dee7d218so2279525eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 16:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736814391; x=1737419191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kp/e5rQdk+H8oYlWj5jsdaU8pTeImFJ4zVHSnbdUH4=;
        b=IxcXhqzfsYxEb3yTxY6wP/yJ13fNc9fdryC6vqPyzPu9MavZL5PglwK+oFGORwuu2D
         b8alphWtEw5g86kuLukm8DoIeYQkEeuK7DzWJrV8BGp2nqJlvQtZTe9kaLfEeMMk5UyZ
         IWJjy4VJwzqj60SapoVTS/sdrA+TIvVZZGQE7yAB383ttZ59B1GMRiHOJ+Ff4ZV/DyO+
         gOEk8gafCVKFucHOHP/LyYHlSQDb4KZv79ZiYGfAOFiZrJPEYOeeYGbn+VGMjQctNh4k
         3z+M4+aS+sH9+n6fGYERWh1P/pA4FU9T68yclKui6EKHqC+DdO3uI0Ua9dTEfFkyg3mP
         7m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736814391; x=1737419191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kp/e5rQdk+H8oYlWj5jsdaU8pTeImFJ4zVHSnbdUH4=;
        b=au6tcsWjGZtUXfSEg87l0sJNMaRJd6MtxT2AGRcrxLnjeTXPzfGq3b4Gbgx9vx83CV
         TlebOozjOxQoCzpTe1LWn9uaDM9lR+qMcC1ANbTy8QgfMoYTQAcbskHk2hJ2nafwv2ZM
         +lqQXzo27RcmLV2ab27HqJHG3ZGgh/rQSzVj0V0SyfYlUa2b4L27bULy442ySOcvVmLU
         e+I/8YvvR7lONNqkRccBpokWAD7GuSIhcpiNi9JfCdtwvtnlj431ALtSGvS66GCA32O+
         cKzZ66gF5rcEemeyeK3KyleE3vBOM/Wdvpxs1okd79DNfO/mqZ1XMt5spnMiKwrsUn0d
         Wbng==
X-Gm-Message-State: AOJu0YyEloD2VtGjAO8Db6MiPEp9wbsJFzrWxUEVobMDhwR98zq4MqHH
	NRQcV4+nNoezy9nUbgBx3QHxBKRzNSAgw1T8kL7bGt1eoOqRvv8SL3c3eA==
X-Gm-Gg: ASbGncvBnyu5GY8sphGFvun2txSLh9DrynJ1Tgz+OnNmBDHIDjD1hBJ0LFnpyZ6KJ56
	TqN0f0PiDOkYfQeVUC5xXDT0A+e2ySTaYk82kWBxdZMpexfuq4ncEnJzCbL0gZlpsIqKBGrI0AL
	9KUa7WLoCiU/A0E4M0foYBsVjqv3FiXHA22PNQIZui4MQtUeiTQojCi4c5rY/FnEctgHvDRoRy6
	3MYP+JkArAJKkiiJakPmNrA/jbjQZ4RrZEkLtcTEYHMjMMKKEkujdWsXPMstC/fAfy2iUr5aA==
X-Google-Smtp-Source: AGHT+IHe9KJeQZUZEu3i4Mw11kAEALMgPIGGi1HO/NDTkI5seIAx+t/FK9pow/z3QGRGNu6005NO4g==
X-Received: by 2002:a05:6820:1747:b0:5f8:a470:f562 with SMTP id 006d021491bc7-5f8a470f9a9mr5562393eaf.0.1736814390881;
        Mon, 13 Jan 2025 16:26:30 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c0:f217:987f:63ab:3af7:fe70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72318538401sm4121843a34.7.2025.01.13.16.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 16:26:29 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [PATCH] libxkbcommon: replace locale dependecy from RDEPENDS to RRECOMMENDS
Date: Mon, 13 Jan 2025 21:25:03 -0300
Message-Id: <20250114002503.7321-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 00:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209771

From: Hiago De Franco <hiago.franco@toradex.com>

The error described does not occur in all cases where libxkbcommon is
used. As example, a Qt application that depends on libxkbcommon might
not require any locales to be installed.

Add it to RRECOMMENDS, as libxkbcommon does not seen to have any hard
dependency on libx11-compose-data or libx11-locale. This change can help
users decide to disable it and save some space on the rootfs.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
The first version of this patch is at [1], now this patch is different
and changes the RDEPENDS to RRECOMMENDS (the subject is also different),
that is why I did not mark it as V2 on the subject.

[1] https://lore.kernel.org/all/20241212213429.250224-1-hiagofranco@gmail.com/
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
index 40cf616f0bd2..d87ff661d9f6 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
@@ -31,9 +31,9 @@ python populate_packages:prepend () {
     do_split_packages(d, d.expand('${libdir}'), r'^(lib.*)\.so\.*', '%s', '%s library', extra_depends='', allow_links=True)
 }
 
-# Fix a following runtime error:
+# Recommended to fix a possible runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
-RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
+RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
 
 BBCLASSEXTEND += "native"
 
-- 
2.39.5


