Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 974526FF93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 11:26:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bCmU4-0002cf-0b from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2016 04:26:16 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 14 Jun 2016 12:26:14 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2016 16:26:08 +0500
Message-ID: <1465903568-8189-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python3: fix CROSSPYTHONPATH for cross builds
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
X-List-Received-Date: Tue, 14 Jun 2016 11:26:16 -0000
Content-Type: text/plain

There are cases where target and host are of the same
type and at such instances the target modules may be
loaded if CROSSPYTHONPATH is not correct. This adds
host library paths so that target modules are not
loaded while cross compiling to avoid illegal instruction
issues.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-devtools/python/python3_3.5.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index ebfdcdb..78ae174 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -70,8 +70,8 @@ export _PYTHON_PROJECT_BASE = "${B}"
 export _PYTHON_PROJECT_SRC = "${S}"
 export CCSHARED = "-fPIC"
 
-# Fix ctypes cross compilation
-export CROSSPYTHONPATH = "${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
+# Fix cross compilation of different modules
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
 
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
-- 
1.9.1


