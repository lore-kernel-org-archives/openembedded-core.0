Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD72C32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.471.1660894071213018330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fwp5mYFF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id n4so4154386wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hZmIFv2yCy49mQA0McQJFv9FCLUhTAF8j4wWnLpnWxE=;
        b=Fwp5mYFFBf7i2W1u4QdjCRWf4pVMgU3PCMKKFgZEFKTVVw/3XonR+GGIc7WkOAC5tp
         D0Vgshh2UncubhSP45RvJZk4QWFfCUnE6jZ34I+jALx6Jn/G8sy1wOi7EeocZP5NCqA9
         CP5bxHZHCEk20XktxVfYaLdrMg3FxzMlGkVCI7484xwbMfnT7c9ET2JAnXLkPsTfeQoa
         jkp4+lrVmQ0WlhmDDg50aoDZ8imeT9QEfqg2MqUGmqWwhAVuuHAV2TlDB1nTIqBzIxWz
         amWVv86vt5tTLBq4X98Q+7ktc5sbVF7tD9jyBeaPdgpl0wxW/yocdwrMeMlUqYYM2Ns3
         YprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hZmIFv2yCy49mQA0McQJFv9FCLUhTAF8j4wWnLpnWxE=;
        b=Qtp1hIebyh0OEGK9YkK5ktxOv659LwYnsZk7SRsmSRk1Ve9kr0zmSuseKnoL9id3Se
         H0r8W8g293UhoOTdREoKed79xBzHj23IP1sLYDYOOj8Gf6Qo0lpd1DiTr7qvxm3QXdL7
         Z9PDwwCvbUSJIPPexcq5wCg0wDfOgtPRJFFtbq2D7Ad5llc4CeJEBGwCGBTfd1M5GLnU
         e5UWclK8GheeBMW6wVKAU2Z0L0UBknPHHP1t3GD6/yf+zgggVmmA6afRrGP6XWVIWUdk
         3B75NyiZV5vlAeglzZXHk1TkM0sYVidi+U3Jw5vVxQo0hGIxLt0LDusXQRc+ipMB1fw2
         0vxQ==
X-Gm-Message-State: ACgBeo2azBRZwBZmzXhidZ7N8pefyPeQZ3lS1BV162Rnsx0AHh/0yDK4
	1hPuJjrcmd+e1wzmUUUT11GMTYeagSw=
X-Google-Smtp-Source: 
 AA6agR6tTDomFkt9maEiu0pK8z1QYLVJUEAaUOE4juv3DVAxGM5sJmUSO9bXB1OHmaFGYZnqTmmDpg==
X-Received: by 2002:a05:6000:69a:b0:223:664f:15b8 with SMTP id
 bo26-20020a056000069a00b00223664f15b8mr3617930wrb.356.1660894069689;
        Fri, 19 Aug 2022 00:27:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/42] shadow: update 4.11.1 -> 4.12.1
Date: Fri, 19 Aug 2022 09:26:50 +0200
Message-Id: <20220819072727.2236928-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169576

Combine two username relaxing patches into one, rebase, and submit upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...> 0001-shadow-use-relaxed-usernames.patch} | 47 ++++++++-----------
 .../shadow-4.1.3-dots-in-usernames.patch      | 27 -----------
 meta/recipes-extended/shadow/shadow.inc       |  8 ++--
 .../{shadow_4.11.1.bb => shadow_4.12.1.bb}    |  0
 4 files changed, 23 insertions(+), 59 deletions(-)
 rename meta/recipes-extended/shadow/files/{shadow-relaxed-usernames.patch => 0001-shadow-use-relaxed-usernames.patch} (76%)
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
 rename meta/recipes-extended/shadow/{shadow_4.11.1.bb => shadow_4.12.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch b/meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
similarity index 76%
rename from meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
rename to meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
index cc833362e9..6c7abcef1d 100644
--- a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
+++ b/meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
@@ -1,6 +1,6 @@
-From ca472d6866e545aaa70a70020e3226f236a8aafc Mon Sep 17 00:00:00 2001
-From: Shan Hai <shan.hai@windriver.com>
-Date: Tue, 13 Sep 2016 13:45:46 +0800
+From b182c52d63bea0f08e1befcec5c3797dd97cdef5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 16 Aug 2022 13:46:22 +0200
 Subject: [PATCH] shadow: use relaxed usernames
 
 The groupadd from shadow does not allow upper case group names, the
@@ -11,21 +11,21 @@ restrictions to allow the upper case group names, and the relaxation is
 POSIX compliant because POSIX indicate that usernames are composed of
 characters from the portable filename character set [A-Za-z0-9._-].
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/551]
 
 Signed-off-by: Shan Hai <shan.hai@windriver.com>
-
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
- libmisc/chkname.c  | 30 ++++++++++++++++++------------
+ libmisc/chkname.c  | 29 ++++++++++++++++++-----------
  man/groupadd.8.xml |  6 ------
- man/useradd.8.xml  |  8 +-------
- 3 files changed, 19 insertions(+), 25 deletions(-)
+ man/useradd.8.xml  |  6 ------
+ 3 files changed, 18 insertions(+), 23 deletions(-)
 
 diff --git a/libmisc/chkname.c b/libmisc/chkname.c
-index 90f185c..65762b4 100644
+index cb002a14..c0306c5a 100644
 --- a/libmisc/chkname.c
 +++ b/libmisc/chkname.c
-@@ -55,22 +55,28 @@ static bool is_valid_name (const char *name)
+@@ -32,21 +32,28 @@ static bool is_valid_name (const char *name)
  	}
  
  	/*
@@ -54,7 +54,6 @@ index 90f185c..65762b4 100644
 -		      ( ('0' <= *name) && ('9' >= *name) ) ||
 -		      ('_' == *name) ||
 -		      ('-' == *name) ||
--		      ('.' == *name) ||
 -		      ( ('$' == *name) && ('\0' == *(name + 1)) )
 -		     )) {
 +                if (!(  (*name >= 'a' && *name <= 'z') ||
@@ -67,13 +66,13 @@ index 90f185c..65762b4 100644
  		}
  	}
 diff --git a/man/groupadd.8.xml b/man/groupadd.8.xml
-index 1e58f09..d804b61 100644
+index 26671f92..3eacaa09 100644
 --- a/man/groupadd.8.xml
 +++ b/man/groupadd.8.xml
-@@ -272,12 +272,6 @@
- 
-    <refsect1 id='caveats'>
-      <title>CAVEATS</title>
+@@ -63,12 +63,6 @@
+       values from the system. The new group will be entered into the system
+       files as needed.
+     </para>
 -     <para>
 -       Groupnames must start with a lower case letter or an underscore,
 -       followed by lower case letters, digits, underscores, or dashes.
@@ -84,19 +83,10 @@ index 1e58f09..d804b61 100644
         Groupnames may only be up to &GROUP_NAME_MAX_LENGTH; characters long.
       </para>
 diff --git a/man/useradd.8.xml b/man/useradd.8.xml
-index a16d730..c0bd777 100644
+index c7f95b47..e056d141 100644
 --- a/man/useradd.8.xml
 +++ b/man/useradd.8.xml
-@@ -366,7 +366,7 @@
- 	</term>
- 	<listitem>
- 	  <para>
--	    Do no create the user's home directory, even if the system
-+	    Do not create the user's home directory, even if the system
- 	    wide setting from <filename>/etc/login.defs</filename>
- 	    (<option>CREATE_HOME</option>) is set to
- 	    <replaceable>yes</replaceable>.
-@@ -660,12 +660,6 @@
+@@ -691,12 +691,6 @@
        the user account creation request.
      </para>
  
@@ -109,3 +99,6 @@ index a16d730..c0bd777 100644
      <para>
        Usernames may only be up to 32 characters long.
      </para>
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch b/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
deleted file mode 100644
index a7bb0a9290..0000000000
--- a/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-# commit message copied from openembedded:
-#    commit 246c80637b135f3a113d319b163422f98174ee6c
-#    Author: Khem Raj <raj.khem@gmail.com>
-#    Date:   Wed Jun 9 13:37:03 2010 -0700
-#
-#    shadow-4.1.4.2: Add patches to support dots in login id.
-#    
-#    Signed-off-by: Khem Raj <raj.khem@gmail.com>
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-08-11
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: shadow-4.1.4.2/libmisc/chkname.c
-===================================================================
---- shadow-4.1.4.2.orig/libmisc/chkname.c	2009-04-28 12:14:04.000000000 -0700
-+++ shadow-4.1.4.2/libmisc/chkname.c	2010-06-03 17:43:20.638973857 -0700
-@@ -61,6 +61,7 @@ static bool is_valid_name (const char *n
- 		      ( ('0' <= *name) && ('9' >= *name) ) ||
- 		      ('_' == *name) ||
- 		      ('-' == *name) ||
-+		      ('.' == *name) ||
- 		      ( ('$' == *name) && ('\0' == *(name + 1)) )
- 		     )) {
- 			return false;
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index f5fdf436f7..fbb1d395ff 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
 DEPENDS = "virtual/crypt"
 
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
-SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz \
-           file://shadow-4.1.3-dots-in-usernames.patch \
+SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
+           file://0001-shadow-use-relaxed-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://shadow-relaxed-usernames.patch \
            file://useradd \
            "
 
@@ -30,8 +29,7 @@ SRC_URI:append:class-native = " \
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
-
-SRC_URI[sha256sum] = "f262089be6a1011d50ec7849e14571b7b2e788334368f3dccb718513f17935ed"
+SRC_URI[sha256sum] = "9fdb73b5d2b44e8ba9fcee1b4493ac75dd5040bda35b9ac8b06570cd192e7ee3"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.11.1.bb b/meta/recipes-extended/shadow/shadow_4.12.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.11.1.bb
rename to meta/recipes-extended/shadow/shadow_4.12.1.bb
-- 
2.30.2


