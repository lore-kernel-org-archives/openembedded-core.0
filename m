Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62CD473166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 09:20:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K9KAIR015906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:20:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jul 2016 02:20:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2016 17:17:37 +0800
Message-ID: <1d1bf4c0bd1e8e16b683396cfdba1728862b46e2.1469006054.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1469006054.git.kai.kang@windriver.com>
References: <cover.1469006054.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] avahi: fix resource temporarily unavailable issue
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
X-List-Received-Date: Wed, 20 Jul 2016 09:20:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It sometimes fails to run avahi with error: "Could not receive return value
from daemon process". It has same root cause with
https://github.com/lxc/lxc/issues/25.

Backport patch to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.6.32.bb    |  2 ++
 .../files/avahi-fix-resource-unavaiable.patch      | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
index 6670106..bfa6304 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
+SRC_URI += "file://avahi-fix-resource-unavaiable.patch"
+
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
 SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
diff --git a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch b/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
new file mode 100644
index 0000000..5a2fd75
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+
+Backport from:
+https://github.com/experimental-platform/platform-hostname-avahi/pull/9
+
+It sometimes fails to run avahi with error: "Could not receive return value
+from daemon process". It has same root cause with
+https://github.com/lxc/lxc/issues/25.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 5150983102ad5ad43f0dae203cb332c168eb5a71 Mon Sep 17 00:00:00 2001
+From: Hinnerk Haardt <haardt@information-control.de>
+Date: Thu, 17 Dec 2015 11:52:19 +0100
+Subject: [PATCH] Fix `chroot.c: fork() failed: Resource temporarily
+ unavailable` as per https://github.com/lxc/lxc/issues/25.
+
+---
+ avahi-daemon/avahi-daemon.conf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-daemon/avahi-daemon.conf b/avahi-daemon/avahi-daemon.conf
+index 95166f8..3d5b7a6 100644
+--- a/avahi-daemon/avahi-daemon.conf
++++ b/avahi-daemon/avahi-daemon.conf
+@@ -65,4 +65,3 @@ rlimit-data=4194304
+ rlimit-fsize=0
+ rlimit-nofile=768
+ rlimit-stack=4194304
+-rlimit-nproc=3
-- 
2.6.1


