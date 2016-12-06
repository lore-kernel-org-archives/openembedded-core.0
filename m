Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id BEB086059F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:15 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 0D48EB87EF8; Tue,  6 Dec 2016 12:49:54 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:49 +0100
Message-Id: <1481024991-5882-32-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 31/33] package_deb.bbclass: compress control.tar with the same algorithm as data.tar
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:16 -0000

Yields better compression with xz and fixes a problem invoking gzip.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/package_deb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fb6034c..fa327dd 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -308,7 +308,7 @@ python do_package_deb () {
             conffiles.close()
 
         os.chdir(basedir)
-        ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
+        ret = subprocess.call("PATH=\"%s\" dpkg-deb --uniform-compression -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
             bb.fatal("dpkg-deb execution failed")
-- 
2.7.4


