Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0D88D72DF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:10 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so10805762pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TrPehzPR63s+lUpfiISsIMxb7R2aHJ2EPWE9Xe1qtgw=;
	b=DK3AT3orTdUsS6rsuTUDzINjf6MxUtngVk0fRaq/xQ10L14JuTzuYRlV868AznBtEH
	UeuQvwCfMdxa2MbgJr5yHIa+CaKsMFLGrVMg/rTNhG/7OkQirOmLTVk8dC0cv+VDa4D6
	1Z/XH8RQ4CMVIHhZgawWYyoIM8prH6ZX89O1QSbbgkwjwHw+5KpOL+TwM3FdTZqn8e6M
	9ZvnX3XfCQZYBZtEdNVqpJJd6wMNvhXOw/jCF3Dcoagv/9NfRIcYPahLXqFUTg7ZM1Ph
	h8xU8CI2fuZJ2piQ4fHnwkiSSHR80lOJ9yVwmYJvzF6v7RutoN1f5uz9Dnc29Fl3EYwj
	3TtA==
X-Received: by 10.70.140.44 with SMTP id rd12mr6922807pdb.64.1423152311942;
	Thu, 05 Feb 2015 08:05:11 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:37 -0800
Message-Id: <233fd8b18e8e700a453198d98b1e3ba21c0c40c2.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 29/61] neard: fix parallel issue
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:11 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There might be no src dir if the src/builtin.h runs earlier, create it
to fix the race issue:
src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
/bin/sh: src/builtin.h: No such file or directory

(From OE-Core rev: 4b6762b924a561febede13b85330309dbf75da19)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../neard/Makefile.am-fix-parallel-issue.patch     | 33 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch

diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
new file mode 100644
index 0000000..4660676
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
@@ -0,0 +1,33 @@
+From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Jan 2015 18:12:07 -0800
+Subject: [PATCH] Makefile.am: fix parallel issue
+
+There might be no src dir if src/builtin.h runs earlier, create it to
+fix the race issue:
+
+src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
+/bin/sh: src/builtin.h: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3241311..a43eaa2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -164,6 +164,7 @@ MAINTAINERCLEANFILES = Makefile.in \
+ src/plugin.$(OBJEXT): src/builtin.h
+ 
+ src/builtin.h: src/genbuiltin $(builtin_sources)
++	$(AM_V_at)$(MKDIR_P) src
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
+ 
+ $(src_neard_OBJECTS) \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index daf3a4b..2fb47cc 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -4,6 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
            file://parallel-build.patch \
            file://neard.in \
            file://neard.service.in \
+           file://Makefile.am-fix-parallel-issue.patch \
           "
 SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
 SRC_URI[sha256sum] = "6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"
-- 
1.9.1


