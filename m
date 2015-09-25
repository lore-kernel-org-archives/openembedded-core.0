Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id D2573757AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:00:01 +0000 (UTC)
Received: by qgez77 with SMTP id z77so62014489qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1O1uCEcM1/INHzDMUxUbt4dDkGUZ7GXrcaz09ZfuqAA=;
	b=H/Cqp6Og5poaWE/ASUl8Qvuq5ZBTLGLrK4gQtmJ/Jbf5rE2Qc5B+F5NRggHWUk99Mw
	oAOk/+Y4ONBi6bCL2D0TTy1LRlMgVZ3/7FcQPXEqY/IF16/heYzfBHLfnfqBWu0dq8mY
	HmjCLYlIQcXep+c93scAzPtg8up18xsNCljJ1Ut5yfQjg3ikSEQvf9B2QUtdqgBv3Anc
	g1077F1ZXlesTgNaGqGnIkkr2KRHY+dflZFhz9AKQIBb9efaE/lin0kjK2bb8dbCPAbd
	i9Ntxy+49XttSUaiflVWIIYkT6TiXH7v6Dr5A6Fyvxl0HRRUywSLiRi67N+pXjH067NQ
	xU1w==
X-Received: by 10.140.30.139 with SMTP id d11mr3856769qgd.85.1443157202047;
	Thu, 24 Sep 2015 22:00:02 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c188sm768477qka.37.2015.09.24.22.00.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 22:00:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 04:59:16 +0000
Message-Id: <1443157157-33969-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/4] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Fri, 25 Sep 2015 05:00:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
new file mode 100644
index 0000000..f63868f
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
+Status: Submitted
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
2.5.3


