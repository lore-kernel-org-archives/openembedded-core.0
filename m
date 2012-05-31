Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sa5bg-0001EB-Sx for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 15:40:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4VDTg20001848;
	Thu, 31 May 2012 14:29:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01546-03; Thu, 31 May 2012 14:29:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4VDTXmI001842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 31 May 2012 14:29:34 +0100
Message-ID: <1338470972.20169.234.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 14:29:32 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>
Subject: [PATCH] cmd1.bbclass: Ensure ncurses is built and used for menuconfig tasks
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
X-List-Received-Date: Thu, 31 May 2012 13:40:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, the task just exits if something goes wrong. This adds the
ncurses-native dependency. It also adds a small delay before closing the
window so any messages displayed there can be seen.

Trying to get the kernel build system to correctly find and link with
our copy of ncurses is some kind of nightmare. I ended up having to add
it to HOST_LOADLIBES globally for this task which is rather nasty but I
couldn't find any other way.

[YOCTO #2513]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index d429188..bd25311 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -9,9 +9,15 @@ addtask configure after do_unpack do_patch before do_compile
 
 inherit terminal
 
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
+HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
+HOSTLDFLAGS = "${BUILD_LDFLAGS}"
+HOST_LOADLIBES = "-lncurses"
+
 python do_menuconfig() {
-        oe_terminal("make menuconfig", '${PN} Configuration', d)
+        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
 }
+do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
 addtask menuconfig after do_configure
 




