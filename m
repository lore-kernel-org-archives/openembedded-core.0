Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB677D46D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 21:47:56 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id CFD731D3244;
	Thu,  4 Apr 2019 17:47:57 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id VgmCxOLNN8l7; Thu,  4 Apr 2019 17:47:57 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 483731D3240;
	Thu,  4 Apr 2019 17:47:57 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 483731D3240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1554414477;
	bh=jpZUAdqSW80DLE2T0ucRHAdojh2qR72EGpIPL+Z29hI=;
	h=From:To:Date:Message-Id;
	b=XjnkmFOxluUEqLObrtzDKrg6hNkVpwsFcOlAyZQu7ImRKn7UpcHUppR9b7ZyXCI+M
	ctBV3TYnZ7GQyQyfV+xTug/qMcSOXIbRJ5tzNOFW0Psm9LknFwaMdydjpmCwcerhH6
	FH2f5iIHqjKi9J9s+XbcxILm3T9ZFR4miPLlJB20vY7MGqqMiQqjGKSDMIBYzFqx7Y
	wUm1X9aNzsCcxFs05OPkglnXfzNORAO185PvBkfbEjd0Eq9id1rBc6eU1RBS5moavR
	4DuBEYc4tr7Ih671KFvjNnYlh4eIr8ruJpER+fyC6TuAEDsPV/vs+96/jItqzOLi0K
	yuO0m6cTqGaIw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id EdI77JHDL8uz; Thu,  4 Apr 2019 17:47:57 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id CE2191D323B;
	Thu,  4 Apr 2019 17:47:56 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  4 Apr 2019 21:47:42 +0000
Message-Id: <20190404214743.9827-3-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
References: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] lttng-ust: lttng-ust works fine on musl no need to remove it
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
X-List-Received-Date: Thu, 04 Apr 2019 21:47:56 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 -
 meta/recipes-devtools/gdb/gdb-common.inc                         | 1 -
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb                  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 3d8e0c2ed7..1e06e7fb6c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -37,7 +37,6 @@ SYSTEMTAP_riscv64 = ""
 
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
-LTTNGUST_libc-musl = ""
 LTTNGUST_arc = ""
 
 LTTNGTOOLS = "lttng-tools"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index a07625bb8d..08f615addf 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -8,7 +8,6 @@ LTTNGUST_arc = ""
 LTTNGUST_aarch64 = ""
 LTTNGUST_mipsarch = ""
 LTTNGUST_sh4 = ""
-LTTNGUST_libc-musl = ""
 
 inherit autotools texinfo
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index b720b84afa..a3fabb20ec 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -26,7 +26,6 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
-PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 PACKAGECONFIG_remove_arc = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-- 
2.17.1


