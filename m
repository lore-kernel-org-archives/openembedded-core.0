Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C5FC433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:02 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.409.1652293194705572555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cZrgQ9gI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id m12so2684919plb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+8ha8tRJgsQxZln4GAPXKYrBYXvK+fY9K3AH+06ObcQ=;
        b=cZrgQ9gIx2gq8tfUInATW/fcnNSvx8cz7/lX6EBBEmKR4bM9JoY5vP3zBDOdqA4fF7
         PRNjcuIJkAVXvOFC+kwKt+BsnDrQtDGGrAJ4ZYHI1aZjqJqc9hulBmR5/K+koPkxTTuS
         q9UlRlJe5qXxZfDW2BWm72bkfBCQFi/l4J3vGgu9vs2XwdikhwGCpGk5nbS6Da+z/f6+
         08Vcmake/wnJmM8oek8apJlYuZBweNQBt+nOc+6+zYThVu8v4DyP7czC//b35WFcgoUW
         3GGlToHJopU7tpss6HR3iF749E+/llOKl/LFiF/U4eJQP6W9uDV3EIIcMaTxJtAiKRJB
         VJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8ha8tRJgsQxZln4GAPXKYrBYXvK+fY9K3AH+06ObcQ=;
        b=DOhOXOwwfLZdWiad7q9zBF+sZI9e6eTqpK25/VDIr6PIdy4lIKzY5NjJy3nmk/umE8
         LfwyEPAnThh5kApN3gLPhZWvM2CZwAOZ2lT3gHyVnYQpvqdIiSr4qBb8pOnXioxHGyc8
         nGeyoCAvbXnMkDDe/TOxGD3sJxnl1cgTr1ilSH8mx9m7WVTCEw4Q+TENPKGoCho2N70K
         VSsKETIIC5MgmMKrlKAEcAjGspCFz6bMcS3Fx6KnOulBtcvLfyEzfGoJ7rxX4wGfQ9pl
         FI2w5oXbeFwO1Y0gcapdxUFWXSHAjI5pd6Y2JPLdYXyG/WoZS3IlxuRMSp3T/cEd8HD/
         NAWw==
X-Gm-Message-State: AOAM5311rYknIXXBGKVyS/wh3S+lYZEOr67/dqoSZcenvTPTeId4ke0T
	ZBSI3qc00VJjmfSyq40sX8+fi9AQa9j2+7dG
X-Google-Smtp-Source: 
 ABdhPJxN+AfGS0RWhC7ClkAyOGNhRx6kpS+E0+wh2xj1wowAaqqNqTAIi8StsRNupNL5J9+1PCb6ow==
X-Received: by 2002:a17:90b:1894:b0:1dc:103a:3ba2 with SMTP id
 mn20-20020a17090b189400b001dc103a3ba2mr6581489pjb.181.1652293193380;
        Wed, 11 May 2022 11:19:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.19.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:19:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] fribidi: Add fix for CVE-2022-25308,
 CVE-2022-25309 and CVE-2022-25310
Date: Wed, 11 May 2022 08:19:20 -1000
Message-Id: 
 <1c96b8af59e105724db884967a982bb5a47a7eb1.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165507

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patches to fix CVE-2022-25308, CVE-2022-25309 and CVE-2022-25310

CVE-2022-25308.patch
Link: https://github.com/fribidi/fribidi/commit/ad3a19e6372b1e667128ed1ea2f49919884587e1

CVE-2022-25309.patch
Link: https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd10a9c31ffea3b3

CVE-2022-25310.patch
Link:https://github.com/fribidi/fribidi/commit/175850b03e1af251d705c1d04b2b9b3c1c06e48f

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


