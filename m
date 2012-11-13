Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYHEu-0001YT-DH for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:13:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADDxQov004286
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 13:59:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04019-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 13:59:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADDxJXc004280
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 13:59:20 GMT
Message-ID: <1352815159.24487.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2012 13:59:19 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Tue, 13 Nov 2012 14:13:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
new file mode 100644
index 0000000..f587c34
--- a/dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
@@ -0,0 +1,28 @@
+Adding @CROSS_COMPILE@ to CFLAGS_FOR_BUILD causes errors like:
+
+mkbuiltins.o: In function `open':
+/usr/include/x86_64-linux-gnu/bits/fcntl2.h:54: undefined reference to `xopen'
+mkbuiltins.o: In function `read':
+/usr/include/x86_64-linux-gnu/bits/unistd.h:45: undefined reference to `xread'
+collect2: ld returned 1 exit status
+
+when compiling on a 64 bit x86 build system for a 32 bit x86 target since
+config.h confuses the compiler about settings. By removing the option, config.h 
+isn't used and the compiler stops getting confused.
+
+Upstream-Status: Pending
+RP 2012/11/13
+
+Index: bash-4.2/builtins/Makefile.in
+===================================================================
+--- bash-4.2.orig/builtins/Makefile.in	2010-12-21 13:37:18.000000000 +0000
++++ bash-4.2/builtins/Makefile.in	2012-11-13 11:36:47.761417446 +0000
+@@ -56,7 +56,7 @@
+ 
+ PROFILE_FLAGS = @PROFILE_FLAGS@
+ CFLAGS = @CFLAGS@
+-CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@ @CROSS_COMPILE@
++CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
+ CPPFLAGS = @CPPFLAGS@
+ CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ LOCAL_CFLAGS = @LOCAL_CFLAGS@ ${DEBUG}
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 5a0f015..18ddc7e 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -4,7 +4,7 @@ require bash.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=yes;striplevel=0;name=patch009 \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
            file://execute_cmd.patch;striplevel=0 \
+           file://crossfix.patch \
            "
 
 SRC_URI[tarball.md5sum] = "3fb927c7c33022f1c327f14a81c0d4b0"




