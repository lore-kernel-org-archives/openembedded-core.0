Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BF0C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 05:04:40 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.6748.1685509477557109016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 22:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=IAYVyuyf;
 spf=pass (domain: mvista.com, ip: 209.85.128.170, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-565eb83efe4so50213467b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685509476; x=1688101476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRISydewPANKLmBbFa51aZf3VS3ktypPVT1zyFI7W4Y=;
        b=IAYVyuyfXOk4DGdszy6BV4XLOU0EDKa8hk/EpzVlCmb6M9DdRGyrHwqyIs+ijt4MtO
         9LL3ylV/3rOjDReXbmIzH4mQm1vx0hffDpDbDMeS3iSGC7k7E7TfBvPO7c9Jk1+/H4MR
         eN5PrCcRkjzh4pGrjIQ3ZVDXTuN0+MvfY7OVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685509476; x=1688101476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRISydewPANKLmBbFa51aZf3VS3ktypPVT1zyFI7W4Y=;
        b=i0WKngpDvruXD1MnxCtYXkHxZiK03kbojP2fwsGOHkXdgM3EqukyZDVqQm8tHJPuOh
         oJSF6SDLXlggfDs6Q3aieQryFe5k6hC2uZCl3K3RAU8/rO/Hh8GhPpz7GLhG1HCR/iIS
         kh84d6OCTZmyEJA5KVJFB2GuszlOV6S0DrtxGvDHGyP/tHEnGdB4mruxv/++5j8XSzcl
         csI0rvL81wqOtw/UaXtJ54AVOX9mdwA8dBYI5AMtrCcW+nU2EHOzZxY/b9ZvOdcE1dMB
         IF6XiOV9gvFuQ8hQgXvffODQfuKRWhvIhjPeCAbqnSLp/4772h8l5DiLztm22rQyIqCw
         uZnA==
X-Gm-Message-State: AC+VfDwG/3QAaxbEkuVffXcrx+pTEUyMJqAO3lxA4E0yo2U5fKtgIlAo
	18auKM0xTI45tFDziz2TS/wXVfDlGhArdF+2H50=
X-Google-Smtp-Source: ACHHUZ7Gwoir9e58eWloggCWyHIibUcIMGfjKyJonved8dK5vuuZxrEsoKcHj5lvP9U+WQVZxE13FA==
X-Received: by 2002:a0d:e2cd:0:b0:565:d401:7384 with SMTP id l196-20020a0de2cd000000b00565d4017384mr5183343ywe.4.1685509476600;
        Tue, 30 May 2023 22:04:36 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.210])
        by smtp.gmail.com with ESMTPSA id p9-20020aa78609000000b00640f588b36dsm2445220pfn.8.2023.05.30.22.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 22:04:36 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 31 May 2023 10:34:30 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] sysstat: Fix CVE-2023-33204
Date: Wed, 31 May 2023 10:34:29 +0530
Message-Id: <20230531050429.33073-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 05:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181988

Upstream-Status: Backport from https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 80 +++++++++++++++++++
 .../sysstat/sysstat_12.4.5.bb                 |  5 +-
 2 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..5744870bdc
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,80 @@
+From e806a902cc90a0b87da00854de8d5fd8222540fc Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0]
+CVE: CVE-2023-33204
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@...>
+Signed-off-by: Sanjay Chitroda <schitrod@...>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common.c    | 18 ++++++++++--------
+ common.h    |  2 +-
+ sa_common.c |  4 ++--
+ 3 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/common.c b/common.c
+index db9b0ed..e05c5bb 100644
+--- a/common.c
++++ b/common.c
+@@ -1640,17 +1640,19 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
+  * @val3	Third value.
+  ***************************************************************************
+  */
+-void check_overflow(size_t val1, size_t val2, size_t val3)
++void check_overflow(unsigned int val1, unsigned int val2,
++		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 *
+-	    (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++	    (((unsigned long long) UINT_MAX / (unsigned long long) val1 <
++	      (unsigned long long) val2) ||
++	     ((unsigned long long) UINT_MAX / ((unsigned long long) val1 * (unsigned long long) val2) <
++	      (unsigned long long) val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__,
+-			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+-	exit(4);
++		exit(4);
+ 	}
+ }
+ 
+diff --git a/common.h b/common.h
+index 0ac5896..b2ffe9f 100644
+--- a/common.h
++++ b/common.h
+@@ -256,7 +256,7 @@ int check_dir
+ 
+ #ifndef SOURCE_SADC
+ void check_overflow
+-	(size_t, size_t, size_t);
++	(unsigned int, unsigned int, unsigned int);
+ int count_bits
+ 	(void *, int);
+ int count_csvalues
+diff --git a/sa_common.c b/sa_common.c
+index 1b8fcaa..1144cfe 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -452,8 +452,8 @@ void allocate_structures(struct activity *act[])
+ 		if (act[i]->nr_ini > 0) {
+ 
+ 			/* Look for a possible overflow */
+-			check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
+-				       (size_t) act[i]->nr2);
++			check_overflow((unsigned int) act[i]->msize, (unsigned int) act[i]->nr_ini,
++				       (unsigned int) act[i]->nr2);
+ 
+ 			for (j = 0; j < 3; j++) {
+ 				SREALLOC(act[i]->buf[j], void,
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
index 3a3d1fb6ba..f8a950e8a2 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
@@ -3,6 +3,7 @@ require sysstat.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
-           file://CVE-2022-39377.patch"
-
+           file://CVE-2022-39377.patch \
+           file://CVE-2023-33204.patch \
+           "
 SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
-- 
2.25.1


