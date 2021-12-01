Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E12C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344623"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918884"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/14] glibc: Fix i586/c3 support
Date: Wed,  1 Dec 2021 15:16:09 +0800
Message-Id: 
 <59497e4fcef97987beb0057fe6a7dd1332ed20aa.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159012

From: Richard Purdie <richard.purdie@linuxfoundation.org>

CET can't be enabled on i586 or c3 for x86, adjust the configuration accordingly
to fix those builds.

[YOCTO #14632]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26e4fed594daefb6923c50171360f925c4822683)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index ad5e2b8eb1..a1e9eb3a16 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -88,7 +88,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
-EXTRA_OECONF_append_x86 = " --enable-cet"
+EXTRA_OECONF_append_x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"
 EXTRA_OECONF_append_x86-64 = " --enable-cet"
 
 PACKAGECONFIG ??= "nscd"
-- 
2.33.1


