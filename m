Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2B0E60197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8L86v0N008283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Sep 2018 01:07:07 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 21 Sep 2018 01:06:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 21 Sep 2018 16:16:42 +0800
Message-ID: <1537517802-23907-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssh: depends openssl10 on qemuarm64
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
X-List-Received-Date: Fri, 21 Sep 2018 08:07:33 -0000
Content-Type: text/plain

Since the commit `43838a2 random: fix crng_ready() test' and
`dc12baa random: use a different mixing algorithm for
add_device_randomness()' applied in kernel, the getrandom
hung on qemuarm64. It caused openssl 1.1.x could not work
correctly. In this situation, the openssh also hung at init.

Depends openssl10 on qemuarm64 which did not invoke getrandom.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
index f54dfb5..784f1bb 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
@@ -8,7 +8,12 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
-DEPENDS = "zlib openssl"
+OPENSSL ?= "openssl"
+# The getrandom hung on qemuarm64 which cause openssl 1.1.x could
+# not work correctly, use openssl10 to replace
+OPENSSL_qemuarm64 = "openssl10"
+
+DEPENDS = "zlib ${OPENSSL}"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
-- 
2.7.4


