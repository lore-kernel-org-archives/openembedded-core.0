Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25226C4708E
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.14915.1671202690074697750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ExPGK4/F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id l10so2546660plb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmZkGs6nyLWcH5jNiT+ZDuUXFhEURGe/m8anhZp2USQ=;
        b=ExPGK4/FrmlHiqDsWvDV0W2nVi0osPJ9G2JwA2YwiovSI5DAeIJohh5u7J0JKYFuB1
         VuZmJjzz6SkqltWlT04i6SkaTsL79XZkZl2esfnVAOcyRG1NwrFeb9LhHtw1TcQ9y2bo
         q719atLGslpKEpHwsblNnfCKFJMPb3cZ/HaoVDgeibyl2orfLlYxppPTUDvmvAnHJs2r
         BCGo5JFE41qFmPOnreWJVlSTp/wdgRcvNVTmQQevvBcuzex8GNhsG3RJ6ur9ol1rM4rq
         4HuV+Q5zXieNXpczCmw9DtaW4KdPadFtd31e83UHt1arHD8kPoBGXeTEPxsEuoa0+AOi
         fEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmZkGs6nyLWcH5jNiT+ZDuUXFhEURGe/m8anhZp2USQ=;
        b=JzU5azwhXpGfN7CFmgNzakpgHe6hQ9F9xbiA/4ZnVGcMF5dx7f8TCGtxGIvSp2xXK1
         XL7uvRJLVyWQrMEWSeydBqQ9TC4GR0EVbpg8JVMcB39bLSM5bHZNYAgNtqoiASpSRL4q
         wVZQpc0ma62qZPp4mYL0vcDY/dfn0hcLYoUCQLgCeDD4P07yg8ferUwaHkux96727+4y
         VXh0vbJ0/lqtANDbFCm4nqitZ78DPCPIf353ZWI1EC4pWABrdDDney7QHN14k0IX3fyt
         8XYtG5g/A8QXjRF1C72C8skFz3KbWu9pYdzI04FoGRJc36+cYAARPJ2f6dZIkyvbYzUD
         vPuQ==
X-Gm-Message-State: AFqh2krH9b8VHawMaEyxecTFJwpNfsTz3cMawCQH4VFFnnc7Ww+FaybK
	Y4CVJwKSuYie+K1uJsf2ef831oJemgrliRGY9tc=
X-Google-Smtp-Source: AMrXdXtK3ZEQJ+U7ciWF/RL5n2vpsQ8pg7rKRQ7qTtpdqlKN+5KDNMrfkaXFmofk4+sb7SZtx0g4jw==
X-Received: by 2002:a17:90b:ec1:b0:223:9cfb:2f9e with SMTP id gz1-20020a17090b0ec100b002239cfb2f9emr1136343pjb.22.1671202688955;
        Fri, 16 Dec 2022 06:58:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/13] sysstat: fix CVE-2022-39377
Date: Fri, 16 Dec 2022 04:57:44 -1000
Message-Id: <2e770eb2213f3d5ff25a75467395ed4738c756ea.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174749

From: Hitendra Prajapati <hprajapati@mvista.com>

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


