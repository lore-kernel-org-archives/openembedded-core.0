Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdcQu-00016O-Jb for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 08:51:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS7bYgw011081
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:37:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09454-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:37:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS7bQaZ011075
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:37:27 GMT
Message-ID: <1354088245.21863.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 07:37:25 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: local.conf.sample: Enable disk space monitoring by default
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
X-List-Received-Date: Wed, 28 Nov 2012 07:51:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Running out of space is a serious issue and can corrupt the build. Since
we can prevent it at minimal overhead, we might as well enable it by default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index d181e75..859eb93 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -184,6 +184,22 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 PATCHRESOLVE = "noop"
 
 #
+# Disk Space Monitoring during the build
+#
+# Monitor the disk space during the build. If there is less that 1GB of space or less
+# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
+# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# of the build. The reason for this is that running completely out of space can corrupt
+# files and damages the build in ways which may not be easily recoverable.
+BB_DISKMON_DIRS = "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K" 
+
+#
 # Shared-state files from other locations
 #
 # As mentioned above, shared state files are prebuilt cache data objects which can 




