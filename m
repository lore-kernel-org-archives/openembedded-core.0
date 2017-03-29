Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id B87616078E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1160; q=dns/txt; s=iport;
	t=1490810576; x=1492020176;
	h=from:to:cc:subject:date:message-id;
	bh=vaRmk9BeZXw1roByTh/IJCKr2Aw2ds4vRBg48UyeByk=;
	b=X95ZGG80kHPp87LmK5IZS/ByBeSPxi0ALcu+j9OKXUb+tuL2bqEhcP/x
	buXKuZB9LM7rCRYlykP9CoEm+8G5DFoI8KKwEdbSAugK9wKX/8ts+QViX
	nZuyZr7JrdIXselQhjO3e82YBcF/qw2nJrIhhAAaNpWy6s2UN+jigmDpB c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ATAQA89ttY/4wNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1VhgQuNc6UQgg+CDiKGAINFPxgBAgEBAQEBAQFrKIYVgVGJfQ2?=
	=?us-ascii?q?wGIpSAQEBBygThjuKD4UZBZxghn2LUwKBeokBhjaTah84gQQ6HxWHGUA1iTYBA?=
	=?us-ascii?q?QE?=
X-IronPort-AV: E=Sophos;i="5.36,242,1486425600"; d="scan'208";a="400884855"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	29 Mar 2017 18:02:55 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id v2TI2sLe013839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 29 Mar 2017 18:02:54 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 18:02:52 +0000
Message-Id: <1490810572-19648-1-git-send-email-spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH] dnf: Use lnr to create relative symlinks
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
X-List-Received-Date: Wed, 29 Mar 2017 18:02:54 -0000

Make use of lnr while creating relative symlinks to enable
builds on host with old ln that does not support -r option.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/recipes-devtools/dnf/dnf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index b6b6cea..1194928 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -31,8 +31,8 @@ RDEPENDS_${PN}_class-target += "python3-core python3-codecs python3-netclient py
 # .spec file in dnf source tree does (and then Fedora and dnf documentation
 # says that dnf binary is plain 'dnf').
 do_install_append() {
-        ln -s -r ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
-        ln -s -r ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
+        lnr ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
+        lnr ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
 }
 
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
-- 
2.7.4


