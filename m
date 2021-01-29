Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web09.8899.1611924203315783023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 04:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
IronPort-SDR: wJQZomM8QqGm4xfqUGG0jUUjg3m3HfRmKm6ncwG4DCqB3+WR+0JuFTOpsoUid8qLMHr+OTq4eG
 L44nSCbjMi+w1grQIUbNnA2J6/A47J7lmN4pcJYJTs5n4YkMuU63x89e5WKQnSz3FnMhQkn5/I
 MBohRoJ1ohPF2N93vsFltLHb37jEVyIzjLc5RozywNMOdcA/tQFQwURy8q3CapteFFQN7T9Bz9
 e8evpssyY13vypMbvErW+DE+IZBNukL9kEyfSv+6QMFNh1TsZgYJvSaJ3LXLwxWdA5scJQYbce
 y+s=
X-IronPort-AV: E=Sophos;i="5.79,385,1602576000"; 
   d="scan'208";a="57710472"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 29 Jan 2021 04:43:21 -0800
IronPort-SDR: f77Ixs4+IoPfBTZldPnU20y3Rmkr7gYxg3kSGVcEh7Cg5u6HJn243RTUPenHhxNtr2jMBMkRJB
 1dNhx6yhGfL1e2Njvu6Ymjyr3YBGCE7rHkwC6++cRY7cF+cmxdATCUq9EjDmTJEwD9L1l88t1L
 b6tb8huf7Dc5WnYMDk4fECUhLwa0WX4OExSxLbsXDGPkwoTs0b9+jpBPOTbjM6S+K1465qTeMF
 212RKioCe4k/N9dnJ+aWSFCyemeg5D8nbHltUygUGyzCNHk08m9Flb+zPTipHKkg9dpB4yG4in
 6mw=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel.bbclass: fix deployment for initramfs images
Date: Fri, 29 Jan 2021 17:42:39 +0500
Message-ID: <20210129124239.21688-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

The do_bundle_initramfs() only processes kernel image
types that are found in KERNEL_IMAGETYPE_FOR_MAKE whereas
the build system can generate other types that are not
directly supported by the kernel build system. In which
case when we come to the deploy phase not all the images
mentioned in KERNEL_IMAGETYPES would have a respective
initramfs bundled image. An example is using vmlinux.gz
in KERNEL_IMAGETYPES and enabling initramfs and then we
see

install: cannot stat 'arch/arm64/boot/vmlinux.gz.initramfs': No such file or directory

So we align the deploy phase with bundle initramfs phase
and pick up relevant initramfs bundled images using
KERNEL_IMAGETYPE_FOR_MAKE instead of KERNEL_IMAGETYPES.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ddff2ddcd2..8693ab86be 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -759,7 +759,7 @@ kernel_do_deploy() {
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
+		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-- 
2.17.1

