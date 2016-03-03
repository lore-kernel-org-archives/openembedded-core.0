Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 79E4177158
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 21:01:27 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so52360552wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 13:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3PYAIfBvlaxgQloi3pxvJ/LRuWiSHTW57CjFwlDynUc=;
	b=ROjaGzDdxy1oawXRNPHBik0c3/r2ixy13TlpvQxvxCZscxxo9XHe03WK8sOC1vnCKG
	Vzg3mFffPh0sGgBvDqHH3YHfCJzumWpsVLB+hRbs6ooiaTM9NCacZ8Y8jrVOjFVZJgTi
	wTQYzxG7w0TzyHFCvN9TycmraOTN61+SAHa800xydIngdlFdOhZXryngaHJVrPxyd2hE
	maXTNay9ZehbSCb9x6YMEaGUT0OFqj0EooaMiYDHprA9R/Y4ThhL85zbDc4FgL7sQPAB
	oPxTGMtZUVJ9bvOGxlj+B1z5CJ2iiYyhSE545f97dl67Acp5+Y8noLnZTV5nXU/t3J7u
	DX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3PYAIfBvlaxgQloi3pxvJ/LRuWiSHTW57CjFwlDynUc=;
	b=dFwsQR3jMqtoBVeqm+i6Ik6zVsR6bWvrJ9sy0qhp0wi/9ezluI2nF9C7qK9CIwh0X6
	8OUKsbyEb65mLEIOrSgwgjPSUVSgqYuJtoqZ7vJgSLr0FR2tUxxayieKDg9KPkv/Z8Pd
	tCh9yASfTtt8MmSL+3FrYQDyUPM5t6WHyWg3gh50oIu5TLVvZViDOOpjRj6cIEUIdmtQ
	97gDDepjX4GcLJ3zzUHooA1vMmBvGnJfSeUNkFhFt3ZzvcQgdkfYujXsTSJaiMfuQCsh
	oZY8vJznvTHSQwB5MQZZqrbKM75m77maFpHH+zBjW6v2t7qJ3KbzTZgiFRu7eiiX9NJC
	OBXw==
X-Gm-Message-State: AD7BkJL/CGICFj+r4a7g4M/StVLIM7Wdc6iKozdOmQ0MWDfxytzLa+nEav0Vv2ghPPEJcB+B
X-Received: by 10.194.58.234 with SMTP id u10mr5101809wjq.174.1457038888340;
	Thu, 03 Mar 2016 13:01:28 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id up6sm286888wjc.6.2016.03.03.13.01.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 13:01:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:01:13 +0000
Message-Id: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gdb: fix builds with internal readline and no static libraries
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
X-List-Received-Date: Thu, 03 Mar 2016 21:01:29 -0000

If gdb was configured to use the internal readline but static libraries were
disabled, gdb wouldn't dutifully not build libreadline.a which was a problem
when it tried to link with that library.

Solve this by ensuring --enable-static is passed to the readline configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 .../gdb/gdb/force-readline-static.patch            | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/force-readline-static.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 1dd6551..507f274 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -7,6 +7,7 @@ SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
             file://0001-include-sys-types.h-for-mode_t.patch \
             file://0001-use-asm-sgidefs.h.patch \
+            file://force-readline-static.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch b/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
new file mode 100644
index 0000000..d34ee8c
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
@@ -0,0 +1,37 @@
+If gdb is configured with --disable-static then this is dutifully passed to
+readline which then disables libreadline.a, which causes a problem when gdb
+tries to link against that.
+
+To ensure that readline always builds static libraries, pass --enable-static to
+the sub-configure.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.def b/Makefile.def
+index 4394188..05c661a 100644
+--- a/Makefile.def
++++ b/Makefile.def
+@@ -100,7 +100,8 @@ host_modules= { module= libiconv;
+ 		missing= install-html;
+ 		missing= install-info; };
+ host_modules= { module= m4; };
+-host_modules= { module= readline; };
++host_modules= { module= readline;
++                extra_configure_flags='--enable-static';};
+ host_modules= { module= sid; };
+ host_modules= { module= sim; };
+ host_modules= { module= texinfo; no_install= true; };
+diff --git a/Makefile.in b/Makefile.in
+index 61e0ab6..837f36e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -24971,7 +24971,7 @@ configure-readline:
+ 	  $$s/$$module_srcdir/configure \
+ 	  --srcdir=$${topdir}/$$module_srcdir \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+-	  --target=${target_alias}  \
++	  --target=${target_alias} --enable-static \
+ 	  || exit 1
+ @endif readline
+ 
-- 
2.7.0


