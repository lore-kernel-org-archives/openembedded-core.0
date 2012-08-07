Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SysaD-0003xQ-8y for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 00:49:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77MbFfG016582
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 23:37:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16402-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 23:37:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77Mb0pI016576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 23:37:05 +0100
Message-ID: <1344379020.9756.307.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 23:37:00 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] automake: Fix version reference in path substitutions
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
X-List-Received-Date: Tue, 07 Aug 2012 22:49:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this the substitutions don't get made potentially resulting in a variety of
different failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/recipes-devtools/automake/automake_1.12.1.bb
index a1e37d4..2a97bcc 100644
--- a/meta/recipes-devtools/automake/automake_1.12.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.1.bb
@@ -42,7 +42,7 @@ SRC_URI += "${PATHFIXPATCH} \
 SRC_URI[md5sum] = "ec25c1855cacf47e4bdee76a776b96ba"
 SRC_URI[sha256sum] = "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576a7a2ccfc70ca85a1e2f"
 
-PR = "r0"
+PR = "r1"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
@@ -50,7 +50,7 @@ do_install () {
 
     # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
     # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-    for i in aclocal aclocal-1.11 automake automake-1.11; do
+    for i in aclocal aclocal-1.12 automake automake-1.12; do
         if [ -f ${D}${bindir}/$i ]; then
             sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/perl,' \
             -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${USRBINPATH}/perl \1 exec ${USRBINPATH}/perl \2,' \




