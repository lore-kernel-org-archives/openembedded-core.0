Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537BCC10F1E
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4573.1670539388246362842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vZVnX9zz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so6167519pjr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOf4kFp3YVxcIKk5GeHd2DuC7xj3AD5Q1NrrCiCHnsQ=;
        b=vZVnX9zztYfiAwhAGmJRWNHO2EJFvt/2u8i0lcpz8QqphrgIcCXKOGMLB0tQ8QHyQY
         aCxhllFmWHH3CLoAVrMGGp53V87roGdAfZxR+Wk07slc55hsR91ggblpT4ku0eTGNw3f
         r3IdV6qm4r60CN82z35RL86Or/cmPZc9OYVqng7zO/jIB6qFDyQRuPUrPSrq+mJmW2DI
         D1zpqNOyXQ6nIdXBiycCVt1quofxgB0cDMVpNMx4I9oA5t59DJ4zFb6tRa1qJuu48LcE
         +GMSJ+2o06WFkK+coH8piEgOTg1xAknRnk+PwjiPnV7UvlUI32N/e+SfXuAB1mHvBDVt
         IIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOf4kFp3YVxcIKk5GeHd2DuC7xj3AD5Q1NrrCiCHnsQ=;
        b=xlA7Duf2WHqd9+X0O8bAMhUs2n0hURZQCDka1XzKGAS95yboco/WJslknKuKV4h1rZ
         0bNSG2Pxtk5pAme2ebIzcivuLnypyIwFRTeFG97JmiWTFE5aiW/bfvF9cykDcANW+ou0
         ockhGYY+NCbIp6bkl9HZMItjYBNzwUgdTV9SL+76QoJEoTt0si6v3tgfyHPuTajopJV3
         V1He5xzt0iF/Kx0fiIv4N55NJZ5gwolWIQqaVrusz3EwbhUKmoLPNZEnHfSVYbmfIl4M
         FsJFTC7qVWGFeu9hsr2WXXaBA9GJhmgm/X2Rc+gMwCABFi0r4vhOHRQ3rr1iuxMSqseE
         bjOw==
X-Gm-Message-State: ANoB5pmnB9vosaL+Xb/ZjdGKse8e2Yad49ewhtliFIb88FgohizpDeo5
	+f/i7YVxYbKEMyX+ZW3ppF5M0kbj2Au8RRXKXXEtWw==
X-Google-Smtp-Source: AA0mqf684b4oor/UnIVhT3YjzlO8CcgwarGHp55i9+0RVK9O0x98Nv7oWUp6TBDoPsgwKinMyANldA==
X-Received: by 2002:a17:902:6b05:b0:185:441f:7087 with SMTP id o5-20020a1709026b0500b00185441f7087mr3347186plk.12.1670539387268;
        Thu, 08 Dec 2022 14:43:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/12] sysstat: fix CVE-2022-39377
Date: Thu,  8 Dec 2022 12:42:44 -1000
Message-Id: <caf40fd28424aa583c18f9235d6d28651cc419b9.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174416

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sysstat/sysstat/CVE-2022-39377.patch      | 93 +++++++++++++++++++
 .../sysstat/sysstat_12.4.5.bb                 |  3 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
new file mode 100644
index 0000000000..dce7b0d61f
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
@@ -0,0 +1,93 @@
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
+Upstream-Status: Backport from
+[https://github.com/sysstat/sysstat/commit/a953ee3307d51255cc96e1f211882e97f795eed9]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ common.c    | 25 +++++++++++++++++++++++++
+ common.h    |  2 ++
+ sa_common.c |  6 ++++++
+ 3 files changed, 33 insertions(+)
+
+diff --git a/common.c b/common.c
+index 81c7762..1a84b05 100644
+--- a/common.c
++++ b/common.c
+@@ -1655,4 +1655,29 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
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
+index 55b6657..e8ab98a 100644
+--- a/common.h
++++ b/common.h
+@@ -260,6 +260,8 @@ int check_dir
+ 	(char *);
+ 
+ #ifndef SOURCE_SADC
++void check_overflow
++	(size_t, size_t, size_t);
+ int count_bits
+ 	(void *, int);
+ int count_csvalues
+diff --git a/sa_common.c b/sa_common.c
+index 3699a84..b2cec4a 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -459,7 +459,13 @@ void allocate_structures(struct activity *act[])
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
+2.34.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
index fe3db4d8a5..3a3d1fb6ba 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
@@ -2,6 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+           file://CVE-2022-39377.patch"
 
 SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
-- 
2.25.1


