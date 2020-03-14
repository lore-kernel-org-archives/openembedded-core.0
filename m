Return-Path: <daisuke.yamane@miraclelinux.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4AC60581
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 13:09:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ca13so5838569pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 06:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tCtk6NCwLL56orLqRMm8SaAY5R8sil4SDMGY6kzEozQ=;
	b=Aa7ahtGMxbQ1CacL6j4B3TYh79iD+RbkyghyV0yvcqYlRaMGl7BVQwNxt+/rxjGw96
	8a3dBjatUZya2yoWxIP0WzHgV3RPQEyCX71MYFKvZpPcAbwYY8j1eHkA0Zy+MwW0qm9q
	qsWfYVUiMe8lj62lK9ljhZ4DOYSw7a0wdPBqfq/mmDIfZwHE7azt2pXZ6deL/dIa19tO
	KDcJ0UXDBPRhLxZpale7z0hWfF2Y3mQrHfjSCCGKMH90ahLNzLVJUY6yMiYp4gDCUqYm
	gUtZl/bXU4RrOtCKuTbwlSi+KwnBW6kZdGv+dMx8eIDoRreQrYhbDOVyHmEgs/omX5Su
	Kchw==
X-Gm-Message-State: ANhLgQ0Je1L0/Mc7VCjNN9RVmDURTZqTeBF023ruCn/0rbz9GmARdfsS
	dg4xEF89jx1xwvmwhK4716Wj0iOrn4o=
X-Google-Smtp-Source: ADFU+vvqTzRCjR8wy3rorq+52KQFgVTlqy9gxWPVY3m+HbKIvj7iYUVUXOsOK+SqaTGGqJYBTc7CRQ==
X-Received: by 2002:a17:90b:11d0:: with SMTP id
	gv16mr12095325pjb.106.1584191387840; 
	Sat, 14 Mar 2020 06:09:47 -0700 (PDT)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.googlemail.com with ESMTPSA id
	v5sm4733376pjn.2.2020.03.14.06.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Mar 2020 06:09:47 -0700 (PDT)
From: Daisuke Yamane <daisuke.yamane@cybertrust.co.jp>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2020 13:09:42 +0000
Message-Id: <1584191382-14094-1-git-send-email-daisuke.yamane@cybertrust.co.jp>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] selftest/package: Add test to ensure ownership is preserved
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
X-List-Received-Date: Sat, 14 Mar 2020 13:09:48 -0000

Yocto Bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13806

Add test_preserve_ownership to selftest/package.
This test creates a file, a directory and a symbolic link and changes ownership,
then compares with them installed in rootfs to ensure ownership is preserved.

[Test without a commit 'bitbake: lib/bb/utils.py: Preserve ownership of symlink']
| 2020-03-14 10:01:14,519 - oe-selftest - INFO - test_preserve_ownership (package.PackageTests)
| 2020-03-14 10:56:44,612 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/file
| 2020-03-14 10:56:44,770 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/dir
| 2020-03-14 10:56:44,822 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/symlink
| 2020-03-14 10:56:44,879 - oe-selftest - ERROR - Incrrect ownership /etc/selftest-chown/symlink [root:root]
| 2020-03-14 10:56:45,884 - oe-selftest - INFO -  ... FAIL

[Test with a commit 'bitbake: lib/bb/utils.py: Preserve ownership of symlink']
| 2020-03-14 10:58:49,599 - oe-selftest - INFO - test_preserve_ownership (package.PackageTests)
| 2020-03-14 11:51:39,947 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/file
| 2020-03-14 11:51:40,013 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/dir
| 2020-03-14 11:51:40,063 - oe-selftest - INFO - Check ownership of /etc/selftest-chown/symlink
| 2020-03-14 11:51:41,118 - oe-selftest - INFO -  ... ok

Signed-off-by: Daisuke Yamane <daisuke.yamane@cybertrust.co.jp>
---
 .../recipes-test/selftest-chown/selftest-chown.bb  | 25 ++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/package.py            | 23 ++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-chown/selftest-chown.bb

diff --git a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
new file mode 100644
index 0000000..87bf943
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
@@ -0,0 +1,25 @@
+SUMMARY = "selftest chown"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-u 1234 -M test"
+TESTDIR = "${D}${sysconfdir}/selftest-chown"
+
+do_install() {
+	install -d   ${TESTDIR}
+	install -d   ${TESTDIR}/dir
+	touch        ${TESTDIR}/file
+	ln -s ./file ${TESTDIR}/symlink
+
+	chown    test:test ${TESTDIR}/file
+	chown -R test:test ${TESTDIR}/dir
+	chown -h test:test ${TESTDIR}/symlink
+}
+
+FILES_${PN} = "${sysconfdir}/selftest-chown/*"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index b87f8dc..3010b1a 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -148,3 +148,26 @@ class PackageTests(OESelftestTestCase):
                            '/usr/libexec/hello4']:
                 if not gdbtest(qemu, binary):
                     self.fail('GDB %s failed' % binary)
+
+    def test_preserve_ownership(self):
+        import os, stat, oe.cachedpath
+        features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
+        self.write_config(features)
+        bitbake("core-image-minimal")
+
+        sysconfdir = get_bb_var('sysconfdir', 'selftest-chown')
+        def check_ownership(qemu, gid, uid, path):
+            self.logger.info("Check ownership of %s", path)
+            status, output = qemu.run_serial(r'/bin/stat -c "%U %G" ' + path, timeout=60)
+            output = output.split(" ")
+            if output[0] != uid or output[1] != gid :
+                self.logger.error("Incrrect ownership %s [%s:%s]", path, output[0], output[1])
+                return False
+            return True
+
+        with runqemu('core-image-minimal') as qemu:
+            for path in [ sysconfdir + "/selftest-chown/file",
+                          sysconfdir + "/selftest-chown/dir",
+                          sysconfdir + "/selftest-chown/symlink"]:
+                if not check_ownership(qemu, "test", "test", path):
+                    self.fail('Test ownership %s failed' % path)
-- 
2.7.4


