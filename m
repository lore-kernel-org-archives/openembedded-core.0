Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S6ByY-0007xE-PD
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 03:24:06 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2012 03:15:26 +0100
Message-Id: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] package_ipk: apply umask to control and conffiles
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
X-List-Received-Date: Sat, 10 Mar 2012 02:24:06 -0000

* Explicitly set umask to 022. Otherwise the build system's
  umask leaks into the image.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* I tried do_package_ipk[umask] = "022" first, but it didn't work.

 meta/classes/package_ipk.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 565ef93..e7da07a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -317,7 +317,9 @@ python do_package_ipk () {
 		controldir = os.path.join(root, 'CONTROL')
 		bb.mkdirhier(controldir)
 		try:
+			mask = os.umask(022)
 			ctrlfile = file(os.path.join(controldir, 'control'), 'w')
+			os.umask(mask)
 		except OSError:
 			bb.utils.unlockfile(lf)
 			raise bb.build.FuncFailed("unable to open control file for writing.")
@@ -410,7 +412,9 @@ python do_package_ipk () {
 		conffiles_str = localdata.getVar("CONFFILES", True)
 		if conffiles_str:
 			try:
+				mask = os.umask(022)
 				conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
+				os.umask(mask)
 			except OSError:
 				bb.utils.unlockfile(lf)
 				raise bb.build.FuncFailed("unable to open conffiles for writing.")
-- 
1.7.5.4



