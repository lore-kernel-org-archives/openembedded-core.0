Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD2BC7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:02:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.38997.1686499376279457066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=E+mr0nSk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b3c0c47675so4535015ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499375; x=1689091375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uGAQL/sGHoHGsvTbr0rge9oS2zyF0TLlgEwfA06Rbo=;
        b=E+mr0nSkUldIcRK5Tfi6RLHJgkMEJ7q7UhK/JUb9rKJs/Dq6KXTV76TxEPsJxf+y/t
         RRIIjQ/Tsz5VIxa03LfMLAxjFxDeUwT3kY7VQyskPAlCEG+jPuU9XRAsKzZ657lfvd2j
         40zKnEuhS9udjQkiDKCYC2PHLC4FkLh46VftqCVxsad7desenvBG/surMyaKyr8qtWvh
         7kb2N1vc4WQSupCNwTPCI8eTAlnkN/eHhCJs8NdTo0J1h5sEHLX6at5CT3waacGTwCmc
         RzWbaHILzy3ZvNQ5A/achec32JrGWm+PG+k7XMPBR0Rrt/zphzjHYsv6QtZQCUb0fJSQ
         blUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499375; x=1689091375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uGAQL/sGHoHGsvTbr0rge9oS2zyF0TLlgEwfA06Rbo=;
        b=hL8U/4TtFbicEcWe3mwyK3OgR5zB3qgMkfLh3rJCoOzs46nCax4M/+VXTkTLdfEIz+
         nhobBcdN7iTnUNZ1Ymn2p1btjO//gxtRH/q9oIl53nRwMxRgTsDcdJyirr4ikFDLGdW9
         j0R1Jzqe/SlCio3zctr+pRT6a/je/p4IT7lBdNDUARvI3B/f7cbgm8pVCa+EZpDyXJ3y
         6m5CE+62U3HNCnDSac8znsYWabLwimQNaTJ3Hc1j1Tg6nLxEzGfsWiqXUerouL0XlNRf
         XU1qs1v/iThKawpbfZQbWevDC3xo+lcSrizhzovCT7z/gwoie2aVcOZiQF8IZ0Ak/q+J
         u4Jw==
X-Gm-Message-State: AC+VfDw0mDJn6SktHGUtZ1GDchhadezAuxai6UpYbcVQhDrAON0ZTs94
	wsvtCZuvgdmyMjr1GuM0uSqjt4Wgo+xTxdK48R4=
X-Google-Smtp-Source: ACHHUZ5W2Im+xbz8m0T+5fEH206xtUiH6qveO22MI1raTa8q4atGXL43/mWJKZJZfXMxZWSWfJ1TBw==
X-Received: by 2002:a17:902:ef95:b0:1b3:d258:79e0 with SMTP id iz21-20020a170902ef9500b001b3d25879e0mr151512plb.52.1686499375157;
        Sun, 11 Jun 2023 09:02:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.02.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:02:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] sysstat: Fix CVE-2023-33204
Date: Sun, 11 Jun 2023 06:02:34 -1000
Message-Id: <d4ee3ad88392dbcb4284be48ef9fd0bbff979cca.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182623

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


