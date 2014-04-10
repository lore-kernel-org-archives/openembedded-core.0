Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 415D860809
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:06:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3A963Db016164; Thu, 10 Apr 2014 10:06:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NXsbcOMGdCnT; Thu, 10 Apr 2014 10:06:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3A95uRF016144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 10 Apr 2014 10:05:57 +0100
Message-ID: <1397120750.24597.238.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2014 10:05:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] perf: Fix sysroot option to CC handling
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
X-List-Received-Date: Thu, 10 Apr 2014 09:06:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you build perf in tree /xxx/treea, then cleansstate perf and build it
in /xxx/treeb having deleted treea, the build will fail, unable to find libc.

The problem is that the --sysroot option passed in through CC is missing.
This works fine if the default sysroot is ok, if it isn't, things will fail.
In 1.7 we'll start poisoning the default sysroot in gcc to catch this kind of
issue however that doesn't fix the problem with perf.

The problem is that various Makefiles set CC = $(CROSS_COMPILE)gcc. The
easist fix for now is to sed out the problematic Makefile lines. Its worth
noting the tools/lib/traceevent Makefile has a much more funky way of setting
CC which works for us and may be the way we need to fix the other Makefiles 
upstream.

This fixes build failures we're occasionally seen on the autobuilders.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9dfccdf..ef21b6c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -133,6 +133,18 @@ do_configure_prepend () {
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
         sed -i 's,libdir = $(prefix)/$(lib),libdir = $(prefix)/${baselib},' ${S}/tools/perf/config/Makefile
     fi
+    # We need to ensure the --sysroot option in CC is preserved
+    if [ -e "${S}/tools/perf/Makefile.perf" ]; then
+        sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
+        sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
+    fi
+    if [ -e "${S}/tools/lib/api/Makefile" ]; then
+        sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
+        sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/lib/api/Makefile
+    fi
+    if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
+        sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
+    fi
 }
 
 python do_package_prepend() {



