Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD29BC001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.26487.1688656057926936619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jfvfvLIL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b8b4749013so5049215ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656057; x=1691248057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEY17e0N9pdYyUoO7uv7ZSNvo0br11nF6vfzqY+G22c=;
        b=jfvfvLILfAqdHUspQH34cuV9C75XNRG/RH82rUn5WlZMGp2dw/zaGJBXdLAL9hBLBM
         HsCL9P/0RPXwZIOxfKHjSfhyuhww6DUn4Iy5p++ei8v5Ngy5uB09xKGlkrLNAMd0DZy4
         wAtRMl1t2tGwlquOL5ewPREEl1WhK5NHCSInZU3gIiX+1Ej9uLGpRWS2EpbUekDBo36B
         OdfDaKMCHh6RzqpfMJMltNG0sMm7Ew9EUWs1DiSCpo1kj3tUbZ6VtQO2yYcujO2h+qc9
         Mm9KRxeuVsQTwbaUyzEpFzTnzpofDeYmvxgPDxFtf7eA0cCxc5Ns4dfTmxnfniUp5HtE
         ciPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656057; x=1691248057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEY17e0N9pdYyUoO7uv7ZSNvo0br11nF6vfzqY+G22c=;
        b=IRkEQdcf5yEIjK3gODUkrqzy18S1KwXEuPd3uaJfOypHG45Nj6BTVwJt9Kqza/Rkgh
         5Isyakp2QCgSgIjJaegEBLlaTCbhW6EgTgCtptTTSuaeNVkDo4lvPCF+i3KNsGmEFxYd
         vFcYDBy0lyjZCfV1oVfABuUPhgikVYocRPVYCpntsVjbIJU8h1dLUdUmsvfy6nAblDR2
         IYdAkmcDzUwjNxLe83c+tKyARbQYyDtGZ1t9ORCq5iUCfcExdyBzCQgrHN8b4QkRoOfN
         LZFxTk4eeMFNIy0HP32LSPnLaiyZOIRtfPltOwRk8OIUSheQ6V9Bi2RRu8PX0lElA4uN
         nD1Q==
X-Gm-Message-State: ABy/qLY5bdybHjgk8PMndStJ3o+rGVKadq30QFDzZm2GkeoiKIQ2pzhf
	+fuOvh2qtIJmdmyj9Wo/vo6uEVWh8zuvZMUZj9w=
X-Google-Smtp-Source: APBJJlGviKDvO/OEX0Z9imtsPRNqrxGnvUvWsAdv/6oUNx1dgifnu8B7La4udk6ysRuMEg7sjejKuA==
X-Received: by 2002:a17:902:758c:b0:1b8:10a:d925 with SMTP id j12-20020a170902758c00b001b8010ad925mr2134338pll.5.1688656056827;
        Thu, 06 Jul 2023 08:07:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/28] strace: Update patches/tests with upstream fixes
Date: Thu,  6 Jul 2023 05:06:31 -1000
Message-Id: <cef730284b8616ba07c1b062c992c36af730580e.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183981

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Replace the sockopt disable patch with a fix from upstream

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac921989991c319ecad01bec37c4ccaa15a7b58f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit c1beb73526e3ade75bd6dae5f9310107c50f1226)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...b541b258baec9eba674b5d8dc30007a61542.patch | 50 +++++++++++++++++++
 ...2f4494779e5c5f170ad10539bfc2dfafe967.patch | 50 +++++++++++++++++++
 .../strace/strace/skip-sockopt-test.patch     | 37 --------------
 meta/recipes-devtools/strace/strace_5.16.bb   |  3 +-
 4 files changed, 102 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
 create mode 100644 meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-sockopt-test.patch

diff --git a/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch b/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
new file mode 100644
index 0000000000..b4c6ff99de
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
@@ -0,0 +1,50 @@
+From 3bbfb541b258baec9eba674b5d8dc30007a61542 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Wed, 21 Jun 2023 08:00:00 +0000
+Subject: [PATCH] net: enhance getsockopt decoding
+
+When getsockopt syscall fails the kernel sometimes updates the optlen
+argument, for example, NETLINK_LIST_MEMBERSHIPS updates it even if
+optval is not writable.
+
+* src/net.c (SYS_FUNC(getsockopt)): Try to fetch and print optlen
+argument on exiting syscall regardless of getsockopt exit status.
+
+Upstream-Status: Backport
+---
+ src/net.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/net.c b/src/net.c
+index f68ccb947..7244b5e57 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -1038,7 +1038,7 @@ SYS_FUNC(getsockopt)
+ 	} else {
+ 		ulen = get_tcb_priv_ulong(tcp);
+ 
+-		if (syserror(tcp) || umove(tcp, tcp->u_arg[4], &rlen) < 0) {
++		if (umove(tcp, tcp->u_arg[4], &rlen) < 0) {
+ 			/* optval */
+ 			printaddr(tcp->u_arg[3]);
+ 			tprint_arg_next();
+@@ -1047,6 +1047,19 @@ SYS_FUNC(getsockopt)
+ 			tprint_indirect_begin();
+ 			PRINT_VAL_D(ulen);
+ 			tprint_indirect_end();
++		} else if (syserror(tcp)) {
++			/* optval */
++			printaddr(tcp->u_arg[3]);
++			tprint_arg_next();
++
++			/* optlen */
++			tprint_indirect_begin();
++			if (ulen != rlen) {
++				PRINT_VAL_D(ulen);
++				tprint_value_changed();
++			}
++			PRINT_VAL_D(rlen);
++			tprint_indirect_end();
+ 		} else {
+ 			/* optval */
+ 			print_getsockopt(tcp, tcp->u_arg[1], tcp->u_arg[2],
diff --git a/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch b/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
new file mode 100644
index 0000000000..a0843836c2
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
@@ -0,0 +1,50 @@
+From f31c2f4494779e5c5f170ad10539bfc2dfafe967 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Sat, 24 Jun 2023 08:00:00 +0000
+Subject: [PATCH] tests: update sockopt-sol_netlink test
+
+Update sockopt-sol_netlink test that started to fail, likely
+due to recent linux kernel commit f4e4534850a9 ("net/netlink: fix
+NETLINK_LIST_MEMBERSHIPS length report").
+
+* tests/sockopt-sol_netlink.c (main): Always print changing optlen value
+on exiting syscall.
+
+Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
+---
+ tests/sockopt-sol_netlink.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/tests/sockopt-sol_netlink.c b/tests/sockopt-sol_netlink.c
+index 82b98adc23..1c33219ac5 100644
+--- a/tests/sockopt-sol_netlink.c
++++ b/tests/sockopt-sol_netlink.c
+@@ -94,7 +94,10 @@ main(void)
+ 			printf("%p", val);
+ 		else
+ 			printf("[%d]", *val);
+-		printf(", [%d]) = %s\n", *len, errstr);
++		printf(", [%d", (int) sizeof(*val));
++		if ((int) sizeof(*val) != *len)
++			printf(" => %d", *len);
++		printf("]) = %s\n", errstr);
+ 
+ 		/* optlen larger than necessary - shortened */
+ 		*len = sizeof(*val) + 1;
+@@ -150,8 +153,12 @@ main(void)
+ 		/* optval EFAULT - print address */
+ 		*len = sizeof(*val);
+ 		get_sockopt(fd, names[i].val, efault, len);
+-		printf("getsockopt(%d, SOL_NETLINK, %s, %p, [%d]) = %s\n",
+-		       fd, names[i].str, efault, *len, errstr);
++		printf("getsockopt(%d, SOL_NETLINK, %s, %p",
++		       fd, names[i].str, efault);
++		printf(", [%d", (int) sizeof(*val));
++		if ((int) sizeof(*val) != *len)
++			printf(" => %d", *len);
++		printf("]) = %s\n", errstr);
+ 
+ 		/* optlen EFAULT - print address */
+ 		get_sockopt(fd, names[i].val, val, len + 1);
diff --git a/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch b/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
deleted file mode 100644
index 5741bf8672..0000000000
--- a/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [avoid this test until fixed by upstream]
-
-Reported at https://github.com/strace/strace/issues/257
-
-root@qemux86-64:/usr/lib/strace/ptest/tests# make sockopt-sol_netlink.gen.log
-FAIL: sockopt-sol_netlink.gen.test
-
-#root@qemux86-64:/usr/lib/strace/ptest/tests# diff sockopt-sol_netlink.dir/exp sockopt-sol_netlink.dir/out
-#--- sockopt-sol_netlink.dir/exp
-#+++ sockopt-sol_netlink.dir/out
-#@@ -86,11 +86,11 @@
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, -1) = -1 EINVAL (Invalid argument)
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, 3) = 0
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a803000, 4) = -1 EFAULT (Bad address)
--getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [8]) = 0
-+getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [4 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [5 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, NULL, [0 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [], [3 => 8]) = 0
--getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [8]) = -1 EFAULT (Bad address)
-+getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [4]) = -1 EFAULT (Bad address)
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a802ffc, 0x7fa18a7fd000) = -1 EFAULT (Bad address)
- setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 4) = -1 ENOPROTOOPT (Protocol not available)
- setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 5) = -1 ENOPROTOOPT (Protocol not available)
-
-
-
-Index: strace-6.3/tests/sockopt-sol_netlink.gen.test
-===================================================================
---- strace-6.3.orig/tests/sockopt-sol_netlink.gen.test
-+++ strace-6.3/tests/sockopt-sol_netlink.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (sockopt-sol_netlink -e trace=getsockopt,setsockopt); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test failing after system upgrades, wait for upstream fixes"
- run_strace_match_diff -e trace=getsockopt,setsockopt
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index d97a1260d1..39082a5bc7 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -13,7 +13,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            file://0001-landlock-update-expected-string.patch \
-           file://skip-sockopt-test.patch \
+           file://f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch \
+           file://3bbfb541b258baec9eba674b5d8dc30007a61542.patch \
            "
 SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
 
-- 
2.34.1


