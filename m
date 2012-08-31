Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1T7Q5L-0007nW-BE
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 14:12:27 +0200
Received: from [192.168.0.2] (host81-153-116-70.range81-153.btcentralplus.com
	[81.153.116.70]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id CA9139AE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 12:53:31 +0100 (BST)
Message-ID: <5040A5BB.7040601@r-finger.com>
Date: Fri, 31 Aug 2012 12:53:31 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: runstrip() in package.bbclass fails when run against a kernel module
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
X-List-Received-Date: Fri, 31 Aug 2012 12:12:27 -0000
X-Groupsio-MsgNum: 28465
Content-Type: multipart/mixed; boundary="------------010002010005070505050505"

--------------010002010005070505050505
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


runstrip() in package.bbclass fails when run against a kernel module,
because it tries to do a bitwise & with a 'None' argument. This throws:
TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'.

(This bug triggers, for example, when building ti-linuxutils from
meta-ti (v2012.05-yocto1.2 tag) against Denzil.)

Patch attached.

Tomas


--------------010002010005070505050505
Content-Type: text/x-patch;
 name="0001-package.bbclass-fix-stripping-for-kernel-modules.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-package.bbclass-fix-stripping-for-kernel-modules.patch"

From 6abe978d8e0acdb35c1abfed83e775b276b1231f Mon Sep 17 00:00:00 2001
From: Tomas Frydrych <tomas@sleepfive.com>
Date: Fri, 31 Aug 2012 12:02:18 +0100
Subject: [PATCH] package.bbclass: fix stripping for kernel modules

runstrip(path, elftype, d) does bitwise & on the elftype parameter, so it has
to be passed an integer. Passing None fails with: TypeError: unsupported
operand type(s) for &: 'NoneType' and 'int'.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/classes/package.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44e551f..f046fbb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -877,7 +877,7 @@ python split_and_strip_files () {
 			for f in files:
 				if not f.endswith(".ko"):
 					continue
-				runstrip(os.path.join(root, f), None, d)
+				runstrip(os.path.join(root, f), 0, d)
 	#
 	# End of strip
 	#
-- 
1.7.10.4



--------------010002010005070505050505--
