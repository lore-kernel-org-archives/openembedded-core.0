Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0350CC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 06:30:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.28894.1652077838404082132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 23:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hUctDu8E;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so16148851pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 23:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=9OYgZOUib9WIGnAi9X0mrkpjNtQc7I2nTEMfL3tFAkA=;
        b=hUctDu8EFXlyrGrr1tj8YT6ulLAI/rIdHr9+yiUcq4q1ou2ATj4VT6ECnjlxM5E/FA
         K/pdOpscMOCPg/8iyFw8phcsqlIzov5fsowc074b0+hsUPJiSAPsg8RerVNje3P0J71+
         T1Li70R32FJIugzyBsEZye3gybVlo+0Xfoy4D5fpUa+swdEiGzZXU5pqzDSk3MJfWV4B
         aCB1dE0iD6sX/D2C8TvoPcHhIIDsf1/TilNxwcEdQEmQap1vGJr05AP+d+nAHipXCl/w
         wzUMuHZtL3EIXwdRP8mCrF/iRhzs/g8nMSOyODMg6qUt9G1rKZU4ZTwY/vYaGXmtKB7T
         kO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=9OYgZOUib9WIGnAi9X0mrkpjNtQc7I2nTEMfL3tFAkA=;
        b=VCM95SwOTTepmR83UeaI4/B4qlDL0LjdfNmRXWDPAZZhc69QOHCkJnEfrUubMIvBI7
         3X6+Ywvp4+e7QF1QtPBICtEeQ3RaE3sBk32rO0VNZ/aTfUTvR9UtMPFTNu72X81NaoHI
         gWD3U7EQG8uKeixN9s4feaEoDRXMNyYC8LqG6qxBM5XSbYBRM1t31OM4Hh4Jw5bFXLcb
         C+VLH6CuTzRh7uJREFDhUdi9H2OUM20DrmGS/n02z8kowDjCtR9NePLLtVfeU/EGND+k
         rs5OvZyh/LAjJiKbcMQV9kwvdaV7el7ONezZwspjhHOwp9xvWfF6Z8qHzRToxDMObU6A
         JwqA==
X-Gm-Message-State: AOAM531v7OW9GxdJlDhyreXIzq+kp8C+1d+sc7RfrfQsMHt5Qr6VPOZc
	I6AEHCjA7inO8cEMnQ3lXT0Bji6F5dQvNw==
X-Google-Smtp-Source: 
 ABdhPJy0gmdwS9PjrJONFtY63LNghMCLCdeXpoUreQDQcGNPa//VaDJQQuwPf3oWVF84Fau/3OGcCw==
X-Received: by 2002:a17:902:e84f:b0:15e:8edc:dec9 with SMTP id
 t15-20020a170902e84f00b0015e8edcdec9mr14711481plg.78.1652077837713;
        Sun, 08 May 2022 23:30:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:2ea1:4baa:4dfb:c190:5e2a:472f])
        by smtp.gmail.com with ESMTPSA id
 m1-20020a17090aab0100b001cd4989fecesm11603895pjq.26.2022.05.08.23.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:30:37 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Subject: [meta][dunfell][PATCH] fribidi: Add fix for CVE-2022-25308,
 CVE-2022-25309 and CVE-2022-25310
Date: Mon,  9 May 2022 12:00:22 +0530
Message-Id: <20220509063022.12702-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 06:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165386

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patches to fix CVE-2022-25308, CVE-2022-25309 and CVE-2022-25310

CVE-2022-25308.patch
Link: https://github.com/fribidi/fribidi/commit/ad3a19e6372b1e667128ed1ea2f49919884587e1

CVE-2022-25309.patch
Link: https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd10a9c31ffea3b3

CVE-2022-25310.patch
Link:https://github.com/fribidi/fribidi/commit/175850b03e1af251d705c1d04b2b9b3c1c06e48f

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 .../fribidi/fribidi/CVE-2022-25308.patch      | 50 +++++++++++++++++++
 .../fribidi/fribidi/CVE-2022-25309.patch      | 31 ++++++++++++
 .../fribidi/fribidi/CVE-2022-25310.patch      | 30 +++++++++++
 meta/recipes-support/fribidi/fribidi_1.0.9.bb |  3 ++
 4 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
 create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch

diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch b/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
new file mode 100644
index 0000000000..8f2c2ade0e
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
@@ -0,0 +1,50 @@
+From ad3a19e6372b1e667128ed1ea2f49919884587e1 Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Thu, 17 Feb 2022 17:30:12 +0900
+Subject: [PATCH] Fix the stack buffer overflow issue
+
+strlen() could returns 0. Without a conditional check for len,
+accessing S_ pointer with len - 1 may causes a stack buffer overflow.
+
+AddressSanitizer reports this like:
+==1219243==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdce043c1f at pc 0x000000403547 bp 0x7ffdce0
+43b30 sp 0x7ffdce043b28
+READ of size 1 at 0x7ffdce043c1f thread T0
+    #0 0x403546 in main ../bin/fribidi-main.c:393
+    #1 0x7f226804e58f in __libc_start_call_main (/lib64/libc.so.6+0x2d58f)
+    #2 0x7f226804e648 in __libc_start_main_impl (/lib64/libc.so.6+0x2d648)
+    #3 0x4036f4 in _start (/tmp/fribidi/build/bin/fribidi+0x4036f4)
+
+Address 0x7ffdce043c1f is located in stack of thread T0 at offset 63 in frame
+    #0 0x4022bf in main ../bin/fribidi-main.c:193
+
+  This frame has 5 object(s):
+    [32, 36) 'option_index' (line 233)
+    [48, 52) 'base' (line 386)
+    [64, 65064) 'S_' (line 375) <== Memory access at offset 63 underflows this variable
+    [65328, 130328) 'outstring' (line 385)
+    [130592, 390592) 'logical' (line 384)
+
+This fixes https://github.com/fribidi/fribidi/issues/181
+
+CVE: CVE-2022-25308
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/ad3a19e6372b1e667128ed1ea2f49919884587e1]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ bin/fribidi-main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/fribidi-main.c b/bin/fribidi-main.c
+index 3cf9fe1..3ae4fb6 100644
+--- a/bin/fribidi-main.c
++++ b/bin/fribidi-main.c
+@@ -390,7 +390,7 @@ FRIBIDI_END_IGNORE_DEPRECATIONS
+ 	    S_[sizeof (S_) - 1] = 0;
+ 	    len = strlen (S_);
+ 	    /* chop */
+-	    if (S_[len - 1] == '\n')
++	    if (len > 0 && S_[len - 1] == '\n')
+ 	      {
+ 		len--;
+ 		S_[len] = '\0';
diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch b/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
new file mode 100644
index 0000000000..0efba3d05c
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
@@ -0,0 +1,31 @@
+From f22593b82b5d1668d1997dbccd10a9c31ffea3b3 Mon Sep 17 00:00:00 2001
+From: Dov Grobgeld <dov.grobgeld@gmail.com>
+Date: Fri, 25 Mar 2022 09:09:49 +0300
+Subject: [PATCH] Protected against garbage in the CapRTL encoder
+
+CVE: CVE-2022-25309
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd10a9c31ffea3b3]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ lib/fribidi-char-sets-cap-rtl.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fribidi-char-sets-cap-rtl.c b/lib/fribidi-char-sets-cap-rtl.c
+index b0c0e4a..f74e010 100644
+--- a/lib/fribidi-char-sets-cap-rtl.c
++++ b/lib/fribidi-char-sets-cap-rtl.c
+@@ -232,7 +232,12 @@ fribidi_cap_rtl_to_unicode (
+ 	    }
+ 	}
+       else
+-	us[j++] = caprtl_to_unicode[(int) s[i]];
++      {
++        if ((int)s[i] < 0)
++          us[j++] = '?';
++        else
++          us[j++] = caprtl_to_unicode[(int) s[i]];
++      }
+     }
+ 
+   return j;
diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch b/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
new file mode 100644
index 0000000000..d79a82d648
--- /dev/null
+++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
@@ -0,0 +1,30 @@
+From 175850b03e1af251d705c1d04b2b9b3c1c06e48f Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Thu, 17 Feb 2022 19:06:10 +0900
+Subject: [PATCH] Fix SEGV issue in fribidi_remove_bidi_marks
+
+Escape from fribidi_remove_bidi_marks() immediately if str is null.
+
+This fixes https://github.com/fribidi/fribidi/issues/183
+
+CVE: CVE-2022-25310
+Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/175850b03e1af251d705c1d04b2b9b3c1c06e48f]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ lib/fribidi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/fribidi.c b/lib/fribidi.c
+index f5da0da..70bdab2 100644
+--- a/lib/fribidi.c
++++ b/lib/fribidi.c
+@@ -74,7 +74,7 @@ fribidi_remove_bidi_marks (
+   fribidi_boolean status = false;
+ 
+   if UNLIKELY
+-    (len == 0)
++    (len == 0 || str == NULL)
+     {
+       status = true;
+       goto out;
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
index ac9ef88e27..62b7d72812 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
@@ -10,6 +10,9 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
+           file://CVE-2022-25308.patch \
+           file://CVE-2022-25309.patch \
+           file://CVE-2022-25310.patch \
            "
 SRC_URI[md5sum] = "1b767c259c3cd8e0c8496970f63c22dc"
 SRC_URI[sha256sum] = "c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7ad90a054d36e0c7"
-- 
2.17.1


