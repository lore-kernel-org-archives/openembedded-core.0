Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C96C64EC8
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.38813.1650284854117652229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dB0Fo69s;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284852; i=@fujitsu.com;
	bh=lAdth65fonD1TWhAdMNXfDe0hvMsbRifH2P3HVUcBRE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dB0Fo69se50zTP4qwuIMhOUPbC0eBLNdJbHafUwHdfPUrWvJuNwYpvdztBdL26/jL
	 Ay1cm1lLQpSWwbrXYFnZgERAk9gY7Z8kGhBUqC0oZGakk74xRPiTiMtz2WIUs3+aZX
	 DftEOW125znDcnph8/RkTpSuxTDMo4zzd2X6VBvOsmV9Pz/Xu0qdwA2UO698Z/7nFk
	 8LzTRG9WCJlKjX4ATEDJtXKVc1tMkTNDnrub2njMH+Nt+vYeX/NLcdbg85zKJCu7JP
	 wObYKhDDKu1TOQgtODX7jL7T25CJprT6q9nocXHVBm0vh96erJ2XgfA4Pw+fxw4t2J
	 TEOp6tdaRteLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxRdc4Mjb
  J4P4EM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePTxvPsBS3qFV9aP7M3MB5V6mLk4hASmMUk
  0famnR3COcAoMbXhNlsXIycHm4C+xMZ1n5i6GDk4RAT0JK7+EwUJCwtYSXz5cZoRxGYRUJU4t
  mMaM4jNK+Auseh7E1hcQkBBYsrD91BxQYmTM5+wgNjMAhISB1+8YAYZKSGgKDF7ujxEeYXE68
  OXmCcw8sxC0jELSccCRqZVjLZJRZnpGSW5iZk5uoYGBrqGhqa6Zpa6xsZ6iVW6iXqppbrJqXk
  lRYlAWb3E8mK91OJiveLK3OScFL281JJNjMBwSil2VdzBeK3vp94hRkkOJiVR3v++sUlCfEn5
  KZUZicUZ8UWlOanFhxhlODiUJHjzI4BygkWp6akVaZk5wNCGSUtw8CiJ8PaHAKV5iwsSc4sz0
  yFSpxiNOQ5PuLSXmWPnlst7mYVY8vLzUqXEed+HA5UKgJRmlObBDYLF3CVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwrw3QabwZOaVwO17BXQKE9Ap2+dHgpxSkoiQkmpgmnPnAscHBnO5SSL
  CJ94vl/voda8resnMkCNsdg7b99n6qWhMzbFexJ9yf17Yl/NeWexsahF81zVX/QzYUJjW9uL8
  tHknLF4rbTu9zuT9giu3hCLS/uX6BX38d2Zri2Y2Y8cRs1Mex6x/HZNjzyidau7LItH9QnqXr
  zrDjPgDL+9sWNF2IP/KQ69rfyLXPt7rnrVWhal6j1ZknZXTi/J5Lq6id42cOPMlFno/+Cw31S
  n+p59F2Yda/qlftvOJF1c1bVkb2KrE4SuVuLAzm9/qlUe4Se5+G6PvadkWCWesjS8GyJlMuRD
  wbwa/7nGVYK6HLLVLlbfbN1d/iz6x8vJ91eXvWDq/iTHFfnTe+ey2EktxRqKhFnNRcSIAEIw5
  YzQDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1650284851!237278!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8014 invoked from network); 18 Apr 2022 12:27:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:27:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICRVbe002726
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:27:31 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:27:30 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] openssh: upgrade 8.9p1 -> 9.0p1
Date: Mon, 18 Apr 2022 20:27:14 +0800
Message-ID: <1650284834-2479-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164600

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...t-using-sandbox-when-cross-compiling.patch | 33 -----------------
 ...467179428a0e3ea9e4aa9738ac12ff02822d.patch | 35 -------------------
 .../{openssh_8.9p1.bb => openssh_9.0p1.bb}    |  4 +--
 3 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.9p1.bb => openssh_9.0p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch b/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
deleted file mode 100644
index 0241c290ac..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 56194e9a6043873b0ec84f9d15c6e4caca2580c8 Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Tue, 8 Mar 2022 20:04:06 +1100
-Subject: [PATCH] Default to not using sandbox when cross compiling.
-
-On most systems poll(2) does not work when the number of FDs is reduced
-with setrlimit, so assume it doesn't when cross compiling and we can't
-run the test.  bz#3398.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patch/?id=8cf5275452a950869cb90eeac7d220b01f77b12e]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 17fb1e6..a165d08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3574,8 +3574,8 @@ AC_RUN_IFELSE(
- 	 select_works_with_rlimit=yes],
- 	[AC_MSG_RESULT([no])
- 	 select_works_with_rlimit=no],
--	[AC_MSG_WARN([cross compiling: assuming yes])
--	 select_works_with_rlimit=yes]
-+	[AC_MSG_WARN([cross compiling: assuming no])
-+	 select_works_with_rlimit=no]
- )
- 
- AC_CHECK_MEMBERS([struct pollfd.fd], [], [], [[
--- 
-2.35.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch b/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
deleted file mode 100644
index 847c0a143c..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f107467179428a0e3ea9e4aa9738ac12ff02822d Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@debian.org>
-Date: Thu, 24 Feb 2022 16:04:18 +0000
-Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
-
-GCC doesn't tell us whether this option is supported unless it runs into
-the situation where it would need to emit corresponding code.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- m4/openssh.m4 | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/m4/openssh.m4 b/m4/openssh.m4
-index 4f9c3792dc1..8c33c701b8b 100644
---- a/m4/openssh.m4
-+++ b/m4/openssh.m4
-@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
- 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <stdlib.h>
- #include <stdio.h>
-+/* Trivial function to help test for -fzero-call-used-regs */
-+void f(int n) {}
- int main(int argc, char **argv) {
- 	(void)argv;
- 	/* Some math to catch -ftrapv problems in the toolchain */
-@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
- 	float l = i * 2.1;
- 	double m = l / 0.5;
- 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
-+	f(0);
- 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
- 	/*
- 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_8.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.0p1.bb
index f306b1245a..975faed547 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -24,10 +24,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
-           file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
            "
-SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
+SRC_URI[sha256sum] = "03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.25.1


