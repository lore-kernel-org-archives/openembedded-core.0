Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDAC877029
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 21:30:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4ILUnR8005049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 14:30:50 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 14:30:48 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 16:30:47 -0500
Message-ID: <2524645d574a638c4ebed7d0a4ea868a9de6b845.1463606862.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1463606862.git.peter.seebach@windriver.com>
References: <cover.1463606862.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] acl.inc, run-ptest: improve ptest functionality on limited rootfs
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
X-List-Received-Date: Wed, 18 May 2016 21:30:50 -0000
Content-Type: text/plain

ACL's ptest has a handful of failure modes which can be triggered by
a restrictive or small system. First, the ptest requires that daemon
be in the bin group, which run-ptest attempts to do using gpasswd,
but gpasswd is part of shadow, and oe-core removes shadow when it
doesn't think shadow will be needed. Even if, say, a package has
RDEPENDS on it. Whoops. So we manually sed the group file. This
will probably work.

Second, the filesystem used for the test has to support ACLs,
so we create a dummy ext3 filesystem and use that.

Third, the root/permissions test relies on the assumption that
"mkdir d" produces a directory which non-root users can access,
but in a secure product which defaults to umask 077, this doesn't
work. (That fix has been separately reported to upstream acl
through their bug report form.)

(This may prevent the test from running without mkfs.ext3, but it
allows the test to run on targets where root doesn't have ACL
support. Tradeoffs, tradeoffs everywhere.)

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |    1 +
 meta/recipes-support/attr/acl/run-ptest            |   67 ++++++++++++++++++--
 .../attr/acl/test-fix-directory-permissions.patch  |   24 +++++++
 3 files changed, 87 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/attr/acl/test-fix-directory-permissions.patch

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index 198fb4f..aebebfd 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -14,6 +14,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
            file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
            file://test-fix-insufficient-quoting-of.patch \
            file://test-fixups-on-SELinux-machines-for-root-testcases.patch \
+           file://test-fix-directory-permissions.patch \
 "
 
 require ea-acl.inc
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
index 3b31cc9..a56946d 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -1,7 +1,64 @@
 #!/bin/sh
+#
+#This script is used to run acl test suites
 
-gpasswd -a daemon bin
-make -C test -k tests root-tests |sed \
- -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
- -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-gpasswd -d daemon bin
+#umask 077
+
+EXT3_IMAGE=ext3.img
+EXT3_MOUNT_POINT=/mnt/ext3
+
+trap 'rm -f ${EXT3_IMAGE}' EXIT
+
+dd if=/dev/zero of=${EXT3_IMAGE} bs=1M count=1
+if [ "$?" -eq 0 ]; then
+	echo "PASS: dump ext3.img"
+else
+	echo "FAIL: dump ext3.img"
+	exit 1
+fi
+
+mkfs.ext3 -F ${EXT3_IMAGE}
+if [ "$?" -eq 0 ]; then
+	echo "PASS: mkfs.ext3 -F ext3.img"
+else
+	echo "FAIL: mkfs.ext3 -F ext3.img"
+	exit 1
+fi
+
+if [ -d $EXT3_MOUNT_POINT ]; then
+	echo "mount point exist"
+else
+	mkdir -p $EXT3_MOUNT_POINT
+fi
+
+
+mount -o loop,rw,acl  ${EXT3_IMAGE} $EXT3_MOUNT_POINT
+if [ "$?" -eq 0 ]; then
+	echo "PASS: mount ext3.img"
+else
+	echo "FAIL: mount ext3.img"
+	exit 1
+fi
+
+cp -rf ./test/ $EXT3_MOUNT_POINT
+
+cd $EXT3_MOUNT_POINT/test/
+
+if	sed -e 's!^bin:x:2:$!bin:x:2:daemon!' < /etc/group > gtmp
+then	if	cp /etc/group group.orig;
+	then	cp gtmp /etc/group
+		make  -k tests root-tests | sed \
+			-e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
+	  		-e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
+		cp group.orig /etc/group
+	else	echo "FAIL: couldn't save original group file."
+		exit 1
+	fi
+else	echo "FAIL: couldn't create modified group file."
+	exit 1
+fi
+
+cd -
+umount $EXT3_MOUNT_POINT
+rm -rf $EXT3_MOUNT_POINT
+rm $EXT3_IMAGE
diff --git a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
new file mode 100644
index 0000000..cd4510c
--- /dev/null
+++ b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
@@ -0,0 +1,24 @@
+commit c45bae84817a70fef6c2b661a07a492a0d23ae85
+Author: Peter Seebach <peter.seebach@windriver.com>
+Date:   Wed May 11 15:16:06 2016 -0500
+
+    Fix permissions on temporary directory
+
+    The temporary directory's permissions have to allow other users to
+    view the directory. A default umask of 022 is common, but not mandatory,
+    and secure systems may have more restrictive defaults.
+
+    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
+
+diff --git a/test/root/permissions.test b/test/root/permissions.test
+index 42615f5..098b52a 100644
+--- a/test/root/permissions.test
++++ b/test/root/permissions.test
+@@ -16,6 +16,7 @@ Cry immediately if we are not running as root.
+ First, set up a temporary directory and create a regular file with
+ defined permissions.
+ 
++	$ umask 022
+ 	$ mkdir d
+ 	$ cd d
+ 	$ umask 027
-- 
1.7.1


