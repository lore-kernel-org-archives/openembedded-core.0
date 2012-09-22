Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT8K-0002pz-9C
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:04:48 +0200
Received: by weyt44 with SMTP id t44so1309035wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jUHGGzde8Bvr/D6CXdoc4dCx2RcTFaioE35mA3VbZWE=;
	b=r5TO1gM270U5JiHeMtqV+3JK2FXBwGFGVCkU1y4BJDFNabQVvhZ5BBlOeraIRb9PHr
	PBHzK1F6Wjq8cuNPWOtY0ozbcLvBTUED4vH762LZVsP63p1KdejcZaZ9jUjS+mo+64Vi
	TwjMdyRULKJW+urzuOtE6TtJYCX4vadyMPPBPIfyS+UWd44PIGXLbUFnWO0dNqn1pP5h
	1irAFx1/eLB6dpOdwo0/JWCg2RL+L3r45GkP/aARoApQOueRbK6ioCCw8dDSSEI9x0w3
	4/W/EOqRPtLl6Zt/iLGLFNCccyd/am8SdrlKSTmsACVKGfrf2buUSg/ps8tZ/rL7/x1a
	0kxg==
Received: by 10.216.205.145 with SMTP id j17mr4372117weo.95.1348332722957;
	Sat, 22 Sep 2012 09:52:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm5133074wiy.11.2012.09.22.09.52.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:52:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:14 +0200
Message-Id: <5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Sat, 22 Sep 2012 17:04:48 -0000

* bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTTUNE
* this way xscale or arm926ejs is not used by default when some machine
  includes its tune*.inc, but it's easy for DISTRO to say it wants
  OPTDEFAULTTUNE for some packages or always (if they don't want to
  share built packages between xscale and arm926ejs).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf                       | 1 +
 meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
 meta/conf/machine/include/tune-xscale.inc    | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9b41749..e433fcb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -95,6 +95,7 @@ HOST_LD_ARCH = "${TARGET_LD_ARCH}"
 HOST_AS_ARCH = "${TARGET_AS_ARCH}"
 HOST_EXEEXT = ""
 
+OPTDEFAULTTUNE ??= "${DEFAULTTUNE}"
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
 TUNE_LDARGS ??= ""
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index c6e5289..4406b3c 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,4 +1,5 @@
-DEFAULTTUNE ?= "arm926ejs"
+DEFAULTTUNE ?= "armv5te"
+OPTDEFAULTTUNE ?= "arm926ejs"
 ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-arm926ejs", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 1f47c44..a04a5e1 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,4 +1,5 @@
-DEFAULTTUNE ?= "xscale"
+DEFAULTTUNE ?= "armv5te"
+OPTDEFAULTTUNE ?= "xscale"
 ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-xscale", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
-- 
1.7.12



