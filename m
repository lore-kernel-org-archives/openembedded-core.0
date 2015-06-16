Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8895973CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 22:30:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 15:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,628,1427785200"; d="scan'208";a="747962356"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 16 Jun 2015 15:30:39 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 15:29:13 +0000
Message-Id: <1434468553-26749-2-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1434468553-26749-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1434468553-26749-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Jonas=20G=C3=B6ransson?= <jonas.goransson@qmatic.com>
Subject: [PATCH] python3-ctypes: Fix cross compilation for arm targets
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
X-List-Received-Date: Tue, 16 Jun 2015 22:30:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cross compiling for arm targets ctypes compilation fails because
it uses _sysconfigdata from the HOST, this patches makes it use the
one from TARGET fixing compilation of this module

[YOCTO #7873]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Jonas Göransson <jonas.goransson@qmatic.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 8e0c2ba..7eb99b1 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -69,6 +69,9 @@ export _PYTHON_PROJECT_BASE = "${B}"
 export _PYTHON_PROJECT_SRC = "${S}"
 export CCSHARED = "-fPIC"
 
+# Fix ctypes cross compilation
+export CROSSPYTHONPATH = "${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
+
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
-- 
1.8.4.5


