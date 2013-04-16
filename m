Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1US5n5-00035a-Ms
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 15:19:20 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so231332eek.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=taAkF7t5AUPinAdjM05jIJYp6IuTsqw478gAsyojfKQ=;
	b=VkdYzjxUz8OxzYJxgXGzhythAkSngHvqHHt+qc1w/ZPO4/AceFPRRqI4I1ngAIHLYA
	oeJPQx1m3tKSPinmsrmDMiHWVMpQ1I/pDMnWDAg003EJDQMh9iuayhVgRYB1A6f6e4OR
	lTAOWmcavYj7bISZw+2fkiqCPzifm+UVPEaTu9NSOWUZb/1vZrRBemq3SiKRb4o44Mbl
	bAHtwPOnLFMjWtQpEmcR4BHxLWewsN16cTvt+WaGePktTD67Kukg1zWufzzX3Km+xZX9
	fIwS66rXidXOXuj0RVZRps6CzrkDFY4YICm/8A1AL93xDWFU2hV55XiF1wZ14CXax/U8
	PFUQ==
X-Received: by 10.15.32.142 with SMTP id a14mr6266157eev.22.1366117309502;
	Tue, 16 Apr 2013 06:01:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPS id i53sm2775577eeu.5.2013.04.16.06.01.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 06:01:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 14:59:27 +0200
Message-Id: <1366117167-26359-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: fix segfaults for ARM SoCs
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
X-List-Received-Date: Tue, 16 Apr 2013 13:19:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-fix-segfaults-char-is-unsigned-for-ARM-a.patch |   39 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.14.0.bb            |    3 +-
 2 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch
new file mode 100644
index 0000000..16f0489
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch
@@ -0,0 +1,39 @@
+From a095f5005be66c1b9747187e91e5332b0d8b106b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 16 Apr 2013 13:47:22 +0200
+Subject: [xserver 1.14/master] dixstruct.h: fix segfaults - char is unsigned
+ for ARM and PowerPC architectures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+see ARM related bug reports [1-3]
+
+Upstream-Status: Submitted [4]
+
+[1] https://github.com/archlinuxarm/PKGBUILDs/issues/446I
+[2] http://www.raspberrypi.org/phpBB3/viewtopic.php?t=38568&p=321673
+[3] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037805.html
+[4] http://lists.x.org/archives/xorg-devel/2013-April/036010.html
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ include/dixstruct.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/dixstruct.h b/include/dixstruct.h
+index 6784819..aef822c 100644
+--- a/include/dixstruct.h
++++ b/include/dixstruct.h
+@@ -96,7 +96,7 @@ typedef struct _Client {
+     unsigned int clientGone:1;
+     unsigned int closeDownMode:2;
+     unsigned int clientState:2;
+-    char smart_priority;
++    signed char smart_priority;
+     short noClientException;      /* this client died or needs to be killed */
+     int priority;
+     ReplySwapPtr pSwapReplyFunc;
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
index 83b8049..8c573bd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
@@ -6,12 +6,13 @@ SRC_URI += "file://crosscompile.patch \
             file://mips64-compiler.patch \
             file://aarch64.patch \
             file://fix_compilation_when_not_using_xinerama.patch \
+            file://0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch \
            "
 
 SRC_URI[md5sum] = "86110278b784e279381b7f6f2295c508"
 SRC_URI[sha256sum] = "1f5107573252c26439fdd165481765a2c0964e02a2e9fab36e02414d08f30630"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.7.6.5



