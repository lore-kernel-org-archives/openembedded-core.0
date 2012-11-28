Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Tdb5p-0007Za-W7
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 07:25:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAS6BcMx020732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 22:11:38 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 27 Nov 2012 22:11:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 14:11:31 +0800
Message-ID: <16914f95513f9405bbe1371e83647bf8855c2f9a.1354081123.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1354081123.git.jackie.huang@windriver.com>
References: <cover.1354081123.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, saul.wold@intel.com
Subject: [PATCH 2/2] eglibc: always compile with optimization.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 06:26:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

eglibc fails to compile if someone tries to compile an entire image as -O0:
error "glibc cannot be compiled without optimization"
so in this case, force to use -O2 and give a note about it.

[YOCTO #3405]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/eglibc/eglibc.inc |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 3d136bf..1e04197 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -8,6 +8,17 @@ PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
+# eglibc can't be built without optimization, if someone tries to compile an
+# entire image as -O0, we override it with -O2 here and give a note about it.
+def get_optimization(d):
+    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
+    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
+        return selected_optimization.replace("-O0", "-O2")
+    return selected_optimization
+
+SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+
 # siteconfig.bbclass runs configure which needs a working compiler
 # For the compiler to work we need a working libc yet libc isn't 
 # in the sysroots directory at this point. This means the libc.so
-- 
1.7.4



