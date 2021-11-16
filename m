Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F3CC43219
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649327"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567024063"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/14] llvm: bump HASHEQUIV_HASH_VERSION
Date: Tue, 16 Nov 2021 11:24:20 +0800
Message-Id: 
 <2fd327ae5b3da8841ebed00bfc60b7bb8d6a64c5.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158337

llvm embeds the repository location in a header file. We just changed
the SRC_URI to fetch using https instead of git. This has started giving
errors in reproducibility testing when one of the RPMs to be compared is
fetched from sstate.

Bump HASHEQUIV_HASH_VERSION and PR so its rebuilt.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 3f53b477dd..58cdaaa5a9 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -37,6 +37,10 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0001-nfc-Fix-missing-include.patch;striplevel=2 \
            "
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git/llvm"
-- 
2.33.1


