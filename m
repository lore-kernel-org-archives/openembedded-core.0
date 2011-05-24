Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QOsGc-0000Ck-8H
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:07:26 +0200
Received: by wwb17 with SMTP id 17so6054234wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 07:04:25 -0700 (PDT)
Received: by 10.227.199.207 with SMTP id et15mr3452669wbb.56.1306245864618;
	Tue, 24 May 2011 07:04:24 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bo14sm4794717wbb.28.2011.05.24.07.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 07:04:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2011 16:04:20 +0200
Message-Id: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 14:07:26 -0000

In the current situation TARGET_ARCH will override MACHINE, which is counter intuitive since the machine is more specific than the arch.

The order is now pn-$PN} -> arch -> machine -> distro as the machine is a set of defaults and the distro is the ultimate policy.

'failfast' has been removed since it's not used anymore, just like 'local'
---
 meta/conf/bitbake.conf |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0af672..59238b8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -602,15 +602,15 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 # 
 # This means that an envionment variable named '<foo>_arm' overrides an
 # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
-# An environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
-# '<foo>_arm' when ${MACHINE} is 'ramses'. 
-# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' will override 
-# '<foo>_arm' and then '<foo>' will be overriden with that value from '<foo>_arm'.
-# And finally '<foo>_local' overrides any standard variable, but with lowest priority.
+# An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
+# '<foo>_arm' when ${MACHINE} is 'qemuarm'. 
+# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override 
+# '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
+# And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
 DISTROOVERRIDES ?= "${DISTRO}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 
-- 
1.6.6.1



