Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F39E793DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:12:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8J3Cb9I003575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2018 20:12:37 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 18 Sep 2018 20:12:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 19 Sep 2018 11:22:30 +0800
Message-ID: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssh: upgrade 7.8p1 -> 7.8p2 to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 03:12:38 -0000
Content-Type: text/plain

- Convert from tarball to git repository which support
  openssl 1.1.x

- There is no specific minor version that contains the
  openssl fix (it was merged to master a few days agao),
  but their next minor version will be p2.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb}             | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb} (94%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
similarity index 94%
rename from meta/recipes-connectivity/openssh/openssh_7.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.8p2.bb
index f4b295f..b74461e 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
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
 
-- 
2.7.4


