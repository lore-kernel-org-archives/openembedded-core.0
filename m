Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECBA7717A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id EB8D160029B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:52 +0100
Message-Id: <33960902b9c36575ddda3d926d70fa13bbad85f6.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 31/52] qemu: disable Valgrind
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:25 -0000

From: Ross Burton <ross.burton@intel.com>

Qemu has an automatic dependency on valgrind which cannot be disabled, which
causes non-deterministic builds and build failures.  As Valgrind wasn't enabled
previously make this deterministic by forcibly disabling it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu/no-valgrind.patch | 19 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb          |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch

diff --git a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
new file mode 100644
index 0000000..91f7280
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
@@ -0,0 +1,19 @@
+There isn't an option to enable or disable valgrind support, so disable it to avoid non-deterministic builds.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure b/configure
+index b3c4f51..4d3929e 100755
+--- a/configure
++++ b/configure
+@@ -4193,9 +4192,0 @@ valgrind_h=no
+-cat > $TMPC << EOF
+-#include <valgrind/valgrind.h>
+-int main(void) {
+-  return 0;
+-}
+-EOF
+-if compile_prog "" "" ; then
+-    valgrind_h=yes
+-fi
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 59b1788..1505b80 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix1.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
+            file://no-valgrind.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.1.4


