Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FDFC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:43:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7276.1670481822172468269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UTo2PVhk;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id a9so640280pld.7
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zv7cgmlc/sXm2lifhwXu/jlM+Xgro9WqPZ6uN0b8ybI=;
        b=UTo2PVhkPWSpCxiNOTVCKGpQV6OS+AqazLiI09K2OHazDHwlGlE/rn2cHwu+XBRbZu
         6bKFkKUy/oAlzKPmmo78z0Ekv5xwHFTbn169My3EOObgfGH/etHwXh0DQ6AHf/vIRD4l
         ryVZ/PXporEBXoO8aZ1dVTqFFCqI4LGC+ohkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv7cgmlc/sXm2lifhwXu/jlM+Xgro9WqPZ6uN0b8ybI=;
        b=K6jP4oJ+yIku1csRoUP78SnQLyfSOER0Y96iCUZu2CYZeCVX8L5SGoRKiTwMt54mli
         X6OpbhLXl6/z+4fp/bGEkiNYlPfryDUGFZ+dEogm09piM82ZCv+BkfVoaPZE+ZW/vr/f
         s1+jEEw04cAtV5x03UVw4zCvHWCGiOpCiGOjgwWvnerKNtiyU+2uGGAo1ByV/zhAxHe8
         CaSDJ9N+DyHq2ULVKvM1/5HC/IbqocTj1qs5AKQ/uuW9VT+JO4Kk9K+sJ7eYzOOOIx/k
         MoDcl2oao8zcx5xLELXwfAa80QxwkDUgu9dziWH8mOIKXT424yh5NoHSXY+TzJ85YrzQ
         eR9A==
X-Gm-Message-State: ANoB5pnLjlN0fNckdoT0U6AeMbgJwa/PXF5DnmYezT7nli7Svte26L6W
	Xsjbo2twkuFVVk/sF6sZp4D6n6KT2zxSJAkM
X-Google-Smtp-Source: AA0mqf4q+2AQZsqlCIF+lj8Yc1V/lSlA99k2fp9YTRThPNN7p4RCcNu1/JUB/ewyowxaQ3R8MICq8g==
X-Received: by 2002:a17:90a:f84:b0:219:c5b8:e19e with SMTP id 4-20020a17090a0f8400b00219c5b8e19emr20416542pjz.234.1670481821112;
        Wed, 07 Dec 2022 22:43:41 -0800 (PST)
Received: from MVIN00024 ([103.250.136.158])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00188b5d25438sm5130546plg.35.2022.12.07.22.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 22:43:40 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Dec 2022 12:13:35 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] sysstat: fix CVE-2022-39377
Date: Thu,  8 Dec 2022 12:13:34 +0530
Message-Id: <20221208064334.27856-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174385

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sysstat/sysstat/CVE-2022-39377.patch      | 92 +++++++++++++++++++
 .../sysstat/sysstat_12.2.1.bb                 |  4 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
new file mode 100644
index 0000000000..972cc8938b
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
@@ -0,0 +1,92 @@
+From 9c4eaf150662ad40607923389d4519bc83b93540 Mon Sep 17 00:00:00 2001
+From: Sebastien <seb@fedora-2.home>
+Date: Sat, 15 Oct 2022 14:24:22 +0200
+Subject: [PATCH] Fix size_t overflow in sa_common.c (GHSL-2022-074)
+
+allocate_structures function located in sa_common.c insufficiently
+checks bounds before arithmetic multiplication allowing for an
+overflow in the size allocated for the buffer representing system
+activities.
+
+This patch checks that the post-multiplied value is not greater than
+UINT_MAX.
+
+Signed-off-by: Sebastien <seb@fedora-2.home>
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/9c4eaf150662ad40607923389d4519bc83b93540]
+CVE : CVE-2022-39377
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common.c    | 25 +++++++++++++++++++++++++
+ common.h    |  2 ++
+ sa_common.c |  6 ++++++
+ 3 files changed, 33 insertions(+)
+
+diff --git a/common.c b/common.c
+index ddfe75d..28d475e 100644
+--- a/common.c
++++ b/common.c
+@@ -1528,4 +1528,29 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
+ 
+ 	return 0;
+ }
++
++/*
++ ***************************************************************************
++ * Check if the multiplication of the 3 values may be greater than UINT_MAX.
++ *
++ * IN:
++ * @val1	First value.
++ * @val2	Second value.
++ * @val3	Third value.
++ ***************************************************************************
++ */
++void check_overflow(size_t val1, size_t val2, size_t val3)
++{
++	if ((unsigned long long) val1 *
++	    (unsigned long long) val2 *
++	    (unsigned long long) val3 > UINT_MAX) {
++#ifdef DEBUG
++		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
++			__FUNCTION__,
++			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
++#endif
++	exit(4);
++	}
++}
++
+ #endif /* SOURCE_SADC undefined */
+diff --git a/common.h b/common.h
+index 86905ba..75f837a 100644
+--- a/common.h
++++ b/common.h
+@@ -249,6 +249,8 @@ int get_wwnid_from_pretty
+ 	(char *, unsigned long long *, unsigned int *);
+ 
+ #ifndef SOURCE_SADC
++void check_overflow
++	(size_t, size_t, size_t);
+ int count_bits
+ 	(void *, int);
+ int count_csvalues
+diff --git a/sa_common.c b/sa_common.c
+index 8a03099..ff90c1f 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -452,7 +452,13 @@ void allocate_structures(struct activity *act[])
+ 	int i, j;
+ 
+ 	for (i = 0; i < NR_ACT; i++) {
++
+ 		if (act[i]->nr_ini > 0) {
++
++			/* Look for a possible overflow */
++			check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
++				       (size_t) act[i]->nr2);
++
+ 			for (j = 0; j < 3; j++) {
+ 				SREALLOC(act[i]->buf[j], void,
+ 						(size_t) act[i]->msize * (size_t) act[i]->nr_ini * (size_t) act[i]->nr2);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
index 2a90f89d25..2c0d5c8136 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
@@ -2,7 +2,9 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2022-39377.patch \
+           "
 
 SRC_URI[md5sum] = "9dfff5fac24e35bd92fb7896debf2ffb"
 SRC_URI[sha256sum] = "8edb0e19b514ac560a098a02933a4735b881296d61014db89bf80f05dd7a4732"
-- 
2.25.1


