Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70QV-0008UK-2r for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:21:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H9B3T9004375 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:11:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZbD5v+G5W89Z
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:11:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H9AuLX004327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:11:00 GMT
Message-ID: <1361091871.31795.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 09:04:31 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_tar: Fix so it actually works
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
X-List-Received-Date: Sun, 17 Feb 2013 09:21:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This tells us how long the code hasn't been used for :/

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 5e3058d..c4bb62f 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -24,12 +24,14 @@ python do_package_tar () {
         bb.debug(1, "PACKAGES not defined, nothing to package")
         return
 
+    pkgdest = d.getVar('PKGDEST', True)
+
     bb.utils.mkdirhier(outdir)
     bb.utils.mkdirhier(dvar)
 
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
-        root = "%s/install/%s" % (workdir, pkg)
+        root = "%s/%s" % (pkgdest, pkg)
 
         overrides = localdata.getVar('OVERRIDES')
         localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))




