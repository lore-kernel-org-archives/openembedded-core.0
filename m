Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYLy2-0005N1-2D
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 19:11:42 +0100
Received: by eaao14 with SMTP id o14so720768eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 10:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yr7AT87GJGAgDgOCOUrXzgOrCc0oxORgEufJzQbceNU=;
	b=J7pg2No1RZeGqKivD5HiRQjxO9ArExWJ9Swrp0TvlqgtdtWHsWi89MJnnJYduz7w+2
	cD1X6zlWhKYqxQ1i/CdKypDxohgv615B0fcHoxrkED1cfTDb3ISoD484b4WR2vTYI6lO
	g+MdGyu+BGb2zPCITOfXeBaQzy7pn/sFVXLUw=
Received: by 10.213.29.202 with SMTP id r10mr783822ebc.52.1323281092774;
	Wed, 07 Dec 2011 10:04:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm8632227eec.1.2011.12.07.10.04.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 10:04:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 19:04:44 +0100
Message-Id: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Wed, 07 Dec 2011 18:11:42 -0000

* motivated by this NAK
  http://patchwork.openembedded.org/patch/15777/
  and today's discussion on #yocto I hope it's worth it to send this RFC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc  |    1 +
 meta/conf/machine/include/arm/arch-armv5.inc  |    1 +
 meta/conf/machine/include/arm/arch-armv6.inc  |    1 +
 meta/conf/machine/include/arm/arch-armv7.inc  |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc |    1 +
 5 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index c014d20..a09c323 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -4,6 +4,7 @@ ARMPKGARCH ?= "armv4"
 
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
 require conf/machine/include/arm/feature-arm-thumb.inc
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 55cbe03..fd3490f 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -5,6 +5,7 @@ ARMPKGARCH ?= "armv5"
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNE_CONFLICTS[armv5] = "armv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
 
 ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
 
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 9f2e9ac..da8274e 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -5,6 +5,7 @@ ARMPKGARCH ?= "armv6"
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNE_CONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
index 8bc8d10..98481aa 100644
--- a/meta/conf/machine/include/arm/arch-armv7.inc
+++ b/meta/conf/machine/include/arm/arch-armv7.inc
@@ -5,6 +5,7 @@ ARMPKGARCH ?= "armv7"
 TUNEVALID[armv7] = "Enable instructions for ARMv7"
 TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":armv7", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index d508352..de39cb5 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -5,6 +5,7 @@ ARMPKGARCH ?= "armv7a"
 TUNEVALID[armv7-a] = "Enable instructions for ARMv7-a"
 TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv7.inc
 
-- 
1.7.8



