Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242B3C7618E
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:29 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.459.1679092999317572707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uCYFNmVm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id y2so6827985pjg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coBCwh3NNriX0hs+wRG9AWNzTV8VdwkI3D6aEYj4EDU=;
        b=uCYFNmVmeR3oAX/PbSTk7r0LJMgl9As7dutqHH2VyyNR3AF4nSlRI1Ujib5tu1xuse
         cHz5tdLGYZhLIndfHMgiGpqe20W+zf5shQEG7lTK9fInApzf4bDVXPyWOnr29ixLTLPr
         NRsZjJyqng6rDVQoyT0V8wvuF2RzImQczV5+ZHsk0bMcJw7Ens4QTRlPK/omNrQFH5KP
         +KhvkMFlzvEj2s9RH5jVjglucpZKgq3tjdXghVG88mAlxwxorWQGP/5vTTOVhDh5xyEx
         cLDH2BfK85/JHqL3CnyeYfTU3TvuTwnxBPuDpdWqwJmd/3/Wm2zGnL6onRo1hEJpZvY/
         ZRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coBCwh3NNriX0hs+wRG9AWNzTV8VdwkI3D6aEYj4EDU=;
        b=CddXVphjw/2NST86I6HUnvXMuUOBuqZfFa0AIrIh7CfhTDJw7lDOhiC9v6XHXpE3tV
         I38JDAx9uBzseTrtwj2c5PXA0Q0pilAsWcGQHqa9bQ6VN4SBwAicx0ncmbHhYDsWVTZU
         67AdxVk2ocIF00UEWEIs5q216luPW8+pqMsjbDc/ISz2Sv+FOLd8vPdL93uvCvQy1A6a
         VRigxHrBbi+CpoAvZxIkLf3tHtI9hmSlfXZ1QdUlHDLFezOsnxGd0cagnOpIL4gSrofG
         GXUhmwqRX5JlZYTEPxYKK5AUcixVHWKmYS4la9r20oEkicxsovRe5sZjBTcLSTU1V715
         MSKQ==
X-Gm-Message-State: AO0yUKWID9MwG2aA3jLmVpdNC9lp8vLkF2Pa1ocE47kKizP7RSTOMIvG
	3jcreosrj2Cx39gV06/l96FbDnrbE0fP9uLO/Gg=
X-Google-Smtp-Source: AK7set+8VApyIjo6ImfZolax9VercpgCOifzSMKeAI/qvqN5O5Ykcl51AEnODDALQ3OxdYh17oItSw==
X-Received: by 2002:a17:903:1c9:b0:1a1:7b8d:670a with SMTP id e9-20020a17090301c900b001a17b8d670amr10239609plh.21.1679092998393;
        Fri, 17 Mar 2023 15:43:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/21] dhcpcd: Fix install conflict when enable multilib.
Date: Fri, 17 Mar 2023 12:42:34 -1000
Message-Id: <800ea13091216a59e21718fa0fada45b45bdca2c.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178781

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -821,7 +821,7 @@
 If you always use the same options, put them here.
 .It Pa /usr/libexec/dhcpcd-run-hooks
 Bourne shell script that is run to configure or de-configure an interface.
-.It Pa /usr/lib64/dhcpcd/dev
+.It Pa /usr/lib/dhcpcd/dev
 Linux
 .Pa /dev
 management modules.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 65ca2c4b7349a4f7dcfcc580d926a99c673deb60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...-conflict-error-when-enable-multilib.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 39e689d2f6..579fa95df7 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
+           file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
 SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
new file mode 100644
index 0000000000..12998aada4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -0,0 +1,46 @@
+From 4915a7e52fcea8fe283a842890a1e726b1e26b10 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 10 Mar 2023 03:48:46 +0000
+Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
+
+Error: Transaction test error:
+ file /usr/share/man/man8/dhcpcd.8 conflicts between attempted
+ installs of dhcpcd-doc-9.4.1-r0.cortexa57 and
+ lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon
+
+The differences between the two files are as follows:
+@@ -821,7 +821,7 @@
+ If you always use the same options, put them here.
+ .It Pa /usr/libexec/dhcpcd-run-hooks
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa /usr/lib64/dhcpcd/dev
++.It Pa /usr/lib/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+
+It is just a man file, there is no necessary to manage multiple
+versions.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/dhcpcd.8.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
+index bc6b3b5..791f2ba 100644
+--- a/src/dhcpcd.8.in
++++ b/src/dhcpcd.8.in
+@@ -821,7 +821,7 @@ Configuration file for dhcpcd.
+ If you always use the same options, put them here.
+ .It Pa @SCRIPT@
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa @LIBDIR@/dhcpcd/dev
++.It Pa /usr/<libdir>/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+-- 
+2.34.1
+
-- 
2.34.1


