Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8657F65E51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 09:31:50 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 380633710; Wed, 16 Apr 2014 05:31:51 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WaMBz-00020s-AG; Wed, 16 Apr 2014 10:31:43 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WaMBz-0005Xu-8v; Wed, 16 Apr 2014 10:31:43 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Apr 2014 10:31:36 +0100
Message-Id: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.9.1
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] native.bbclass: Override TARGET_ flags too
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
X-List-Received-Date: Wed, 16 Apr 2014 09:31:54 -0000

TARGET_LDFLAGS is currently defined in bitbake.conf to contain
${TARGET_LINK_HASH_STYLE} which differs between MIPS and other
targets. Since TARGET_LDFLAGS is an exported variable it affects the hash
of every shell task even if it is not used.

We don't want native recipe tasks to have different hashes purely because
they happen to have been built in order to satisfy dependencies for
different MACHINEs since this causes lots of churn in the native sysroot
when switching between MACHINEs.

Making native.bbclass override TARGET_LDFLAGS to use BUILD_LDFLAGS ensures
consistent hashes and is a sensible thing to be doing anyway.

Although they don't appear to have the same detrimental affect on task
hashes TARGET_CPPFLAGS, TARGET_CFLAGS and TARGET_CXXFLAGS should be
overridden too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/native.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5a318d2..2d182f0 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -26,6 +26,10 @@ TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
 TARGET_LD_ARCH = "${BUILD_LD_ARCH}"
 TARGET_AS_ARCH = "${BUILD_AS_ARCH}"
+TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
+TARGET_CFLAGS = "${BUILD_CFLAGS}"
+TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
+TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
 TARGET_FPU = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
-- 
1.9.1


