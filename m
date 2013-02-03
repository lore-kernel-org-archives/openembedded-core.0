Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fJ-0002br-Fn
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUO020480; Mon, 4 Feb 2013 00:01:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EVSM47ykrGtU; Mon,  4 Feb 2013 00:01:21 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401CHP020459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:13 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pk-0000Y6-Tk; Sun, 03 Feb 2013 23:56:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:45 +0000
Message-Id: <1752a0b8a297183395ca1b4b152c8c592d210a90.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/22] package.bbclass: Make use of cleandirs and dirs function flags
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

We can use the cleandirs and dirs flags for the fuctions to handle
directory cleaning and creation at the bitbake level rather than
using these calls within the functions

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7e45655..22ca546 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -429,11 +429,8 @@ python perform_packagecopy () {
     dest = d.getVar('D', True)
     dvar = d.getVar('PKGD', True)
 
-    bb.mkdirhier(dvar)
-
     # Start by package population by taking a copy of the installed
     # files to operate on
-    subprocess.call('rm -rf %s/*' % (dvar), shell=True)
     # Preserve sparse files and hard links
     subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
 
@@ -441,6 +438,8 @@ python perform_packagecopy () {
     if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
         rpath_replace (dvar, d)
 }
+perform_packagecopy[cleandirs] = "${PKGD}"
+perform_packagecopy[dirs] = "${PKGD}"
 
 # We generate a master list of directories to process, we start by
 # seeding this list with reasonable defaults, then load from
@@ -897,7 +896,6 @@ python populate_packages () {
                 package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
     pkgdest = d.getVar('PKGDEST', True)
-    subprocess.call('rm -rf %s' % pkgdest, shell=True)
 
     seen = []
 
@@ -1823,7 +1821,7 @@ addtask package before do_build after do_install
 PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 SSTATETASKS += "do_package"
 do_package[sstate-name] = "package"
-do_package[cleandirs] = "${PKGDESTWORK}"
+do_package[cleandirs] = "${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
 do_package_setscene[dirs] = "${STAGING_DIR}"
-- 
1.7.10.4



