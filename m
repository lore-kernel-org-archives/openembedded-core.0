Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id 8A59A74998
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2242; q=dns/txt; s=iport;
	t=1522776258; x=1523985858;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=wZFLZHTnZeNK0kAU+BNJayfrit59KnU1+CuG+kQf66I=;
	b=iubql3gnmN/uqCtROIw57BSr8jmgYRv9/mVgpuoqMwwNCt9XX6gD/5nl
	qYZ/xN4kZAKtVyscFSZZGIzrlKI1YcWZAlzPAir/Txr95yB0uCa6QgkEq
	k6JAv6fS4gaBgf3xHBdh0MZqpQl7ietsnYBrUYHSxGmfgC56OauVSNiAX A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AZAgBQuMNa/4cNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8omGODA4sSiT0LG4RoAoRCITgUAQIBAQEBAQECayi?=
	=?us-ascii?q?FIwZ5EFFXGYUNr0+IRIIlh2GCE4NchW+FCAKHIoUximgIhVKIXQKBaIpNj1Y?=
	=?us-ascii?q?CERMBgSUzIYFSTSMVgn0JkGQfMI49AQE?=
X-IronPort-AV: E=Sophos;i="5.48,402,1517875200"; d="scan'208";a="377260848"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:23:53 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w33HNck2010603
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 17:23:52 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 10:23:34 -0700
Message-Id: <1522776217-23250-3-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
References: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2 2/5] Revert "systemtap: Cross compilation fix"
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
X-List-Received-Date: Tue, 03 Apr 2018 17:24:16 -0000

This reverts commit 787bed708676fc04aee2850825e803273152f657.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 .../systemtap/systemtap/system_map_location.patch  | 23 ----------------------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 -
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
deleted file mode 100644
index 013af5c..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-systemtap: Cross compilation fix
-
-This is a cross compilation fix. It allows systemtap to find
-the kernel map file in the right place, i.e. in the kernel build tree.
-Without this fix it takes a map file from the build host, if available.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
-
-Index: git/session.cxx
-===================================================================
---- git.orig/session.cxx
-+++ git/session.cxx
-@@ -1634,7 +1634,7 @@ systemtap_session::parse_kernel_function
- 	clog << _F("Kernel symbol table %s unavailable, (%s)",
- 		   system_map_path.c_str(), strerror(errno)) << endl;
- 
--      system_map_path = "/boot/System.map-" + kernel_release;
-+      system_map_path = kernel_build_tree + "/System.map-" + kernel_release;
-       system_map.clear();
-       system_map.open(system_map_path.c_str(), ifstream::in);
-       if (! system_map.is_open())
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f51bd28..af5b004 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -4,7 +4,6 @@ SRCREV = "4051c70c9318c837981384cbb23f3e9eb1bd0892"
 PV = "3.2"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-           file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
            file://x32_abi_time.patch \
            file://monitor-option.patch \
-- 
2.7.4


