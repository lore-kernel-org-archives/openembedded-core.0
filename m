Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJS7e-000132-KD for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 18:16:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FG6t9P022591
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 17:06:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20693-09 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 17:06:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FG6kjp022584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 17:06:47 +0100
Message-ID: <1334506007.16992.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Apr 2012 17:06:47 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] net-tools: Fix do_patch to be re-executable
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
X-List-Received-Date: Sun, 15 Apr 2012 16:16:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This recipe's do_patch was not able to be re-executed due to its custom
patching functions. This fixes things so that it can be re-executed.

It also fixes the unpack task re-execution by ensuring ${S} is clean
before the unpack starts.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 213fb60..c8d2c57 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -31,11 +31,19 @@ PARALLEL_MAKE = ""
 # up all previously applied patches in the start
 nettools_do_patch() {
 	cd ${S}
-	patch -p1 < ${WORKDIR}/${BPN}_${PV}.diff
+	quilt pop -a || true
+	if [ -d ${S}/.pc-nettools ]; then
+		mv ${S}/.pc-nettools ${S}/.pc
+		QUILT_PATCHES=${S}/debian/patches quilt pop -a
+		rm -rf ${S}/.pc ${S}/debian
+	fi
+	patch -p1 < ${WORKDIR}/${BPN}_${PV}.diff	
 	QUILT_PATCHES=${S}/debian/patches quilt push -a
-	rm -rf ${S}/patches ${S}/.pc
+	mv ${S}/.pc ${S}/.pc-nettools
 }
 
+do_unpack[cleandirs] += "${S}"
+
 # We invoke base do_patch at end, to incorporate any local patch
 python do_patch() {
 	bb.build.exec_func('nettools_do_patch', d)




