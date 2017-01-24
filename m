Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C815719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 20:09:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0OK9nAE001977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:09:49 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 24 Jan 2017 12:09:47 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2017 12:09:47 -0800
Message-ID: <1485288587-19549-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] gnutls: account for ARM_EABI
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
X-List-Received-Date: Tue, 24 Jan 2017 20:09:51 -0000
Content-Type: text/plain

Do not reference unavailable system calls when
building for ARM_EABI.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/gnutls/gnutls/arm_eabi.patch |   19 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.7.bb       |    1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/arm_eabi.patch

diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
new file mode 100644
index 0000000..8bf06f1
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -0,0 +1,19 @@
+Certain syscall's are not availabe for arm-eabi, so we eliminate
+reference to them.
+
+Upstream-status: pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/tests/seccomp.c
++++ b/tests/seccomp.c
+@@ -49,7 +49,9 @@ int disable_system_calls(void)
+ 	}
+ 
+ 	ADD_SYSCALL(nanosleep, 0);
++#if ! defined(__ARM_EABI__)
+ 	ADD_SYSCALL(time, 0);
++#endif
+ 	ADD_SYSCALL(getpid, 0);
+ 	ADD_SYSCALL(gettimeofday, 0);
+ #if defined(HAVE_CLOCK_GETTIME)
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.7.bb b/meta/recipes-support/gnutls/gnutls_3.5.7.bb
index cf77a20..9508a8e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.7.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch \
+            file://arm_eabi.patch \
            "
 SRC_URI[md5sum] = "08ad2c539bc1d91283f610539deef34e"
 SRC_URI[sha256sum] = "60cbfc119e6268cfa38d712621daa473298a0c5b129c0842caec4c1ed4d7861a"
-- 
1.7.9.5


