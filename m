Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 96116731FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:28 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id q19so143325828qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uCSXC2w8GgJr5Jswl7uXr5GJVJHag1RwjUABHJD6Blg=;
	b=vccSJB0wSSnvjeDX5gP6PKEREo+yl3v53ia6xc9D8/eoRTlpwmXegDMMxrH1wdQIyC
	Lbub4eFDFRAZHEovWh+KPSvBPVXbuK6nQ5zDd8gNBLezPxoFhX/rYaR6Iy1/Bbr+anPp
	bQiBX7SrkAR6xXF9bcuBXWxnabrKk4sOTdHxwEaUgviZlIh8q/3MBphTK6xZCpg4AOob
	L3N2MGwc3oZjqT+acrj/kvgioP7Q/mqrcKirSim/V4fs+xXq4JuGkSpWmmaZNViGRbjW
	cRMWKooLCVo2uGmNnGyJUHOx9+L+1rzDT1uWiV0UQD9EwMdhOhvTi9MLIVUPsaR7HAN5
	4q9A==
X-Received: by 10.55.80.9 with SMTP id e9mr139198484qkb.94.1452248369208;
	Fri, 08 Jan 2016 02:19:29 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:31 +0000
Message-Id: <52a5289e6104422826728c13411fdc48a366bbf1.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 03/53] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
new file mode 100644
index 0000000..a4b7157
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
@@ -0,0 +1,30 @@
+From 6b5bbdfaac7f216fe8a02c4cf29e5eb2aee5a409 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2015 00:01:00 +0000
+Subject: [PATCH] include sys/types.h for dev_t definition
+
+Avoids the build failures when sys/types.h does not get included
+indirectly through other headers.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ blktrace.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/blktrace.h b/blktrace.h
+index 380aec7..944fc08 100644
+--- a/blktrace.h
++++ b/blktrace.h
+@@ -5,6 +5,7 @@
+ #include <limits.h>
+ #include <byteswap.h>
+ #include <endian.h>
++#include <sys/types.h>
+ 
+ #include "blktrace_api.h"
+ #include "rbtree.h"
+-- 
+2.5.2
+
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 5b0be42..957cb70 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,7 +9,9 @@ SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
 PV = "1.1.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch"
+           file://ldflags.patch \
+           file://0001-include-sys-types.h-for-dev_t-definition.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.0


