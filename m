Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USUQQ-0000mJ-40 for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:37:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFKSFP026429 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:20:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H7asVZCQi8XA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:20:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFKP1S026424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:20:26 +0100
Message-ID: <1366211991.25282.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 16:19:51 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] packagegroup: Add init-manager sanity check
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
X-List-Received-Date: Wed, 17 Apr 2013 15:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, you can set VIRTUAL-RUNTIME_init_manager to an init system that
isn't in DISTRO_FEATURES. This leads to head scratching over unbootable images.

This adds a sanity check which ensures more valid systems are built.

(From OE-Core rev: 485413a33e981114722dfa096caf226f083f7aab)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 201309c..9bc9cc2 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -38,3 +38,10 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
+
+python () {
+    initman = d.getVar("VIRTUAL-RUNTIME_init_manager", True)
+    if initman and initman in ['sysvinit', 'systemd'] and not base_contains('DISTRO_FEATURES', initman, True, False, d):
+        bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
+}
+




