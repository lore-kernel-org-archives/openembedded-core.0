Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 73B376D200
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 17:49:36 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so827133ead.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2013 09:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5z5js5af53+0QaBAu002+9UcLAuCEn86nkVv+aAZooU=;
	b=oKD9Y4XOPpP7Tg1wj9CQV/fvTa9D+RhjF7tkTHI7foAe9mmtJK5C3vFYPe2qy9Kmct
	5MGtR48C8MDKs5y7JoEwIOdkc3DMkT4km5GTpyA5VRBwjtp6MsX0HOhE2PthJihpO90T
	KSiMTYtuB1f1gh6iglx0y7IHLRln/9unKFRfWrfDjhjTa+LMowI5o1N6Pj1vxVRhSoc5
	S88kHe2mm8OZs9V+SFk1D+IO5C1CzvOy/lZnGMooYnM4cPUfbVt6INWof5EiuIo/607s
	tiwWkup6/+Ima4CrTkOrm0Jpzuv8ut7gYiodcU/8tPdYxqDFimWDkskytfiruijmUb+g
	no2A==
X-Received: by 10.15.61.134 with SMTP id i6mr6806088eex.48.1386438575213;
	Sat, 07 Dec 2013 09:49:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm8613578eem.15.2013.12.07.09.49.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 09:49:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2013 18:49:42 +0100
Message-Id: <1386438582-26461-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
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
X-List-Received-Date: Sat, 07 Dec 2013 17:49:36 -0000

* ltp installs 2 different runtests_noltp.sh files from different
  directories into /opt/ltp/testcases/bin/runtests_noltp.sh
  last one installed wins and causes unexpected changes in
  buildhistory's files-in-image.txt report, rename them to have
  unique name as other ltp scripts have.

* also define PREFERRED_PROVIDER to resolve note shown when
  building with meta-oe layer:
  NOTE: multiple providers are available for ltp (ltp, ltp-ddt)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match ltp

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc     |  2 ++
 ...tests_noltp.sh-script-so-have-unique-name.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb          |  4 ++-
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d4b9db0..e2b0892 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -43,3 +43,5 @@ PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','system
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
+# Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+PREFERRED_PROVIDER_ltp ?= "ltp"
diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
new file mode 100644
index 0000000..74abe56
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
@@ -0,0 +1,38 @@
+From 9751a6526cffcdf4e3dc2cb33641259a7be00e19 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 7 Dec 2013 18:24:32 +0100
+Subject: [PATCH] Rename runtests_noltp.sh script so have unique name
+
+* they are installed in the same target path
+  /opt/ltp/testcases/bin/runtests_noltp.sh
+  and overwrite each other in non-deterministic way
+  when multiple processes are used in "make install"
+
+  ./temp/log.do_install:install -m 00775
+    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/sysvipc/runtests_noltp.sh"
+    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
+  ./temp/log.do_install:install -m 00775
+    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/utsname/runtests_noltp.sh"
+    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ .../kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} | 0
+ .../kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} | 0
+ 2 files changed, 0 insertions(+), 0 deletions(-)
+ rename testcases/kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} (100%)
+ rename testcases/kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} (100%)
+
+diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+similarity index 100%
+rename from testcases/kernel/containers/sysvipc/runtests_noltp.sh
+rename to testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
+similarity index 100%
+rename from testcases/kernel/containers/utsname/runtests_noltp.sh
+rename to testcases/kernel/containers/utsname/runutstests_noltp.sh
+-- 
+1.8.4.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index 5e10448..4722a38 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -21,7 +21,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git"
+SRC_URI = "git://github.com/linux-test-project/ltp.git \
+           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
+"
 
 SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
 S = "${WORKDIR}/git"
-- 
1.8.4.3


