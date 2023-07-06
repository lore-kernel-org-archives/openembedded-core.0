Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD727C3DA40
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.26528.1688656053777169644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TdrgAuJI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b8a8154f9cso5713475ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656053; x=1691248053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/ALYc5pOgEiQshDxDzW6psJGUuyNa6OMeX7nRHr5bA=;
        b=TdrgAuJIbB2alBcu4IE8GOcX9WkhKYoiZMRDHNVwOZI+GOHu3rTmMpAzinxLCnwIUI
         Pc9zn8v0cp3YeLv8cxXXrbcyPn+oJYyGSb0iXYTx0aBjL2NnfbjIatkVAHU+1joTHKZA
         WV8mBx0DHYliN9lZZWDQ1RkY6Qj22K6MUG6mgTNXJ4ucogHJyMEsSCT7WETvTwoaZV+x
         c1Rn37qWSc877EneaGBUQbicW4KIsXRTAxT9a3g++KLTYeeL73oMarEoGWbxmb7r1D+/
         1+eGawzyGkUfhAtnoOJXF+K2vETdH3kS9U2ivZeR2QjJDTRtU7ouLI8bmQhmtPIPOhUr
         vTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656053; x=1691248053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ALYc5pOgEiQshDxDzW6psJGUuyNa6OMeX7nRHr5bA=;
        b=ACgDvrPzFwnHCtj+zJCBraAopXcqh7nM2m1VpwHCBR5HYTpwJRGsqzVkqGXqNzVgyc
         M/QxetgnqhiJfv9HX0XhWqqc1wcmBkAry8nYvcTbn015iAOqviKYWzPScB7gZf65TnZ/
         yA5dOmdK9ly7y8ESeUH5dQNH06+6UTT5QlMG2J4+T+SI14BrfpTTqleRaXFJAswUIPkd
         PhNdRyXc1KgVGN06F/izqAr+jki58nTpi1XUJ/GCZMUbiLgyRBgDu9SvOoo7Uy7x6UoP
         /dxKJPTDNrXbeLYSQmb/pSkmdurEk41WsSUP2PSrUb7Fqak+JyDTP+JP2myOh9MkOov4
         iWhw==
X-Gm-Message-State: ABy/qLZl4sTUSG+z5vZcKc+PZv9HmoJ0ysLjca/8Hd0b1R4erePXoRwM
	V7PITPzVZeEHs2Xd3C/OxGMU9OTzZumsDW+H1PY=
X-Google-Smtp-Source: APBJJlF5MANE8iAWk9vnU0rJamNgRIe9hZ5qLD4f9YrbtweyHiFEUWo0suAsUrx970eTDVi4aT+H8A==
X-Received: by 2002:a17:902:d481:b0:1b8:2adc:8358 with SMTP id c1-20020a170902d48100b001b82adc8358mr3279519plg.11.1688656052805;
        Thu, 06 Jul 2023 08:07:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/28] strace: Disable failing test
Date: Thu,  6 Jul 2023 05:06:29 -1000
Message-Id: <fc32e725a0c73772a2ad4e31e1aa1d61f72f9da1.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183979

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This test is failing for uncertain reasons. We have reported upstream, disable
it until we can work out why this happened. The point it started failing is
unclear due to other test framework issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e9165a854c7b83f163479e9dbd3cb183a9d71f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../strace/strace/skip-sockopt-test.patch     | 37 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.16.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/skip-sockopt-test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch b/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
new file mode 100644
index 0000000000..5741bf8672
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [avoid this test until fixed by upstream]
+
+Reported at https://github.com/strace/strace/issues/257
+
+root@qemux86-64:/usr/lib/strace/ptest/tests# make sockopt-sol_netlink.gen.log
+FAIL: sockopt-sol_netlink.gen.test
+
+#root@qemux86-64:/usr/lib/strace/ptest/tests# diff sockopt-sol_netlink.dir/exp sockopt-sol_netlink.dir/out
+#--- sockopt-sol_netlink.dir/exp
+#+++ sockopt-sol_netlink.dir/out
+#@@ -86,11 +86,11 @@
+ setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, -1) = -1 EINVAL (Invalid argument)
+ setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, 3) = 0
+ setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a803000, 4) = -1 EFAULT (Bad address)
+-getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [8]) = 0
++getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [4 => 8]) = 0
+ getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [5 => 8]) = 0
+ getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, NULL, [0 => 8]) = 0
+ getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [], [3 => 8]) = 0
+-getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [8]) = -1 EFAULT (Bad address)
++getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [4]) = -1 EFAULT (Bad address)
+ getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a802ffc, 0x7fa18a7fd000) = -1 EFAULT (Bad address)
+ setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 4) = -1 ENOPROTOOPT (Protocol not available)
+ setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 5) = -1 ENOPROTOOPT (Protocol not available)
+
+
+
+Index: strace-6.3/tests/sockopt-sol_netlink.gen.test
+===================================================================
+--- strace-6.3.orig/tests/sockopt-sol_netlink.gen.test
++++ strace-6.3/tests/sockopt-sol_netlink.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (sockopt-sol_netlink -e trace=getsockopt,setsockopt); do not edit.
+ . "${srcdir=.}/init.sh"
++skip_ "Test failing after system upgrades, wait for upstream fixes"
+ run_strace_match_diff -e trace=getsockopt,setsockopt
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index 23ffa25d29..60d452fd17 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            file://0001-landlock-update-expected-string.patch \
+           file://skip-sockopt-test.patch \
            "
 SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
 
-- 
2.34.1


