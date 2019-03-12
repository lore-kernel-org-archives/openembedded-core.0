Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2527C69B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 21:13:44 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id C29C1134F1E;
	Tue, 12 Mar 2019 17:13:45 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id w2QkXWtPP0Cr; Tue, 12 Mar 2019 17:13:45 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 419E8134F16;
	Tue, 12 Mar 2019 17:13:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 419E8134F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552425225;
	bh=83v3daiUJn37OZkYEvjWUJof6vEi6bAMRWeq0h48d0o=;
	h=From:To:Date:Message-Id;
	b=Fjx1bVKY5HCro2OWmJOX0HMcfEzAVyhJFeMxI5nI5s4nGgQbdgL7eHr7UGiOxQwzT
	oj9KLx+b9Du3ihHSxjItRCYbjPYMOoveFE6sdgXeau0iHdLkXImUS3bFSH6tkffGZ3
	uMBouds0MJBGK32Co2bP0qFW0W2XTKnvfG+ai9WGMt4DqROr2zYCgZw1BF4izg8AKQ
	j5Fz6mrUwaECOJZSUZ5ZFbTUCKKiy+NAbiWlROh2G6mlHtx11LGp+nfSkZ0r6D2BL1
	Wj9Y9DGHWNpOyFJoIyxkERkOiqB3lVKuU94zc12Ic5VBMv8LVgGahHPhlKa8++zut0
	o1ReiRA9mlq2Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id i2sBQvtxuV5M; Tue, 12 Mar 2019 17:13:45 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 16896134F0D;
	Tue, 12 Mar 2019 17:13:45 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 21:13:29 +0000
Message-Id: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] lttng-tools ptest: add missing dependencies
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
X-List-Received-Date: Tue, 12 Mar 2019 21:13:45 -0000

Multiple tests are failing due to missing dependencies on a bare
core-image-minimal build with only lttng-tools ptest present.

"getconf LONG_BIT" is used to get the bitness of the host to run the
correct consumerd. Depend on glibc-utils.

perl-module-overloading is needed to validate trace. babelstats.pl

"head -c" is used to generate a random string. It is easier to depends
on coreutils to get a feature complete "head" than to enable to "fancy
head" feature of busybox. See utils.sh randstring.

"taskset" is used in a couple of scripts to ensure that events generated
finish in the same buffer. Depend on util-linux.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---

I also submitted the following patches [1] [2] to lttng upstream. It
should help get the ptest sucess ratio up when they are merged. They
should be released in the upcoming month.

[1] https://lists.lttng.org/pipermail/lttng-dev/2019-March/028573.html
[2] https://lists.lttng.org/pipermail/lttng-dev/2019-March/028574.html

---
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 9d21fb00bf..3324959cc3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
+RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps glibc-utils perl-module-overloading coreutils util-linux"
 # babelstats.pl wants getopt-long
 RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
 
@@ -141,15 +141,6 @@ do_install_ptest () {
         -e 's#\(^test.*LDADD.=\)#disable\1#g' \
         -i ${D}${PTEST_PATH}/tests/unit/Makefile
 
-    #
-    # Disable notification tools tests as currently
-    # these hang and cause the rest of the ptests to timeout
-    #
-    sed -e 's#tools/notification/test_notification_ust##g' \
-        -e 's#tools/notification/test_notification_kernel##g' \
-        -e 's#tools/notification/test_notification_multi_app##g' \
-        -i ${D}${PTEST_PATH}/tests/regression/Makefile
-
     # Substitute links to installed binaries.
     for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd lttng-crash; do
         exedir="${D}${PTEST_PATH}/src/bin/${prog}"
-- 
2.17.1


