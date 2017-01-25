Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C84A871CA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 21:53:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0PLr03J017713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:53:00 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 25 Jan 2017 13:52:59 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 13:52:59 -0800
Message-ID: <1485381179-30131-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH v2 1/1] gnutls: account for ARM_EABI
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
X-List-Received-Date: Wed, 25 Jan 2017 21:53:00 -0000
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
index 0000000..34c8985
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -0,0 +1,19 @@
+Certain syscall's are not availabe for arm-eabi, so we eliminate
+reference to them.
+
+Upstream-Status: Pending
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


