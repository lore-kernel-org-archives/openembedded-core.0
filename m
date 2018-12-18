Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7DD27BFF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:01:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI718BB006015
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:01:08 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:01:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:04 +0800
Message-ID: <829cd16b679c90dcd5afc7417e947e62d678fa93.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 04/11] ccache.bbclass: Make it can be shared between different builds
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
X-List-Received-Date: Tue, 18 Dec 2018 07:01:07 -0000
Content-Type: text/plain

CCACHE_BASEDIR: ccache removes this from file path, so that hashes will be
                the same in different build dirs.

CCACHE_TOP_DIR: Set it to a shared location for different builds.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 59e1022..f3612c5 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -8,8 +8,28 @@
 #   Add the following line to the recipe if it can't be built with ccache:
 #   CCACHE_DISABLE = '1'
 #
+# - Share ccache files between different builds
+#   Set CCACHE_TOP_DIR to a shared dir
+#   CCACHE_TOP_DIR = /path/to/shared_ccache/
+#
+# - TO debug ccahe
+#   export CCACHE_DEBUG = "1"
+#   export CCACHE_LOGFILE = "${CCACHE_DIR}/logfile.log"
+#   And also set PARALLEL_MAKE = "-j 1" to get make the log in order
+#
+
+# Set it to a shared location for different builds, so that cache files can
+# be shared between different builds.
+CCACHE_TOP_DIR ?= "${TMPDIR}/ccache"
+
+# ccahe removes CCACHE_BASEDIR from file path, so that hashes will be the same
+# in different builds.
+export CCACHE_BASEDIR ?= "${TMPDIR}"
+
+# Used for sharing cache files after compiler is rebuilt
+export CCACHE_COMPILERCHECK ?= "%compiler% -dumpspecs"
 
-export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}"
+export CCACHE_DIR ?= "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
 
 # We need to stop ccache considering the current directory or the
 # debug-prefix-map target directory to be significant when calculating
-- 
2.7.4


