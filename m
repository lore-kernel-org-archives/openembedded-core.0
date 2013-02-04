Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2Jz5-0000Ns-Mv
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:13:13 +0100
Received: by mail-pa0-f49.google.com with SMTP id kp6so1205004pab.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=eipzKISyzp0b4XdL3oGwXHDSetnEmyxcYl8/fGiI+/k=;
	b=tVz4qZaKBk+n2s+npntujUYXwNlcgpL8YSUPQplxol6verucf0xe/ylE5n+g8ov6N6
	vFShU1CEM64Dqrv0odfj0fEt/MtFWXJJsNykZbyeKS8mwbK8Zg2Si+OrAscBK3LcD72u
	1dhfIeJy4ljo0SFP722ZGzLf99dYeOOilKk6kPUALFG8cCkbz03w6CthmOhLNIro9JvR
	6YLLgixhO7nNrOmHyvSEsjVirtLsGTfMSU/JXedYf3enmjYUdHKAL6ZH7/PdheX8ETro
	rCYe0OOxvA5+hSaus9S02H1L4jtGJuEpAWxzGI8Ezvn2pDa1GkqxqLP3awFOYzEfYwjO
	CFwg==
X-Received: by 10.66.79.231 with SMTP id m7mr1958149pax.76.1359975442868;
	Mon, 04 Feb 2013 02:57:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i6sm20448907paw.19.2013.02.04.02.57.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:57:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:57:10 +0100
Message-Id: <1359971830-17441-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] qemu.inc: depend on qemu-native only with runqemu DISTRO_FEATURE
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
X-List-Received-Date: Mon, 04 Feb 2013 11:13:17 -0000

* qemu images are usefull even without qemu installed on build machine.
  Some people are building on one machine, but then downloading images
  somewhere else to test them.
* use new "runqemu" DISTRO_FEATURE and BACKFILL it so the behavior stays
  the same, unless disabled by DISTRO_FEATURES_BACKFILL_CONSIDERED

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf             | 2 +-
 meta/conf/machine/include/qemu.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 223c03f..c5ebc94 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -732,7 +732,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN} runqemu"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "\
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index f68bf32..1470778 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -24,4 +24,5 @@ RDEPENDS_kernel-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+RUNQEMU_IMAGEDEPENDS = "qemu-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "${@base_contains("DISTRO_FEATURES", "runqemu", "${RUNQEMU_IMAGEDEPENDS}", "", d)}"
-- 
1.8.1.2



