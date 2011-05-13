Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxIh-0005Kz-6Z
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:41:24 +0200
Received: by pwj9 with SMTP id 9so1349908pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=d+EIlcNMQjQ3gVynna5d2l4tvuWAr8rRfJgHimRiZ/E=;
	b=vmgGIUkAIDCaGKmZAYjnw6azmCLMayvrtMlUQwqHvgVVErbn2gxzV3jpOo3a4Bitu0
	TAG8kHQnXKismHhQYdenyewU+FQz0jSglwa/EjETKDAmdRJw2bY1PKAMjlYEuRplvNKY
	xLVBJ9eg0MR6+v9oaQDwLyZXJW0jixLwfQtAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ClgYD9DjDN5SRPzssqjl8i4M/xQThG6/nQvmw6xxh9N3jo5ibSS5VEko2g6WLRJcW3
	kJPtYgCwxvg4lxbX2eiF9abzcMZdVH5/sgf8TKn7NerTXX3/Nichh5WnvTWyMf3Pz19W
	rRNh6LDxkopvS14aTm7xtz/4WG5uXKf771Gek=
Received: by 10.142.9.28 with SMTP id 28mr1092262wfi.399.1305311912186;
	Fri, 13 May 2011 11:38:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n7sm2304175wfl.23.2011.05.13.11.38.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:38:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:38:26 -0700
Message-Id: <82c306e73406fddd2e70beb2eda70dddd5043bd2.1305311636.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305311636.git.raj.khem@gmail.com>
References: <cover.1305311636.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] tune-cortexa8.inc: Define variable for controlling FP ABI
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
X-List-Received-Date: Fri, 13 May 2011 18:41:24 -0000

ARM_FP_ABI also is poked from gcc configure to enable hardfp
for parameter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa8.inc |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a5b982a..d5e15c6 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,11 +3,17 @@
 # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
 # [3] https://support.codesourcery.com/GNUToolchain/kbentry29
 
-TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize"
+# Can be one of ['softfp' 'hardfp']
+ARM_FP_ABI ?= "softfp"
+
+ARM_FP_OPT = "${@['-mfloat-abi=softfp', '-mfloat-abi=hard'][bb.data.getVar('ARM_FP_ABI', d, 1) == 'hardfp']}"
+ARM_FP_PACKAGESUFFIX = "${@['', '-hardfp'][bb.data.getVar('ARM_FP_ABI', d, 1) == 'hardfp']}"
+
+TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon ${ARM_FP_OPT} -fno-tree-vectorize"
 
 # Other potentially useful options
 #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
 
-FEED_ARCH = "armv7a"
-BASE_PACKAGE_ARCH = "armv7a"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
+FEED_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
+BASE_PACKAGE_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a${ARM_FP_PACKAGESUFFIX}"
-- 
1.7.4.1



