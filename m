Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3403C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 16:16:34 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.56988.1690647389033537281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 09:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Kvnuo6Fo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20230729161626b013beeb7b96915f13-y1jcv_@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20230729161626b013beeb7b96915f13
        for <openembedded-core@lists.openembedded.org>;
        Sat, 29 Jul 2023 18:16:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=12Xfr7A8tlzLNn1Wvoc1Q3agrWh5IZeDX34HPRRJUkQ=;
 b=Kvnuo6FoAgPCASF5tIeg/Iv1mi4otUxIBgmOM7dFCYUZbAQI8sDL8kJtfrCqXucqOO7WEg
 xRQrq7lQcl/GzY1QNRHziEvoWiqOoVeMPAz/kUHLck9dR7zmuHyZg9IYavbEaQF4Xa0bXB4Q
 p2u+6hPAmZava0sDmHZnALubCFETw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] libpcre2: patch CVE-2022-41409
Date: Sat, 29 Jul 2023 18:15:49 +0200
Message-Id: <20230729161549.1519627-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 16:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185054

From: Peter Marko <peter.marko@siemens.com>

Backport commit mentioned in NVD DB links.
https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2022-41409.patch     | 74 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
new file mode 100644
index 0000000000..882277ae73
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
@@ -0,0 +1,74 @@
+From 94e1c001761373b7d9450768aa15d04c25547a35 Mon Sep 17 00:00:00 2001
+From: Philip Hazel <Philip.Hazel@gmail.com>
+Date: Tue, 16 Aug 2022 17:00:45 +0100
+Subject: [PATCH] Diagnose negative repeat value in pcre2test subject line
+
+CVE: CVE-2022-41409
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ ChangeLog            | 3 +++
+ src/pcre2test.c      | 4 ++--
+ testdata/testinput2  | 3 +++
+ testdata/testoutput2 | 4 ++++
+ 4 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index eab50eb7..276eb57a 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -7,6 +7,9 @@ fully read in caseless matching.
+ 24. Fixed an issue affecting recursions in JIT caused by duplicated data
+ transfers.
+ 
++20. A negative repeat value in a pcre2test subject line was not being 
++diagnosed, leading to infinite looping.
++
+ 
+ Version 10.34 21-November-2019
+ ------------------------------
+diff --git a/src/pcre2test.c b/src/pcre2test.c
+index 08f86096..f6f5d66c 100644
+--- a/src/pcre2test.c
++++ b/src/pcre2test.c
+@@ -6700,9 +6700,9 @@ while ((c = *p++) != 0)
+       }
+ 
+     i = (int32_t)li;
+-    if (i-- == 0)
++    if (i-- <= 0)
+       {
+-      fprintf(outfile, "** Zero repeat not allowed\n");
++      fprintf(outfile, "** Zero or negative repeat not allowed\n");
+       return PR_OK;
+       }
+ 
+diff --git a/testdata/testinput2 b/testdata/testinput2
+index 655e519..14e00ed 100644
+--- a/testdata/testinput2
++++ b/testdata/testinput2
+@@ -5772,4 +5772,7 @@ a)"xI
+ /(a)?a/I
+     manm
+ 
++--
++    \[X]{-10}
++
+ # End of testinput2
+diff --git a/testdata/testoutput2 b/testdata/testoutput2
+index c733c12..958f246 100644
+--- a/testdata/testoutput2
++++ b/testdata/testoutput2
+@@ -17435,6 +17435,10 @@ Subject length lower bound = 1
+     manm
+  0: a
+ 
++--
++    \[X]{-10}
++** Zero or negative repeat not allowed
++
+ # End of testinput2
+ Error -70: PCRE2_ERROR_BADDATA (unknown error number)
+ Error -62: bad serialized data
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index 254badf6f6..3e1b001c32 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2
            file://pcre-cross.patch \
            file://CVE-2022-1586.patch \
 	    file://CVE-2022-1587.patch \
+	    file://CVE-2022-41409.patch \
 "
 
 SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
-- 
2.30.2


