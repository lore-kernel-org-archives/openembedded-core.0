Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE9C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 22:53:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.19125.1644360796742681724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MTQLPVvr;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1807047pjd.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDjloyB+S6WmHF+4MpHvwNZe6ycnPkk2miUlUsLSSFk=;
        b=MTQLPVvr2J+YH4S2xXPg4dWanPL8s1pSecGGgzMN2ks4DdH13yGmBD1wymjTlvQMvy
         Fk5icyTA0DYQv9ZIaHIiWRTP+nYMfiyVZU4ZpBjwsxDTnY8mNOKGeKe6lwEEt8+Sau5Q
         jF/Raf/Eni24ODnexa75/pIJSDd0AYKsc+csylxEVrsAPhheXLehpkA5BBit7NUSagYh
         K68UyaciOnaWn+5eyOYaXqDlV2z1FodAtm8ZPQphfJaAIrK5PcQOeKlb+uX/JHalwwLw
         jIgAIa6+XrbdVUeYx/EcZSk+osEa/TpktVg1mAkivcj6y+IjuXT3JdinS4tK2yV2al/0
         IVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDjloyB+S6WmHF+4MpHvwNZe6ycnPkk2miUlUsLSSFk=;
        b=vlnxDwg3Fipn36kXncyQ82t0kVrc7ZGP+thVqR/J1X+IPohuhhpOLyL4O8gDhJGl99
         6R2nO8EMm3k6MlO7So1Td+8aoeBnr4YT4MKULvu3L/Wm2jztjdtayWxkM6XZ+OIiV7/f
         uGiGQeHCcCnMoX2r0J3PTxD5xCrhYqoTe02gqcZpD7++hmZALHRW9SiE+JZ9lbei4b3t
         ejhQeOaBpbHvFK5kS7HQlr0IqZBNC80OrDtBmdOwOurqR0iAG4gT2yS+WlL4Y7BI89zW
         mqCrHKGtNwKHGLy9mymn53Hrfj/e1vRreFInJmdeodfEUFQMvh1svj3+IFQtz1M7+mU4
         Kfng==
X-Gm-Message-State: AOAM533Df4IvGEmOiDGpReIK2RveDN80D/PSEEIyyuxM4E3NW7sv/zj6
	nmpKUrgwir/TsTfpZPFL5WHsFuLu6oyeIw==
X-Google-Smtp-Source: 
 ABdhPJwADJyBqO0P9rETxhSELmuVj6jBcXfd1zDIwzoNa6Z+gx1PTSn8aVj6Y/NISrA/Yxq00CCQfQ==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id
 kb6mr206403pjb.139.1644360796030;
        Tue, 08 Feb 2022 14:53:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nm15sm1781228pjb.17.2022.02.08.14.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] perl: Help resolving WNOHANG and _exit in Posix module
Date: Tue,  8 Feb 2022 14:53:10 -0800
Message-Id: <20220208225310.1685131-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208225310.1685131-1-raj.khem@gmail.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 22:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161532

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-ipc-force-POSIX-WNOHANG-resolving.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch

diff --git a/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
new file mode 100644
index 00000000000..9f8cbd8ad82
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
@@ -0,0 +1,57 @@
+From 0d8c411ef7e8b4452007c77eee3d83d227b86bb4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Feb 2022 14:05:22 -0800
+Subject: [PATCH] ipc: force POSIX::WNOHANG resolving
+
+It seems POSIX module is special and may not have autovivified (resolved) WNOHANG.
+see [1]
+
+Fixes
+ Bareword "POSIX::WNOHANG" not allowed while "strict subs"
+
+[1] https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/78eb0e39454ab3ca8e7ef77f1d014b50b3632fb9
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/IPC/Cmd.pm | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/IPC/Cmd.pm b/lib/IPC/Cmd.pm
+index 88ed295..ccdf343 100644
+--- a/lib/IPC/Cmd.pm
++++ b/lib/IPC/Cmd.pm
+@@ -499,7 +499,7 @@ sub kill_gently {
+         next;
+     }
+ 
+-    my $waitpid = waitpid($pid, POSIX::WNOHANG);
++    my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+     if ($waitpid eq -1) {
+         $child_finished = 1;
+@@ -619,10 +619,10 @@ sub open3_run {
+           #
+           kill(-9, $$);
+ 
+-          POSIX::_exit 1;
++          POSIX::_exit(1);
+         }
+ 
+-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+         # child finished, catch it's exit status
+         if ($waitpid ne 0 && $waitpid ne -1) {
+@@ -1005,7 +1005,7 @@ sub run_forked {
+           $child_finished = 1;
+         }
+ 
+-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
+ 
+         # child finished, catch it's exit status
+         if ($waitpid ne 0 && $waitpid ne -1) {
+-- 
+2.35.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index e4bcfe3ce69..48d755744fe 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
            file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
            file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
+           file://0001-ipc-force-POSIX-WNOHANG-resolving.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.35.1


