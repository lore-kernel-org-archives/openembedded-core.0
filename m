Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 753EF79612
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:50:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8JBnqZl007132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 04:50:03 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Sep 2018 04:49:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 19 Sep 2018 19:59:29 +0800
Message-ID: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 11:50:48 -0000
Content-Type: text/plain

- Convert from tarball to git repository which support
  openssl 1.1.x

- There is no specific minor version that contains the
  openssl fix (it was merged to master a few days agao),
  rename recipe version to `7.8p1+git'

- Fix regression test binaries missing
  In commit `1f7aaf7 openssh: build regression test binaries', it build
  regression test binaries, since upstream add two binaries in commits
  `c59aca8 Create control sockets in clean temp directories' and
  `1acc058 Disable tests where fs perms are incorrect', we should update
  do_compile_ptest.

  [ptest log]
  |/usr/lib/openssh/ptest/regress/test-exec.sh: line 330: /usr/lib/openssh/
  ptest/regress/mkdtemp: No such file or directory
  [ptest log]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssh/{openssh_7.8p1.bb => openssh_7.8p1+git.bb}      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.8p1.bb => openssh_7.8p1+git.bb} (94%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
similarity index 94%
rename from meta/recipes-connectivity/openssh/openssh_7.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
index f4b295f..f54dfb5 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
@@ -8,11 +8,10 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
-# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
-DEPENDS = "zlib openssl10"
+DEPENDS = "zlib openssl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
+SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
            file://sshd_config \
            file://ssh_config \
            file://init \
@@ -29,8 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "ce1d090fa6239fd38eb989d5e983b074"
-SRC_URI[sha256sum] = "1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca"
+SRCREV = "cce8cbe0ed7d1ba3a575310e0b63c193326ae616"
+
+S = "${WORKDIR}/git"
 
 inherit useradd update-rc.d update-alternatives systemd
 
@@ -80,7 +80,8 @@ do_configure_prepend () {
 do_compile_ptest() {
         # skip regress/unittests/ binaries: this will silently skip
         # unittests in run-ptests which is good because they are so slow.
-        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat
+        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat \
+                   regress/check-perm regress/mkdtemp
 }
 
 do_install_append () {
-- 
2.7.4


