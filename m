Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFC5E65C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 07:53:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0N7rDbn019596
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 23:53:14 -0800 (PST)
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 22 Jan 2015 23:53:13 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Jan 2015 15:53:05 +0800
Message-ID: <1421999585-7473-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: yue.tao@windriver.com
Subject: [PATCH] systemtap: Adapt to glibc deprecation of _BSD_SOURCE: add _DEFAULT_SOURCE
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
X-List-Received-Date: Fri, 23 Jan 2015 07:53:19 -0000
Content-Type: text/plain

The _BSD_SOURCE has been deprecation in glibc 2.20 and greater, in order to
being compatible with newer glibc version, add _DEFAULT_SOURCE.

The build error on fedora21_64

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 ...pt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch |   31 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch b/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch
new file mode 100644
index 0000000..d69d3bf
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch
@@ -0,0 +1,31 @@
+From c6278d012a483d97f5ee4756406d9c88735d2838 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Tue, 25 Feb 2014 11:34:35 -0500
+Subject: [PATCH] PR16632: Adapt to glibc deprecation of _BSD_SOURCE: add
+ _DEFAULT_SOURCE
+
+(Upstream commit c6278d012a483d97f5ee4756406d9c88735d2838)
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ staprun/staprun.c                       |    1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/staprun/staprun.c b/staprun/staprun.c
+index e4ced77..8782ade 100644
+--- a/runtime/staprun/staprun.c
++++ b/runtime/staprun/staprun.c
+@@ -21,6 +21,7 @@
+ 
+ #define _XOPEN_SOURCE
+ #define _BSD_SOURCE
++#define _DEFAULT_SOURCE
+ #include "staprun.h"
+ #include "../privilege.h"
+ #include "../runtime/k_syms.h"
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f81e8ba..d51fad2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -9,6 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://system_map_location.patch \
            file://tapset-linux-sendfile-syscall.patch \
            file://configure-allow-to-disable-libvirt.patch \
+           file://0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch \
           "
 
 # systemtap doesn't support mips
-- 
1.7.9.5


