Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB2CC433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:19:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.5718.1640909973598930358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BXUK9UJv;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640909978; x=1672445978;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ejy0u3NGPY1zopuFORT4xBhf3UXrTzGfDq5VwJMNQwA=;
  b=BXUK9UJvyGPe7nYNQA+D2JnOHSJ7NKBBBE2oBlT0B8WjqjfG7rC34qZL
   87qoHoAltLTt2Xd2GwEQgPENL+ZjA+Sif55c7qk8BWRB1EUWcAUwDfAmo
   inH5m6jnSKGfN7ByewGMWhqrl2OqSvBA54oKJb5hYXpeHA2EHjAmKaO1o
   cEEU+YyubNBTrltDObwP7r2+KUh8q6ir0jaZPX679rXGLC4O0KqNbXEll
   wz1V/Idgcl5SVh1r23eMkNarQNWILrVzaoc5vCeJ7nleHG9+QfuRa1ZNI
   e0g1n+DkgHmrEPWzBV7Icu4nua/X/HJgvrUJKYuj7Z8O++PHg12cZpjbD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573108"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502305"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/11] oeqa/selftest/bbtests: Use YP sources mirror
 instead of GNU
Date: Fri, 31 Dec 2021 08:19:17 +0800
Message-Id: 
 <fb18fcbd2529555ab98297671e3e6f68a8fd6556.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160072

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The gnu sources server has been known to disappear. Use the YP sources
mirror instead. If that breaks, the autobuilder is broken anyway. This
should reduce test failures from upstream network issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5459e42f1a6be9c08f303653cc1f73514eca9ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 9cd14aca4b..31962b92d7 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -163,7 +163,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
+        data = 'SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-- 
2.33.1


