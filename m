Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPIki-0004xN-4S
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:33:21 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r38KFvrj011251;
	Mon, 8 Apr 2013 13:15:58 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Apr 2013 16:15:51 -0400
Message-Id: <1365452153-21650-2-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
References: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
Cc: Bruce.Ashfield@windriver.com, Michel.Thebeau@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel.bbclass: do_sizecheck: update path to build image and do not delete
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
X-List-Received-Date: Mon, 08 Apr 2013 20:33:23 -0000

From: Michel Thebeau <michel.thebeau@windriver.com>

do_sizecheck has a few issues especially with vmlinux image type.

It breaks because KERNEL_OUTPUT is a path relative to ${B}.  When
do_sizecheck runs it does not find the file (because the working
directory is elsewhere) and does not fail.

Also, the image file referenced by KERNEL_OUTPUT may be a link.

Finally, when do_sizecheck deletes the oversized kernel image it leaves
the previously run do_compile task with inaccurate status.

So, do the following:
 - specify that the working directory should be ${B}
 - use ls -L to reference to the real file, and ensure that the link
   file is created
 - keep the oversized image file so the status of do_compile is valid

[YOCTO #3514]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
---
 meta/classes/kernel.bbclass |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d57d1f5..af58887 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -293,15 +293,16 @@ python split_kernel_packages () {
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
+		cd ${B}
+		size=`ls -lL ${KERNEL_OUTPUT} | awk '{ print $5}'`
 		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-			rm ${KERNEL_OUTPUT}
 			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
 		fi
 	fi
 }
+do_sizecheck[dirs] = "${B}"
 
-addtask sizecheck before do_install after do_compile
+addtask sizecheck before do_install after do_kernel_link_vmlinux
 
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
-- 
1.7.9.7



