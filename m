Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22415766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:58:20 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so147056176wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 00:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5BeKHL5bMBnocLkQEYz/hx3pk9kq8umMFLz3b7pFMlI=;
	b=s8CjoAwfjFaC8tqLEmqLb/NUzUBekH9W3UfyHD45k+yIHzWu3V+Cm2pgjZUz7p6ouf
	BQpgU2LjOYTVQTP+RWB+Mue0jMjszpIceR525zUDiaGuQUwqFhcvXLOshPk89/+afGdG
	Ty0ZUK4I2AH/m2p8H3xihjZYJYH2XeJZpbT8J14JgP3ajCvI2fSUoDvkA4vfOjoVgyQd
	l96+K8s9HtDNKnAg4pXQvfakDCQicJb93rAi6U8KFPr4YB/v9wrDgmJAvk0As+vGBcDY
	KhrujEh8Bu//T/8SY9pePeZ378F6dbcYj+e8OpYo/Os6NEK+khHjM4kw69gyLeYOyH+F
	fX9Q==
X-Received: by 10.28.217.130 with SMTP id q124mr3039331wmg.92.1447145899299;
	Tue, 10 Nov 2015 00:58:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm2327900wjx.12.2015.11.10.00.58.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 00:58:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 09:58:11 +0100
Message-Id: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][master][jethro][fido][dizzy] image.bbclass: don't add BUILDNAME to do_rootfs vardeps
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
X-List-Received-Date: Tue, 10 Nov 2015 08:58:21 -0000

* it was explicitly excluded in rootfs_*.bbclass which doesn't use this
  variable anymore, so we can drop it there, but I don't understand why
  it was added explicitly in image.bbclass, we don't want image to
  rebuild just because timestamp is different.
* causes following ERROR when bitbake -S is used:
  NOTE: Reparsing files to collect dependency data
  Writing locked sigs to locked-sigs.inc
  ERROR: Bitbake's cached basehash does not match the one we just generated (some-image.bb.do_rootfs)!
  ERROR: The mismatched hashes were 508d48864b14ce94ca69ea6062f9e5f8 and f81487a10e995426d493a4a50b088721
  $ bitbake-diffsigs BUILD/sstate-diff/c*/foo/bar/some-image/*do_rootfs.sig*
  basehash changed from f81487a10e995426d493a4a50b088721 to 263d1d44d6fda0101c89de3b2a489af9
  Variable BUILDNAME value changed from '201511100025' to '201511100037'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image.bbclass      | 2 +-
 meta/classes/rootfs_deb.bbclass | 1 -
 meta/classes/rootfs_ipk.bbclass | 1 -
 meta/classes/rootfs_rpm.bbclass | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1c0fda7..c0f9775 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -94,7 +94,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
-                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
+                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index d51b458..f79fca6 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,7 +8,6 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
-rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6139cc7..bb6f777 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -13,7 +13,6 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_popu
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
-rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d85d001..b4cd55b 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -22,7 +22,6 @@ do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
-rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
-- 
2.6.2


