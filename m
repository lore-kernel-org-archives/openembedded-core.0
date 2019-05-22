Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 462717E3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:21:45 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 228051E5738
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:21:46 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id WWynpSjspFrM; Wed, 22 May 2019 18:21:45 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 9EF311E5734;
	Wed, 22 May 2019 18:21:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9EF311E5734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558563705;
	bh=/wplzgRhfL+UTXgFaPkL6HyLwRYI9CHf8E0AJZwYzqU=;
	h=From:To:Date:Message-Id;
	b=d5CcykFGKfsb6zOasic5Hc7yag0nVMxI4Jgn0CC2gtVEC3hVNQ0ZLZqvRViVzP00a
	E9gBgAdR7tiO/htqNpAxxNQ/+IDi9g/dXU0mKCQMKEL+jlTU/ULqAMWLOeZOzTEfYf
	vJVzrsbMHitdvUV3LCWQeKC1NJyy4dA+s3tHYBydS446hTiw2tkWUQkQJDerIrc2ix
	sIZelb6sfPMIZpWQQv4uubtL7Zt5CT6zleUe3Nm9fCKF/r/SRjS/QMISjDr3JTpXt/
	lPRmf4aC4y5l0QbDiwdGPopk69wHgDXoIZLRrqDvkha/z2zMG6dZooBoZh23VjgWh9
	dgFIeq4Dhb39w==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id Q_4jf0x6rM9w; Wed, 22 May 2019 18:21:45 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 7C44B1E572F;
	Wed, 22 May 2019 18:21:45 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 22:21:31 +0000
Message-Id: <20190522222132.25731-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 1/2] lttng-tools: prevent test timeout when lttng-modules is not present
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
X-List-Received-Date: Wed, 22 May 2019 22:21:45 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...ttng-modules-presence-before-testing.patch | 26 +++++++++++++++++++
 .../lttng/lttng-tools_2.10.6.bb               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-lttng-modules-presence-before-testing.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-lttng-modules-presence-before-testing.patch b/meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-lttng-modules-presence-before-testing.patch
new file mode 100644
index 0000000000..04a773e8c5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-lttng-modules-presence-before-testing.patch
@@ -0,0 +1,26 @@
+From 58e4dcce48b48b68b65bffc0cd51d9e26b44c75d Mon Sep 17 00:00:00 2001
+From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Date: Wed, 22 May 2019 16:44:54 -0400
+Subject: [PATCH] Fix: check for lttng modules presence before testing
+
+Upstream-status: Submitted [1]
+
+[1] https://lists.lttng.org/pipermail/lttng-dev/2019-May/028987.html
+
+Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+---
+ tests/regression/tools/notification/test_notification_multi_app | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
+index 29b0f62..a6baf65 100755
+--- a/tests/regression/tools/notification/test_notification_multi_app
++++ b/tests/regression/tools/notification/test_notification_multi_app
+@@ -484,6 +484,7 @@ else
+ fi
+ 
+ if [ "$(id -u)" == "0" ]; then
++	validate_lttng_modules_present
+ 	TESTS+=(
+ 	test_multi_app_kernel
+ 	test_on_register_evaluation_kernel
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index a3fabb20ec..f1bb7224f3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch \
            file://0006-Tests-check-for-lttng-modules-presence.patch \
            file://0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch \
+           file://0008-Fix-check-for-lttng-modules-presence-before-testing.patch \
            "
 
 SRC_URI[md5sum] = "e88c521b5da6bb48a8187af633336ecc"
-- 
2.17.1


