Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC66EC7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.130.1686329646467989857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qr7AqJHr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-653bed78635so1464917b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329645; x=1688921645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPQLfsa06t7PkNwp01hdcUrq9SWYyiUCaVME1GDZWMo=;
        b=qr7AqJHr5ChkAbgui0EczzY3twOCWteN4rmL3/5FVFOSobIv3rDDQAT6sfcfpa2VYA
         Egx6NRGQk+2gMEU3sq/gC8cPjO4U3lq1ZURxnjxqellkgPSNft2xborzvVxTeKoN2kn+
         3wPH1etSxjxzG0k2lvErfuSQtof25IOTnJ8yx0kLuYu7qkUHovl6RVu4yoIx6bgIIT1M
         lHRA7u8dF9Amp9NFKuj83b49a19ytjkr8vZaP9gh6gGXZ47hElLzhWXCIuCWb+oE6D3D
         0TB5nhBogJXfnhJ0ge/3j0Cdeya+ZyseaD5p1jrB0dufjRV1lbxdsOm3vuyH04l8oql4
         VL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329645; x=1688921645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPQLfsa06t7PkNwp01hdcUrq9SWYyiUCaVME1GDZWMo=;
        b=HlljsZYAX9rWpCbT3u2ai8UitBKrgl8XCsZiJkSgABAmzQGjkg/HwTt3GhCt+6+xJ3
         6whO7acAxpqSy3U5pPXSmrCNroHET5/vC2yKIqgBpC7Wyv8Qfw6KVIsGdxDuws776YSj
         9QCSDuJ7aiX0VyKmPo9NyBmVOO50KutxQTLLyO6MLZ2XynRKgakh9VBJVnzUHzOY8kR6
         CsM5O9gKbiOj5jH7w8eF4B6GCRrRxYwFTmycHGzGWZdp1c2JefcY4BloqvEDndKeo/qt
         az6UYCB/F0YXhFwwG4qBmOgJfVLZif3HI3n3u6ODGXEDRTiOgwyK8LMNr1rIw2PMUrct
         aSjg==
X-Gm-Message-State: AC+VfDxzklEFO64LEMwVUk3Xr0FyKqMCqO4VGPvtnk9QW/F/lU7kk5P9
	aooz2O9OJAX6WDuAZUgBxL+ZjgCF4g9VP4ME9o8=
X-Google-Smtp-Source: ACHHUZ6LcDV6xakcwkrZ8mRAjwoxu4JMBgG3fWC0v/j4SH7SlEH14OF6W1Hrs7C2vwlvDa/rrZCXOw==
X-Received: by 2002:a05:6a20:158a:b0:10b:bf2d:71bb with SMTP id h10-20020a056a20158a00b0010bbf2d71bbmr2987088pzj.27.1686329645040;
        Fri, 09 Jun 2023 09:54:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/30] sysstat: Fix CVE-2023-33204
Date: Fri,  9 Jun 2023 06:53:28 -1000
Message-Id: <5aee537b52382d5b5e702ecb4c3f34e38a90a398.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182567

From: Xiangyu Chen <xiangyu.chen@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-33204
https://ubuntu.com/security/CVE-2023-33204

Upstream Patch:
https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a6871590b908e4b749484d913da5e280c20d05f)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.6.2.bb                 |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..a7b51f3217
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+From 0764cb56df4a5afdf04980c9eb6735f789f5aa42 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673c]
+
+Backport Changes:
+Adopt additional changes as per following merge commit of pull request:
+https://github.com/sysstat/sysstat/commit/6f8dc568e6ab
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ common.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index a3d31a5..138920c 100644
+--- a/common.c
++++ b/common.c
+@@ -447,15 +447,17 @@ int check_dir(char *dirname)
+ void check_overflow(unsigned int val1, unsigned int val2,
+ 		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 * (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
++		(unsigned long long)val2) ||
++		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
++		(unsigned long long)val2) < (unsigned long long)val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
+-			(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+ 	exit(4);
+-		}
++	}
+ }
+ 
+ #ifndef SOURCE_SADC
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index f9e5778e76..b5014eaefb 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -2,6 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2023-33204.patch \
+            "
 
 SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-- 
2.34.1


