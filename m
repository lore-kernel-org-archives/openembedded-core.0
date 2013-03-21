Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6L-0006Mj-WD
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4rD5009097; Thu, 21 Mar 2013 16:04:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X-Cwa3uHNSXY; Thu, 21 Mar 2013 16:04:53 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4lPa009076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:48 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpl-0006Lb-QE; Thu, 21 Mar 2013 15:55:17 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:00 +0000
Message-Id: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 01/16] libuser: Fix case where ${B} != ${S}
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
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Fix out of tree builds and a parallel make race, see the patch header
for details.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libuser/libuser/fixsepbuild.patch              |   26 ++++++++++++++++++++
 meta/recipes-extended/libuser/libuser_0.58.bb      |    3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libuser/libuser/fixsepbuild.patch

diff --git a/meta/recipes-extended/libuser/libuser/fixsepbuild.patch b/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
new file mode 100644
index 0000000..27e6bc6
--- /dev/null
+++ b/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
@@ -0,0 +1,26 @@
+Fix out of tree build errors and parallel make issues. The mkdir commands 
+can race each other. The srcdir variable is a complete path so a ../ prefix makes
+no sense.
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: libuser/docs/Makefile.am
+===================================================================
+--- libuser/docs.orig/Makefile.am	2012-11-08 02:25:58.000000000 +0000
++++ libuser/docs/Makefile.am	2013-03-21 14:15:40.756950231 +0000
+@@ -13,9 +13,9 @@
+ 		< $(srcdir)/libuser.conf.5.in > $@
+ 
+ sgml/libuser.txt: $(srcdir)/sgml/libuser.sgml
+-	[ -d sgml ] || mkdir sgml
+-	cd sgml; sgml2txt ../$(srcdir)/sgml/libuser.sgml
++	[ -d sgml ] || mkdir sgml || true
++	cd sgml; sgml2txt $(srcdir)/sgml/libuser.sgml
+ 
+ sgml/libuser.html: $(srcdir)/sgml/libuser.sgml
+-	[ -d sgml ] || mkdir sgml
+-	cd sgml; sgml2html ../$(srcdir)/sgml/libuser.sgml
++	[ -d sgml ] || mkdir sgml || true
++	cd sgml; sgml2html $(srcdir)/sgml/libuser.sgml
diff --git a/meta/recipes-extended/libuser/libuser_0.58.bb b/meta/recipes-extended/libuser/libuser_0.58.bb
index fbd3dd5..c1fe49d 100644
--- a/meta/recipes-extended/libuser/libuser_0.58.bb
+++ b/meta/recipes-extended/libuser/libuser_0.58.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 SECTION = "base"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
+SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
+           file://fixsepbuild.patch"
 
 SRC_URI[md5sum] = "1fc3ef3f3a3955b2d78562ff4daed793"
 SRC_URI[sha256sum] = "12a0c09d016d80687e04227a00a89e3c056d3b48bfa2444a9028e6474d8e1dbd"
-- 
1.7.10.4



