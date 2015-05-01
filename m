Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A68A73D76
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 01:34:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t411YO0H005784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Apr 2015 18:34:24 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 30 Apr 2015 18:34:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Apr 2015 21:34:19 -0400
Message-ID: <6cb24630bbea598e45ccfedc2ecc26f16ca5c7d6.1430443583.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430443583.git.bruce.ashfield@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] perf: fix build (and feature tests) for 4.1-rcX
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
X-List-Received-Date: Fri, 01 May 2015 01:34:24 -0000
Content-Type: text/plain

The way that perf detects features has changed/moved via commit e6c76d620
[perf build: Move feature checks code under tools/build].

This code movement resulted in the definition of CC being dropped, and
in turn the passing of --sysroot not part of the build.

This results in feature tests failing with errors such as:

  In file included from test-pthread-attr-setaffinity-np.c:1:0:
  sysroots/x86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/include/stdint.h:9:26:
  fatal error: stdint.h: No such file or directory
  # include_next <stdint.h>
                          ^
  compilation terminated.

While the fix is going upstream, we can modify the perf recipe to add
the definition of CC into the Makefile, and we'll continue to work on
patched and unpatched kernels.

Upstream-status: Pending

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 420fe6b57aba..eb273740ee10 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -150,6 +150,9 @@ do_configure_prepend () {
     if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
         sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
     fi
+    if [ -e "${S}/tools/build/Makefile.feature" ]; then
+        sed -i 's,CFLAGS=,CC="\$(CC)" CFLAGS=,' ${S}/tools/build/Makefile.feature
+    fi
 
     # 3.17-rc1+ has a include issue for arm/powerpc. Temporarily sed in the appropriate include
     if [ -e "${S}/tools/perf/arch/$ARCH/util/skip-callchain-idx.c" ]; then
-- 
2.1.0


