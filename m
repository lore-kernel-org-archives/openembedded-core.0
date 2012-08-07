Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyhyG-0001kq-Ra for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 13:29:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BHOPE010088;
	Tue, 7 Aug 2012 12:17:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09651-02; Tue,  7 Aug 2012 12:17:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BHEn8010082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 12:17:16 +0100
Message-ID: <1344338236.9756.218.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 12:17:16 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] linux-yocto-3.4: Disable extra slang header search path
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
X-List-Received-Date: Tue, 07 Aug 2012 11:29:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add in a workaround to avoid host infection detection build failures
from the slang include directory in perf. I'll defer to Bruce to
fix this properly but we need a workaround now as this is breaking
builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
new file mode 100644
index 0000000..9cada34
--- a/dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
@@ -0,0 +1,20 @@
+We (OE) install slang into /usr/include so we never need to look into 
+/usr/include/slang/. We never want to look into a hardcoded path like this
+since it triggers host infection issues. For now, simply remove this
+since it causes us problems.
+
+Upstream-Status: Pending (would need rework)
+
+Index: tools/perf/Makefile
+===================================================================
+--- linux.orig/tools/perf/Makefile	2012-08-07 10:29:43.020149620 +0000
++++ linux/tools/perf/Makefile	2012-08-07 10:30:08.128148098 +0000
+@@ -504,7 +504,7 @@
+ 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
+ 	else
+ 		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
+-		BASIC_CFLAGS += -I/usr/include/slang
++		# BASIC_CFLAGS += -I/usr/include/slang
+ 		EXTLIBS += -lnewt -lslang
+ 		LIB_OBJS += $(OUTPUT)util/ui/setup.o
+ 		LIB_OBJS += $(OUTPUT)util/ui/browser.o
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 48333b3..5ab46b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -20,6 +20,8 @@ SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
+SRC_URI += "file://noslang.patch"
+
 LINUX_VERSION ?= "3.4.6"
 
 PR = "${INC_PR}.0"




