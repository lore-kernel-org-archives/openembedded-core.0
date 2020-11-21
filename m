Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1505.1605927777873560401
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 19:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=FddOBG1S;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EDB10223FD;
	Sat, 21 Nov 2020 03:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605927777;
	bh=5JmcQYO5JCFZxUy4kQevVdefGdFxw3N7GILHlBcduWI=;
	h=From:To:Cc:Subject:Date:From;
	b=FddOBG1SdYpAGGSDMdvO3FKEaQhMCCtoLAEFQChm5qZ3VGEhzWloEqDoHypCSD1VR
	 ChPp6Yaw+SENfYHPGKTxI/1yLgnMXCcvVPTgTphr+JBFP2lrZdRHB86plEscTTW5KH
	 jTzbcwKYgQh7YclKgffGonAeEi1+10Dehr/Dr6XI=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] heaptrack: add bitbake recipe
Date: Sat, 21 Nov 2020 03:02:53 +0000
Message-Id: <20201121030253.20884-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Add this useful tool to the devtools list.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../recipes-devtools/heaptrack/heaptrack.inc    | 17 +++++++++++++++++
 .../recipes-devtools/heaptrack/heaptrack_git.bb |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack.inc
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack.inc b/meta-oe/recipes-devtools/heaptrack/heaptrack.inc
new file mode 100644
index 0000000000..e45632a50c
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Heaptrack"
+HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PR = "r0"
+
+DEPENDS = "zlib boost libunwind elfutils"
+
+SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += " -DHEAPTRACK_BUILD_GUI=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
new file mode 100644
index 0000000000..8fdd590cad
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
@@ -0,0 +1,2 @@
+require ${PN}.inc
+SRCREV = "f8d9e665196614b606eaab9c6fc81d65a88a2af1"
-- 
2.17.1

