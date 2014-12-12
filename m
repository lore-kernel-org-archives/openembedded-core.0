Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D4530601F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 20:42:36 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so7831019pde.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 12:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HyfqAyzbl7+4ffUYBYsPksyrLeJPL8+Cp+AcmSbFr80=;
	b=cN05cNdvHorDsyHTFZM9kZLpQM8wc4Ac4GGrB1KmAZjy5NPhyuXh9D582XEexQuuBl
	w+E5MazWKkv+eG64rctKH/l0KMkBvHTZ2figq6mbylFOs8wTMMYJiNw+PECbHmThBB5w
	S6iWSsuO2rioSmiQZq8CdIyiYfW/tp1l2COtqGUZ9ZcWKA65jSbTX0r7nfoQBFzCwUNp
	KuFHBXVoesANl2eHyjxIydBvdlalgdeWsx+Kp4Ddx1etZXeUrcvBiRpbUFFJRSxp0Xv9
	hiN3htj6lJZsCOQks/4Bz++8TlxQ7KJKmn2Xxq0Bi9SY0xjQxcHXF1ThNKUmZKhg0l9I
	Xo2Q==
X-Received: by 10.68.91.4 with SMTP id ca4mr29933080pbb.97.1418416957345;
	Fri, 12 Dec 2014 12:42:37 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id di3sm2299842pbc.46.2014.12.12.12.42.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Dec 2014 12:42:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Dec 2014 12:47:43 -0800
Message-Id: <1418417263-10579-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] kernel.bbclass: Remove bashism
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
X-List-Received-Date: Fri, 12 Dec 2014 20:42:41 -0000

Fixes build on systems using dash for default shell e.g.

errors like

run.do_strip.25842: [[: not found
| readelf: Error: Unable to read in 0x37 bytes of section headers
| readelf: Error: Not an ELF file - it has the wrong magic bytes at the start

Change-Id: I29cac15be44a02d75a3d6889b6ae9b2e19bf46af
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f300fa3..4af9d15 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -390,7 +390,7 @@ python split_kernel_packages () {
 
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if [[ "${KERNEL_IMAGETYPE}" != "vmlinux" ]]; then
+		if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
 			bbwarn "image type will not be stripped (not supported): ${KERNEL_IMAGETYPE}"
 			return
 		fi
-- 
2.1.1


