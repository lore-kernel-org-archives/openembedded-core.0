Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 69A4A731D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:20:11 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 02/14/2017 9:20:12 AM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 9/27/2016 9:09:05 PM UTC
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-96/SG:2 2/14/2017 9:19:50 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.495056 p=-1 Source Normal
X-Signature-Violations: 0-0-0-9179-c
X-Note-419: 109.505 ms. Fail:0 Chk:1357 of 1357 total
X-Note: VSCH-CT/SI: 0-1357/SG:1 2/14/2017 9:19:50 AM
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G273 G274 G275 G276 G280 G281 G409 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 113929872; Tue, 14 Feb 2017 09:20:11 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cddxi-000EwD-Fw; Tue, 14 Feb 2017 14:20:10 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cddxi-0006yJ-FC; Tue, 14 Feb 2017 14:20:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 14:20:02 +0000
Message-Id: <20170214142002.26759-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.12.0.rc0
MIME-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] kernel, license, sstate, rootfs.py: Remove deploy directory README
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
X-List-Received-Date: Tue, 14 Feb 2017 14:20:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It isn't clear that the README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
file in the deploy directory warrants the complexity it brings elsewhere.
Let's just remove it entirely.

In particular, if two do_image_complete tasks run in parallel they risk
both trying to put their image into ${DEPLOY_DIR_IMAGE} at the same time.
Both will contain a README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
file. In theory this should be safe because "cp -alf" will just cause one
to overwrite the other. Unfortunately, coreutils cp also has a race[1]
which means that if one copy creates the file at just the wrong point the
other will fail with:

 cp: cannot create hard link ‘..../tmp-glibc/deploy/images/pantera/README_-_DO_NOT_DELETE_FILES_IN_THIS_D.txt’ to
+‘..../tmp-glibc/work/rage_against-oe-linux-gnueabi/my-own-image/1.0-r0/deploy-my-own-image-complete/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt’: File exists

[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25680

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass     | 2 --
 meta/classes/license.bbclass    | 2 +-
 meta/classes/sstate.bbclass     | 2 --
 meta/files/deploydir_readme.txt | 8 --------
 meta/lib/oe/rootfs.py           | 4 ----
 5 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta/files/deploydir_readme.txt

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f462b2ff41..9f079a97a0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -608,8 +608,6 @@ kernel_do_deploy() {
 		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
 	done
 
-	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
-
 	cd ${B}
 	# Update deploy directory
 	for type in ${KERNEL_IMAGETYPES} ; do
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 44467d09bf..5b01bc6577 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -279,7 +279,7 @@ def get_deployed_files(man_file):
     """
 
     dep_files = []
-    excluded_files = ["README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"]
+    excluded_files = []
     with open(man_file, "r") as manifest:
         all_files = manifest.read()
     for f in all_files.splitlines():
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index bd9c2ae02e..450c068863 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -30,8 +30,6 @@ SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 # Archive the sources for many architectures in one deploy folder
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
-# Ignore overlapping README
-SSTATE_DUPWHITELIST += "${DEPLOY_DIR}/sdk/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
diff --git a/meta/files/deploydir_readme.txt b/meta/files/deploydir_readme.txt
deleted file mode 100644
index 97ec1855f5..0000000000
--- a/meta/files/deploydir_readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Files in the deploy directory will not be re-created automatically if you
-delete them. If you do delete a file, you will need to run:
-
-  bitbake -c clean TARGET
-  bitbake TARGET
-
-where TARGET is the name of the appropriate package or target e.g.
-"virtual/kernel" for the kernel, an image, etc.
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9c8a0ebb7e..cc111ff3c8 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -189,10 +189,6 @@ class Rootfs(object, metaclass=ABCMeta):
 
         shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
-        shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
-                    self.deploydir +
-                    "/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt")
-
         execute_pre_post_process(self.d, pre_process_cmds)
 
         if self.progress_reporter:
-- 
2.12.0.rc0


