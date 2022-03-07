Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE56C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:07 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=f7cf01FA;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662446; x=1678198446;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MkltPpzkb+DQwgc2lWjQWi8a0S8LbDfT8wtrcm5NIMo=;
  b=f7cf01FA+ehl2MemPPOXgajJTEftiAUWeTzaSrSNXsbgXDe96mvYbGoV
   1TO4dWfKWwNhjn79c3APEkP32rHH8uH6rj8F49Xbf7C/3naumgqToR0xZ
   vEgxvS/PX3R+9msi2ggnkvsfFEtByMgGHFfdXg1jRyBq54sQMCF+31R5a
   CFoFrNx+/ZVJKwQEwM6WRUX9ivvkGuKPv7bL7YJd8OXvCca9Po5uS4ZoK
   aoHelLxBnoiw4AKXdirY9haaBd1WBbBHkMUSkgLXEKVCMASnUxwbkt0I9
   v6lu7zwRxV7qa/ynP3TMdaStjmByIJoXQfWxjOXfCQskf91n7JmTdCJ8V
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112570"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070889"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/25] quilt: Disable external sendmail for
 deterministic build
Date: Mon,  7 Mar 2022 22:09:53 +0800
Message-Id: 
 <852245ea93e4b5a6847f25475960382e8be69dd7.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162838

From: Robert Yang <liezhi.yang@windriver.com>

Otherwise, the build results would be different w/o host's /usr/sbin/sendmail:
1) The /usr/share/quilt/compat/sendmail will be genrated if no
   /usr/sbin/sendmail on host
2) No /usr/share/quilt/compat/sendmail if host's has /usr/sbin/sendmail

Use --without-sendmail to make it always generate /usr/share/quilt/compat/sendmail.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f9320816ac9f9ec8815754d1951cecb58612f70)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index f85de384d2..4a725cb327 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -26,8 +26,9 @@ PATCHTOOL:class-native = "patch"
 
 CLEANBROKEN = "1"
 
-EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
+EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch --without-sendmail"
 EXTRA_OECONF:append:class-native = " --disable-nls"
+
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash ac_cv_path_COLUMN=column"
-- 
2.35.1


