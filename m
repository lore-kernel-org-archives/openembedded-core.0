Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4D26FFED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 13:43:36 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 12/08/2017 8:42:55 AM
X-Note: SecureTide Build: 11/29/2017 3:14:04 PM UTC (2.6.25.0)
X-Note: Filtered by 10.238.11.162
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 252279022; Fri, 08 Dec 2017 08:42:55 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 252279001; Fri, 08 Dec 2017 08:42:54 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eNIwC-000CTa-Fm; Fri, 08 Dec 2017 13:43:36 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eNIwC-000697-Ew; Fri, 08 Dec 2017 13:43:36 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 13:43:26 +0000
Message-Id: <20171208134326.23577-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 12/08/2017 8:42:54 AM
X-Note: SecureTide Build: 11/29/2017 3:14:04 PM UTC (2.6.25.0)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-36/SG:1 12/8/2017 8:42:43 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.455363 p=-0.879518 Source Normal
X-Signature-Violations: 0-0-0-6628-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G295 G296 G297 G298 G302 G303 G435 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] kernel.bbclass: Fix do_sizecheck behaviour
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
X-List-Received-Date: Fri, 08 Dec 2017 13:43:37 -0000

During the introduction of support for multiple kernel image types in
849b67b2e4820564b5e5c9bd4bb293c44351c5f3, do_sizecheck was changed to only
warn if any kernel was bigger than ${KERNEL_IMAGE_MAXSIZE}. (Well, it tried
to warn - it turns out that there's no function called "warn", it should be
"bbwarn".) The previous behaviour had been to fail the build if the single
kernel image did not fit.

It seems possible that people might be generating both compressed and
uncompressed kernels and only really care whether the compressed one fits.
This means that we shouldn't just always fail if any of the images are too
large. So, let's warn (correctly this time) on every image that is too
large, but only ultimately fail if no image will fit. The build will also
fail if ${KERNEL_IMAGETYPES} is empty, but I hope that no-one needs to do
that.

While we're here correct a typo in the KERNEL_IMAGE_MAXSIZE validity check.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Discussion: http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145376.html

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c2..14f41e9b17 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -595,19 +595,27 @@ do_strip[dirs] = "${B}"
 addtask strip before do_sizecheck after do_kernel_link_images
 
 # Support checking the kernel size since some kernels need to reside in partitions
-# with a fixed length or there is a limit in transferring the kernel to memory
+# with a fixed length or there is a limit in transferring the kernel to memory.
+# If more than one image type is enabled, warn on any that don't fit but only fail
+# if none fit.
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
 		invalid=`echo ${KERNEL_IMAGE_MAXSIZE} | sed 's/[0-9]//g'`
 		if [ -n "$invalid" ]; then
-			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
+			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integer (The unit is Kbytes)"
 		fi
+		at_least_one_fits=
 		for type in ${KERNEL_IMAGETYPES} ; do
 			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type | awk '{print $1}'`
 			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-				warn "This kernel $type (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the size of the kernel by making more of it modular."
+				bbwarn "This kernel $type (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
+			else
+				at_least_one_fits=y
 			fi
 		done
+		if [ -z "$at_least_one_fits" ]; then
+			die "All kernel images are too big for your device. Please reduce the size of the kernel by making more of it modular."
+		fi
 	fi
 }
 do_sizecheck[dirs] = "${B}"
-- 
2.11.0



