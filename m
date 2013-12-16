Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAB56E50D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:33:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3XHKS003387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:33:18 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 15 Dec 2013 19:33:17 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Dec 2013 11:33:01 +0800
Message-ID: <f540d1021de75527fdfdb8306f53f5454e6b9f62.1387164126.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387164126.git.kai.kang@windriver.com>
References: <cover.1387164126.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] lsbtest: add ppc64 support
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
X-List-Received-Date: Mon, 16 Dec 2013 03:33:19 -0000
Content-Type: text/plain

LSB supports to test on PPC64 target, so update lsbtest recipe and test
scripts to enable PPC64 support.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh |  2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index 37ce3f1..12f0054 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -29,7 +29,7 @@ EOF
 fi
 
 ARCH=`uname -m`
-if [ ${ARCH} != "i686" ] && [ ${ARCH} != "x86_64" ] && [ ${ARCH} != "ppc" ]
+if [ ${ARCH} != "i686" ] && [ ${ARCH} != "x86_64" ] && [ ${ARCH} != "ppc" ] && [ ${ARCH} != "ppc64" ]
 then
 	echo "Error: Unsupported architecture"
 	exit 1
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 8973e09..520c1e7 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -31,6 +31,18 @@ do_install() {
 		sed -i -e 's/lsbarch/ppc32/g' -e 's/targetarch/ppc/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/PPC32/g' ${D}/opt/lsb-test/session
 	fi
+
+	# For a ppc64 target. the default userspace is 32b.
+	# Therefore, only change the lsbarch and targetarch
+	# in the package_list when MLIB=lib64 is being used.
+	# Otherwise, by default, the ppc32 LSB packages
+	# will be downloaded by LSB_Test.sh
+	if [ "${TARGET_ARCH}" == "powerpc64" ];then
+		if [ "${PN}" != "${BPN}" ];then
+			sed -i -e 's/lsbarch/ppc64/g' -e 's/targetarch/ppc64/g' ${D}/opt/lsb-test/packages_list
+			sed -i -e 's/targetarch/PPC64/g' ${D}/opt/lsb-test/session
+		fi
+	fi
 }
 
 FILES_${PN} += "/opt/lsb-test/* \
-- 
1.8.1.2


