Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4Be-0002LV-RW
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:05:46 +0100
Received: by wibhj13 with SMTP id hj13so1834513wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kOf0gS/LaqN9cOSvZgEcbc1HJxB8/aNdbstjsjt+7MM=;
	b=kEKiB1AbSOLbQyeWRhvXRYWnsODTevUv6gokyQTIiD0qLSAHXjVYk+VltO32mjgXMf
	Xr6WzEutYOWQBm3NvPgsArHNXgpAn8uBPFMmzjHP8Eq3SYmIsBfa0242MwF9yrkQYwn+
	igNqufyzkZ7N3lPJThAuYfn2f7V0gHjCvvkfntLLEiRBXMQ0kUa/kKp7ANNyMFsMeayo
	H8/HzgqTMKXL6fL60i/LNX0b0dyuqsqvMPiRxicKqMJLhZqORs34spE6J7lfGo/Xz69U
	4X7/s/5rouJDiamfrFSLOM2WVNz/wT3mIErPRcw3+alPuPof9mYsHEAgaZE3S44jEymD
	U9Ow==
Received: by 10.216.141.212 with SMTP id g62mr7075888wej.2.1332507410872;
	Fri, 23 Mar 2012 05:56:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm22681300wix.10.2012.03.23.05.56.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:56:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:28 +0100
Message-Id: <a419ed0c8a4947673a0517e21ef3fd0c47d8457d.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507302.git.Martin.Jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] kernel.bbclass: use better number for KERNEL_PRIORITY
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
X-List-Received-Date: Fri, 23 Mar 2012 13:05:46 -0000

* there is no upgrade from 2.6.X to 3.X.Y
  last part of PV is used as kernel priority for u-a, but X is usually
  higher then Y in 3.x.x so use all 3 parts in one bigger number
* and make it weak assignment if this scheme doesn't work for some
  recipe
* if there are just 2 numbers in PV then last one is repeated twice
  (see linux-openmoko_3.2 example) but that should work fine too

  OE qemux86-64@ ~/oe-core $ grep ^KERNEL_PRIO linux-yocto_*
  linux-yocto_2.6.37.e:KERNEL_PRIORITY="20637"
  linux-yocto_3.0.e:KERNEL_PRIORITY="30024"
  linux-yocto_3.2.e:KERNEL_PRIORITY="30211"
  OE qemux86-64@ ~/oe-core $ grep ^PV linux-yocto_*
  linux-yocto_2.6.37.e:PV="2.6.37+git1+aeea99683c7283f1f3320bf2ee7085ee252d4e7e_1+af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
  linux-yocto_3.0.e:PV="3.0.24+git2+a4ac64fe873f08ef718e2849b88914725dc99c1c_2+aac580659dc0ce083f250fb05abf82e58d7f4531"
  linux-yocto_3.2.e:PV="3.2.11+git2+514847185c78c07f52e02750fbe0a03ca3a31d8f_2+4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"

  OE qemux86-64@ ~/shr-core $ grep ^KERNEL_PRIO linux-openmoko_*
  linux-openmoko_2.6.39.e:KERNEL_PRIORITY="20639"
  linux-openmoko_3.2.e:KERNEL_PRIORITY="30202"
  linux-openmoko_git.e:KERNEL_PRIORITY="30299"
  OE qemux86-64@ ~/shr-core $ grep ^PV linux-openmoko_*
  linux-openmoko_2.6.39.e:PV="2.6.39"
  linux-openmoko_3.2.e:PV="3.2"
  linux-openmoko_git.e:PV="3.2.99+3.3.0-rc0+gitr1+7089727d63b17615fb0a652374d79cb7df0835ad"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 54ed7f7..5e4cdd4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -31,7 +31,9 @@ PACKAGES_DYNAMIC += "kernel-firmware-*"
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-KERNEL_PRIORITY = "${@d.getVar('PV',1).split('-')[0].split('.')[-1]}"
+KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])}"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-- 
1.7.8.5



