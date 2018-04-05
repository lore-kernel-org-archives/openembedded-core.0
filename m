Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7CC74C5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2242; q=dns/txt; s=iport;
	t=1522952742; x=1524162342;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=33bCibs251DhTwCR/r+oasZFLczgmqrT/DMkhN399xc=;
	b=Li4SYfoBZZoVLqatZixLEUzrrFEBx7BuI1ggxs25sY52NPOMEwlKfk7Q
	hdbnBO44B9GrbGfRDFMGITY4UcazDACPR28B7bkVjtiuI+PwTgbBIFquG
	kGZh1Rhq7YAQkq21JA5dJh/O8VO8/LmIDsrNwZXVK68z9qFP3A/nhg5li w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHAABYacZa/5tdJa1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8oi1+NCYMDixKHQ4F6CxuEaAKCPiE0GAECAQEBAQE?=
	=?us-ascii?q?BAmwcDIUjBnkQUVcZhQ2uXIhDgiWHaoITg1yFb4UIAoclhTGKagiFU4heAoF?=
	=?us-ascii?q?qilGPXAIREwGBJRw4gVJNIxWCfQmLB4VeHzCNGwEB?=
X-IronPort-AV: E=Sophos;i="5.48,411,1517875200"; d="scan'208";a="376983089"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 18:25:41 +0000
Received: from kamensky-w541.cisco.com ([10.24.32.120]) (authenticated bits=0)
	by rcdn-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w35IPUvj013347
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Thu, 5 Apr 2018 18:25:41 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 11:25:27 -0700
Message-Id: <1522952730-5967-3-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v3 2/5] Revert "systemtap: Cross compilation fix"
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
X-List-Received-Date: Thu, 05 Apr 2018 18:25:40 -0000

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
index 4d887ed..eef0c9c 100644
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


