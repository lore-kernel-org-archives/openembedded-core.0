Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 02FAB71AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:51:36 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id a124so70764497ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MFCIMBVbCzd3NcKcglWhhH1FJgvjNI5iXcwbsXa8YIY=;
	b=G1oWXapbDXYMeYQQmcGrz5IkC4Xqj08oms9L8cl95BH4h5RvE6nvzv0R9fdzCGIq4a
	6d7TTWEi5hwPILXV2v6DlqhJRDnT+UoZ8pSnTXWLjy1vBlhQ+wanMq1ggyWBUHf+eujz
	zjngSi1k52h7znRShsWcPk0E82YzNT+9ivYPuPUm4x34PG+TSlLa6nChSqA/Wg1QpHL+
	7OS1tkAR+whMmWIrsAnmN6reHKmyX2YFUlew39FWw3FO/ELytpT6scZ1b9tgutlgZJpl
	38NyFiepGpUbMX6oHfRjRwIWcMK803oVW1ujEP4ocOLzU82Svabi0KhTtitwTHxipF9F
	8mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MFCIMBVbCzd3NcKcglWhhH1FJgvjNI5iXcwbsXa8YIY=;
	b=Asu8Rc8764zRLv5DhLc5rUXLklm3dZK8c7p9jLjSUkhtQ9sZ8MQ2Jo+KKW3LocThKX
	nqScBj3b2rBrZ1MQNnnIetic04lHDRslB+8DcE+ZeKPh7OhpU1OcEWkmuOzTMlyl0Jdc
	iKJ21PEd8ZmgtQpL0i/3wHlNCLVE9kSpRYTOYt956nBgLVzqqNws4X5RvJqqBrInond3
	dxwkP+zoMyWNI3473UIFbGqWWFkR3m3Cz7SgU2hqopNLHGZrT1dqVYkeHoECbuArhfVh
	9ceZ9BtO83Hc5rgoh7Bple9jsJXk2vtU1arnSJxP0B6sYFSRP6Zr5lTT+mOBPGFIigN7
	GMvQ==
X-Gm-Message-State: AKaTC00s4yLZiWUt3Tyz9oslKrYvEVRrupEf+CPgNRuOFYv7hWdX9y0Z1LWfE+UYQIEMRapq
X-Received: by 10.107.131.195 with SMTP id n64mr1266372ioi.161.1479981098294; 
	Thu, 24 Nov 2016 01:51:38 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	w143sm2490789itc.0.2016.11.24.01.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 01:51:37 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 10:51:29 +0100
Message-Id: <1479981089-2181-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pseudo: include fix for xattr corruption
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
X-List-Received-Date: Thu, 24 Nov 2016 09:51:37 -0000

pseudo_1.8.1.bb gets the backported patch and pseudo_git.bb gets
updated to include the commit, which currently is the most recent
commit on the pseudo master branch.

There's just one problem - it breaks other cases:

foo: security.SMACK64: No such attribute

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../pseudo/files/More-correctly-fix-xattrs.patch   | 37 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch

diff --git a/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch b/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
new file mode 100644
index 0000000..3d178f9
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
@@ -0,0 +1,37 @@
+From 45eca34c754d416a38bee90fb2d3c110a0b6cc5f Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Thu, 3 Nov 2016 11:36:12 -0500
+Subject: [PATCH] More-correctly fix xattrs
+
+Fix provided by Patrick Ohly <patrick.ohly@intel.com>. This resolves
+the actual cause of the path length mismatches, and explains why
+I couldn't quite explain why the previous one had only sometimes
+worked, also why it showed up on directories but not plain files.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Fixes [YOCTO #10623]
+
+Upstream-Status: Backport [commit 45eca34c754d416a38bee90fb2d3c110a0b6cc5f]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ pseudo_client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 6a08df3..b1a00fa 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1676,7 +1676,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 	 * empty path for that.
+ 	 */
+ 	if (path_extra_1) {
+-		size_t full_len = path_extra_1len + 1 + pathlen;
++		size_t full_len = path_extra_1len + 1 + pathlen - strip_slash;
+ 		size_t partial_len = pathlen - 1 - strip_slash;
+ 		if (path_extra_2) {
+ 			full_len += path_extra_2len + 1;
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index fb70034..90b53c0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch \
            file://0002-Use-correct-file-descriptor.patch \
            file://0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch \
+           file://More-correctly-fix-xattrs.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8110b1a..ac923bb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRCREV = "befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae"
+SRCREV = "45eca34c754d416a38bee90fb2d3c110a0b6cc5f"
 PV = "1.8.1+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.1.4


