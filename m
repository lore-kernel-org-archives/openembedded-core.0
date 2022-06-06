Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771D1C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.31135.1654516905940517049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LXKCeD7F;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id a15so11033541wrh.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RojXnKoDB9ACYSwBFxX6VTJBBdd3t1UNaxVOJJPM+3I=;
        b=LXKCeD7F9oFtB5NzIPBBsxnxeB0jPjjux9t9CxtqgmeUcD4yxdSzKWfB62uJinXTmB
         dsda3UDhjz2rSqwGhzzRittkJktHhXN62WP8bqz5b2BA0WjyF1CnY2eErgE2cFmzQYAz
         /hGNGubG5XP7shcnmG66CidW4v58tDZpU6M7asHD19LzOb5aj5Xirw2IUMd5N+YPJvmO
         QtyCkp8+l0tO4dQPsUZa4lMNUBe/2STXQSnpwcDevzMJPyA4wPDF+5odpq35SPBAmG+i
         gJgjvzLM+/mjM5KaHTAFqtZiGNXiyFvfIb2Q1AH63AaRi4WIfbPO1GH/ANdo6t61DvJD
         YSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RojXnKoDB9ACYSwBFxX6VTJBBdd3t1UNaxVOJJPM+3I=;
        b=BpgWFr0NiEu8nnoHl7cuXKZQzmoykzPcrQhiwCoMBTLBD16RuBe8RbcQrB+COoqU3E
         APDGa+kk0Vr5XStt8bo6Be4Q4+5KoX6cj+5AMYpsxIUSeLwiHXKaOjj09UFw9usiD2+4
         iPyrR8TOMyUlaJDXXXXvTh6tSeFZN5+2MUFHQ5kI4qC59vR1sH8/o6Iopf/AyOrY/yR1
         AHjg/6wFjhNxGF1NYfbNBeEFJk/6Byzacj9Fqsc2bQDUuD9ZhEcuJ92+PDHq5IrtH+jF
         ojtVDp6DpK3APzu5z3fiWRBErr7eN22oYpFSBkHBtf69PPIKqNyFS+1B4GdOUwnijEBM
         Oipg==
X-Gm-Message-State: AOAM531wQEY7QBlAmoTVwp9mBeMtNtPQVHTNxyd9ZiUSnOh22u9mC1NH
	krLjI3l4nocX/6zZ7dcA3gCdVI5a/n8zUw==
X-Google-Smtp-Source: 
 ABdhPJxrKQf1nbIRUHaxpmQiHHC5Bez5NZHDTImq2qGTvEUz4KDCLjTPr7xK1dectHgVni+kTXeoCw==
X-Received: by 2002:adf:fec3:0:b0:216:ea3d:b118 with SMTP id
 q3-20020adffec3000000b00216ea3db118mr9676299wrs.517.1654516904521;
        Mon, 06 Jun 2022 05:01:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/21] ltp: upgrade 20220121 -> 20220527
Date: Mon,  6 Jun 2022 14:01:22 +0200
Message-Id: <20220606120126.3381438-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166610

Disable stack protection as newly added kvm tests won't build with it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/security_flags.inc   |  1 +
 ...sh-sort-filelist-for-reproducibility.patch | 28 -------------------
 .../ltp/{ltp_20220121.bb => ltp_20220527.bb}  |  3 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
 rename meta/recipes-extended/ltp/{ltp_20220121.bb => ltp_20220527.bb} (97%)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 8374cb8544..2972f05b4e 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -61,6 +61,7 @@ TARGET_LDFLAGS:append:class-cross-canadian = " ${SECURITY_LDFLAGS}"
 SECURITY_STACK_PROTECTOR:pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR:pn-glibc = ""
 SECURITY_STACK_PROTECTOR:pn-glibc-testsuite = ""
+SECURITY_STACK_PROTECTOR:pn-ltp = ""
 # All xorg module drivers need to be linked this way as well and are
 # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS:pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
diff --git a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch b/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
deleted file mode 100644
index e8d9f212a9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4aad23f208cc7725cd61bbe5aaadb9994c794cd0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 26 Jan 2022 20:58:46 +0100
-Subject: [PATCH] metadata/parse.sh: sort filelist for reproducibility
-
-find does not guarantee the order of the files.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/907]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- metadata/parse.sh | 2 +-
-
-diff --git a/metadata/parse.sh b/metadata/parse.sh
-index b43d024c68..1811665bfe 100755
---- a/metadata/parse.sh
-+++ b/metadata/parse.sh
-@@ -29,7 +29,7 @@ echo ' "tests": {'
- 
- first=1
- 
--for test in `find testcases/ -name '*.c'`; do
-+for test in `find testcases/ -name '*.c'|sort`; do
- 	a=$($top_builddir/metadata/metaparse -Iinclude -Itestcases/kernel/syscalls/utils/ "$test")
- 	if [ -n "$a" ]; then
- 		if [ -z "$first" ]; then
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20220121.bb
rename to meta/recipes-extended/ltp/ltp_20220527.bb
index 8a13dcf9d0..b136c83860 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -22,11 +22,10 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "b0561ad8d9ee9fe1244b5385e941eb65a21e91a1"
+SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
            "
 
-- 
2.30.2


