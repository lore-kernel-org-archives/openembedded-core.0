Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94045EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.7315.1687919444544541976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Sa4mo69z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666edfc50deso359080b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919443; x=1690511443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itaF3b0ukpMGTYvabuAPb/EDfvafem8I38z6NP9Jieo=;
        b=Sa4mo69zgbuRi8I6Ip1R42AP4dXbz7rxwmk9EpW5sxEONzhBFMk1IXKDXv3RD6V8YW
         NZ6jKqKdU2uplqYTDZ4g6arNoYFkLsNp4GZw6ktAlTm1x4mtMzrr6pYgGBGo8Eb0LGEo
         ybp832aN3bnhcm8tqWqbDTBolFf9/od8o9aaZifRDm54BiBYv5b5uRs+0Fd4xA3yX3yG
         486r2J6IBZnjFoFOXSZBUqAI0yecVoCxdhSrcCGU1st+lYbWcx3PrnQiGO6U9SMkJYBq
         CKyefwRkPO34Js0lX5rWZY99l8Ow32nSfMhC+BaJiOeqUT5AlD1BEk34XOOFfmWqu7S6
         WorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919443; x=1690511443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itaF3b0ukpMGTYvabuAPb/EDfvafem8I38z6NP9Jieo=;
        b=Q+ldV5eeH/mMF7sM+ELVAtXxdMOUHtI5O0aPrH1UmO1jhcg95W4oIyj/XxYmXEByEE
         HnhjzI6FT3y2pA4oJn9TYXN6PFEkMx6o/kVXqutUW+bEf4+ikDSaHThUNJ4FKdD3d90e
         tnJZhsEulItnrMv/4sgUgLsXGrOzXTJDZR+a/LVQ6Wsy05qXYoWZ82439LemcFFqpGjM
         mp/rKoKpQmbjwD2p0qJ3PUoPy7VDHFo+sTBPm876cJsXtmeQtp6TRuR4pXCFCLioMIu4
         +c/Fvfdi2kg2ZgLG9M1rVdCZvr905KRDMDTyujkXCF4B0Deisugx73vsFDoSFWvhwBuR
         C1rg==
X-Gm-Message-State: AC+VfDzhITY+l5m8iWCraGkaYaf+iyHa+LY7TPkXUQvxIRu2SSRv6x76
	DryoY7TsL9KBXcJYSSAR++XM/MGxUQBv1gO2EtN8zQ==
X-Google-Smtp-Source: ACHHUZ6t2T/G50HMFn1s6O7bf21f9Xt4bv5sahIsu7eTVYk/W1H6ax4jbrUJruZmCpn5uOh/OJy4Pw==
X-Received: by 2002:a05:6a20:748b:b0:117:19d1:8385 with SMTP id p11-20020a056a20748b00b0011719d18385mr49751pzd.20.1687919443572;
        Tue, 27 Jun 2023 19:30:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/30] strace: Disable failing test
Date: Tue, 27 Jun 2023 16:29:45 -1000
Message-Id: <ef1b309ec04aa16020c6a8ca3939fb8eccca3edb.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183538

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This test is failing for uncertain reasons. We have reported upstream, disable
it until we can work out why this happened. The point it started failing is
unclear due to other test framework issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e9165a854c7b83f163479e9dbd3cb183a9d71f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../strace/strace/skip-sockopt-test.patch     | 37 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.2.bb    |  1 +
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
diff --git a/meta/recipes-devtools/strace/strace_6.2.bb b/meta/recipes-devtools/strace/strace_6.2.bb
index dc01b57d80..94eb81480b 100644
--- a/meta/recipes-devtools/strace/strace_6.2.bb
+++ b/meta/recipes-devtools/strace/strace_6.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://skip-sockopt-test.patch \
            "
 SRC_URI[sha256sum] = "0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8"
 
-- 
2.34.1


