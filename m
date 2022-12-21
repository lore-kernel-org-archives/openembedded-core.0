Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC4CC4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.25705.1671645356687858605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9D7F1O0;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u7so8074934plq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgNrS1NW5GaKRi3KNKOeW5LJeiIuLkdPqHXGjNak6AU=;
        b=Q9D7F1O0or8UVl95zv4dM5NZDL9kc4JhxSQ36tQq2+AoUp5lY7ep8vTox1+MArD1Qn
         zxMrXUzMwQO9l67t8QnhZxnpZF0RavDfkN4lU+p1WlaWabta/CGJbE3HG+RjCse5NDl2
         N5YDbqZFyLxS0za1Sah934sn3d3gOTDQUq5VnCnvYtSdcoM/yktS4LwnThfoZBZH6WB3
         yRGiMxFOTbwsKFEqj18+DdR/PX+aaP0m029aBZmzb9od9Yy1OuOsfrMjy740+6evIYZX
         iCvvmjOBucupgL4OeYNFIb4QNUXc5M8VjHmNLsm0qYe+ZMzzR70c6BjcgG4hKIx6lmdW
         GV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgNrS1NW5GaKRi3KNKOeW5LJeiIuLkdPqHXGjNak6AU=;
        b=dU3DoNYjDEbh7Uw+O51Py8HFtdI4slL+3QAoOkZ7igXOakZ1BaDrXYTuLPDaoFeCyG
         MGs2ivqiGlFVSJc0LWzdrlk+vtrlJ/vVXzIcfziBlavUemXwkmXAFTP+d99QnawAqY0T
         yLxiV16cusf/937k5KNHnMT+wGH8UOj2GCZlTV3wNI107/D9hVodCGh69BDEP6De3xPK
         p9oKU4bNwcK7ijH0C5zfcelwPg7EEcultSoLuSd4E59s5e+92tYuFv9eiE8aX3YT8lqv
         cS+h9z433rUg8fCt/4wzBLZ4504NfbI0+1iRnncVywBewwpWsCftvq3j0713s4AlKaCc
         bLkQ==
X-Gm-Message-State: AFqh2kqJmf1j5olxOIN0DY52hCKfDYkktkUTqJa0A/c3cYEpyk1vJvGQ
	xUQH8HJr9VE6tsG3nw7Vw98P4AsvQF4=
X-Google-Smtp-Source: AMrXdXsMhAgkTN4Dr8nNNTYG+rqA4oQLNjpNs6LnUPd7HlincEY/uLe58BJ4bBBto3s5vTxQCg1a6w==
X-Received: by 2002:a17:90a:9606:b0:219:f7e5:cb56 with SMTP id v6-20020a17090a960600b00219f7e5cb56mr3157452pjo.20.1671645359399;
        Wed, 21 Dec 2022 09:55:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/9] strace: Add knob to enable largefile support
Date: Wed, 21 Dec 2022 09:55:49 -0800
Message-Id: <20221221175551.1940464-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174932

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch | 27 ++++++++++++
 ...002-tests-Replace-off64_t-with-off_t.patch | 43 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.0.bb    |  2 +
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
new file mode 100644
index 0000000000..76ca7a76a8
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -0,0 +1,27 @@
+From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 15:54:27 -0800
+Subject: [PATCH] configure: Use autoconf macro to detect largefile support
+
+Adds --enable-largefile/--disable-largefile configure knobs
+where default is to detect the support
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4797b42dd..7d57fb254 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,6 +43,8 @@ AC_PROG_INSTALL
+ AC_PROG_RANLIB
+ AC_PROG_LN_S
+ 
++AC_SYS_LARGEFILE
++
+ AC_USE_SYSTEM_EXTENSIONS
+ AX_CODE_COVERAGE
+ 
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
new file mode 100644
index 0000000000..ce0428e977
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -0,0 +1,43 @@
+From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 15:56:13 -0800
+Subject: [PATCH] tests: Replace off64_t with off_t
+
+when _FILE_OFFSET_BITS=64 then off_t is 64bit wide, this also fixes
+build on musl where off64_t is not available without _LARGEFILE64_SOURCE
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/readahead.c        | 2 +-
+ tests/sync_file_range2.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/readahead.c b/tests/readahead.c
+index 10723785c..b9597e697 100644
+--- a/tests/readahead.c
++++ b/tests/readahead.c
+@@ -42,7 +42,7 @@ static const int fds[] = {
+ 	0x7fffffff,
+ };
+ 
+-static const off64_t offsets[] = {
++static const off_t offsets[] = {
+ 	-0x8000000000000000LL,
+ 	-0x5060708090a0b0c0LL,
+ 	-1LL,
+diff --git a/tests/sync_file_range2.c b/tests/sync_file_range2.c
+index 0f7c9e428..15a5fec71 100644
+--- a/tests/sync_file_range2.c
++++ b/tests/sync_file_range2.c
+@@ -20,8 +20,8 @@ int
+ main(void)
+ {
+ 	const int fd = -1;
+-	const off64_t offset = 0xdeadbeefbadc0ded;
+-	const off64_t nbytes = 0xfacefeedcafef00d;
++	const off_t offset = 0xdeadbeefbadc0ded;
++	const off_t nbytes = 0xfacefeedcafef00d;
+ 	const unsigned int flags = -1;
+ 
+ 	int rc = sync_file_range(fd, offset, nbytes, flags);
diff --git a/meta/recipes-devtools/strace/strace_6.0.bb b/meta/recipes-devtools/strace/strace_6.0.bb
index 4fa3589d15..7679235b01 100644
--- a/meta/recipes-devtools/strace/strace_6.0.bb
+++ b/meta/recipes-devtools/strace/strace_6.0.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
+           file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
+           file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
 SRC_URI[sha256sum] = "92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338"
 
-- 
2.39.0


