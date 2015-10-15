Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB77770AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:57 +0000 (UTC)
Received: by payp3 with SMTP id p3so22770618pay.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0h61tZoG1TDgF0gQbkifKuABus1V2UNXhEMh6bXZZDQ=;
	b=yUrHnXTOE0u4miHa33MestuYCStCAS5i3bxghP5ozCRkIGsdCepOtBnYclJIjub7t6
	5ySslaggUlvweu2RYjCNwR3oVIVw/mWepNY0f+ycRqw87drFdZWd77WT5DHGgWsyseLQ
	N20FP6KIxJyx5LVTQ0BEKVt/xkbRVnI4uTFnngfkWy+aO7OKF/mjd69rvD/0JV/IA25a
	KArxU36yYW7OPCXqaXKewlgWqpfcpp6tMkntHIYQZv3p1o2XhZKQtY2AsI5at6z3kpWC
	s2nV1hGvj+nXXGe9gZ2DDeO3qOUVCEd2vQZ+HoAgrhQjLPTZSwFqwltX96W9zULyyEzy
	dBGw==
X-Received: by 10.67.24.97 with SMTP id ih1mr7089803pad.13.1444873438196;
	Wed, 14 Oct 2015 18:43:58 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:20 -0700
Message-Id: <1444873403-21093-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 08/11] busybox: move common do_install_ptest() into busybox.inc
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:58 -0000

Current do_install_ptest() is common to all supported versions of
busybox (1.23.2 and git), so move from version specific recipes into
busybox.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 6 ++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb | 6 ------
 meta/recipes-core/busybox/busybox_git.bb    | 6 ------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 878e2bb..e0e4591 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -304,6 +304,12 @@ do_install () {
     fi
 }
 
+do_install_ptest () {
+        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        cp ${B}/.config      ${D}${PTEST_PATH}/
+        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 554c816..e9f7eb6 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -43,9 +43,3 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
 SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
-
-do_install_ptest () {
-        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
-        cp ${B}/.config      ${D}${PTEST_PATH}/
-        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-}
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 17de8ac..e9ff0bc 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -44,10 +44,4 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://getopts.cfg \
 "
 
-do_install_ptest () {
-        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
-        cp ${B}/.config      ${D}${PTEST_PATH}/
-        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-}
-
 DEFAULT_PREFERENCE = "-1"
-- 
1.9.1


