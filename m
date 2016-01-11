Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E43FD731FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 21:12:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BLC9eM006313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:12:09 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 13:12:08 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 15:12:05 -0600
Message-ID: <1452546725-211503-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1452546725-211503-1-git-send-email-mark.hatle@windriver.com>
References: <1452546725-211503-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 [RFC]] image.bbclass: Unconditional includes of populate_sdk_ext fails
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
X-List-Received-Date: Mon, 11 Jan 2016 21:12:09 -0000
Content-Type: text/plain

populate_sdk_ext requires uninative support, which is only available on
glibc based SDKMACHINES.  For instance, when using mingw32 a dependency
error will occur:

NOTE: Runtime target 'nativesdk-glibc' is unbuildable, removing...
ERROR: Required build target 'core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-minimal', 'uninative-tarball', 'nativesdk-glibc']

This is dues to populate_sdk_ext.bbclass having:
do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
addtask populate_sdk_ext

Since bitbake can't determine for dependency resolution if the task is going
to be run yet, it blows up and says it simply can't be resolved.

Workaround this problem by making the inherit conditional on the SDK_OS
containing 'linux'.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e3769b4..d37995a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,6 +1,9 @@
 inherit rootfs_${IMAGE_PKGTYPE}
 
-inherit populate_sdk_ext
+# Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk
+# in the non-Linux SDK_OS case, such as mingw32
+SDKEXTCLASS ?= "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS", True)]}"
+inherit ${SDKEXTCLASS}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
-- 
1.9.3


