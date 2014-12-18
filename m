Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60E087278B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rthI021984
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:55 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:54 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:07 +0800
Message-ID: <0ea1de1c5e4859d675eb6fd202a3cb8bd4090786.1418885581.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/19] guile: allow compilation for aarch64
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:56 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Add aarch64 endianness specification to scm file.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/guile/files/arm_aarch64.patch | 19 +++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb         |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch

diff --git a/meta/recipes-devtools/guile/files/arm_aarch64.patch b/meta/recipes-devtools/guile/files/arm_aarch64.patch
new file mode 100644
index 0000000..f1788b6
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/arm_aarch64.patch
@@ -0,0 +1,19 @@
+guile: add aarch64 recognition
+
+Assume little-endian.
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+--- a/module/system/base/target.scm
++++ b/module/system/base/target.scm
+@@ -70,6 +70,8 @@
+             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
+                            "mips" "mips64"))
+              (endianness big))
++            ((string-match "^aarch64" cpu)
++             (endianness little))
+             ((string-match "^arm.*eb" cpu)
+              (endianness big))
+             ((string-match "^arm.*" cpu)
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index bd23c2b..f2c0759 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
+           file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
            "
 
-- 
1.9.1


