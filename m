Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8B97BF62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4548; q=dns/txt; s=iport;
	t=1545064863; x=1546274463; h=from:to:subject:date:message-id;
	bh=SFqXXDHTlPl3YaZ5HK6jrxT7h/XSOfWjQCMTtbrCWMs=;
	b=CUDhNnuSDiBhqmLNuOZ7I93nSQjwkgMVj9bPF5lli1MDl3E1xYVip6dC
	Kf7reYwipyA7w0+i4rT1p6fVyDFkfwvB55q4QkRy+cxDExl5i+/9t2ybK
	Uk1U5tpyxEMVkujmEXCnkH5VMlKQ+ojdQoIPnqTnD4DCWCJaFA98QOk9x A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ADAAC20Bdc/xbLJq1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGCaYECJ4wVX6R9gXoNG4gJNAkNAQMBAQIBAQJ?=
	=?us-ascii?q?tHAyFPAGBKwMBAn4PEoMiAYIAqTiFQIRgFIdphFiBQD+PAwKgQ1YJhw2KTQI?=
	=?us-ascii?q?WgiqPKIk8kCiBRjiBVjMaCBsVgycJgh4XgmyLMz0DMI52AQE?=
X-IronPort-AV: E=Sophos;i="5.56,366,1539648000"; 
   d="scan'208";a="8873361"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 16:41:01 +0000
Received: from localhost ([10.63.15.139])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id wBHGf18Y006721;
	Mon, 17 Dec 2018 16:41:01 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Date: Mon, 17 Dec 2018 18:41:01 +0200
Message-Id: <1545064861-31799-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.139, [10.63.15.139]
X-Outbound-Node: aer-core-3.cisco.com
Subject: [PATCH v2] systemd: fix remaining issues with statx and glibc 2.28+
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
X-List-Received-Date: Mon, 17 Dec 2018 16:41:02 -0000

Commit 776d14db9589 "systemd: Detect if statx struct is
defined in sys/stat.h" did only a part of work, and systemd
build fails on src/basic/chattr-util.c compilation due to
same statx redefinition issue.
Backport additional patch from systemd master

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---

v2: rebased to recent OE master, added signoff

 ...-linux-stat.h-check-with-other-checks-and.patch | 78 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
new file mode 100644
index 0000000..0db7fce
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
@@ -0,0 +1,78 @@
+From 9c869d08d82c73f62ab3527567858ce4b0cf1257 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 18 Jul 2018 17:26:17 +0200
+Subject: [PATCH] meson: unify linux/stat.h check with other checks and use
+ _GNU_SOURCE
+
+Using _GNU_SOURCE is better because that's how we include the headers in the
+actual build, and some headers define different stuff when it is defined.
+sys/stat.h for example defines 'struct statx' conditionally.
+
+Upstream-Status: Backport
+
+Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+---
+ meson.build         | 20 ++++++++++++++------
+ src/basic/missing.h |  2 +-
+ 2 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 68423bd..99035d2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -421,11 +421,9 @@ decl_headers = '''
+ #include <uchar.h>
+ #include <linux/ethtool.h>
+ #include <linux/fib_rules.h>
+-#include <linux/stat.h>
+ #include <sys/stat.h>
+ '''
+ # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
+-# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
+ 
+ foreach decl : ['char16_t',
+                 'char32_t',
+@@ -436,13 +434,23 @@ foreach decl : ['char16_t',
+                ]
+ 
+         # We get -1 if the size cannot be determined
+-        have = cc.sizeof(decl, prefix : decl_headers) > 0
++        have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
++
++        if decl == 'struct statx'
++                if have
++                        want_linux_stat_h = false
++                else
++                        have = cc.sizeof(decl,
++                                         prefix : decl_headers + '#include <linux/stat.h>',
++                                         args : '-D_GNU_SOURCE') > 0
++                        want_linux_stat_h = have
++                endif
++        endif
++
+         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
+ endforeach
+ 
+-conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
+-#include <sys/stat.h>
+-''', args : '-D_GNU_SOURCE') > 0)
++conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
+ 
+ foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
+                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 14ad3d4..9044683 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -24,7 +24,7 @@
+ #include <uchar.h>
+ #include <unistd.h>
+ 
+-#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
++#if WANT_LINUX_STAT_H
+ #include <linux/stat.h>
+ #endif
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index a40c899..a286927 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
            file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
+           file://0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
1.9.1


