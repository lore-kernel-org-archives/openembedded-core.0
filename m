Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fF-0002ba-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FqE020478; Mon, 4 Feb 2013 00:01:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7KrZi6njTO2K; Mon,  4 Feb 2013 00:01:16 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401AMY020452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:11 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pi-0000XX-PC; Sun, 03 Feb 2013 23:55:58 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:38 +0000
Message-Id: <a0f26be68989ea1f8c9effdd0ea165e1ee02446b.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/22] update-rc.d: Drop OVERRIDES code
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

The data store copy and overrides is overkill given the small number
of accesses that are being made. This simplifies the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/update-rc.d_real.bbclass |   17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/classes/update-rc.d_real.bbclass b/meta/classes/update-rc.d_real.bbclass
index 83816d6..0cd671f 100644
--- a/meta/classes/update-rc.d_real.bbclass
+++ b/meta/classes/update-rc.d_real.bbclass
@@ -50,32 +50,27 @@ python __anonymous() {
 python populate_packages_prepend () {
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", True)
-        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
-        bb.data.update_data(localdata)
-
         """
         update_rc.d postinst is appended here because pkg_postinst may require to
         execute on the target. Not doing so may cause update_rc.d postinst invoked
         twice to cause unwanted warnings.
         """ 
-        postinst = localdata.getVar('pkg_postinst', True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('updatercd_postinst', True)
+        postinst += d.getVar('updatercd_postinst', True)
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        prerm = localdata.getVar('pkg_prerm', True)
+        prerm = d.getVar('pkg_prerm_%s' % pkg, True) or d.getVar('pkg_prerm', True)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('updatercd_prerm', True)
+        prerm += d.getVar('updatercd_prerm', True)
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-        postrm = localdata.getVar('pkg_postrm', True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
         if not postrm:
                 postrm = '#!/bin/sh\n'
-        postrm += localdata.getVar('updatercd_postrm', True)
+        postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
     pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
-- 
1.7.10.4



