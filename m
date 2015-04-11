Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA8B673D35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:55 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so37876130pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=aL2jxoth8VJqig2lC6QHmmP/bgbPUlmXXAs3jkIQ6mU=;
	b=XiZ2zaMI3QXHshqEj10+3gmkjFEV1cQPx+Wh5lpUfh0dfkw1mzDESYgIn6bLaRcmw+
	AFsmmqowrrJTdcstoi+lY0EGoH8ovHn+8+U1Cq19mNaWkwKsx3EoBkICWsmbFt5aC83K
	60Wuqfv3PrBC+goQ1npvb/Mo6vLvmPsYU3PJCJAWdjv9Lx0qU4gyyjvKqNujhi21aJu5
	zvJORY6kcFO/39WBTbHNu44Xcnx70uNP/XmA6bro4sD+lP4/f6UfP1/QAHple+mlNfex
	4ZnjoR/86fjjPNHcTiIoHZ7PcwR9y/1Q1vUEISARc4uBydsfu/bnsxeAIpvHpwoAjHwr
	NLAg==
X-Received: by 10.70.43.134 with SMTP id w6mr7108746pdl.169.1428715256922;
	Fri, 10 Apr 2015 18:20:56 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:34 -0700
Message-Id: <0a8c8ddd0140d02290f189292fe8ad841e5bf0b7.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 03/17] libproxy: Include select.h for posix compliance
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:56 -0000

unearthed with musl

Change-Id: I527139905785f253e41dd6a2f0cf555eee752a3a
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-test-Include-sys-select.h-for-select.patch | 37 ++++++++++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.11.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch

diff --git a/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch b/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch
new file mode 100644
index 0000000..5ae52f2
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch
@@ -0,0 +1,37 @@
+From f5f2c2289eb35eb804c1c35e46ca41b58e4cae01 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 14:13:49 -0700
+Subject: [PATCH] test: Include <sys/select.h> for select()
+
+As per posix we need to include this file otherwise we end up with errors like
+
+/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp: In member function 'bool TestServer::loop()':
+/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp:80:4: error: 'fd_set' was not declared in this scope
+    fd_set fds;
+    ^
+/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp:89:14: error: 'fds' was not declared in this scope
+    FD_ZERO (&fds);
+<JIRA TICKET #1>, <JIRA TICKET #2>, <JIRA TICKET #n> : <one line summary of change>
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libproxy/test/get-pac-test.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libproxy/test/get-pac-test.cpp b/libproxy/test/get-pac-test.cpp
+index a61fc4b..bda4646 100644
+--- a/libproxy/test/get-pac-test.cpp
++++ b/libproxy/test/get-pac-test.cpp
+@@ -3,6 +3,7 @@
+ #include <sstream>
+ #include <string>
+ 
++#include <sys/select.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 3367c85..e709b52 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "gconf glib-2.0"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
+           file://0001-test-Include-sys-select.h-for-select.patch \
           "
 
 SRC_URI[md5sum] = "06be230b8b612e64997f8f15af6373aa"
-- 
2.1.4


