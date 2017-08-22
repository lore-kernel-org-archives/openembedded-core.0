Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 607 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Aug 2017 11:16:51 UTC
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8109278212
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1586; q=dns/txt; s=iport;
	t=1503400613; x=1504610213; h=from:to:subject:date:message-id;
	bh=w2Z0avlWvURXVcR3JFmMbeDRzjxpR717LGj7qK3J4ZA=;
	b=mY9Fer/1WMndX7AkUqoW/eIUSGubP1+PWaVqnxUuws/rhxpwFTwEYWVe
	+a7jkaD7oaFGut1ep5EwFaTpnQZvdezJGgz93xzElb31CJgNoVAh/vqjW
	6p/pKxNgxwv3BHlbKONERXVaUkfIOllbRocKg5JwXa03fxtCGYiDuFo42 k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C4AAAcD5xZ/xbLJq1cGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBhVOOE3SnMYISiicYAQIBAQEBAQEBayiHaYoxr1qMEYMqg06KSYUoBZI?=
	=?us-ascii?q?ljjCUQwKSXAJIlWEfOIEKMiEIHBWFEAGCVT02ixUBAQE?=
X-IronPort-AV: E=Sophos;i="5.41,411,1498521600"; d="scan'208";a="655135027"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 11:06:42 +0000
Received: from localhost (dhcp-10-61-102-176.cisco.com [10.61.102.176])
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id v7MB6fRO032315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 11:06:42 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 14:06:40 +0300
Message-Id: <1503400000-25414-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] machine-sdk: oldest kernel for x86/x86_64 is 3.2.0 now
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
X-List-Received-Date: Tue, 22 Aug 2017 11:16:51 -0000

With glibc upgrade to 2.26 release (commit d6a0bc57fa07
"glibc: Upgrade to 2.26 final release") it's not possible
to build x86/x86_64 SDK for kernels lower than 3.2.0
(see glibc commit 139ace95756a "Require Linux kernel 3.2
or later on x86 / x86_64.")

Thus drop SDK_OLDEST_KERNEL overrides from machine-specific
conf files, so default version 3.2.0 from conf/bitbake.conf
will be picked up.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/conf/machine-sdk/i586.conf   | 1 -
 meta/conf/machine-sdk/i686.conf   | 1 -
 meta/conf/machine-sdk/x86_64.conf | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
index 99083fb..41e5e15 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -1,5 +1,4 @@
 SDK_ARCH = "i586"
 SDK_CC_ARCH = "-march=i586"
 ABIEXTENSION_class-nativesdk = ""
-SDK_OLDEST_KERNEL = "2.6.32"
 
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
index cf22784..fe40697 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,4 +1,3 @@
 SDK_ARCH = "i686"
 SDK_CC_ARCH = "-march=i686"
 ABIEXTENSION_class-nativesdk = ""
-SDK_OLDEST_KERNEL = "2.6.32"
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index 7d2e717..61439b4 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1,3 +1,2 @@
 SDK_ARCH = "x86_64"
 ABIEXTENSION_class-nativesdk = ""
-SDK_OLDEST_KERNEL = "2.6.32"
-- 
1.9.1


