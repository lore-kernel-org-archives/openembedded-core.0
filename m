Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlcF-0000Ua-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:37:27 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so310231wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nUmOGZ4tlpaxBf7rzCdAYVzgxUwIibkcIaDQe0rSRBM=;
	b=Fdf6/kPStQNTkMF8Igmu+NBb/trZFbftH1OVesmFC8goWRgxfimJHYvhnAyKiSoUsF
	g5d5o9DD7aU8d9yYqEq8NUwi8JNEZZ8sWyhMJewtWUJnAGxy+S5BthLxGDkONUcjVKY2
	M1o/oEAeXKIFDcOnFHJjwxhISSyoV2KDSzzM3RCtZza3v09Ei6SrFpR+/302uq3ku7Fu
	wwbjAK20suzhk2479Sq2ZCPS6W5rKRM/YJMj+n0b2qUE5ph+CDjWQCTkZTNNMrp7zZLg
	kBr94QXjiVk88yjfhZEfN1PzOLzAyR22O8iXWVcK8rDhV0dtVijsYq+7zhSnwmT3oCdR
	C6dA==
Received: by 10.180.87.132 with SMTP id ay4mr13008923wib.5.1349357069246;
	Thu, 04 Oct 2012 06:24:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm14650856wib.8.2012.10.04.06.24.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:24:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:40 +0200
Message-Id: <d9a5536a2664b9c1ff16aace6abec3e3e2fb8a0e.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/7] tune-*: define more generic DEFAULTTUNE to share feed between machines
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
X-List-Received-Date: Thu, 04 Oct 2012 13:37:27 -0000

* this is mostly for backwards compatibility and to share binary feed
  like it was before, but now without missing different -mtune in it
* if you want to build some package with -mtune add something like this
  to your distro config
  DEFAULTTUNE_qemuarm_pn-openssl = "arm926ejs"
  DEFAULTTUNE_qemuarmx_pn-openssl = "xscale"
  be aware that if you do this you should do it also for all packages
  which depends on openssl because if you dont and you build e.g. dhcp,
  then dhcp build for arm926ejs (even with DEFAULTTUNE armv5te) will
  depend on openssl with arm926ejs, so dhcp in armv5te feed will be
  rebuild after each MACHINE switch.
* cortexm3, cortexr4, iwmmx and ep9312 are using own DEFAULTTUNE because
  they define also different -march
* shared feeds are
  armv4t: arm920t, arm9tdmi
  armv5te: arm926ejs, xscale
  armv7a-neon: cortexa8, cortexa9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
 meta/conf/machine/include/tune-arm920t.inc       | 2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
 meta/conf/machine/include/tune-cortexm1.inc      | 2 +-
 meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
 meta/conf/machine/include/tune-xscale.inc        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 2efcedd..adece48 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "arm1136jfs"
+DEFAULTTUNE ?= "armv6"
 
 require conf/machine/include/arm/arch-armv6.inc
 
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 459d978..3240fa8 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "arm920t"
+DEFAULTTUNE ?= "armv4t"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 0cfeb77..301a3c2 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "arm926ejs"
+DEFAULTTUNE ?= "armv5te"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 100242f..a981a65 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "arm9tdmi"
+DEFAULTTUNE ?= "armv4t"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 29fbe89..89878d4 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "cortexa8-neon"
+DEFAULTTUNE ?= "armv7a-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index e2f78d3..addfdad 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "cortexa9-neon"
+DEFAULTTUNE ?= "armv7a-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index ba3cbe9..c4c658b 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "cortexm1"
+DEFAULTTUNE ?= "armv7a"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 3beaaed..fba0a1b 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "strongarm"
+DEFAULTTUNE ?= "armv4"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index d9925eb..a48c2d9 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "xscale"
+DEFAULTTUNE ?= "armv5te"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
-- 
1.7.12



