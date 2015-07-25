Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61C2C75BD3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 13:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PDcB4g011918; Sat, 25 Jul 2015 14:38:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kIIWshk_mDeu; Sat, 25 Jul 2015 14:38:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PDbwJk011905
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Jul 2015 14:38:10 +0100
Message-ID: <1437831478.821.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Jul 2015 14:37:58 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Subject: [PATCH] perf: Fix config file conflict with 4.1 kernels
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
X-List-Received-Date: Sat, 25 Jul 2015 13:38:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you setup mutlitlibs and then:

bitbake perf libb32-perf
bitbake perf libb32-perf -c cleansstate
bitbake perf libb32-perf

you will see races where the two builds get confused about which directory
they should be using and they corrupt each other.

The issue is that .config-detected is created in ${S}, not $(OUTPUT).
We can fix this by moving the file to $(OUTPUT).

[YCOTO #8043]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f18178c..056ac83 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -127,12 +127,27 @@ do_configure_prepend () {
     # 64 bit build (and library) are not exected. To ensure that libraries are
     # installed to the correct location, we can use the weak assignment in the
     # config/Makefile.
+    #
+    # Also need to relocate .config-detected to $(OUTPUT)/config-detected
+    # as two builds (e.g. perf and lib32-perf from mutlilib can conflict
+    # with each other if its in the shared source directory
+    #
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
         # Match $(prefix)/$(lib) and $(prefix)/lib
         sed -i -e 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
                -e 's,^perfexecdir = \(.*\),perfexecdir ?= \1,' \
+               -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/config/Makefile
     fi
+    if [ -e "${S}/tools/perf/Makefile.perf" ]; then
+        sed -i -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
+            ${S}/tools/perf/Makefile.perf
+    fi
+    if [ -e "${S}/tools/build/Makefile.build" ]; then
+        sed -i -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
+            ${S}/tools/build/Makefile.build
+    fi
+
     # We need to ensure the --sysroot option in CC is preserved
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf



