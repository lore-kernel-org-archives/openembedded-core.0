Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3448AC4167D
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12307.1668951094635916985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pS1/Rt+w;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id g12so16197835wrs.10
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY8J1CpSTcoeCjeQeh3tWkykFrZisW96BB1SrDPBElU=;
        b=pS1/Rt+wtO4h+ZUC82eMbsWYszz8HN2A+wuRtqc8ADSeLCB58aigQ0yhoJoeApcPP0
         WnshFkmTA5dz0rOQUA5q3m2KMdDxLCkj2e3dTsXOmhHiDNkfj3Ppwon2YC82SCX3DvhJ
         Q2yYrPIkNaichDBobB1+5ykEcsxX5ECpnUsishzXpdVfxfHG0x5XZ96Dj5LjWsL9RI6l
         3lPZHDMFj++MX8gm4jojnAuMGhOvA2DIifzE7UqEjzOLB2YFE5Q3iBRvwtM7+F166iyR
         RVF6+X7N995zGzX+gOHt6y+CkOLzYPo55r69paC4VNNY+9Mr1ERILmC0vS0uqtErZwOt
         Kg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY8J1CpSTcoeCjeQeh3tWkykFrZisW96BB1SrDPBElU=;
        b=2hpoyq7EO94D98xyxzlbCJJqStkpoz1jnV6eqQz7NLVzBtwoTOeKxm0hJ0LBWGfREd
         wXQZiOnV4fZOJKXJwrYQB8bbX0rYCdwHX8LRxVdiR2WeqkLUrWgxuKRMXMc3m6nOt/Ly
         jOscd/MD7jhsp3gwjJR4R/H/3UsZA0wZZtYwHJwzeVsXL/RcRUBO1+dKKhZcvoi9wERm
         CuXx+3YzPSKIq73oZq6OczA2SaInCwPGxHn06G8YbEOXyppnt+gDQSNTgMuvRVcc3P4l
         GbPGIC8lHIRgcCGYdQIJXJr7t1ZVk+L5X9yNbHgcOCSQbTNJiZB9BVmxzYipqcNboU4T
         8AsQ==
X-Gm-Message-State: ANoB5pmEwbPrR+hXt5miB4ULfdDlKwYKmjIJLueEn8ZXQRJTZhmPdquR
	1uqgLJLFQe2QWF0xbMNV2oMHaAQ9R+g=
X-Google-Smtp-Source: AA0mqf7SFbbi6cSJasi0m/gJN8zV9cE/OWtsNq7zaukuc/ksZ/EYieZ6IIN4Yi7pK9xy9RqLlt7NDQ==
X-Received: by 2002:a5d:6749:0:b0:235:58b7:b4aa with SMTP id l9-20020a5d6749000000b0023558b7b4aamr1758451wrw.517.1668951093049;
        Sun, 20 Nov 2022 05:31:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/17] shadow: update 4.12.3 -> 4.13
Date: Sun, 20 Nov 2022 14:31:13 +0100
Message-Id: <20221120133122.2464634-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173589

Drop
0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
(issue fixed upstream)
0001-shadow-use-relaxed-usernames.patch
(merged upstream)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch |   6 +-
 ...f-message-when-not-in-place-eg.-musl.patch |  27 -----
 .../0001-shadow-use-relaxed-usernames.patch   | 104 ------------------
 ...nexpected-open-failure-in-chroot-env.patch |   6 +-
 meta/recipes-extended/shadow/shadow.inc       |   4 +-
 .../{shadow_4.12.3.bb => shadow_4.13.bb}      |   0
 6 files changed, 7 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
 rename meta/recipes-extended/shadow/{shadow_4.12.3.bb => shadow_4.13.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index 628db42136..fa1532c831 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,4 @@
-From 8b845fff891798a03bdf21354b52e4487c2c0200 Mon Sep 17 00:00:00 2001
+From 85d0444229ee3d14fefcf10d093f49c862826f82 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 14 Apr 2022 23:11:53 +0000
 Subject: [PATCH] Disable use of syslog for shadow-native tools
@@ -17,10 +17,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5dcae19..b2c58f5 100644
+index 924254a..603af81 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
+@@ -191,7 +191,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
  	[Path to passwd program.])
  
  dnl XXX - quick hack, should disappear before anyone notices :).
diff --git a/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
deleted file mode 100644
index 21c9a1415c..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 11290e897a49adddee215833944a518443d9b0d6 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Wed, 24 Aug 2022 00:54:47 +0200
-Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
-
-Upstream-Status: Inappropriate [issue reported at https://github.com/shadow-maint/shadow/issues/557]
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
----
- lib/nss.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/nss.c b/lib/nss.c
-index 06fa48e..44245da 100644
---- a/lib/nss.c
-+++ b/lib/nss.c
-@@ -59,7 +59,7 @@ void nss_init(const char *nsswitch_path) {
- 	//   subid:	files
- 	nssfp = fopen(nsswitch_path, "r");
- 	if (!nssfp) {
--		fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
-+		//fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
- 		atomic_store(&nss_init_completed, true);
- 		return;
- 	}
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch b/meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
deleted file mode 100644
index 6c7abcef1d..0000000000
--- a/meta/recipes-extended/shadow/files/0001-shadow-use-relaxed-usernames.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From b182c52d63bea0f08e1befcec5c3797dd97cdef5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 16 Aug 2022 13:46:22 +0200
-Subject: [PATCH] shadow: use relaxed usernames
-
-The groupadd from shadow does not allow upper case group names, the
-same is true for the upstream shadow. But distributions like
-Debian/Ubuntu/CentOS has their own way to cope with this problem,
-this patch is picked up from CentOS release 7.0 to relax the usernames
-restrictions to allow the upper case group names, and the relaxation is
-POSIX compliant because POSIX indicate that usernames are composed of
-characters from the portable filename character set [A-Za-z0-9._-].
-
-Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/551]
-
-Signed-off-by: Shan Hai <shan.hai@windriver.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- libmisc/chkname.c  | 29 ++++++++++++++++++-----------
- man/groupadd.8.xml |  6 ------
- man/useradd.8.xml  |  6 ------
- 3 files changed, 18 insertions(+), 23 deletions(-)
-
-diff --git a/libmisc/chkname.c b/libmisc/chkname.c
-index cb002a14..c0306c5a 100644
---- a/libmisc/chkname.c
-+++ b/libmisc/chkname.c
-@@ -32,21 +32,28 @@ static bool is_valid_name (const char *name)
- 	}
- 
- 	/*
--	 * User/group names must match [a-z_][a-z0-9_-]*[$]
--	 */
--
--	if (('\0' == *name) ||
--	    !((('a' <= *name) && ('z' >= *name)) || ('_' == *name))) {
-+         * User/group names must match gnu e-regex:
-+         *    [a-zA-Z0-9_.][a-zA-Z0-9_.-]{0,30}[a-zA-Z0-9_.$-]?
-+         *
-+         * as a non-POSIX, extension, allow "$" as the last char for
-+         * sake of Samba 3.x "add machine script"
-+         */
-+	if ( ('\0' == *name) ||
-+             !((*name >= 'a' && *name <= 'z') ||
-+               (*name >= 'A' && *name <= 'Z') ||
-+               (*name >= '0' && *name <= '9') ||
-+               (*name == '_') || (*name == '.') 
-+	      )) {
- 		return false;
- 	}
- 
- 	while ('\0' != *++name) {
--		if (!(( ('a' <= *name) && ('z' >= *name) ) ||
--		      ( ('0' <= *name) && ('9' >= *name) ) ||
--		      ('_' == *name) ||
--		      ('-' == *name) ||
--		      ( ('$' == *name) && ('\0' == *(name + 1)) )
--		     )) {
-+                if (!(  (*name >= 'a' && *name <= 'z') ||
-+                        (*name >= 'A' && *name <= 'Z') ||
-+                        (*name >= '0' && *name <= '9') ||
-+                        (*name == '_') || (*name == '.') || (*name == '-') ||
-+                        (*name == '$' && *(name + 1) == '\0') 
-+                     )) {
- 			return false;
- 		}
- 	}
-diff --git a/man/groupadd.8.xml b/man/groupadd.8.xml
-index 26671f92..3eacaa09 100644
---- a/man/groupadd.8.xml
-+++ b/man/groupadd.8.xml
-@@ -63,12 +63,6 @@
-       values from the system. The new group will be entered into the system
-       files as needed.
-     </para>
--     <para>
--       Groupnames must start with a lower case letter or an underscore,
--       followed by lower case letters, digits, underscores, or dashes.
--       They can end with a dollar sign.
--       In regular expression terms: [a-z_][a-z0-9_-]*[$]?
--     </para>
-      <para>
-        Groupnames may only be up to &GROUP_NAME_MAX_LENGTH; characters long.
-      </para>
-diff --git a/man/useradd.8.xml b/man/useradd.8.xml
-index c7f95b47..e056d141 100644
---- a/man/useradd.8.xml
-+++ b/man/useradd.8.xml
-@@ -691,12 +691,6 @@
-       the user account creation request.
-     </para>
- 
--    <para>
--      Usernames must start with a lower case letter or an underscore,
--      followed by lower case letters, digits, underscores, or dashes.
--      They can end with a dollar sign.
--      In regular expression terms: [a-z_][a-z0-9_-]*[$]?
--    </para>
-     <para>
-       Usernames may only be up to 32 characters long.
-     </para>
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 173e8a937d..85d9175105 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From d767f776e631f1493fd7b266f2026d630ecf70fe Mon Sep 17 00:00:00 2001
+From 21583da072aa66901d859ac00ce209bac87ddecc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 9e0fde6..7c3a1da 100644
+index 9a02ce1..61384ec 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -624,10 +624,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -616,10 +616,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5656a375b7..2c70a2d00e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,7 +12,6 @@ DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://0001-shadow-use-relaxed-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
            "
@@ -25,12 +24,11 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
-           file://0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
-SRC_URI[sha256sum] = "f525154adc5605e4ebf03d3e7ee8be4d7f3c7cf9df2c2244043406b6eefca2da"
+SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
 
 
 # Additional Policy files for PAM
diff --git a/meta/recipes-extended/shadow/shadow_4.12.3.bb b/meta/recipes-extended/shadow/shadow_4.13.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.12.3.bb
rename to meta/recipes-extended/shadow/shadow_4.13.bb
-- 
2.30.2


