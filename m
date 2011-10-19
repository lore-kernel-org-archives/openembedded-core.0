Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RGUCh-0005nB-52
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 13:20:59 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 19 Oct 2011
	13:15:05 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 13:15:19 +0200
Message-ID: <40dcebe98e97bb4fabfec74e9e7acb59548da091.1319022793.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1319022793.git.anders@chargestorm.se>
References: <cover.1319022793.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 1/1] module.bbclass: add lock to prevent error bulding ext modules
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
X-List-Received-Date: Wed, 19 Oct 2011 11:20:59 -0000
Content-Type: text/plain

When external modules are built, files in $STAGING_KERNEL_DIR/scripts/basic will/can get
rebuilt.
This raises a potential race condition. Prevent this by adding a lock around the
do_make_scripts() function. Further, make sure that the kernel has been installed
to the sysroot, prior to executing this new task.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/module.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 572df0d..53c16b7 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -14,8 +14,11 @@ do_make_scripts() {
 	           -C ${STAGING_KERNEL_DIR} scripts
 }
 
+addtask make_scripts before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[deptask] = "do_populate_sysroot"
+
 module_do_compile() {
-	do_make_scripts
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 		   KERNEL_SRC=${STAGING_KERNEL_DIR}    \
-- 
1.7.7



