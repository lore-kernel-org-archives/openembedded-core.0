Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sqpja-0004jE-JJ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 20:09:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6GHw7LD017721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:58:07 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 16 Jul 2012 10:58:06 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 12:58:05 -0500
Message-ID: <3b3a4d03862a624e300d93fdae7bbce2d6b80475.1342461305.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1342461305.git.peter.seebach@windriver.com>
References: <cover.1342461305.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tune-ppc476.inc: Support ppc476
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 18:09:27 -0000
Content-Type: text/plain

A couple of boards use chips which perform noticably better
when optimized for the 476. Add a trivial tune file to let
them run better.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/conf/machine/include/tune-ppc476.inc |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppc476.inc

diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
new file mode 100644
index 0000000..5d10261
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppc476.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc476"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-mcpu=476", "", d)}"
+
+AVAILTUNES += "ppc476"
+TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
+TUNE_PKGARCH_tune-ppc476 = "ppc476"
+PACKAGE_EXTRA_ARCHS_tune-ppc476 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
+
+# glibc configure options to get 476 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-with-cpu=476", "", d)}"
-- 
1.7.0.4



