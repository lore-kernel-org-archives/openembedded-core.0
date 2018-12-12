Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E46836C492
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 06:42:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBC6gqpN001350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 22:42:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 22:42:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 14:59:58 +0800
Message-ID: <518e8078081513fee5503396f9dd62a7781567f3.1544597612.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544597612.git.liezhi.yang@windriver.com>
References: <cover.1544597612.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] cmake.bbclass/goarch.bbclass: Set CCACHE_DISABLE
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
X-List-Received-Date: Wed, 12 Dec 2018 06:42:51 -0000
Content-Type: text/plain

They can't be built with ccache.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cmake.bbclass  | 4 ++--
 meta/classes/goarch.bbclass | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index b364d2b..12fc452 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -4,8 +4,8 @@ OECMAKE_SOURCEPATH ??= "${S}"
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
 
-# We need to unset CCACHE otherwise cmake gets too confused
-CCACHE = ""
+# We need to disable CCACHE otherwise cmake gets too confused
+CCACHE_DISABLE = "1"
 
 # What CMake generator to use.
 # The supported options are "Unix Makefiles" or "Ninja".
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index b2c94fa..1390f31 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -42,6 +42,10 @@ TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_CFLAGS_mipsarch = "${SECURITY_NOPIE_CFLAGS}"
 SECURITY_NOPIE_CFLAGS ??= ""
 
+# go can't be built with ccache:
+# gcc: fatal error: no input files
+CCACHE_DISABLE = "1"
+
 def go_map_arch(a, d):
     import re
     if re.match('i.86', a):
-- 
2.7.4


