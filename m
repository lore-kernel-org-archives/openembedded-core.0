Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id D290C77BAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1057; q=dns/txt; s=iport;
	t=1490727762; x=1491937362;
	h=from:to:cc:subject:date:message-id;
	bh=4xMZii+QDly30kccwq+C5QIXqi6N/YSaJgcSfjciiGw=;
	b=MWBWo1uDQW9XdaApFxk9IYL4NRbCh+nn4gDvn4fuGDzbKuvfNkKwwrFS
	Swtd/0fFArhp3zC+FONzIXxO41xP/+j6cE+8QR3hHjOYCYVLnSBov5g40
	DIw7rDSr0YpoOkCgckR4LUwXVcepHfUtmjKgcoIwbyNleTUXVopo5Tn+9 s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B2AQAPstpY/4sNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBgykrYYELjXGRMZNcgg+CDiaFfIMlPxgBAgEBAQEBAQFrKEIOhRc?=
	=?us-ascii?q?BKAWBUYl6Da9whA4Bhj0BAQgoE4Y7gg2IAoUZBZxghnyDKwWII5Ezk2ofOIEEO?=
	=?us-ascii?q?h8VhU+BSkA1AYNwhWEBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="404138940"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 19:02:41 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-6.cisco.com (8.14.5/8.14.5) with ESMTP id v2SJ2foD025263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 19:02:41 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 19:02:38 +0000
Message-Id: <ecff400f0583e4752602d00e88f641a2eee39b3b.1490727692.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH] perl-native: Bring build dependencies inline with target perl package
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
X-List-Received-Date: Tue, 28 Mar 2017 19:02:41 -0000

Make sure we have all build time dependencies of perl-native
satisfied before we start building it.

Behaviour was observed with RHEL6 build hosts where perl-native
build fails at linging stage when attempting to link to the build
hosts old Berkley DB because virtual/db-native is missing in
native sysroot.

Add dependencies to the native packages taken from perl recipe.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
index 896a379..e01d11f 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -1,5 +1,9 @@
 require perl.inc
 
+# We need gnugrep (for -I)
+DEPENDS = "virtual/db-native grep-native"
+DEPENDS += "gdbm-native zlib-native"
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 SRC_URI += "\
-- 
2.7.4


