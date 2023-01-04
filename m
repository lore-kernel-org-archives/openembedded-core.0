Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF8DC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XnBE07Zm;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16084172wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klExYTvabKCz5/vZBnyf1WhuJ4hxMxeaoG10yvdh4Og=;
        b=XnBE07ZmM6OU5eJJZdAFh4VzKsjdIWGI6tr+qPhI/JJeCDj1rvcebC3IFkS7IVdzOA
         XmZbsA6mcSq4N9tVqQZ4JgP1N2bZ2j86ehJFF3nvjQebAYP2CJHljH8bWHFJvTBqztEM
         EiH9nlYsXY5ZEGIPXtArEurqFLHgZHzY0lWXUcByePHsNtvEVWOh7EYjJqkh26D9BYE2
         BCPT/VahzMHAXGjD8l3kz7HpluRglN7zV8YKPoibv+RiOkr1VYzDbgd1R4h3R3aBEymm
         bYhz9Bm8KfTJCD32fP+2Nlp01TlkCi4IJAdSG+dOMOn0Y8zddVIwnUSj4DSwdmuYSbmU
         xdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klExYTvabKCz5/vZBnyf1WhuJ4hxMxeaoG10yvdh4Og=;
        b=102j6P4NZcTn/M69wkCbh+I2nJ28EuDS/FRcjk9bbNv5KE4AkYOmtEEvr3VTaju2if
         hKeId7FQzOKYw8/ZNMYhnxbytNPC+g5DrDy4MGDpEUUcRs1yZh0+5eY3+MwLhjH6OM9J
         4mzEXW4JqSFM7wPrC3FK5AaZR1QeUI7t9lReVwa8YP+0ffsVp14D7wZiFpNRP9ga7mEP
         bCElA4GuGasgFpwebbWTn3MCd8CLWow1CbZvTD1b7pLwm3duHZi8lweY254uaygFo3rd
         w0D7SRRZizmkYSncKFeHcj1U6J7wRoLSdGyS/P+PbhHeZN0O/W6SFONojTBlbNEAPBTu
         on7g==
X-Gm-Message-State: AFqh2krGjf59ySrK8FOjvqSv/PXxzAmxY10dqdW4AruP1pe8eF8+BB9i
	vySdtZgHtHJ4W3MBd044+a3W9aOdV+M=
X-Google-Smtp-Source: AMrXdXuUwdyx2B/ZFALlA82Krdekijdte5Kqg8Rploo26nXJ5XOjsK5JXG9Ta84JKZ3ihpVZ+qukrw==
X-Received: by 2002:adf:fa45:0:b0:27c:92ec:d664 with SMTP id y5-20020adffa45000000b0027c92ecd664mr20482290wrr.26.1672830354992;
        Wed, 04 Jan 2023 03:05:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/77] ethtool: upgrade 6.0 -> 6.1
Date: Wed,  4 Jan 2023 12:04:34 +0100
Message-Id: <20230104110548.2537259-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175388

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-marvell.c-define-_GNU_SOURCE.patch   | 26 +++++++++++++++++++
 .../ethtool/avoid_parallel_tests.patch        |  6 ++---
 .../{ethtool_6.0.bb => ethtool_6.1.bb}        |  3 ++-
 3 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
 rename meta/recipes-extended/ethtool/{ethtool_6.0.bb => ethtool_6.1.bb} (90%)

diff --git a/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch b/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..f0d4c54596
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
@@ -0,0 +1,26 @@
+From 01835ce20f0605f1458365e679137ea65c26aa48 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 2 Jan 2023 13:45:46 +0100
+Subject: [PATCH] marvell.c: define _GNU_SOURCE
+
+Otherwise u_int32_t is not defined under musl C library.
+
+Upstream-Status: Submitted [by email to mkubecek@suse.cz]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ marvell.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/marvell.c b/marvell.c
+index d3d570e..86f1d46 100644
+--- a/marvell.c
++++ b/marvell.c
+@@ -5,6 +5,8 @@
+  *  Stephen Hemminger <shemminger@osdl.org>
+  */
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ 
+ #include "internal.h"
diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index c3cefbb5e6..4994369682 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From dea90ab711acad251b5d8536c534409979ea8be4 Mon Sep 17 00:00:00 2001
+From 0d066a901292e6a44ff7bc7ee16f99dd2ba4ea15 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 89d0e70..ab2be9c 100644
+index 3eb4e7b..ee5c72f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.0, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 6.1, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.0.bb b/meta/recipes-extended/ethtool/ethtool_6.1.bb
similarity index 90%
rename from meta/recipes-extended/ethtool/ethtool_6.0.bb
rename to meta/recipes-extended/ethtool/ethtool_6.1.bb
index 8f36520b00..2b9bbe69db 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.0.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.1.bb
@@ -9,9 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
+           file://0001-marvell.c-define-_GNU_SOURCE.patch \
            "
 
-SRC_URI[sha256sum] = "f2168e2b45d7e58ed5b76e5533fd607ca0720c9e631f4271bfe997bf72330796"
+SRC_URI[sha256sum] = "1d03f1ce324fbd95591191c42ac0c4c9cc721e067b929083a20a46c4b4731436"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.30.2


