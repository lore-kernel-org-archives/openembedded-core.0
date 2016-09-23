Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2B026059F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 10:58:49 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l131so5486636lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 03:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7fTDjHWJ+VJBX4s1zzVvOZWyi+Y9gOGHWNWVG31kI54=;
	b=R5RZqqE0guJO0GTZTLxYJYeqhsvQToKC6f/LbT/fDhl2O5s9pUGvn3pvwLW8H3OLFU
	jD4NCBJ5K0wYO1AjsW5NoKiFMHllO9QgpVoIFbSQX4LGCiQRaQFOHtd6U/vXsoaQrw1T
	KWCi60W3r1ycoQkDMPQK4yGPtqlpRb4k6jURXOpCVD8C/HQVMWj+lcfJTbFU42ESQXS1
	pDQQpLIr+ZP+/FhsDWDLYOD4o9TU0ekQ22MpQDhZeG7Jkh9hyLtXL7uMpsh9J5kxj+GM
	fjnLRKBn1GkqYd6UdAY2ZrUNel30vPnl9dyuYKlqnpMuqW3omBssSxNHh0LAbPWonr3I
	Pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7fTDjHWJ+VJBX4s1zzVvOZWyi+Y9gOGHWNWVG31kI54=;
	b=PgXx0X6+FabnpnhNKX59TvG5qc6TN7yg3y+HKvu3LnhW3ZFEdC2wWxbfswlu255HZD
	jiP2RZ/D2JUwCRNXUE4CPiiCNcIGh3aQYokR3vF/JBAlfBUlW7mxIH332LnsyYIPpD+m
	1bH3fBHnW3QGbGVgt2jSRolR8ckEIWp6Hyy/EMJc2GYQo0dfokwuReUmw5Izp+QxfvIC
	DohLeSyeNH0HG21ZLIOX5q7rDqcopfQ97xpDD5HYBMLTGREFZlCRfN2hE1NVzIshF4Nq
	V2f9UAhOxyV7LoWqC6h3lcWu2W9pICHm+G+mg9O4nb9tAKE5C5jm7SeilqKoOA6eJRbO
	/D+Q==
X-Gm-Message-State: AE9vXwPPp6ixp4NGF7bXU1uAh+9XlHMbs4MRKHJMfT+8xaDkMQZKdFlxHBuaT/tSFcf3eQ==
X-Received: by 10.25.166.196 with SMTP id p187mr2311324lfe.48.1474628329860;
	Fri, 23 Sep 2016 03:58:49 -0700 (PDT)
Received: from localhost.localdomain (m77-218-246-7.cust.tele2.se.
	[77.218.246.7]) by smtp.gmail.com with ESMTPSA id
	s125sm1139504lja.14.2016.09.23.03.58.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 03:58:49 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 12:58:53 +0200
Message-Id: <1474628333-28806-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] lttng-tools: fixes a wrong header issue
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
X-List-Received-Date: Fri, 23 Sep 2016 10:58:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes a following compiling issue:
| agent.c:33:19: fatal error: error.h: No such file or directory
|  #include "error.h"

it's back-ported from lttng-tools upstream, we need it in SRC_URI
since 2.8 is still the latest release.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../0001-Fix-error.h-common-error.h.patch          | 33 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
new file mode 100644
index 0000000..6c8a9b2
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
@@ -0,0 +1,33 @@
+From 6712db617fe9155ea236f6840c2bd18dbec4c871 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 15 Jun 2016 17:18:03 -0400
+Subject: [PATCH] Fix: error.h -> common/error.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ src/bin/lttng-sessiond/agent.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bin/lttng-sessiond/agent.c b/src/bin/lttng-sessiond/agent.c
+index 7cbbbde..310a7e8 100644
+--- a/src/bin/lttng-sessiond/agent.c
++++ b/src/bin/lttng-sessiond/agent.c
+@@ -29,7 +29,7 @@
+ #include "agent.h"
+ #include "ust-app.h"
+ #include "utils.h"
+-#include "error.h"
++#include "common/error.h"
+ 
+ #define AGENT_RET_CODE_INDEX(code) (code - AGENT_RET_CODE_SUCCESS)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 66269d8..84cac84 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-nat
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
+           file://0001-Fix-error.h-common-error.h.patch \
            file://runtest-2.4.0.patch \
            file://run-ptest"
 
-- 
1.9.1


