Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UIOVL-0004KE-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 20:17:00 +0100
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2KFUmeC022594;
	Wed, 20 Mar 2013 08:30:49 -0700 (PDT)
From: michel.thebeau@windriver.com
To: Bruce.Ashfield@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 11:30:36 -0400
Message-Id: <1363793436-3350-2-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1363793436-3350-1-git-send-email-michel.thebeau@windriver.com>
References: <1363793436-3350-1-git-send-email-michel.thebeau@windriver.com>
Subject: [PATCH 1/2] kernel.bbclass: do_sizecheck: update path to build image
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
X-List-Received-Date: Wed, 20 Mar 2013 19:17:00 -0000
X-List-Received-Date: Wed, 20 Mar 2013 19:17:00 -0000

From: Michel Thebeau <michel.thebeau@windriver.com>

KERNEL_OUTPUT is a path relative to ${B}, and resolves to a soft
link to ${B}/${KERNEL_IMAGETYPE}.  When do_sizecheck runs it
does not find the file, and does not fail.

So check the size of ${B}/${KERNEL_IMAGETYPE}.

Alternative approaches to resolve this could be:
 - check ${B}/${KERNEL_OUTPUT}, with ls -L to resolve the link
 - check ${B}/${KERNEL_OUTPUT}.bin

This is related to, but does not resolve:
[YOCTO #3514]

Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d57d1f5..dbb571a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -293,9 +293,9 @@ python split_kernel_packages () {
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
+		size=`ls -l ${B}/${KERNEL_IMAGETYPE} | awk '{ print $5}'`
 		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-			rm ${KERNEL_OUTPUT}
+			rm ${B}/${KERNEL_IMAGETYPE}
 			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
 		fi
 	fi
-- 
1.7.9.7



