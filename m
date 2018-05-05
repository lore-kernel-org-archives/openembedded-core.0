Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5B574DAA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n9-v6so16461624pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x7CWv/KGEQ3fZP5lpcH1ygwLNsAqx70tTetzHE9RSaM=;
	b=P/nkAYy22tQ9U1i2VdQ7DY7CWfrlCsgSCo9je+WNJ6YTvrkWBcad5JdWND4bFs40bd
	QJJkrmTmU66XXLbgR5Sge6CPWHosMY9OUPSFtWJhxyBapMykph5qiKTz/+TXoIpx0Tn5
	EaoPFH4zyPHyF4MqPtqdOml++lzTRTL3oW39b/Y9gWuCJqZVbxn1jK/F4Qv33WRoQZBh
	9Ph3PpLHHho98RVD8d3apbhLKRy/0YaDKXS5phjl006NcIR/W2xg7mcd1wh5bzgN68qS
	HCLVZTDNzL6ye6D89us0i4SAarGMaJbonELJyiVaza1UwHmhhJkGl8qf8K9UHBdA3qqS
	9Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x7CWv/KGEQ3fZP5lpcH1ygwLNsAqx70tTetzHE9RSaM=;
	b=RgbkuyKKJYxpIKAwMZfXsxPjo+TSw+rcSzQevk4wmiD4ipZfQdz+bIhD8gaLQqeJdd
	TSeuztvqp2/vgw1Vo/61FnmPwfpA7uneZGERo5Rs2JD5dT0V8R9dAFSvQRPmH72ygZFX
	R48qCXWeHc0AK0sBiDZN49Mntb2DkOZYexWycfqAfWDjat/ygs58jg4i8hNyfiGSuCwe
	WBjqDTvdDHNoXyH3gDP8UVST0VpJzKCbn9+pmWnjdBANyCiFiODL/Yw0fX+iPalAsIb0
	RbxaDw+m2XnjjWLmyOsaUNnjW9HMKui48vkyDWabFqVJsQ+KViipn49YqXAJ48Lg/O+l
	yc5A==
X-Gm-Message-State: ALQs6tDjss1k+rnGgxO81PHeSB/uNlXa8suF8vcmJBW7m6y6Fe5MN4Vf
	kF4wpHznWldwXiltT8MIvf0WmA==
X-Google-Smtp-Source: AB8JxZrYhp1TLUHWb9Jm2h9GDaHrUzG2FA9wwv95ls0jzmCZ6NJzoN40fv/sIuVqrHLgeD+8DzYDpw==
X-Received: by 2002:a63:7e09:: with SMTP id
	z9-v6mr24188641pgc.437.1525479279322; 
	Fri, 04 May 2018 17:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:08 -0700
Message-Id: <7a574b3fb5b155090d40c52a0e47311dc32facde.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 14/27] ltp: Fix build after removing rpc and libnsl in glibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2018 00:14:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Disable-rpc01-on-glibc-and-musl.patch | 29 +++++++++++++++++++
 ...option-to-select-libc-implementation.patch | 14 ---------
 meta/recipes-extended/ltp/ltp_20180118.bb     |  1 +
 3 files changed, 30 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
new file mode 100644
index 0000000000..78c6dfb2b1
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
@@ -0,0 +1,29 @@
+From ff39e6b69f0b26dad8ab685ee6116ff92bc363db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 00:08:55 -0700
+Subject: [PATCH] Disable rpc01 on glibc and musl
+
+It is not buildable with libtirpc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ testcases/network/rpc/basic_tests/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
+index 66e9d5675..16a64e7da 100644
+--- a/testcases/network/rpc/basic_tests/Makefile
++++ b/testcases/network/rpc/basic_tests/Makefile
+@@ -23,4 +23,7 @@
+ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
++
++FILTER_OUT_DIRS += rpc01
++
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
index 84ab37ea39..0781ba1743 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -102,20 +102,6 @@ Index: git/testcases/network/nfsv4/acl/Makefile
 +endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/testcases/network/rpc/basic_tests/Makefile
-===================================================================
---- git.orig/testcases/network/rpc/basic_tests/Makefile
-+++ git/testcases/network/rpc/basic_tests/Makefile
-@@ -23,4 +23,9 @@
- top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
-+
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS += rpc01
-+endif
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
 Index: git/testcases/realtime/func/pi-tests/Makefile
 ===================================================================
 --- git.orig/testcases/realtime/func/pi-tests/Makefile
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 14fb41b3bd..8992f1b0f2 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch \
+           file://0001-Disable-rpc01-on-glibc-and-musl.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


