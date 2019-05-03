Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0796C1BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 06:29:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p6so2233678pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 23:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1jnDQ+zJKuxRcyb1pblUiGWAsDQCICiydmKJ/RJ+870=;
	b=FFPCBivy8wRzFDNzSOX8RKQEWr1KoqKouFyhOtxBfXmU/q1fGGyDoqceODHGS8ZyzI
	DEQnjnjo6DRn2ns0q+vcUDKPY5YtikZh7Ry78rn/typ8budpULpG9OLMVf5MlepV5vmM
	uTxTySG2OhymNC0FnT+Hj5Gsi0A6f/PHo+o81mpwRH+984SC5UJtfdGfv6mGpy5j27Wg
	fXH/1JQIgZ7/apvNqe7coUWiSVkPcOd+BQsCcsvsWa/R4zB+8OGtsH2/xjwytdc6uib2
	mfXGiNUYeLu4uMpH+1gmQgfoPVbVZxOcgR5cdtJtuSOV0AqYvUK3d0n487Vhbc83QGpr
	j85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1jnDQ+zJKuxRcyb1pblUiGWAsDQCICiydmKJ/RJ+870=;
	b=TgM4MATF7Cy3R6MHNjf0lN7Hxtp60c7JbwSJpxeZwpme3ne7dQHtNCEfkM/+yjSNvO
	JmIGY15pIqqpnora+wogxgTRV65vcWxSB6JmEBBgGR16dKYwrameKUPCengt7RDGfB1k
	FbYnHYKsL012MO0kKYg43mNm9ba9PgutTjFHH/vFH+zHtRs1UK9fZPIwEb7qqUAM0u4t
	Bs68A9Zil5WnjJl0/rn+cSKIZSfdC0GSkFbIq+zMRRyJx2KC4FX7T/GLIlPfC1G2YeTV
	r95h+0GXBFpmHKc5VOt8zpVp5Zr4XcOxiJXSsIGZALzHqMtMJ6zzPP9wl5lnefMVoOBI
	zZwg==
X-Gm-Message-State: APjAAAVBpc/foIXARirZ5msp1wkUQbFAk+fdy8JtaDYh9Q58XJ9Sbrve
	uCl+cqR8cs8h1wEIExre1sA7O4/Po6U=
X-Google-Smtp-Source: APXvYqwknUkpsBGwKrZItwBXwwH2zP77WqxRQ3PDTgZu8KH1VIOe7s8pn0Ysph1+HwDhVOAEcDr8pg==
X-Received: by 2002:a63:58b:: with SMTP id 133mr8315698pgf.138.1556864974623; 
	Thu, 02 May 2019 23:29:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5848])
	by smtp.gmail.com with ESMTPSA id k9sm1188012pga.22.2019.05.02.23.29.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 23:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 23:29:26 -0700
Message-Id: <20190503062926.6933-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] mdadm: Disable Werror
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
X-List-Received-Date: Fri, 03 May 2019 06:29:34 -0000
Content-Transfer-Encoding: 8bit

Werror spews more warnings with gcc9, like other distros (
debian/fedora) disable Warnings as errors

Fixes

super-intel.c:696:9: error: taking address of packed member of 'struct imsm_super' may result in an unaligned pointer value [-Werror=address-of-packed-member]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mdadm/files/debian-no-Werror.patch        | 25 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/debian-no-Werror.patch

diff --git a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
new file mode 100644
index 0000000000..e66a15cd79
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
@@ -0,0 +1,25 @@
+From: martin f. krafft <madduck@debian.org>
+Subject: Remove -Werror from compiler flags
+
+-Werror seems like a bad idea on released/packaged code because a toolchain
+update (introducing new warnings) could break the build. We'll let upstream
+use it to beautify the code, but remove it for out builds.
+
+Signed-off-by: martin f. krafft <madduck@debian.org>
+
+Upstream-Status: Pending
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ endif
+ 
+ CC ?= $(CROSS_COMPILE)gcc
+ CXFLAGS ?= -ggdb
+-CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
++CWFLAGS = -Wall -Wstrict-prototypes -Wextra -Wno-unused-parameter
+ ifdef WARN_UNUSED
+ CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ endif
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 947706ff5f..ef5ddf55db 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
+           file://debian-no-Werror.patch \
 	   file://mdadm.init \
 	   file://mdmonitor.service \
            "
-- 
2.21.0


