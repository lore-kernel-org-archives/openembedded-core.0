Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7433DC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456815"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456815"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617188"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/36] python3: Add a fix for a make install race
Date: Wed, 27 Oct 2021 23:16:27 +0800
Message-Id: 
 <94aedf7d2b43ecdf0da1cf6b848f6e95ee253abf.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157535

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a fix for reproducibility issues where pyc files for python-config.py
may not always be generated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1c3a87c48b598b6e5624d0affe8bd89320631bf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3/makerace.patch             | 23 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.5.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/makerace.patch

diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
new file mode 100644
index 0000000000..96744cb557
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -0,0 +1,23 @@
+libainstall installs python-config.py but the .pyc cache files are generated
+by the libinstall target. This means some builds may not generate the pyc files
+for python-config.py depending on the order things happen in. This means builds
+are not always reproducible.
+
+Add a dependency to avoid the race.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: Python-3.9.6/Makefile.pre.in
+===================================================================
+--- Python-3.9.6.orig/Makefile.pre.in
++++ Python-3.9.6/Makefile.pre.in
+@@ -1486,7 +1486,7 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		curses pydoc_data \
+ 		zoneinfo
+-libinstall:	build_all $(srcdir)/Modules/xxmodule.c
++libinstall:	build_all $(srcdir)/Modules/xxmodule.c libainstall
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
index 82177f4a18..2b05bd530e 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
+           file://makerace.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.31.1


