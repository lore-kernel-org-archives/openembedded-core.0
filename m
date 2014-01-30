Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B4F146E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 18:47:08 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so6951257wgg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 10:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Q9rhWlVkr/TInDX/PGZvRMLzTaa5sX7GqujHvr4ZVmw=;
	b=EaXOqUGO73WbgAFy0wa9I2gUNUpKXx/Ieg86uc5upPQ0W05uwjgnl2tQIu40ZrujTY
	ccC4N7zxDc6IW+LQTVZClJQS2E0ETgWyYlsB0vdAashIg/aY6CtBsaT01BnS+MurA+qM
	A6WhXlR9f/+ORp6PfFSY6IxhNyOxSJ49wibyNK0MHqV6h5OmUmSeTxaiYPdP6RTonxmV
	FcyRrFgPZlrrFh8lqbmSZtelzu8IfXqDMb0sDaOPaPLsX5XDYHagOpm2B7FRBVJfbfon
	Oo1cq/7AvcPdlqlCQoq86NiPpFjScHqMZkldto6NoRi5R6xhgtrwWeycA15OlfavWYH2
	LVEw==
X-Gm-Message-State: ALoCoQlauh5dIJ0O0sCRdMbUBnhRrcCbBdgmArxtmsOav3Cm/euEJLjEQUvdITYUN925CA+mi7sl
X-Received: by 10.194.185.113 with SMTP id fb17mr8079830wjc.29.1391107629274; 
	Thu, 30 Jan 2014 10:47:09 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id
	ha1sm11212749wjc.23.2014.01.30.10.47.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 10:47:08 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Thu, 30 Jan 2014 18:41:42 +0000
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2014 18:41:35 +0000
Message-Id: <1391107295-15256-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Thu, 30 Jan 2014 18:47:09 -0000

The current change contains two different logics resulting that users like me
may need to partially override the behavior of it. It would be easier for end
users to keep one change while dropping the other if needed, like in our case.

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-core/base-passwd/base-passwd/nobash.patch   | 10 +---------
 meta/recipes-core/base-passwd/base-passwd/noshadow.patch | 14 ++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb      |  1 +
 3 files changed, 16 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/noshadow.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
index 6371576..eed87db 100644
--- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
@@ -1,14 +1,6 @@
 use /bin/sh instead of /bin/bash, since the latter may not be included in
 some images such as minimal
 
-comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-remove "*" for root since we don't have a /etc/shadow so far.
-
-by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-
 Upstream-Status: Invalid [configuration]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
@@ -17,7 +9,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 +++ base-passwd/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/bash
-+root::0:0:root:/root:/bin/sh
++root:*:0:0:root:/root:/bin/sh
  daemon:*:1:1:daemon:/usr/sbin:/bin/sh
  bin:*:2:2:bin:/bin:/bin/sh
  sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
new file mode 100644
index 0000000..e1cded6
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
@@ -0,0 +1,14 @@
+remove "*" for root since we don't have a /etc/shadow so far.
+
+Upstream-Status: Invalid [configuration]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+--- base-passwd/passwd.master~nobash
++++ base-passwd/passwd.master
+@@ -1,4 +1,4 @@
+-root:*:0:0:root:/root:/bin/sh
++root::0:0:root:/root:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+ bin:*:2:2:bin:/bin:/bin/sh
+ sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 082037a..5b31fce 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -9,6 +9,7 @@ DEPENDS = "docbook-utils-native linuxdoc-tools-native"
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://add_shutdown.patch \
            file://nobash.patch \
+           file://noshadow.patch \
            file://input.patch \
            file://disable-docs.patch \
           "
-- 
1.8.5.3


