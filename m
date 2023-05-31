Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890D7C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:54:20 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.8017.1685516050437845967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=T0lhsk6g;
 spf=pass (domain: mvista.com, ip: 209.85.219.173, mailfrom: hprajapati@mvista.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bacf685150cso9593747276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685516049; x=1688108049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3ZSv9XW8+tYtF7nOrNK0adtPKwluD7TMLKYeHTwDUY=;
        b=T0lhsk6g6AukxgE/Mjn14F6AROGDxm/IMpW9F/dWQV7zXMMw3XZpVAhqDdWo10k9It
         SFF430OXuKN0W0BDYNWQrzzujQXqfg9Sad4UsAn7uB1rhrDbSIJ+34lBxFgTcjDTDZaZ
         7fKtO2yaogYTyj8bliMRvn/L6ECJEdWvFmcx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685516049; x=1688108049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3ZSv9XW8+tYtF7nOrNK0adtPKwluD7TMLKYeHTwDUY=;
        b=O37qPXI8HLspF0OANwXVbwmILvo3yNXoNQDAD1CNbXorJmkche8QXM5Ve34xz4+lpd
         j1ljRiK8VGihYpEa4kv8E4yAMh/8+Q6NDY4DeFy6dqtF5KrusXwQQkm+XvwUKKozHsuX
         d2KX6Zu65rlz0QOPDjHfjuubDTdaPpxR7x+xykL6Q7pPH8It+qeoIW6mZs4XcNAIElka
         7TcdjIoSemnycj1QDhF0XYssd2vIGte46QUPIx0nT0x0LbDfLruj4EfzyqZd91i6/0fm
         RbnWJHGDtJZNzymNsCGKyOY8FKvQjYBMp5AAB+h4XOu0WeGFVDT3idfORZx5or+moTNu
         fXHg==
X-Gm-Message-State: AC+VfDxF6nmCzPI1FRDU12NtEQeqYpsEo5zKgVtEeBk9e/D8juCCljMn
	Dg+/0OznuLf8ynRBZphuGwgD4NdILLXpb8XR74U=
X-Google-Smtp-Source: ACHHUZ58Ghz39cHylFr8ZiL9oTCTJXaVOV4S7kjbVcsjSVAACs0J2A1vO/jyQ1EeVVRUOLEH5lvSBQ==
X-Received: by 2002:a25:d16:0:b0:ba5:ee5a:f41c with SMTP id 22-20020a250d16000000b00ba5ee5af41cmr5713253ybn.1.1685516049422;
        Tue, 30 May 2023 23:54:09 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.210])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b001afa7040a70sm471348plf.276.2023.05.30.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 23:54:09 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 31 May 2023 12:24:03 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] sysstat: Fix CVE-2023-33204
Date: Wed, 31 May 2023 12:24:02 +0530
Message-Id: <20230531065402.461784-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181997

Upstream-Status: Backport from https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 80 +++++++++++++++++++
 .../sysstat/sysstat_12.4.5.bb                 |  5 +-
 2 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..3a12f7a3ed
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,80 @@
+From e806a902cc90a0b87da00854de8d5fd8222540fc Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673c]
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


