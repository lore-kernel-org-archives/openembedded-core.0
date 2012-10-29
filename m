Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSrs2-0004Si-1n for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 17:07:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFrjBC005805
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05741-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFrbsr005799
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:38 GMT
Message-ID: <1351526017.2828.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2012 15:53:37 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] udev: Ensure tmpfs are mounted and volatile/run exists
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
X-List-Received-Date: Mon, 29 Oct 2012 16:07:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a race with udev where eiher the run directory can get replaced
during bootup leading to ude errors, or if the tmpfs was mounted and
populate-volatiles hasn't run, udev won't start at all.

This ensures that any tmpfs get mounted before udev starts and that the
default volatiles/run directory at least exists, fixing the races
and boot time errors caused after the recent udev upgrade.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index ca02abb..74449fe 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -37,9 +37,8 @@ export ACTION=add
 echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
-	mount -n -o mode=0755 -t tmpfs none "/dev"
-}
+mount -a -t tmpfs
+mkdir -p /var/volatile/run
 [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
 [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
 
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index 8e4a391..c41de9f 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r1"
+PR = "r2"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"




