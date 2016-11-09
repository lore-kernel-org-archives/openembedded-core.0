Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E73417198F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:10:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a197so276994175wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sBdxxTXEUkL3D52jwhfv8mzpHhox885JCIhgv1lo7dA=;
	b=xVGtoFD3I1IF+3iOUcQQxfGa2l2eApIjJw8mEBr0LMU+tSADuZw6Djr+Luvv8wvWOG
	LAV7bfTNjoQslaI416NjczmdJwnwirQ9H28amIeLAxjFdK7UxuH8GqSq3hKNtbYbDEnz
	kFYjCeUGMzoi69YQu6VfH8gTlqgmGt6eFQiPSu4U5+k9K7U6USoFfnwGS7b53759ki23
	4lIh5bFUc8ZtupFR6NPGoGUusvs31BAzi0Y+8zEDpEmlRDE/4MwwKz5SjEg9+vt0+RaJ
	GOhFWxeY1FYmo3N8xBuUht/5N16bRI7m5KQLq+Yx4bIXYu5IkXQVf5sScTcijPLtw46S
	ikGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sBdxxTXEUkL3D52jwhfv8mzpHhox885JCIhgv1lo7dA=;
	b=Eaq+a0UPvwWe0LTnFlSP1/BB9iEaFlxphiUju/bvhv/oLgWeFHKGFPt63Zt+Q1tmHk
	Ln3DUM2gxTjkmPSLxsZJXy6PdFs+J1dxxL1JM3cKYk29RaI5QHGbB0gz34bYOJwmQwMc
	6S0ZTOevGAr5SCBdopQWuGJrOyCT8QSHwPtkX6KcL9HSPNoc3BWuTsYFx1DGp7cnFNq5
	qRCYeMeC758GOiD1aTWDx7tHqh5Xns8JeQtTDBDVm0CL/jKp8HZS9lB9Eap7B0p/AbgU
	z4XkKsbYbwTDWorWamMaN4UQd46CJCDhMELGVSFFnfn7AVxBy1oJUm/4jP9NBciSOfj3
	pd2A==
X-Gm-Message-State: ABUngvcJE/KnV+L0CyD9H3/dQSuBnjv3XrJPCR5tmbvfRYUBxBINBoMyzFBgwcYZQpXBclw9
X-Received: by 10.28.178.10 with SMTP id b10mr19430521wmf.83.1478650248396;
	Tue, 08 Nov 2016 16:10:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 18sm22330985wmr.6.2016.11.08.16.10.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Nov 2016 16:10:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 00:10:44 +0000
Message-Id: <1478650244-7002-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1478650244-7002-1-git-send-email-ross.burton@intel.com>
References: <1478650244-7002-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemtap: fix native linking on recent Ubuntu
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
X-List-Received-Date: Wed, 09 Nov 2016 00:10:48 -0000

The latest Ubuntu uses yet more aggressive hardening options, which causes the
unconventional build order used by systemtap to fail.

[ YOCTO #10521 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemtap/systemtap/fix-monitor-linking.patch  | 41 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch b/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
new file mode 100644
index 0000000..2bf0742a1
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From d940aa0079c253b958cf9158e9ec7922ecf464f9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 9 Nov 2016 00:00:48 +0000
+Subject: [PATCH] staprun: fix linking if monitor is enabled
+
+If the monitor is enabled, monitor.c needs to link against json-c and ncurses.
+Instead of adding these linker flags to AM_CFLAGS (global CC flags) add them to
+stapio_LDADD.
+
+Apart from being the "right" thing to do, this fixes build failures on systems
+such as current Ubuntu (which defaults to using --as-needed and similar) where
+link order is important.
+---
+ staprun/Makefile.am | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/staprun/Makefile.am b/staprun/Makefile.am
+index 63d4088..66b3e21 100644
+--- a/staprun/Makefile.am
++++ b/staprun/Makefile.am
+@@ -42,12 +42,11 @@ staprun_CXXFLAGS += $(nss_CFLAGS)
+ staprun_LDADD += $(nss_LIBS)
+ endif
+ 
+-if HAVE_MONITOR_LIBS
+-AM_CFLAGS += $(jsonc_LIBS) $(ncurses_LIBS)
+-endif
+-
+ stapio_SOURCES = stapio.c mainloop.c common.c ctl.c relay.c relay_old.c monitor.c
+ stapio_LDADD = libstrfloctime.a -lpthread
++if HAVE_MONITOR_LIBS
++stapio_LDADD += $(jsonc_LIBS) $(ncurses_LIBS)
++endif
+ 
+ man_MANS = staprun.8
+ 
+-- 
+2.8.1
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 34cf227..a0f0e68 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -10,6 +10,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://x32_abi_time.patch \
            file://monitor-option.patch \
            file://no-msgfmt-check.patch \
+           file://fix-monitor-linking.patch \
           "
 
 # systemtap doesn't support mips
-- 
2.8.1


