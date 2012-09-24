Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFz2D-0005Jf-Pe
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 05:08:38 +0200
Received: by pbcwy7 with SMTP id wy7so11403795pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 19:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1WtK3pfBpf59Uv6Z7CIeyGTQe5yH13zr9DUmxqmN1iY=;
	b=C7kXjsPZ6RixOd4WYxD6Ldx5sKQn4UFQUOZmnzckXQBVDjwP+cxeyAlSYo0LVrs38i
	MMXbpiShI2AChxY1hVeFZMQUm0AVDlNWyHk1eFhNPC1CwUI+0HxWn26tQL3nbxWM5hrM
	CM3DjlDEBvqpG99sjO/FvOP5m86D2MxTZWJjp/80SnJ2bbf6vlq4l2RaXhHl+ty6IZAV
	BtDUMELE8hKEFamA5WHKraDWzicxVo5C7L98On0irniQ7v0FgbEVQc/8t/r+ftnMAnTD
	Dw/ue24abc6VGdK8eAoUjYLcP35wlrsGjyGR3484IP6wq/NlpnYPhi5FFkOdWQWUACJT
	XRHA==
Received: by 10.68.134.99 with SMTP id pj3mr32852904pbb.13.1348455349813;
	Sun, 23 Sep 2012 19:55:49 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id it5sm8893342pbc.10.2012.09.23.19.55.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Sep 2012 19:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Sep 2012 19:55:40 -0700
Message-Id: <1348455340-17321-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] arch-armv7a.inc: Don't disable vectorization
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
X-List-Received-Date: Mon, 24 Sep 2012 03:08:38 -0000

We have been adding this option to paper over a bug in old toolchain
http://hardwarebug.org/2008/11/28/codesourcery-fails-again/
e.g. is one but these have been weeded out. Therefore let gcc
take the default vectorization optimizations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index f439de7..8d6ec25 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -4,7 +4,7 @@ ARMPKGARCH ?= "armv7a"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
-- 
1.7.9.5



