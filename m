Return-Path: <lpapp@archlinux.us>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id D689A6E88D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 11:19:30 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id e4so451296wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 03:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=MNRDJLBdPY8wvPActeD+L3sBQqPhFjNz3G+ZxgU5vbk=;
	b=Y1EPhg091eq3hXOtfUp4yUyNi7uIPuHHjh5XSv0223+exX1tOqle4QvVO2wT/K5pfh
	GuLlzoxPL+seE2btxLui1PSBR72bk9Z1fomaXg6izKGXiVLClXzwntuUfK1EdKNzbEEU
	qBYl7lE1NDzyat+lJFViD04KC+fYvIsXp7JWAjNch/gU/yGUhfUPl+BiA6iMBJIIgFnV
	1JZl/nZDQSiiTJR/PaZQtL0tyZ/s+FUlZYruobdHG74hfgPLbw46UfEbjcLjc65yOd8z
	7dNVfrGqXLS27UIW4y95DXwWFtMOIsXvU+Y2FEkmYMlwxSM84pGn+0A9jRACxYXGK3XO
	7HNA==
X-Gm-Message-State: ALoCoQmptOV3fRPADHM4gIezdgJerkLQlfA25zZ4pUsiG1EKx67vm2IoMGIR7583Bh6SdyVGzlVP
X-Received: by 10.180.207.10 with SMTP id ls10mr16655396wic.4.1391599170782;
	Wed, 05 Feb 2014 03:19:30 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id eo4sm44829034wib.9.2014.02.05.03.19.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 03:19:29 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Wed, 05 Feb 2014 11:13:56 +0000
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 11:13:55 +0000
Message-Id: <1391598835-1631-1-git-send-email-lpapp@kde.org>
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
X-List-Received-Date: Wed, 05 Feb 2014 11:19:31 -0000

The current change contains two different logics resulting that users like me
may need to partially override the behavior of it. It would be easier for end
users to keep one change while dropping the other if needed, like in our case.

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-core/base-passwd/base-passwd/nobash.patch | 10 +---------
 .../base-passwd/base-passwd/noshadow.patch             | 18 ++++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb    |  1 +
 3 files changed, 20 insertions(+), 9 deletions(-)
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
index 0000000..14e3959
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
@@ -0,0 +1,18 @@
+comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
+
+remove "*" for root since we don't have a /etc/shadow so far.
+
+by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
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


