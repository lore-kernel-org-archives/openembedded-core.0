Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id E95717391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 08:16:46 +0000 (UTC)
Received: by padck2 with SMTP id ck2so20081600pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uVN5eSZpH5nsaiq+5q8wbJacv5gseZh0jxpmS3k9Wp0=;
	b=sP/KegT68mJPL92WSxK3KBfM5BJmv19atisYFbDnF4lyYiyLQMvC995KzEwUa9Txux
	y3qk5oLhiBz0UA+j/AIoTWOVl0XTFkXA9z0/ACeykCPeSpZWxw3ztTpzXMYiQmtWj5JC
	tUHi5dwMr2s2K0kf/RtRCcQ3iuR8im4A+0af42R20AC2U1epDILT3JK7gOdR54zJPK+X
	BJ16UqS3IQBoNLjuTXTj6qrZ/9op1ToXjB3+6eOz7nGBBz62Z7vedOxs6DCJVktAI27O
	7BRmaxwJaoDvfFdG5z7USH0n9gaefNdgSoBC2j900MZh6Ak8XZV6LQsyhIRPN5c4BDTV
	t87Q==
X-Received: by 10.66.142.199 with SMTP id ry7mr5810957pab.14.1436948207307;
	Wed, 15 Jul 2015 01:16:47 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	gi6sm3712601pbd.69.2015.07.15.01.16.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 01:16:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 01:16:39 -0700
Message-Id: <1436948199-11071-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bash_3.2.48: dont include target CFLAGS in host LDFLAGS
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
X-List-Received-Date: Wed, 15 Jul 2015 08:16:49 -0000

Building the host tool 'mkbuiltins' will fail if the target CFLAGS
contains an option which isn't supported by the host's gcc. To prevent
the issue, define LDFLAGS_FOR_BUILD based on CFLAGS_FOR_BUILD instead
of CFLAGS.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...ont-include-target-CFLAGS-in-host-LDFLAGS.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch b/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
new file mode 100644
index 0000000..ee756dc
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
@@ -0,0 +1,33 @@
+From 933bd886af49667e88e2385409449ab598813dab Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 15 Jul 2015 00:54:33 -0700
+Subject: [PATCH] dont include target CFLAGS in host LDFLAGS
+
+Building the host tool 'mkbuiltins' will fail if the target CFLAGS
+contains an option which isn't supported by the host's gcc. To prevent
+the issue, define LDFLAGS_FOR_BUILD based on CFLAGS_FOR_BUILD instead
+of CFLAGS.
+
+Upstream-Status: Inappropriate [required for bash 3.2.57 (GPLv2) recipe only]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ builtins/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builtins/Makefile.in b/builtins/Makefile.in
+index e027f7a..ebfddf3 100644
+--- a/builtins/Makefile.in
++++ b/builtins/Makefile.in
+@@ -63,7 +63,7 @@ LOCAL_DEFS = @LOCAL_DEFS@
+ 
+ LIBS = @LIBS@
+ LDFLAGS = @LDFLAGS@ $(LOCAL_LDFLAGS) $(CFLAGS)
+-LDFLAGS_FOR_BUILD = $(LDFLAGS)
++LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@ $(LOCAL_LDFLAGS) $(CFLAGS_FOR_BUILD)
+ LOCAL_LDFLAGS = @LOCAL_LDFLAGS@
+ #LIBS_FOR_BUILD = @LIBS_FOR_BUILD@
+ LIBS_FOR_BUILD = $(LIBS)
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 34272d1..d42b292 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://run-ptest \
+           file://dont-include-target-CFLAGS-in-host-LDFLAGS.patch \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-- 
1.9.1


