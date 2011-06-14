Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOdE-0001K5-Bu
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14284021"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:56 -0700
Message-Id: <14dc6d57d896f6764c3dd327d4cbde9dc70dc58f.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 47/51] task-sdk-host: Add nativesdk to the task name so its clearer what the contents of the task represent
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
X-List-Received-Date: Tue, 14 Jun 2011 08:06:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is particularly important since the file doens't use BBCLASSEXTEND
and PN is therefore misleading

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk.bbclass                  |    2 +-
 ...task-sdk-host.bb => task-sdk-host-nativesdk.bb} |    0
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    2 +-
 ...ost.bb => task-qte-toolchain-host-nativesdk.bb} |    2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/tasks/{task-sdk-host.bb => task-sdk-host-nativesdk.bb} (100%)
 rename meta/recipes-qt/tasks/{task-qte-toolchain-host.bb => task-qte-toolchain-host-nativesdk.bb} (70%)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 413eb52..089ed9a 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -7,7 +7,7 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "task-sdk-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
 
diff --git a/meta/recipes-core/tasks/task-sdk-host.bb b/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
similarity index 100%
rename from meta/recipes-core/tasks/task-sdk-host.bb
rename to meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 72fa702..72d58db 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,6 +1,6 @@
 # Qt Embedded toolchain
 PR = "r5"
-TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
 
diff --git a/meta/recipes-qt/tasks/task-qte-toolchain-host.bb b/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
similarity index 70%
rename from meta/recipes-qt/tasks/task-qte-toolchain-host.bb
rename to meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
index 2ab6ccf..cfa45ef 100644
--- a/meta/recipes-qt/tasks/task-qte-toolchain-host.bb
+++ b/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
@@ -1,4 +1,4 @@
-require recipes-core/tasks/task-sdk-host.bb
+require recipes-core/tasks/task-sdk-host-nativesdk.bb
 
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
-- 
1.7.3.4



