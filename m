Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 263FF71A8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAN7nTWv022796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:49:29 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 23:49:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 23:49:26 -0800
Message-ID: <e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479871728.git.liezhi.yang@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Wed, 23 Nov 2016 07:49:29 -0000
Content-Type: text/plain

[YOCTO #10710]

Otherwise, we can't login as root when debug-tweaks is not in
IMAGE_FEATURES, and there is no other users to login by default, so
there is no way to login.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../base-passwd/base-passwd/passwd_master.patch          | 16 ++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb      |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/passwd_master.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/passwd_master.patch b/meta/recipes-core/base-passwd/base-passwd/passwd_master.patch
new file mode 100644
index 0000000..909c2a4
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/passwd_master.patch
@@ -0,0 +1,16 @@
+Set root's default password to 'root'
+
+Upstream-Status: Inappropriate [OE config specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/passwd.master b/passwd.master
+index 82df9e5..c29e76d 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,4 +1,4 @@
+-root::0:0:root:/root:/bin/sh
++root:6UZSjeWUui3JQ:0:0:root:/root:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+ bin:*:2:2:bin:/bin:/bin/sh
+ sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 10457b2..a3477a1 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://noshadow.patch \
            file://input.patch \
            file://disable-docs.patch \
+           file://passwd_master.patch \
           "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
-- 
2.10.2


