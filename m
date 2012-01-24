Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rpjzn-0006pK-OZ for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:17:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OH9bxK030152;
	Tue, 24 Jan 2012 17:09:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29754-03; Tue, 24 Jan 2012 17:09:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OH9TQ3030127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2012 17:09:30 GMT
Message-ID: <1327424970.19643.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:09:30 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gcc-cross: Don't reference machine specific variables
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
X-List-Received-Date: Tue, 24 Jan 2012 17:17:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gcc-cross is installed into a package architecture specific directory
and is not meant to be machine specific. This patch replaces MACHINE_ARCH
with PACKAGE_ARCH to ensure this is really the case.

This was found by examining sstate checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 0b31a8c..6acf8c5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -87,12 +87,12 @@ then
 	exit 1
 fi
 	echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
-	echo "load_generic_config \"unix\"" > ${B}/${MACHINE_ARCH}.exp
-	echo "set_board_info username \$user" >> ${B}/${MACHINE_ARCH}.exp
-	echo "set_board_info rsh_prog ssh" >> ${B}/${MACHINE_ARCH}.exp
-	echo "set_board_info rcp_prog scp" >> ${B}/${MACHINE_ARCH}.exp
-	echo "set_board_info hostname \$target" >> ${B}/${MACHINE_ARCH}.exp
-	DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${MACHINE_ARCH}\$@"
+	echo "load_generic_config \"unix\"" > ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info username \$user" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info rsh_prog ssh" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info rcp_prog scp" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info hostname \$target" >> ${B}/${PACKAGE_ARCH}.exp
+	DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${PACKAGE_ARCH}\$@"
 
 STOP
 




