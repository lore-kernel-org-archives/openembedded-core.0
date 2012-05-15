Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SUMSE-0002i9-Jr
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:26:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4FIGbbb000807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 11:16:37 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 15 May 2012 11:16:37 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2012 13:16:34 -0500
Message-ID: <1e6db593f26c551ae2fa39a3e63ac60e884c06bf.1337105658.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337105658.git.peter.seebach@windriver.com>
References: <cover.1337105658.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tcmode-external-csl.inc: Allow for overrides
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
X-List-Received-Date: Tue, 15 May 2012 18:26:41 -0000
Content-Type: text/plain

Wind River uses binary toolchains provided by Code Sourcery, but which
have different values for a couple of the preset variables than the
generic toolchains the external-csl toolchain feature supports.  If
these values were ?= assignments, we could just assign values to them
and share the code, rather than keeping modified copies.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 11c5df5..6bdd466 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -7,14 +7,14 @@ EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
 TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
 PATH =. "${TOOLCHAIN_PATH_ADD}"
 
-CSL_TARGET_SYS_powerpc = "powerpc-linux-gnu"
-CSL_TARGET_SYS_powerpc64 = "powerpc-linux-gnu"
-CSL_TARGET_SYS_arm = "arm-none-linux-gnueabi"
-CSL_TARGET_SYS_mips = "mips-linux-gnu"
-CSL_TARGET_SYS_mipsel = "mips-linux-gnu"
-CSL_TARGET_SYS_mips64 = "mips-linux-gnu"
-CSL_TARGET_SYS_i686 = "i686-pc-linux-gnu"
-CSL_TARGET_SYS_i586 = "i686-pc-linux-gnu"
+CSL_TARGET_SYS_powerpc ?= "powerpc-linux-gnu"
+CSL_TARGET_SYS_powerpc64 ?= "powerpc-linux-gnu"
+CSL_TARGET_SYS_arm ?= "arm-none-linux-gnueabi"
+CSL_TARGET_SYS_mips ?= "mips-linux-gnu"
+CSL_TARGET_SYS_mipsel ?= "mips-linux-gnu"
+CSL_TARGET_SYS_mips64 ?= "mips-linux-gnu"
+CSL_TARGET_SYS_i686 ?= "i686-pc-linux-gnu"
+CSL_TARGET_SYS_i586 ?= "i686-pc-linux-gnu"
 CSL_TARGET_SYS = "${TARGET_SYS}"
 
 TARGET_PREFIX = "${CSL_TARGET_SYS}-"
@@ -58,7 +58,7 @@ def csl_target_core(d):
     }
     return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
 
-CSL_TARGET_CORE = "${@csl_target_core(d)}"
+CSL_TARGET_CORE ?= "${@csl_target_core(d)}"
 
 # Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
 # bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
-- 
1.7.0.4



