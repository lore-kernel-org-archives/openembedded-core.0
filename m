Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id DEB51759FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:28:10 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so16900821pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kR1qaylY5fpJntGy67JiEXKKPHI/GnYXLzKDbcJ/TZc=;
	b=tOefaCL90A79Cj8SHax/u3UQ/4ADCOoeVf7oZV//vy4dpWMnc6yApAR4QZodKveIfm
	q6+su2ARgxDYETa5YCHhyWt0mOzCJJcN3FbfG8LgykVHwzfb3LOLkOh83PG4JaBtO7pe
	Zx7+VegixZfvaUczJuOLv5FzFip8s1bRxCXPnXcRZeWyz3DOM5oJfMe1AGgMOvcaFEXT
	ojKsSM1RDQx09dIsqx3i68XvavxsI5dau46HNFG+Md2/3crnLlR0cfB5W1WDiugpFLi+
	0W3tKJWUVorLUKw6WTCUKDveswFeolRJyLFSnClD9BZ1cRy+o+rco4zIQLBOLkqMLmWU
	yL+A==
X-Received: by 10.70.128.104 with SMTP id nn8mr16173945pdb.28.1435102092153;
	Tue, 23 Jun 2015 16:28:12 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x7sm22086074pas.28.2015.06.23.16.28.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 16:28:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 16:27:57 -0700
Message-Id: <1435102077-18544-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-core2.inc: set X86ARCH32 to i686 (instead of i586)
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
X-List-Received-Date: Tue, 23 Jun 2015 23:28:12 -0000

Use i686 as TARGET_ARCH for 32bit core2 (and corei7 and atom) builds.

In most cases, i586 and i686 are equivalent values for TARGET_ARCH, however
one important exception is glibc. When configured for i686, glibc enables
optimised string functions (SSE, SSE2, etc), which are not used when
building for i586.

The benefits of i686 optimised string functions vary depending on the
application and the CPU, however in some cases the improvements are
significant. In one test, a 50% increase in FPS was seen when running the
'smashcat' benchmark [1] in a qtwebkit browser on an Intel Atom based SoC.
The gain seems to comes from a 3x improvement in memcpy performance when
copying graphics buffer lines (5120 bytes, or 1280 x 4 bytes/pixel), from
the CPU to GPU. Note that very large memcpy's (e.g. 32MB) on the same
machine show no particular performance increase between i586 and i686.

  [1] http://www.smashcat.org/av/canvas_test/

Warning: The change in TARGET_ARCH means that _i586 architecture specific
over-rides will no longer take effect. Both oe-core and meta-oe have been
updated to replace _i586 over-rides with _x86, however other layers may
still need review and updating.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-core2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 078e22d..9a4cb70 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -8,6 +8,9 @@
 #
 DEFAULTTUNE ?= "core2-32"
 
+# Set x86 target arch to i686, so that glibc enables SSE optimised memcpy, etc.
+X86ARCH32 ?= "i686"
+
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-i586.inc
 
-- 
1.9.1


