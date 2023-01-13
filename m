Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0C4C67871
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.88933.1673621827792327185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VAiBFzy3;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id h16so21306213wrz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYfCIzoaJznoU+OIpW7XVdeZK/uTWFxVJdRFaySJ3ww=;
        b=VAiBFzy3Gwc4eZY0pyJvDMcBShf/46vvJX1HKe3v5sVl6JwmuIpsw8S+GBPy8sT9mp
         Ren+++Qh5vjNeBkNZ9s0v1fNbIJRnYzGDNodzcCTEqTggaNWqj2CSpHwhtoQYCjRwQtc
         EomKHcGDwjT1oceW8rV+y0gHeQyLDAPZ06a3OVPyuFiZFVAiN8/bzzRoGIs9eQGpuzU0
         sHP3ZJw9kOCp1A7AqRMxAqrAe6hnV2uDzLweBoAHAjPukuFnLzBlTBNiZXT0lWwrDnPi
         bo7v+gR0CL5R2NOh6kYrJbHgWnBqrZVK9jiL2/kwSjxb2j2mZKacQ8AdhONdqj4rRJiS
         Y2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYfCIzoaJznoU+OIpW7XVdeZK/uTWFxVJdRFaySJ3ww=;
        b=pELGay4ZXjl4HNokxLmJG5uU/OWQI0lzvBLLDsi3/34fQLaeqO+T2GJDKoX0pKbfG7
         VzR7EwweySdIzFp+HUnrUh6BIJrfQPdUj5BMKwkHWcOz+h5tYnaYljtP7RqorHhrH7Z/
         y467xMAm+Wyi1NYiWEumcY3DYHsbDABkicqPBJGfQhlyx2+04TELz3WUEXJT0rIy75Ba
         ILlIlO5MPVxOMj31LCguMG43WlLwg+LxT12aQb5fQLv41rCixEcPcMHom7yN0qZj0XSF
         Zcb0CV05HFeLoTSL+ZFjpwlAhRFmOkzQXVwoQSvbtwpHLf7V8/ehaaQY9RJC0jK7zi+7
         XlyA==
X-Gm-Message-State: AFqh2kpfK2De8hH/3I3/vCda+ykkn4FdIoKbneQCHPAqOJjlDbs5qJbn
	3cboh6a6VuG2r2sWPuJ5lqlXTAq1H18=
X-Google-Smtp-Source: AMrXdXvy1mG/SEHNbE+yBq+LqLHJYFo1hOc1zm6Hzmh2CqCV+tAOXixxMSEtauGnOip7MvUrviRqZQ==
X-Received: by 2002:adf:f54d:0:b0:2bd:d85f:55cc with SMTP id j13-20020adff54d000000b002bdd85f55ccmr3845095wrp.21.1673621826064;
        Fri, 13 Jan 2023 06:57:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] ethtool: upgrade 6.0 -> 6.1
Date: Fri, 13 Jan 2023 15:56:54 +0100
Message-Id: <20230113145700.2773771-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175828

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-marvell.c-define-_GNU_SOURCE.patch   | 59 +++++++++++++++++++
 .../ethtool/avoid_parallel_tests.patch        |  6 +-
 .../{ethtool_6.0.bb => ethtool_6.1.bb}        |  3 +-
 3 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
 rename meta/recipes-extended/ethtool/{ethtool_6.0.bb => ethtool_6.1.bb} (90%)

diff --git a/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch b/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..8a7eeafb9c
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
@@ -0,0 +1,59 @@
+From 5112785191e3279c671a027fe797be77e1071ecd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 2 Jan 2023 13:45:46 +0100
+Subject: [PATCH] marvell.c: use portable integer types
+
+u_int32_t is not portable, but uint32_t is.
+
+Upstream-Status: Submitted [by email to mkubecek@suse.cz]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ marvell.c | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/marvell.c b/marvell.c
+index d3d570e..3d42eed 100644
+--- a/marvell.c
++++ b/marvell.c
+@@ -31,23 +31,23 @@ static void dump_timer(const char *name, const void *p)
+ static void dump_queue(const char *name, const void *a, int rx)
+ {
+ 	struct desc {
+-		u_int32_t		ctl;
+-		u_int32_t		next;
+-		u_int32_t		data_lo;
+-		u_int32_t		data_hi;
+-		u_int32_t		status;
+-		u_int32_t		timestamp;
+-		u_int16_t		csum2;
+-		u_int16_t		csum1;
+-		u_int16_t		csum2_start;
+-		u_int16_t		csum1_start;
+-		u_int32_t		addr_lo;
+-		u_int32_t		addr_hi;
+-		u_int32_t		count_lo;
+-		u_int32_t		count_hi;
+-		u_int32_t               byte_count;
+-		u_int32_t               csr;
+-		u_int32_t               flag;
++		uint32_t		ctl;
++		uint32_t		next;
++		uint32_t		data_lo;
++		uint32_t		data_hi;
++		uint32_t		status;
++		uint32_t		timestamp;
++		uint16_t		csum2;
++		uint16_t		csum1;
++		uint16_t		csum2_start;
++		uint16_t		csum1_start;
++		uint32_t		addr_lo;
++		uint32_t		addr_hi;
++		uint32_t		count_lo;
++		uint32_t		count_hi;
++		uint32_t                byte_count;
++		uint32_t                csr;
++		uint32_t               flag;
+ 	};
+ 	const struct desc *d = a;
+ 
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


