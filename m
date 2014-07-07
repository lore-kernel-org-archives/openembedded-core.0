Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAD116FF24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:33:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s679Y1Jn002244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 02:34:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:34:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jul 2014 02:33:59 -0700
Message-ID: <5c4e27d21b03ce0fb4ff7f9085893511cfbf2507.1404725000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404725000.git.liezhi.yang@windriver.com>
References: <cover.1404725000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] kernel.bbclass: update KERNEL_IMAGE_MAXSIZE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jul 2014 09:34:01 -0000
Content-Type: text/plain

* Make KERNEL_IMAGE_MAXSIZE and IMAGE_ROOTFS_SIZE have the same algorithm:
  - Use Kbytes as the unit since we use this in other codes.
  - Use "du" rather than "ls" to figure out the size since we use this in
    image.py.

[YOCTO #2610]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f5d7258..b2e9d4c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -422,10 +422,13 @@ addtask do_strip before do_sizecheck after do_kernel_link_vmlinux
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-		cd ${B}
-		size=`ls -lL ${KERNEL_OUTPUT} | awk '{ print $5}'`
+		invalid=`echo ${KERNEL_IMAGE_MAXSIZE} | sed 's/[0-9]//g'`
+		if [ -n "$invalid" ]; then
+			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
+		fi
+		size=`du -ks ${B}/${KERNEL_OUTPUT} | awk '{ print $1}'`
 		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
+			die "This kernel (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the size of the kernel by making more of it modular."
 		fi
 	fi
 }
-- 
1.7.9.5


