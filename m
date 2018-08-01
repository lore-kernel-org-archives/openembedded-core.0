Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50FF778D41
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 05:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w715Lai4021256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:21:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 22:21:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 13:25:35 +0800
Message-ID: <44c96af07f5e3e99afb74b3513dec022cd3976c1.1533101098.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533101098.git.Qi.Chen@windriver.com>
References: <cover.1533101098.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base-files: fix handling of resize
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
X-List-Received-Date: Wed, 01 Aug 2018 05:21:36 -0000
Content-Type: text/plain

The current handling of resize is incorrect. Using `resize > /dev/null
2>&1 && resize > /dev/null' will cause the second resize command to not
execute because 'resize > /dev/null 2>&1' will fail for resize utility
from busybox.

What we really should do is just to check whether ${bindir}/resize
is executable and execute it if so. Using '-x' is sufficient.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files/profile   | 6 +-----
 meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index e14cb2d..9e4283e 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -24,11 +24,7 @@ fi
 # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
 # use ssh
 case $(tty 2>/dev/null) in
-	# The first invocation of resize verifies that it exists, the second
-	# does the actual resizing. This is due to that resize uses stderr to
-	# determine the size of the tty, which does not work if it is redirected
-	# to /dev/null.
-	/dev/tty[A-z]*) resize >/dev/null 2>&1 && resize >/dev/null;;
+	/dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
 esac
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1c0863b..05c0562 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -121,6 +121,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
 	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
+        sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
 	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
 	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-- 
1.9.1


