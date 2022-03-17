Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389EDC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 22:38:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.3033.1647556729487522469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 15:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AUJhkWWm;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 kx13-20020a17090b228d00b001c6715c9847so4554408pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 15:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9jRN3zlEJRFoc7Myi0a/fiUwhOtByyHdY9V7VluJB4=;
        b=AUJhkWWmESBRkmf38KVLJ1VHjVY5z2YvI4cm+wic9QWewpNMtFEi3CYAbMBU6wUbE3
         mC3rok06GVlj90vfM53lCknL+rXTZszZsDWOn7tgsLVToCj83OgeyyaI6/qYAQRScGHv
         WjwhWR117d6qPI9jFGI8MjgPxUHA/5cHkFNQtVrmrscIZRd7fADFEmQkP+5rGle04to8
         pvD2NFNvyZTcyaDgW9kwX9hBuGinxxgIVTHGegUw0alaP8xR7E19JjeLu0DioOWroPdR
         Jpf+PxS0iTzo1hipxsYgFSNcoJVloi79nBeeT6V9zcUU8TY9+O2hX8bm1lv+xuofW5Nm
         aANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9jRN3zlEJRFoc7Myi0a/fiUwhOtByyHdY9V7VluJB4=;
        b=Eh4EPvf/GW/bHB3f3mpxXN/9NfMULFxHuqTPh7IDXUqSE3mEwP/yJtW/0TkkRReCgH
         KVLc1moVfCy6EoOXWqaVF+PvnsUULwHRi/SpRo3nI9j9xRrVePtVfJF/PsrcvZS4DScu
         bgbXe52uidn0/01qKaRuNlfyPN5teeFtCrEpjHJu/wwa6t2QlYqvNGHoZ0iEZHvLzmPY
         6iqzuQrjpqapp3RR+yu0E4VIh+nZnnA2nqHXfyAKsQSr7DCIO0xl2EnDTMJ1nfb5YnHK
         8b92LP3a2Qa1nZoIw2LjSobihkiNfsSp8rk92xNeeajMNuKWXWx9IWMSEgXL70PEmNa+
         92vA==
X-Gm-Message-State: AOAM533Yb0dS19CHnAfBdBdRZm+cFf4TKYHzDPvcKConr/YDenpBM1bh
	Iajof3ENJoLcAK8WrRyvuAnT0+YcgU9cxw==
X-Google-Smtp-Source: 
 ABdhPJziuf4/n4ypifGlscUSQ+SbQ2lhXeH8RcKcD9rWLINSd/O1pY1mfKkL0wujRDdFWVstvctKTw==
X-Received: by 2002:a17:90b:1e47:b0:1bf:6d79:b1fd with SMTP id
 pi7-20020a17090b1e4700b001bf6d79b1fdmr18658333pjb.49.1647556728707;
        Thu, 17 Mar 2022 15:38:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 a20-20020a056a000c9400b004f7ab5a44ebsm8845513pfv.18.2022.03.17.15.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 15:38:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssh: Default to not using sandbox when cross compiling
Date: Thu, 17 Mar 2022 15:38:45 -0700
Message-Id: <20220317223845.3691239-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 22:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163437

backport a patch to fix sandboxing issues seen on ppc32 and also on
riscv32 [1]

[1] https://bugzilla.mindrot.org/show_bug.cgi?id=3398

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-using-sandbox-when-cross-compiling.patch | 33 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  4 +--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch b/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
new file mode 100644
index 00000000000..0241c290ac4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
@@ -0,0 +1,33 @@
+From 56194e9a6043873b0ec84f9d15c6e4caca2580c8 Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Tue, 8 Mar 2022 20:04:06 +1100
+Subject: [PATCH] Default to not using sandbox when cross compiling.
+
+On most systems poll(2) does not work when the number of FDs is reduced
+with setrlimit, so assume it doesn't when cross compiling and we can't
+run the test.  bz#3398.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patch/?id=8cf5275452a950869cb90eeac7d220b01f77b12e]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 17fb1e6..a165d08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3574,8 +3574,8 @@ AC_RUN_IFELSE(
+ 	 select_works_with_rlimit=yes],
+ 	[AC_MSG_RESULT([no])
+ 	 select_works_with_rlimit=no],
+-	[AC_MSG_WARN([cross compiling: assuming yes])
+-	 select_works_with_rlimit=yes]
++	[AC_MSG_WARN([cross compiling: assuming no])
++	 select_works_with_rlimit=no]
+ )
+ 
+ AC_CHECK_MEMBERS([struct pollfd.fd], [], [], [[
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 6c5c1912e82..f306b1245ac 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
+           file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
@@ -77,9 +78,6 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
-# https://bugzilla.mindrot.org/show_bug.cgi?id=3398
-EXTRA_OECONF:append:powerpc = " --with-sandbox=no"
-
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.35.1


