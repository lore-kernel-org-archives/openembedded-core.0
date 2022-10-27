Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0670FFA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.2219.1666901789088799759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gQ1djEQO;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id a13so4820711edj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucsh8HkxGy2sx+RsXAnIcTrZcHAwbwERWypf7/pbmjU=;
        b=gQ1djEQO31YV8SsYJi0bgBfllgviYjxy4RrwLurImshufca6j7K/tlGj5DkfOmg3Kg
         XmciP2PjXgLt6qDSkscD6DOygEjHQU3PCmsjsOIkGeOC5lir/UOON339gn+2++8F33gf
         leY3Jt3matppdcSk4RNFNXtPSIdm5JphtYO7sby5osJBzHG6ZBrVkAc8YHQTLfD3g5Td
         P4//FJbx/AuurlBOsfFbzbNtLJ0xloM+yqhG3FbhNAppxDVX2FqgGKBdmSsLwarKO3pw
         2EE1jawOImFNnk/NHn3GCOjyzzCxDT2+6S8uC0Eccv7VGFH0YModPoTg9xwGvYf7QRHC
         8qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucsh8HkxGy2sx+RsXAnIcTrZcHAwbwERWypf7/pbmjU=;
        b=wRVtX11O2uNwBoGD9wfhI3iKO7nSduMqvtKzb8MBaaUxhNy2ZAIHIvXfsZvXyGb2du
         +fOgx5+nMUU865JSQtqMtSme0oswHCAPL/tdFWJL6XwuM+dxzFfmmtSF9Kdy6DeWZuP+
         QEL15S0a6U8aCM/hkq6HSlXkDsPXrVlM3Tj8WzcP2yZk18fjHhs+KXGpackFW4G8rqjo
         Bvo81SGYZmRYrHqkQSPeYombDNcrND3AjeV5ooJMruA8fcuW7TWgIx33B8kxK/H+LctN
         iAu4IUk3ROIf+4DtG/f2L3QlflUqB2k4wOY0q1OzigkH/X/ii5/SG7X1LoPIyYZZpvZS
         HDZg==
X-Gm-Message-State: ACrzQf1w12SAv2FCvboz/wCBSCaR2hBl6ne1QD/NgEWSSi39sbAsZhjn
	EvNB8l/Gdj+h+RpLhR+wzti0Qv97RzheZg==
X-Google-Smtp-Source: AMsMyM6Qng9licr3YWUTt+psKqGMgb8OfIulosgySxw2rjEBo1P99kFi+KIO60gQ42HRX6+6ymn8Bw==
X-Received: by 2002:a05:6402:501b:b0:459:df91:983 with SMTP id p27-20020a056402501b00b00459df910983mr45315341eda.85.1666901787537;
        Thu, 27 Oct 2022 13:16:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/23] hdparm: update 9.64 -> 9.65
Date: Thu, 27 Oct 2022 22:15:54 +0200
Message-Id: <20221027201611.3644334-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172210

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...parm-Remove-unused-linux-fs.h-header.patch | 32 -------------------
 .../hdparm/{hdparm_9.64.bb => hdparm_9.65.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch
 rename meta/recipes-extended/hdparm/{hdparm_9.64.bb => hdparm_9.65.bb} (89%)

diff --git a/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch b/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch
deleted file mode 100644
index dd88743d1e..0000000000
--- a/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c8fc52968f9e97d29ccf6deb348ec02627d74235 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Jul 2022 13:00:40 -0700
-Subject: [PATCH] hdparm: Remove unused linux/fs.h header
-
-this helps fixing builds with glibc 2.36 where mount.h conflits now with
-kernel mount.h which is included indirectly by linux/fs.h see [1] for
-details
-
-[1] https://sourceware.org/glibc/wiki/Release/2.36
-
-Upstream-Status: Submitted [https://sourceforge.net/p/hdparm/patches/52/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hdparm.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/hdparm.c b/hdparm.c
-index fa21e2f..901bdd8 100644
---- a/hdparm.c
-+++ b/hdparm.c
-@@ -25,7 +25,6 @@
- #include <sys/mman.h>
- #include <sys/user.h>
- #include <linux/types.h>
--#include <linux/fs.h>
- #include <linux/major.h>
- #include <endian.h>
- #include <asm/byteorder.h>
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/hdparm/hdparm_9.64.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
similarity index 89%
rename from meta/recipes-extended/hdparm/hdparm_9.64.bb
rename to meta/recipes-extended/hdparm/hdparm_9.65.bb
index eeb63a27e5..d5e6ab6065 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.64.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -24,10 +24,9 @@ RDEPENDS:wiper = "bash gawk coreutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
-           file://0001-hdparm-Remove-unused-linux-fs.h-header.patch \
-          "
+           "
 
-SRC_URI[sha256sum] = "315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a"
+SRC_URI[sha256sum] = "d14929f910d060932e717e9382425d47c2e7144235a53713d55a94f7de535a4b"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.30.2


