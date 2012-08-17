Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T2Qww-00056p-6F
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:07:10 +0200
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 966403047E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:55:07 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 10:54:40 -0700
Message-Id: <65322d27a0aacb4ae25b9cac6fef0e173a900f09.1345225925.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345225925.git.scott.a.garman@intel.com>
References: <cover.1345225925.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1345225925.git.scott.a.garman@intel.com>
References: <cover.1345225925.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 966403047E.5E08E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: work with yocto-bsp created kernel filenames
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
X-List-Received-Date: Fri, 17 Aug 2012 18:07:10 -0000

The yocto-bsp tool generates kernels with additional strings within
the filename, e.g. zImage-myqemuarm.bin. Loosen the MACHINE detection
regex to work with these filenames.

Fixes [YOCTO #2890].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7e4bcc4..90998ae 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -229,7 +229,7 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+    MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
     if [ -z "$MACHINE" ]; then
         error "Unable to set MACHINE from kernel filename [$KERNEL]"
     fi
-- 
1.7.9.5



